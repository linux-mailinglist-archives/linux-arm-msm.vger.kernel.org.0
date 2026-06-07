Return-Path: <linux-arm-msm+bounces-111610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id crPoD+DiJWqVNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:30:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE412651A32
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:30:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZMM1m8y8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=khTNSqWj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111610-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111610-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D90FC300362C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10CB3128A3;
	Sun,  7 Jun 2026 21:30:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93436284B37
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:30:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867801; cv=none; b=rk09NEgIyG978cZPdvow5o6Av+bKUE1M2cWUHdpNNP0talKjvimwVzVpFfqA8xsj6S/UR96Bvj4eLSbhcJFKzBUSHWOc38mbYlczaOhRoMFwD9jOOa1yVOm2CsPcpMWmHXJPCAJuAM48rPzghVxUGtOz5zl2djLqWJWHj4G56Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867801; c=relaxed/simple;
	bh=yqMDBqhQg99rPWzLQ7ylmYdfuTA46f+CvMyRRW8RxPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5cg352N+uNDydIQR+Vc5JwSr9L4JleJerQvy6KohHzdk5FQI4/kgMt3KSO2y7Z8TmD7aCbVR1Ung0lH5Yd+IDTc54q1K5OvyxHDvb0iSoU9tisgs633HFoLK3cufefumtH8g1qnitmh9plbRtyNR8HPPhkSmU3w08jfxYhq5VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMM1m8y8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khTNSqWj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EknY3337467
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dAalBrR1nkmk6nGcSxQfzLgG
	KDM7xWGT9pITI41l4Q8=; b=ZMM1m8y8bzczLwvhYySpJhtNYxarPfTnt9DqerSP
	UiX6wVsGNb/UXRhNN9D6Y/sTj5yFpeOW1rgtKuOTrnhYF4hqhjkEZz4U6xE1uNsg
	LanNod7In0kn0nT+BrnNqU6QMW7BqDZ06vriFWBm63ltwsuof4eFdkbzT1NZBM97
	aUBINYIKYYDH5Fnl90+BpDe+gbAYke7HFipxBlHWHIsHqzdrvfWFM3gMk8TgAIeF
	2zfvWk04T5EMqpbOg+mNrXXckkcRq4DYwxPRPd0CqbZscR8Ekamth87Z7x+1+t/I
	TYrSVH8RTumZhONWRx1bS9WUbNOP1xc4v7Bp7DySGwKrlQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvh4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:29:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso2064139137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867799; x=1781472599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAalBrR1nkmk6nGcSxQfzLgGKDM7xWGT9pITI41l4Q8=;
        b=khTNSqWjeKlr7aLvjaV+CYVqFixuFWA7vhVrY2mddNFrAUm5aXFk+Z7CAbX0iNeJ0I
         3gTSO9wZ1GjoCReydtszZxFJbUkXkvdKDO3527NuyJoRYgURl3GkmYFfmrGK9OzQ4Gij
         bL2J/jjO+sjCid9zwAHtW5WKpOg63NpWhLcRfW3kDFxHvENRa5FHKfz9K78e1RDTwZKw
         K9SePqj52uLU5t3Vj+UadbxjWFA3CNRBfn9zfdbwBvfmUTwEpWxXWFLn1bHoA8sZtv0k
         vhBYjZSX/iqXssKKSJcKPupRihsfdcDzCxUa/lgTAqxoDevynHEEDphw1yMXQntK/w6s
         xyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867799; x=1781472599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAalBrR1nkmk6nGcSxQfzLgGKDM7xWGT9pITI41l4Q8=;
        b=ES2g3BcfcIULEtlt0URikvq4PFNYIzgDxUWvEYswA9P3O2uYwT5sxfiolDmtvjvgkA
         rL6s7BeBDYpDHw549Y89WvujbwMe/dUF5xnyF+Jgx/ehoVAK3d8H9//rISzdLM7PBpql
         kbc8tWVy1QEkMcZQ19wtbnutPLaywAfiA15s5J8Y8E1yrXco38M2mmTRRsxu6D/KkKeA
         3Ic/f1XUxUiZljZ3gX8eMkSa2DrIE2EL2RhOUjH2dvA0XmWpZDsXjzevXFCUr8T93Hnx
         bCEcVp4a1sBtThBnJacvbHCcfx3rcWfP5uQRsv6+DKqhLoyJsJwqxzXrOoABgv10YqCY
         bPCw==
