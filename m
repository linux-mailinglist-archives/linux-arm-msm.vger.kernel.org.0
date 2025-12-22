Return-Path: <linux-arm-msm+bounces-86225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5E7CD5CD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1AAD30094BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D58F316189;
	Mon, 22 Dec 2025 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ezri3mmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifLZE+xT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DED6315D4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766402712; cv=none; b=Rm7dOrrYK2NjGuCMXuap586V7RzAf8cJHs9aAqEKHUMM6vvXo2Zlk21rTV7mOHIpr925LBMlQFwoCi5LXfKxAPJdIaM5gEObdnL8hfqu717zqHhvYJv+cdd49B7fWMH6t/c+I01WLUalUAegq+Nrtu6Dhr0WJJHnlHFA2QZNfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766402712; c=relaxed/simple;
	bh=rgyfGU+boKc3cEu9j3sLPq9GR+NSumkblLqbf7IbKOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gu760KHiM+15E0gfrhpAq8EGugjP4HDYqa7UQXaejuxF4V9VVkMFnP3AkIY0LremdUp2IRNlPbZ/SQtwh1voHGYEgPdMFa1Xc7zhfFNaryJfVqrbAR3Y5801OVzCI4/ZYkPEpzfEP+4FwW5BWHgrJ6fdQ4g+7wzlyuBOjfZl114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ezri3mmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifLZE+xT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM81WpY3812452
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iWSRj4xOS49AfDZxODi+vOvE
	+0IKhcDdBzG5hEFHaBY=; b=Ezri3mmKJBBTikVVZUXDNDVNoTcfcDB+hq3cgIid
	HS+YNZZyXD6sD2OG+HzFSaU8QntiGlf/BXdJo0q9lzs59kal60FoEpSK11S+DbAq
	sEvJ5e0udyJeFFiWQYo2uy88G/FlYOa7e4uCZkXUldDlD9JNdAnl2Ie/1Vj8e8gE
	NbVVeBiise5pzJJEcu2L+e5kxVM/jjetJHa0HIn/G7JY4Ij71hVYsGFTLnJx6XLL
	G/FkpaCwesGiB5FiDTyewuNQKwg8qtvrWaEHhBlfC6g1oWMhq4Enl6Ucj9HRhBkr
	tnZHlRki9LzMAy0dIDIDKGccRD2UCeYOz7nupbhnhACN6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtctuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:25:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c387d3eb6so3675508a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766402709; x=1767007509; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iWSRj4xOS49AfDZxODi+vOvE+0IKhcDdBzG5hEFHaBY=;
        b=ifLZE+xTEu7tebRKh8UZZWQlNwFZfznrtpcxM0Dd7nyEJnu8xT2ZLAbzfmdXYu3jtq
         n0mkMTHY5ZV9a7fTcH3/i7MAR0L4deHfjInm6it3mCZd2j3BkTnm5iG8JJTqr3VNcrl5
         R6HWZrGWEO2Mt8hE96f/BV0ORK+Ada6DlAInOcOUmZ8KGgRLFo4lbKRVdskkml2XVHO1
         Dizu2xKI7cgV4SfTd6Xo7uB21MloPSkL1W3QJJp2a3MOc304VgvXIDr0hBMZcDEXUnDB
         N7ZQ2rObPbgwAZJt2PtQI1y0jlHWlFyi5B6K/ZKG4CsQQRN7FDbtVtIo+spy8dViHiJ/
         MpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766402709; x=1767007509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWSRj4xOS49AfDZxODi+vOvE+0IKhcDdBzG5hEFHaBY=;
        b=LHGOmLifrxPNcfOiqSaklRXqAqoQ9eMdiqnBjgsnD1/CERN/yy3gplgxrfC1cKQfZC
         WBxB2fAfevWCEma0mjG16ckFL0QBYNcYAQmOzS15nVgxZbzvapIcTMtx/Kth2xI1f2Uw
         /K5MykNQJ+0kYGnbafCnyWcQY3KwN++Z43kOrFOhdheTUfwbSr+YT8sIGj9yAM7nIYdH
         NzYll1CRlwhhkIiVpI2SxPbohk+7GUpAYQrgMzxXR18egYrTCwHGjLGkHoZQ45nHHQKe
         wy99Q8sDCtMSbtK0afi8MtqQb7PQ+kcH1DdGmkK6nt7QfJdlEnLNEof7z1HHGnlcNtty
         9m5g==
