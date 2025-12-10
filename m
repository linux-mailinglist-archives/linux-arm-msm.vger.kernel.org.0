Return-Path: <linux-arm-msm+bounces-84921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC71CB3B23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 18:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DCFC30146C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 17:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764DA1F09A5;
	Wed, 10 Dec 2025 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIQfC9mX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9RqGACl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573821B9C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765389089; cv=none; b=R3zVV1MR1rLsb8pffVw91Ki0aJZiFbPKYnamg6/jqIGS4E5QkGC3HypKJbjlXvHYZfFkjoDZtGITu+kB2brjiZVqVFNmmEmzHCTolFwRR35hbAgbpqFEG8of+cbaSciy+PsRXo5Zn5P6UTGfAFbxKdqD9SrrDBwj8LqMqx1JGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765389089; c=relaxed/simple;
	bh=hqxLe5wDqnsYvlp23QTWqd8JEec/XyT1t+QccVqor7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpTelUfAx/KKTU9uubp2pl/H5yVZBidvVMyf0xHwvZjbtIm2SBCIuxAMg2HeEFaS2pprTM5MrHrDUYOYvKEYTdWPfLFa3duHWXxtCM0T4zwjAlN9IewzOmfJFpBDcq6cLfjNfC97cRDKdoH6nUKHzaVP2jJ9A8yzUNWCIX6MamM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIQfC9mX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9RqGACl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAHo4941817825
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BeSQQNCY7n3ICAefy9Ece8ch
	se8u8sQw7ZSYOSvx66w=; b=TIQfC9mXoDdJvk4a9oHqwyMn1jgTT5pNgliPChck
	ygFL6I/FJkGztwY9KfZ9OXoujBCFkPjdSr6mkAmc7rhAzaFGbRhRm8XhEVCwkGnF
	SDWDSx4RGoEIVKcXjiMYib9iAP5c00TwaqV5Tzt69cLHyXRUyKpz70SUiCwHpYKU
	T8VwysJJmeupjVDoL6jHYRIiIQAUUHMHt7TWQ/7a7irIPzeO1rfwZaeAf/vY1aI5
	7s8fJ9X0vM2Qq1w10uCp7nO3NvJUhUEmhWfQus+e29X5jS7KlQ6dNuop8HfafOLX
	wvMAshfL8B2Z5QRkxyZSMvezRYJRIlno8hotxj5Qa5FLVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay2e0j8er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:51:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed782d4c7dso837531cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765389085; x=1765993885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BeSQQNCY7n3ICAefy9Ece8chse8u8sQw7ZSYOSvx66w=;
        b=S9RqGAClm6yU58l8FPwP105v0neO0Bxc8xIcmGhN08XKeIv5lvTHpoHaNrtqTIzVrb
         RK4bnWeUM640Og9ZXmb5kGt/4lf/i5pnWbwisnXHr8wuJVvlDMUTvOc9GsLfeepC1sWm
         FOriWrhJx7rzOlLGbFfPJfdPCOEoY+2ue2ULMg+G8hCX6OGJaarNcRn8nBEX5/Hl4Z2A
         fnXykgyhwgvml3nSnODp5o+yuScLXqtJHxDaPz5KIUUjbbUsf7nhsY+bRk4zG7k+2aUH
         zaP4h4TZ5QakuTvcM4y3d5/F+iB67+vy4yid1dpYFnSfdcRYqxxL3Z2P04teazZ87MlI
         4OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389085; x=1765993885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeSQQNCY7n3ICAefy9Ece8chse8u8sQw7ZSYOSvx66w=;
        b=LSQcT+N7Uc2sefK744f92vM8N18IBaMZwJJxzTqvKogs7Bi+0ynLuJdYJcMkf93hTk
         EZ8jrQDUc64cEh5PS1B1UiH9usi5BAANXvC15X17Hzyo7OVaDTiYRe+gUUcKrIkpS0gj
         gZ5Rs9nHDoh4UPX3ZLEqT9JYEkzm5dHZfZJwxMQcvzGnFI4xDsEYLkZClpKMtDeDadAu
         PabhVoIT8BP2U3G3RzpkWoRNqqNXtHfK50mAPL8Cob8qfiIdrJ83wEoojvNTtv6ds+25
         PoqUFqZkIArudLoDzCvPXMmDbDC1+Adwj5HaNueSSPaPIYOJxi1NBZAyUY747jQ9WeSt
         cpFw==