X-Forwarded-Encrypted: i=1; AFNElJ+vad81zU/SAO+DJFxftsRGa/Be3qGYIMGhQxVp0pQv4NJV/OZXCR/oj5vlS5o/FXXCfsU05iDsxIwP7OwN@vger.kernel.org
X-Gm-Message-State: AOJu0YydW2LXs+fBFfddMhjhuVd8xprGvvG31QQ+9NWumnuT29bQpc3i
	+bloybMpfwecQm1nyJl7HWQRIevPECvkAXCYBaL1m90O/MqBPtpFAve5KrO+Xkd/eGSAm4ICJ1+
	67LH8W2wROWsj6HYbKSVj+9+c3xdOQVsmz7kVj3IXE7nAOrJULvNg5r6osCQ9mtE/2yo7
X-Gm-Gg: Acq92OEpk0KnG3bS8hlqBRDU2kgm0FIbV30j/o2QGDPmuwat+wat0FT7zYcC5PIu8Ih
	2ibjHr1g0K3y/IobY0FPPfYcO5nI+eGG94rWrqqNGj11fbGqX67/oSoedpfvZ9OrChWSBuVBHpl
	XkVqSAZHRCljyejKnfe8QgG3qaDhxaRiZsr085sKD1ko1vyrb4WPPo4Ji29gGFIfcDWpd0bCJ7g
	TNuP+HjIxROLfCFYmcdZOcUqv7PVkTiacchpz0vipCGrPyd8up54QmJGypeSSyhSBkXmj6IIPX6
	J75vqdu+L0jWzVIqCAqisM4d+kI9C83Yqc7dVitYnaHHdYnVpDHt5UYQ7wgO+BKtmQeUHXDrImC
	yTDISiFIjJdd44iHufOIXEc3LYGMtNdFKd1yhg7Epp1aDJ8Qu/y3hMHx/eraN/nSnGUV+SqAMnU
	VC4ewkG4AJlhnkCsZMoxhHORRgZPNxhGdzlfBH7BKNArLIQg==
X-Received: by 2002:a05:6102:548c:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-6ff02387138mr5734762137.15.1780867798754;
        Sun, 07 Jun 2026 14:29:58 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-6ff02387138mr5734760137.15.1780867798352;
        Sun, 07 Jun 2026 14:29:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac3fsm3332615e87.42.2026.06.07.14.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:29:57 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:29:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] phy: qcom: qmp-pcie: Add QMP PCIe PHY support
 for Hawi
Message-ID: <h6fbnsqg3gcobkc6chzehy2ew5hczidzqulr3xh6d6u5kazjhd@ygsd26b3neyo>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
 <20260604-hawi-phy-pcie-v2-10-be908d3560db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-hawi-phy-pcie-v2-10-be908d3560db@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25e2d7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_DP_PzDrpJ8qHd2sDw8A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: k-3mS6Z7L4ycPuRknQmBwCcZ3MsLL-Lj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNiBTYWx0ZWRfX9HloMJUZRnkS
 DVixWPAoDfopIh8EqEKviqHsDrsZiF6F1IXb167/m8oglzRDEweINJoUBqJkkTCP5rnamhMaj6d
 M6QufeSq7rgWJA5Uh3DmvSJVltJ/VwHkC9jt1KAc9Hr2cXoYU/rbWCOkBZc2mCwmtNvm1jLM921
 zbAQv2zFmrFM+deyENO6LNNicIejPszd1FJTEZSo+ZNwJBF4PN4Dd5p9d2RkAqgGLO9nuwlKJAH
 MWaTxbGtjamYH1ucF3qbvLaqoGSqirGUC47N9QLdlOX7kfLKEyXD3AZT6gMnMNv4ePTpzPdDkru
 GOuLG2OmDRvebgxfpp4EJtuk1wx3qALof5QoAq9oJKJqU9y3b0s0PQ4OsbM+VqAu1hVUa2wiwNa
 kob4FsGv8LAtaNojyBm3WM+lirFRoj8wUiGzogXCIJoK4lPVmOPk5UdEDji9yvPyhDRmteINn46
 JIyco5mMF0RBMjMpodA==
X-Proofpoint-ORIG-GUID: k-3mS6Z7L4ycPuRknQmBwCcZ3MsLL-Lj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111610-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ygsd26b3neyo:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE412651A32

On Thu, Jun 04, 2026 at 01:33:04AM +0000, Matthew Leung wrote:
> Add the QMP PCIe PHY support for the Gen3 x2 and Gen4 x1 PHY found on
> the Hawi platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 380 +++++++++++++++++++++++++++++++
>  1 file changed, 380 insertions(+)
> 
>  	u16 rx2;
>  	u16 txz;
>  	u16 rxz;
> +	u16 txrx;

Can we do what we did for QHP and reuse tx instead of introducing a
separate txrx offset and data pointer, etc.

>  	u16 txrxz;
>  	u16 ln_shrd;
>  };

-- 
With best wishes
Dmitry

