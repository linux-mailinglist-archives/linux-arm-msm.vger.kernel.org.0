Return-Path: <linux-arm-msm+bounces-67187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F251B165DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 19:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E35D3548929
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 17:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D329E2E2EEA;
	Wed, 30 Jul 2025 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqLfbPc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E18D2E2EEF
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 17:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753898173; cv=none; b=ZiC6lEzclYUaooRGHO7TGY3GASNelcuFWi+MXfE5/VQWX6/4zYuX700iktcnlsoSpzb8enWdGJxr0A3Ca9TVfauDaBKckVK6Fc+Cb5HUlDVCC2qHusWIz0Elf3zpxoqQvca9H7rij/oIxFA9YGIpycevwmqyNjxaaw7XB/uJs9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753898173; c=relaxed/simple;
	bh=xM9bJrOLQvE/L4ROO/2dHRsVAafQFJCehHj4F1f40IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK04xdMT34GOf+v7JM1MOxSz9R78/cb2ISAfbKXJ6jyG4gbc/iOziFSGMz71l2po3cOgkef2j9PRR0LYSFQQfSwENA/iFrbcb7ezUqF72gQcM9pMnha+G5ApzNBMxwLisj9nxt2mphuYop0H+pBQRP9kqEicBkcrG8xGNCNEwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqLfbPc5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbAd9001352
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 17:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S87jF1f1+5uAHGo0xR/Mg2me
	DzeGKpJ2QhooQERCTug=; b=jqLfbPc5Jdbvd0ahzLb9PnqL7ib6QKUUwdVhBhGP
	/CNmFu2JHm2dOlIZ1IZ4S/cLu+Z2gykpVl1FLR9CZ6Hu/LIxEPpYiElqdlNfOdZD
	QegiyiNIKOgABcRU6dePOiMkCLCoLEizPARg25HAQKg2lLBa8ZeU9ILhlkPtVOqk
	tG1oNT9hex1PIaiwtivffPrQ7HWLk+2aSim3WYjtek4NarXNG+/F7/zTij2/os+z
	2+y4TFbfOv3G/YEX2LkUGgywt4j8oGGu1U+Dzo/enTzWKS0UrbaYtNL7E25mSr0v
	KeBxymnQJDitx/YOnaiXA+Ovieby5lNCpIgmdawM5snn+g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86501w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 17:56:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-707453b0307so745246d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753898170; x=1754502970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S87jF1f1+5uAHGo0xR/Mg2meDzeGKpJ2QhooQERCTug=;
        b=u3XK4GDv06i48FnbZ2Zbo1NxcBDBuWhpfaOQusAyI8dpgnWbzbd6EJtHCI92ZHJoRJ
         s45kdladdpRwK1+ya8Tk+HmvOaviWJxN/I11amo3YwcBW4p5Jwr+0bK1ufp3bMZM658w
         mVJ/N0P4qg3xw3BHHesV1wo0MTujiDdChOOoBT39phr28vLgW2IIb/5zaCqNwKbPeOVU
         5FTzq3XJEtDnhKmJCItUpW7M31rwOs0etRtxcDCeMZ5wdZHa3Q0q9Db5hBT5U7c9jd0l
         RICi5TGRG+IY93zhhkDjwrkWt4Py9xvoGry/imkaG1ZNO7noKG64EFe2cuTWKwqfaJtu
         kYWA==
X-Forwarded-Encrypted: i=1; AJvYcCXcAy41v+hlhhXEVWm2vmcOeHmR9bek1milGrzyo3kSTBcd099myc3o5TlWl1rkF7M7sO15ULiYE9cDCVgq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8rZHM7ahW3zK0GG7/FBIBaWrf2+93F0tby4DU8hixa0k6w3B
	JuAjXIhr8q+U0GbTkyKwBjsq7Cyg4stce9nQCFNzxvLLf8aDUgF4yGyurCpykQUlTC5TpMMXu+o
	9y0oHCd+BtXJiHNyXlAVQwh+cx4qUhvUtEjFDZy6MjUDP/92Kh4ryOE9y/OUdv1FxHJGb
