Return-Path: <linux-arm-msm+bounces-86219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3589CD5ADC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB4EE303B1B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F363101CD;
	Mon, 22 Dec 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/n9arVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHRSu1Mu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4122F99BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766400862; cv=none; b=hxxN3HhU9o/QC5uqlC732h8GftJupTaLMK7Qm26TdP15X5V+keO6vv1Ni7ampBrhnrzE+qvppSxOuuUMiZTVmAcQS1Od39/UWjTtU7g6iJmYEiSO2H/BZxLk1w2WAqjXUxwkb9a/rBbDF2BdB1TPtSnXOWFj/yY9xGbZBvJIG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766400862; c=relaxed/simple;
	bh=1hDuZgdVBqreOrKl9O4C6UVllKfHX1m+unn6qIO4wio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RondCoZKLmesq6F7nHkoKlGGe3CFovJW9wPB1A9H6L0Ssu/1EtsK2IIm6r0KkDxuNK44tgknEnVKAbMqofuvXjE7buxPvlD1LX3Yc2kkraMEyEFRb8qO/8jYej+k9E/PrAnhj65I672Rli0YSqvktlWpKUe2ZFku+X2ZYEoxlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/n9arVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHRSu1Mu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM80Pf24078528
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oDBq01ItBfRz1fOmwevVtXKcGRL7jxl0147BnFB8NM=; b=c/n9arVvZL2a4B24
	a3vsUz8m+atRAmJekBSXMtfed65z9R9VkGZ6AKnEuvkei4lE4Qk+PM234hySFuJP
	SYhjDwV/NsTWV1Kgnbb6iiVQWJ+7paBriDU90rGKWAaOmDQkvL+Vq0oCuqji5Kiw
	u0Zy9b89rmFs/cC32AbjIX7yMNVaVd9CUtFXayXyP4N0+vVepAe2m0qqmDAnhjkt
	ZfNY5KDkx4wDEYb7CO+TMvpyUWgzG9eU8nmNwFvVwx3m6yKNgQ7DRDQBrDh/oACd
	LViLDkWZ+jzBrryOkp1lFQCHKah1KhPngzzkW4a2O81tRKx4/d93PAgVH05V8daq
	zRGhcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4r75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:54:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29da1ea0b97so107015535ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766400858; x=1767005658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8oDBq01ItBfRz1fOmwevVtXKcGRL7jxl0147BnFB8NM=;
        b=DHRSu1MuHdQg//L23xXP3+hRwV/jRhuY5VX86a5FkUIkNeGxHZ0sq3YI2CDeOGSVHb
         PIMmbUE7SLVUNUcoSZgTpwGZQHrWGXChhI2sEQvO4v2wllQU3doq4dWKlukAn4pxZalD
         6Ev0yUfnH+GSktfevWkLUkRw/FIxpGGpO1BU4r8sIgEOKXSZj/K5yXfEAiuRIDVY8LaX
         FKVt5LDkaIo0Nxf1g25mWfRJyYHRpgEMGXY+zNRDuim2aS9t5cFduVcnsyp1XI0+iZSp
         aP+u8tX/v/YSxHHnUtdGoGo7pOPhtIBKSLvIho3L28WHzgp6vVOkbF28pUoIgXm4DcNg
         ywiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766400858; x=1767005658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oDBq01ItBfRz1fOmwevVtXKcGRL7jxl0147BnFB8NM=;
        b=rE+iPyoZ0Hy5eu5UbuctTwnxO4OdKl7lxLrqqjLSilj3dBBUr12qNz2s/kN7JMQBwG
         7JSP5MuceyVXxXP40RGLwa0t+VyR4CdbpxUxXgMSb/0U25pv7PL1/JU367gO2/asSGHI
         NwbJeYjc0aJSQcoplYr+aRlUod30upfWf49/9b+m8hKhirojWigIfKEJNeOicWDeF/1n
         z+ndS9WfzjOQFyc5H6+eBj+CvSbcIrsYFCgFeIk2LP6jydefHi/x4T/jSI3qusAAoa7K
         3m1DVEW91DsXH1iGOiSGyU5FcBzG6klJG0WBPzR11I/Kq0E0Uf2eMO1S3NUON+d/edGV
         PwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwT0GVZtRsovElyCL0gXdGTM11hWjjqph+4kLGmExBWA6WvqvMaCw/duhw11zr/daqLM1aNJi/90zCxdlB@vger.kernel.org