X-Forwarded-Encrypted: i=1; AJvYcCWufnm8V57qPnL3n2EjLhMsYWhHIOSPglj44Wq566lXitXD3JwTeDsF0uVf+nQVrUz/dqxbzaIISYrwnvKc@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEkLO4fP7/57w10RNIfoQAcVWWiH4q0+gTlzBL/FYxsXdaniQ
	/LLDsLvt6mVJ9GO9KwRwhWWPK+8XLIb4nsI59x1ZLY9MuXUtDoQMj7ygelcvs67mUJsk4/2mgpp
	eJpKSt8qidC7TSJ5QbgcdDolhskY+1LNlFVwl1BR+TajG2bS4kVZz3ALVB/B6Dw8SDnJAe3KAsG
	25
X-Gm-Gg: ASbGnctNiLmG29dVAJTXG+CsmYvaZgETSaPZky1aDimj20WywQp1Qh2ZXDJcLUNQ11m
	9zjRkf+4sOUGulsh1u3DPZyqFLCUQUqSq3BPfsUVgMyc5xA7bf3hRUQWmZcZfwn64J4w+zWL/xr
	UvR76VWUkXoOcwPCRD/0Nj0/C8C5hayqj3TV8qQkjZT54+W6ZbPr9Rj1x3a4LbDSjIPGah3hoX7
	6FelsB86cCfH3nYHfAMiKAf3v62BWy9ZNAIkV7aaWNL8ArXzKYD+SKwE2EsgbWLh9EgvMaypNnT
	3iR7KPmtD+iTiruqrMZKyboVMQ0qWoZmWZTqBI9412KI2MyioYQo7S1/ZUyFffP2e5lD9l71LKV
	J0QjdEQ99RmMRds7fBrVSQ82k06Y+RU9jYOnDtmnpvMHEex635f3M4DQ4JQEQ5J01oUdFbaWhO5
	zUqrs67j81hpVjpt4p0fEcNBA=
X-Received: by 2002:a05:622a:6089:b0:4ee:2bfb:1658 with SMTP id d75a77b69052e-4f1b1b0b1d6mr38135691cf.45.1765389085268;
        Wed, 10 Dec 2025 09:51:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuloF8EWYgTNimNJfZde6kWgxvxaGZZr+YBsiejZFJFGZe+iFpq3QoI+oYylCx2XnCAFrI6g==
X-Received: by 2002:a05:622a:6089:b0:4ee:2bfb:1658 with SMTP id d75a77b69052e-4f1b1b0b1d6mr38135421cf.45.1765389084815;
        Wed, 10 Dec 2025 09:51:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f379f5sm37713e87.11.2025.12.10.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:51:24 -0800 (PST)
