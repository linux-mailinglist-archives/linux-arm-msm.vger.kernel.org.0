Return-Path: <linux-arm-msm+bounces-111594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vOrPLtnQJWolMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:13:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F865176D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:13:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EtfJsLAa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=InrCmstZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111594-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111594-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 570993010D84
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3456E32B12F;
	Sun,  7 Jun 2026 20:11:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CAB2F8E88
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:11:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863084; cv=none; b=kN1qalmgrQLJVAh8DKKy1NDvUO8M69jqhkWbrwHx1dKmryy0gYxtid3M6TQmnF0SrrRqA8evF8i/pMnUbXPhPIwN8uOD85dJk/zrO9QDC5SYA/cTSCekSzn7hqOeQHNZDe42dWCrqPVP7XWom2tC9TlXMsgOWc/s6EVC0r+QZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863084; c=relaxed/simple;
	bh=Juz56EL8KWEI2aYjC5HLg4FYlkb1e+CV6n00DVQEDio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCfvC9d9RuUOrb4Imo4c1cOxfLP9Cxfis5wwagSYt6AzZ3pidTh+MMm57y53LDaXb62whLvSaZh8W0OWbXmEH9Xlyij3vircOIaITrf2kP97AwQ9fsIF4XV77SrjFKXygq4eOcH3H+S8qqKV/7/fXv5xg7Omdc7IXPGRTdwg+ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtfJsLAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InrCmstZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El9Da797311
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixB+mdQztiIA8ONdrXKTII1r
	qAwe2UGAnvN8bjz10Vk=; b=EtfJsLAakTR03iTjAvN2K/Tm4YAyVEInIR6NMBRT
	ypB9b4pY4zvO4jeji+ZeOoif6Za4tqpIKR5cfhVjHkJbPgBuI5kwJrZFT+8ldkGs
	kp47qbGG1aLEKRS+ZCy85Munej9ZcH401xlNkmN/dCyEHc5n7Madwc5NfQoRX0Cm
	cD4RlPE5bHomTfHAgIhrQp6LDj1RwzSXMQX4MuwVy1ZajiPQbp8ABKAjS4dDBYRu
	KTWWEqw/GE/ZP9cR72QI9/H+8V0ogjifH6xhn1SUYyUavO4464xytj+UZ6kZ/+0x
	t1Og+OXH0eiLAYMQugsN9OXtq9Q9AGOcutap44GNfZWfXQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf4v2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:11:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59ed1788158so2145152e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780863080; x=1781467880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixB+mdQztiIA8ONdrXKTII1rqAwe2UGAnvN8bjz10Vk=;
        b=InrCmstZDhofSTln5lCOOrXcD3ENG9k7BK0wKsKVA2/JfIlqo4p0nJmy28Za4UKLCu
         uzX/cMe8wOedpIqKWqhuYAVjLndedWjLB1E2OwQ0dkQn0O932GePWQMsM1CPJUX85Hau
         k/2G3vAfvY9GYJ2Qeg/h6bcURC8olw1ID6SQmoMSiMEDxbpcBH8FKKlkj0gs+J6dDLLG
         R1UXTp+rBSFn/wRRX7NFWfk/w9wqrFmZhdtj+yjloQvAbdwD2pRE2t1LLbRJBknTYsjG
         wfDxkTf+Q2N5bmcmzv6WZIF9jahUifVE0HUsoy+ZsfFP/eepI+8XQOYk7y7i3wI+vPmu
         vFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863080; x=1781467880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixB+mdQztiIA8ONdrXKTII1rqAwe2UGAnvN8bjz10Vk=;
        b=i8vPxaNcmBgsNWWUtr277Ya8fwNNGUJRlsbJ4bWK5sxQ6tz+OqNJP21GdWGCEFo2Je
         Mvy1iaUj/tlWg/YsDjBfA7Z9Gq6hSNlDd9U0WcQYmlZTcMWy+2Kqu41Sqpwn/okELPRV
         g7RGtvCE54ea6pyfgb0E/jhLydRQMM3lN3c4j0Kf6exVuboacnXya1kNwf8EmmmZE8R0
         7Uxbi2IQR8HetIrUwV6B01dmkvv+zgTEEVBfl19YyUH8Sl1eZUkSYWZA5hEJR4KXYydS
         JGbLRka7igRGYDFw2q+On+/2AShktDIW781VPjSTgYofNDhIIYbuWf5kFW1PmsHoo3CJ
         gHwA==
