Return-Path: <linux-arm-msm+bounces-103341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOqAK4yZ4GlMkAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:10:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E540B5BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC623305EDBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E12F38F64B;
	Thu, 16 Apr 2026 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkZBsCaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6KMIZSn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DEC38B7BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327044; cv=none; b=c5g44Az+45C+TRIneW4vJzlioVkRLsSUxdosJeBVgjyqFz8EewamIc8DSflhnmLDwPr79maVhPasDTtdaSKfQ5U1DTk4n2TkJCghnSiL21UyYy1imEWmkyEVN7VN2jcZRPVbcLbWYPE2p6MtozYBPoFah7VL1b5ntfDsNOOWwsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327044; c=relaxed/simple;
	bh=eEkY9AoK3+ITu40bVW/G5qh06mJii71fT1hlMtShNvM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q0xlMqUMAKbnoKjFaVeYouc5CJW+6UcjzpOGkr2RbFZz5fJdQMUQ3bFuPdz6TKd8aWUpJUMaKsuVDaxIhCnlIGqtE4raaooRRlYr0Y1STvC0Jl83MKBqs24WtuyV1GNCqURoKWxzhuaiUIv4XNF0mHz8tfiSwtNOfvnKfPgOKns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkZBsCaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6KMIZSn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G7ucTn3733611
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kYkN4Dhoe2kpoPvfNtItyV
	vMnur9ObJCB64LDN14BEM=; b=LkZBsCaj5D3kKHPEYk/sB/PiJSroyfD1H0Mg0O
	cmr/e1IHMLZdlZ9qC4PnQf5u1ZXLWJTwONiRdGphTc1LmqsMgg3Y/sn4WDFw92sr
	X0L+2qTr8Zs6e8+8xc/xgRnJAdL22DAFz8Ajg5oBHY20cXoQj69s31nj12+FQ9uv
	6TfAPLHg4LGJTXr3+yG3qOF/k7QoHgmCCcFnHkI9fY2+VS+kfYJG43Fm46szLoKW
	EY+7q+g6O0AVkBT0bfTEAMl8cz/8JcUsIAFC81CKIz3/uZKsCNHabrQuTLC2clBd
	4vCwIWa2rMmJc7A2xisyk78jZM6BGKtRkPbppoDWsQ8SSiSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwk260-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so135200971cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327041; x=1776931841; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYkN4Dhoe2kpoPvfNtItyVvMnur9ObJCB64LDN14BEM=;
        b=C6KMIZSntVCRW/em3Eb7JzCBgmhhnrlvo9dOSkIexvJeWpkUCL2aY9KQWsZI/bIFFh
         /qQHBqAeTkqPvk+ck3wLcjkK7WzcooET79ca6dx/UekSHm+9svLVS39fgNuq64fcKW3g
         7LFbafACB71jjb3c9TQqHo+QcE1F4EWaCiVhcG/SiR4KzxCGNCoPb7C5J1VC3Xl0ilwa
         Wd4TTSDJaxZZlXg6FmtFKDAZYmdkxU64hgAdwL8JCjJQR4e8RSMGaXmHuC2vMstx3XbD
         /fSq3OEvmGiN/ILOKLMgcVg4RxD4+EOTW8twqoAE8PFDEMYIaw0oKuiOjQ/cEJ+bpau4
         efhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327041; x=1776931841;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYkN4Dhoe2kpoPvfNtItyVvMnur9ObJCB64LDN14BEM=;
        b=amHlV1Si+gLQVox2PAmYa8h7kbqWXgIBpGrOwU+eKokshL9llb5/d/ds8KGCI7qNmv
         iyhqhf2S6yeIuJBYk5N4BXx/yQEhdlNQm+r5x1z83m3yLMotLBT+zQ7szjE5KmqgWaUV
         cVRBIyMweszW5ywhEmqgMU3/MG8GjrIsJlyiRlyw9UXsvMKBBo9RyJA7S+ca03Jv0iWy
         wnVoYNpM1jABtfhZ69D8LJB9XpGMXG3lL3Ako5NmAhX+RC7WhegLtitOLFe1yo2E9+I0
         cY9PSGtdrocsC+OJFM/0i8oQhePO0DDxSP/Xx4klKx6Q6zHxIi1+/ETfh/jZZ9Sz+x7p
         vbkQ==
X-Gm-Message-State: AOJu0Yy7ljsJnmuh7RtNYKZSh4hcgtsaXZ5ojd3m2izyPSyHxnKiZr2k
	0aIAAPCcaoG9Sjwb1yOLwj0EMifs0BdkKYlz3J7UNk7XpvU7hCL4XUx2Kj0uUcWzDf+kAp5uajA
	7WD32g51/eMx9bVCxhRM/hD1Aj3srk6z00GDdD9LYyn8meY0+8/W+WxONAF9+iytlzR8QZymrfj
	0x
