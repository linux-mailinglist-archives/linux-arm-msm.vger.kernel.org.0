Return-Path: <linux-arm-msm+bounces-114650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7BioCgJxPmqyGAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:30:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B06CD010
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:30:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NYO5Z8JH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JM36XZy1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114650-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114650-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC3963004418
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B50F3F4DEF;
	Fri, 26 Jun 2026 12:30:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4609F3EBF01
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 12:30:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477050; cv=none; b=Q8fAcF+6WkZ0rjTunAN2ZiiaBSM+EC1uAS0kJwHdfy9IBKmkd7ahLp5sbbOPLfGiKbLlicGwkTTchUWUqAfmP89zFm4eTIuJ3x4w/j/ot/wH0qsME/QYwMJEWhtM+chuxg3zbJbCRCJk1qIIG6Kk2CMWiZXWNoit/A1ar4pY0Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477050; c=relaxed/simple;
	bh=vQWsZeLmo5eF4R9VLfJ0X6Ej2HSrQU0nII1edrWoBPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpiP63/gt5Oa+quwxPPAyhg7/XbXn1wDHbsjlADU4UHUO10DuS4/5KzY8eo6M2RaFHRMm/tgOSqFxRJnf8Ha0iNY1HmQWeZnmHAQrj2Kqa+L2uNY+YpkcBQ+ZS439Q3A42ZkxFaU+ZFsraHhw6E5cHpRYiSUB91rIb0ciprt0Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYO5Z8JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM36XZy1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcdCV561384
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 12:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=; b=NYO5Z8JHU0kLnVak
	jecJFGLGhVpR0hbUX6zKhS2mOwvu3eBGD2sS45i+Hav3qp+2t6pE+pFZ2XtSONov
	X4c4W7LDRDpqtWVzmdsTGslFZpTS3BKqmO4LGnnqliXgF1JEa/WwjDEU7/Ezrmid
	/9p6KuxaPEvOhSqpUkA5GVy8m8qG2l9rSHKtxrQJuoHEKNtgMtDVMTwqW8k0h4C4
	z8xYfav8q16kpDuWAc/V7zyurzFDGBPLE82T94+UU8v0ss6Q1pUZpwbdgr6iiq1G
	xZWHKsoWiebuVTcUtPxGLoPpb+LE34GExlbxY4iBcjVil9s5noXrKfGOTvviRZNV
	fOp4EA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdtd14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 12:30:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-734bafc2646so26679137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782477047; x=1783081847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=;
        b=JM36XZy1dMUivwbRTBp2T7HYvN5EteGuqDIKeghRdvPPFLPOvxZ2WK87G0Qh0m381Q
         cE2pxdBor8yrTpRwSp/WO+ZXs5Fv+y04N0IAGBuXQzixfiArd4Q6RY2oTs4ROBVj3iku
         fN1H5bdvtMVrwqlVFr/HyJE+nmdboJaeVuyi2VKr4jH5CPZx3hZOOEIixCj6AbYut7Zb
         6xhqlw6k79dKa0xjk1FxpURApVJEwE5dcjswXe8rJpthY0a8PMZiUptMHTlxllRJ6JKj
         xq10G+MPiXVTuA0TK7473AhbA5BFovD1NPEa+QT80WAZQFAUkyh0LpYqTcLk4Bdqq2PR
         PH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477047; x=1783081847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=;
        b=mqNQJ6KzaigiEXEInSGNBcy71twu+oy2dcIe7LbY8rufrND6xeIzVuO7pCHMm/yspF
         vE//xvVOgzzOazCLiQ2gE9MKF304wthiSDuwx8ybOoiPci6zWPFit/2fT4WEvDjr33SH
         74/o/FFOjZJzu40dhID9pQHrvb5vcOZ3ASjrlwM26GzDimAA3rlAUMTJ9+BZfyJ+w2be
         3+y4hlezYoeC3r40nHPkJfUXMTiBqG4besgBUMcdjThDoDECy3l2D/BldSIW1Ek1dcCf
         n/NCczmW9WHvcAsQP4Lbu+HXullHPuC2NxxZqctnKGdZ4kFkVKbkLde/5i9tlAuXTg26
         sdFA==
