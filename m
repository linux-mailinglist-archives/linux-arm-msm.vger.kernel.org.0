Return-Path: <linux-arm-msm+bounces-101643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBZtIIPAz2ky0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:28:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5C1394742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4DF553016AFD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D183BD25B;
	Fri,  3 Apr 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTYXZm8V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDWOb0TS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF933BD22E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222898; cv=none; b=tIho+0UuOeAEeBtJq8qrPQTECAY75GGZsDDVivCNjI+SQWkFoO/87LCgSkAidJ/E7DG8pctLkJsKkkVrT7knophV66b1NK4WtRxtY1Q903k0wpYcPU5jHDGnuAWHxfetisgUV/op2NQXlspFXNcDiqsmmNJFYO5jNi7lQvcTsRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222898; c=relaxed/simple;
	bh=3FqArm6ducrKvDNSSWuM9bYoDvaA2/NRgRn2UlLkR04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcYe/rlYD8hANjRwQQakQongpez3V+Q0jza8wfZr/TjaCqRZt8yBi92AJw87q5XcL1TntKzaJT0tjBgIQgX8WLyJ4GTI/Mjbywox/wq7WMM/EUXxQo+2ZeFpI3MPqU0qnh+p5R9X6m+WjVCpVPaPCfwHmV5JgpIGoIw1s2aVPp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTYXZm8V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDWOb0TS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1dLa1453172
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 13:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=; b=JTYXZm8VlV9xTZSb
	WieYYQPa4WXIOQ9pjQzncDBSOKJzZtRb022tnc9VRZssAqqotrIomwvqivT4s2Bs
	e6mr/NSpbAFa//fjqRZBTWzWFXRb0M6qtC+4EC/YnqL+NlKG7GyKP5kfJugtmwEU
	aenO78KYtXBSfyx4MF+wJbLtQPPCt8XElp5ZVjVm14N8mIe62i43Bdu3PIBMVqTT
	3T/pwNY/egoK1E5D4zHMGv7TNdy5fhTNpSJ7R7+CN3bHBDknpZtYY4EfDjdOmJLM
	/VV462n6VfHSilS5yFvINfKrU1iSfIVk5Alxpvt3g46PPZxwH7+MnLnTyhNN3jNN
	db5PWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam8btd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:28:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5aa81907so35894041cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775222896; x=1775827696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=;
        b=cDWOb0TSW+fUjQNlYd27R1xwJI6wgf1yzDMO1cEgFP/J/LZvfX8dKaCPPwXBIXwq86
         WCWYdBQndCwOsYza4A2rxPiDp7zEinis/VGhcctK5PAPHNrbAO0FotOUxo0fniabYqaE
         vZXXEP8gmV8WyZZU8iF7ssE5ZDyxNgroOErkf7mUt3wxeqJ8Y5CkJMNmKCeuI90+ezlj
         TJz4RjtIVIt5ZImEeAbwtncjVIN6FEdhUM6CK+saA7Whp2vLJmQj5p/4DOMqCZMkDTcv
         LjGXlngOWFR3Lr4jC3FaeKuVkl6z8PWdT/LifulWMwC1DKuUDy2q/rsc57DpjMBS6ttS
         VYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222896; x=1775827696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=;
        b=EaMzaMJtm64HQ+A6I+2F47xHmXDXGwR+cXkmcvcM2cxtDE1QQhpr9Z/VpJzQY5mL2l
         jHxzc+rB2o1Vu8HUbXIAxMQP9W9PpM0GaF7CiIVmP8WuH2kSubjMPUPwzydGWwRmIxq9
         YwfcUpV9pAfyIIbFUCabHYsw12du2Y+tYjvbUQ2OIwITaTz3Q6jUw5+WFMDedrKFcRMq
         5yjY3PG26quKZjqH8wef+sWVkVKsxoWp82TAU08z0G5GH2oQLhoHXcwGgJGoWS7vDaKV
         +uOXSQA7zBGVuSvfKJAxvFpiZ1bcSA7OuwD5Fgt3qbV32BufUU3fqFMroiWvySgs5x+8
         9fIw==
X-Gm-Message-State: AOJu0YxdL77hcygqTWsnXn0Zj7h2IoW3t3gff/vEDdpauMRVoWP3GdeO
	WUBV41WqD6IsI/TsW+utgDu/iBXf6NWbzycN3LMrOfszuCtgXpqtxy51CzulPTBDr/H24J3EtuT
	l1KVPaI072/B0nkriRm+gtEaznGZoEaUTQCmc75aeV1PHicVI18BQvyVq8GhaF4b5vXbz
