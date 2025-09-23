Return-Path: <linux-arm-msm+bounces-74513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE2B958B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 13:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5300319C1C74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 11:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2D030F545;
	Tue, 23 Sep 2025 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/qp0n9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F41260575
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625337; cv=none; b=dEChO8/0OeW/NzASEngkNZlfOWe2zcGSDquW4q3UUUDl+4DnNr2rPK2g1v0wrtwciEs9z8zN76rlBAEA9k4szSPkRUp3O5LSXGZwvcTTm/k5brMj2KBbziPJDpduk1N4W0TvrcO1PiMVqSZAhZStm7upOh8wTRef2ffZP8dllYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625337; c=relaxed/simple;
	bh=5hEBAumSRnPCha/Ny/m++/pZyTtvzKOFLtKUlv8WYhU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iP0GC3r0f6O97bLG4Nv6+4AsX1g6LCCFoPg84A67LMtoK6n6qzR9jOBavGU0N4jpnLzUwE+bEQLu6yQngDSGXnJDnAS5B2n5C7XGtlzJzQoG+GXwk0E867w78bKF55nnUaMAbbtivF4Ieyp9jJCKaSRxmvp4L+3PTz4OvT3oijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/qp0n9N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H5Io015977
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GCCtjueZgBHRf2lKO9QvuT
	Vc8R/RhxwXGzaoHvYzDdU=; b=B/qp0n9N78pOX/CQWvRk3WSTHYwwQLN2W+XFVh
	dnlApt8tgnof2c1eP4noj6GmRQTC9OiCT+kVI8tFIics3zaFRGJd0hfGLVrYCODg
	Ozj/t4mYn/VJLvmNWrC/sBKatH2ldqUpwCTo2by1kF8+hiBpr7I1Dk2d3Kpe0FO3
	YhqJIK3ITyzYRS/pj/D/Vt8boUjMM1dFBJGOZfLat5SL6qxCLmUHdPuBCjpQbXOc
	ipPmKAz1IaQ0yPjdwy/hK/QnXZzygWswqqRm/QvhTsaH4ARxuRVZ17vqjpabPgkH
	QbrLKUQlIndUgXrsN9laM1vXcNowDdP8ZaGrfALkZDMPWyKg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdsepw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:02:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78f3a8ee4d8so89389906d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 04:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625331; x=1759230131;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCCtjueZgBHRf2lKO9QvuTVc8R/RhxwXGzaoHvYzDdU=;
        b=pjkdQQTpAJjx0PhKa9X7osKe/pFxZGCsrmGQpHopesPFtbsUi058bVHS2069i00xe/
         V9+FGp5Wq9qso3KlLBkvkrLnGxxa0HYLYlMkhW2uF68pwMSo/EnmP44lAZWoB2CV7uv+
         v6z41x/7edzatxJ1h642vg5vkmlzAhUtDjnWa+uaPtXX6gRi+JtoxIJvkTqzKu2wr6rG
         PF3e9suQ8ikZeYwmOR5ns7vqa2klFt5Zb/jr4EN0DwSBBrWIrlkhUU+AtGlXO5EY1Is1
         g29fy2nDcxLHTKmsnajxUccrl9SpzTW4OkmQFj8mf+JsCZKP8LVX0sY0fsuQ16n7ZE+H
         2fsg==
X-Gm-Message-State: AOJu0Yw1HoAKIrPBqtNMHxuskSjCmwEY23XSUk+zXWsvH+/zM4KQHFkE
	rZhBTwWZ5Cd13j4eVxkgQXqRqVMUNcpoSQzv0kKdIxDFiHqpp28JorvMuDhN9b2dyfQN4dw3CoA
	v8MemLmXBXVRc2zuLYKdpEJxBaJXIjeFNlG77TfOVFiQ/PmPEm6tJvMife4SI9dXmWzJq
X-Gm-Gg: ASbGnct52UYmg1TGFcIZ768DkqefiewedcvBjmzP6QaJVJZP4pGO5VWsVqyvFRjk5bu
	7qrqcJ054i5SVPiHLTQXVcQhKQP1QacYXC9guw+W27o9zqvIoGoI8dR/wwHeTNxw/VsD3oiCZaE
	C+ASTPOdlwtyW9A8qPfV5HBEPJg0+Iy/KdVvhZnNKo3oHC8NpR4SFkH2qhni8TtQvwsmRw8Lud4
	/18/o38xe8Pa7M9/cJjIJPCr4IHBKqogDMtopQoR3bJkeaW51Yb2POwhgL8vfusbVr+30yAlQTd
	Hu2pablRu8y+BAErF0PeWFWCKX2rDqpNPFMZ/eTPG/PthAVjKQyvI5Im6J80T9ZSIp7RxkMDSrG
	g3tqcZX9JfYUSVTzBUnW0Jqu8wBezb2o15EBUqO1MQiBQnbkKHH3u
X-Received: by 2002:a05:6214:20ef:b0:70d:a91d:2ec4 with SMTP id 6a1803df08f44-7e716d467e7mr22730236d6.49.1758625330885;
        Tue, 23 Sep 2025 04:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsFNNHaOMJ0Dvt+QYoMrgLHz7i5vsL16oR9PxtXAbrChfsujy9S7H0z5WkxgV9KWb7cMrvWg==
