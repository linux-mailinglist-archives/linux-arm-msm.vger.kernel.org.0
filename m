Return-Path: <linux-arm-msm+bounces-94713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 55k7LCwZpGm2XAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:47:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1A1CF336
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85B85300C304
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 10:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CBA2E542C;
	Sun,  1 Mar 2026 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHzedMVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hN2y1pUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07F72D248D
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772362025; cv=none; b=cvrBI1lqA9FiQ1X1Cd23TUBGrzAb46LuPOi6SsPeF29f4gh80H9x1dqERf9L6ZWQYYJjqaFCDhu6uVezlEH6OsMDbS/1Ew8PXJpL3m3Z5R5x+sZanDEka6bnU8+jmcEL7FkBFaf1Wt5uggXtDdRHm6B8QlnHFO16L4OiaC/gp/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772362025; c=relaxed/simple;
	bh=uW8W0EQhL5MHVWOOJvr908HHoVSklsT9IyQhIzg9DOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMLbLdA35Xln6ft7Js5Vxdil/P/oabGS6lLQwlCb8jK/xQNiXusnor6zSnbm7LJ2ti1moExrFY4voNAA/i2aX8YxnFf6B/0+MwnU6H47+LLgFCjwK6BpEDgM83AvEBIin1ox69kPaUlraRhh2vtxfvJ+b9FaECgWAsZCERhG/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHzedMVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hN2y1pUc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6215EE3b2082139
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 10:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zMjjSX07o27ArEy58bafhXTf
	zgI0LtEb8dLPu9QRg6g=; b=YHzedMVvaaQRmITBFe8xlRAGp8P99EssBQY/pKU4
	5F2QJ5TRhTc6aItMbvykuefuUQIazptsv9UE9PHpvwpC1M+e1jXsUT62ohJytu/e
	RldhLQBp18YepRjUSmK6wuw5wmhrPTkxHh0nYq0lBb+4nK4Ztl0J/nvTVcQEhFmQ
	jAhvb//acoWSA3UXKpi1kdahy8aWY8gtcFTmo0MoXVHVDbZtADY+PBM2PDG5mLct
	9m7MkPMdZ843hZ+h40XdTx1WGnDLataaldhWe/qsX5StDb8rU25k1g+v6s9gPp5d
	3cg1+H4J+zKzj/uIE/BAyVD607KfK0kE+a/7LiwBCbbnSw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6jh2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 10:47:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899bef1ea49so406938666d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 02:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772362022; x=1772966822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMjjSX07o27ArEy58bafhXTfzgI0LtEb8dLPu9QRg6g=;
        b=hN2y1pUc80SdsROJmod5hCuAKlSee/LYbCKPM5xyIdSI1SRwWBxCM4fwmUXVOWzkDP
         GA74XORfjoyj50FfiS8MX89bE8Xth+tUozdh90qpKKFfYJgx1TZZUK7hpajWJ4Kb0+Z8
         XBfY4/MhE1YOawuOu6BL8DTVQQ2b8iWmGB1ESy9xLGlZEoupaOFDS4HoCStWDYdp3Cey
         JY62JPYyA3VWMZ3jsSVtkUoh6yLiHFUYPXyyWC+w3ra23ru/n7yno12iIkparPlrJbJn
         LItcYZUhgCAGFZvjDKt3zZCG9IIpnqJffBgJ2V4IXn/Dk6X0014ARrYE6JyJzDfe4BrD
         yHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772362022; x=1772966822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMjjSX07o27ArEy58bafhXTfzgI0LtEb8dLPu9QRg6g=;
        b=TR7suyWrUOndAGuvBu7zrhv86lmg1yXk4cstwqyjL2+M8rwLRD2QAXPZAOrUJjuitY
         da16M/oP88XF8StdZ72wwjUshTrEx5ueHEnugvJuJLv8OM+o20Yt+6yZvUvYBbmtb1mT
         O2uhQb80NQfOplivjQ8R54tu3yo0k0jQ1uhDYeSCdiPTZecxnQYU5dNlmWSbdefr4o31
         wqeyEUOcjuaakPVu75V006LHwt3fCdpVB1J1gxvYVtQXjCRB9xFNn0Z6b5Cn6Gwe6NoX
         xXNlijhht4GsBQnHNf+n8lHgyiAHfB0T4eOhLFbh/IUSeMJoMPLvRqj0/JOeQW4q7t/V
         zWRw==
