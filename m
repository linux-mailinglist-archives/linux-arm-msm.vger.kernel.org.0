Return-Path: <linux-arm-msm+bounces-112356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FGQwDaopKWo5RwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:08:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C1667A75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:08:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SzEek9sw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RJwYxMzW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112356-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112356-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5A833044067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C023B3C0E;
	Wed, 10 Jun 2026 08:52:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBBA3B14DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081531; cv=none; b=gXu9k3S2Y3JAuVy8DEiYdEetRjiKZcsaAqxYe9OT2bGb4TIdJEnT8CJBr5Q0RcqGqkwwCq+n3XiU+fuQXXsDU99rmswE7saleqiSirm/UsQNjTbhrerQbUO1Wc7xPIGntYv7kojTquJ/Z048W8rnHrtCF1S3cQYhfGC0ARDZgCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081531; c=relaxed/simple;
	bh=bAPfzRfBHzCxb9s+4et3S1Cn+8StBrf+NqoLHGPL22w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SD0Yfivs443HWw3sdBACrztFVokJTF8allgkDTdAUiitZh6vBR5lgIXv+Kf0ehXkBDqBafPxTi//HXRBy1BYjhxr0Bmcd5z0wysA0mUf2Gd1ZG+ZZuTFoqq401sLU2a6Z3oya9GBO9+wnBhGtk9VLMN6BIkRaUP/mnmp9NYBI90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzEek9sw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJwYxMzW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i01Y531853
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=; b=SzEek9swZ6J6/ECf
	bKW7lZmkdXIvg+fvKngL654mtW+IW6hRewwFFGe1BEfdD5UvcT1yxSJWD5SYImFO
	U1WDgy01dPEfig5PnVoC3ZwD2BE5dnjam0v5y71ssCYLciYmLgKyaKgTayxh/COF
	RjPs+C/RvueYvUBvj43UujPxevZdhtgjdnJ3aqUKbyl5iatOXlZCvNmI9ZzQRbrE
	pQ1i0j3XN8hoM0MzzFfjLnqmEXKdZRDEgjFalu+YPbAxMV3t50b3tWYM8f5pf/As
	WU5Cek7V/jBnLdcnX5s9TvRDNWCRK3X5IBCbohs+ViV72OkaWA19NDk3N/Pz66o1
	+BLruw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1rydq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a99db8dfso71159105ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081528; x=1781686328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=;
        b=RJwYxMzWbHeanPEgJyXPhIUm3qGHmS2mIVY1CeLtZ7UkJR1G4siBptg6POGIRbqajm
         gehatadznmy1DpG1GusmJqpYgc9/msKLpoORutKbqA4iS48qScUx3cfjAj+JSc2dLrqd
         v9mCd1MqsZLFer5xQEw7R8qLD+v7e/rnGrnkcT/uMOoSP+ybHXXwZeznsceUWSt+tQ79
         R+F2PiNU5Z6BEJIDTR3HbN20ZWoa/+Z3x0jr4gKtCHL5ddkkZEzTM6clVXotEC0N41eO
         IGPk9XAMvzxb6KyL4fCuqizofpep2KtBK1hWMiDeeBvK1KHF7mdJH7g//rvqVuA9s68I
         wnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081528; x=1781686328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=;
        b=bF4wsi+F7dK01Tw1BY7F4eByxAB0turmFwnlh9CNjTULchXv7M+haHh2pVT+bMu5dR
         5s/gkfiL2o0rfPEgIhvW0DXD3cC+rmBrbkHfS1HuR2S+ClKimfh25eBhf+0GFx/Fv1Uw
         l83yhpXSVBXs2ynuFGCBO0bde8b1NwjWeI0Oe2X7UOzZgtdaScNCR2HspfHQHg1Hn8d1
         rigdoQM4QXco29h2EogSHs08bgF7F2Rmbp68tIqOyTLKds+bRjPzBcK9gX6GiV68oOFQ
         rWrv8D+yFDJ65vGue4j4P/TiFUhuw6RLEbrHki5mwJpai/Ng2gkZKsvxeMnr3iLe5jEX
         uB+w==
X-Forwarded-Encrypted: i=1; AFNElJ8Pg1y6/Hd5bQ5sBXXcDgygnf4nAEMg2Z89nNzszi4n7VZzRZbKTu6S75MMbPladb7kjqqOWbV/QRypNHx3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9tvu5ULmD+ALMitLD7WdrH8+bHzFFoNxiX0V3PA4tTW0ppePC
	35V9AnwQ7J3Ndw4GamCdvsCXC0Vf9RSY1ExDr5bvK3ixGXSG19iSUIFHNA0cwtaO8PmGcDfW4Po
	ZR/YMIrbZ6MgVTl0RQEgKON90EU4oVd9O8s0kyl5/TixC6sOXw1LB2z6Re/xa4/WgjJXc
