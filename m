Return-Path: <linux-arm-msm+bounces-84898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86094CB2D34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 12:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60DF7312E15D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275EB2FC879;
	Wed, 10 Dec 2025 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otf+LRyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KS9ejfbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64E72F99B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765366005; cv=none; b=KlcvOmoPPvNBkN3Qb/cYpukvBPkfxP57Sss7JspEW4q/qB0o/JIPghARewsL6Z2TDnY+hA3q0/O3n1NVnnSUce3Bqy+12vhklW1VQD8uamwCepC5SzPT3tX8j4bky8m3mz9TusqCwTiX6RrcLjQv5HXObBs9jeZILossVb0+wuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765366005; c=relaxed/simple;
	bh=qZm4xqSd0nWYAh/2gTM8EQkKUakA2daknB0qCK1sjG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvpTs6ydBlTTDy9rFdwjnX78xbgOifcXvqhTvEKw7UMwPOPo+yujvhxCcu4PL1dd0EsnKa3/c9mmDLypnTDWHYL8W4HG6mbTtHOvfC6PIyHLsDnYMiRRKxLIbnqX7EiVH8L3hm5iSFIpbdB7/BNu/8zI0T2JXs2v0j9wH0bHrIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otf+LRyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KS9ejfbS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAAPh6a2303335
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 11:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TetCbA0vG3ujJ9H342HVOB/k
	gW1LYI/zlgrlQ7ZPt7E=; b=otf+LRyE7l+jTHY348nDXVPM8sBQfLqREbc8buUD
	tPMoNESiUwR0WW1Acrk0771Y9wKMIYkqENxdd05EP3uvfOu4cdg9Y2zm9zthdutI
	MNv7bpj9hun5Mbo/nEU50S8VvQAetkJjSMGosXYh3x/sNxJp9NElK/c8WotzEmHs
	mLnlKaEhFHYRr8Thu70UOjCK6RIeEpapCL0BpzRhmLzot99ZIL9FXazQSmJkwN7A
	6VK1JMIV0hS9rVSeVix65Ngxj80vkVO9cMdJX4++ZvOxxrc1p6Joxyu5AAQH5Jg2
	tGNNaPLmlbzn0eWnRbPrwXahGutMoe1ZQRpS8XzCEdYenw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay73rg533-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 11:26:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e235d4d2so2263412985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 03:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765366002; x=1765970802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TetCbA0vG3ujJ9H342HVOB/kgW1LYI/zlgrlQ7ZPt7E=;
        b=KS9ejfbSflO0ZXE7i+mAZ9mVXD0kp/Lit5UpHlD+HYn4r+ATRJtM7vNPNl7ewZAAo3
         zu7ADbW1I/mf3YGROOP0nlFVS1I7O0RH7Of96FKxDDKzGyQFw0b84vy3pU+IB5NFcuIm
         bOZoB5HAF4JQPiqr4sX2NWEloodChNQt+eBNPnGhhbpFL89F89wyBeAi856oyXcpu8pu
         sUicXRzy/NlvWA0wxqF1TNOdljtPIjzHWmk1lC1R9Jnye555SeuzNL19meDWdZdhQZ9x
         duUc69q0C7mGoaLwhVJ1eg2fFOANpkdhd3rXpZMBgau3ZW42f0c6WGyCiidTspJ4CBKo
         3jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765366002; x=1765970802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TetCbA0vG3ujJ9H342HVOB/kgW1LYI/zlgrlQ7ZPt7E=;
        b=HnAt90Yl+pTm6xfr3N9l3WLcxmjmWyO+Bm0BEpADLLoI6//Xz9lfPvKYFdMme+mul1
         WOhh3YUjM4z+OZSdnuYPeTMqt8BGBNIhaPwwDF0g0LjdNOfeU3a3uSBJZPREIGRVe5D+
         hluyq9CJKupDYuWdeL8T3bX+rbwGbutgIArGxovpUrd0UXzPbl4/N6l8JWp4fUiae6nh
         czs42OqgTa+02f7OV558+6krtTfelzzbxxSK/ynSl9EyNpC/FJ0oON+jy+VqUOLZYYIY
         1AfDjCvoXY2A3TgRAo5J1t2Olywc278jJft4RT0untm9t1YLDA5gZkEoNQhipQybysop
         Ix6A==
X-Forwarded-Encrypted: i=1; AJvYcCUxAF3nQCuhAVORBBsteGn3F3y6zAiqWDnlAKdHwEEj3kdz0PeQMuJvm8JGGeOcxp+AmG/x1uCo+k+EEjaA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8Z9rl0otu5S3IW/MkF1F1alFbCkMyRT8pABbjGxgHH6OW8Gj
	S++Ujk7FCbgHmwQkpCOh8np7f6mCbAvyP210bvkO8VFTzeDppN62g/ysHETfHCkrWpDaG4DhKHL
	38/iKeRK4p4Bv3hr7yegB9tZEHFcyTHCa+2ihTB1fDN+ykvvC13m8MZQlrT6DDMPnDt/R
X-Gm-Gg: ASbGncukrfxlxZen1zpZVw7aeJFGKOpQSl+tTdzSd6q6h0ObZ/eCKYSpKNUMRjvm0IA
	L3MCReK8uMAzJx79IioLxOTyTgefQKT9M42ns50hCwGgkmWTo0S/M/k44lse88kj9LRTwsKVaks
	drRrXvPpErTg19PgwIlNMpEenrHe4D65JVdx/5qY4Uwj0ntGqO6XffcJuc8+Nw2VBGx1MRGzoik
	OYFQ8ipI32yYFXhoAdoomSzeW2n+j8FBEPJsSe9zfmb8XY5slRrCCSSpS0p0jl+xaqZXGygAhYo
	kH2rKBFaFyLqDTLXlb8D41cvDgKySeJ0Xpz3LaT5c8HbEA6mBt4Js1LUlLLDLboJr1ssghC4t9O
	BANGvkMk6TetA8GBbpo3Ehw==