X-Forwarded-Encrypted: i=1; AJvYcCXkmdvUuBfKJCh61koj5vj0DM/Hwg8mD3MWnsPUFDviiB5yZi90Z6E9NzoY+//Wk03mFIk0AGKr4+CddXA/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+g89mZqD61Qop/vi3CHCtEOx36q3mt69ehTAFs3uYIFL31kK
	ymmofnSI29UyKZkC4WZekmpXhTLkoiI1PDkZQFIeuhErAwQVoVwMNJJ2fDUEuZlnAsG/mAnr387
	yY13yvBfxN7IQBjCWR1pk1G1borW5UuzCkUs2OM9S9wjaKYIxHJjoNTTVHQFJPbXl5YHN
X-Gm-Gg: ATEYQzwLGUIFpTLWA7b7UkHq2EmXMJ8tXH+E2FcCyo0ds+DTlffHGxaHqCUULGEHsQ1
	Ty1XS17GILE36HuHip+JqVxyG7ZBiapyFEdGyrTtBDoZtyLvJEegy9TZHUa6rVSnpOv22enBhW9
	9822Oo05GBRxG9qJ80JaPrAJJjaI9U4Xt1N0rOjyfVsQjH5FSVKSRtsesznuctwM9ChNdDxw0I5
	sCmpiy0nMUS4+Xh2MDv7IIdSd71FIKgc39adP6ri39DsjHV4nh2/R0wMQo37LHu9Kv5TT63EjUJ
	p/LTfPsWtq0n/dgIW0G6XqaOXkSi4hlY68FF++LjltsftIW3mVmGW7/+SsxLPgEe2BUUasA4sQC
	KFW9/cDM39/R6Jji4buvX/lnbC4+nykbtqit5scraKJOY/8YdI3JyE2AT7PW59CvePZn2AWWUxy
	/N9HZxl1PpNC7gQaSFFdsl/BVMozWgNv8zie0=
X-Received: by 2002:a05:620a:199c:b0:8cb:50d6:18c3 with SMTP id af79cd13be357-8cbc8d6ef5bmr1217217985a.1.1772362021835;
        Sun, 01 Mar 2026 02:47:01 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8cb:50d6:18c3 with SMTP id af79cd13be357-8cbc8d6ef5bmr1217215585a.1.1772362021320;
        Sun, 01 Mar 2026 02:47:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bce377sm971860e87.15.2026.03.01.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:47:00 -0800 (PST)
Date: Sun, 1 Mar 2026 12:46:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
Message-ID: <ehhnta6zvfua723llpb52hh3lwqdh4ttomzt7xqrmcjnsslbop@p4w3gjzxp4rn>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
 <861pi3amuu.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pi3amuu.wl-maz@kernel.org>
X-Proofpoint-ORIG-GUID: N9wajT3nxwQQpBZx6aXPAuOfKSjHPT5q
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a41926 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=YG64nluAAAAA:20
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Pq9JgrngHnaR5_AiyuMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5NiBTYWx0ZWRfX/Px23c+CZOSQ
 UHyQwliW2ZYm1Nr0soD20f5j8yzjoSnnwAfNCfp7h4Db/Lb7OzYZ9WFYTMTkmH8IRHF/3jKdano
 wG4c9gOMEk0RjSaxjYOZiFhU4Z2jeB2SQ7igDcw1/56iYhAd5ladO4zmwq/bVyKWl0Pd7MQyfpy
 J+bCeImUEHDbE58zqLyuRZrOaXl6P5E7b9eEjF3+AkopPNhtjssGP+NzqT6exmD5NCXoGBTf+sX
 sDZoxrND2lTt4jeUNPP0jmmu7q5NGZFnZLLd6CmzeFE/kdmcYFsgoW8lEcKkqJDJPkAxNHyI97U
 eeukflogdCxUOQq+4xrw7/okvB0wrzdQ8GEJ26cK/ckwojWLkr3Hv8XpP3zV5D7RLhv6ZKFcUzo
 HyqeipkNHT2XkW6WD01XQHMhfZp+hN/9tUbTZFpqD3gm0fomIL+dRuSzcKI+y+KADo2ZH6rfreH
 BQEycppuHJ1XOaMok7g==
