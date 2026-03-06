Return-Path: <linux-arm-msm+bounces-95742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCtVK+WaqmmbUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:14:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1B21DB16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D236530233DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF00133B6CB;
	Fri,  6 Mar 2026 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyNDVNiw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBLcr7o5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA122D5924
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788446; cv=none; b=OKNHtmVTixk1WYpykT4ALs82tXeERgJUqOFwwfCzpmYDLHbZkWixlhR905tExkMX0rqlAYWmp66bjiIWyyTaKgK7Yp8qC8diQWdRxyedQ2OKA3r7CjU4VBKWJqI8da9OR+EpY1hlDxtbUP6sfpH606kUlarkcduDTsKQXPdR1ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788446; c=relaxed/simple;
	bh=p9ukYaDvRTvUBGXg/BeCVGI+3rRMaQiIKfpqUakUDjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nxJ57qfsaZwlL0KTr3PXvN4Puum4DI68F1BR3Y2E251+pryLi2RmI+3yRk30+QTWQCmntO88fY+7zQ4DSymyNdIK0Q2T/Gm3xIcDlCt2fal2RoGXCQJJ7Kdlxv0xxBtxFTtS6nj5pn2wydekR89LzA9oWqmoBbKKQfS29BzaK3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyNDVNiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBLcr7o5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aHTV2802213
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ssnsxf+NwNzA7Vl+ksNTvZ2lOXqYDlxw0TO
	YyAgTN30=; b=gyNDVNiwHviuCbrBlt5K//6TcE9UtqtxDxy2KcsGGGgOPfPM11T
	K91Qxqdh3vtNXAwMxNZSnQ6AsR4VGCUnbRcZ1MNd9JJgpgBGSH+o5RD7O85oXQgI
	r5E3l9gOruhbuelHr+CYrvpQl40DRJ+EbbGj59Ifj0eyXoRnmytwh1eYnlJrjaVh
	GaUtK0tWoCfRJqm0NbiWfJZK9WH+JkAHIR8V03TlhuvQVHz6OtRAiek/RGzlF3pW
	6k1PCGKFfGscbPAQA3L4a+gxiMxzLqdbk8ZpJ1BpBt2Fx2IuMXFXuMC5CymD2fOM
	tivd+HSxgBmGAcZM/yR3k5WTZzBYnVFWxWw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp425jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:14:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c737b6686ddso1650880a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772788443; x=1773393243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssnsxf+NwNzA7Vl+ksNTvZ2lOXqYDlxw0TOYyAgTN30=;
        b=GBLcr7o5s390+7JRP5CuQxq3P+LBP8k7xBnw8A/B9BSERRrbnjV1t14rw31yEtpQ0z
         LEbLCqyqPxg/86hcHoU59L/zI0P8+Wj+lgKHtNXZLu/GI1Lzr6sghgIW1Kq8AZJvlpjH
         Au00e93ywNxNEjbefAGp+/j409WnWbC8gv2R9Gkq9Mwn9FTjfdGyjRhWe7+rCP9m2xCz
         OG08DwOh6UWYRl3beZK/0usbOQQmZbt3ogDADp8k3CTrl+oUcxM92ZOKS4aHZWMfH3pX
         kSmZ39+0+nQbpAVIsJBqZTOoX5KMw52i7L1LBkWnSCASS2w2e/uL/HOxZRfSbTiWapOT
         V0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788443; x=1773393243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssnsxf+NwNzA7Vl+ksNTvZ2lOXqYDlxw0TOYyAgTN30=;
        b=nKKnHXu+WjsqsCgIKDi/tUXOfSItj9m33HEUa2bm5iled7jJrHukh4PwLezYbWSCbo
         ikW/7Pe9bz+ZbSNhxDQPx2OPFxh3u/0gNxjAgjXFAECKgwTijt63BIm3wJjEKcfjMzJh
         3RxcVaIGBNKwC6dy1w2KhXGtoO3LNiPIP4LPrld8dypE0BAiwS/QIeUa2ci2Pyhj87yW
         MQDl5cJQZt3rLwYqh3cD/dLIVy3PRiA+IY48Gf6y4HGpVYPZLBDOxaM0tyn1Q/ZFg6vo
         meC0PbXq+CMFmFrMyXJVc9AXbY53srfCMPV7sdJ/KMMbUp5zbCNg4pj0DqvgCkl8eM9C
         B41w==
X-Gm-Message-State: AOJu0YyRzZYwn7IGNNsC8zCkGgI8VmczlXAA7Flfa1RMp2kLks7YB0jD
	qHDnZPQ7iwe81BRGI7rLi+RjCjNNZpEj7XCCD8ApUCJ7dQnFlnPvZ5260N1Txd/J46B3wVDG86+
	j3VWqLSqKyVkCJMrIlZqjadUWZg3q3FwifC/cKz4SmwZ6kdlbZi8ybO9cPYUmgKU356VL
