Return-Path: <linux-arm-msm+bounces-104159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +APTEoIE6Wl5SgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:25:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E093644945D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA791302F5A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F64C2BF3F4;
	Wed, 22 Apr 2026 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hp9NRYUZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uwr0bUxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12E37DE81
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776878665; cv=none; b=ZLYfC/IlSLvkaNlEj4GF6C21Flstf4yxRj3Wnx5bo0/vFOje83SXg+VRTw35ujLZEUPNVGBImsdqIq09y2KOHd9X7RrhLVkuCCjW2IENdlb4ltYnl29OKZUl8U7+PWc3BVQ6DINP1mOhSpTSQlzP8x1T/dGc4JrEV4tadvWmR38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776878665; c=relaxed/simple;
	bh=k1KXrTLU7dUkXksoHKAxb24nQMXABD9g+ynla4ak+00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjU906ISDUjHYI4VRb6c5zJZWqJ8g4vP/5RztLBI5N1Jx//VCMSO+/NictY5TA6JARYvIUUFH1x1Ouyi3HPQoGwFRZV5QZ2kldhABuyMWeWjyS7pYM4oUQ5uLO6Y3+dq6/orBQk+nkCZiFyqXGwhoKuBQzO1TDAsLS+KTjDRyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hp9NRYUZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uwr0bUxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG6bV2872762
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UfAxfiLJzxkm1m8t+L1t3IM8
	HEx6RLiSD0+sOVMBjl8=; b=Hp9NRYUZZDmBKjQEUhispssv88TvIgeuxgZ8adv9
	Jk+r5KALueCITQu6vIn5q1LIdb6QJRQ892M7XI85ajwxn+MnNE/eaPS2U9i0DrB8
	lF18qQE6Iz+wGu/HG876fxLJ7a7feSIQ9lVNDZtUU4BpIivlX/cGFXvkjdSBt6AI
	32FoeluAk0SH5uclVuqjNTvSJNph2MDQMwMdvNWytCX/165XZTI1kYMMd2lVwNCK
	QnPtiaXyvkh7VnrsqfMSpSdRUZBGFB+GdfjnBUSE2eaPSVGegbVD5SfvyXuGdj8w
	rhm+frOVXD3w0htIwKzgP/xhDQiBMs/KFRK6oRKrdPotgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh09rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:24:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso52212561cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776878661; x=1777483461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfAxfiLJzxkm1m8t+L1t3IM8HEx6RLiSD0+sOVMBjl8=;
        b=Uwr0bUxHwmRefk2tLYos072EptHmT0m1JC2yQNRs1mXKxBBu7c5xY5u6o+TtPpdJQo
         dsLVtMZKGzssjcrLeQhLo+cLPSFu+DnsZ4Ky33iWl3G0/EiPMpYPwu44dAyfgDjuPz+V
         ewzOTHcBBLzPHLBG0E0x6qsPNFFMEOWXsZc+ECQj2qgOzsFa9fJsO6yuFrNdGx8TNy09
         1nzmjAogPnFc9ILrJZxuIMI0rSDgoHfNfus+aNO1KGpwPNIfgj5pIGEe27K9dwTr8iFA
         l8Lcm1tiGBS//W4BIeYtlnOyakE5LHStLmufqpX19Otw9ZxyO8dJ2qz+DwwG3OrvjBDZ
         jbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878661; x=1777483461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfAxfiLJzxkm1m8t+L1t3IM8HEx6RLiSD0+sOVMBjl8=;
        b=P57b+0iFcSm4upqP/y33DtRtgjlNqVb9VsCl0uO7u8Vkk/bDy4493tSfXWH2laT7N4
         hgmp8i2j8g4s5hBQ+1pGjGmMPqZzqj5iymolbebx2BDGBprNGvjyKAoLkDTruMltN13r
         6+f3n4C7ZrbgPD+E2jBS6T4vQkDwXPE8GWpScr25WpNFnNcbel02vAdHn3Bpr6N2kaWM
         IqvZF/L1Jfyw6MZm+3S/T9wA+RIkFdyzvEcSnYutiuy5yGO6dPBwNNKl61Mp6/jh2hx/
         YGR/z0/ncryHwnq/aSFk+OjtdOI4J7/KuGtw0CLI6tNmcE7YapDucMy0WHX/VDmCPgqE
         81cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+p07tEJvaJ0GSoM3KmUya4fdYDU4d2Z1/5RiM3u6OwCEPuxQGJGExV5/+XpO59BOZg3gP/EFhy5OMaHs0M@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1akRqPGI60LY4LHJVix4MyJHQ8PXwvDQS86geAOGvsLm1eStc
	sztKUtwUSWnIBDT45Fa0wthmwRLunwHpBjUouKFGQJLo/Y+EZwwcefVwqd3Trsr8vKXaV4els4f
	H10HPP9/yjo6dCobrP5xWT/FQOVy45eQ9zsj3YrcKNGuhhY1a9w0u5mj1P93O2PcT8x/0