X-Proofpoint-GUID: N9wajT3nxwQQpBZx6aXPAuOfKSjHPT5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-94713-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.228.225.192:email,1.111.188.160:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39E1A1CF336
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 10:02:49AM +0000, Marc Zyngier wrote:
> On Sun, 01 Mar 2026 08:34:20 +0000,
> Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> > 
> > From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > 
> > Change of_map_id() to take a pointer to struct of_phandle_args
> > instead of passing target device node and translated IDs separately.
> > Update all callers accordingly.
> > 
> > Subsequent patch will make use of the args_count field in
> > struct of_phandle_args.
> > 
> > Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > ---
> >  drivers/iommu/of_iommu.c              |  2 +-
> >  drivers/of/base.c                     | 37 +++++++++++++++++------------------
> >  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
> >  drivers/pci/controller/pcie-apple.c   |  4 +++-
> >  drivers/xen/grant-dma-ops.c           |  2 +-
> >  include/linux/of.h                    | 21 +++++++++++++-------
> >  6 files changed, 44 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index a511ecf21fcd..d255d0f58e8c 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
> >  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >  	int err;
> >  
> > -	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> > +	err = of_map_iommu_id(master_np, *id, &iommu_spec);
> >  	if (err)
> >  		return err;
> >  
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 57420806c1a2..6c3628255908 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -2102,8 +2102,11 @@ int of_find_last_cache_level(unsigned int cpu)
> >   * @id: device ID to map.
> >   * @map_name: property name of the map to use.
> >   * @map_mask_name: optional property name of the mask to use.
> > - * @target: optional pointer to a target device node.
> > - * @id_out: optional pointer to receive the translated ID.
> > + * @arg: of_phandle_args structure,
> > + *	which includes:
> > + *	np: pointer to the target device node
> > + *	args_count: number of arguments
> 
> Number of arguments *to what*? Isn't that the size of args[] instead?

It is a number of values corresponding to the phandle in the DT
property. It might be not obvious here for iommu-maps, but the struct is
idiomatic in OF world. Let me quote a (trimmed) example from
qcom/sm8650.dtsi (for a different property, but it explains the meaning
of the values here):

gem_noc: interconnect@24100000 {
	#interconnect-cells = <2>;
};

epss_l3: interconnect@17d90000 {
	#interconnect-cells = <1>;
};

interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
		 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
		<&epss_l3 MASTER_EPSS_L3_APPS
		 &epss_l3 SLAVE_EPSS_L3_SHARED>;
/* I skipped the second pair, it adds nothing here */

Here the parsing function for this property (of_icc_get_by_index()) will
call of_parse_phandle_with_args() 4 times and it expects to return the
following values in the of_phandle_args:

1. { .np = gem_noc, .args_count = 2, .args = [MASTER_APPSS_PROC,
                                              QCOM_ICC_TAG_ACTIVE_ONLY] }
2. { .np = gem_noc, .args_count = 2, .args = [SLAVE_LLCC,
                                              QCOM_ICC_TAG_ACTIVE_ONLY] }
3. { .np = epss_l3, .args_count = 1, .args = [MASTER_EPSS_L3_APPS] }
4. { .np = epss_l3, .args_count = 1, .args = [SLAVE_EPSS_L3_SHARED] }

The whole of_phandle_args is then typically passed to the corresponding
xlate function, specific to the paricular .np ('provider'), which will
use #args_count values from the #args array to return the object from
the provider.

Now let's see iommu-maps (again, qcom/sm8650.dtsi):

apps_smmu: iommu@15000000 {
	#iommu-cells = <2>;
};

iommu-map = <0     &apps_smmu 0x1400 0x1>,
	    <0x100 &apps_smmu 0x1401 0x1>;

The property matches current definition at [1], however this spec
doesn't match the DT practice. It forces that the property should use 1
cell for identifying the "object" in the IOMMU provider, even if the
provider expects to use 2 cells (two args).

The correct property should look like:

