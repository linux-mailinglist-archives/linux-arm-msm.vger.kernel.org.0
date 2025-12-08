Return-Path: <linux-arm-msm+bounces-84679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21162CAD86B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 16:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3F49304CC15
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 15:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB52327214;
	Mon,  8 Dec 2025 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijK13upk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmVp3FED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048932720E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203400; cv=none; b=sJhe7whZyCrEX3aDyglCcuCtwrzAV9zCTs+XzLR2ByYLwfOfhvt9xYcT8nJ+zTRNuR6W+jZ8QJoPhCthwWcIzQDVSVAXv+j9TLQaeXxDOBh6xq/FrEacLFWq6N0A9IsrssT74A1ZFHp9BT0vzrcchAId6sbAJf+UjYjUJbltJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203400; c=relaxed/simple;
	bh=lmQYadHSKtfqsyJGQ5qUjl791vT9mWMdyncnv1m8EkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1NLjECKzSA37UA/oyDcpNnG1Q1bHQA0ttqYMPMaFyOgBTbblvmjilRIq2aNS27nHvHJt2fXwV+4g1x0tr9PKtI+JdPo6l2sd3B6GlJLalxHQe6crRkcRD527K5WD1BCyqijEk+dDMp6Lwp1FlWTwl4SiN/7iTE8H/1dHHG8uoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijK13upk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmVp3FED; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88vr8a4185204
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 14:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C6BdKba8GuPoNuZiFMtECnAO
	5JYC52XsvAnxQLdNLUY=; b=ijK13upk5HwvfRU+Pw4/hDxiU6CNLPstF1MtXWoK
	q5pDFI2JhCyVw/TOzw8wNCafcsVen2o2wb2O59MrIsd7QNk4JGT+tZawYl/Mi5nr
	t9x5zAk187HIs0fCxgbasgu4eLaUsABUxuDsWgb07iTQeAAZsd9qre+7VT7nPgTa
	Vuf9NBmkv2RxHaPfFk4AjA8aw8IzJgV8S6odakl0xBLcS0nGUuaa7Q1bQe64XF1Q
	xjUrLbQzsPgXw769DEUFKqjKrqxXQtWDCquB3LlG6mBJztNdM3CRt90gdctLOovI
	kDNraHWQC6WDoZir7ptJ9Wmva3IkNcjFf1N6W8EHBTSp6w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awume8wcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 14:16:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b29194c04so2933959e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765203397; x=1765808197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C6BdKba8GuPoNuZiFMtECnAO5JYC52XsvAnxQLdNLUY=;
        b=NmVp3FEDD5KOhNc/zUzrR/A6IAp203TTV8av7LguOyMtKeWlGmJ0AQQCdd0xWoIsud
         VnkkX3CUnGTfwwj8fC1rSVd8k+l8o3iSCNwzRbkaw1ymk8ZmRex2XuX4mmw/lls29KF0
         p1SULM/xMUzOrvkUlwAld0wedVIZL120SOW+HZBADGiQnEvUPRDg18eCiS+n2KfU82kU
         40CcVdhSdYrqX6ib7PdzQG2Aq/j1dr3PY5dtIfcfRi4lXl8bJaCanGeZI4pmIg1+2JEE
         aSn0fBfXgUw4jyzbQrmFzbi28klna7nhg/wvhYgVs0dNzpOYpZHKDbdZJxyhnwnFiMh/
         P47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203397; x=1765808197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6BdKba8GuPoNuZiFMtECnAO5JYC52XsvAnxQLdNLUY=;
        b=v498hN+SXgn9La5aCjNpTXeRA3XVLBnrouuVc2mkn7iotBQOC76VeaV6cyhYfIL6fe
         RWEfcfmeEGfPdJ+2K4sTSQ21Zaz4IFcU8rYa+MLBN4IP8EOgvqlobXyWLpkHd7oa4mbp
         DwlOUQ7f+Lzh2HLW5nLa+dcSomGDHAnmi8fnJggvNZRiazO9bv/QeYPMcMlBNLK3XkyA
         Hka0zQE7JTHMfiyWYjcJp/5OBdvvHls9dgULGNa0AIjVwRWYrFUSRFTkTbCvEgPmvEed
         RxdUWC6eVwY7MRY194VOZozi1IP22V076dnwSCXFJ/1xV6H+67vB52QeA3kko96ZFOWD
         SnYg==
