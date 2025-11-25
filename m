Return-Path: <linux-arm-msm+bounces-83167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFCC838AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF3B24E8471
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28D32C236B;
	Tue, 25 Nov 2025 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ot6/TizF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3Ac/G9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2C62C21C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053319; cv=none; b=eOdPSNnQCkKKRTtNUpLzhr7ZLaMZoGbKumqIAAAylPrz9y69HLR1UpGC77C7x+IeXBHiXgkdDr7ncYosI4cSDczbPnyk3G1lS7oH62/0L3OESMv9lrnW1BA3baM8CHNfu8QM41EuTYlRGOYVaY9ywtTVKAvVCIjGTemcZD03g0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053319; c=relaxed/simple;
	bh=sJgfyWg3KIDNZCELmEUn2OxJam43v0UktDaButQbQgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RsngYwaUBfK2IEfN2HjA2gPe/lFB67AdsbskswjBRG28tThMf6JuJaxv6SpurWoQhr1WB/DVI8WYmxBFh8GM+WXABOKmE/CTUo9B2G3x3YOj2S3i32ZQMb6x1Irx18CrSkLjv8LqUh1IAeQK/kS1T17lVAGfZMtm6ue0sVtKDqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ot6/TizF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3Ac/G9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gglq1979085
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uka3uTpmYpZ
	zlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=; b=ot6/TizFawuhqCorhRmo/gQyZj6
	VFo7AI9lo/yMIhbdPyB/S+xbkrQrg1giT+G6mEEZCLmmjT4hgvpkoF+qyovlhFAa
	IH518rDNSYr41qi8eJpzaYz0JfCjQEsDO2RoYoKVR3NEvBk72OHMqsP5Wgk06ibr
	A7D91rDIGnLI30PSXji2rBcGo4eB5b5ql3NXiNd4TlWl9DkM24QrEG0HC9ldISAn
	NVEZvp6VZV+dVbZA8Yq3Mao26lE3miXPeNLg1ICjoamPGk2ArZwED65uAzKAk5Uu
	BDqwwbE9DV46QfECcH4pyzHquzUbnLlOg96Yj9i2gN1kLLqlL5G99/1TQ1w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gsjfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8824f62b614so165069186d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053316; x=1764658116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uka3uTpmYpZzlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=;
        b=a3Ac/G9Fd9W6nt6pYb1TJwCaXaBH4PQ47u6HZy0CvoYNFNEA1XN4GVLHpEcieH1xp0
         zT0c4rmZYw/lq25YBXTzQHVTLmFuqmqbEF1pvOYsXiQdNjn1qxABVbc06+z0vsnx65cz
         pTDWiEFl9SMUfgYmBr0RSfjeK+f5rnSg8Rju86ZXuyDWDS+lLvMqNcVY0VqeNdYoSKaP
         C4Ukf6P+zc5i7jx63uX7bqFtLI+wD4MLHkWEbF+x8/LV+Pyfcg1G6lPmXrJQ20NQtw8U
         ZSwklACSL1U9Wcurt+2QLXHH7XfzuCWQrnj6Av3xWiX6v+/QvQIe/h26cqIXsih3EFkF
         b45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053316; x=1764658116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uka3uTpmYpZzlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=;
        b=NZ5hyQK3EjzhM3d1p9sFV5ktx2CW+3xex8Pocbp20MbUcq/qFlBRXFZtJtlj4R5ehW
         n5CtREKEw/arLO8GG0Gpj8nXrGD/O8CRkgLmQvj+PSt7Y7YbLL3PTGQONwtJkYB0Bqc5
         7ffYEkYfMURSW+Zj+jIfg7yY5m0RTS7cbbafOgBSHpml8qS9w1O7qQjiuB9gOCIai96X
         KnOKajHoIrZGGTtMkl/CkgnYUDumno1f8QimH27TfI6xTm0B2RNG9klfjZpvxPegVrKD
         434j2+NncUxeYc+7YQGvjg97/WdcIOBmRqaNkbmOqSmbtzJDztoEBtZl/Ux+1AGuv9nD
         q08g==
