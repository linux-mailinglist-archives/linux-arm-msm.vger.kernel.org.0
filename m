Return-Path: <linux-arm-msm+bounces-64555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF57B01A8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5404E3B8DA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFBF27E06D;
	Fri, 11 Jul 2025 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYDFRzHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C228B4FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752233368; cv=none; b=lbFeb0vSXs1EJENAjnulvMGR6PLM1V3DCGhdPveznwi8w56zcRhAGVbOaacsj1WI2pYZSD1m0TNDDyX2L/ABtfSLfPzL9f/PzinGql8HBJ8wQGZP5Pl/rVDlCgTCGOa71JclI7z+s3/2VL/M797f+YD7uVOOVFF+9o3EbnlPMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752233368; c=relaxed/simple;
	bh=m6roAhcTX7V8zvGuRdCEmtiWFVV8BmY5LaW0DZUleD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezu+VpAEg+1+AylI/zjqbXQy8iQcFzemSpK8EIOYUzXQO6efVU+GGzQSz9k6cu3VGqjoyBpu128dedKqh9vp0J5FPd5s71sFmi2HSvqRk03BykWMPgqaFOFJaAwlMwtsdBheBujRm3vb3W3c1h3y/lF3M0eMwrEh7+rNKyu59vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYDFRzHZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAshj7016347
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5aWZtfTrotjSQzciDUe2VP7mxGgTnkhIuB0Hn3Bzk0=; b=PYDFRzHZTOYUvM3v
	kVjRwV8ngddyYOyhi7S9UmmZHyqGNYikLE5zJq3DG+1tJU13hZKRsSBnmHbVHtCD
	0DSuzs4JL1MRq79DF1LlCM2binigPXZFIsCn8lPvmOMy9uWrnE7BMVsE1SlQeBox
	T8aGdMkInvwLZ8wvQK41VVZXGc/Hoq5FS+2dgVwt9xh98dNNTg2DTmBoXnj9ljQQ
	z0OdrlHO9sMB7sD1cEV+nQHq3NsIhAu7xUSQxGts4ja79Smtpt1QtEx50oIaPbj1
	mwykvSnGa5Sn4vvm+pHxwrOfqMcb9dHrXYPhhI54WgHKPDLlByZHXi2iCDVFCu0O
	BWmEBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u4qcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:29:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dea67756f4so16564085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 04:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752233365; x=1752838165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5aWZtfTrotjSQzciDUe2VP7mxGgTnkhIuB0Hn3Bzk0=;
        b=RiTv+LLqCMXJmgdhrQQM2brZQBaFV1vvT/7o9IQBIaEhnbeopSta4JqoIMf84i0XZq
         IpEnI8JVdLCG7SYN77vu6GFPNpr6/cV6Mlwi5AJN99oIcsTYGu8CO8dOSLGNYoCFwsXH
         vBq2hZBAwl35PkpupudLwb0UQotAInCGRDBpfbiN2T8IDmOryMR3ku8d71fnMINoksgA
         lFZZv329zfZju02JKOnua+uRKXcBy7qdKl88tcU7YMQ88+JzjUbu0/2yOPsVzZ7nS/dT
         Aobm6bDzrya0ANnlrV/LzGPlEPCvul1EzFlZ/zuhKOIzKlA2hXXaGZqaIxcV+QeT6Qqw
         1++Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1BNPaOwdjkOENar72+mK7FPnqD5w02q3OCRNcvr4O3glTuHly2LksFk85iILua56CKVoe855JWGirVyqU@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBauQ+1XnyhhrqwN1qDqrm+9ZxrHVff3dS0LqeB3FTQ1fRtnS
	FlN/Haf9kXMh7QFbqM7ZS5BYZIWG+Ze1zZycKV+zwmHMwHuLIkXTUUHn5rZBmcI3s1IgiK5pw7U
	DNUhmYPC+uv22HaSu9xsBJBYy11w7Pba6czHYDY2KWnrztOuKIoAIwt9XmdmiGEVMU/Gf
