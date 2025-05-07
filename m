Return-Path: <linux-arm-msm+bounces-57022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 577CAAAD248
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 02:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44D24C577C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 00:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F61B11CA9;
	Wed,  7 May 2025 00:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffgn15Mz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B28C1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 00:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577681; cv=none; b=GerJe+BcqHyUN/HnkElPs8B6f/i6BNXn3mtDfpTbP3QipiFw7PW/BNFT3CVkW8XoY0RR3fuPjblq6wzSMYWat78Excj+NCoND1pK2MtiICKHur/lamtKOb2DzGVu9PUe58E4D5obczq0qPK12vZ59jgnRGs8VvxBXdAij3BLNF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577681; c=relaxed/simple;
	bh=rj865xdjUMX7Oh9l0dClpP2tYP9jObD2CLFFXFRiUKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiZDwsXvLmx00BK2m5ToC+Ph3qOBu0BODE1YBJmiMxLHHYYYnrQRGLf3VLRaZnj1+Khb+njrCgSfnRzB6CHm/004EtwcKKCegUZlbFzKOiz2FZvPRDIOGW+8+LGFsF7TWaTYmPE8lStlo3YiwaazLRMog6aejLSN3KhIBEsuTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffgn15Mz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546HVlrQ026840
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 May 2025 00:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KU+/kQQFaGW5BRBV/U1cUh90
	Qk/YbplfaNVELF2XFnE=; b=ffgn15MzuiIcMahzmndri2EexNsnmtVX80Pplzk7
	363WyTB6btQospff83XAtAkXPmCWslg0h90nzuFfr5DJh/DzWyy0MKP95mxjDsX9
	rRXBRCsMjWyQ4pG3yDv5Ft6AcoUiUEVAJdwhCgUuxxWEKzERRF0yRSXOj/64QlQq
	cnKlwSpOH0d+UURY3urSah55GIxb8v22rmEJKIiO2eJdJlwskRzMvWU+ajLvmMEV
	xo38J9S6bJt7FLlto6OvhflGWXAqXpVeB2JFCY4pCUV8YyHVy+mpfG2M5/WJQKGb
	os8PXHCzpuCo7HGFcWla4BzSh7xJ87C4kI0xS5sO29usug==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv40qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 00:27:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e905e89798so111698056d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 17:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746577676; x=1747182476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU+/kQQFaGW5BRBV/U1cUh90Qk/YbplfaNVELF2XFnE=;
        b=UqssGQ0xzw01CP6U8lFclzQppgVNJos83FkmeEWimk/Nz+K6LkvdauYpSvpJG1O4Kb
         Bb+np655CNkd4tbmdQ3xzMDoxm389D5y2sZfa/4fZv3Z17xpXIYz+NdPLNSsQkI8+tb9
         pMMUBBWN+3VLgMAkrTWekIc7l8aiPWmRfrGnqkfEMsqNQm3WXpWghpJ/leSmaeEkrq0P
         APfaYRqwQubb4Y5mAN8TgppPvS5a4OQ1fchJXPWIzT6Yg2EhRYrZs1mIh2qGbIjUUECK
         4yvuV2lin3fywnOHNaFAQZ28Ou7bbSmH276Hm+MbnwTse6ePvZ3wNwuVVq7ZiBKJDagv
         UiXA==
X-Forwarded-Encrypted: i=1; AJvYcCUnLNbZ8QaSGgKbhVU1C36GZNvJq6olw+n5p/XQDPVHzkDfHl873l9kZNnu7VGAyM5z0e8XFm6ixu/dqL7v@vger.kernel.org
X-Gm-Message-State: AOJu0YySc5SrN0aLFULDwKUKHBNCYNhDKiaeilWUK1k6H4SLM6wQJShc
	nz5vFeIIyq+b/YxpL/XaiX/HvqezWQlzbHHqgTTcLGoEtUdz/isfqaPJrLw/mLs91y25LPcgdmR
	gAFfPoMrSnkbaEZiQCryJOtmdhOPQpmAycE1bPOr9252y7KfM+gvycD2jcuUApwWe7uXM9AFF
