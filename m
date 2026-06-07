Return-Path: <linux-arm-msm+bounces-111558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rAqpJUlIJWrtFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 12:30:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DFA64FB9D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 12:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ZAdl/Bdg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JsK197E6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111558-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111558-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0438830068C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 10:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770A631E832;
	Sun,  7 Jun 2026 10:29:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E91028CF4A
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 10:29:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780828156; cv=none; b=BmE6KLqCNuKkcFoKJ9jgJh5GDyA6FbdAdTD0lcSpoNlloA4Rih1zNLGaWzQONXxVZ49D1F5DLVLdkjVdm8yUyVP/H/p4+AxW6NRE+sFegslaW6ZGZIGqDFQLXHSnm10uO6Gm86xioPUKdIGXVvTP2lXpj8bYgfZdlVWD8MqJ7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780828156; c=relaxed/simple;
	bh=zpGAW9tYCes4jygC5Ch4v/XC2hqs2InqXCOcVgv91pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZB9EVhS+2i5M46uPAtjkCmEMmHArrDCJOvNXfSuoG3pIw+GGG0AnlIkybrvl9eTPNYJ2/56qOfZh/B5M/Ux+g8xEVvRhRCwsoutry3w0N6DtWBEH8ceSZS1FI5yX+S83+/BxJ19ItKm6GyEODFjc6BVt8swz5lJexqON525Zoo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAdl/Bdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsK197E6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65778wGF3721111
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 10:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=maV6ymIW+tN4bTb51Mh37tnM
	ZGwL9fhMtkQZiKNq0Jo=; b=ZAdl/BdgOqdteeXLfmxajMSt2D/VX4kOEy74z8B0
	6D0WNqWQkwPm29FGw1ajGny9GPfwk2CaPdfxWiMy305DMRPP3O8VL4sHVm21GdY1
	j3ztiO5/h/dy7JdxePkj/6GDm2h68tBggF0tgmMoiVLOr3i/iDy27LqG6wnMsgIy
	Vz6o25g7QfSbt8tTp+M/jtWfiYUiMujM+AG3Ut+dZws1utS53H4BXhk+46mXUD74
	Cf9DXCteW9/7WMOvk+Wp2ehIQSFrW3yTQk9WC9JT7XAn6cEGFORvyspS7sDv4rFr
	ZuulobkEzzV98XTTRI5MvzDwi3GLEBgshjkcHjQ8JdOnFw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1bfmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 10:29:14 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963aef8124fso1527380241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780828153; x=1781432953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=maV6ymIW+tN4bTb51Mh37tnMZGwL9fhMtkQZiKNq0Jo=;
        b=JsK197E6r4qS0QVVJsRgFp/dogX24+Zo1EQxHa7Lxqv1vaRx1d7SipJ7wOQjPU+Nzb
         sArKlewpj9rg9bAnzkN8IUOl9A9elBLs7DcdC6UZLz20X1IPL/3n3SwFRMUqdo3jap2m
         iivIqpKmbsii1bXqeFQQLUY5H54SsQ8AUlmEOqLwo5AktculeWY9gRLt6mt22CzJSGk+
         CvFvjnjNoBJqE+s52MhxwpFBqxWquZUAYXqh0+RNShLVH1lJzTNtxTNPVfj/nmLr+D8q
         5bAApUWS7kSEcbudT8x9/yLUsVpP5MKMBhJsKfzwdAGQg1vhaNL2E2GVwEZPm8uFhaGk
         +Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780828153; x=1781432953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maV6ymIW+tN4bTb51Mh37tnMZGwL9fhMtkQZiKNq0Jo=;
        b=R1KmClHksUZuw6lAvkODpc6s2fEdaXLpvB0BlyRNUQM//eXgsyB54yMD49duIYtqNp
         WLk5QofadUhXuKm/TIFZ6RqJ2RfAewvF0lpJukZ+QIeNC8d9PE7Oplyceqf+ML7B9/qA
         NKZSkA2OKJjYOItMoxWMXk8QkX28Z22Elv7tz8WjU4DLDgt+0FrVY11QsYlg1Oh3+qBp
         5LzHdXlRXfTd6mae3VBoIaDCuKN+cyBWmodWndLJ01JJnt2iTaQw3v0wgQ08DvJgPrUt
         0XM42j3G99g4wQbnQ/cD+0Y1qJfMm5aX3tIrrhFC95X25v+rF4jYCLV4fTlT70dh/YKc
         sr9w==
X-Forwarded-Encrypted: i=1; AFNElJ9GNB3bhZ06ocaHruSB2aYz0NEeg7mglUT6Or8CMxYWNxBIh4wdi4MF8qesIqWPCHJCkdJNQFGmq7x6r1Eq@vger.kernel.org
X-Gm-Message-State: AOJu0YzQM4u93mfTdG595f3ogNVvGRDuP0RM4RkF6NzJ6TBz8u3QN5wf
	6Zm6aYTJ1Fpf0WXRaqNgLck0XDKtjn2t8w21HBa6kcQjErHDS/Z08xs58WOfuZ80eUdWBw6W6m0
	wiXCM3WWrvXscEQoJftPldafvApN2r0eLyVqXnHomADFSgEBMvP1NmpR+mPfkuCnj0w82