X-Gm-Gg: ASbGncu0i2H0kkoSYru1aDWu1Yn6/KeIwpikac41cBvz+ZOsNaH7wT50QN5896ZPtNO
	1vxvOx97GBIm/+1sJ38+9ikhreN69BsxgzyInpqRgfC8lWWz8Y9zEZBvoHhVfa/BD1zQ19jluis
	CGu1pyt0riFH+jJ9e9KUsQGqYxexk5PeGm7bWzHMg5lrsXa8Tj5mSYydiv1Xom9iLZqi0PXjkjs
	eAJot2SBIGj3oJ3ziW15ZJHg6bhXbC+d46pUmfqaJRiH7GSiwPF9WQFY1mCdOCVqYjGXqzK3k5B
	EKRzZ/2JuHN6QJoPFMmMB2WU7JNwQKERQ+lrhiIKZq0cOpf8AWXhhjPTCxqEPOzT7taQnkaLc8a
	o/MPF7qd2HA2Ugac+cNpHSHu0r0GZkcyh6/NK2/S6lVIOCH9bwtUT
X-Received: by 2002:ad4:5d47:0:b0:6fb:3579:8f07 with SMTP id 6a1803df08f44-7076710ffe2mr68106146d6.31.1753898169628;
        Wed, 30 Jul 2025 10:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9CzeNqHatgD28u+dXvkQErA1w/3LINj69dgtpdy+WyYUq56GDl0fM0fc8WawlBF/Ul4RQ9w==
X-Received: by 2002:ad4:5d47:0:b0:6fb:3579:8f07 with SMTP id 6a1803df08f44-7076710ffe2mr68105416d6.31.1753898169101;
        Wed, 30 Jul 2025 10:56:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f4235632sm19002881fa.60.2025.07.30.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 10:56:08 -0700 (PDT)
Date: Wed, 30 Jul 2025 20:56:06 +0300
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
Message-ID: <p7o2ykmpghx5jqagpkhd2rfqgizcdagn366rltyn4gmbmnmpje@vcygaqcaowkn>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
 <20241218091057.15625-3-quic_sachgupt@quicinc.com>
 <a2mnkliubpdryxdwsd33kccvnlb4fnyzik5ywxw4xhnimwdwsm@oxe34zogzfot>
 <bb60a145-1e8f-4004-b266-9f26a11440b9@quicinc.com>
 <otfof56qvqxyjaq6onor2f3egrt57h2xazncias72qnn4xjgz5@2aj2pyj5xmyl>
 <a885b32c-c59f-4fb6-b2cb-7955d2d3ae69@quicinc.com>
 <mpuyg4ndd7xvfpwd6oubn7zmzkuienyrig5pmkrd4badlpebvf@h6weyimpcfv2>
 <769268c2-9a7f-4b6e-aabd-a6cf5a744d5b@quicinc.com>
 <d5ykzwuk3wrwycol3wpeontfp5t7h7vfrfcxnmxei3qs74xsp7@ihtzne5wbytf>
 <81323b02-a7be-847a-b973-ca0cdb906558@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81323b02-a7be-847a-b973-ca0cdb906558@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEzMCBTYWx0ZWRfX8UulhuQ6rHBL
 CUgc1Y+hHwD65XwP3hvwMWqdwFrqZGHNI4Q9jTl/hBGp/RCato/aQFrOCP2hitlm1JJS5B2g4we
 wwVCIKCTukrvzZGIQOMX30OJOtq32mGtzP70Goq0SucsZ/1h8/QkhjfklQ+mFd30T5tgmMutLNP
 mJrW+gUilKotfRKrJ63OcCoO1nXhJIJgKR99w6k3fzdjtZ7VMXUJUL/peFueFfwDhE3Rgcm30T6
 PbpgB3wifWFbvospUPzKWdfN+38+mLkxgFT8baY1qSmce58cSp1um/iKUv9YpMNI0KBuTDLZ0Wb
 noPUwyCtDRYCHMsg6JALxfMBs0GFgL69zKQhVF0eQoBBpNx6ZbQPvKsumELU/VROXcK+jCKhS95
 26XHRATukXXx59lWkftDaMmAkqWBCAbM0YIWBvyCHwKOt/fAW4BfEDf6xSUgLeorM1zL7KtR
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688a5cbb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=X73hcK0hsF-LJh63foUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: H_DN1iw2cC-etvNfIJu0hu3cP8ibV5H1
X-Proofpoint-GUID: H_DN1iw2cC-etvNfIJu0hu3cP8ibV5H1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300130

