Return-Path: <linux-arm-msm+bounces-116891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3iJ4Fiq+S2okZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:39:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09E71214B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:39:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f2VylNJ4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jYbSvDfm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116891-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116891-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DBB330427A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8553E00A0;
	Mon,  6 Jul 2026 14:14:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02E43DDB02
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:14:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347253; cv=none; b=O4P5JLyL2bXoODWGAn/xstg+KFjawDw5LiBQEu/CxF+p2xf18puZ6ojI745f1cM4BKQEVYYSBuW6UFlR10AyVRXlb17Avo9jeM16jRWfugUODJzoLn38fPUwl/5b9wrVq5IRdMcB9AaOzFlOpiZqp3fbrJKhIX2P2mwL0zxSJKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347253; c=relaxed/simple;
	bh=7IahpDJ1DuYoTWIZqNSkER42hbvjKl/EcCP098m+u+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UZfNtqDf4m6190O/SOfv3B37yawMjNQdp8bkWh4nVU8EheZRsFgQeqO8V19gGLZ7WSWdJci1i1KcG0/6f1FsBTOf5lVq4264xtGjv7/mcgOLaKNbUPDOsZHpt5Ap/KE/j0/ydYr7Z/VnsptbPfPa4PI+FprPsbexSC5Ij2tF9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2VylNJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYbSvDfm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE0MO835327
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TqZ3hCm1GzE
	D6pYA/Tya53SWdZUTZ7PYmjRSA+N1iJ4=; b=f2VylNJ4PJcwfbHQet2xMKBluYf
	xpvxFCNciqNXs2ZZESftNeaQgie1n8IZuKggPw6Bzz6DoFyey3ZX71TY7/dAEI8V
	TOxWmcHd33Jys0qOT8BVTpYVFha91oRoWdOocmOABU7AAZkRTyj/BvUmqzYudfno
	XDkY9XzanfIa9cYb1n2UY5uUgXLECuoktyvS0BxYm4NjIQYk/nzfYkARiAHAb5kF
	aKugHA2rc2LEq+4DwHgzUlG4B/uSUVuxsntMeWvlw1grWKZjL06qKJiQk4HejfeY
	LbdIpGPoNJjOCyz+RTyCx9LnkIRWv/P9P8sWpGRFzjT50oStWwQ1SLH7adA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgs68m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:14:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so3820393a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347250; x=1783952050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqZ3hCm1GzED6pYA/Tya53SWdZUTZ7PYmjRSA+N1iJ4=;
        b=jYbSvDfm6xenWe30aWn+c1/iewJlo9h2s54/ajWtC/7vzJR0uHU2ecsVS1SFXW4NCZ
         jJJj2kaPbtDuS5TpnLXaJCV/H6+FrJLEgfz8xVU/jvom5/buBXKZbDnO+su/VbJWCyQO
         eO5PN/8Qp9pQ8MKjEQSD0t7vHjem0wvzugSRX7b6A8UjAg8ti3TcfszJW1NLE73lGGaH
         Uzbbkx3/0zKzotxxFPPPa8Kt75WRNP9iI6iFgIguQYXFQk4gmMVwI1taQ0aJQS/ghEYH
         hb46JtAXOqPOEGAlU15rARVLeBkSlHAd9wUgqoDif30JRMMqgPe3UuEX5NOqRppqchB7
         ct6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347250; x=1783952050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqZ3hCm1GzED6pYA/Tya53SWdZUTZ7PYmjRSA+N1iJ4=;
        b=jQsjRP7c1c4r2Owl5dKbiJSQpHvSNAb2HTzEVlKYbRih1Sd64J5y0Xrxetk2voIfCS
         GugBDADhWAAjHymkjgawY3jI0IdTsuxStyYxTU/4T4Ll7Vl8byO0bLzjzNzjU50J07dC
         KmEdezie+D0H9XYFrJhwZFj8TfrnCBxLO75IaN/sf0w8Vo3WH5WDEFT2Vs2SoVFM4BgK
         CFqblaKT5AM6KKAEdw7Ivkif8gbcHNJLLMUYulpOxmqlkxqDwrvxtuSe627sJLNQyf6N
         +NZFSPLUGXcW5G17t/vBRDqlnh77yKcuZ4UXIuJvzNjdGl7yzLmpjFBAV/p0kEj8sPMg
         JlFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqM8iOdKnRtbFuw2k2GgaVEqysCdan0vT4LYclaj++9VX19ZfOZCBVm587ULk3i/Sndw0zyKWB/jYcoDZVG@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNXAYAZwS0pgfPQKehuL+uQ3QJA64rn57boU9xylau/gQ6zEH
	JV599PUBGsp0i9LJwY0NxHAY/DzlIsJZsFsBZTYt2JPrL8dz+VLzLXhEH8C5YX6IbWaSiWla7QR
	r6vYr7eNzveTXanc2k8RY+BL9yMG5uvVoypUbjG9r2SDtD5PIPztZYbIoT2JJM0j0ye2x
