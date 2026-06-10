Return-Path: <linux-arm-msm+bounces-112468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V5ROHqNkKWqXWAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:20:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 731BE669A82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:20:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wp01LxkS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Au4dGUBb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112468-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112468-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3DD4300372F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FE140800D;
	Wed, 10 Jun 2026 13:20:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1C6408630
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:20:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097620; cv=none; b=YUddblkmauG9j0v7QB2mBzOUQWTML9YGpd0pqxJ01shHeC27kseJgsdS2Qb0LRdtO7icWgC3FQncDJxlfcbyG4jhJjvy33styO4jixh/njODjr9R8CIhbVix5hMz1MsZQhZHZh3lkFpQqV33Zsw7JMEv2AFU+8J07O+tGepXkmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097620; c=relaxed/simple;
	bh=gU+XCuiGLk1uatCGzt6/Fae7+muz7j/ctBB2xXLOdZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNPyYmlq5zJpWwQjeUSyiSJ9KkoD5zD3Q7aEz9Co5pm8yrvjpFkonmmlxqGbLJz6VnPwTyZ3WAvW4c9S1I16Zbn0sjDrHstsz6BqkHgg2wQaUwnERGcIVZT2DpRPWBfJxO9LYp9sm1+ypIHGK9KzmkE27zvj/mi9DuoCOi1EgOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wp01LxkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Au4dGUBb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBitO1138112
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqR2B1jbSFWY5YhOH3YYZLkD
	N4ze6vPwfHF35RjzG/I=; b=Wp01LxkSbdcfdzVaWIPEOcshdfnbwbBYhcASZypM
	NJBl07epf54iboZuX1pLceKa4RRyydgNbENz7536lOnv9zLuPjWwe1jgM7TAzesr
	cCO5rmCwRIizU8IM2QPj5GKefVjyAdT/QBH+EsHaO9Xvpn5JhEAcUZ0dMW2Ase5I
	ONujkN8476ygNfmQ+73AsT3874/coHNy8iY08To0v3oiUfOA6E1z2aFBY5TwigYm
	4lSt5c/b0DlSNjOD9VEp/KKDg+ndTwUeB6FDAByUxqKnHEhIbs6Ay83m75kJSKZY
	moMq+mBeoQpUA8S5y22MKNuxhXjm0eD564ZCNTWtWcsucw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jk0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:20:16 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7e5ac77so2952616241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097616; x=1781702416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqR2B1jbSFWY5YhOH3YYZLkDN4ze6vPwfHF35RjzG/I=;
        b=Au4dGUBbCq5vn6SxNlu0cQmcqAIQpEcOkOM3VMAUxIPJhfsGi3LdF9Dxrzt4FKyFqF
         dXFgYnachtW5iNIDYag4CHa8VX1wb/sW4XbrbsgMPWpE3kI00zxrK4P+DMVTOaLFFzUd
         vI4/ygs2vLO2GPzaOHqYf5Bc0s2tQkasJh+GCfK/1klKizCGaRkBgZSg2l66zL+f03dE
         J+T7KGoF413EVCleTOKCIoijhiNXP6JzSNx09/8FrEQDHxRCSL3Pi8t1FHv0+Gpk7v5u
         yaDJvNXsSbankGbullAP6NE+uMjMsFH8qI2zt5OqUTUIVWtZuOKPbFTDGQERrDJzqAb9
         wY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097616; x=1781702416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqR2B1jbSFWY5YhOH3YYZLkDN4ze6vPwfHF35RjzG/I=;
        b=q5OSZoATTCy2X0buSpxeTlavLxUulPFxz2SgyySzXRPWJJ3Obmblk1jDxS2Brpdn12
         TGt1cngyzN0XkfhjiiG4KaTxeKxcViea4at5VWElMomc1cZKAqGYQ6EKHzrhd0mZQQMx
         3IKfwGaIkwxy0o4LPHsJsuwl6LV6Ok2upVRng+jwcCAxpPONd37wTkt5EvM0jvjqs7bz
         Tcr969YrYd81R07nwzYGkcgsdPzGNBb5q+QZTUUiRO+YMWlm90kV5I05yJ+5BqD5BufK
         J32B6ZEdbllY4Wo7Z1yiqRSGFkCSgL7zIaUcxQf9uMe7VE33tgOWqRRE6OsIMeNbJm6C
         yHZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+e5lAJ9PH0lSjoGG7TiqHCMriz1sAO1E7AYsPChZHdAKGLdy+e3aLa5b8z2niZgCn9p1eNCiFQHt9UU5Bi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyf45MTZJSTkcXu6dUFAeQp+6c/7BEXfk0kdl1sUtpuYSa+ZW+
	ceElxTbDhvhFBswwQc/So7Pr+zSOEtOKQ+MZ3qXxO5/cWAF9hc7K2pCMbQlxD/5cHbLMxiRyLOC
	o5aQW+md35q3/7hQZt96FfaXmlRvyMi51+MVJEPQ1NnGs1nvXRi5BAOErbccIRnoSVCF0
