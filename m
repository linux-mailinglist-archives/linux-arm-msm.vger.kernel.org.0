Return-Path: <linux-arm-msm+bounces-105187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBWvLSDj8WlZlAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:53:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A93249333C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF4F430181A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186153EFD32;
	Wed, 29 Apr 2026 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll5u/ufO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cI5CrIze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AEA3EF665
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459956; cv=none; b=FSW5S/sTaxacASEIKly3s8XFoA3FT8PdS7/2mPvchw3jhg3zs1PrSXSOARMTdztBANQXIEw/LJA6V8BizOgqqd/qotpXTdu0pbTzwu+tVn9W4tfvJ3kuPHZ7mWOUJjDld01dcH3vtTVD0euPRg7p/+gB09zoPpxXYWkfLT6RPG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459956; c=relaxed/simple;
	bh=hpI7Hg/aEZhSjGdObruRDwA35829K1m3CN7LKanOqs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5+mPNsqpyTvdANbIQxejs+HYD1xcSHdQdGXov/TesxdfHF7qTMxWzctAEoPM9+J9223tHcmF4GIJ5/ke90+P2NR0tz7A8EYcAnIPtT4fDcYhfONJi/wCc6Jtyr7pp3fdcQSQCR5fyWtEwmNLWv2YXSy+lJJMdlPFomua3nffUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll5u/ufO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cI5CrIze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pv2S4001889
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=; b=Ll5u/ufOibdVwuSS
	Vw2k3UCUpWQIXgX1OsJorgkApyI695foA3qEdhqJlcEV5Sfo90SLtVQcx0i8AFEa
	CPHYGUqKNxodvBsoXJV9vbuMx9o90Rns8hkiK7elj6bfnrMRwqdCIYghwCJmaC6S
	05cRUaQ9USzJ8BIRy4XPNEJLtUPGLCI4ypCVbrVHmcBPN7XZd2rB6iwxpg//ftEx
	Wwv8oZ17CfqwihU5s5uNcoZOXFx81dyJEecQ/dfqBoTOar5Ms6gukfV6pLR2BLKh
	5QZWZ6F3tlaDeFRbYqSQw/gYH6b6p01si2txilo/uO9WDPkkO6nolaQKw01K2B3L
	ckgC3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em1u4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so117126025ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459952; x=1778064752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=;
        b=cI5CrIzeoOfL0bnfJjfg98So01vSzkbbbGU1/pBSev5rHkv9nFHc8Mi+4Zjve6Pppr
         qOcfZnrvGX0+2A81TSYqzCCmZqqvWWAtELD0GJ7iEUa20pNZnCYpcMAPucgbId0ILVJq
         SLdEKSH9sX0yuVJiN1OV0NqbnZ6kmmhl4I8p7OqYR1dc/J6Fc5V7g5GEOWz9lNuupqxL
         fpZKEPbinpa5+u+v2czzgVyUxmpSyEFY4y2YNjNOiYmxge29YgLiINpDETbT1N1YpTVn
         JiUW5uUft4wlz2KeV8edIlgmXvTH52PdC48skc9OmhUedOxCunH7+cNSr7qI5WprrUNU
         RGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459952; x=1778064752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=;
        b=epK+2VH0TpGCuxuSa2Rbn1rhuFwY65DJGH9Gq7r3Ts4uCVqL8n9LYOo4emO8I3G3UR
         ra8oXRLmDD6yc8JrfGN29c8LyGmLWM584MLxC+D0h0/TSi8iTQqYdD0ydxaMCF9AXown
         aSzGr9Czd/jKrekK8Mfsh44Mg0QA/82oSNnCJ/WfvmocyRsz/3YDZmjfHJOJw7mNfa6e
         Mpg1mPEyC5tfMqdu/0pghXdmlX7oWRQs1VsFIMJRYwys8LlUYFPT9LBeTgLuXQFGTGDp
         4U+4IpC0KpdCi2FwDPB1t+HtNA7hri8tzdAW74KgDBcWcBKSc0cPo018NopULgmtvSvi
         Ohfg==
