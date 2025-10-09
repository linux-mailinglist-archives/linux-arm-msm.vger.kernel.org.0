Return-Path: <linux-arm-msm+bounces-76587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2554BC841C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2281A601B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA3F277029;
	Thu,  9 Oct 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTAlmZbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5003C34BA47
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001577; cv=none; b=Bcc0C3oa8U8RHwt+ZYCFGUJXFzD4biJIN/sE1J7/8x9E5kLLsGxxYZbYPyllPH5aPybv9roPex6tlQnBY5twZiSk7jQ0v0yPSWs+bf0X07OldzcnPaj8Mb62BwerTLxSW2d6jWLeBUGqDEic12biAn9MPpgxAkHk36RpXkWWLDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001577; c=relaxed/simple;
	bh=rL2huFCoecuT5szCUTmVqW1ZGomFSlEpfa9WmNVvulI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gvhig2ACcRB648LEWemCYqud453I1d3+v2rkzBDKkVP4j5tPqeYRy+Bl3WHVcbJBW0xCC/9ZuOfe3Ljs0Ahr1OM+ShFxBwO6xjR0mkTUon4cCtE3L/NrHNwVHdjSo3DpBBXHVB7JZpGQcCyGdgyUcp+yY+0hMusPQ28u81DVjYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTAlmZbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998V7U5032072
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3s2fVbPRluI7eDHiaLG3gvuhMixD8+CyT+KTHVqigFY=; b=pTAlmZbQptxQFEKv
	8jRisGHCORuqRmA9o2/5JouEE+y8ybJ9itpSvdmP0hmhqGTJ3BUrT1iWKbXsxzIJ
	hJSRjIumHn6lK0+X1FZRRT1ipls/dnj13KJkpB9oKEHMzRD3fNopCTGbXbQTkXeZ
	5PayGovQS1QYVvR2HPV1ePEVwhpRh/Q3cwwMu6ZUONAUVg2QRahH0XR7p7EtxXrF
	LXI7/wAayVO900/G/VK7QT/sJoVILIIf6tDy8o8xe+iU3HxIOZFO5YG92tUVYziG
	dVjEdGn3oz9yV3IwyfO8/xmxFf13yOyk7pmnnwIMsQy/pprlzLoTwuIvmnbhkToc
	evvTgg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0r4r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:19:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7f5798303b3so2752396d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001574; x=1760606374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3s2fVbPRluI7eDHiaLG3gvuhMixD8+CyT+KTHVqigFY=;
        b=ZUG4QeCrtU1cJmvOWYxGPw8n7/NqV8nEs/dNHwGAOAfGJWB+u08qgKJGfwWIweKvUy
         2T7bMpyi94/JF5E28Cl77xhrfLcHyWcxq2uzmTiIBJiQvb+xq/dQoq+oHSOHUCmYYyRq
         0iOeifnqnJM6k8oNKFOt/ZfVbt3w8q3lNGLf/h0jB1gaHO8NkEIMPJIBamjXVpxVAsh6
         hmdce/lpOHDVBI/5hQE5qyyh1YEBjmCA2hE+gNySnav5DdtDpbkG8uBnfTqHvsJF6pyF
         n7X8ROfascTN60dJ6wrsUA9xkVLEbhU1ju+EGIpqkDZnibA2RGOBnirslhmIR+6a7uG5
         32gw==
X-Forwarded-Encrypted: i=1; AJvYcCUpMrsrEyGYubSNYYKCwieiZ+qSy9fRE0Gh1Iikx/FdKlsS/0CLlO9g5el8hcRGcHotQNh1uYWJHoWoe194@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi2CHylypbPbcdmDOBX4jvLgw2jinJMIPAYGL0YqDNSTkosAzC
	u2Iral45gzKMIqWJR8hhHy7Ofy87KBMWmO/LaIoXgEC/v3/CeIcTh0eda5MLEhxC2CGmqdwd8QM
	pHc/dawfXopRx0mBogoilp6T6EsGls+IpWYMb3r67S6AY2v4sRrMnmFdp/eicIME0jOQX
X-Gm-Gg: ASbGncujisr/k1rhE9qFverS2zLINNW6qmOSf9fODlZ9StOBZs+gdHYc42a2UX0q36V
	zLsemWSKOzyMsw1RkpU2dYcDB1bhbNJJyHSk92E781YlX1JMfkWF/pEYkUJV6u14o8nVuo7zYe4
	RIGdLx+MRSfnBNtbD+jQCMhZX896sv5rOgvlkqCMpNkbBPWnZ3ORy3igTl2UhFFxqVRIQ+8j+fi
	aQzFvL0gBZi15SRGwTN11FT6u33tJXh1eufPTP3CYufHFHK+EnQMcFZpKEe894ZlNfJVGfgeHRt
	R4bHAI4XcFwe6Wrw0bruG0rRBMB53RUGGr2XsJorNqDA1BOy2MeXUVDLpxO12w52cO5gqAXVB/b
	wcW5ejgo479vAmoi+XnH8S5cC1PQ=