X-Gm-Gg: AeBDieszCYPz/Nm+Xlk8nHKeeTurwyMlvDKp9JbnkQrgIlCCJOtP7oR0P81yU+MJBHk
	u4xIuk9JDguYdrFPhnUQi/03z/npdpae/ATA8lgGLlDuFrIPYGGyiCTxwbFA7Q33U/W3Ckpw4Wx
	AhXvoYj5Uz+7hGqh4Btizm/ozD3qnSwvm7FvEnt2TzpAicegEPwIjfBmCdUx7k3lJFifM6mPIXt
	+bRBRp3PUti74KNwNNT1NHFVdHDGW5D7lj3M2Ptfl2twnP81v2GDwh9LB2bqlK7cG/yxoS+9a+k
	lQkryMiLVI3zdULWWrdYpLtsEmN5vVbQHpLPMuxyLng5Rgnm/yE7ebbYlhOCYw7SqJcdb+dU2NF
	OtjVDZbK3brhB9+kPAEtIBX/5GGNOCtNP9YxOkIBY+SUZ
X-Received: by 2002:a05:622a:2616:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50dd5a8062fmr365157971cf.4.1776327040899;
        Thu, 16 Apr 2026 01:10:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50dd5a8062fmr365157761cf.4.1776327040458;
        Thu, 16 Apr 2026 01:10:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35bf1esm12059571f8f.16.2026.04.16.01.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:10:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add sane defaults and drop defconfig
Date: Thu, 16 Apr 2026 10:10:28 +0200
Message-Id: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSZ4GkC/yXMSw6DMAwA0asgr2spoBJRroK6AMehbvk1BoSEu
 DtpWb7FzA7KQVihTHYIvIrKOESktwToVQ8to7hoyExmzT21SN0HvzT26NjXSzcrFlS4R259Y8h
 B7KbAXrb/s3pe1qV5M82/ERzHCWJjsMB1AAAA
X-Change-ID: 20260416-clk-qcom-defaults-8c8d956fb0cd
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eEkY9AoK3+ITu40bVW/G5qh06mJii71fT1hlMtShNvM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp4Jl4aQDFQvvtAImMK9Mh6ycVD9ahz6jx8qOYX
 hP42V6cK46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeCZeAAKCRDBN2bmhouD
 174aD/4te32fxMSiZzteT9r3Pp/SLuBsafL0O8TKGESWni9m1Lp+VLjcRnQSxLymEIg8NfduHra
 rFysxmsqPyQxC879cKji+dwsDsXBpOFnhn2Z6VS+Ymz14tj1DbOk75vbsQEJI3kw0pPBBjvj0ot
 I3/n0NaR9hZEQd6r7M9Ne4laLQvMx3ahdECI6LzgEHWFaZddOcPqA4shAzgdLpLUBgyspVJaQCQ
 1A8ayKNHZ/0bOXdQDk2yMzColK1p9+e/AmCqof+FTnamULCKXtDE5GjFF8EwIOHALNoKHhsydvf
 gPWJk8PMOBMFLuWKZ5dppH4MU56lqr9UzDtbD/iycPIXlTUrtIDO7d+sQwcqa/Ykgb9aCyTdn+h
 I/LG46CJRGdfXdW3PABJq9DcqwGPlNcwvLvRk1Ml6PK7GbnuXlMsg2g0bEOItnfWCzTNb/sVg+Y
 5AMtaZCuGIMSsG2h7h05kovh75fh2CsgbT1SAdAGIIYOgRqlW8kbVgBlchFx0HmP1uaL5mqOPdq
 C1811Cpr634UWQYZZ+VS9DezuuW8/x0yzHVgVQNJKbsgRDvcMSnKI+RQR+Db7oxCmyBviC7CcxY
 uqXAERJH4tEAElN8uLrWWoKfcBY4f9RICbdB8Ml+RMpjE2cb9hAV9dJdMzzg+dItaqoXL9/4BKk
 hgXw0cE7JyU1XIA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: nE-VsnMFnoU3kpEjT47PQhP67SMLyfgJ
X-Proofpoint-GUID: nE-VsnMFnoU3kpEjT47PQhP67SMLyfgJ
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e09982 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KTTc6GEDVJjevZXz-osA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfXzAlpAamDWPYf
 ajfp/X0pa+L3O2T54kgRQhVrs6cMls4dz4RvpxdXrwNQQn+ATum1Zi7Pw3BMYk6XR493RaOj7PG
 zHSIV/bSvPvtUcjTpUuB6FBft3hws2kIWA8toeY2yVG0j1umXnqWg0+lpWZ/akE9hbSn0fAW9rT
 dEudZnSWd/mQ8XQB6uslQf3NUKC2sVqRxEmMp5REu1QBK1rLP3k1AdPzgWw3S+jxcpknOzTsIwz
 cFMQrjLBTHr/Wi09FLFN3Wpe80v5AgeHnmYeMp1XH1O1lKjQRkh05fIuspft7241dfNf3bpFEn9
 0ei+UWgDmf1nCaqK6XF5zcPfMEA/06mMOJzypDqsoltBA4CNw90Gv0+TbX7xOb5fardrlR7UpGZ
 kUfFby/BWpkkMz/nwjfRREG+0FUpifbjN843s1nwYmnpoTC4RMcKn/hHRlppq+L7uPmfW/e3Jpo
 PZXEAUlfsPBzjVmbiTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103341-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 352E540B5BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We should not be really asking whether to enable clock controller
drivers. This is obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

If the approach is fine, I will do similarly with inteconnect and
pinctrl (and maybe others).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Make important arm64 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

 arch/arm64/configs/defconfig | 113 -------------------------------
 drivers/clk/qcom/Kconfig     | 155 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 113 deletions(-)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260416-clk-qcom-defaults-8c8d956fb0cd

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


