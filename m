Return-Path: <linux-arm-msm+bounces-107596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB+6GKjJBWqFbQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:10:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B6054221C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C98C30378BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6490E3C0A0B;
	Thu, 14 May 2026 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNxWrG1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCEEhg+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007773DF000
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764180; cv=none; b=PmjJr2ixklFsJolQVmvemRGe1uT+EN1MyrPgDL0P/oo1sWtGdI641pi9VWgZYencaU0mzBYh3eNZwvF03doxWKEhTA0sxmbiamGucF0YCfGpZu9khYX8QvyewFzs/IqqLpYTrBvWLNa8B4iomEwkbpOwkFK04BpON9W+/FkUfYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764180; c=relaxed/simple;
	bh=PMt/S965DBrZcSHo/mx/GlpkYgz3KyfWQCDcoogPVDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZI91bQPx7Cj2DKgKNR9a5rHXYfn67F0T6cajLtPUTPZJ+gsknEFGzPp+w3UR2Lxj7nj1SJm2caAU4q+A6Gs15lkTEvJZJaJTqgAu3PN2UM3G1GUDZTcQB6xJ0YBKwTDVT/l/nKflEoeFlNuvhzHKFubV1jF14S/5MGrNmxugIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNxWrG1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCEEhg+c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeU1T2713281
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TSEOS7FzfulIGgplAzzxDVRV
	URGWpeZGkmEG7M0BRYc=; b=TNxWrG1V9cFtHOA7GwVrqbitOhhxXQaiEqWg8fzJ
	+sLGVdUfUGRpvq014GRvN/kRxViA1KU/we2/9roTmstiJyNK8Z66EoV+I+Z8pMho
	yXtuz3V7i3OejWJFlOJv3FqGo3BxoNP9JX4aAxp2FcqsfJgQaKfaOjwDm6uKMhBX
	qI5K8ZS599kSIKbvIS61BMYrCMmR2HsQulXCvi7LzV5wwzyezyH+/yMHNvOQleVN
	ohVmUNdeB8j1zM7yJVfJB7u5tGm9IxHq56tFrmMmJEHSlwnzPjd/byip2FqdRrHO
	onjKWmlU4BWLCglZIABsJr5iUfrnaDqGhDii71DgMDiekQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89c0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:09:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1270dcd11c1so15632229c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764178; x=1779368978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSEOS7FzfulIGgplAzzxDVRVURGWpeZGkmEG7M0BRYc=;
        b=DCEEhg+cI8unhMsP0GySKm/3XTNGCcTzO0IGIz1TAh4Wcl1qUnsJR6GTIy6bV+/cC0
         XQVagVIDJ52K/TAGMHxg46Zmdq2v0GayO3cSG0Jv6ofzHCEiEK0adg/lad3tt8WSqUXQ
         KsLYHEDdMThkNZIKexJZCcfj9Yq02AFQ9MdGdaEA6ezHxQSvmyKIgImPAIBW0nXMezS9
         bK833jp6XJdH7rljSDICiOGXWtWHOeSl99p1ZnSfu/ASPLgUEw5bp3PgzCEWI3nWPYvx
         I9bjnoDUHATEFzTFbNdJ1NYWoCSgRCcDQHM7sA7HAvLV45lJpCqlyw3OR/Wr/HBOgb0X
         qtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764178; x=1779368978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSEOS7FzfulIGgplAzzxDVRVURGWpeZGkmEG7M0BRYc=;
        b=LuR6mYdaTBgp84DsaLAzO5KOw70gepC3y6z0hZ9WHDPgE4JRkhlZkhsSMtukJWkV6x
         9smNSzxVl3OMzJiTDWHXxrtZflkDfGmzU9gMxhgyJeT87kFF7ooVoe7OSfa0YekDhZiL
         dOQua+rlJ6hzS1ZDBvs4haNpdZ3EZhD3wqNWWd8bTaHQgMUiVnIjI7+9/7nImq24zqra
         6dSgZ0M1TLCJVPOEY9NbsczTxHgrqMEg7kOr8/fBOeY6lvYzgT9lm022/fEzOQwl0/Rw
         hLdMbzyOfRKdkO5JJvKjQCuyUjQrjL8I+tKILdgrmm/e5gb0q139TElcv36PcTVFdYqy
         DMOg==
X-Forwarded-Encrypted: i=1; AFNElJ9BOcZhSsT0j2GcM5+aS/toGYUwqYww9Xn1wrhZxlvJxJwWlLrD343V6uOVb+5hTfCvToFYtHjJk19+MCHh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcv2vmHkKDPX0gPyjKAs78uqsfga+u4UkuyrWMHVP2r0xPHYz/
	bpb8RJ+2Vql5nQi0zDyD3GJmmGAYhSnpoCIu/zHQ6rjxggYzM4h7rUby96jGpisT7+NNSVLDNwq
	A+P/RWmoHVHqFQx4bnXvqUjsomXJO8E/pvxL8YcC7tt+whTdhaN4TZNStjkwJnK0s/tTo