X-Forwarded-Encrypted: i=1; AFNElJ9G+ztpQAel5vlEoB5i8IS9OI4KYg4SxNj+kN1J/QdN1DOO3t5QXmEGfaM2c/oCsJC/mlRQ45IphxXQTmsu@vger.kernel.org
X-Gm-Message-State: AOJu0YwgAhGdSQnlZGcxzD9+dK9jllBOHKptaUuj+Dp93RIlBgUzLTUR
	OnA37cUh9IafZ8XTiF8IKbBHtAuL/IOW0fWOkNO7kDdjKx8Og/87EVf39U7SikNC4fT2ad9tfZJ
	+mPWwdNZ937BjHcBMPWqRhn9qu6lYTkmspvjbi6PFFacEF2HHCs54TObpMdFODIlLY/5E
X-Gm-Gg: AeBDiev0jExDpBEzToRRViRYUYswSNLGl1hxgx5MuTLJHBSb2/CG8EieNGZw0esKt5m
	vYKGuw0vUoqoxnm5NnKbq38xZPpkb6apKZIDw/++jsQF5SP3csUZ3qRDHpVdLjyJdf7Q1QpoIRo
	Ns8uHIl1fE5aKVc59tQTmgic0v8YWuRJU90V1VMRwderhvgHTMOQXLS4L8XbHNkuJ+OpKCDMOVB
	uFvg/zdXQDpN9doU5LyJrfg02lLo+ztmEEgFXTixPlY3StxNM+mNC+srCE5cmukBKrII1pPly+l
	Gf/NgT1CjAG6fEhuer32Mg/hQBjmpGD/aq9Oyi/g4K2GTK27DeALxNlt43zFYkmYyfqobg6djMI
	fIRJ2JDcEABKTSlcuySuouEUTjxRPCYP8blTQ/hvCQSFupmi7kPK7b0NFFLw6cc0=
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr68504085ad.1.1777459952249;
        Wed, 29 Apr 2026 03:52:32 -0700 (PDT)
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr68503805ad.1.1777459951717;
        Wed, 29 Apr 2026 03:52:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:31 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:21:53 +0530
Subject: [PATCH 5/5] arm64: defconfig: Enable Qualcomm Shikra SoC Global
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-5-c3cd77558b7a@oss.qualcomm.com>
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1e2f1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kW1cseVQmWd4RU_XbDIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: HtXZqPON-33JsjzFj0GHwpb1N6ElU3aE
X-Proofpoint-GUID: HtXZqPON-33JsjzFj0GHwpb1N6ElU3aE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX1mkW8mbLuZB4
 lZ8Dy2UalMzh0H1hulxSxMFxMXwzHl0OYSlqintzcdHOpFov0utr87CM1GSjAGdEA+ofv/QmI0i
 CxMrwdxJVxCEJpUVF92C8jMQcunf9ieMYVcYkJL6qoRIC12bXtv/Ttn2wIy0V5VWLfkbev2/FYc
 gVViDEl7iTQgW+uBZuweXlbsIq5AUw4A+YUXLZ+rwm49Jt9YVwmOHo/BGzhsHTnIMmwMg6iB9iQ
 hjyZIMko3eyBpxVnZfxqhE+JB2+Pj1Yxtd+KH80TsrjGOPWoZTpZKQhe7ezqiA52OHmg9R/yrx2
 SsZGBStUR6gObchWfO+R9wfMeLkOPkgfk7J8m4zFpF2/sqR1+bphrYW1FmGRfFMSnP9JiGVIVKE
 jzA9rsMTCxqT8+ixNp+gl+JRbZDgKG2jXDZDn9l9z5iIofftHY68Ms1GcCcdzaFBybA48fnPEom
 ktdz31iXMVQyxFlWAVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290109
X-Rspamd-Queue-Id: 6A93249333C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105187-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Enable the Global clock controller driver on Qualcomm Shikra EVK board.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..13e04080b37160129ccd47b0148a64277b8e0e4c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1461,6 +1461,7 @@ CONFIG_CLK_IMX8QXP=y
 CONFIG_CLK_IMX8ULP=y
 CONFIG_CLK_IMX93=y
 CONFIG_CLK_IMX95_BLK_CTL=y
+CONFIG_CLK_SHIKRA_GCC=y
 CONFIG_TI_SCI_CLK=y
 CONFIG_COMMON_CLK_MT8192_AUDSYS=y
 CONFIG_COMMON_CLK_MT8192_CAMSYS=y

-- 
2.34.1