X-Gm-Gg: ATEYQzyJDY0LQM3iTCRvXKsPDrcm5BRc51jnwr49DMipKGWSWlbSpXeBPVsDSvUyFAK
	9/+oo/PwrwL6Vow/a+2d8h5vVWwH/ZlRSwaHUgL7yov+qFzlEOFs/LixB64InHkIBP/bup6dVT6
	u1SG4kGzHUoB4zsB7I3Icvu+EbsdRmSVbQd3SLTBR8r/CWXlEhKSOQ4fU8eKmqvHujd+LoafrRq
	UsuRO2PClA1WzVnNp4H/1E5Qk7NBR2Fj3b35ki/UessDdnH6ZX2RNwcFobZ93L91Hq0ah/Qp+c4
	jFIi7XVCEoqHjmJrI9BLy11kUTA3yOhGbRTD0Mtdzf1Z/XmJ8UWLJ/MrqrZlGTbU7xw/MCJoe2D
	vK/YaPPjDo70Z8cV8hufJW55Uooq3uDXYST4aeb0c2IWY2D42CiTF
X-Received: by 2002:a05:622a:7b0d:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50d62ade51emr34034991cf.46.1775222895971;
        Fri, 03 Apr 2026 06:28:15 -0700 (PDT)
X-Received: by 2002:a05:622a:7b0d:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50d62ade51emr34034531cf.46.1775222895524;
        Fri, 03 Apr 2026 06:28:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980e312csm22224685e9.7.2026.04.03.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:28:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:27:57 +0200
Subject: [PATCH 3/3] arm64: defconfig: enable the Qualcomm Nord TLMM driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=707;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3FqArm6ducrKvDNSSWuM9bYoDvaA2/NRgRn2UlLkR04=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8BmDuIUv38Cns22bL23TDOblBcacfNXQSckj
 dqmMKbq4BGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/AZgAKCRAFnS7L/zaE
 wxOyD/9G/LHLAEtZs3ibuVDoBSdnT9XkYYPrYW4IeEO/z2Nia8G/dznLrRzV1uFgEa8XS+1kvch
 pIwz7ha/n8qc2CK3NiV8zShLOOz3zvdNOII8KxJ5ORea9jK2jRF/YTh3gluG7So44iu8fosSShX
 +q4v6bTAY0NyHhM4yBbFdSJlz24nCPeDj/W818LUk5dvsG7mBPqEs7xy/GiNz6LcCqXF2z++i77
 18+14TTO5mM8ZK5gJyHfyPKhkoEd321lyQpZQ8xyTr/YXamtQQKlPlyfN7fucWDEoQsGZrCjbPg
 QS/3rFyGpvzhynv/N2dWQdayWbdRwcGKIk4t+HWEi6Taagy5PtQvLLLBY9uFoFr9+sR5IFjEnI7
 +MryWrAKeQtS0A32f1LG4ZgG51djJEVaCkX/6StdRLWTKsbu//2rf2pNvlfL1wqZMYypYtCWW0U
 BZJv4C0enapywhUxcsQuNM997aDvxyoSE+mCN3smfS66u3kryCr1F66HQFmVb7dEJ/pHnhJt8GS
 WtT3NDsQtbJv7/M7QpAatvnVQSvL4U3N49PxcnwCZHB8dI0oz41aDe6B3WbcsDZ4TlWlR/ACYMQ
 87JVZwVoh7Afk/rM2QzkL29Y8K+4l1z0lLvljQyue55xMbW8iSEg8rz43tkasFMRsv4bZiZt6da
 3iYak9iwthM25Bw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: VY8-2UzC5XY-UTzf6NpWVkjduvyB1XyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMCBTYWx0ZWRfX0XtWkZriW8Sg
 XQoxSOC1fnZ8NASyOJtgsQcCh7XYff3x60ZMEuC1SAGRasp5QEQcToeYkH94+taCKMz7YFxyvpg
 x2RHaQmVmDBlzXHZTpzsg7aDwkMURG3p2IfffXoYoQobqACDTpf8rLI1Ncct7mNOMBIGaMKNK/0
 qY0Y1I7bAvUjE3YgVkX+b3N/8xDh5bYs4E7z5UuY4Rz8tlLT55fijJLe/DPEIGFfubRw/+d6qNq
 w0Bh3Nj/XpGW2rXTjvfwaoA0gkXqottntDtxGVPto2CSWdMBURDYpdMZ2307q3ov6YLTnQrKnbn
 m2Cvn2xxX+/TrQ0AaWzHi7gf4DfctHnNlHIKpyew6UKzQqDnWD7HYUI+n6PSQhL0EkaJmmyNcv3
 jzmCx13TIRWMJ6B4EFWuQpmHTsPC+hm72m8Om8ROyMy6yDvQI21Q2pXnAFSYDPOZYR61QOAQ5vL
 VGghsdPzsNaCxYESAmw==
X-Proofpoint-ORIG-GUID: VY8-2UzC5XY-UTzf6NpWVkjduvyB1XyE
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69cfc070 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_9xgnikUNuCcFz_Jzt0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101643-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F5C1394742
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is required to boot linux on the Nord platforms from Qualcomm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 163b7f0314c90fc45eb6c4aa5e8faa549c60fdf7..31f8cd7cde6fcc8c8da8e69950dd4976ae04cfc4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -675,6 +675,7 @@ CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
+CONFIG_PINCTRL_NORD=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
 CONFIG_PINCTRL_SC8180X=y

-- 
2.47.3