Date: Wed, 10 Dec 2025 19:51:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
Message-ID: <mao4pyywje5x526ggasodx2hpmrgrw3yhq7a4v2lxtj2m3p6ii@6mtei6u7jbuc>
References: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
 <20251205-phy-qcom-edp-add-glymur-support-v5-4-201773966f1f@oss.qualcomm.com>
 <q7iguwi6uxkzl3ogk2jidfncc3guuaqzszvemvqita6t3mlnvz@6e2vxnu4li46>
 <e22cqybvhlfv6mvmbr6tlaz4zousxcyo475g67yjerxw6xks64@6zzg6tj33kxa>
 <ef6gkmgy4n6ipdam2nbm3no2ew3mga6dt45xpf6ykv3is2nkjh@gvz6pzg6dk7e>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6gkmgy4n6ipdam2nbm3no2ew3mga6dt45xpf6ykv3is2nkjh@gvz6pzg6dk7e>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NiBTYWx0ZWRfXzPmr9+Lxd7bV
 KA3MrURFPbZVWSWd/gSmXs4jj0aYppLDkBJRBIethZe9+5+cc98vqLwQEW7xzENN6PtSl/VuHe3
 ihHWcFr6I6EwrTGq0jkm7P/bGji5Le0Aibe51s9CU/GV3syjtaytWpQ9f96Q6u2NeGhpRlbzcCN
 bJceWkXA/je7mOQE4rAnw6F4G0FrSntlLgtMcAq2tdt+34Q3HEQWgeT0+D7SMm0kT0wuGmLTvXq
 pK5kgUV8PaEP/OzSQ4RgPBjSkZNn3GOYSDnzFz45v8+5Ydsla+vrumq6Pyu8V5ZYfiFDpqtgWB9
 glhQ8TRrDzMttlSP3V4TrFFB+k3VseIDfEkXJUkhCuAoAv2JZCg0Gu40Io7+yeKpBpu/0anbELo
 mYh9YopM/kD3Dkt9ZYKLOMTDAUgGzQ==
X-Proofpoint-ORIG-GUID: fVdVdYumgPuxqzkhDg6AKO4TILF2_OwB
X-Authority-Analysis: v=2.4 cv=G5oR0tk5 c=1 sm=1 tr=0 ts=6939b31e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x1iXGeQro2BAPSpZQGcA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fVdVdYumgPuxqzkhDg6AKO4TILF2_OwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100146

On Wed, Dec 10, 2025 at 01:26:38PM +0200, Abel Vesa wrote:
> On 25-12-08 16:16:31, Abel Vesa wrote:
> > On 25-12-05 22:26:35, Dmitry Baryshkov wrote:
> > > On Fri, Dec 05, 2025 at 04:23:23PM +0200, Abel Vesa wrote:
> > > > From: Abel Vesa <abel.vesa@linaro.org>
> > > > 
> > > > The Qualcomm Glymur platform has the new v8 version
> > > > of the eDP/DP PHY. So rework the driver to support this
> > > > new version and add the platform specific configuration data.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-edp.c | 230 +++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 224 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > > index f98fe83de42e..052b7782b3d4 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > > > @@ -26,6 +26,8 @@
> > > >  #include "phy-qcom-qmp-qserdes-com-v4.h"
> > > >  #include "phy-qcom-qmp-qserdes-com-v6.h"
> > > >  
> > > > +#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
> > > > +
> > > >  /* EDP_PHY registers */
> > > >  #define DP_PHY_CFG                              0x0010
> > > >  #define DP_PHY_CFG_1                            0x0014
> > > > @@ -76,6 +78,7 @@ struct phy_ver_ops {
> > > >  	int (*com_power_on)(const struct qcom_edp *edp);
> > > >  	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
> > > >  	int (*com_bias_en_clkbuflr)(const struct qcom_edp *edp);
> > > > +	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
> > > >  	int (*com_configure_pll)(const struct qcom_edp *edp);
> > > >  	int (*com_configure_ssc)(const struct qcom_edp *edp);
> > > >  };
> > > > @@ -83,6 +86,8 @@ struct phy_ver_ops {
> > > >  struct qcom_edp_phy_cfg {
> > > >  	bool is_edp;
> > > >  	const u8 *aux_cfg;
> > > > +	int aux_cfg_size;
> > > 
> > > Can we always write DP_AUX_CFG_SIZE values?
> > > 
> > 
> > Sure, I could check what are the values for the rest of the regs for platforms
> > with v4 and v5.
> > 
> 
> So, after checking the docs, it seems we could write the reset values for the
> v4 and v5 as they always are the same between all platforms: 0x03, 0x02, 0x02, 0x00.
> At least on the platforms I was able to check.
> 
> Should we risk it and add these extra values to the array even though they are
> the reset values, just to make the driver more clean by having single sized arrays
> for AUX_CFGx between all platforms ?

as far as I can see, yet, please. I don't see a risk in it.

> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