X-Gm-Gg: AeBDietLcgF2mnByOm/9KPkI4Nm5WazDnmruCpI9q66GMAyWoUL4pWvvmDmb4oL2hJY
	wotnKVnxVMti6RlJN/vl8xUeR33zI4vjnJJmr0cPxLbPv5j1c3DraNlm5/P2rFobSxFMnf5mO31
	19qn/mG8MTMjaTtfG/qcTKt1fYSINBqhoPC5UoEq3hIIqLjnEjfevuUufz2KUTipvlu0jQKCVLU
	lf/5dqF8curGwJDE7HV7rnIcWmtw5/sCJm9MeClCgvaztcCyNnon4WqP/AU9maGC58VPes61wGs
	rrHzTL2hVcLEOJqac7ejSNf53eKUozDMXccn1Xbe5/c1u6s66BrA185T0r/CugnHlmYRUf8bs7y
	UjqUrXGF3orY1d857+nRNSxPQuf1fg2Ug7lglV5lwBYyOXxpV/c/zyQ53lI6a1sq3VWudID9Rjh
	HXgkpbkyzp8z+emWpc5XRZZu9ws8gs3XvguTLKekg/SB8oYw==
X-Received: by 2002:ac8:5816:0:b0:50e:5f9b:eb55 with SMTP id d75a77b69052e-50e5f9bedc0mr175002981cf.15.1776878661206;
        Wed, 22 Apr 2026 10:24:21 -0700 (PDT)
X-Received: by 2002:ac8:5816:0:b0:50e:5f9b:eb55 with SMTP id d75a77b69052e-50e5f9bedc0mr175002511cf.15.1776878660705;
        Wed, 22 Apr 2026 10:24:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc328sm4700740e87.25.2026.04.22.10.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:24:19 -0700 (PDT)
Date: Wed, 22 Apr 2026 20:24:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/5] phy: qcom: edp: Add DP/eDP switch for phys
Message-ID: <ifwckc6zx3ymlyjpqyt6iqglgz2c4thianaxxups7h5ts7ikyk@m67gguvtkvzb>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE2NyBTYWx0ZWRfX/Api696nLD55
 AZQaTYwaYrtfN192tOgLrkwi0jFcYR6QMnZV5u9tQP8ZwbfXS1UWmwaw1a624M95uVh7Agj5uVl
 Z5oeOuZIsT8YrqhyfWD0X9V1TN/QX20KOFuCl3+1yVJhR7Q+YkjnOMqWp2XekqRnjHnMsVYgpWK
 rSJxqU8FXB6vUqhrbOWZJgpHh+qZKQS1OeuADDh7yOgJxR/D70/OiB46pPrs2XrhpnW4FcGyvWa
 DPVOusftP3bsOCU2GTomTJvh/74q01Yq80FSIEFTYUKfAar3r+BHXMRtdp2aZU5Axa6BBR5FTuZ
 tPco6bWe17MJ73mCts/7hX7lIo5CQH42nc/hvMku+Zu5FhHdm1vACqtMyLZGRN5oFVJUIqMpqdK
 T525po6nw+GCBj7BrHVkth9RvHtzBnGYVgD5av/e36lohHbxq18pO3RcxWcd/+VENcbf+qzfuKy
 xZGphbQS4xmvptozV6g==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e90445 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=eAMIGqEPAvrGGsoAY1IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: d3uU-XJddEek_cNKJK7mIstOqBAX0E54
X-Proofpoint-ORIG-GUID: d3uU-XJddEek_cNKJK7mIstOqBAX0E54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220167
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104159-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:url,infradead.org:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E093644945D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:01:50PM +0800, Yongxing Mou wrote:
> Currently the PHY selects the DP/eDP configuration tables in a fixed way,
> choosing the table when enable. This driver has known issues:
> 1. The selected table does not match the actual platform mode.
> 2. It cannot support both modes at the same time.
> 
> As discussed here[1], this series:
> 1. Cleans up duplicated and incorrect tables based on the HPG.
> 2. Fixes the LDO programming error in eDP mode.
> 3. Adds DP/eDP mode switching support.
> 
> Note: x1e80100/sa8775p/sc7280/SC8280XP have been tested, while

Tested with eDP or with mini-DP too?

> glymur/sc8180x have not been tested.
> 
> [1] https://lore.kernel.org/all/20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com/
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v4:
> - Splite changes.[Dmitry]
> - Add sc8180x tables in a single chagne.[Dmitry][Konrad]
> - Link to v3: https://lore.kernel.org/r/20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com
> 
> Changes in v3:
> - Rebase to next-20260224.[Dmitry]
> - Only enable TX1 LDO when lane counts > 2.[Konrad]
> - Link to v2: https://lore.kernel.org/all/20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com/
> 
> Changes in v2:
> - Combine the third patch with the first one.[Dmitry]
> - Fix code formatting issues.[Konrad][Dmitry]
> - Update the commit message description.[Dmitry][Konrad]
> - Fix kodiak swing/pre_emp table values.[Konrad]
> 
> ---
> Yongxing Mou (5):
>       phy: qcom: edp: Unify generic DP/eDP swing and pre-emphasis tables
>       phy: qcom: edp: Add eDP/DP mode switch support
>       phy: qcom: edp: Add SC7280/SC8180X swing/pre-emphasis tables
>       phy: qcom: edp: Fix AUX_CFG8 programming for DP mode
>       phy: qcom: edp: Add PHY-specific LDO config for eDP low vdiff
> 
>  drivers/phy/qualcomm/phy-qcom-edp.c | 221 ++++++++++++++++++++++++++++--------
>  1 file changed, 173 insertions(+), 48 deletions(-)
> ---
> base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
> change-id: 20260205-edp_phy-1eca3ed074c0
> 
> Best regards,
> -- 
> Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