X-Gm-Gg: ASbGnctgbeRbKYUOdk/sd17yVku00xA2W0rL8hWaFwvLJWUKxNdpYggvzp2nEOp0ILN
	n0Uh9zt+8owTjIlfTMZJl+VJCPZxGshtqQMda5fnAOK9geSd9q7hMR5n9CDIIC+3TGfWP2nzlNs
	jmSlvOhXiy2yomSirkr7o0UjvHoRDad/bUHfEK/B+JG/T9o1v5++7xP+e9bwp1glHHGTlSrpLfw
	emlxm6+do4KFOpJr/5csBJNEKo6Zcu0DDUOhLxmm+PgjQ6TvvCBdAH+koKZdejKn4zg323xhD57
	1IlhVm1effrphCA4GmVnYh/2845hwXz/xkAbjNOQ1i2WpNjy9ZtgUryyHYqYbfbcanOyfjSWHtZ
	EWy274BDEc8Vtnwr88WQr
X-Received: by 2002:a05:620a:1909:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7de9726f01bmr140369185a.2.1752233364538;
        Fri, 11 Jul 2025 04:29:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYdqE0Om2cu0c0kLyxmfloyWnnavJ47GrA13ApiSIxZgloG/rqSLlcukJAO98TijxJUrBMpw==
X-Received: by 2002:a05:620a:1909:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7de9726f01bmr140367485a.2.1752233364058;
        Fri, 11 Jul 2025 04:29:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264613sm287256966b.91.2025.07.11.04.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 04:29:23 -0700 (PDT)
Message-ID: <6260de79-65b8-4f5f-abf9-54059276d5f6@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 13:29:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <895b931d-15a4-4922-b52f-6c6cf7fc6243@oss.qualcomm.com>
 <8377b6bf-8823-4bcc-aee1-af17db0fbfdf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8377b6bf-8823-4bcc-aee1-af17db0fbfdf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t_KnPfigJq9mtNju59lVYNAvEFSXH8Sn
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=6870f596 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=vnREMb7VAAAA:8 a=KKAkSRfTAAAA:8
 a=O1Gb7EYU182xN6YJ8DMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4MCBTYWx0ZWRfX6/siCOy3/YoZ
 OVqzhzvF9sA3Brwr5pNDNuezBOQePNeKpVfYj1wIG7xoSK2SjzyIr9Beua9AA+oory43JbA0SP+
 gbAIyE9CMcro1iityBugBGXlySO/m1g4FE7mXSJMxdxGV9c7VCut55g4UNqLgvr29j70Fi1cKFS
 eJcZK8lNx1+On8REcRIonmLmqDo5KX7yFaJsbbUBFZzReBjYwOaYd3U/71Rm/K61BnfR+myB7Kq
 RNy91TlCW2YV1tvXuUEeJHkq8XJy4/9tnZmP8nDPDYuDxtIQmv2JFWuVKbyERi25Ym67vBfzazy
 LOCiU2wlJ0l4BXMEoYaii5NLNs57xzBPI5qYPOw5MmunCCXY30OFFb7KxLHe0Z5d45tRA7fKSaV
 UUurQHVdvyoY1VpSyaMzmdzegif/QV/Pa574jAKuAWVVgKIQVry4k6LH6r1GIxjLsyz0yZoh
X-Proofpoint-GUID: t_KnPfigJq9mtNju59lVYNAvEFSXH8Sn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110080

