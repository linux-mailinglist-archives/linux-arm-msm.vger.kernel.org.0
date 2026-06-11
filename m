Return-Path: <linux-arm-msm+bounces-112797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1997JhABK2pe1AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:40:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D5674856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:40:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oRWz4di9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fIaioEe2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112797-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112797-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C040315008C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8C74D90AE;
	Thu, 11 Jun 2026 18:38:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F14D2EEB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:38:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203095; cv=none; b=GsvpP8if6GkqVS28VO8D9sXf/3Ny7JrF/oShPddOQ8XLsHPdeg/7jGF4jkdLRllzFbr0hA4Cd1ib3Dk6En/o55HDptHUMW9zENQpn/vVRyeXRTxc1Lm2f0ql+wXXj37kiLD79IXoHfX/+akw0NuGXGBnUyod04Kj3LvIJvSmeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203095; c=relaxed/simple;
	bh=myQOn368a4bEJkBKFi/AB/zdqSpCAE0Tjjhf3d8zs78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcU2uM8ufDcs35UEnNa5xMsIImxO4IN6A2beWL+ENyOP8Y7ApN36vIE22WjQho9N6K6EEdDgoyQhYvvTXEADZMgA7VyDjLNwhfI5UjvVriNf+xiSUKaHivEyokJV/2BEn5/NGgTjpPBTQImcGGK65EDUEV1y0h5thUrRkR3wSsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRWz4di9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIaioEe2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIQDl44027801
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=; b=oRWz4di9ND6hN99G
	G3yEcSDwzj8xLcMa0+clj4YI8Gk7xkDWKM0Mk89+CbSb6nQs5u/pDSRyQPAAPQFK
	X3daIoEpaJmwI/nTcVjWiAx9+wVF4mTUQ3CxNjoI1VKJZGwnmljsdfnvGqBPyhlF
	523w/ifj/+K2hYwTAhlGy0HOoy9xNof8zOS2Q+GbpADle0GAMLtREemKNx9zORzP
	NjzDahAeP7oJ7g2kZ4pnrSw9vJROU3o0pOchDvYQ5MgujXC+rCIOvIpe7nt/X3Sk
	Mr3IkhrRp3ck958jOz/jHD90Yrc2NsvNnXyM5jdFBYE3LDf4vGqksG0fWaIzsZBK
	r+N2Xg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014gtf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:38:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so67375a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203092; x=1781807892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=;
        b=fIaioEe2Dhhz4MhdrdXMP7ODnVNyC1hbdYZ8Xf9/8pQRy2CLvbOQDeBHoXlNEhuXhY
         mvUNYQDn+ZKdAM14bIikg5e9inF+n7iEYTiQQQCKsqwrrnqGiTFrqfxOOXi8auN3yMEN
         HqO/6ro/oBJcf33QwPLu4G1BjnqV+kJNH3G+YZovCX/+2jICzQkhNlrlPYfN0SVkTIKu
         h9HZoEm0S1kVidv2cQiuSzAwMsrjvSBwuvIDyKy5lAc6ugZy11GjRJ2hZULAuipF9G5j
         n8id0iYu5zInISOJo76M+ij1p+ersNW5bGmiU40a2Bj+CTJFEXoyhMV2yKP1hmIB81GV
         cX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203092; x=1781807892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+qgmHOGmRapWq0OUXXvIAYW2o7E/H8TFKc0cwHnGMM=;
        b=aarhomlTJ4dCOVnCvBKvCrfQrrIEtJW/foWM7/te6wPbh0aULRvhtPdse+bhMopLVh
         xi4ZtJy5EpDf0hLdA1keFJLQdvYF4wehnAQFR2TDSam/qX2uSY2hpWHgJ/Ij/tUVs2dY
         skRvWhECM0+88MmUxAKTC4zRdd8bhnYpLbu4OI3GnDo3fw5Z/kF9jpwwX3r2JPNhGeMm
         UqVdmwnyQMXzWZYSyLoCeftZ3zRzy/JLCErwpGXYVPIbaT4qhBCgQ5Umw0K7Xo2iVoH8
         /vgslM+McbdC4D8ZmSqLBpAH2gOM33FtMK5B2wjgXXLGqj4JQaTEwT6gcoMuGrQQGKWv
         krkw==
X-Gm-Message-State: AOJu0YwaVe5aeWRNwFqvL53GS3Py8XtXVKSwXsUyfnWKL13iRJsgjaFm
	24mDEhtAtB+2o0K++HoWgadNgmgEUS82Bf+ZOTdvkXUo11JEIayFiujtU+yscRptcu59wzTSd5Z
	XTauLRLnYVF+ftPaR54aYU7HFFRZ4CG32a66U7w/F2r86g7nZA00jC99sdNzTbmeKHT2a
X-Gm-Gg: Acq92OF1FTJlEEEz33qJ67IG0Wh8cia8XyMkFjBuX2iDs94jaTtq401L1XO/szhKAZA
	/7xNxDWVXmnFlc+Wu4pR/VO9CIDSNybtZJvkigw64xsFs53BzBsge8R9awJnxqYDEoXl1bcsT+n
	mxWgpb1jUhUKj10MS8RNMj7LpR39GxfpoQtD0/1CbnmvRcLZozLS8GNIF5SAz9j14gtEeL5Chhs
	Jdrds4GXwFnHWwjX/KJbfn+dGhpfqE3k4nMcq8hMdyvbSveCh4MZLkXVFEivWznxJnQxRauDFM3
	Z3En1Dmc6zcwn7no5lEK7Vv9iZkEYx8RaoUwKumMm7UbYzZ4MtVyDH81WyIGmjxqwsgi2s+FI6v
	Cw0HhsKviuU6sOyquuxvaP9UzszRUoFHJEnjbgf5E/xYcCbXnaQs=