X-Gm-Gg: AfdE7cl1UG0Y/DW3O5E6/dYFS7b0AYojJVvSj4CFru83yshNUUNrUHIbNjT+GQh/q7D
	TCfafUvZt5qFTP33oxfbgXSq3GnYp/VWFw7YQc6CkIQCVpwTCnfT6j9Adq3E6k/v5hadqmFJ0X4
	bLN3YpVapxlbVepFt5NZoiAd5AH2rny0UqT17PNsJ7IJ9wcQQlDEGtCbz1R/AN0DDfF037DfgwW
	GJRuBr1HmkbnBlVVFcH2ANpX9HZcFF+G3w90TQDWCV0xJ3TMzE7/dYwxAHxnyNx/nZhxU05Pt1+
	X6MEWPL/CHjJwJp0vfQzhTPIEgYbmOLX7REGky07Ca7/uHRp+2HULr4r1iuJxz8ieVjw6g092m6
	TYh/YGwGSfeV4SzM3Jr8GKi7caGf5C0deG0KZtQ==
X-Received: by 2002:a17:90a:d003:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-3873dc644f8mr831046a91.10.1783347250432;
        Mon, 06 Jul 2026 07:14:10 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-3873dc644f8mr830959a91.10.1783347249787;
        Mon, 06 Jul 2026 07:14:09 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:14:09 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
Date: Mon,  6 Jul 2026 19:43:44 +0530
Message-Id: <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aZNpGX1cohgL9TkZPTRU73JreB7TX_eg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX24dFKqo7rZED
 pXqXSya2UuhJQrdrNxslgvsAdkG1Ysm9Xx0qxaAZv/RhhJ60M1RxMMfGm4uSU5o7JsT7RFikrG8
 /HlNJ2SdXtz5EDEBsPU8sUBfIcn6drb5Qh7UV78F2Pg37HoZK8I1GIzwBoEU5xQp2ujPVoath37
 vOni2hdddyeo7M9VofYR98dO4yC7jYRpVGHtjlWey8gtQRqPDWbFQge8Nam7JjYBKbK7ab2oS9k
 D9pvZQt6QsSMLyvnadXpJucBmvP7OMHbmAyCYgBugOD546RdLVg4EM25LQsIUHtjA/e/bm6Uvof
 OVZieCcJf5ZxnXDKzBwrEmW2VS1FCGCXc0JRmJsZA7gDjOyzTDr3xsaSsk3cAXjEk1OFdANOC0T
 8TSZEG/aRO2JuZpaWanrbH5B2SFhDp5qtppQleDNN/aAapFdLsdVyZx9gQa/manYIUXOw4MtQj/
 +9qR439+XxtoBoNM36g==
X-Proofpoint-ORIG-GUID: aZNpGX1cohgL9TkZPTRU73JreB7TX_eg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX6CHJ0gLBa582
 zr1G3q5FSn6x6YwvqsjpnyjClw+4cx835pL/A9cTTVCDKxPQoPrQQ647at3HGFSnkrsZlCxiKGI
 4H2XnPVf1CLIGBuTA0qwvXOSYEcaH40=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bb833 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=etWctVU5WMrq8MRftbsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-116891-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B09E71214B

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
'qcom,glymur-sdhci' compatible as required by binding convention to
identify the hardware and reserve the namespace for future SoC-specific
quirks, with 'qcom,sdhci-msm-v5' as the fallback.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index bd558a11b792..6a8ef84617a9 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-sdhci
+              - qcom,glymur-sdhci
               - qcom,hawi-sdhci
               - qcom,ipq5018-sdhci
               - qcom,ipq5210-sdhci
-- 
2.34.1