iommu-map = <0     &apps_smmu 0x1400 0x0 0x1>,
	    <0x100 &apps_smmu 0x1401 0x0 0x1>;

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-iommu.yaml

> 
> > + *	args[]: array to receive the translated ID(s).
> >   *
> >   * Given a device ID, look up the appropriate implementation-defined
> >   * platform ID and/or the target device which receives transactions on that
> > @@ -2117,21 +2120,21 @@ int of_find_last_cache_level(unsigned int cpu)
> >   */
> >  int of_map_id(const struct device_node *np, u32 id,
> >  	       const char *map_name, const char *map_mask_name,
> > -	       struct device_node **target, u32 *id_out)
> > +	       struct of_phandle_args *arg)
> >  {
> >  	u32 map_mask, masked_id;
> >  	int map_len;
> >  	const __be32 *map = NULL;
> >  
> > -	if (!np || !map_name || (!target && !id_out))
> > +	if (!np || !map_name || !arg)
> >  		return -EINVAL;
> >  
> >  	map = of_get_property(np, map_name, &map_len);
> >  	if (!map) {
> > -		if (target)
> > +		if (arg->np)
> >  			return -ENODEV;
> >  		/* Otherwise, no map implies no translation */
> > -		*id_out = id;
> > +		arg->args[0] = id;
> 
> What if args_count is 0? Given that you place no restriction on the
> way this can be called, that'd be entirely legitimate, and you'd
> corrupt something you're not supposed to touch.

args is an array (not a pointer) in of_phandle_args. As such we know
that args[0] is legit.

> 
> >  		return 0;
> >  	}
> >  
> > @@ -2173,18 +2176,15 @@ int of_map_id(const struct device_node *np, u32 id,
> >  		if (!phandle_node)
> >  			return -ENODEV;
> >  
> > -		if (target) {
> > -			if (*target)
> > -				of_node_put(phandle_node);
> > -			else
> > -				*target = phandle_node;
> > +		if (arg->np)
> > +			of_node_put(phandle_node);
> > +		else
> > +			arg->np = phandle_node;
> >  
> > -			if (*target != phandle_node)
> > -				continue;
> > -		}
> > +		if (arg->np != phandle_node)
> > +			continue;
> >  
> > -		if (id_out)
> > -			*id_out = masked_id - id_base + out_base;
> > +		arg->args[0] = masked_id - id_base + out_base;
> >  
> >  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> >  			np, map_name, map_mask, id_base, out_base,
> > @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
> >  	}
> >  
> >  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
> > -		id, target && *target ? *target : NULL);
> > +		id, arg->np ? arg->np : NULL);
> >  
> >  	/* Bypasses translation */
> > -	if (id_out)
> > -		*id_out = id;
> > +	arg->args[0] = id;
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(of_map_id);
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index bff8289f804a..74fc603b3f84 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
> >  {
> >  	struct device *dev = imx_pcie->pci->dev;
> >  	struct device_node *target;
> > +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >  	u32 sid_i, sid_m;
> >  	int err_i, err_m;
> >  	u32 sid = 0;
> >  
> >  	target = NULL;
> > -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> > +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> > +	if (!err_i) {
> > +		target = iommu_spec.np;
> > +		sid_i = iommu_spec.args[0];
> > +	}
> > +
> >  	if (target) {
> >  		of_node_put(target);
> >  	} else {
> > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > index a0937b7b3c4d..e1d4b37d200d 100644
> > --- a/drivers/pci/controller/pcie-apple.c
> > +++ b/drivers/pci/controller/pcie-apple.c
> > @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >  {
> >  	u32 sid, rid = pci_dev_id(pdev);
> >  	struct apple_pcie_port *port;
> > +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >  	int idx, err;
> >  
> >  	port = apple_pcie_get_port(pdev);
> > @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
> >  		pci_name(pdev->bus->self), port->idx);
> >  
> > -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> > +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
> >  	if (err)
> >  		return err;
> >  
> > +	sid = iommu_spec.args[0];
> 
> I find this stuff absolutely unreadable. You're fishing the SID in a
> random position of a random structure, without any documentation of
> how this is supposed to work. This really needs a wrapper that hides
> this implementation detail.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

-- 
With best wishes
Dmitry