X-Gm-Gg: Acq92OG/FXRGZQE+m8+uFsqTWlQamKdOv7D5Pa6+wzYEu/leRNZC3dwZvAYE/ItCjU7
	kRZkUj5QzF5QCP5ElSfRf1vymWv47+hvWFg2TzatXDYamVT3sTRTFfgKPGnC1UDvR07wbGnXuJD
	S6tyUA85vtrhMcQVb22hapn2rREoZNH8vkpECo5256cN3uoOLExmAwk9Cw2M5VInuTzRMAQN0Ga
	+mdSdG/Xa85d0FUqaUYvToNoXrZriF4N15rOBGJ7pia8vvZG+gnyUJaupoXIAWt7CUfd/Ie4SJ9
	tFtnUIoMiGYf7Sxq6fJCzM9BB06+FwqGmIapWJ+mPHuUVlHu6ceiPbhJePEV068wNNiOAaS088x
	pgUm95MRKgJrQDTKYdw8BDb6uY+qxxYZw+wuxiNryeFk0TgCzwAZg4F9xB15OcfENYylRxKH4Od
	cV3FOZq7F45TwGgQfeWfPwuTDY38lscI/73+smri7fTPy6ug==
X-Received: by 2002:a05:6102:370f:b0:633:3040:ca5d with SMTP id ada2fe7eead31-6fef25c9f7dmr12034005137.9.1781097615902;
        Wed, 10 Jun 2026 06:20:15 -0700 (PDT)
X-Received: by 2002:a05:6102:370f:b0:633:3040:ca5d with SMTP id ada2fe7eead31-6fef25c9f7dmr12033948137.9.1781097615457;
        Wed, 10 Jun 2026 06:20:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b0f5sm5424732e87.41.2026.06.10.06.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:20:14 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:20:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
Message-ID: <nrdf44ixzjqdyxdjnf54ucotpbncehjxjqygqnrknc66pyqfau@vm3emv662bub>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
 <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
 <852caded-eacf-4ac1-8fe5-83dd9285ef11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <852caded-eacf-4ac1-8fe5-83dd9285ef11@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a296491 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=C_BCb9cMjCrCBmKrUK0A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNyBTYWx0ZWRfX3pDBanrMOOkF
 e6K6mJub4nqZC6wp5oeV3jfmuXUbf2sH+C+v6RbfsBN/Bfmzeb9YjtNk48Fp5MHyogKVYXWAiCL
 0FdPqSnebmlc7Fr8pahb4ZEWtK7OeLm12B4FK4LypYWJkEyjQ8ROw/eVmS+In4Zm0t1RCLp5eYt
 h/PWxllNmEScb3AZd/eWGhFOFTqils9e4SldaOwR4R/G0S6hwIoIsnkn+ZfJlR9XptstT5T0gHg
 HFhGelMQzkdDHPyfv04p7xVtZKuX1kid0Cp0xUXPrNHJLeqQgelApNCb/AMRFKAci/ELzx5jjpu
 6YdS5S/ybWxR3bAyX2NfIIdJXZeCrUMvTfTcdsdAeprJiJNmd2QOBFSmfvGJeTGsU4F3ZsrEPBj
 2Yyhr5XjIRXZ+KWndHKicHyrhUDAmuoWMPS+2oYsS+blTJRj9YZsN+QAAl5PvHeaPLBiTzSf+3U
 fwrE0JMYe3tnNqjAsgA==
X-Proofpoint-ORIG-GUID: 4uRsamS19YiNwoBMzZd_aKNDPCTgoU2P
X-Proofpoint-GUID: 4uRsamS19YiNwoBMzZd_aKNDPCTgoU2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112468-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:url,infradead.org:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 731BE669A82

On Wed, Jun 10, 2026 at 03:13:01PM +0200, Konrad Dybcio wrote:
> On 6/10/26 3:03 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 10, 2026 at 02:49:31PM +0200, Konrad Dybcio wrote:
> >> On 6/10/26 2:04 PM, Konrad Dybcio wrote:
> >>> The MSM8996 QUSB2PHY was not being guaranteed a power source.
> >>> The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
> >>> wasn't. This series tackles that, freeing us of some dt checker
> >>> errors about vdd-supply not found on MSM8996 boards.
> >>>
> >>> Compile-tested only, but docs confirm my findings..
> >>>
> >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> ---
> >>> Konrad Dybcio (4):
> >>>       dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
> >>>       phy: qcom-qusb2: Fix SM6115 init sequence
> >>>       arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
> >>>       arm64: dts: qcom: sm6125: Fix QUSB2 compatible
> >>>
> >>>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
> >>>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 +++++++
> >>>  arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 ++-
> >>>  drivers/phy/qualcomm/phy-qcom-qusb2.c              |  4 +--
> >>>  4 files changed, 43 insertions(+), 5 deletions(-)
> >>> ---
> >>
> >> Note that msm8996pro may need even more looking into, but that's a
> >> story for another day
> > 
> > JFYI, MSM8996 Pro is being used in the DRM / Mesa CI. If there is an
> > important difference, it would be nice to get it sorted out too.
> 
> reg   96   pro
> 0x80 0xF8  0xD0 [!] QUSB2PHY_PORT_TUNE1
> 0x84 0xB3  0xB3
> 0x88 0x83  0x83
> 0x8C 0xC0  0xC0
> 0x90 none  0x02 [!] QUSB2PHY_PORT_TUNE5
> 0x08 0x30  0x30
> 0x0C 0x79  0x79
> 0x10 0x21  0x21
> 0x9C 0x14  0x14
> 0x1C 0x9F  0x9F
> 0x18 0x00  0x00
> 
> apparently this is indeed SoC-specific (via docs) but also apparently
> may not be very important (although should be fixed regardless as
> some designs may rely on this)

Would you send a patch, please?

> 
> Konrad
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