X-Received: by 2002:a05:620a:cfc:b0:8b2:efe7:d82b with SMTP id af79cd13be357-8ba38c77fa0mr202718685a.30.1765366001916;
        Wed, 10 Dec 2025 03:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExLkgm4f5QGQr+3+UudzpEtgPUVmMMlsdhTt53Ukg2vvb36GiyDfz4xLO9RSWHI1kJ95R24A==
X-Received: by 2002:a05:620a:cfc:b0:8b2:efe7:d82b with SMTP id af79cd13be357-8ba38c77fa0mr202715485a.30.1765366001265;
        Wed, 10 Dec 2025 03:26:41 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412146bsm16555391a12.23.2025.12.10.03.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:26:40 -0800 (PST)
Date: Wed, 10 Dec 2025 13:26:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v5 4/4] phy: qcom: edp: Add Glymur platform support
Message-ID: <ef6gkmgy4n6ipdam2nbm3no2ew3mga6dt45xpf6ykv3is2nkjh@gvz6pzg6dk7e>
References: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
 <20251205-phy-qcom-edp-add-glymur-support-v5-4-201773966f1f@oss.qualcomm.com>
 <q7iguwi6uxkzl3ogk2jidfncc3guuaqzszvemvqita6t3mlnvz@6e2vxnu4li46>
 <e22cqybvhlfv6mvmbr6tlaz4zousxcyo475g67yjerxw6xks64@6zzg6tj33kxa>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e22cqybvhlfv6mvmbr6tlaz4zousxcyo475g67yjerxw6xks64@6zzg6tj33kxa>
X-Proofpoint-ORIG-GUID: I4JzYqKNXF477Jehj-2HVN6VE5JsZtq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA5MiBTYWx0ZWRfXw7umCJLekNRo
 QNA2JRNJN2ggj6XTOqVDGAFX02+sM7nV+bTjnEkcg3Hzk0UtzLU/vFfGlAuh+Qi+ZKIOgSPUrAW
 gHjTn8lu7SpMCNXLkXp3DGim8srX5sCb+PXW3HUVeiwC/vChZN7dofYJvOzE6WzmUIhUEI/Se5u
 So7309HlmohC36xi7ceHVp5hC1MZuzML1SjI8pBwoxAmZtX0sOlcgbdd6pi1EQMG41Tr7onDeHU
 Bb8gu5boZwFBZMAzVobDqsFn2sxW7lz9EyNO0viKKk+UApUxZjSZi49ihQ9cXusziFHqFV+r09B
 0hj6SV8XvARsDKW6cF9AaSWCPKLsF38ZB+An05rb/sT9iZj4D+F7TkXykmjmx5/tpsZu9DOhrAX
 gv4Yh9Gq/AYaqQcqUllV3D3PP04/Jw==
X-Authority-Analysis: v=2.4 cv=McFhep/f c=1 sm=1 tr=0 ts=693958f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Knydav1BIcOQ2oiR49QA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: I4JzYqKNXF477Jehj-2HVN6VE5JsZtq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100092

On 25-12-08 16:16:31, Abel Vesa wrote:
> On 25-12-05 22:26:35, Dmitry Baryshkov wrote:
> > On Fri, Dec 05, 2025 at 04:23:23PM +0200, Abel Vesa wrote:
> > > From: Abel Vesa <abel.vesa@linaro.org>
> > > 
> > > The Qualcomm Glymur platform has the new v8 version
> > > of the eDP/DP PHY. So rework the driver to support this
> > > new version and add the platform specific configuration data.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-edp.c | 230 +++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 224 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > index f98fe83de42e..052b7782b3d4 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > @@ -26,6 +26,8 @@
> > >  #include "phy-qcom-qmp-qserdes-com-v4.h"
> > >  #include "phy-qcom-qmp-qserdes-com-v6.h"
> > >  
> > > +#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
> > > +
> > >  /* EDP_PHY registers */
> > >  #define DP_PHY_CFG                              0x0010
> > >  #define DP_PHY_CFG_1                            0x0014
> > > @@ -76,6 +78,7 @@ struct phy_ver_ops {
> > >  	int (*com_power_on)(const struct qcom_edp *edp);
> > >  	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
> > >  	int (*com_bias_en_clkbuflr)(const struct qcom_edp *edp);
> > > +	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
> > >  	int (*com_configure_pll)(const struct qcom_edp *edp);
> > >  	int (*com_configure_ssc)(const struct qcom_edp *edp);
> > >  };
> > > @@ -83,6 +86,8 @@ struct phy_ver_ops {
> > >  struct qcom_edp_phy_cfg {
> > >  	bool is_edp;
> > >  	const u8 *aux_cfg;
> > > +	int aux_cfg_size;
> > 
> > Can we always write DP_AUX_CFG_SIZE values?
> > 
> 
> Sure, I could check what are the values for the rest of the regs for platforms
> with v4 and v5.
> 

So, after checking the docs, it seems we could write the reset values for the
v4 and v5 as they always are the same between all platforms: 0x03, 0x02, 0x02, 0x00.
At least on the platforms I was able to check.

Should we risk it and add these extra values to the array even though they are
the reset values, just to make the driver more clean by having single sized arrays
for AUX_CFGx between all platforms ?