On Wed, Jul 23, 2025 at 03:43:37PM +0530, Ram Prakash Gupta wrote:
> 
> On 1/22/2025 3:20 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 22, 2025 at 02:57:59PM +0530, Sachin Gupta wrote:
> >> On 1/7/2025 8:38 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Jan 07, 2025 at 11:13:32AM +0530, Sachin Gupta wrote:
> >>>> On 12/27/2024 12:23 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
> >>>>>> On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
> >>>>>>> On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:
> >>>>>>>> +
> >>>>>>>> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> >>>>>>>> +{
> >>>>>>>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> >>>>>>>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> >>>>>>>> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> >>>>>>>> +	unsigned int sup_clk;
> >>>>>>>> +
> >>>>>>>> +	if (req_clk < sdhci_msm_get_min_clock(host))
> >>>>>>>> +		return sdhci_msm_get_min_clock(host);
> >>>>>>>> +
> >>>>>>>> +	sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
> >>>>>>>> +
> >>>>>>>> +	if (host->clock != msm_host->clk_rate)
> >>>>>>>> +		sup_clk = sup_clk / 2;
> >>>>>>>> +
> >>>>>>>> +	return sup_clk;
> >>>>>>> Why?
> >>>>>> Sorry, I did not understand your question. Can you please explain in detail.
> >>>>> Please explain the maths. You get the rate from the clock, then you
> >>>>> round it, but it is the rate that has just been returned, so there
> >>>>> should be no need to round it. And after that there a division by two
> >>>>> for some reason. So I've asked for an explanation for that code.
> >>>>>
> >>>> clk_round_rate is used in case of over clocking issue we can round it to the
> >>>> usable frequency.
> >>> If it is a frequency _returned_ by the clock driver, why do you need to
> >>> round it? It sounds like that freq should be usable anyway.
> >>>
> >> I agree, rounding will be taken care by clock driver. Will remove in my next
> >> patch.
> >>
> >>>> Divide by 2 is used as for HS400 the tuning happens in
> >>>> HS200 mode only so to update the frequency to 192 Mhz.
> >>> Again, is it really 192 MHz? Or 19.2 MHz?
> >>> Also if it is for HS400, then shouldn't /2 be limited to that mode?
> >>>
> >> Yes, It is 192 MHz.
> > Good, thanks for the confirmation.
> >
> >> As part of eMMC Init, driver will try to init with the best mode supported
> >> by controller and device. In this case it is HS400 mode, But as part of
> >> HS400 mode, we perform Tuning in HS200 mode only where we need to configure
> >> half of the clock.
> > This isn't an answer to the question. Let me rephrase it for you: if the
> > /2 is only used for HS400, why should it be attempted in all other
> > modes? Please limit the /2 just to HS400.
> 
> Hi Dmitry,
> 
> like updated earlier by Sachin, HS400 tuning happens in HS200 mode, so if
> we try to use "ios->timing == MMC_TIMING_MMC_HS400" that wont help, as at
> this stage timing can be MMC_TIMING_MMC_HS200/MMC_TIMING_MMC_HS400 for
> hs200 tuning and hs400 selection. In this case we must divide clk by 2
> to get 192MHz and we find this as host->clock wont be equal to 
> msm_host->clk_rate.

What are host->clock and msm_host->clk_rate at this point?
What is the host->flags value? See sdhci_msm_hc_select_mode().

> Now if we go for only HS200 mode supported card, there
> the supported clock value would be 192Mhz itself and we need to pass
> clk freq as 192MHz itself, hence division by 2 wont be needed, that is
> achieved there as host->clock would be equal to msm_host->clk_rate. Hence
> no other check is needed here.

Please think about the cause, not about the symptom. Clocks being
unequal is a result of some other checks being performed by the driver.
Please use those checks too.

> 
> sorry for it took time to update as I was gathering all this data.

6 months? Well, that's a nice time to "gather all this data".

> since Sachin have already pushed patchset #3, and if this explanation
> helps, let me know if we can continue on patchset #3.
> 
> Thanks,
> Ram
> 

-- 
With best wishes
Dmitry