X-Gm-Gg: Acq92OFmVPYUjnPnlkudRkCT/4LMezGeJQNFy4TF0SEG8iH+D4HpXnB0RxXJ7rUpxAK
	LtYBCHr5204uDOk4cclhxltEPxiGTQvG1QAX153rcPvF19YQSKciQZtMbdrEiPK9YH41k7NNM+4
	ORXeliSHDea5CpItUm6RqYEOwwC2OATCY5zfDqWkShNZiintSuV17N0ICrXiJKcwoyhbCdw7Lo+
	BD6Aqs//DVszdHaGnrwT4Ql4d32T4uTZjX55DhpFlqh3mFfWMTRBXmsS2KMK49c3SRRdMrpLNSe
	o204JlLWpb7Zl0yAMDAHw8k6pBODbWcmGIGkZmp4ywZl/QIvxc1kLO+O03h+NUq2HQne2TShsJD
	Ay2mBPdik3hXTHi5mSSzHFmnaUgDGDi+gOmojkyAg4vF1z1q1YKAVGFDJnuRfwfyuKMqf1qkayA
	A6mWYiPER0oUXWFy7C1824l2NVkNp9mdwlOTbHqcwKuPb6zZV9KkZzPZDxhms=
X-Received: by 2002:a17:903:2b0f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c1e79f68c3mr292218075ad.9.1781081527648;
        Wed, 10 Jun 2026 01:52:07 -0700 (PDT)
X-Received: by 2002:a17:903:2b0f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c1e79f68c3mr292217545ad.9.1781081527194;
        Wed, 10 Jun 2026 01:52:07 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:06 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:29 +0530
Subject: [PATCH RFC v7 2/9] dt-bindings: firmware: arm,scmi: Add Qualcomm
 Generic Extension Protocol
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-2-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=2124;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=bAPfzRfBHzCxb9s+4et3S1Cn+8StBrf+NqoLHGPL22w=;
 b=3IHb8xgfodeZAAvSCSF4qHqkSYryDWxcbJLlvj9a0b0v5bs3O9BHpGV7cJ0/YiWVycOereh7W
 bssXFnSFdxCBPUYH+4pHumxvGDs/0WVyTQFrYVc92HPIzicZlQHM4pP
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX4ciDu6Z88TmM
 U5YfuuuahO9mnD0C1GB9iyIQQxfnJezD7uxSalwsvFo9gYo1OZ6SVyhx1d/3XpauGqACtefdblG
 veAqHCAecOJRS6jdjy8oWxLMiFT/hca6pYjVniE7OrVc+a3EMhyqEnew4XGUBh9Um4As/Wr/MqA
 ReV23rJrmDWgtTKd8UxG6j7ubUqku8dkz1WXWJ6srhgBR5ZoCg7kTAlFh5Lk6oH16K+Sn3pb4/4
 t/kkku+Lv1NhRlc+wGCbE68p5pEThqXwpdQgeEReKPhxpIdLNBNX/djuy/ndg754ZOUz6+xoHUw
 jt86uqwDjukkmxmn694zENvpF7H6i9GotSuJwEnFZbX7jPcoNo9enHTh33LSI2hGwzllDJtCpUz
 pfbhBqYVz7sZOswFXPMdXzsPI84E9KmiX/aohqONtFcfFO974dLNU+CIH26o2yQDO6u14gWMmWM
 zvRinC7kLJeUqb+Y51w==
X-Proofpoint-GUID: XpX3R_aavNSgwYoOuFahQl8aGFl09OsA
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2925b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=4P7DloUKvxegLOL1_H0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: XpX3R_aavNSgwYoOuFahQl8aGFl09OsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112356-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E7C1667A75

Add the binding schema for the Qualcomm SCMI Generic Extension Protocol
which helps support Bus DVFS on Glymur/Mahua/Hamoa/Purwa SoCs.

Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  1 +
 .../bindings/firmware/qcom,generic-scmi.yaml       | 27 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index d06cca9273c4..aedc57dd3b38 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -24,6 +24,7 @@ description: |
 
 anyOf:
   - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
+  - $ref: /schemas/firmware/qcom,generic-scmi.yaml
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
new file mode 100644
index 000000000000..077653dc1cda
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/qcom,generic-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm System Control and Management Interface(SCMI) Vendor Protocols Extension
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
+
+properties:
+  protocol@80:
+    description:
+      SCMI Qualcomm Generic Vendor Protocol which exposes a number of
+      Qualcomm SoC specific features (such as memory bus scaling) through
+      a mixture of pre-determined algorithm strings and param_id pairs
+      hosted on the SCMI controller.
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+additionalProperties: true

-- 
2.34.1


