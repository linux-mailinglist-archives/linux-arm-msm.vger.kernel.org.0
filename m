Return-Path: <linux-arm-msm+bounces-68189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE79B1F3C7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4D262387B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14EB2248A0;
	Sat,  9 Aug 2025 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MosJndds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA9219A8A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754732423; cv=none; b=ALxadh7b7sXHxKUtyuW5RsSK7iRT7TeeGsVtYbf1SlSZ8gpP+iJSsI9sFDHS73/G+f2uqicgs1RW/uI8fwZ1qYvFwgc1AIMapMYdxnHYuH5liQReEC4B1eTTBcS0ZQ0X80ifEaAj/G4xVkZotjDNZR8Yjm1kmHEUYe3UDQavg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754732423; c=relaxed/simple;
	bh=yw2tnMsK1GK6wxNW4YMZMbFb3PhUjak00RMkGzsjyas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRe5ErWL+KlJKZnd062z+fBzzxicHIkkn76sQ0n57Ok0/WoMjT97YNT9uwSpIaedPB5fNUbhKOKpX5ettI5EQqel+5kBVVpzvKUfeEDQwTQT897gZww4upCLtTaxCJTdvnAiec/EW4FM3qseK/mVng3mnlWmG1ZWKuV1mkOsA+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MosJndds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794e24G010455
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 09:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxNnrpUqeyiCVEqaVvpE0uaUF/bFumySktYEnzaXhSA=; b=MosJndds7s3CXVQb
	IvBwfdaN67GaeCaShubTOW8LQPd5qnaKYZVUP1Lbe50Jbt30Mnu9TQ92eYr9yYjh
	1QHDbDCdHvT7FSslABUYd1jDHfRbgFuSsSGRqJRvg43LvU7U1ObDJd7RUXG3zTXM
	wTSKQlFVQKbJJwl8r90MOLgA9Xkx07HVb8IOIMTVf1vEvH0UEQpCwF9Ups3RH+QR
	pH1ewL0UQUFgEa1Meoi039rXhBcVgWWUJo6NbAojY8MwBIhlApSqhnle+zQqZKcy
	ay0TKJwYqYnKTtmEEqJ78eofW252Ee0etJYd65mcWRoIqRm9Wj3ygdi9K8ACo30N
	BZO48Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm8bdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 09:40:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af1a20cbcfso72188431cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754732420; x=1755337220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxNnrpUqeyiCVEqaVvpE0uaUF/bFumySktYEnzaXhSA=;
        b=Wato+p3PySyFBLXV4reSjqlmlKeAdMaaZBJz2W1oqFmgdmsLVeqASvAIAuTcikCcNl
         HrdZ4rhSc8q+oig2gllOw9sMBn1xp3+cLY+SuY9d2/rcR+2rmMUJvfcBhu09fhMxqWZb
         fSgXKuPmB8BwFnX98bfHapoqv0ypwLp9sGtLtB7Xt9XNLRxANMsPIXFbQw8Wc0MXXWU/
         BzyNHSsCxR9+lhx7HcZSySEiGNYN4zdsc54IPcl6ysqkF4oKUJFpl1cdz5Go2sL6VgCF
         AGiMp1bvbcaF5xecXCp/257Fr8gWf8FiTk2/P8Oq2Lu6mkh4CO76c3KO58NXeoP4RceB
         Hbcw==
X-Forwarded-Encrypted: i=1; AJvYcCXT4XiJIJvIZanyFT8mnHAhZt0XzfC6MBB6vspcEkH7C+RN/hp1+t/0BllRk7T6j/r0KdelZJSYKt8/Y2wk@vger.kernel.org
X-Gm-Message-State: AOJu0YzCNc0tkHsoJgwUXeFxi8eAA3PoC6OhvbUQA2tHiOmfCczzerYl
	UfP1oTwbm0hDuo+f+MJx36S1TtObQye3qrKeOwy5hYA5TWaKPkwCdU0YipqpHtoeWYhNyiMjcIg
	YZ2kGvDYSa5Agh5xBeRHfpKtodJj31pK2cPDmF2zlHVtQ5jNHox2ilqxt9KKSoD4j5zSW