X-Forwarded-Encrypted: i=1; AHgh+RrTr49QWS+APKb9pJR8o2fYahYJaT1GNhIY7pBhgCLhDeUL4Z9jSOc44HdhuRw+fxZtdjVJOYuKISCONfOe@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCFgOZNNQYjQo+MjyUUjoVAJS/LHvFcrmYP4uBtWLpsw2PCE5
	BWb6mSrFnsR96JF6qcfJi9yh4mL0wSHSqhvr3TRuYULlemAp+Y41hwaMc5ZJwUxeZYd5blPVmxF
	85IbgZGj2H6JlUZLiFmdc+mdB3owmCMWqjG9ZDQlPhsFMHMwrbOpY3hdXfuT2svzFJhiU
X-Gm-Gg: AfdE7cmGqOwZEQnwqi6HpkmlQdHtk3m95MwIC8n+WSxTVqTI5Ejirc42IGPTQnTaWvP
	Cdk+wIyD3ERr6KeNauQ++4g7fV9QrZNdMQu5MlK2JuYXnJGA+vtdo1/XpaCXdVqIampQS4JBl8R
	EAHtwBfq5hy596nYWkbtVKhAH3F7LWTTmUbswZM3+JnWI/qm0cot6MJpOPLKxtBDKkguBTAK9Cf
	V9A5pApWrQpIRnRlOj4haBodnO7dCwKy50VxPSwWyedaot7OnD/jQA2W6lpRe7H5C21/ppX+vvn
	Ekm9CBmudcBOyiwcr8K3vtflxsgf1GdFIGUftCu0q5B9aMmwsvSYP0z9mekTrF2U9hnam8We075
	bDBSk8s4logyBhJcsPAmGXosS0/llOMbubSo=
X-Received: by 2002:a05:6102:50aa:b0:634:11ac:12ca with SMTP id ada2fe7eead31-734362a85b9mr1107952137.5.1782477047334;
        Fri, 26 Jun 2026 05:30:47 -0700 (PDT)
X-Received: by 2002:a05:6102:50aa:b0:634:11ac:12ca with SMTP id ada2fe7eead31-734362a85b9mr1107909137.5.1782477046707;
        Fri, 26 Jun 2026 05:30:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe5f73sm325659766b.17.2026.06.26.05.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:30:45 -0700 (PDT)
Message-ID: <b74b3123-367e-4f22-a910-a2ceccebdf9a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux@ew.tq-group.com, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e70f8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=O-OUeni-LN-QTous_GcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfX6xOueveR2dyY
 NNgTKf3i2E5YQLrZcyAEaAweL/R2FFeY3dCo7xA15MLbrhC7i8d/2H8Dr4Amj2wMVTbNxbysb7o
 /NeXnJNCfZzSxSW7uTNtj9J0uzVAEEuL/p0BN1DrPl/Wi4WWZurt455V08aUO33G21KejulIhvW
 ug3hfJU758oVdxDJHfDSDCeF3vcyH6sgHzHdaFO80XrM79DVD4Tir2di88uDlI6dV228bHcKIpo
 yEyiSOwavyKG5FJF3p35bktXxJvcWNNI53JZc03ePNxVbN0Z7IzMqYk28ZKRMKfXAdFbp7B4Kdk
 Q6TVjk9Yzzgczs1hBgYJjgtFDG+EozIOq47pn+2yZpvhXCZXWiprZjZYkN++FFEyNazeUygWClb
 HBkYNhW3Mxeh6Gpwqo7ELu0ri+oA2qV/R4O6Ic5aIhIjwnonP3rXIFExqrw7JVUwxldb7lqHm5X
 jKunDXRJj1tlhbbAwIA==
X-Proofpoint-ORIG-GUID: ucTA7qZatf-g-TXejGP5aF81LUNwlQzz
X-Proofpoint-GUID: ucTA7qZatf-g-TXejGP5aF81LUNwlQzz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfX6oSvvwP0mgRi
 BN4rQu2VpARCRaIu/aAdbGfQKV2UbPAaSc8shL0v6NlzpmwYMDNYkNZQPGgXhuBmUE45x3FrGY3
 l0iQrAMDL2r0oILNkImRkFu7LDT8A6o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260102
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
	TAGGED_FROM(0.00)[bounces-114650-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org
 ,m:linux@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,ideasonboard.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 195B06CD010

On 6/26/26 2:07 PM, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the qualcomm device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

Finally someone shaved this yak, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

