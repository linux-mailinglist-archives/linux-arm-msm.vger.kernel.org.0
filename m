Return-Path: <linux-arm-msm+bounces-71630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451AB4060F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE08B3BA03A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E9C2DFA54;
	Tue,  2 Sep 2025 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X99/i/cq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D475E2DF3CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821663; cv=none; b=TEn63U2qr6IJSPLPk3QJ8yc2MI2lsZp9R6tPYyHbb/97We6JRCVXnyqA61q9060jJGb8r8VZR4oq+bJYH3/N8ftWO0/IJwQD+Hx3oW1dZlQESMarhdW7ix5M3oKcomSJLRut2E0IQQxY5uWCTsBuy/bXGkHe9/c5g2Yiha3taJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821663; c=relaxed/simple;
	bh=gEpj7b+o020sV6p7lpCzjnDqFYnfMtxrY4cMk3OFcWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3UpgCm6onE6iEinMJ1tHobyFKVHjx5kGl3dqqomgGirJaRr0fzN2qpNuu034qvgPi1xgYBWqXODMc/H+ifvMOJaiWI6xKNXCN39p/ReTrYZhnHmVBOd0JBrVdeE+MIoJxquaIhcCJUwSSpteGY95wIts+8qRgK3Dy25O7zyKqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X99/i/cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AeNcY012447
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X4nCKgYxQJj
	fMP/VUT4XYH1vbsoebu/W1HveCS5YCMM=; b=X99/i/cqbpVctClptjZ2uSWd9i6
	HSdn+KG6rJ/lqjfyYfA7BUhxLOoc6rVr8UAQ1gvLZF0lZH3zV7cehzfWwkDCenN9
	ErHysU/1djCMU+8n9DMc+jbIFNUiDambxv8Po64dYH6vN8oq7e+fjt/UcxAeuLje
	cjA2FFzgYEsA/DoUYISTtOgz9jtybawo/OI5b01Sa84kkysjIgtt4FZHoUDDbOa1
	ogw+inb+7c56Uc5FiYTtJnVyDYDBNWTNuiwdBnLHZFQQi7Rp5P2N+Te5XYai41TL
	rRxDlEFf33GdxN7YPGtpVSkI8Dl09nOePP4h1znU9f0zKWmiUxcLeUyuOcQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ffx37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:01:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-52dae4447a7so121727137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821659; x=1757426459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4nCKgYxQJjfMP/VUT4XYH1vbsoebu/W1HveCS5YCMM=;
        b=JwyiADVHFsa4/Z2PSpEgZmxyvWHzXw/Z4YMPMyJhwmNTfiMnDtCPmTZH90j9WkjlHb
         /OVdSOJjHLVLbvG5VdjGuZUbsLxsSs68YOV/PbEgW3nDUImpmKy7Xsa0+FH1QrwZSpVX
         VGrvHBhSJlB0nlCFzawh0Sonmkh7mIUhB/6IhfdMCLhVUrh7nxEpuJlNpFIIcF0uhPvl
         GLoqGu6czDzxb24V2dYka8yuMJjbHRYPfR6DRZturTyE0HwvIDdoe3f+7KDCI4F/Cv3b
         fyMqUX0ny8Vf0EU8g66E8uFsFQ+2mQsv6VrI4f3qRKdTdUK5eZqaugVwgtpwxTKj9yQx
         oo9A==
X-Forwarded-Encrypted: i=1; AJvYcCWWEY2AKeZaUAFZ0lW5wuifEkKhyv1RoCt4t7kOu2ymdLxYXFu2sMrRrWNuGsubvqrgoID1d2zYZSX3GGny@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZ79tnYB9JrY5jELrM+DjPYb8cTvkK7XXvUqfHAirYqw7bfYU
	+XZju3pLSCW+p6gTLRNgPyGApcBVwYxz4+JkYkn/7bwWRDwuCXjefcn8uVmI4/7nuhsUQrn2nFe
	ZUO1H52alKfCl6X2qDlzZvUhomHdP0L2DkquygDM2dka+n4l2jpYzpZIjWVJ7NQ89qBOL
X-Gm-Gg: ASbGncuI/pViFjh0NxsmW6yYRdI6gHLSwFVheCa5AFby6YahHdxYa6r6XP0zkKtAvjJ
	7bRYAfqvQo6kw+/qVlyyCkUEyu7L9NaFLyakmB0wW8FZq9nHmvc15reyHwhT7f4wSPenVUmBAZC
	FjXB7ojLJMh19bURbpE/MF1erAsuaASXEXYe5lNPbXTxNzjBTWezdqxjLX98Edc/6ujuvHueb1g
	N/t46IaouA+0YRDZCCcvaXF70fp+w5QD52cmIxYwrBmangWa+1kNlBy7mA+OokglHbkV5hUNjeN
	rxWE+oRzc8jyem6j9Adz0zhj3/3906i4dbZnK6FHHnohiepo7e/jDA==
X-Received: by 2002:a05:6102:c07:b0:528:95cd:bdb1 with SMTP id ada2fe7eead31-52b1bd1d838mr3723218137.25.1756821658196;
        Tue, 02 Sep 2025 07:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4njbxVQBDhMgFP+R+/C1mkzBd4r1t0DyPORMMUl9tndSyU436LA4uBfQwkstR2HtckVPx8Q==
X-Received: by 2002:a05:6102:c07:b0:528:95cd:bdb1 with SMTP id ada2fe7eead31-52b1bd1d838mr3723115137.25.1756821657123;
        Tue, 02 Sep 2025 07:00:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/6] ASoC: dt-bindings: qcom,sm8250: Add glymur sound card
Date: Tue,  2 Sep 2025 15:00:40 +0100
Message-ID: <20250902140044.54508-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX+1+ba1jC+eMG
 d55zlW4WsXHBoag/rUt/8Hmx62cvdBLfgI+SQ7NAMVMvdkZpmw2YDRBMITUT+fjr9CK2OuR/DVx
 xIgdRRJw+/eFwux0inpRnJTtQJUY6fBpgZ2Qtkmvd6+PRZrFXc9vqJctlFPBxAOeWSMtTllQKpv
 7v6rJk73ZgPHKmsBzmmxgkKDIg5D0ApHul1NZ7i3JqAxbCaX64cE/z1Yk+RTKSVYlu1eE3vSCZ7
 cjkL5x9NeKQroJtIxEawLP0lQrJK/ygS5AkfbN7X4Kr2TeuquAe1+UJKBYOuqZIvUXBvqiTMxCo
 XTKIl+LTjl/Nhjd1QxC+JQl4hZ6JCz2aECRxzpkYLDm5/ZaieSUPXjb5/xh/bstaVF48w9dxqIh
 2uUSP2z3
X-Proofpoint-ORIG-GUID: T4m9yu9trha-1mGEs9FH0UWV7ZMP8Ey-
X-Proofpoint-GUID: T4m9yu9trha-1mGEs9FH0UWV7ZMP8Ey-
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b6f89d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MxEaA3INf6t8ycFtHZsA:9 a=zgiPjhLxNE0A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Document the bindings for the glymur sound card which is
audioreach based architecture.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 5d3dbb6cb1ae..8ac91625dce5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,7 @@ properties:
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
+          - qcom,glymur-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
-- 
2.50.0


