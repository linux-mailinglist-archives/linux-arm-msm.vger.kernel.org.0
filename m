Return-Path: <linux-arm-msm+bounces-86437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC628CDB021
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35F17302F692
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 00:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E0842A96;
	Wed, 24 Dec 2025 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpN6maSq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaWnfca3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A54D13B7A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766536664; cv=none; b=bSAYEvV2GQDZbx7MXbkmtpcbsFwxFP3kzrL5yGXlLTSA7DN7rBvumNRneGfLEEAk4TwbbX3TLgiUGIDCAuFvGsFo98y6AkwM2SerFb1unxMB7VxtjOG052kszDnaZOsOFNDCEdxmiRilUsLW8/ScteBdlEAA+xvUb5urCL9gJ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766536664; c=relaxed/simple;
	bh=LFem9DMzUIajGKseYlsydaAet96n7f7S2wMBV4XMd1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9dGGErtHeXINYOY75NOmP3885sgPgK97Tlq3NHmwdourZ7XqTYU4ZPMRu8TF4YIAAcYQf1QUsSmx3B0Fw/LHnDaZT5tiw89P/W2fRSZDp3y/+Qzmf7bzdevrIlWxyH9G/5YO2rsPXIM+guxRhgo1YTwASVoQd0PfxRqTENKOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpN6maSq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaWnfca3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNLY2uZ700570
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/YAOKhWKH3N+K9qVaMcFeCT/
	m/bw8c2nGx7bTrdKtjQ=; b=NpN6maSqHBF7RVEmVtfCqYcla8mfWT8tuuhwSGex
	5xH78XHdLEQclnttiOQMthgjVM2u23agcnF7foPWo+YGF8Oi8j0nAH2vQSO53+lv
	5Ma/MndSB8xU9Fg/xKM5T8QIIUdU+kEIAXzVJvqTghra6zePSNUlNUbrBhsxTTyZ
	z59Y9ZO8Jn8taN3CV7yQtilK53YEN1s/yUD4BJ0D27HxY/AnSfoq0M1ccHGuLT3J
	LGKJqfOU2vdH0fUJCXeJF2q85TZ+9LRnHUhtBAN/aw5rMu2grSZPJ9SbnSqHMQl8
	tV9sVvKyELEQnpVoLOBblPsI8Qz9NkNc9s5ZZu2nYIhtaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jt43h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:37:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee21a0d326so30678721cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766536661; x=1767141461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YAOKhWKH3N+K9qVaMcFeCT/m/bw8c2nGx7bTrdKtjQ=;
        b=AaWnfca3vGeBEwWlQGnOWma/awyQniKysnfbtkN8goKe8I74OFWy8CwpVzQrlPMCry
         60EgqCHRDowjkE/xiVUHx7x8B2HlKslM1KcwNvFPfpJh4wCBw96VupDsDlG1r/SXd0V0
         N7ETv/wOnf2z9pHcdSRnj7//pHgT8gVBiyJQtVBfw36URvq98aKjcbHFbMXN6Yz2N91S
         d98CAcaWDUTgmqn56LFU/OA3jWq80IcvIxQg3MVh0y8e/Gjpg/UPuosu53pOiC0+/n1R
         Ji7cCzlzUUL2W+0iLWk6POR8L8jmVvI54zJP45lQHyqMTi3YLBysF+xuTzMkTW2AagPm
         kOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766536661; x=1767141461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YAOKhWKH3N+K9qVaMcFeCT/m/bw8c2nGx7bTrdKtjQ=;
        b=etuFP+NKlYkFPWrfZrZnvMPxvCna+uvcQhNySydq0Vtd0cix7MJnLMQ8+rDdDHMEdR
         RJuxK2bwxB+T87Wu3Jf76spQDiq37omZSE7Yc2Ee6G9K1OFCoFG5UtOIeiWudqXlIpD+
         T/IqhtP09vPglOdLDqB1oP3nv+UARtlMP0bb06yD8Fh3febZ0SEzixfYqfuksjtMNr1f
         D5oluAd4Q8BxL8J5Q3t3KzVYoLtCE9o6ah3fUBcuUSli/Ld2WAWQeLTKbexIQ4b6Rbsx
         ltK343EiWFe7t0dTKsrhOTc791Jno2n4+UW8WcJoVV3TJIjmBHdgO4A2jJvp1Y3m8wf+
         0kyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6h/KWb+z+rYLmSQQXk65u8raCLrF+Vukrp6IWBOITXF1MKMfm3uuNhtsCiE1Cxc051FU3wRX5SCN3DeUt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc6R2fwZjh4GBhSJYaKo2Yigp4+Muq6nMQ1ecGiTS9iqJqGQEd
	g7tbCuVCqpA8tWgfQgFevkM5WDtBrRM0rNdzC9G6fUpReGM3x+SZlQsYMxWSmXIoe6+oKlt5TLC
	vKqQUi87BPFKAVLrMylUK5usZGUaByFz0nRXncB0jPP4dA5NhhV0ZP6aRIRmlxCecQxsx
