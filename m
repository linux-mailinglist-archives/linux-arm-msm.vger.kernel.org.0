Return-Path: <linux-arm-msm+bounces-71088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71558B39A04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 818AD163671
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 10:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E3D30C60E;
	Thu, 28 Aug 2025 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSAIudBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084D230ACFA
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756377113; cv=none; b=JdkoJU3i7+5dA4ctQZUF3nkJ+O5k5+c1FBZa4S6jNuD6qYegDU5XH0hfcw40evBm/hGHgzWPFQPTUFTNH0JQKXPPeKtPhsj2vkxKOOI3GEJwEEYA7tOO2BSDvAB2YGY7OSWob/In+WX6Q+bs1W0A98YJnGSLNEqR6mgqNqjhw9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756377113; c=relaxed/simple;
	bh=tMosiq+ds7fp5y+WKEytetzY4ZZNGU0P/rB2j6Ht9Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpqbuoXutTDK9XZbrESd0HiAicV4NzqFWkO5sUpfJcOGYGz4PuNssL7knLpoTWkS7EfGdh5zfhsofC82cdiuEcAi4MdL5iPIO+GWzernmcx63QDsf9orTlixk6jmaCRaW+7pvL3pmb81hMxRcCAGLHp9MFRpVzKxGs7f+3OoblY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSAIudBw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5R0AY015246
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9WiOKIOlKJ7PLAZcqgHAvc4Wt1A+B1/zu8MBNbx8lw=; b=OSAIudBwJveiw/KV
	bOkh+Lon975z9UF0xiN2gKFOLlWcReO3R8+asuYkddXIDIhyIBADKZq0IP4RJmqD
	cHGfOch2wRBKkyDfhAd8sud7zxYGe4HQ0ywkkBFkHqoBK7bbj18VJrVy2QRjZoYq
	HoemJuTYDzEviS0XVVzqdIIBK8OEsopK+/qlk1KUtcwTOzuxwbKj2uMmAE9rkdp9
	MZRxzYNAg2Vz7oErr9wdf4OonV60WjSMUnTv9aWt/CYneMnDut6zQfJBjv6quu5l
	ypEy4f+KJl5EWmzw+xpznHGm5a5ujNH2smyh+uVIkNGv6ZNxBPzRaGA5ZJfuaN/U
	gHou4w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we7kw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:31:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70ddadde46bso17852626d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 03:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756377110; x=1756981910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9WiOKIOlKJ7PLAZcqgHAvc4Wt1A+B1/zu8MBNbx8lw=;
        b=sAr6Ew7eJQrWO1kAZPArw2Q0rISAbaIU1d3EBWxm5nC7b8mh1MwpjEls1ph/JfPH30
         g7hRJNScPoVqhhPLWy0nKoAjbSmtg0kX3bRfSOitQzig/coO/rMVm5eZnD+vPi0WxunB
         E+2Yrimrd37/YNJUVBDfNJnQzXdLwg6HhIoz9fTTLKMwwhbaFN7qbgn675ViGbVLuXw9
         AJKj8E8wJu6+7E0iVhzg9K2QCd8cMCfuF7Sh+n7lrYNh98m9a4R4hRFQ8cO7YuA3Heai
         O5yRiHZFmBYDv/+GWKQPa1bI9Zwglmt9ojnzkzMNoJzFzRE+2GrJP9K1JeN1LftTnRtz
         9qaw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5og/5LFovcgi2+k1TcNoapjZjsdWTpl2F0Bx72ykwH0YqsufqwklvFGuxN+J5MHjIhrpUQmAkr5jOYA3@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMcy5RkgbcQBfs+WPKG/F5MmzxHTvQobP2uDfPYPeNEmnMMkd
	yICE+vxPuRfeh7ThkyqTqQ9rLnftvG8GqAfGsZN4KgsPs2laxspE+lWHxymWoXe3oFIgcxQqwAe
	vbQ2Z3U3Rjh1RC+N08t7Af/DqUPBRtOyn/sggvaJETSX5e68baK+Xwy0o846dgkMy6BezKTNc3X
	iqwuE=