X-Gm-Message-State: AOJu0YzmHpZ/CzWD6to2XJWT43foYtFYPURKDRqGAPs2CQicMtEuRQDm
	j/9UjUKWXlO51nvC4z4AIfYN/iN0wnaiyYZR52PQkekZ5X27B+txbZQpG2+HQ1anC/kyQMzOtkn
	2p5cNwx0HEjGx7u8zB3AgXDhaC3EdRnQC7YgaswEo1Up2p9r1RopSm1Jk6E8ABIdkLOSS
X-Gm-Gg: ASbGncu6Jc48x9pxdy521wZLpDHTSPmKzjKvFyTdHKCzgCfLCH1lbpLuYYPjT8frIEP
	L1o553CCwwMS/l8WL6pggbmWzkmIoSkrsHhAwB4yB+L+dTsVftoWLNzNP4QLeDJOgDVRtRZz77L
	dwDeRdZdSXpuWn1TIYudFUchBESLeA/+6OpqHOIdpLd/YnidrTcXzu30PrH6ZUyg1HvSm0aXV19
	elopExLDJO23MJjOrQrWRCaj/UNEgsVp3yPOVk5TcZ4rPzD5f/nmobVjnEm9RbiLqOzzH/7TiIa
	HKmWo0AHSlZ394dSNmh0F1aioCZeZGI/4vDg50grrhnj4N8jVsgziZa+s2fvNcFi0vnvNTxKTov
	JLJ+EsrerZxeawa0RF+kNh5Y1UzRVMGCX3DG1m+aS3DZov5jA4glgwhIjcPhjmBmGZ1O87Z8=
X-Received: by 2002:a05:622a:286:b0:4ed:62f2:8f03 with SMTP id d75a77b69052e-4ee5891e11amr213003671cf.81.1764053316360;
        Mon, 24 Nov 2025 22:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Jw2MQLBvzFRC89v824DN/Tc0cUmEGvEmhJxMuJaT6Mxnhfg0N3B9zzancdtKnis4GzykTA==
X-Received: by 2002:a05:622a:286:b0:4ed:62f2:8f03 with SMTP id d75a77b69052e-4ee5891e11amr213003551cf.81.1764053315898;
        Mon, 24 Nov 2025 22:48:35 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:48:35 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2 01/10] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
Date: Tue, 25 Nov 2025 14:47:49 +0800
Message-Id: <20251125064758.7207-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX/YvQN0QeuZQg
 gyZjFod+5fNtQQs1djPewMRbmQqTWcZAEFxpRer/4BAtXrEax22KH7o9ekxu3S5vtZqYvnSkZHS
 wnhZRYTqqRJzSpwYWMnBYJGatHU5SyfqNzLcP7kwJWQYil4M6tZzF+9bqSont+OJxeCuicIGVM3
 hXhNdO8sfdCMeifahkZfX7bi7aXFUEbHkR7VZdW2JeI/Gbeut9tk8A7D+Ps8PyarkQdQ8Xi2DSA
 D3ZQ5T2f/CkbFlUJHh4g1QVcSFSEGUJ0mgCMAJWL2nKvealTFIz9M69xnu/XwsCjRzUVAPT5HcZ
 ZY0J8Vb3I8OUYRR9VELU+BTUiGLm+qnsxnlUn6RGX2Z/+cCLkwTP6jhSBONWY55YcDtq+0p2hYu
 XZGlX78YR73CX1xxxkXDeUlBvbXp2A==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=69255144 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Z4_prh3F-142wZjaFU6QWLitSvCqUII-
X-Proofpoint-GUID: Z4_prh3F-142wZjaFU6QWLitSvCqUII-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1