X-Gm-Gg: AY/fxX7l956N8ZmNTNT1MDmUMz5UWqUj44KZhrF2/9Qi9IUDbnYuaREYKQMOd8b8sYy
	ylsLnKTT+js3GTyN+sBZWUD+UVNxxn0whfUeQiONmu4nBcTqAmcdT4aggrlgoccga1TCuZNIiv/
	nb4OKaz0pnY5HNd2fLvpu3yF+AlHOO/urHaWQ+4OKL3MYSJmJymnRj3egnoJ7Qr8aToQiqltRns
	cngShPxyMdvRROK/9snqptkAoU+heuduNvg7nPvrSXoTsgThbl7fOKXYeJbNK1N8nb6NlxyIG4X
	5tyOrqwDmV393XH7D2pywPYUJOpkIu1WknB27LpE/pe9wCtOb2edl33dW9YDltONZz8z2ylUscG
	ljgxK/v2wImNT1W0Oyt52iYueh6gcbMaG9KZfAzZKqrGoNXR0pWToD+wGVNJleVS6poummP+eNV
	t24wAtJ6qr1jrRCJm+698gQcE=
X-Received: by 2002:a05:622a:418d:b0:4ee:275c:28d7 with SMTP id d75a77b69052e-4f4abdd6345mr233834501cf.75.1766536660499;
        Tue, 23 Dec 2025 16:37:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQYqcQ8RAiUkM6fn5wm/C8SIkuv5CfLdFvlE6k7nnbLNWz1dAHdDImDOJx97hVRvZEtVA3Qw==
X-Received: by 2002:a05:622a:418d:b0:4ee:275c:28d7 with SMTP id d75a77b69052e-4f4abdd6345mr233834171cf.75.1766536660002;
        Tue, 23 Dec 2025 16:37:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861fcccsm4441056e87.85.2025.12.23.16.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 16:37:37 -0800 (PST)
