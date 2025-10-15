Return-Path: <linux-arm-msm+bounces-77384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4596DBDE7CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB9374E6553
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA01913B5AE;
	Wed, 15 Oct 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOlk8DPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535EA1E515
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760531709; cv=none; b=NsfN8iIgOVpEJbQq5hEbWN1+TTYvjBdGxXVIoGCn+SpjSESqkhP6FfBN/Ox2b5OlcERrvCbhHYzpZ5cFmjqREgSylOkQFhnT+3nwn4/pX5dwKHFfvz+8x3pArzWu3v64ZFVbux6nNosKTh8EXVYKjq3OXNvOfMuQHVCDvs4iGXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760531709; c=relaxed/simple;
	bh=X4N17n4Ua7mNCyR6WAfWyrl+7cd5pNOirQVeBonC7NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ldvhOK20Y3d1L6grzF5JgoYvkAbPMOeltGgqxbGtDxnCCkdXpPaspit8MWQ/w3I1hkeOmnh0GfcZuxvzI1qhOBBuTkW3wMmhztg2CipGgwBvTZE0DVlneU/Ox+48seik8Q4vei+dhdMPYJr3tGA/FvAa7N9DMwVP30yLi6liAg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOlk8DPe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAuCR3004284
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pzp5Zzc1pFXeaU+Nwva8WA
	BLFh5MZrb4G6fcqC/jDw8=; b=oOlk8DPeuPHxrvywEh9EpALCqUovMqVGiTHQy5
	c/YI1UDP8gMj0fAyPKXTG+9OQ3lrDcfji9GvtdNjlSe8Loc7fz+P8QqnnmohyW0l
	lA/SDI9tZ0emDDZEj0idI11lCQg1mu/+KyACKxBntfgdCIuLv4ljbmhkc3wAmv0M
	PGYck+mWHtReuT7Yq22OMBFenBLOh2y/qrb3azByJnFdijJS+TdxnUeyAQTmz89J
	zwhygi5YA2Ulmaz/5QPHM1HHtphxRWzo45vd2nwOpjFZg/0JPAO8FCNwWxea2AiE
	WPBkAItLri/aB80FVNgQ5wGwP8HhilXk/1yajovQLJC9CQKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1agpe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:35:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so9608974a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 05:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760531707; x=1761136507;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pzp5Zzc1pFXeaU+Nwva8WABLFh5MZrb4G6fcqC/jDw8=;
        b=kKbO2Q43H7hMNPy7DQwfVwv0a2J67CeHr0UeioW/6mbwQfCgInoraj/qAHhJL/FAav
         zrr9dzkfeHyAjK4VAt4r02LIxaibV2GAEqvsCplu6dmrLs8G7LiGIRE3eHksoA9vsF6S
         MyUqklk+QtieRfq4dqPygXb5/1S8eISsZQEb5R0N2UlsldTgekhNx/p5fAg/L8aiydgJ
         6nbvAQPb/2hketu9i0w48eH1zl8Kx8VrPukwrPwiG5kjWg0Ur9Y2t/vq2y9QvvknlSu5
         jZ6w2PYK5gLSytvTCqygJF8f26paJLZBxjJ1UYrZrUM3ycIfuG96ftL7vcI6NGBYgyFL
         Ysiw==
X-Gm-Message-State: AOJu0YwSwP7gvOi10kVMeigbjkaoR+hXRVJ+vkaH1Ilh2y0/jyDTjqp+
	P64bj7xexIiS+fls9b5o6ROCjdMXElKXH5NH4T6DU5XH3wSTvK6ogzFcmAT5eNwCM8heCr1bzmq
	HdQ+0HrIzykFk81d2P1pAcINVF6LCe8mnyXTICpQR2JXTx+ZTjgwrFrRL37T1Q8mN+p8=
