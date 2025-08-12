Return-Path: <linux-arm-msm+bounces-68730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DAEB2240A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37023175D55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D282EAB9D;
	Tue, 12 Aug 2025 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICbAEpAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E732D4B77
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754993207; cv=none; b=VzND8ym0Ka1SA8tpsmrZiZ0WsNJDZbr0c1FhsL7Z5K58tiqY4V+8oRv8onXCMonENWHeLM2ZBNFedTDphjoTuk/h49XNtPCp91WGcQK3Q1v0PYRJ08+RVmnVOLH8VAdKx3t36b+cLGi7IgIFK/pRgW01JiM+bOJPm2IA1ubHnk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754993207; c=relaxed/simple;
	bh=p86wGcuXouV66IvwXNLN1S5SQ13PEZX8gi4dx6Jnpzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDEUznPfkEV6ADFIbfFJ2xgQm0/tk855FfWDHFxwLrlETLrkeFR9yFeEjsdqZn8VAeRGQzZ8/JJ2CmvAbc2d71/ABqTTYnfJmPxjUHr8KNGRyPvmz6+P1KXXYorCQvTMmOXea+9G9MAGyNo7RaLt02sGPHdzCt5giQiXgD5iCAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICbAEpAu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4PvZS013093
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A8T8ZatYaGf8wMEcyEX+SVkI
	kdVBoSOYx1hxOAACmEE=; b=ICbAEpAuy0MSvABsrlO/4K/W8IleGPdGZWCoTe7x
	AYKCE2rZpFDnGwb7w7DsRmJuF59YhjkCtvT8AeGwhD2EZJiHUCOpCSvQ1NFTeY97
	NWX4MCIMsSx4uaGbnFSP8PCGVHNSN1kghrClnjR0NwxYRfaLBXDU23/edu3anooI
	dNCHDQLQmO2iOWlQdQO+gvcQWMwURez70bn2FuDqnZJxk9WldZj/jLLAh99bletX
	h+q3vXQ2fgJ59T5QQmfP7tBVqcCDvdh6FQ+rFwWqq09cveP2Xgl8r+SNyrBvdDdu
	f4xA0WEa68Hv0Wp+YDgmp4wP8J/Yp/qHD8tOL/QpKrI0yg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmqujb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:06:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b081b2a94cso176298201cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754993203; x=1755598003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8T8ZatYaGf8wMEcyEX+SVkIkdVBoSOYx1hxOAACmEE=;
        b=f3H16/9VA7pLCG7HRvzrGVaPCOpiAKCnipsRduS2ibYStnzw/CYVxS5o3pCcj89zJq
         7OQQI+cAghChn7VPhfZpFM2MsSWsfhQQmZ1F0UypmCIBNpkgh8v93b+/DJlIYycBJHi0
         sLU0TZNSysplL2ibZEXLNvvKwN8xx3Shv5R6q0xSgKNqpFDbgOJBmI872Ab6DXiRzUzI
         YuKey+piNg/8TUI2hIHSufU1BekZoH/PLc+EI27/ySfL9keEr+bOPuISjrFEPIwexGwr
         E/rRFiH6budPpKtbxpnOPsUNw7GA3scit5ung2iOj2KiaaAy3G1tPgSopKoCHCnIXcm/
         FZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDp1z+JFOQbIiGj8Uv90AB7HwVrg1ZkvK9Rby0/5pI1tuVwf9jq3dAPqIPzSemV0XQjm1hoP8V8o9xIgL4@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8mkEieo2JKcv013xtzsK/oOqiU4qoURUYNTU6bTl39eF7R90
	pLtuuJT6Gr/wIZzKsrrFk89LeNr/XXrTa/J0oclXNRgqg2oHj7t0qKR37GCXM/2TtaxF3TZ4LSw
	T82c/tfs9FXT1wpqXrG8IbJJJ7F3TjwLO+vjgC2bBiALqLpY4T79Bjr6iz/EGaUCrnU9+
X-Gm-Gg: ASbGncuXpvCL417ie8VoMpTaLFZSrFYXnA+t3xsVo25kN+uyYT3j+6KdeYSewLfoCBu
	LeRL1jEyW+nzJO3/LOBgrfMPew21Ic5EGsnr7mhuPn9HXI+LPfGR6a+oHbkSRlTgMTUdG0smusp
	huJMoyOecHfAi84SQe3AQDMXOxlNpbQeJxgr66lJ3qlob6/Z83/tWYKdTHM8tp2OQimUCC9yJmq
	bTQlV59korw1CdMJytFWhYmhhQ61p96Ezrhr6CTi4KqVInmgMqi+Zk69pHJtYDgaBso0hPD6eNv
	NNEkDq/PVGfnnliLtCUNIWUWZEeiWBpVJPY23ssuK4a4LFmINGJXmjS4k5TfxZ82/tM02T9RvEr
	bYDHca+gpX55PZV4CETNswEVEMDvv9iIJWESllfQeluwkeOsLCQ+h
X-Received: by 2002:a05:622a:993:b0:4b0:7b80:4759 with SMTP id d75a77b69052e-4b0ecbdfb41mr34852001cf.20.1754993202575;
        Tue, 12 Aug 2025 03:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMlxzUMM54lZpUCjMGfkRuTDxqeDDulNqKujbwTvnh1hN5pHNNiRG8zIikUZyWOyfTNB5HMQ==