Date: Wed, 24 Dec 2025 02:37:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <vv7o5wuxqcg6jbj3jnzrsk6fmsdmshvq63syutxd3jfxgdkjsv@tunwxas2ebc5>
References: <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
 <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
 <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com>
 <CAO9ioeXqP5i9hEa-DfrEvK3U-3py9KjdMmWnjzZ9kGd4BPqdYw@mail.gmail.com>
 <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
 <CAO9ioeXKBD0ab2+FmNnFQozKq_cp+hFwc5B6LtgfEC2FLULUYQ@mail.gmail.com>
 <b01eedc2-24b6-43fd-b729-85eded2d6b34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b01eedc2-24b6-43fd-b729-85eded2d6b34@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwMyBTYWx0ZWRfX/WiF2A+d6y4v
 UPiCWOMbGQLxvzHFZbHkJBUmyr4ZRj0cXMMlo2wf/MTjW6tz31SJ4CCCuc9xIw5WoFK2cvtBkSI
 AJehPz8d98ToCws/uTQy1+D9Fx43ut8nXYv2hbxSLfPDOeqdY9c9PnESHWk+S0UUNijbOrJfXPb
 6EQwocGbxDNQ17kLSnB5XCnQjkktuLyYXDjbZuf1lXa/xpAdy9vi+Sh9qYckb3f3oBhwPY5258X
 ubE/ildX8AAEIE/ZAU8oShuGVoTS79llf7nC05VstM0G/ueSiVl8flbbvFJJIXanqdsWzViREa5
 +iidsrc16PsIWpF537Dd8Z1ZHfRlsnx4vyQZ0DdbnYQn57x0CaFVzjTUZUcViyKWcFOMg3L+ehn
 Rh9RxXTvaovV25mowzOL1DrUwttP3TX+9czi/qmdr8K5GcOvhNgKkNw+M74pdiJ4fZanZCBtZy5
 wk/xcndkdLqsaKT8PNw==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b35d5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=uDjLizC7a5IkTmk2YkYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: D254MrYV9pzdYMbLyNK4zGouDhqzwsPj
X-Proofpoint-ORIG-GUID: D254MrYV9pzdYMbLyNK4zGouDhqzwsPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240003