X-Forwarded-Encrypted: i=1; AJvYcCWhQlnTgT+O+y9GQIMmZD/uNjW0WopYb44EZJ6kI15LgijGaEdfm/jzCXn5/YHwlZf2DYGNjJfVAzL4joQt@vger.kernel.org
X-Gm-Message-State: AOJu0YwnxBHM4FXzsUuMX24OusIdzNSPj2ZEhKfLWLKjps09dzstgv0h
	YFfxcZ7w3Q7q80JkHfDdq7bZU0vMVKV8a6f3kJllJxvNp/8TdVugrgympVAAOp2WjFpIyiwiJrq
	5sPA25HRzsFP9x9IGQYLwYrtHMZSZWOBWzetSrF9+P6qtHbbwIKfqw8wM2K6dZbPQsg3R8LaX5m
	HGCz/SnI8nxlo2puRkre7ahzctkRdvbDrZ/bDoWzYbQIU=
X-Gm-Gg: AY/fxX77831aCaLjPi1L66/u1Rn4rf/tWJLDsKlTU1BZMbcpFlyiVsmGkzIsnL3nCUD
	Zt3FgnXjy5CycTuA5AAaa0zUXptemuY2kVqLyhKTWNi1vVuF2YzSqlV4Z3OetrW6mgptlIwFFmT
	JIeUuIpog9xwWEGgKCVBjsIBX/9hN1F9qQqy7q80OVi+U3kLKcr0BbwVFACdNzLheLfZJyVmHjl
	VDIf2Jf
X-Received: by 2002:a17:90b:518d:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-34e9211c415mr9308380a91.3.1766402708753;
        Mon, 22 Dec 2025 03:25:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsO3P8/fIABQLjFUaFbFIEXwXeI5uHECCvLk+jSZOEvOad7uBLFI6CLnKRV99lGtCoKhzbAX4dppxVLXsj0No=
X-Received: by 2002:a17:90b:518d:b0:343:7714:4caa with SMTP id
 98e67ed59e1d1-34e9211c415mr9308339a91.3.1766402708147; Mon, 22 Dec 2025
 03:25:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com> <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com> <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com> <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com> <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
 <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com> <CAO9ioeXqP5i9hEa-DfrEvK3U-3py9KjdMmWnjzZ9kGd4BPqdYw@mail.gmail.com>
 <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
In-Reply-To: <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 13:24:56 +0200
X-Gm-Features: AQt7F2rZBUJOlPi2G-8HRC0BwIzXNKNG1B-P46eRIcqwHEIvts_GZw9UM3EW5ys
Message-ID: <CAO9ioeXKBD0ab2+FmNnFQozKq_cp+hFwc5B6LtgfEC2FLULUYQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
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
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: xbhF1TxuDfNvAOZuiCuouXNzcSnz73g4
X-Proofpoint-GUID: xbhF1TxuDfNvAOZuiCuouXNzcSnz73g4
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=69492a95 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=TCJ3qRJy67llW4gWdqQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwMyBTYWx0ZWRfXwvgljXQgLL5j
 VJTaDHbBSaQ8X0VJoCF31h0u3RT2eAHi+IwEfBq2Nyf/rGFoL04uodZxdP3w5NTw5y0krlKLKmD
 PvjsbDY+sR7pFNAlCytGaAS+2BU7Ef0xeKrPc376TFvqTU5YgAdekj3sWbokOdmk7agErslgmZ/
 AsZY5eL8nM0hzI6MKfQI1N9VT0a7hjnYpk5nAVneWo++9xgLXIXwRG91pmcadrpqflYvFc/jpwc
 zfT3s5WCWciNdqInN6R+2wJhwWKnwBrxHdj8jbWL4W91FAA6pk8P5QWuvip4kGVql0wGn5ER8SZ
 JgPOoQCTqd3krFjc2W1vD7oDRnibh+WC/ppWF/5QaPGty/TDNY9tFvAQmv1MuYSVJufGXihOJq8
 /em87xQB07NipHFFER57J0sUt4PUWuNzE6kMPpkUmjQys7nIT4K59fzBxD18kfU4rDHhUrTgPui
 Uxa7HDGIUGQVm/jKj8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220103