X-Forwarded-Encrypted: i=1; AJvYcCXqEMUonFXFtcivNpZbg7rjTBBz/EHD5XZwIBwPoFPNnCwJaYuou5DyAQQNbzU/G/hbPJaVSd0imER5enTb@vger.kernel.org
X-Gm-Message-State: AOJu0YxfuDM9PthGkTH/3b68R+gdHIZC00vGDziHTDzp2V9x6k8JbQV9
	2JpfTSipP7Vzch4B0g+MSkzXjSoEhofb+uUECQmSt1tcnloPvnG0jC8nYbckQaDKXIinbj+j04M
	v2zRXEorSVMTqixr2yGqvWb1bD5HXhGmht95ZmC5iKNlQTE762JmGP4VmKdhCK/P+X9+a
X-Gm-Gg: ASbGncuhkYFzZD4nkzu/GrnSzhIZCyFa1X6bqTtwU4xdZHLsPCTtez65n3kTUDpy2sl
	i/gLW+Bii0VUoNABVApiukbVZlXOj/fRAIKms7PCJ+vfgx9f8JcWaP97P9GmViFE9ftFRj7G3YP
	giWpKQsnAu37r0RQLpMfFaX95otj7rFiVf137JEKoW3XX7gumtJoHhdh/lO/RFQydsfYB+IRsRk
	X286oyAeSIcvyHJYkKi8xRfWFAlusZKlvq452gBBS0SjHHW0n+9QbYjy6XoeAaNlayptmyxm1bb
	1y1vhngXhGwI4vGlolxR2fuP+PhzT3yICb/r1lBihOcBsX/yuFHPgie9MQU3PdDwiRTaaWd9NIT
	rLJwa5JuXOgwp/bOhF2RVEg==
X-Received: by 2002:a05:6122:1312:b0:55b:d85:5074 with SMTP id 71dfb90a1353d-55e84667f4bmr1501819e0c.8.1765203396945;
        Mon, 08 Dec 2025 06:16:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcGRu23ACp6NvDvUOo3R/VphM+tlV2mvK7RUyWx0Y0RTuCbElmpUyZggpSb2iYjl8W6A8hjQ==
X-Received: by 2002:a05:6122:1312:b0:55b:d85:5074 with SMTP id 71dfb90a1353d-55e84667f4bmr1501593e0c.8.1765203395085;
        Mon, 08 Dec 2025 06:16:35 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b4121d05sm10981467a12.29.2025.12.08.06.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:16:34 -0800 (PST)
Date: Mon, 8 Dec 2025 16:16:31 +0200
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
Message-ID: <e22cqybvhlfv6mvmbr6tlaz4zousxcyo475g67yjerxw6xks64@6zzg6tj33kxa>
References: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
 <20251205-phy-qcom-edp-add-glymur-support-v5-4-201773966f1f@oss.qualcomm.com>
 <q7iguwi6uxkzl3ogk2jidfncc3guuaqzszvemvqita6t3mlnvz@6e2vxnu4li46>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q7iguwi6uxkzl3ogk2jidfncc3guuaqzszvemvqita6t3mlnvz@6e2vxnu4li46>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEyMSBTYWx0ZWRfX4y1l9f0Tf7zR
 88H8fyU6COc5QLKhja2FRjQemuxVLbl7eri8hSDqHrWi8OILjKjZQpcTDJa7uolEIqQCfalqfey
 gGLLcLkPNOw0a7iSlZYRlo6ekTJtde4V9G4Yh+XtfnghNQCJFNTvfHnzpe1c4Hmkf/QwevY+8m9
 LCM0OTWtv2Cj7rme+kIKJ2/GttUSswPKaMqBqhlx0386NM3kWLd3s5sSIAMiCtcx4kI0venBXUf
 Kcw438lysntkFHRCg066lpN+XcthDr/p+uD75eTwA0e28MX3tCNew2srnncrU+baFDmCZIOI95J
 fwht84E1w0Zq9AwMbv82Nod4cXwdJmJOTVLqDRZXOnNL78LFlnsPBmwRclkOZY3VYOCKY10ZzlK
 Gh5fSUagz9Ehsec1xMI3jX+6NuLugw==