X-Gm-Message-State: AOJu0YzgHyCLpfMsiDaC1B+UmPFlO9cffq70A8iUjvfxyXYsvllG+1QL
	XTl2jsaHGN7Ni5aZXpg3KJZcNVbIylb6Zsrikl99HVUpVqEkse8yJav8TduR0McPGGUpb1TrWbs
	2McQ3SEB6CH7XV3no4IijdJwUaT+NNoKhxPoB7+iwdlcGwSXx+WxH3E2joKElYBGOab6NNjrvBG
	K2
X-Gm-Gg: AY/fxX5SAQwIc741rfr4gV4FpW2jM4qMeuFil0UKNu73KL5MAyIHxePbJMZSkYnp2ez
	VRY7gy+M7Cg4116mbGYjshy4/yeiZI3hmXnwaT7xo0FqNE0oafFVxJvVbc8u5w2GK+2xImd0aSF
	ram+QM2RqufcSiDuuvzQXfG+2eymL3ejxOZdZkxuu27P/z++J7eP7k0044ZDp+1gqVNYhU+2Ckg
	tkoBJIeCsHj9ClKh8oUH4vFQmloU980bcjxopiLYb7qFxHJ9vYevUOP4Bo8kLB2hRiCARKJkfJ+
	CwUcr0bEw4nGrs0tNcHB6CaP5hQtrD2rO2tMXp9IsDiutRCZXA2GVVngLomb2bl0SOp6S00FoiL
	7Gyxh3gt7ddmitkkUm9kBxzbQyekXpbSLWA==
X-Received: by 2002:a17:902:e552:b0:2a0:e956:8ae8 with SMTP id d9443c01a7336-2a2f22295a2mr107158315ad.14.1766400857945;
        Mon, 22 Dec 2025 02:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUn3Xk0wDu4VR+EWdpgT246/ycGdxQIchy5C162Zc8Yqmzp/X+NuWxL4hPcZE5ff8S+3+2vw==
X-Received: by 2002:a17:902:e552:b0:2a0:e956:8ae8 with SMTP id d9443c01a7336-2a2f22295a2mr107158065ad.14.1766400857388;
        Mon, 22 Dec 2025 02:54:17 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d88asm92700395ad.48.2025.12.22.02.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:54:16 -0800 (PST)
Message-ID: <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:24:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
References: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
 <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
 <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com>
 <CAO9ioeXqP5i9hEa-DfrEvK3U-3py9KjdMmWnjzZ9kGd4BPqdYw@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXqP5i9hEa-DfrEvK3U-3py9KjdMmWnjzZ9kGd4BPqdYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0MpkuJ2Y42X148RGGx3UWEOJlzmLLC84
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6949235b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=oy5nMm26i85I/VS19bmskg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=FBT9oCwUvZ3Y5G06h04A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0MpkuJ2Y42X148RGGx3UWEOJlzmLLC84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5OCBTYWx0ZWRfX8MTmZpp/UDBW
 ySdFYWqEUx60zpGzpUiGX5vyynpsO5el6qdPt4FcYkw1LYuFnlzbCkNw89Mr8yJkitO2jG1EEsE
 0nNs58o1hybd3KrDm81HlSdApEVqQSguv/Nqz8/3KSUcOgsh/pUarJ+YLRGByfDin9LytmF6Hbv
 VtXhwZhx9SSNb+0EjQwgvHnj/e9DBUfX6G318cpkVR/P/mtGDA698mzGCRVhbErMgnJjbx74y2C
 J1fJpoMenTXIA3ZZH+g9fzYlrBxd6l7vqgmkepIAjSI2iNk6WIY5SE1IkSjJDj51s2D4wXEXhXP
 +PtEJXPh8iC7jRsINVCrZG+Z+5qDUdXJbtkItm2ZbEDaP3tNQIp23LAgld//z3+2kvymd5Q+fiV
 aDcl+5AfNc24zMQCv7qDMTmoIBo497FL4ObRCvFLgkuJoft4CiArVr83ozkU3YBNQvLZKfak0Mv
 jYvro2gVUsXfn8vzQ/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220098

