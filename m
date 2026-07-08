Return-Path: <linux-arm-msm+bounces-117631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N+tDGXlMTmqMKQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:11:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBD6726A51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:11:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i0qmUbPQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fdEiDsXn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117631-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117631-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F7DB3004053
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C492701B6;
	Wed,  8 Jul 2026 13:10:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF23C246770
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:10:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516258; cv=none; b=U2oz4oUMTP6CijPyqddaAiHQZEu0S0c+3X2nzbBL9W8Tp6JpdmQIhfs1erKeAFRCU2jmxc2j6jB6GpJN6ZpwPBMqbtf+54jQRo0LAQliSj/EX12y0SfPF4ON+PF0hQF2q7g8cpetVU0xPHD0vl++ky3xZ1elqwIkxDv9odkIJD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516258; c=relaxed/simple;
	bh=/r9vThEyEJ36Cw+vj1jJ1Sk2mDAeNJX9YvUbt0gf3zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCibHPUftmhLVZ4+ke7RGQFM9RPVJOUH00B3YT7C0qXfxYTpFthw559616+uENxm1//FH2lYqC+dH3JB65MEcgrO0DcqH5p8OwN8wFW1whf58DaYijSwxoFC9/RVz5lVOE/UeYse4j4YqYtBYyB0Hjp9Wb/QTZyTWM3LGxNQ8Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0qmUbPQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdEiDsXn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Lqn2753376
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VitBXPuDKN2bJBrIHBwNqn8i
	E6+VSQBCBJkCh1O1kvw=; b=i0qmUbPQhK3LGktUywGpZxjxz40cjrgu4Vj+Mqdg
	C9JliogfLkFrrfQd6zD/clJuAx+a48zYKqrXiSm0B09AjMqYg/ZHPswZYNGvU6Qd
	7fwuKoMwpm+PTF9BxvGvT61XS82lwBQdeW1RcqQ/b2WOErTc+J3FgJr9EC+IA/yZ
	Og0C+McIl21tJEf027E9Qe9qHFKsQkmdsMT/DSNr0iUHm2TXX3/0rwDgreoILT9C
	8UrbqTiGoVpb3j0opT/pm/Rq/OvtmWAdzcoown46MqZYtE1mRsR0pDdWE7suQldL
	lB+ai2QZvm1pG9oAU9RjsiDqYXMkMS7LxtciKibmlgqZwg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hhs55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:10:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso155814137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516255; x=1784121055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VitBXPuDKN2bJBrIHBwNqn8iE6+VSQBCBJkCh1O1kvw=;
        b=fdEiDsXn94UM2M4GtI1ayMqEtl8a95xmhrSX51LYhoGvbVZ8Q5aTz+Hu9nl/Dw9ag5
         7Uau1YUm6MmCFo8XsfcQx7rj962hoLiLW8QDT9I3BVeWOceCI8x0fdl/oKiiLyC1H6IM
         f+BRETf45dpJR9rx9Z4ECLkxduZw3z5QEJRwqYx/t/8sLosatT+mZFo0+QDiQF4hz9ai
         VjR76DYRbLMttjjEukMomkjLryPUJ6nPD0ko5EB4Tp9LOG2jozMZ7Ch7LEQX8WZsgY9E
         Kdq32kmD7AHtN8hkdi8PVHctlBuXqE9iVdIxQL6tkflSEcmUP+F6Yvo7SoPUS4CNhM2w
         gh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516255; x=1784121055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VitBXPuDKN2bJBrIHBwNqn8iE6+VSQBCBJkCh1O1kvw=;
        b=XVNaPe70ZuMOc+AH62N2/jBF7Wi3XBUDJIK4fQbleeVPQRNt2wgJdq18+X3ZaJnZJK
         nKn6R8v3ChDllM3zaT7FSv1yDOpM6+uiYdCDqQ3yPWppO2EAVtbjykmXPXqWfC8FTQpw
         olcf74LDWUK/ZntrItm05ccJpLAj8qwSZIoiSPXaTSaY7LZ32WYHXuGoas57QbMoLYhj
         TKjSYY5I/2/eHmSbOkH6NJggzNpvb+PCv9Cko3exVyiQcfRzgCdZDTaZJ0kCoZphyfbt
         KlvQpXft0aGVIFbF7sV+rdcgSFEdTeNkpDyd7lU/a9gepAn+10PFIguqwSGw+u45j8Gi
         h5Xg==