X-Proofpoint-GUID: JRBzslCK1GL8Vj42fOxPp_JGMDqTH0HA
X-Proofpoint-ORIG-GUID: JRBzslCK1GL8Vj42fOxPp_JGMDqTH0HA
X-Authority-Analysis: v=2.4 cv=SvadKfO0 c=1 sm=1 tr=0 ts=6936ddc6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=lrDoRkyyTIirryIH6YYA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080121

On 25-12-05 22:26:35, Dmitry Baryshkov wrote:
> On Fri, Dec 05, 2025 at 04:23:23PM +0200, Abel Vesa wrote:
> > From: Abel Vesa <abel.vesa@linaro.org>
> > 
> > The Qualcomm Glymur platform has the new v8 version
> > of the eDP/DP PHY. So rework the driver to support this
> > new version and add the platform specific configuration data.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 230 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 224 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > index f98fe83de42e..052b7782b3d4 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > @@ -26,6 +26,8 @@
> >  #include "phy-qcom-qmp-qserdes-com-v4.h"
> >  #include "phy-qcom-qmp-qserdes-com-v6.h"
> >  
> > +#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
> > +
> >  /* EDP_PHY registers */
> >  #define DP_PHY_CFG                              0x0010
> >  #define DP_PHY_CFG_1                            0x0014
> > @@ -76,6 +78,7 @@ struct phy_ver_ops {
> >  	int (*com_power_on)(const struct qcom_edp *edp);
> >  	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
> >  	int (*com_bias_en_clkbuflr)(const struct qcom_edp *edp);
> > +	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
> >  	int (*com_configure_pll)(const struct qcom_edp *edp);
> >  	int (*com_configure_ssc)(const struct qcom_edp *edp);
> >  };
> > @@ -83,6 +86,8 @@ struct phy_ver_ops {
> >  struct qcom_edp_phy_cfg {
> >  	bool is_edp;
> >  	const u8 *aux_cfg;
> > +	int aux_cfg_size;
> 
> Can we always write DP_AUX_CFG_SIZE values?
> 

Sure, I could check what are the values for the rest of the regs for platforms
with v4 and v5.

> > +	const u8 *vco_div_cfg;
> >  	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
> >  	const struct phy_ver_ops *ver_ops;
> >  };
> > @@ -185,6 +190,10 @@ static const u8 edp_phy_aux_cfg_v4[10] = {
> >  	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> >  };
> >  
> > +static const u8 edp_phy_vco_div_cfg_v4[4] = {
> > +	0x1, 0x1, 0x2, 0x0,
> > +};
> > +
> >  static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
> >  	{ 0x05, 0x11, 0x17, 0x1d },
> >  	{ 0x05, 0x11, 0x18, 0xff },
> > @@ -210,6 +219,14 @@ static const u8 edp_phy_aux_cfg_v5[10] = {
> >  	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> >  };
> >  
> > +static const u8 edp_phy_aux_cfg_v8[13] = {
> > +	0x00, 0x00, 0xa0, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x4,
> > +};
> > +
> > +static const u8 edp_phy_vco_div_cfg_v8[4] = {
> > +	0x1, 0x1, 0x1, 0x1,
> > +};
> 
> If it's always 0x01, where do handle the divisor?
> 

So after double checking the documentation again, it seems
the proper values here are:

   1.62 -> 0
   2.7  -> 0
   5.4  -> 2
   8.1  -> 1

And did some testing on the CRD and it seems to be working fine.

So will update and respin.

Thanks for reviewing,
Abel