X-Gm-Gg: Acq92OHrAQJ8cG+Qz91+7VoCleT7GbNNGRjYgBDDYCL/V0B81HVolDexMMCk9PuTJMT
	P8xqgBUsDQk+XeQVqzA1qyOokClHpZs5icuy0fQkvjSe08MoDff7Fqjg7rRhck403yaFHUarDs2
	nQZhQiPS5AZ1QtLHdSY2QbxdJo6RpqTGkpxMGpfhvucxPtxXYQFatOAUfnvhEiOD8Pl5EVCRPIZ
	UWhGBELaaKTwAd1MejKVohK10IJUA8fCHQURU/g2GGVHbFJGerzb93R2zDP+FMo+den30RYuRhm
	/fHKkXNt08vag/PirXQOvV5zOFM34lxfkT5DlU7F+elgaCcQ8ngedOvG0n9Oc7C51zftTKx9OTG
	15PPRybyrV6J2x1h1mTIgiqyOHLwi6GB1EdhbP+IAo387p57Aib8QdnSn+9sJBugtR8n9/98Ef8
	Y=
X-Received: by 2002:a05:7022:1a81:b0:128:ca83:5aa3 with SMTP id a92af1059eb24-1349a6f91b5mr4300110c88.1.1778764177525;
        Thu, 14 May 2026 06:09:37 -0700 (PDT)
X-Received: by 2002:a05:7022:1a81:b0:128:ca83:5aa3 with SMTP id a92af1059eb24-1349a6f91b5mr4300067c88.1.1778764176882;
        Thu, 14 May 2026 06:09:36 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351d9sm4393185c88.9.2026.05.14.06.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:09:36 -0700 (PDT)
Date: Thu, 14 May 2026 06:09:34 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Message-ID: <agXJjhDdsZE4VHAE@hu-mdtipton-lv.qualcomm.com>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
 <0aa79750-ac75-4111-ac82-ad5672157c90@kernel.org>
 <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMSBTYWx0ZWRfXzfbffodsT4Lb
 OtFLrA0wKvrnvpJYvlAoM/7F47mtK83AwuIiccGlpQjm/52IGhbiEY0RRdWmFO8bKHa7EY4aHEq
 gERRVTY/WDqVGZfFpgHUvgxDYeddDXs7FfNiPOGvdryVpmPVs5t55/3AWoLAXzgxxgnEiXp054k
 8wdjrnKbcz30lXzVkB+uelGhwrr3JHiwWBJTig1yMZUflywCtwioPRv+QHS84PmV4mcFyudG61x
 Nbu+I83TTBFtfOEJbOJ4MO9dM9Ut0Ap1UNl14FueL6DmVZUXlJ+xbskPV3IfrLh9nwlSGSDoLjJ
 G/8tgmDmBanRJHcPx9nNb64INwzEmbyl5B38rfwimpBCkOb59I2xnsNhorfigBeJN2ocsM9eQ50
 RCiJO41SORpo3BEe65GBNCayjGbBtzzUkR8Lt4aGQ/LmjOf1golQHL0aanTPPfULVD7/gJZwZDi
 UIBjefe/TME/FB7/Y/w==
X-Proofpoint-GUID: uuu6XvFt5J-KA3ZkLUclZRB1vs4jLiY-
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05c992 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zvVpzuEAzJinQkndZGQA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: uuu6XvFt5J-KA3ZkLUclZRB1vs4jLiY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140131
X-Rspamd-Queue-Id: A6B6054221C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107596-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,hu-mdtipton-lv.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 01:39:24PM +0300, Abel Vesa wrote:
> On 26-05-14 12:52:21, Georgi Djakov wrote:
> > On 5/12/26 3:18 PM, Abel Vesa wrote:
> > > The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> > > node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
> > > SDCC1 interconnect paths can resolve to a provider node.
> > > 
> > > Bump the qsm_cfg link count to match the new entry.
> > > 
> > > Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >   drivers/interconnect/qcom/eliza.c | 11 +++++++++--
> > >   1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
> > > index a4f7903f0524..6d12a1c3c034 100644
> > > --- a/drivers/interconnect/qcom/eliza.c
> > > +++ b/drivers/interconnect/qcom/eliza.c
> > > @@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
> > >   	.buswidth = 4,
> > >   };
> > > +static struct qcom_icc_node qhs_sdc1 = {
> > > +	.name = "qhs_sdc1",
> > > +	.channels = 1,
> > > +	.buswidth = 4,
> > > +};
> > > +
> > >   static struct qcom_icc_node qhs_sdc2 = {
> > >   	.name = "qhs_sdc2",
> > >   	.channels = 1,
> > > @@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
> > >   	.name = "qsm_cfg",
> > >   	.channels = 1,
> > >   	.buswidth = 4,
> > > -	.num_links = 29,
> > > +	.num_links = 30,
> > >   	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
> > >   			&qhs_camera_cfg, &qhs_clk_ctl,
> > >   			&qhs_crypto0_cfg, &qhs_display_cfg,
> > > @@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
> > >   			&qhs_mss_cfg, &qhs_pcie_0_cfg,
> > >   			&qhs_prng, &qhs_qdss_cfg,
> > >   			&qhs_qspi, &qhs_qup1,
> > > -			&qhs_qup2, &qhs_sdc2,
> > > +			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
> > >   			&qhs_tcsr, &qhs_tlmm,
> > >   			&qhs_ufs_mem_cfg, &qhs_usb3_0,
> > >   			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
> > 
> > Should we also add the sdc1 to some BCM?
> 
> AFAICT, it should not. Even downstream doesn't add it.

It should be on CN0. Downstream not adding it to CN0 was also an
oversight. It shouldn't make much difference in this case since CN0 is
an on-off BCM and other BCMs along the path to qhs_sdc1 would indirectly
keep CNOC alive, but it should technically be on CN0 just like qhs_sdc2.

Thanks,
Mike