X-Forwarded-Encrypted: i=1; AFNElJ/yqMuCsCJOp79KS8ZNu0Vml79GYWRzYo1ffy5o69PM0LiyzGUimdgfvPF0KF77OyBf4BK4L40PUsS8itcJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/4ow/9aUY9B/qfWSKxtCjV0GrfX9Jnp4PpCALh3aRJK+cHQEJ
	sjWTlONPihRgj2J1v1KENB3u6vk+8Q/QSjf34HAoaqFjFa6QWVHT4zQomKz/SDAYEqtpbVEfdOh
	HOAPZYtgkSvYN7ZcXJo2SIXs71F4HjQcEJOK+BGGXnH/5f+OmNnf4FISZYZD+iuAN9nuB
X-Gm-Gg: Acq92OGTpWjQYnNPuEOpTC2A1/+BA02OuXNC38JZRMvh27dY+AjsmBfc4e78hSeljSc
	zUm4OAzvVV7VZxSOgezgZDS4bireTjokdsWEiRypUjjl0ImEcgqw1B2OdHFLeNnbQ/hpAzJwIL4
	Cft0UxUeSBQ9ePxFF3GzIQchpGasMRa5+RSimoWOPqLgosSVG7DpaKPNtTmdFejMP+kxhGXPDkB
	Th2GNr5ZHeFPtXhykG3pQPj3doRLHa0votYTl/ptstQHaPP8uBnRubu1m8mt5kc1u1UMwya1Yjf
	vKYWkigaY2Rm77tGVEL80fVVVVo0j2u5m6PO2TLhqWXh6A2Y2G6iYDxREIQYiMB9njlN+rdKxSB
	KPGpwrgmkDikSIxm+shkrIhIaI5ooJPetruPy66ScdMWxxxevnkuKLWprh52vwXkqjs5lmdfFBr
	P2jsBAZB3AFszeDqZk8BQdt1Sbh3QxWC1X/xgzGemFZuJswA==
X-Received: by 2002:a05:6122:3284:b0:59e:f988:51a with SMTP id 71dfb90a1353d-5ac4da03f4bmr5403674e0c.1.1780863080008;
        Sun, 07 Jun 2026 13:11:20 -0700 (PDT)
X-Received: by 2002:a05:6122:3284:b0:59e:f988:51a with SMTP id 71dfb90a1353d-5ac4da03f4bmr5403663e0c.1.1780863079508;
        Sun, 07 Jun 2026 13:11:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed901sm3288867e87.10.2026.06.07.13.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:11:18 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:11:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
Message-ID: <kz2curb25habqhw6la6wnlrfqupfndaveeec3u42hccdxijpxz@psbp2zurjpul>
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
 <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25d068 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=b_Pr7HiucSRPs_5II3MA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: y0TGDbxsMDC-UO3tNNvV0G5MCaeK8kDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMiBTYWx0ZWRfXyVpRLc8zBZdK
 YgMG7dGANPAWWzJeEzT0DIBA7/KmAnIejR8EpIZn/s54jS6OC82Z/u3XmrrDuNzyKm+ueIq9C+d
 ZAiSo0at4Xcgc/7an+HqggnQZv64uXwMIlTS3Csbw5U0zWIBxrAmGvdxKuZD9km7sMxCX4PzQtS
 wu/RZjynztfneT9BbUWmDYFshlNaXZOxuDhRAN6N8qEc3vv3IufRbouVSD9C84SPdU+RoYKwQqo
 UR5vpGE31LDMPe09UjqFCg0q5a8tZQNyDFHpuLTEA3uvYNxQdk1/LXiSXiUPIBK78ogSv6l4EQg
 UIv5JMHlRziRaW1/l0wja8+ML6HpYrabKBxVQu9LO2VKPz1eaYQPSlyBHnE+VoDUXxBHuB3GCHv
 ct98Ss4VyGZsnqfrnIHu0RORQ76zEUfXfpuRP2v0mk7rNTjxJWtNRhqC2Yh3vs1xJo8Kwd01vQx
 E7iL4SqLUe14U9RyvNQ==
X-Proofpoint-GUID: y0TGDbxsMDC-UO3tNNvV0G5MCaeK8kDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111594-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,psbp2zurjpul:mid];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 108F865176D

On Tue, Jun 02, 2026 at 10:04:04PM +0530, Kathiravan Thirumoorthy wrote:
> Follow the new binding style by defining PHYs and PERST# (now RESET#)
> under the Root Port node. Avoid mixing styles and move these properties
> to the RP node.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 12 ++++--------
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