On Mon, Dec 22, 2025 at 11:59:34PM +0530, Akhil P Oommen wrote:
> On 12/22/2025 4:54 PM, Dmitry Baryshkov wrote:
> > On Mon, 22 Dec 2025 at 12:54, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >>
> >> On 12/22/2025 2:45 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 22 Dec 2025 at 09:19, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
> >>>>> On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
> >>>>>> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
> >>>>>>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
> >>>>>>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> [...]
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> +                        gpu_opp_table: opp-table {
> >>>>>>>>>>>>>>>>>> +                                compatible = "operating-points-v2";
> >>>>>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>>>> +                                opp-845000000 {
> >>>>>>>>>>>>>>>>>> +                                        opp-hz = /bits/ 64 <845000000>;
> >>>>>>>>>>>>>>>>>> +                                        required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>>>>>>>>>>>>> +                                        opp-peak-kBps = <7050000>;
> >>>>>>>>>>>>>>>>>> +                                };
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>>>>>>>>>>>>> or mobile parts specifically?
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>>>>>>>>>>>>> here.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>>>>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>>>>>>>>>>>>> except the 290Mhz corner. We can remove that one.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>>>>>>>>>>>>> speedbins from the mobile variant until that is supported.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
> >>>>>>>>>>>>>> non-mobile platforms.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> We cannot assume that.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
> >>>>>>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >>>>>>>>>>>>> wise to use the configuration that is commercialized, especially when it
> >>>>>>>>>>>>> is power related.
> >>>>>>>>>>>>
> >>>>>>>>>>>> How does it affect the speed bins? I'd really prefer if we:
> >>>>>>>>>>>> - describe OPP tables and speed bins here
> >>>>>>>>>>>> - remove speed bins cell for the Auto / IoT boards
> >>>>>>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
> >>>>>>>>>>>>   declared in the GPU.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> The frequency plan is different between mobile and IoT. Are you
> >>>>>>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
> >>>>>>>>>>
> >>>>>>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> >>>>>>>>>> has speed bins. How comes we don't have bins for the IoT variant?
> >>>>>>>>>>
> >>>>>>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> >>>>>>>>>> Auto bins:   0, 177,      156, 136, 105, 73
> >>>>>>>>>>
> >>>>>>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> >>>>>>>>>> starting from bit 21).
> >>>>>>>>>>
> >>>>>>>>>> Mobile freqs:
> >>>>>>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>>>> 156:             745M, 700M,       550M,       435M,       290M
> >>>>>>>>>> 136:                         650M, 550M,       435M,       290M
> >>>>>>>>>> 105:                                     500M, 435M,       290M
> >>>>>>>>>> 73:                                                  350M, 290M
> >>>>>>>>>>
> >>>>>>>>>> Auto freqs:
> >>>>>>>>>> 0:         845M, 745M, 650M, 500M, 435M
> >>>>>>>>>> 177:       845M, 745M, 650M, 500M, 435M
> >>>>>>>>>> 156:             745M, 650M, 500M, 435M
> >>>>>>>>>> 136:                   650M, 500M, 435M
> >>>>>>>>>> 105:                         500M, 435M
> >>>>>>>>>> 73:                                      350M
> >>>>>>>>>>
> >>>>>>>>>> 290M was a part of the freq table, but later it was removed as "not
> >>>>>>>>>> required", so probably it can be brought back, but I'm not sure how to
> >>>>>>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> >>>>>>>>>>
> >>>>>>>>>> I'm a bit persistent here because I really want to avoid the situation
> >>>>>>>>>> where we define a bin-less OPP table and later we face binned QCS615
> >>>>>>>>>> chips (which is possible since both SM and SA were binned).
> >>>>>>>>>
> >>>>>>>>> Why is that a problem as long as KMD can handle it without breaking
> >>>>>>>>> backward compatibility?
> >>>>>>>>
> >>>>>>>> I replied too soon. I see your point. Can't we keep separate OPP tables
> >>>>>>>> when that happen? That is neat-er than complicating the driver, isn't it?
> >>>>>>>
> >>>>>>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
> >>>>>>> as a max freq without speed bins. Later some of the chips shipped in
> >>>>>>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
> >>>>>>> MHz. The users end up overclocking those chips, because the DTB doesn't
> >>>>>>> make any difference.
> >>>>>>
> >>>>>> That is unlikely, because the characterization and other similiar
> >>>>>> activities are completed and finalized before ramp up at foundries.
> >>>>>> Nobody likes to RMA tons of chipsets.
> >>>>>>
> >>>>>> Anyway, this hypothetical scenarios is a problem even when we use the
> >>>>>> hard fuse.
> >>>>>
> >>>>> So, are you promising that while there were several characterization
> >>>>> bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
> >>>>> to the max freq?
> >>>>
> >>>> I have cross checked with our Product team. I can confirm that for both
> >>>> internal and external SKUs of Talos IoT currently, there is only a
> >>>> single bin for GPU with Fmax 845Mhz.
> >>>
> >>> Okay. Thanks for the confirmation.
> >>>
> >>> What happens when somebody starts working on a phone using SM6150 SoC
> >>> (e.g. Xiaomi Redmi Note 7 Pro)?
> >>
> >> Update it in a way without disturbing the qcs615-ride.dtb? It is safe if
> >> we add speedbin for Mobile in future, because KMD can correctly handle both.
> > 
> > Corresponding entry in a6xx_catalog.c will receive speed bin
> > information. Will that break compatibility with the existing
> > qcs615-ride.dtb?
> > 
> 
> It won't. KMD will select a bin in OPP table only when a speedbin nvmem
> cell is present. If the nvmem cell is not present, it will ignore the
> speedbin table in the catalog.

I'm not extremely happy (and I'd prefer if we have added GPU bins in
this patchset), but  technically you are correct and it can be done
separately, when somebody will work on those phones.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> -Akhil
> 
> >>
> >>> Likewise, If I understand correctly, QCS615 RIDE aka ADP Air uses an
> >>> auto SKU rather than the IoT one (please correct me if I'm wrong
> >>> here).
> >>>
> >>
> >> AFAIK, IoT variant is QCS615 and Auto variants uses SA6155P chipset.
> >> Both chipsets are functionally same except some fuses.
> > 
> > Ah, ok. I wasn't sure if we are using QCS615 or SA6155P in the Ride devices.
> > 
> 

-- 
With best wishes
Dmitry