On Mon, 22 Dec 2025 at 12:54, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>
> On 12/22/2025 2:45 PM, Dmitry Baryshkov wrote:
> > On Mon, 22 Dec 2025 at 09:19, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >>
> >> On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
> >>>> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
> >>>>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
> >>>>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> >>>>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> [...]
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> +                        gpu_opp_table: opp-table {
> >>>>>>>>>>>>>>>> +                                compatible = "operating-points-v2";
> >>>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>> +                                opp-845000000 {
> >>>>>>>>>>>>>>>> +                                        opp-hz = /bits/ 64 <845000000>;
> >>>>>>>>>>>>>>>> +                                        required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>>>>>>>>>>> +                                        opp-peak-kBps = <7050000>;
> >>>>>>>>>>>>>>>> +                                };
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>>>>>>>>>>> or mobile parts specifically?
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>>>>>>>>>>> here.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>>>>>>>>>>> except the 290Mhz corner. We can remove that one.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>>>>>>>>>>> speedbins from the mobile variant until that is supported.
> >>>>>>>>>>>>
> >>>>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
> >>>>>>>>>>>> non-mobile platforms.
> >>>>>>>>>>>
> >>>>>>>>>>> We cannot assume that.
> >>>>>>>>>>>
> >>>>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
> >>>>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >>>>>>>>>>> wise to use the configuration that is commercialized, especially when it
> >>>>>>>>>>> is power related.
> >>>>>>>>>>
> >>>>>>>>>> How does it affect the speed bins? I'd really prefer if we:
> >>>>>>>>>> - describe OPP tables and speed bins here
> >>>>>>>>>> - remove speed bins cell for the Auto / IoT boards
> >>>>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
> >>>>>>>>>>   declared in the GPU.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> The frequency plan is different between mobile and IoT. Are you
> >>>>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
> >>>>>>>>
> >>>>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> >>>>>>>> has speed bins. How comes we don't have bins for the IoT variant?
> >>>>>>>>
> >>>>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> >>>>>>>> Auto bins:   0, 177,      156, 136, 105, 73
> >>>>>>>>
> >>>>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> >>>>>>>> starting from bit 21).
> >>>>>>>>
> >>>>>>>> Mobile freqs:
> >>>>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>> 156:             745M, 700M,       550M,       435M,       290M
> >>>>>>>> 136:                         650M, 550M,       435M,       290M
> >>>>>>>> 105:                                     500M, 435M,       290M
> >>>>>>>> 73:                                                  350M, 290M
> >>>>>>>>
> >>>>>>>> Auto freqs:
> >>>>>>>> 0:         845M, 745M, 650M, 500M, 435M
> >>>>>>>> 177:       845M, 745M, 650M, 500M, 435M
> >>>>>>>> 156:             745M, 650M, 500M, 435M
> >>>>>>>> 136:                   650M, 500M, 435M
> >>>>>>>> 105:                         500M, 435M
> >>>>>>>> 73:                                      350M
> >>>>>>>>
> >>>>>>>> 290M was a part of the freq table, but later it was removed as "not
> >>>>>>>> required", so probably it can be brought back, but I'm not sure how to
> >>>>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> >>>>>>>>
> >>>>>>>> I'm a bit persistent here because I really want to avoid the situation
> >>>>>>>> where we define a bin-less OPP table and later we face binned QCS615
> >>>>>>>> chips (which is possible since both SM and SA were binned).
> >>>>>>>
> >>>>>>> Why is that a problem as long as KMD can handle it without breaking
> >>>>>>> backward compatibility?
> >>>>>>
> >>>>>> I replied too soon. I see your point. Can't we keep separate OPP tables
> >>>>>> when that happen? That is neat-er than complicating the driver, isn't it?
> >>>>>
> >>>>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
> >>>>> as a max freq without speed bins. Later some of the chips shipped in
> >>>>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
> >>>>> MHz. The users end up overclocking those chips, because the DTB doesn't
> >>>>> make any difference.
> >>>>
> >>>> That is unlikely, because the characterization and other similiar
> >>>> activities are completed and finalized before ramp up at foundries.
> >>>> Nobody likes to RMA tons of chipsets.
> >>>>
> >>>> Anyway, this hypothetical scenarios is a problem even when we use the
> >>>> hard fuse.
> >>>
> >>> So, are you promising that while there were several characterization
> >>> bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
> >>> to the max freq?
> >>
> >> I have cross checked with our Product team. I can confirm that for both
> >> internal and external SKUs of Talos IoT currently, there is only a
> >> single bin for GPU with Fmax 845Mhz.
> >
> > Okay. Thanks for the confirmation.
> >
> > What happens when somebody starts working on a phone using SM6150 SoC
> > (e.g. Xiaomi Redmi Note 7 Pro)?
>
> Update it in a way without disturbing the qcs615-ride.dtb? It is safe if
> we add speedbin for Mobile in future, because KMD can correctly handle both.

Corresponding entry in a6xx_catalog.c will receive speed bin
information. Will that break compatibility with the existing
qcs615-ride.dtb?

>
> > Likewise, If I understand correctly, QCS615 RIDE aka ADP Air uses an
> > auto SKU rather than the IoT one (please correct me if I'm wrong
> > here).
> >
>
> AFAIK, IoT variant is QCS615 and Auto variants uses SA6155P chipset.
> Both chipsets are functionally same except some fuses.

Ah, ok. I wasn't sure if we are using QCS615 or SA6155P in the Ride devices.

-- 
With best wishes
Dmitry