X-Gm-Gg: ASbGnctd3mOuMvtTcM7Av319PKHR1PLwaOK4XX+ruwwxaWpNdvzIgEY6/dymGe0v5D2
	r9W6pGD8EfPFn1ujVc9F0yGRfnomA+TKult0Ux1kRKh0at+0FMPmUIh3BM7A22PpzaY+jB7Lo1T
	HHuXUZhUtAhKYdyiHluPhH8vbs6TxzXA3F/tO4JEfHZcMu2T5P2YPArI5awS2ldMmxLACsdIH51
	sO325p3cYq5U+x7AhxkcuRvkvJgSn3g9V/b8x36a8UDFjPB+rOsOLm4exv5pxLZcTGjwfv54Siv
	Wj+HW+CfRlGjuxKFJckrV6zcTMDX+vp4LUwqB3ctLGZliQH4H7Lt13byon+o2qOShSuh9KmTJWs
	=
X-Received: by 2002:ad4:5c85:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f542a80ba6mr18417196d6.33.1746577676281;
        Tue, 06 May 2025 17:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFRVO19PQwPJMjT3C2BBmJBEkobHD6Z2BgCRcVhb87kuizrxRlLuQ6jxGhdOD5AD8XTBthGg==
X-Received: by 2002:ad4:5c85:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f542a80ba6mr18416866d6.33.1746577675901;
        Tue, 06 May 2025 17:27:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202930cc7fsm20654241fa.61.2025.05.06.17.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:27:54 -0700 (PDT)
Date: Wed, 7 May 2025 03:27:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, neil.armstrong@linaro.org,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
Message-ID: <32ktmnjhrfrvpi5glipex7qfrcxa5hyl26em3f6xos5l3n2zl4@b7rmzx6wpsj2>
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
 <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
 <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
 <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
 <4lmt5cgg2tanrughooxw73h2brwyyc6ifqgo3ju6iz4enkvkic@umeijjk4ijxg>
 <651f1421-b471-485a-aea0-1b1ef92f8331@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <651f1421-b471-485a-aea0-1b1ef92f8331@oss.qualcomm.com>
X-Proofpoint-GUID: Eeu3g_LgISpUSwuyiqrtkw6eO6w1GC0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAwMyBTYWx0ZWRfXxNpY5/hp3QDe
 z7Qpi9CPSfuy+1CL5UY5OX5XeRKJkCMQn8JnrlSCz9xRxNJWCb8JB+pxqVxhI0TUDXKfou/bZXU
 tRVQZP7xpRsHDHhejvXRfhcw8qGhWJf7PRXDi79HHzGpRullXT12Q10qSvRiGNvQyQFIV1W5a/D
 PmjXq3SBOkS9TcVh2sUMJWOVwp0iIYsFPXlMpq9Nk8bUzDDb2agUYFmzV5aFecdfEkoJ5+3ypaz
 15DiifXz/TCGsqahIQTO1WqXXpaXae2CEL7+5R6z0LIyPSbmKYjkI589iPz5lH0GF0PQXXc5sUu
 Ka80FRXj20xlBRQvSJMrQrXngYypzBh5AT7Louhtc3O2Qb19MSmKxeLbdh7HtCKuCRLNXVii38M
 ZZZScEcUSrVmglQTythX1DugnAJwy7/FtV94S+kKuWtETi9ZsV6D6H9jLRKnfi88qYUYE70a
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681aa90e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=tN5ki1dz_6qGOFmg9BkA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Eeu3g_LgISpUSwuyiqrtkw6eO6w1GC0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_09,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070003