On 12/22/2025 2:45 PM, Dmitry Baryshkov wrote:
> On Mon, 22 Dec 2025 at 09:19, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
>>> On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
>>>> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
>>>>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
>>>>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>>>>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> +                        gpu_opp_table: opp-table {
>>>>>>>>>>>>>>>> +                                compatible = "operating-points-v2";
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +                                opp-845000000 {
>>>>>>>>>>>>>>>> +                                        opp-hz = /bits/ 64 <845000000>;
>>>>>>>>>>>>>>>> +                                        required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>>>>>>>>> +                                        opp-peak-kBps = <7050000>;
>>>>>>>>>>>>>>>> +                                };
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>>>>>>>>> or mobile parts specifically?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>>>>>>>>> here.
>>>>>>>>>>>>>
>>>>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>>>>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>>>>>>>>> speedbins from the mobile variant until that is supported.
>>>>>>>>>>>>
>>>>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>>>>>>>>> non-mobile platforms.
>>>>>>>>>>>
>>>>>>>>>>> We cannot assume that.
>>>>>>>>>>>
>>>>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
>>>>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>>>>>>>>> wise to use the configuration that is commercialized, especially when it
>>>>>>>>>>> is power related.
>>>>>>>>>>
>>>>>>>>>> How does it affect the speed bins? I'd really prefer if we:
>>>>>>>>>> - describe OPP tables and speed bins here
>>>>>>>>>> - remove speed bins cell for the Auto / IoT boards
>>>>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>>>>>>>>   declared in the GPU.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The frequency plan is different between mobile and IoT. Are you
>>>>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
>>>>>>>>
>>>>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
>>>>>>>> has speed bins. How comes we don't have bins for the IoT variant?
>>>>>>>>
>>>>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
>>>>>>>> Auto bins:   0, 177,      156, 136, 105, 73
>>>>>>>>
>>>>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
>>>>>>>> starting from bit 21).
>>>>>>>>
>>>>>>>> Mobile freqs:
>>>>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>> 156:             745M, 700M,       550M,       435M,       290M
>>>>>>>> 136:                         650M, 550M,       435M,       290M
>>>>>>>> 105:                                     500M, 435M,       290M
>>>>>>>> 73:                                                  350M, 290M
>>>>>>>>
>>>>>>>> Auto freqs:
>>>>>>>> 0:         845M, 745M, 650M, 500M, 435M
>>>>>>>> 177:       845M, 745M, 650M, 500M, 435M
>>>>>>>> 156:             745M, 650M, 500M, 435M
>>>>>>>> 136:                   650M, 500M, 435M
>>>>>>>> 105:                         500M, 435M
>>>>>>>> 73:                                      350M
>>>>>>>>
>>>>>>>> 290M was a part of the freq table, but later it was removed as "not
>>>>>>>> required", so probably it can be brought back, but I'm not sure how to
>>>>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
>>>>>>>>
>>>>>>>> I'm a bit persistent here because I really want to avoid the situation
>>>>>>>> where we define a bin-less OPP table and later we face binned QCS615
>>>>>>>> chips (which is possible since both SM and SA were binned).
>>>>>>>
>>>>>>> Why is that a problem as long as KMD can handle it without breaking
>>>>>>> backward compatibility?
>>>>>>
>>>>>> I replied too soon. I see your point. Can't we keep separate OPP tables
>>>>>> when that happen? That is neat-er than complicating the driver, isn't it?
>>>>>
>>>>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
>>>>> as a max freq without speed bins. Later some of the chips shipped in
>>>>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
>>>>> MHz. The users end up overclocking those chips, because the DTB doesn't
>>>>> make any difference.
>>>>
>>>> That is unlikely, because the characterization and other similiar
>>>> activities are completed and finalized before ramp up at foundries.
>>>> Nobody likes to RMA tons of chipsets.
>>>>
>>>> Anyway, this hypothetical scenarios is a problem even when we use the
>>>> hard fuse.
>>>
>>> So, are you promising that while there were several characterization
>>> bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
>>> to the max freq?
>>
>> I have cross checked with our Product team. I can confirm that for both
>> internal and external SKUs of Talos IoT currently, there is only a
>> single bin for GPU with Fmax 845Mhz.
> 
> Okay. Thanks for the confirmation.
> 
> What happens when somebody starts working on a phone using SM6150 SoC
> (e.g. Xiaomi Redmi Note 7 Pro)?

