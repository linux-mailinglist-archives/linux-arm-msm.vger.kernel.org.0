Return-Path: <linux-arm-msm+bounces-114393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J8/GDqArPGqBkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B366C0E56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U4KSbZkU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cl5r1X0j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114393-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114393-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8BBF309A4BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9103403F8;
	Wed, 24 Jun 2026 19:09:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FED433FE0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328152; cv=none; b=ZlDjorD2ckEz2VXsc0qEZVfaLvXPSySBr4m/AinaaMJS5JieKhUVGfiY/uo0GRJvbZnQQ+Q/bJdTkvWcczYaXHiH8LQyqY6BXpRRhfTY6FrYdoWfp/BKKfVu3u+JAto5SJqThwAdYff1Qoz9RgGHDc0ee4lF/XjrxMXpOWPHoM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328152; c=relaxed/simple;
	bh=XdtLEaH8dAtuQySt0HvTN+uaOVEXsxsDNrDz292Keds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk5Mt0a18crjA2lCnbhq6PCbI7Q2pNKg/lfffbq8KXFhnKIUVUkFKD1ARzOe5kPc2P2OPSLkIuBYhxYVZczePuqlwtn+8jayhkLw8HySdxfXMnAm6786I9t4lq7wLfY/3stFCM9NP2DwlWoc/hruU4NDnfXovasx1jOJAzOBXDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4KSbZkU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cl5r1X0j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHit3g4057289
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C7P1pQrIDHm
	k6wa5FgU9fsIfcm6sy9xqBHFINxP0Lss=; b=U4KSbZkUmdY+Od3O7H9vc8NF8ai
	JVl6cXevnj1QZSNiAdPTavZ6mdW9yMIvQzIYxZWBSUGdUCQHzihQ4s4N6SHXdgCh
	K2Bi7CNMzqunFsoFwc9Q2vB1oa+Jaeg+qZMnrR6cvZ0dYeGNSJdqdq2Qg/LDfUrW
	qR+LgkyoXGMKkT6RhIVZs1m1MdEsdIsRA09oXCosn8bzVpNMmwd0GNx7tcqL0qhP
	36zNRjSVrEJ8s1ZstAyKaxYOZZU22q3GozaLzRF3LLqAvWqerzqvoTxKd9hAP3ui
	WNCLl22328Ricu8gePdmuSbzM0vidINJ0FQCq9sKTMIYkqf3VKwHedOK9jg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g25pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84256bee9a9so1076805b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328149; x=1782932949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7P1pQrIDHmk6wa5FgU9fsIfcm6sy9xqBHFINxP0Lss=;
        b=Cl5r1X0jXgDGJQu6VdsbmfCP6wpGeR5bVow3z18QwHhihu2Szz45Z3ZmZFtd8mmKTo
         hdjfktE4jqnn+5LvhFVkDRJvZRjOAsSN3pGKWtAPMJCv9lS9YMC4WN725Mf3klbcvUHJ
         iecKNkrr8cWsYXuzRb6dJVye2UQJoLmL+wv6mrT4juEZdbLoCRMYtixEqcO3CHxIuBs9
         pAXFfon86jKX//SWhkU7Kvy2CXKXTVK6qnJ3wWl4gZuimONn87oBZmQbYijxUVBrkP5I
         dE2qJjeeHJdrpYd8g1C9mhvc52XbeXzyz0F49GjLPBE2E08nrJzzRCgkyuwYAUUXuyon
         fGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328149; x=1782932949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7P1pQrIDHmk6wa5FgU9fsIfcm6sy9xqBHFINxP0Lss=;
        b=KLCjaf6ZJmaDyhK3araBmdM2Ygp5NwiczDNMv6EFQUgBuGD7pm9KZ9oChB0cO5l3NL
         8gTqJJbIWDyTB9kYDN1sw2wUtD1hmTGbDlfImHSyWeincwg+gNG8JVKFgu3Kyc5mSERU
         RYD466kqLQlha9jsCmtn7HpqVvpVSvJ3KEc2tFn6URA3YETX/Rj0KOQcJGgl6ktLXtnr
         az16DAmz6Cu9fj0WVe+vjgQPn745+gTOXvJcVKjujFCW/zrV5DYUgkYVpcBxDHkYFF9A
         Bf6BdBWsesME+wC7YoCpCDlN3ya1SqozSn3oD7G+uitNK0VlxbTrgy+mvc0yUMLjsULl
         FgRg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8u32saAv5dbY6NL79/MNPkA3COjZWU7wB3sYTtNsxY7kgtbARpm5uR+XWSplKC2aA4O+f+9sO9TGQNF5U@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrp0wgB+56D3KMB4SY1g2rZ2Jnr+NrGJguceXrQbFwrWMsnHTL
	ZLOSG4e4rbkWY/2wZO36toHBibHKmnhk3u8yaDvwc6zp50u3AXP9wwX53rCt7dBqVxSxuJc309a
	GcPEhUgE1AF6u6ZWD23D9jUVaXF4K5kIu2i3PGRTUZNBQcymtPYd5jbc+A49hNFjRb0D1
