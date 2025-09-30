Return-Path: <linux-arm-msm+bounces-75554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D5BAB95A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E024A4E221D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6D1299949;
	Tue, 30 Sep 2025 05:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8t1+gf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287F9299923
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211512; cv=none; b=TPVA/7qUENjm/pnQJ9KnEbVOvh8sWuK35u/aC9UwWEeGr4WZmw6Da5W2pgWaFYxu6uWjoq7whByKPrzIi9mmgp68qsIhOyVUHob7giofc3B4sCbA8xOiLInjuUY2ucHBDZa675LvrYbNSTQfJY1/3gaYXzGqvzYan7C4WC0JVJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211512; c=relaxed/simple;
	bh=opy6bEwniR0m7S+4M/eY23ORBb6vxUsSguJ3ntFDLtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvaocJ3n72sIDCjuRj1fH+SiwzlhgKEQUuLg/gFgZHRqYMPF6kVVsxEHX/Krnh6khsv4qgPy+Nm64BvnP9IK/HZrQy/FO6TYs/opIL65pbeuTNAMuKhj/w/b6tOczqk+obQFni6H74MF0h0tP/y85TIGSzmv4/1ZywWJgoNzU4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8t1+gf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HOXF027370
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGAhTN0/MK7tzTuxs8B6KT3k8TvrrLVML7xGTqGXHy4=; b=F8t1+gf7Zqt6bPeW
	PUh6Z+R8qhw+F3Q6PJBiM1Qzqep492fR6RUsliAjvRSTe2p+DT8EWB4o8IoUfzbX
	ELfcAiG/BIPjRER4lCiiKrn/rvZ5PYhRIhGQZNuLn8R91AcP/cXyGNIgeWNE8dxs
	25tjE7KxvLzfYqxDxtzqOSXShqJx7BFYjQInpIVuDGGdhZoqAf162rHR6fwmzV2N
	tRj7yN6UnO2QXjePepPK4jqNlDisGllvcohoCyJlxYc2YOgHZBmJt6ZQtmItK/vi
	3/CghC8gwf4n209TuaIhRLcy5fBu6e0jYVSxDHpwXQGnoZwZoPnPNhLyTAC6FRht
	WInjUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851fqc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:51:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3352a336ee1so8480847a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 22:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211509; x=1759816309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGAhTN0/MK7tzTuxs8B6KT3k8TvrrLVML7xGTqGXHy4=;
        b=lfKT7h6mj+5A0ITyT66P7/R/rF2366iIT1EN+U0rtP26aMTifxK9+Tbs0hcbq8w5s6
         882ud2lHcnX3oBjYlk78nwf/vc+gwtIHCM2BSD0WygBqkGdRY2s6mZ2cQ5m/+3bwkunF
         b9ofUKE1E6DZuCvBf1OuQqV+DSPmlvRntYXkSJbVXXXHqZhBTnUFbwoA6r5oMx6nJFdf
         0g+Id8SUQJhC3jJXJP8gBU7IDXn52qLm0AxFLbNzLZEZFQZDacRIUpAIFR8Uq5uXuaQg
         Bd9uvoYzt/MrpbgZmh0n1DYuUAV9dW/8u9DF9YofUB0VO+d7uYD3snHpOzvI/dj0pZFG
         5rQg==
X-Gm-Message-State: AOJu0Yy2zrXwOnXovQmNXxrVYFF6xB5PcIWpQgwKz2BDIAgvsxfLvaPW
	Ro9IWcfWY2wmBmM3gV2kL192Ozl8o3wkxDT8+Yc0dGvp3qNP7vPX/bRbYnsK2L26VeMGW0duio8
	0J4Qk7vT+agrKr7WjFvfkaraKS9KVsS+JGXNXxJJjbgR8O5gw2UlQecOXIGSpVd7XhJvv
X-Gm-Gg: ASbGncvBX6H091hZoQEquGCyysn22dca+rKtuxpERzDKLXZ/CRxkZl6i9itbg6KxDYn
	1cD5VHgIjPU24AN4YkpO8QSWZZWdevXvbUd3Qia5bq2/gT1++W1qnXbB2OHX0voMZ83i4rFSpHC
	RnV3RA52pWtKRH51XfUiir4B7hkSo7WMXIbgn6BPzGAhwREYixqEIMa2g1/BOZtcWQ6dQAoX+2c
	7OvHFxrQea1yeQap343NSuYliWMDokzMXDinQP5SFxdwkZjAwZU0Q+0C3sOmys53F22oIGe9kdy
	BU4YAOL5FtIfEJu3QaO5+ImyppiBMHH6kqQlBQlXsIlW3Y8TAdw942dVocNftzpROQbpHQ==
X-Received: by 2002:a17:90b:3147:b0:32e:7bbc:bf13 with SMTP id 98e67ed59e1d1-3342a2e3881mr19323739a91.34.1759211509379;
        Mon, 29 Sep 2025 22:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHqe3cLZLc7xLZaXETZkTNHqotOqlcLKXPv0OIyQKyD1TA/j/7y3gfQe0rZdWjF2vIUaLsA==
X-Received: by 2002:a17:90b:3147:b0:32e:7bbc:bf13 with SMTP id 98e67ed59e1d1-3342a2e3881mr19323711a91.34.1759211508854;
        Mon, 29 Sep 2025 22:51:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:51:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:21 +0530
Subject: [PATCH 16/17] dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-16-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=927;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=opy6bEwniR0m7S+4M/eY23ORBb6vxUsSguJ3ntFDLtY=;
 b=xkyLJDhvdjtv5zH0t4R2/Ltq7yscuVczpTRjglKxHmFMzhfzxDbXmuA1k/vXF8VuGXusE56aM
 ze5RwHw81B/DIw0VoSyDnGDCDBLO1lvaar1+Yi9NLQ4Wmw4MLZC2JXb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db6ff6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-Mh53b5kj-Vf1dIxLVYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX/0xxt1pDNyQy
 F39TgUzocyIgbQ7miDYYUWaVnWg0PAV8UxJT1GDb9n4wXtkE++j63Ozxo/F5qEjhoBfTrBMVqbz
 THvTNIMnW9DmeWv0/mlldgGU5hhil7dFcVEpQD06pMtJJjlnHsmwOKowcNO26vePmI30UOBWNaN
 ItEV/iLeDRTmQkPzVP+UeMiKVYBmXsQSBJoiw4CR/V+5VK6Z8LkGF4xjTntLGMQf7BSaceKpQwj
 UQqQwREt6JnYSkr/5s+J0rqno5lbw/1JkpwrW3sQ5pnq6G17zxe8Va+lkPUIXl3ilx+EJqjvSjT
 GIPTvwNQfxfo+Ty3sY2BlCZaO2pEvQFjn9wDKREPocMG0RtS5QQwVQ9QFR2sRm2mvIu9FtHSlkk
 nWK7X/bOZfdrhOqPEoIKHjVLxD9bTg==
X-Proofpoint-ORIG-GUID: 5V54PsVjzY1ywlSP0xtbB9KZKtyU6j_7
X-Proofpoint-GUID: 5V54PsVjzY1ywlSP0xtbB9KZKtyU6j_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

Update the devicetree bindings to support the gpu smmu present in
the Kaanapali chipset.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..4c68e2f2c6d776d18a2a306ad67718ef7396426a 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -88,6 +88,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,kaanapali-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500

-- 
2.51.0