Update it in a way without disturbing the qcs615-ride.dtb? It is safe if
we add speedbin for Mobile in future, because KMD can correctly handle both.

> Likewise, If I understand correctly, QCS615 RIDE aka ADP Air uses an
> auto SKU rather than the IoT one (please correct me if I'm wrong
> here).
> 

AFAIK, IoT variant is QCS615 and Auto variants uses SA6155P chipset.
Both chipsets are functionally same except some fuses.

-Akhil

>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
>>>>>>>> and Auto SKUs. If you have access to the QCS615 hardware, what is the
>>>>>>>> value written in that fuse area?
>>>>>>>>
>>>>>>>>> Another wrinkle we need to address is that, so far, we have never had a
>>>>>>>>> dt binding where opp-supp-hw property exist without the speedbin cells.
>>>>>>>>> And that adds a bit of complexity on the driver side because, today, the
>>>>>>>>> KMD relies on the presence of speed bin cells to decide whether to
>>>>>>>>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
>>>>>>>>> combination (opp bins without speedbin cells) to help KMD detect that it
>>>>>>>>> should use socinfo APIs instead of speedbin cells on certain chipsets.\
>>>>>>
>>>>>>> If it is a soft fuse, it could fall into an unused region in qfprom. On
>>>>>>> other IoT chipsets like Lemans, Product teams preferred a soft fuse
>>>>>>> instead of the hard fuse. The downside of the hard fuse that it should
>>>>>>> be blown from factory and not flexible to update from software later in
>>>>>>> the program.
>>>>>>
>>>>>> This response is for your comment above. Adding to that, the value for
>>>>>> the hard fuse is mostly likely to be '0' (unfused), but all internal
>>>>>> parts are always unfused. Maybe it is 'practically' harmless to use the
>>>>>> freq-limiter hard fuse for now, because 845Mhz is the Fmax for '0' on
>>>>>> mobile, Auto and IoT. I am not sure.
>>>>>>
>>>>>> I am trying to play safe here as this is dt. We don't want to configure
>>>>>> the wrong thing now and later struggle to correct it. It is safe to
>>>>>> defer things which we don't know.
>>>>>
>>>>> What is "soft fuse"? Why do we need an extra entity in addition to the
>>>>> one that was defined for auto / mobile units?
>>>>
>>>> The hard fuse (freq limiter one) has to be blown at a very early stage
>>>> in the chip manufacturing. Instead of that, a soft fuse region which is
>>>> updated by the firmware during the cold boot is used to provide a hint
>>>> to KMD about the supported GPU fmax. I was told that this provides
>>>> better operational flexibility to the Product team.
>>>
>>> Do you have an upstream example by chance?
>>
>> We use soft fuse for Lemans IoT.
>>
>> -Akhil.
>>
>>>
>>>>
>>>> -Akhil
>>>>
>>>>>
>>>>>>
>>>>>> -Akhil.
>>>>>>
>>>>>>>
>>>>>>> -Akhil.
>>>>>>>
>>>>>>>>
>>>>>>>> We already have "machine" as another axis in the GPU catalog. I'd
>>>>>>>> suggest defining separate speed bins for mobile and auto/IoT in the DT
>>>>>>>> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
>>>>>>>> mapping those by the machine compat.
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>>
>>>
>>
> 
> 