X-Gm-Gg: ASbGncuMj/S7ZOaCnR4DJRHVVy62qxEZ0NHiuWCpiIE+HJsPBUSe7vH2uPiFe/aGAGu
	jfKFagF+wBmWF1BggByyvQMie6zL+C5Ur8hdrbOahyZANvdvB1bLd0O8Ald9+JKj+7gCAkY1W0X
	syu63Gx5Mf4JHoWZl+nuZ+eQnHuhRtTY9RZJKR+8YxtFDaEkS2W3grTZEIsAHwY7IKUpOIk3Cry
	MjN4AcfpT7CpnxadKmSGScWiXLay/8SkFYgtRXZ4QEj2HhNEYiUB8Af9hKQbIMlWjEtLXmHe/n/
	NQdmMD1p/63WSGNDUNH1MQqI9aYCWu1HRJdkL0lwPJB7T6XuR0JDkyEhK7KlrwT0zik3VlyUnkT
	vFhUpLDTbFVGspzXNhqmwTYiAsYRdpRbZkXg/tl6mxKT8cnlvQiOp
X-Received: by 2002:a05:6214:ca9:b0:705:c148:26a0 with SMTP id 6a1803df08f44-70d971e4c3cmr256141106d6.31.1756377109612;
        Thu, 28 Aug 2025 03:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGabGDuV7RH7XtiHw/GVFS0TL++vOcS9epnGu7rG9+RKZF6r7predeBwqVI57sChDQW8QANRg==
X-Received: by 2002:a05:6214:ca9:b0:705:c148:26a0 with SMTP id 6a1803df08f44-70d971e4c3cmr256140626d6.31.1756377109029;
        Thu, 28 Aug 2025 03:31:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c0221dsm3168701e87.7.2025.08.28.03.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:31:48 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:31:45 +0300
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
Message-ID: <nvgm2jeyhabxdhurcflc2gu4vdk2zjfoba22mc6j3d7azxdicz@ln5pu676b3lf>
References: <769268c2-9a7f-4b6e-aabd-a6cf5a744d5b@quicinc.com>
 <d5ykzwuk3wrwycol3wpeontfp5t7h7vfrfcxnmxei3qs74xsp7@ihtzne5wbytf>
 <81323b02-a7be-847a-b973-ca0cdb906558@quicinc.com>
 <p7o2ykmpghx5jqagpkhd2rfqgizcdagn366rltyn4gmbmnmpje@vcygaqcaowkn>
 <82d11cf6-bfed-9b73-c697-c692d1c7e02d@quicinc.com>
 <1f910d65-de34-424d-adf9-7669c22afeaa@oss.qualcomm.com>
 <bb85f33a-17e4-3c7f-57ce-c4d67b7d655b@quicinc.com>
 <jybd2m25jtg35yocf77e23ytbvrlt5d2f6jjscdyxilpk75tx3@na3u4h2vdweu>
 <ec1b0c96-3069-5937-7bc4-cbce0a4c4ec2@quicinc.com>
 <335a0397-59e3-ad65-5e75-0bb7f399be66@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <335a0397-59e3-ad65-5e75-0bb7f399be66@quicinc.com>