X-Received: by 2002:a05:622a:993:b0:4b0:7b80:4759 with SMTP id d75a77b69052e-4b0ecbdfb41mr34851841cf.20.1754993202166;
        Tue, 12 Aug 2025 03:06:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bb4asm4657815e87.16.2025.08.12.03.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:06:41 -0700 (PDT)
Date: Tue, 12 Aug 2025 13:06:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
Message-ID: <hosfuvk34iolc4ylzqu2pyoozomw4nzirlfdj54x3777eyuok6@renjfbqznl4r>
References: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
 <d32cbtfzhwpzsvxpb7esvndpqxooergkzhlx2jp4ikuc3bsaop@gyxnlusuptg3>
 <e08cb2a3-e96b-4b06-b56e-0b630cff38fa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e08cb2a3-e96b-4b06-b56e-0b630cff38fa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689b1233 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=SCioppmI-r5X7Irv_ikA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ynWavhyzXO43_2jiuaHIoT6HZztIOVrr
X-Proofpoint-ORIG-GUID: ynWavhyzXO43_2jiuaHIoT6HZztIOVrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX2yXb7HJBio5p
 J0Tu3f9jxJq1o1cmdpwinHBE29pLpWydLCyGK33FuRwrqdevMFd3ZRtLAdoxOB84a9f/0FBXtPj
 7AWGn9A9Vz1piLuK+/TnqKSVB2HJ2AQIgAgP2UHgYSJFU6kyadvnEVkjjCWASWEfcpv858aoA7x
 dqkcVpKYU6GQAw2MLXhJ+EwJbmFyxVg9Ai0Em/9rJqLUh+mPQlGGxkWdLbyBtOcqLCs6SXyK7Fa
 k06GztqyWBFuMM/RD1e8i1nDC6Nw+x4MhTN3J9BKV+5eBZVlBcVURRFufqPK1Mmxo7HXu/aj+pZ
 Bb60C68I05MCjGSbAWXC26QvSR4eznzOi3zeOWanq6bjm+NNhAF9a17NfaeRiw55ejTKkBjtNv5
 vpkob9WE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

On Tue, Aug 12, 2025 at 02:05:55PM +0800, Wenmeng Liu wrote:
> 
> 
> On 2025/8/11 18:39, Dmitry Baryshkov wrote:
> > On Tue, Jul 29, 2025 at 03:24:55PM +0800, Wenmeng Liu wrote:
> > > Some Qualcomm regulators are configured with initial mode as
> > > HPM (High Power Mode), which may lead to higher power consumption.
> > > To reduce power usage, it's preferable to set the initial mode
> > > to LPM (Low Power Mode).
> > > 
> > > To ensure the regulator can switch from LPM to HPM when needed,
> > > this patch adds current load configuration for CAMSS CSIPHY.
> > > This allows the regulator framework to scale the mode dynamically
> > > based on the load requirement.
> > > 
> > > The current default value for current is uninitialized or random.
> > > To address this, initial current values are added for the
> > > following platforms:
> > > SDM670, SM8250, SC7280, SM8550, and X1E80100.
> > > 
> > > For SDM670, the value is set to -1, indicating that no default
> > > current value is configured, the other values are derived
> > > from the power grid.
> > > 
> > > ---
> > > Changes in v2:
> > > - Change the source of the current value from DTS to CAMSS resource
> > > - Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
> > > ---
> > > 
> > > Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> > > ---
> > >   drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
> > >   drivers/media/platform/qcom/camss/camss.c        | 26 ++++++++++++++++++++++++
> > >   drivers/media/platform/qcom/camss/camss.h        |  1 +
> > >   3 files changed, 30 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > > index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..7a2d80a03dbd0884b614451b55cd27dce94af637 100644
> > > --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> > > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > > @@ -707,8 +707,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
> > >   			return -ENOMEM;
> > >   	}
> > > -	for (i = 0; i < csiphy->num_supplies; i++)
> > > +	for (i = 0; i < csiphy->num_supplies; i++) {
> > >   		csiphy->supplies[i].supply = res->regulators[i];
> > > +		csiphy->supplies[i].init_load_uA = res->regulators_current[i];
> > 
> > Could you possibly refactor to use devm_regulator_bulk_get_const()? It
> > would save you from this data moving.
> Initially, we were aiming for a minimal-change implementation.
> Consider refactor for save data moving, will be refactored in the next
> version.
> > 
> > > +	}
> > >   	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
> > >   				      csiphy->supplies);
> > > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > > index e08e70b93824baa5714b3a736bc1d05405253aaa..daf21c944c2b4818b1656efc255e817551788658 100644
> > > --- a/drivers/media/platform/qcom/camss/camss.c
> > > +++ b/drivers/media/platform/qcom/camss/camss.c
> > > @@ -750,6 +750,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
> > >   	/* CSIPHY0 */
> > >   	{
> > >   		.regulators = { "vdda-phy", "vdda-pll" },
> > > +		.regulators_current = { -1, -1 },
> > 
> > If it's unset, it should be 0, not -1.
> I considered existing implementations as a reference:
> https://lore.kernel.org/all/20220804073608.v4.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid
> 
> but based on the implementation of regulator_bulk_get, setting it to 0 seems
> to be a better approach:

Ack. Also please try to provide a sensible value for all platforms, not
just the most recent ones.

> 
> drivers/regulator/core.c
> consumers[i].init_load_uA > 0
> 
> Thanks,
> Wenmeng
> 

-- 
With best wishes
Dmitry