X-Received: by 2002:a05:6214:20ca:b0:78d:8226:756b with SMTP id 6a1803df08f44-87b2ef6cfbamr57118296d6.5.1760001574285;
        Thu, 09 Oct 2025 02:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2A1qU6LGjzQ74Et+6jXPQ4yzYwrsyoGAKooxWn5Jtt1h+1kAwu/8fhUl8mDlFd2X7Bmfg6Q==
X-Received: by 2002:a05:6214:20ca:b0:78d:8226:756b with SMTP id 6a1803df08f44-87b2ef6cfbamr57118096d6.5.1760001573829;
        Thu, 09 Oct 2025 02:19:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4106c60sm1931662a12.43.2025.10.09.02.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:19:33 -0700 (PDT)
Message-ID: <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:19:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: iris: enable support for SC7280 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
 <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
 <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e77e27 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=LpQP-O61AAAA:8 a=4qWUmPOJchojXs7f-_4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: BpQPAW3rqDPhVVE-XFUVrRu3DUrXBQZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX2SDqrQ6SI0zK
 k52Xc3Rq/E/aJWcVZOA1Y73PjsoXF4q8F5TiP6YUXBiWqud99UJM3yhCxben0uX7fz69TvKoUyD
 a5GgBsWb9yTcJ27WMBVGYdmrdB4EQjxkQhjrBdwSBGrk0AcrGhQ8hjK8+dvzG8gK4UzR2mbhDLH
 qfOz2kP3LwV+QI31imkTyTM1a2sDAtTVxIAwopo1LdZj4UQ7jKaUGELtZjRtUxPPfGRHHSI9EaP
 QOB2LICxK+heqtJV9gjWozjG+mrDQ9YOQ+FnaVzFBqmD0ryd6l8QEhSh8c1nkPrRvT2VuhiWdyg
 Ig3AWhoPNhU9cfik4hEh20OPY0ImGhN+tCzpzckA7/7GN6ryTuSF0TbR9og6838k8o/m5XeGlUE
 86PU0w5s1AG/FOA+39ng8rdKXJRRyw==
X-Proofpoint-ORIG-GUID: BpQPAW3rqDPhVVE-XFUVrRu3DUrXBQZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047

On 10/8/25 9:25 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 10:26:02AM +0200, Konrad Dybcio wrote:
>> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
>>> As a part of migrating code from the old Venus driver to the new Iris
>>> one, add support for the SC7280 platform. It is very similar to SM8250,
>>> but it (currently) uses no reset controls (there is an optional
>>> GCC-generated reset, it will be added later) and no AON registers
>>> region. The Venus driver names this platform "IRIS2_1", so the ops in
>>
>> Which we've learnt in the past is "IRIS2, 1-pipe"
> 
> Well, I'm open for better suggestions. iris_vpu2_no_aon_ops?

[...]

>>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>>> +
>>> +disable_power:
>>> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>>
>> ..for this line
> 
> Not only. You missed the absense of AON_WRAPPER_MVP_NOC_LPI_CONTROL /
> AON_WRAPPER_MVP_NOC_LPI_STATUS. Which in theory can become a flag in
> iris_platform_data.
> 
>>
>> but this could be added to that one instead, since both clk APIs and the
>> Iris wrappers around it are happy to consume a null pointer (funnily
>> enough this one returns !void and is never checked)
>>
>> similar story for other func additions
> 
> In fact, initially I had them merged, but then I couldn't find an
> elegant way to handle AON regs. I can squash them back, if that's the
> consensus. Any idea regarding AON regs?

Digging in techpack/video, I found:

commit c543f70aca8d40c593b8ad342d42e913a422c552
Author: Priyanka Gujjula <pgujjula@codeaurora.org>
Date:   Fri Feb 14 13:38:31 2020 +0530

    msm: vidc: Skip AON register programming for lagoon
    
    AON register programming is used to set NOC to low
    power mode during IRIS2 power off sequence. However
    AON register memory map is not applicable and hence
    skipping AON register programming for lagoon.
    
    Change-Id: Ib63248d118ed9fecfa5fa87925e8f69625dc1ba8
    Signed-off-by: Priyanka Gujjula <pgujjula@codeaurora.org>


lagoon being a downstream codename of the aforementioned sm6350

Meaning yeah it's bus topology.. so I think an if-statement within
a common flow would be what we want here..

perhaps

if (core->iris_platform_data->num_vpp_pipe == 1)

just like venus and downstream do for the most part, and kick the
can down the road.. In an unlikely event someone decides to implement
IRIS2_1 on a brand new SoC, we can delay our worries..

Konrad