On Wed, May 07, 2025 at 12:53:27AM +0200, Konrad Dybcio wrote:
> On 5/6/25 10:23 PM, Bjorn Andersson wrote:
> > On Mon, Apr 28, 2025 at 11:14:18PM +0200, Konrad Dybcio wrote:
> >> On 4/28/25 12:48 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 25/04/2025 23:49, Konrad Dybcio wrote:
> >>>>> On 4/24/25 6:32 PM, Neil Armstrong wrote:
> >>>>>> Add DT entries for the sm8650 iris decoder.
> >>>>>>
> >>>>>> Since the firmware is required to be signed, only enable
> >>>>>> on Qualcomm development boards where the firmware is
> >>>>>> available.
> >>>>>>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>> - removed useless firmware-name
> >>>>>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
> >>>>>> ---
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +            iris: video-codec@aa00000 {
> >>>>>> +                    compatible = "qcom,sm8650-iris";
> >>>>>> +                    reg = <0 0x0aa00000 0 0xf0000>;
> >>>>>> +
> >>>>>> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>>>> +
> >>>>>> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> >>>>>> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
> >>>>>> +                                    <&rpmhpd RPMHPD_MXC>,
> >>>>>> +                                    <&rpmhpd RPMHPD_MMCX>;
> >>>>>> +                    power-domain-names = "venus",
> >>>>>> +                                         "vcodec0",
> >>>>>> +                                         "mxc",
> >>>>>> +                                         "mmcx";
> >>>>>> +
> >>>>>> +                    operating-points-v2 = <&iris_opp_table>;
> >>>>>> +
> >>>>>> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> >>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
> >>>>>> +                             <&videocc VIDEO_CC_MVS0_CLK>;
> >>>>>> +                    clock-names = "iface",
> >>>>>> +                                  "core",
> >>>>>> +                                  "vcodec0_core";
> >>>>>> +
> >>>>>> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >>>>>> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> >>>>>> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> >>>>>> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >>>>>> +                    interconnect-names = "cpu-cfg",
> >>>>>> +                                         "video-mem";
> >>>>>> +
> >>>>>> +                    /* FW load region */
> >>>>>
> >>>>> I don't think this comment brings value
> >>>>
> >>>> Right
> >>>>
> >>>>>
> >>>>>> +                    memory-region = <&video_mem>;
> >>>>>> +
> >>>>>> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> >>>>>> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
> >>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> >>>>>> +                    reset-names = "bus",
> >>>>>> +                                  "xo",
> >>>>>> +                                  "core";
> >>>>>> +
> >>>>>> +                    iommus = <&apps_smmu 0x1940 0>,
> >>>>>> +                             <&apps_smmu 0x1947 0>;
> >>>>>
> >>>>> I think you may also need 0x1942 0x0 (please also make the second value / SMR
> >>>>> mask hex)> +
> >>>>
> >>>> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
> >>
> >> I saw it in docs only, maybe Vikash or Dikshita can chime in whether it's
> >> necessary. It would have mask 0x0 if so.
> >>
> >>>>
> >>>>>> +                    dma-coherent;
> >>>>>> +
> >>>>>> +                    /*
> >>>>>> +                     * IRIS firmware is signed by vendors, only
> >>>>>> +                     * enable in boards where the proper signed firmware
> >>>>>> +                     * is available.
> >>>>>> +                     */
> >>>>>
> >>>>> Here's to another angry media article :(
> >>>>>
> >>>>> Please keep Iris enabled.. Vikash reassured me this is not an
> >>>>> issue until the user attempts to use the decoder [1], and reading
> >>>>> the code myself I come to the same conclusion (though I haven't given
> >>>>> it a smoke test - please do that yourself, as you seem to have a better
> >>>>> set up with these platforms).
> >>>>>
> >>>>> If the userland is sane, it should throw an error and defer to CPU
> >>>>> decoding.
> >>>>>
> >>>>> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
> >>>>> would prevent .sync_state
> >>>>
> >>>> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)
> >>>
> >>> I'd second him here: if there is no firmware, don't enable the device.
> >>> It's better than the users having cryptic messages in the dmesg,
> >>> trying to understand why the driver errors out.
> >>
> >> I don't agree.. the firmware may appear later at boot (e.g. user installs a
> >> small rootfs and manually pulls in linux-firmware). Plus without the firmware,
> >> we can still power on and off the IP block, particularly achieve sync_state
> >> regardless of it
> >>
> > 
> > Not "available during boot", but rather "available for a particular
> > board".
> 
> I'd argue that if a device is in the hands of users, there already exists
> some acceptable set of fw binaries.. but most developers aren't in the
> position to upload them into l-f.. And quite frankly I'm not the biggest
> fan of having a gigabyte of 99%-the-same files with a dozen lines changed
> and a different signature prepended to them either..
> 
> > We generally avoid enabling device_nodes that depend on vendor-signed
> > firmware until someone has tested the device on such board and specified
> > the proper path to the vendor-specific firmware.
> > 
> > Are you suggesting that we should leave this enabled on all boards for
> > some reason (perhaps to ensure that resources are adequately managed)?
> 
> Yes, for that reason indeed.
> 
> We don't generally need to load firmware to turn something *off*. And
> most IP blocks don't **actually** need to be presented with firmware at
> probe time (I can only think of external ICs like no-storage touch
> controllers that need the fw uploaded on each powerup). 
> 
> Telling the user "hey, this is supported but the firmware file can't
> be loaded on your device" may also be better sounding than "won't work
> on your machine" (with the quiet part being: "because someone hasn't
> copied 5 lines of DTS")

Then we need to make sure _not_ to make a default path useable, so that
the users know that there is no proper firmware rather than facing the
cryptic error of "firmware something -error".

But... I'd rather prefer to keep firmware-backed nodes disabled exactly
for the reason of "making someone copy 5 lines of DTS", which usually
means that somebody has thought about how to get and where to put the
binary.

-- 
With best wishes
Dmitry