X-Gm-Gg: ASbGncuONJiekpvdTQJ7X+Y+XXh4BQQvYMnBJiSB3pbyEjZwisDFwuY8TwnfmearDwE
	/jzGcH1y32Q2a+QGi097MOhz1+veO1uXbATx/dZcRTkfrc7gxnHHcRRhFZF92B/Efqsxg1HJ4CT
	UXhhfR/X5d//wDoPgb5L9kZoiiMxKwgUxpNyHhc5qk1dwcEM2cCIXaZMBj+1Jxziezsb18hQrPe
	bn/EPQhCm3eNitg1coOOuNRPf9E3/xBY+JPO+SmMyK3v3TcdhtcdsjaZFh1IzBBpHgJifivGMhg
	YGfN1Ffvn6CFHqUeTYbMpV1MwTgtNpq9UwgEA6GpNM5ksPmyqcEva9ksiWaMrVJeVYPYtg==
X-Received: by 2002:a17:90b:1807:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-33b51129723mr36139015a91.13.1760531706485;
        Wed, 15 Oct 2025 05:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELMqHeo+HHyB2I1fDjUFGKkYnQoxP4f9ftX6FPP/Z5V2sIvrCOnIckE3CHkoakEpIlcghHVg==
X-Received: by 2002:a17:90b:1807:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-33b51129723mr36138978a91.13.1760531705862;
        Wed, 15 Oct 2025 05:35:05 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a08c4b7d6sm2389755a12.7.2025.10.15.05.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 05:35:05 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 18:04:55 +0530
Subject: [PATCH v2] arm64: dts: qcom: lemans-evk: Add resin key code for
 PMM8654AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-add_pon_resin-v2-1-44e2e45de5f1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO6U72gC/3WMQQ6CMBBFr2JmbUmnWARX3sMQgmWQSaTFjhIN4
 e5W9m5+8n7y3gJCkUngtFsg0szCwScw+x24ofU3UtwlBqONRY25aruumYJvIgl7ZU1vDxpLl1s
 HyZki9fzeepc68cDyDPGz5Wf8vf9KMypUhXF4pbI6Vro4B5Hs8WrvLoxjlgbqdV2/pw0YE7EAA
 AA=
X-Change-ID: 20251013-add_pon_resin-52f54018c35c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760531702; l=1121;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=X4N17n4Ua7mNCyR6WAfWyrl+7cd5pNOirQVeBonC7NU=;
 b=KE3ICyICIkU3msidOaHXIeqwTq4UdytdyqOAFInA7R2Y8kcF1vZYhaJGh/zR7I8cDi3CJ+KWE
 T7TQb976xwBBW/Ksz3p6/CQl3coCGfC3J0CP/wfQRMH9je478eLl6iw
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef94fb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9TsxBIn3MFV-MpTI3mAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 6di6h5EfF4t0AvFIwW0-PNttQnSC7q-b
X-Proofpoint-ORIG-GUID: 6di6h5EfF4t0AvFIwW0-PNttQnSC7q-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX4F/MbM3YBzOl
 piP0L2+v25UM8QJWZTr9kxJOpYO1Cg1vOWI9BGiqLkJ8H5Ww8H8cLTgAG2Bs+316/JN0uG9CTys
 AG1hTs/p4wemLfE9U4iCSbrB8T/l7xI/k59fg8OKejQLVhYnOpwhjYDUvoF29ZuQGVL5KojkTBA
 XUjeIW5q5b+wZJpsP5lFwzp30nqJ4DRembQZly61ieO3YLZP7HevA0LHsKNlCVs12FlBa3/gsFq
 7jAZ7F09gE6rU+2iTzjV1Svv0oqkzNjTPBJQJL6gZASMy7IHc6TWlFz/Xb/UkeLDs8uB/7Cf8QZ
 ozHJ/wyrzhMkGmjeaH85p39M4AlfzlBUABwpowh7gkX6WJX4ms+vT4lvrRg08UmiEPtsM+uf4mQ
 LRb7diE21xmTd3GW6t1A9hS5409SKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

Update the PMM8654AU resin input code to KEY_VOLUMEDOWN
and enable it.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
- I have dropped the RTC change. I will be posting it as an independent
  change, as suggested by Dmitry Baryshkov.
- Link to v1: https://lore.kernel.org/r/20251013-add_pon_resin-v1-1-62c1be897906@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f445787a87ba4869bb426f70f14c1dc9f..0df105755c328706475cc1974fc45557d0a7bff5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -587,6 +587,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20251013-add_pon_resin-52f54018c35c

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