X-Forwarded-Encrypted: i=1; AHgh+RozQenIOLDiFZBBbPLvQtUSlDtPYk7dqFFFuO32stRWXBQAhYm7WmZ7VLic8V6zzwWMwd2RA3Ty22vkO8nU@vger.kernel.org
X-Gm-Message-State: AOJu0YyvAvdpdh8duQ0BA7Ao3FlFHlE/+ngLO9mebF0pV8aCycY5qM/j
	6vJGsV+8aJ5j/yhN8Mm0ygK3SglZJWFdyweIm5tLGstinUswLQkatGkSSt4OCuGN6MfkROgurh+
	clRVf9NMCEQzqPvIti4yZspeeSCVOzYcso4XMGenIFCfnLTZXeg8BaqKHT33mUaLA1isn
X-Gm-Gg: AfdE7ckO9vz1c4eho7ttqUel1CbOevS2Sx8vwaEuPBLQ3+fqo/mIY3b3FhutsHpkLX6
	29JOwgMSn472BMMzCEir5CNEROlmG0SBPi8wyoldLDYxQpDaMFV1B//kK9pq6u1p/NWziLNL0ya
	jGor+s+CqTXIHz/31ZaIpcY38Zkv2mWuS7RR1GGTa3jmt3tlFecb8MNWXjbQCepHl744M4SEwBa
	Cm895M1GFsB1JiPl+ZXsS8ho8WBKGulqjdfmhEf/J7LaVl7t4CL3bnbOdNpE4eL2kQ3sMVxiA0J
	NaBGIt3CKkTxj0e3ZBiI4Eq7nN0ezrTilZTFAj1KHNrpZwgyDopuDpHuKrxM+u4MM0ThuIZssLE
	k0GudTAhEfTKIP0iUMpshSzBfQ9bjH+lnF8FCpbfovjJzF9R16AiVkA2PYnwTytyQafEn/pyJDL
	IApyoeIf/KZU8Vrgl/gnmudGNH
X-Received: by 2002:a05:6102:8081:b0:737:80f0:7887 with SMTP id ada2fe7eead31-744dfcb32f5mr1057932137.8.1783516254697;
        Wed, 08 Jul 2026 06:10:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8081:b0:737:80f0:7887 with SMTP id ada2fe7eead31-744dfcb32f5mr1057905137.8.1783516254115;
        Wed, 08 Jul 2026 06:10:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5e87sm29799821fa.22.2026.07.08.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:10:52 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:10:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] phy: qcom-qmp: Add v10 register offsets
Message-ID: <5syxe7ckrzb4bytvhnvifqbo5owxtkko5i2mdukiopg56igsju@i4at74a6mart>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
 <20260707-hawi-phy-pcie-v4-2-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hawi-phy-pcie-v4-2-8d9cc6324947@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX8sobDPol1TW9
 GroXqq8JyvU1ENawarcYydF+afCIUPih3JQjAOP9MdZYXibN6TYDCJW+gKFhcm3wDkKyxZqrYH1
 iLthWxMkbbQTH6kNlz9ChjoD8PNCzDnMaw3gHhmoPhAkkOgC/pYkxtNF7ElkghmqCCi2JsV1PRx
 18zHeU4cyfYs8krXBxR2NjMTiCPf5aoChaHylvqwCAOUaOAOUMb/OT1qEgjYUibevJO4EItS2Zw
 sHjFCAyAjrfvlNY222zm48CNci1MbOtBumAvUe0VgE2xGspyTaPpHyJz0HwCzxrRZrvxof+7Xv/
 CN0S3vKijoVD0HTSezhkX7cGic7NimDDarvQk6NxUUvubHiQb/r/bEmHwwbK/Os91a4lAeCkznt
 m7BJ9Bk3i/S8ypQVghaoAE7UfNkCnV8OWLhuG60juUfo9Yh23AmQ4BAj6gIBrFkH/qw8IFwZ4kz
 KNl/SW57+/NkYYClKkw==
X-Proofpoint-GUID: 9hqGATTH2zn5bCyPgAD7UyObLj7_Gwiv
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e4c5f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_DP_PzDrpJ8qHd2sDw8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX+PWPZ16lpyP9
 O8ov2mxpIucOgNnqv3qgpPPBF6o+Ym3I1JnGVPuxhu7ugjK8E7E7OI2J6TyS6TvLHy8SdSGvtvx
 X2msN5AXGbYng9r77szvkzHaYxKFDmY=
X-Proofpoint-ORIG-GUID: 9hqGATTH2zn5bCyPgAD7UyObLj7_Gwiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117631-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EBD6726A51

On Tue, Jul 07, 2026 at 08:32:47PM +0000, Matthew Leung wrote:
> Hawi SoC uses v10 register definitions for PCIe Gen3 x2. Add the new
> register offset headers for all four sub-blocks:
> 
>  - QSERDES-COM offsets
>  - QSERDES TX/RX offsets
>  - PCS offsets
>  - PCS PCIe-specific offsets
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   | 18 ++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        | 22 ++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    | 49 ++++++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   | 47 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  5 +++
>  6 files changed, 142 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