X-Proofpoint-GUID: V74zrkjQKkOGem36dOEe3BXG4ySbGmNM
X-Proofpoint-ORIG-GUID: V74zrkjQKkOGem36dOEe3BXG4ySbGmNM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwFRphmAcEFCn
 0yxbaHpDLx8SCr13sT9cfJ3NCKn8AEk9KobggCN4DZol/uHfmKU28tMMNqMcOvYQI6gzXOXTpWg
 NgVUJe8LaA9o60B76HnYWgIsSLFKTQHf4Of5YPiyazFyg3l/fpGL9io694jpvCK+TTtlFfMo/O3
 aAdTYlynPaW/WeiE21TuIgSq2Bp8tHO/8k5sMVua1s0iW3t7sDjANEC/KgAccDC0plKn/DUBRQh
 ZIQzRXWnhwAPZK6EWGtofA7KjPO8+BwF5xVoop0t9wSHI7iu6JMyGthj8BhgZgVET2zvWXnjkU6
 5MDSaJLt1eY5eHbrgugy2+XVmImCrSliMgtwkqxUQRbYZHuJWEWiXTrap7/JKiWWYqKpOSdIG64
 pFkSCaGK
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b03016 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=DmG7qftGFCsyeU4zcA4A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On Thu, Aug 28, 2025 at 01:30:21PM +0530, Ram Prakash Gupta wrote:
> 
> On 8/21/2025 7:45 PM, Ram Prakash Gupta wrote:
> > On 8/9/2025 3:10 PM, Dmitry Baryshkov wrote:
> >> On Thu, Aug 07, 2025 at 01:28:28AM +0530, Ram Prakash Gupta wrote:
> >>> On 7/31/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>>> On 31/07/2025 14:46, Ram Prakash Gupta wrote:
> >>>>> On 7/30/2025 11:26 PM, Dmitry Baryshkov wrote:
> >>>>>> On Wed, Jul 23, 2025 at 03:43:37PM +0530, Ram Prakash Gupta wrote:
> >>>>>>> On 1/22/2025 3:20 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Wed, Jan 22, 2025 at 02:57:59PM +0530, Sachin Gupta wrote:
> >>>>>>>>> On 1/7/2025 8:38 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Tue, Jan 07, 2025 at 11:13:32AM +0530, Sachin Gupta wrote:
> >>>>>>>>>>> On 12/27/2024 12:23 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
> >>>>>>>>>>>>> On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> >>>>>>>>>>>>>>> +{
> >>>>>>>>>>>>>>> +    struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> >>>>>>>>>>>>>>> +    struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> >>>>>>>>>>>>>>> +    struct clk *core_clk = msm_host->bulk_clks[0].clk;
> >>>>>>>>>>>>>>> +    unsigned int sup_clk;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +    if (req_clk < sdhci_msm_get_min_clock(host))
> >>>>>>>>>>>>>>> +        return sdhci_msm_get_min_clock(host);
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +    sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +    if (host->clock != msm_host->clk_rate)
> >>>>>>>>>>>>>>> +        sup_clk = sup_clk / 2;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +    return sup_clk;
> >>>>>>>>>>>>>> Why?
> >>>>>>>>>>>>> Sorry, I did not understand your question. Can you please explain in detail.
> >>>>>>>>>>>> Please explain the maths. You get the rate from the clock, then you
> >>>>>>>>>>>> round it, but it is the rate that has just been returned, so there
> >>>>>>>>>>>> should be no need to round it. And after that there a division by two
> >>>>>>>>>>>> for some reason. So I've asked for an explanation for that code.
> >>>>>>>>>>>>
> >>>>>>>>>>> clk_round_rate is used in case of over clocking issue we can round it to the
> >>>>>>>>>>> usable frequency.
> >>>>>>>>>> If it is a frequency _returned_ by the clock driver, why do you need to
> >>>>>>>>>> round it? It sounds like that freq should be usable anyway.
> >>>>>>>>>>
> >>>>>>>>> I agree, rounding will be taken care by clock driver. Will remove in my next
> >>>>>>>>> patch.
> >>>>>>>>>
> >>>>>>>>>>> Divide by 2 is used as for HS400 the tuning happens in
> >>>>>>>>>>> HS200 mode only so to update the frequency to 192 Mhz.
> >>>>>>>>>> Again, is it really 192 MHz? Or 19.2 MHz?
> >>>>>>>>>> Also if it is for HS400, then shouldn't /2 be limited to that mode?
> >>>>>>>>>>
> >>>>>>>>> Yes, It is 192 MHz.
> >>>>>>>> Good, thanks for the confirmation.
> >>>>>>>>
> >>>>>>>>> As part of eMMC Init, driver will try to init with the best mode supported
> >>>>>>>>> by controller and device. In this case it is HS400 mode, But as part of
> >>>>>>>>> HS400 mode, we perform Tuning in HS200 mode only where we need to configure
> >>>>>>>>> half of the clock.
> >>>>>>>> This isn't an answer to the question. Let me rephrase it for you: if the
> >>>>>>>> /2 is only used for HS400, why should it be attempted in all other
> >>>>>>>> modes? Please limit the /2 just to HS400.
> >>>>>>> Hi Dmitry,
> >>>>>>>
> >>>>>>> like updated earlier by Sachin, HS400 tuning happens in HS200 mode, so if
> >>>>>>> we try to use "ios->timing == MMC_TIMING_MMC_HS400" that wont help, as at
> >>>>>>> this stage timing can be MMC_TIMING_MMC_HS200/MMC_TIMING_MMC_HS400 for
> >>>>>>> hs200 tuning and hs400 selection. In this case we must divide clk by 2
> >>>>>>> to get 192MHz and we find this as host->clock wont be equal to
> >>>>>>> msm_host->clk_rate.
> >>>>>> What are host->clock and msm_host->clk_rate at this point?
> >>>>>> What is the host->flags value? See sdhci_msm_hc_select_mode().
> >>>>> There are 2 paths which are traced to this function when card initializes
> >>>>> in HS400 mode, please consider below call stack in 2 paths
> >>>>>
> >>>>> sdhci_msm_configure_dll
> >>>>> sdhci_msm_dll_config
> >>>>> sdhci_msm_execute_tuning
> >>>>> mmc_execute_tuning
> >>>>> mmc_init_card
> >>>>> _mmc_resume
> >>>>> mmc_runtime_resume
> >>>>>
> >>>>> with values of host->clock as 200000000 & msm_host-clk_rate as 400000000
> >>>> Please check the rates explicitly in the code rather than just checking that they are not equal.
> >>> in function msm_get_clock_mult_for_bus_mode(), clk multiplier returns 2, with HS400
> >>> DDR52 and DDR50 modes which is called from sdhci_msm_set_clock() and
> >>> sdhci_msm_execute_tuning. And in sdhci_msm_execute_tuning(), we are calling
> >>> sdhci_msm_dll_config() when SDHCI_HS400_TUNING is set and this flag is cleared
> >>> immediately after return. And sdhci_msm_dll_config() is called after that.
> >>>
> >>> Now when the card is supporting HS400 mode, then from mmc_hs200_tuning(),
> >>> sdhci_prepare_hs400_tuning is getting called, and there SDHCI_HS400_TUNING
> >>> flag is set, and clock set is multiplying the clk rate by 2 in below call stack
> >>>
> >>> msm_set_clock_rate_for_bus_mode
> >>> sdhci_msm_execute_tuning
> >>> mmc_execute_tuning
> >>> mmc_init_card
> >>>
> >>> so this clk rate is doubling only with HS400 mode selection and while setting up
> >>> dll in HS400 dll configuration path sup_clk need to divide by 2 as msm_host->clk_rate
> >>> is twice the host->clock as mentioned above.
> >> I don't see how it's relevant. I'm asking you to check for the rate
> >> values explicitly in the driver code rather than just checking that
> >> rateA != rateB. You might error out if rateA != rateB and they are not
> >> 192 MHz / 384 MHz
> > ok I see, but I got one another alternate to this, I can try use similar checks used in
> > function msm_get_clock_mult_for_bus_mode(), ios.timing == MMC_TIMING_MMC_HS400 
> > host->flags & SDHCI_HS400_TUNING, but for this I ll have to move check
> > host->flags &= ~SDHCI_HS400_TUNING in function sdhci_msm_execute_tuning () at the bottom
> > of this function, this will make code more readable and consistent to checks at other
> > places but I am testing it right now and will update.
> >
> > If this doesn't work then I ll explicitly use the rate value in check.
> >
> > Thanks,
> > Ram
> 
> Hi Dmitry,
> 
> adding checks for ios.timing == MMC_TIMING_MMC_HS400 && host->flags & SDHCI_HS400_TUNING
> serves the same purpose for dividing the clk when mode is hs400 and hs400_tuning flag is
> set, and clk value checks can be avoided now.
> 
> With this HS200, HS400, HS400ES modes of eMMC is tested.
> 
> so if this approach looks good to you, then I would like to proceed with next patchset.

LGTM.


-- 
With best wishes
Dmitry