X-Gm-Gg: ATEYQzyFUVcqYs3uEEQbaYJraQkXgon+hI6qTLi6DNXrSRCJHKyUe4TqoDJYB6YmKmO
	6PBB9LXlYi+u32JpxfDfVY0SDrQe1nBJqizNyA4eldDz90WdV8xb2bmAIuxNV4x2Gl2zM78a7Ue
	8m30apwwjP/PKSju9sWUuGycARtLn0nzkscfTW4FE5AMHcYdUJmRm9TsZFFV7HvfMCrFq5IQk+0
	7QeFL6tJspjcMUA6WqP7nOEMZfAt5jR5abHxpohUtbOD1vmTy2py5TTKIhvFhjYnSrjjHOMfcrF
	sq75lWIeVln95Rl7ntM7ZPiKIdAR8NhszAuCId0INcy0cqv9FJrh26mtEOku8N5yWbNWZndxCD5
	Je1b+2bM9XRzAiECzoLKebpKTjIESPido/Sk73uDUQWnuUpBI8DvUck8=
X-Received: by 2002:a05:6a21:4a98:b0:366:1880:7e06 with SMTP id adf61e73a8af0-39858e0f4b8mr1859653637.0.1772788443529;
        Fri, 06 Mar 2026 01:14:03 -0800 (PST)
X-Received: by 2002:a05:6a21:4a98:b0:366:1880:7e06 with SMTP id adf61e73a8af0-39858e0f4b8mr1859630637.0.1772788443073;
        Fri, 06 Mar 2026 01:14:03 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48647e8sm1169360b3a.33.2026.03.06.01.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:14:02 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v6 0/4] Enable tertiary USB controller in OTG mode
Date: Fri,  6 Mar 2026 14:43:51 +0530
Message-Id: <20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VExl9T7qSTaAGww5hO28y5rtuTEA9bBJ
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aa9adc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PAEsFWfe2vKCIHFHJysA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NiBTYWx0ZWRfX3R2f0h125/EZ
 y/T8wOG9nBPy+ndhmCZ/6PxDGS8pU/BkpcT6DweQ5Dh5e907FToKsmFdkoOIuqYNe8nnCI+t0nr
 TxjLN155d7+QCvxOTZ2CLv0llGgL9n9wMv3YqoceEWamomNZhqTOizHlDQdhSvcrddAISx/6hxn
 2ZZCKTMhwEJh/cadAsUSsrAKHVu6K3weeNHBzdqoYbhDezszxZoNhZ3ctMmyT6qeuYDIc5HIEAf
 46e2DKxjI8gWvSkPfJmgtGXxNagvBajsPZg7oPIU9dFGWUi+uCoG4e7ZlL+IKdgNWNrCtQxGrU6
 3w/BeMpDOZUXUFetC1MXL+tsHxxABXDEzDhRmNReb0V27XOc3Yrck1rSQRLT8Benzj99y9Urdnx
 MZW2j4ha7hOxRN2kinMfddez+ggebhXicwpBaMp5J9KtKM4Mwk3jgY94wpRbopRnv2FLBYVvzqg
 fLVMgzcYQ+Qf5z1eGmg==
X-Proofpoint-GUID: VExl9T7qSTaAGww5hO28y5rtuTEA9bBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060086
X-Rspamd-Queue-Id: 1FD1B21DB16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95742-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable tertiary USB controller in OTG mode on lemans EVK platform.

Changes in v6:
Moved Rename vbus regulator for USB primary controller patch before adding
USB2 VBUS.

Changes in v5:
Renaming of vbus regulator for USB primary controller as per schematics and
in sync with tertiary USB controller.

Changes in v4:
Minor renaming of regulator.

Changes in v3:
Separate patches for lemans and lemans-evk.
Minor formatting changes.

Changes in v2:
Added interrupts for all expanders.
Minor formatting changes.

Link to v5:
https://lore.kernel.org/all/20260303080728.479557-1-swati.agarwal@oss.qualcomm.com/

Link to v4:
https://lore.kernel.org/all/20260226060835.608239-1-swati.agarwal@oss.qualcomm.com/

Link to v3:
https://lore.kernel.org/all/20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com/

Swati Agarwal (4):
  arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for
    Lemans EVK
  arm64: dts: qcom: lemans-evk: Rename vbus regulator for Primary USB
    controller
  arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for
    tertiary USB controller
  arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 102 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi    |   7 ++
 2 files changed, 106 insertions(+), 3 deletions(-)

-- 
2.34.1