On 7/11/25 11:14 AM, Bryan O'Donoghue wrote:
> On 10/07/2025 18:08, Konrad Dybcio wrote:
>> On 7/10/25 6:16 PM, Bryan O'Donoghue wrote:
>>> Add a new MIPI CSI2 driver in D-PHY mode initially. The entire set of
>>> existing CAMSS CSI PHY init sequences are imported in order to save time
>>> and effort in later patches.
>>>
>>> In-line with other PHY drivers the process node name is omitted from the
>>> compat string while the soc name is included.
>>>
>>> At the moment we follow the assignment of lane positions - the bitmap of
>>> physical input lanes to logical lane numbers as a linear list per the
>>> existing DPHY @lanes data-member.
>>>
>>> This is fine for us in upstream since we also map the lanes contiguously
>>> but, our hardware can support different lane mappings so we should in the
>>> future extend out the DPHY structure to capture the mapping.
>>>
>>> The Qualcomm 3PH class of PHYs can do both D-PHY and C-PHY mode. For now only
>>> D-PHY is supported.
>>>
>>> In porting some of the logic over from camss-csiphy*.c to here its also
>>> possible to rationalise some of the code.
>>>
>>> In particular use of regulator_bulk and clk_bulk as well as dropping the
>>> seemingly useless and unused interrupt handler.
>>>
>>> The PHY sequences and a lot of the logic that goes with them are well proven
>>> in CAMSS and mature so the main thing to watch out for here is how to get
>>> the right sequencing of regulators, clocks and register-writes.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---

[...]

>> +            continue;
>>> +        case CSIPHY_DNP_PARAMS:
>>> +            continue;
>>
>> "do not program"? why are they in the tables then?
> 
> We try to import downstream init sequences, which themselves are sometimes 1:1 from the original Si testbenches unmodified, DNP_PARAMS come from those sequences.

Not sure about camera specifically, but using the testbench sequences
for other kinds of PHYs is supposedly not a good idea, as they are/may
be tuned differently for actual (reference) boards 

> 
> I think the testbench/downstream idea here is to allow a series of delays and/or readback post write.
> 
> I'm certainly willing to drop anything not in the _current_ init sequence list.

If there's a delay necessary, you already added the infra to inject one

[...]

>>> +static void
>>> +phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
>>> +                 struct mipi_csi2phy_stream_cfg *cfg)
>>> +{
>>> +    const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>>> +
>>> +    writel_relaxed(0, csi2phy->base +
>>> +               CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>>> +
>>> +    writel_relaxed(0, csi2phy->base +
>>> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>>
>> Does the former write need to complete before the latter?
> 
> One assumes so. All of this _relaxed() stuff is way too flaithiúlach for me. We tolerate it as legacy code in CAMSS but, you're right, I don't think its logical at all.
> 
> Dropped.

Ordering and completion are not the same, see:
https://www.youtube.com/watch?v=i6DayghhA8Q

[...]

>>> +static inline void phy_qcom_mipi_csi2_add_clock_margin(u64 *rate)
>>> +{
>>> +    *rate *= CAMSS_CLOCK_MARGIN_NUMERATOR;
>>> +    *rate = div_u64(*rate, CAMSS_CLOCK_MARGIN_DENOMINATOR);
>>> +}
>>
>> I can't find downstream doing that
> 
> Inherited from CAMSS where it really does something useful.
> 
> I'm relucant to change this... I'll try it though.

There's no room for guessing, this affects the clock rate of a
component that interfaces a physical bus, please try to get an answer
one way or the other

> 
>>
>> [...]
>>
>>> +    /*
>>> +     * phy_configure_opts_mipi_dphy.lanes starts from zero to
>>> +     * the maximum number of enabled lanes.
>>> +     *
>>> +     * TODO: add support for bitmask of enabled lanes and polarities
>>> +     * of those lanes to the phy_configure_opts_mipi_dphy struct.
>>> +     * For now take the polarities as zero and the position as fixed
>>> +     * this is fine as no current upstream implementation maps otherwise.
>>> +     */
>>
>> Can we at least grab the data and make sure it matches the
>> default hw configuration now, so that we won't break bad
>> DTs in the future?
> 
> Hmm. I'll have a think about that.

We certainly don't want the venus situation all over again..

Konrad