X-Received: by 2002:a05:6214:20ef:b0:70d:a91d:2ec4 with SMTP id 6a1803df08f44-7e716d467e7mr22729526d6.49.1758625330338;
        Tue, 23 Sep 2025 04:02:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f4537csm4075975e87.27.2025.09.23.04.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:02:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: rename dtsi files for sm6150,
 x1e80100 and qcs8300
Date: Tue, 23 Sep 2025 14:01:53 +0300
Message-Id: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACF+0mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyNj3aLUvMTcVN2UkmJd0xRzkxQzQ2OjNBMDJaCGgqLUtMwKsGHRsbW
 1AEOh8EFcAAAA
X-Change-ID: 20250923-rename-dts-5d74d6132f40
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3505;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5hEBAumSRnPCha/Ny/m++/pZyTtvzKOFLtKUlv8WYhU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo0n4wYArVdXVon0JH98ViR+JTPByVSEXNFQb1r
 zraqatvJkCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNJ+MAAKCRCLPIo+Aiko
 1eXpCACIFEaqSDVyKtaSdzlP/SEPJgi3gtn84vuZrJNohZvAjLzQ+nCKVBeLnO629smbi0JlW8I
 uMuC/ArjQPbvOTvG1EBcveLto9p7i34o6sWRIfK6zsKIGsWqtmFdq0yvmhv9kq8lPWOZcy8ik5/
 gac/tZNqT2nbMe1eupMF5TMSmGkoHmrH+nq85lMzEfNjKJCJ9L5ZcbNfDChDtCj7fNVDrY6sQpS
 puZZKpSfM3pJtmnFO831NzGUsbHg4ukGQV0ipe31DH3PX7mB3dyDLN5UlZ4nBdYYy4Tt4BDZsLF
 /I5XhdAcJJSZnkNlPV5Tn16k9zlmIKCjFMfNluVVM6vuAd21
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: miKNBbU5eOqHAtKx7TCRKPyhhkywYP-y
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d27e34 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CLCcR14eWKlEiziUIbcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: miKNBbU5eOqHAtKx7TCRKPyhhkywYP-y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX9jQcAeFoXIu1
 zmoXDL0efy1Lk5D00r+ZkVMwhHGXHvY+zPxFW6Jkj9q859rvRR3C45fqvksLJ140sv6La8wYVmP
 fuVlQ5ajsF35ZO6FlDDGq4oj8vd0xs+PSKdsoSXobbRuFgpvMaH92v9jFOmvqv3brpd7Aw1i3hw
 jJSX5bAMK8angKvUk5eT79UsqdDiumMhva78mGni9wo5CFdrpSTEM0E1+96uJa/s5YXTPBmVLVG
 MYTaZrPPqGzmLXsk8ZAiMILdOkfp1qDPebq6K8OBBvlXJpeWY/dPdIAIfYxWY7sdIW2v9eeTGyZ
 s89PL96sS8QiYHLiGEZ3kznsu4WhvccHnOk2LRHQ9vKOfRjOlml4q/Kj6Nvd+tXkWlaRn84vK11
 6zYx6yK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Bjorn said to me that he disliked the conseqeuences of renaming
qcs615.dtsi to sm6150.dtsi. Let's increase entropy even more and rename
even more base DTSI files.

Leaving jokes aside. It's not uncommon to see different names for the
same SoC (or almost same SoC, with no visible differences from the Linux
side). The platform now known as 'lemans' is a good example, because it
had been using SA8775P, QCS9100 and QCS9075 in different contexts for
slightly different modifications. QCS8300 / QCS8275 is another example.
All such names cause a lot of confusion when somebody tries to follow
the actual SoC used by the platform.

For 'lemans' after a lot of trial, error, Naks and reviews we've settled
upon having 'lemans.dtsi', the core DT file for the platform and then
naming individual DT files following the marketing name for the platform
or for the SoC.

Apply the same approach to several other platforms, renaming the base
DTSI and keeping the DT names as is.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      arm64: dts: qcom: rename qcs8300 to monaco
      arm64: dts: qcom: rename x1e80100 to hamoa
      arm64: dts: qcom: rename sm6150 to talos

 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi                        | 4 ++--
 arch/arm64/boot/dts/qcom/{x1e80100-pmics.dtsi => hamoa-pmics.dtsi} | 0
 arch/arm64/boot/dts/qcom/{x1e80100.dtsi => hamoa.dtsi}             | 0
 arch/arm64/boot/dts/qcom/monaco-evk.dts                            | 4 ++--
 arch/arm64/boot/dts/qcom/{qcs8300-pmics.dtsi => monaco-pmics.dtsi} | 0
 arch/arm64/boot/dts/qcom/{qcs8300.dtsi => monaco.dtsi}             | 0
 arch/arm64/boot/dts/qcom/qcs615-ride.dts                           | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                          | 4 ++--
 arch/arm64/boot/dts/qcom/{sm6150.dtsi => talos.dtsi}               | 0
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi                  | 2 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                               | 2 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                        | 2 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi        | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts            | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts             | 2 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                          | 2 +-
 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts   | 2 +-
 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts           | 2 +-
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts           | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi           | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                          | 4 ++--
 arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts              | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts          | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100.dtsi                             | 4 ++--
 27 files changed, 34 insertions(+), 34 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250923-rename-dts-5d74d6132f40

Best regards,
-- 
With best wishes
Dmitry