X-Gm-Gg: Acq92OHN7IJOFTwKPqPUiskRbBkf7nSqBQGtn4NSmd3+fWyKfqAp0TseyWyEZAR1API
	MxGfn8y8CY8XUaVreZe0GR0gnf+SBcWJBh18SYUYqlFxzdboPz0TTQmVd4+ameuJa6j/qOViMFX
	WpoMB0NkKZX2+iakLaxK1BF2HBv+BjbNx5rO3LOAfT/tuc+ZR8pFpcSCZcbioPDVaW0d7qCFrJB
	MXaIbUkMsKJy2cuoKH9I5h6HiihpoCgFk2UmgRrDmvhria1s1WJlIxS3b3aH7QEEl3dRc729MWo
	L2QIhq4oKCOv+UMJ87T4W3tgYI9b7JhOmxMjENLjoSrkt9PWUVWC3wimPxrBgk8ycf5GoUqLoq2
	koFLUWZcUoYmZ2ie+SfR/n1beQNkhmESk/cXdfM89LKHvLixOGCZ+cTyKx2Ty6130j4vJWRKTYc
	VyAhjY/HpO9wEhANbXc6Fyxrxdbb8yPZpmPUZYCFEyUfO9lQ==
X-Received: by 2002:a05:6102:5094:b0:631:26f6:701a with SMTP id ada2fe7eead31-6ff156acf6fmr5264038137.29.1780828153524;
        Sun, 07 Jun 2026 03:29:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5094:b0:631:26f6:701a with SMTP id ada2fe7eead31-6ff156acf6fmr5264023137.29.1780828153136;
        Sun, 07 Jun 2026 03:29:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed8e0sm2995208e87.2.2026.06.07.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:29:12 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:29:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Eliza
Message-ID: <k37nby6lnczb5qajku2shpff4rsisyynlfmzu46lhojl5eiwqo@wkpy2tbeoa3b>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
 <20260601-eliza-v2-3-6b44c9c23d5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-eliza-v2-3-6b44c9c23d5e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwMiBTYWx0ZWRfX0F6noCtSM86R
 9S1NIv5eU8Xq8ePxBRRU9Hh7gDtap1dTa3Z+L0mTFxFqQCRez+Vhiz1zLa0EFbHPZkPsVUXNiKE
 wYlM+nbTbsuzQf+oD50KuvJl8o+YGCUitFn0adroIRoNCek01fhaLNgpgVqLFYJhODdAb+EBiGX
 PGQGCDqxJ4XLFghbw6/l1eZEkT8fXjE0ZOhZEiqW256zDka7W0Gq12PXNCuWktEuLbm+Wx304BX
 V5me3PLIl7azrxFo8s/oa23qCugO4ektkZC/i7AxZxOdz0Wk6OQOjUiQEjPUisJJ9bb+ISE1xjn
 4XrboRsMJEftaqeA+ssIsc2FZvNZRYM5PqXmVLTcuaxEwB3wxYRDuWDbGqvqvY9EMSQjTL2uxub
 t8FGgL07Se4Wy/UtXrX5x7IBKRXz/MX9iGmE7FrZi9DbRK/LqlwF9RmbhcvYMZ812EA07hjHNLO
 Xwy9KFT1b1qpb7b2r/A==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2547fa cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M-jGJTmE-ygQmRKCDXMA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 2fzjzJB-OiAaQbCJlCMe-lI7GPwiw7Tf
X-Proofpoint-GUID: 2fzjzJB-OiAaQbCJlCMe-lI7GPwiw7Tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111558-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04DFA64FB9D

On Mon, Jun 01, 2026 at 10:59:46PM +0530, Krishna Chaitanya Chundru wrote:
> Add QMP PCIe PHY support for the Eliza SoC. Introduce a new Gen3x1 PHY
> configuration with Eliza-specific initialization tables, and reuse the
> existing sm8550 Gen3x2 configuration for the Gen3x2 PHY instance.
> 
> Also add the missing QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1 register
> definition to the PCIe V6 PCS header.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        | 139 ++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h |   1 +
>  2 files changed, 140 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index fed2fc9bb311..257b4df965c3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -198,6 +198,112 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
>  };
>  
> +static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_serdes_tbl[] = {

Thisis exactly the same as SM8550 table, except for three extra writes:
QSERDES_V6_COM_VCO_TUNE1_MODE0, QSERDES_V6_COM_VCO_TUNE1_MODE1 and
QSERDES_V6_COM_VCO_TUNE2_MODE1. What are the default values for SM8550?

> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0xb4),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x24),

Other than that, looks good to me.

-- 
With best wishes
Dmitry