X-Gm-Gg: AfdE7clYkipQz7GhDEHZTIVY77EOVG8fTJFbkC3eTvCpYIAxFxErMCL8qYtYHukNZl8
	Qoul3tAXUlJ2pLc1VjGrSp2tn+PVjxAl8xc1bRUc189Mx7exNUN6iHu62LaxbHNVJCGcAydy0eT
	H9TA8N7c0f1mP2efKQCsSZTGASNz8IIdTXHJWslmoH6QGFbU2vrNrh7wi2+sm57rwWt1Y9URkPC
	i1NrCAL9Nwyk4BllCgqiMvSNpWmnab20G1Nd/susHJmfU7w3uth6ruFxsyiFZsdT5qBvbpz6ri+
	5Jab/Z4vC+priDGc/xwIC47Ala0dseVnWxJB3HNEGo/amXbIis+X+VkRZgcCMmFcAjXnLd48WId
	zcr+pTrsSf+PIri2bAvFq7XcuvOjJv8DlbAxuKQ==
X-Received: by 2002:a05:6a00:23d2:b0:842:6a3b:60d8 with SMTP id d2e1a72fcca58-845a27afc4emr5653687b3a.30.1782328148810;
        Wed, 24 Jun 2026 12:09:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:23d2:b0:842:6a3b:60d8 with SMTP id d2e1a72fcca58-845a27afc4emr5653663b3a.30.1782328148290;
        Wed, 24 Jun 2026 12:09:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 07/19] arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:18 +0530
Message-ID: <20260624190830.3131112-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3c2b55 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: su5lOlpky2HiFfYa4T2URjJNLh8PvIkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX7KEBDnjZsZ6L
 F885IkbhjlTOetrsAPTskIwZED7IwNqzMO1m/GxMU8FTJ6WqyZfijK+aqayEUGT19Ty+r/AkJmz
 d9v4MicGbq28uc7liSC4xjjss4r+Ohebw2kyiBO6lCXhvXFAWGHWZBaea7pi1F8gGXWYCkwnAoB
 gi6qu9reNI7sGlcqRq0TZq2gBJ/wplQY3DHOIcn7y9qny18C1dYQPxkCcxgJbjij8UUYW96XA2+
 0xvC9KLDr2j1xHniXyD8AvVhiZxP1HL1kFoXPDJult3y2V52eXWKnS+D3B47dI/dC2Cw0Db3sfG
 bTQiBCcvPxIfSfITK4/cdo91sxt/VaNdDlpL3ncCDalkHGJsDw8o+AKlBshVSyDfqGefQSB5wMM
 nhiA36rHC4zChCIXyy1ckSSduj6HIkGqEcEiOEK92u96peQ9W65rlZCTMvi97LXUeTeD6YBDmEU
 d2kmKI4JwoaHpUeZE1A==
X-Proofpoint-GUID: su5lOlpky2HiFfYa4T2URjJNLh8PvIkH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXwBayz8nhuD4s
 LyAqeDSzVKSf7pwhwPvfMR9m0q46Nd8ylzYHVSgk90woP0xKdlTsGc9RQh3k4nrOnuLF1Ant4rg
 pbR6T+C+JNED312P5MDH2CUlKRoaGvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114393-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8B366C0E56

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 56cb6e959e4e..f819b4f7fdbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -479,6 +479,7 @@ scm: scm {
 			compatible = "qcom,scm-sm8450", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -4978,6 +4979,10 @@ sram@146aa000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