X-Received: by 2002:a05:6a00:2d9f:b0:842:6e9f:9dc with SMTP id d2e1a72fcca58-84336a9eda9mr4743098b3a.34.1781203092255;
        Thu, 11 Jun 2026 11:38:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9f:b0:842:6e9f:9dc with SMTP id d2e1a72fcca58-84336a9eda9mr4743069b3a.34.1781203091712;
        Thu, 11 Jun 2026 11:38:11 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:38:11 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:05 +0530
Subject: [PATCH RFC 9/9] arm64: dts: qcom: shikra-iqs-evk: Enable both
 ethernet ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-9-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=6213;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=myQOn368a4bEJkBKFi/AB/zdqSpCAE0Tjjhf3d8zs78=;
 b=6L7bDPM92n1GA/dkSKoqtFmo6gyQYaMeE5heucZ91kgX9VpAsVQwHgdprUw4av+2T6FNB/nz9
 +AyD4snXWCBAXT+Z8d1k+pmY4pSmAWMuwqYKYRYboWPIa4RtjbLydzp
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: NY_L20Cs4FDKGNWtLgQRtiYk7GyI5xlQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NyBTYWx0ZWRfX8Icwi4f4yZYW
 ZUDOqhhmi/L4vxYLCPtBlgVYshCja9T+G7VmtxllJo8KO/K+NIjaXS/01gGI/58+whzkB+XfiNM
 8bV8fCMOtBas3v0ps/m1LUgz1AmyvYg=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b0095 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8zPImXEJHl8ypWhI0nAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NyBTYWx0ZWRfX9RjUzNbKNlSz
 DQf7pX/UBAqGVKFIcUChArQo3bX8pGO9f6+u/SmzCWBcUYBRggGUU+fh2YlCs+kxwcXJUzER1fG
 kr4qdb+6y/ReGiNDj8PS4mjJR4LCFbEy2CojNHdSQjBC+lJNGWHrsh8nnp2q7oq8ChAS+uMAold
 7t4xBOXkhYSM8UgLkFOTTudnsyArOgDTc8ouFd8bMp7zFFk1Uh0vyxBGXf8YXTlj5AhYOcnXj/t
 8uZ80pxuVeE0Rb8tinTmnVj7ly942s/RE7U4I7jx4cHagB8VdwPcjRBSo2eqPoXl47FaajNS4VO
 DsE1xua1IZGOCa+fgrp8Wjh4iQnxr/UOrx7Iic0Jh5ps/cDP8UK9e3a5f/XrOnVS5hn9SpHJYcF
 ig/yaIgLlb7vNTOk+vli28idmpV4FAUFMK9HAdUDzQjYrXRdcBkJ7naxp2seyLr3x0q1tOb+lab
 xJug+LqpxqVZiNTEviw==
X-Proofpoint-ORIG-GUID: NY_L20Cs4FDKGNWtLgQRtiYk7GyI5xlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 125D5674856

Enable both Gigabit Ethernet controllers.  Each port has a dedicated
PHY with a gpio-hog to assert the power-enable GPIO at boot,
pin-control for the RGMII and MDIO bus, and MTL queue configuration.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 235 ++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa8179111b921bf3bacc08884b84fb..d69b63dbc8e44f1bcec064564236ea23673bfa1f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -68,6 +69,178 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&ethernet0 {
+	status = "okay";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet0_defaults>;
+
+	snps,mtl-rx-config = <&emac0_mtl_rx_setup>;
+	snps,mtl-tx-config = <&emac0_mtl_tx_setup>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
+
+	emac0_mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	emac0_mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	status = "okay";
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet1_defaults>;
+
+	snps,mtl-rx-config = <&emac1_mtl_rx_setup>;
+	snps,mtl-tx-config = <&emac1_mtl_tx_setup>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
+
+	emac1_mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	emac1_mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -103,6 +276,68 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet0_defaults: ethernet0-defaults-state {
+		rgmii-rx-pins {
+			pins = "gpio121", "gpio122", "gpio123",
+			       "gpio124", "gpio125", "gpio126";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		rgmii-tx-pins {
+			pins = "gpio127", "gpio128", "gpio129",
+			       "gpio130", "gpio131", "gpio132";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rgmii-mdio-pins {
+			pins = "gpio133", "gpio134";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	ethernet1_defaults: ethernet1-defaults-state {
+		rgmii-rx-pins {
+			pins = "gpio137", "gpio138", "gpio139",
+			       "gpio140", "gpio141", "gpio142";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		rgmii-tx-pins {
+			pins = "gpio143", "gpio144", "gpio145",
+			       "gpio146", "gpio147", "gpio148";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rgmii-mdio-pins {
+			pins = "gpio149", "gpio150";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	emac0_phy_en_hog: emac0-phy-en-hog {
+		gpio-hog;
+		gpios = <66 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac0-phy-en";
+	};
+
+	emac1_phy_en_hog: emac1-phy-en-hog {
+		gpio-hog;
+		gpios = <53 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac1-phy-en";
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