X-Gm-Gg: ASbGncszBD8Jbk+Os+0NbYOsvAJsPjZXEWlFGumUZpItt5Yzxh+ezpZMFxVshtNWS2Z
	p+upKk5cKPcmmt4e1oGczQ3WR12DxU42SGcKEXPGznCw4VwLQbwYyf+i/IZ2fKKML4B8m0OxRE4
	Q2lZpR59XC3qBQR4/5BQgf7HMyAPt+D1uQMZw50U2pGMsCp412zgbtevqstjWGiRv2ORxQm3cUy
	QQrcBIP9pAZrrNyTwLu2b/kfDoQvUp4nEhCcXM676u/wYXjkc53vlxeVnwaT/X41W9TqD8DBYaO
	GhDEiy2GD4F/eOTj8tYYr/1xZndM1Q3fZFRZgP6nNTLPGCn1hOZf2dXLWiM5WqXaxDf/TgTjPUw
	eEmUOzhoy+R0S3nZKHfvEjjQxUf3HMYq2XRoy6+MRAkUKeVOySO7r
X-Received: by 2002:a05:622a:5916:b0:4b0:b5b8:de03 with SMTP id d75a77b69052e-4b0b5b8e283mr68935771cf.50.1754732419756;
        Sat, 09 Aug 2025 02:40:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEustmGiGLd7PdYTUvfwnFzAOn4gt6tq8YUWvJNcwOQXr7MGptW+h2i7cUWs4M36LXN3FYjYw==
X-Received: by 2002:a05:622a:5916:b0:4b0:b5b8:de03 with SMTP id d75a77b69052e-4b0b5b8e283mr68935331cf.50.1754732418998;
        Sat, 09 Aug 2025 02:40:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fb356sm31733911fa.61.2025.08.09.02.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:40:18 -0700 (PDT)
Date: Sat, 9 Aug 2025 12:40:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <jybd2m25jtg35yocf77e23ytbvrlt5d2f6jjscdyxilpk75tx3@na3u4h2vdweu>
References: <otfof56qvqxyjaq6onor2f3egrt57h2xazncias72qnn4xjgz5@2aj2pyj5xmyl>
 <a885b32c-c59f-4fb6-b2cb-7955d2d3ae69@quicinc.com>
 <mpuyg4ndd7xvfpwd6oubn7zmzkuienyrig5pmkrd4badlpebvf@h6weyimpcfv2>
 <769268c2-9a7f-4b6e-aabd-a6cf5a744d5b@quicinc.com>
 <d5ykzwuk3wrwycol3wpeontfp5t7h7vfrfcxnmxei3qs74xsp7@ihtzne5wbytf>
 <81323b02-a7be-847a-b973-ca0cdb906558@quicinc.com>
 <p7o2ykmpghx5jqagpkhd2rfqgizcdagn366rltyn4gmbmnmpje@vcygaqcaowkn>
 <82d11cf6-bfed-9b73-c697-c692d1c7e02d@quicinc.com>
 <1f910d65-de34-424d-adf9-7669c22afeaa@oss.qualcomm.com>
 <bb85f33a-17e4-3c7f-57ce-c4d67b7d655b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb85f33a-17e4-3c7f-57ce-c4d67b7d655b@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX//XMo0xzbv0a
 Xm0xT6lt00hRYlutlMdUQleW9tr9IlpFil1cESBW67Xj2WZ5H0d5ZNZzZfEeWAp+1Wa6I37PQM+
 OrYWj8lXZaa5k4pS+QehFO1zWiymsxDo19JhvemsW4lCliiZDT8zkHhVA9isJGPkcUpAC88y+4F
 qij+xhEPr9iZ2CeVQ3ZymFjrnuPun65q8H9rLFSlAsINpCtlAKLyzVPkp3evab/9la6mtl4D7uo
 yqRDcylNxHDNsOx55/XXmfYiZ6ff0pTTnBTVWuMS6kqwbauTvcqpe+cH0EsgKIEVUpX1b8guu7v
 UfuKx3aNUGL1W0G+804WeUKFDEjz+paL5zDA+O50JoGK5vY+9P5uUo3JnnO+MYz9CF5J7D4iyXB
 LRT4Q6Bs
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=68971785 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=6V9XOLCKYvgWmd-Ln7QA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zAswln0KHARnNvIH8bYzlsZWCfLDsKQd
X-Proofpoint-ORIG-GUID: zAswln0KHARnNvIH8bYzlsZWCfLDsKQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Thu, Aug 07, 2025 at 01:28:28AM +0530, Ram Prakash Gupta wrote:
> 
> On 7/31/2025 7:49 PM, Dmitry Baryshkov wrote:
> > On 31/07/2025 14:46, Ram Prakash Gupta wrote:
> >>
> >> On 7/30/2025 11:26 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Jul 23, 2025 at 03:43:37PM +0530, Ram Prakash Gupta wrote:
> >>>> On 1/22/2025 3:20 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Jan 22, 2025 at 02:57:59PM +0530, Sachin Gupta wrote:
> >>>>>> On 1/7/2025 8:38 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, Jan 07, 2025 at 11:13:32AM +0530, Sachin Gupta wrote:
> >>>>>>>> On 12/27/2024 12:23 AM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
> >>>>>>>>>> On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>> On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> >>>>>>>>>>>> +{
> >>>>>>>>>>>> +    struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> >>>>>>>>>>>> +    struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> >>>>>>>>>>>> +    struct clk *core_clk = msm_host->bulk_clks[0].clk;
> >>>>>>>>>>>> +    unsigned int sup_clk;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    if (req_clk < sdhci_msm_get_min_clock(host))
> >>>>>>>>>>>> +        return sdhci_msm_get_min_clock(host);
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    if (host->clock != msm_host->clk_rate)
> >>>>>>>>>>>> +        sup_clk = sup_clk / 2;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    return sup_clk;
> >>>>>>>>>>> Why?
> >>>>>>>>>> Sorry, I did not understand your question. Can you please explain in detail.
> >>>>>>>>> Please explain the maths. You get the rate from the clock, then you
> >>>>>>>>> round it, but it is the rate that has just been returned, so there
> >>>>>>>>> should be no need to round it. And after that there a division by two
> >>>>>>>>> for some reason. So I've asked for an explanation for that code.
> >>>>>>>>>
> >>>>>>>> clk_round_rate is used in case of over clocking issue we can round it to the
> >>>>>>>> usable frequency.
> >>>>>>> If it is a frequency _returned_ by the clock driver, why do you need to
> >>>>>>> round it? It sounds like that freq should be usable anyway.
> >>>>>>>
> >>>>>> I agree, rounding will be taken care by clock driver. Will remove in my next
> >>>>>> patch.
> >>>>>>
> >>>>>>>> Divide by 2 is used as for HS400 the tuning happens in
> >>>>>>>> HS200 mode only so to update the frequency to 192 Mhz.
> >>>>>>> Again, is it really 192 MHz? Or 19.2 MHz?
> >>>>>>> Also if it is for HS400, then shouldn't /2 be limited to that mode?
> >>>>>>>
> >>>>>> Yes, It is 192 MHz.
> >>>>> Good, thanks for the confirmation.
> >>>>>
> >>>>>> As part of eMMC Init, driver will try to init with the best mode supported
> >>>>>> by controller and device. In this case it is HS400 mode, But as part of
> >>>>>> HS400 mode, we perform Tuning in HS200 mode only where we need to configure
> >>>>>> half of the clock.
> >>>>> This isn't an answer to the question. Let me rephrase it for you: if the
> >>>>> /2 is only used for HS400, why should it be attempted in all other
> >>>>> modes? Please limit the /2 just to HS400.
> >>>> Hi Dmitry,
> >>>>
> >>>> like updated earlier by Sachin, HS400 tuning happens in HS200 mode, so if
> >>>> we try to use "ios->timing == MMC_TIMING_MMC_HS400" that wont help, as at
> >>>> this stage timing can be MMC_TIMING_MMC_HS200/MMC_TIMING_MMC_HS400 for
> >>>> hs200 tuning and hs400 selection. In this case we must divide clk by 2
> >>>> to get 192MHz and we find this as host->clock wont be equal to
> >>>> msm_host->clk_rate.
> >>> What are host->clock and msm_host->clk_rate at this point?
> >>> What is the host->flags value? See sdhci_msm_hc_select_mode().
> >>
> >> There are 2 paths which are traced to this function when card initializes
> >> in HS400 mode, please consider below call stack in 2 paths
> >>
> >> sdhci_msm_configure_dll
> >> sdhci_msm_dll_config
> >> sdhci_msm_execute_tuning
> >> mmc_execute_tuning
> >> mmc_init_card
> >> _mmc_resume
> >> mmc_runtime_resume
> >>
> >> with values of host->clock as 200000000 & msm_host-clk_rate as 400000000
> >
> > Please check the rates explicitly in the code rather than just checking that they are not equal.
> 
> in function msm_get_clock_mult_for_bus_mode(), clk multiplier returns 2, with HS400
> DDR52 and DDR50 modes which is called from sdhci_msm_set_clock() and
> sdhci_msm_execute_tuning. And in sdhci_msm_execute_tuning(), we are calling
> sdhci_msm_dll_config() when SDHCI_HS400_TUNING is set and this flag is cleared
> immediately after return. And sdhci_msm_dll_config() is called after that.
> 
> Now when the card is supporting HS400 mode, then from mmc_hs200_tuning(),
> sdhci_prepare_hs400_tuning is getting called, and there SDHCI_HS400_TUNING
> flag is set, and clock set is multiplying the clk rate by 2 in below call stack
> 
> msm_set_clock_rate_for_bus_mode
> sdhci_msm_execute_tuning
> mmc_execute_tuning
> mmc_init_card
> 
> so this clk rate is doubling only with HS400 mode selection and while setting up
> dll in HS400 dll configuration path sup_clk need to divide by 2 as msm_host->clk_rate
> is twice the host->clock as mentioned above.

I don't see how it's relevant. I'm asking you to check for the rate
values explicitly in the driver code rather than just checking that
rateA != rateB. You might error out if rateA != rateB and they are not
192 MHz / 384 MHz

> 
> 
> >
> >> and host->flags as 0x90c6.
> >>
> >> and
> >>
> >> sdhci_msm_configure_dll
> >> sdhci_msm_dll_config
> >> sdhci_msm_set_uhs_signaling
> >> sdhci_set_ios
> >> mmc_set_clock
> >> mmc_set_bus_speed
> >> mmc_select_hs400
> >> mmc_init_card
> >> _mmc_resume
> >> mmc_runtime_resume
> >>
> >> with values of host->clock as 200000000 & msm_host-clk_rate as 400000000
> >> and host->flags as 0x90c6 which are same as 1st.
> >>
> >> Now if card is initialized in HS200 mode only below is the call stack
> >>
> >> sdhci_msm_configure_dll
> >> sdhci_msm_dll_config
> >> sdhci_msm_execute_tuning
> >> mmc_execute_tuning
> >> mmc_init_card
> >> _mmc_resume
> >> mmc_runtime_resume
> >>
> >> with values of host->clock as 200000000 & msm_host-clk_rate as 200000000
> >> and host->flags as 0x90c6.
> >>
> >> now if you see the host->flags value, its same across the modes, and if
> >> I am getting it right from the pointed out function
> >> sdhci_msm_hc_select_mode(), your suggestion seems to be using the check
> >> host->flags & SDHCI_HS400_TUNING which is bit[13], but in above dumped
> >> host->flags SDHCI_HS400_TUNING bit is not set where we are using the /2.
> >>
> >> and the reason is, this bit is getting cleared in sdhci_msm_execute_tuning()
> >> before sdhci_msm_dll_config() call.
> >>
> >> so this /2, is eventually called only for HS400 mode.
> >>
> >> Thanks,
> >> Ram
> >>
> >>>
> >>>> Now if we go for only HS200 mode supported card, there
> >>>> the supported clock value would be 192Mhz itself and we need to pass
> >>>> clk freq as 192MHz itself, hence division by 2 wont be needed, that is
> >>>> achieved there as host->clock would be equal to msm_host->clk_rate. Hence
> >>>> no other check is needed here.
> >>> Please think about the cause, not about the symptom. Clocks being
> >>> unequal is a result of some other checks being performed by the driver.
> >>> Please use those checks too.
> >>>
> >>>> sorry for it took time to update as I was gathering all this data.
> >>> 6 months? Well, that's a nice time to "gather all this data".
> >>
> >> Took it up from sachin last month but still its a long gap.
> >> Thanks for helping revive.
> >>
> >>>
> >>>> since Sachin have already pushed patchset #3, and if this explanation
> >>>> helps, let me know if we can continue on patchset #3.
> >>>>
> >>>> Thanks,
> >>>> Ram
> >>>>
> >
> >

-- 
With best wishes
Dmitry

