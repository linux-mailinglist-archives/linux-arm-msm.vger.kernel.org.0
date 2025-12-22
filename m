Return-Path: <linux-arm-msm+bounces-86256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3F7CD6E58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 19:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE53A30393E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 18:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E2F330B18;
	Mon, 22 Dec 2025 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKj9jMCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKMskJQt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1932ABCA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766428187; cv=none; b=C87j+c/xdegkybHbOmmOfPoEkod1HUnj48sRwaNIupA6ynZdQMKmrJ12/TX56NKU3VdBMZI5/oEOj0izOjErk1Cwasja6HGnL3Yh8vpMYoZVelKNL7FXMbiB9g87Z5mLcuq3sboEs9rv8MMhT//39UVDWe7WeI1DBptfq9pKoVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766428187; c=relaxed/simple;
	bh=+Gpfpx9OyKewJTdKU9iFYbo05Um0KHAGqtZl4bKXMZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEDle/XN9/JEar2Hl/NQvzCj/yER8aO4eVjZCys/trNlEyAw37wChz5GnbXOA7i35non7kkYe4QWrDNld/aMQIHCDld/erPOT2e7buMWIfn8L1oeO5hpFX4QuJb1tBbaGYTAQ4F3XNzUgGttqKaAbPa9EB+Uh8MRh0oe5grz4pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKj9jMCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKMskJQt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEC3Hf904127
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 18:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GoyHDNq+F1RPG785wZM+pkzeoNzaQsMvtTCy/dQNnLs=; b=pKj9jMCFonHChKJA
	oL1LifYCpQd0zJjQcXCXK5L66M58OV4vaCPXgDJ6MtQShosN6V+T38jo6LC3Q2Fj
	K0ophtD53/LG+cisxX9TiyDxmI5TA8mhBWuE4VxnP72mdM+Mp2pskOSBysYVWxtC
	NewGhSnENIm+R3KO8js2BASZUXemx2MZcIzOgXGy8B5oV2MWr2SuxMygcx431e02
	lNaoSz4MfcBvK8Mu21I6JbpMGmhuChdo3O0O8R74UmkIyyaXV5hyJrjZzSrsOO3Z
	q7QafRr15YjtheiCHjZW4DzFw0WOAgoAdMIr4aL/M64oewKY/oyPmkXjHM+p+F9g
	Jr+3tw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b70v29y09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 18:29:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so4629363a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766428183; x=1767032983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GoyHDNq+F1RPG785wZM+pkzeoNzaQsMvtTCy/dQNnLs=;
        b=JKMskJQt9cM1PfcGPpwQeOdHEXhnnukM9nyPJDzEH7mWAMY8zj08Xw9dOEZfnssSFz
         fFWgQLmITUsKfzhautLGYaOBanSin+Cyppgq4mY2JUKkjActK733HoCC0IPXI6uYW9jw
         rEdi8i2lV8sqA2RlGFRy1jkSm1KeuV4Zm4+FI5Id5fu9OR82ida2KP7TJ6bkI3iYX6OI
         mD07E/kG7ZFZV3U8JUByp5455d1TyQKnrvgjMWDJeZenIaLnspvjLO+eXRqalAKX8E6V
         q52MgnabGb8kR3vKkuJrYGG7qk+SLHPbIfaRCIrBglWUIB6FDzRuVx8PxW6BpFNW4s2n
         H9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766428183; x=1767032983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoyHDNq+F1RPG785wZM+pkzeoNzaQsMvtTCy/dQNnLs=;
        b=CfGZvkDqqm4bvV0nIQw0EvCKtivI9aZyPoKmhbm6pjxD5vvmrbL9HbM+kMqdgOa/h6
         4ZaJokhk848il0FfsizSn62xuk4GyWxBRrYZDHci/zPCIknAQxTA+4MB2H132tK+epk7
         o9fDlNKsfvGAzaULKmzKTV9lwHqa2+giH5UtQyJQZDQd89gCRQEOoY5SfiHsjJcsPU5p
         8BMKp9BKlvO21MH/YwQmq1rRDGpGfTjECpsCzKT4N67fhIN4mxISlPdDo/5nIOnanv8n
         a0+obxWsV/l/CbCoMo5RzmDjOUmvBdNAJsNXDuFKqW4EO6/WaNV70sep1ksliANuMMWt
         2Ctw==
X-Forwarded-Encrypted: i=1; AJvYcCWGd37iC5PL+8o5xoKBsHpTCpiXIMdXJKXRO+VRKhT0iPdU+cCFyK2vFpN8XnwCu3DF4uwRo/+/PKvOn1BU@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtlqvgFnp6KlJKIEVzqD7SMlxlkxeI2KUw2u/pjumRb9jiaFW
	mYn+/kDbuCm8X13/Y9HL/AJ4xHQwuthJeoNWfWpT06smPPdMtR7C1Prn/mQvUYOKRTBFH8iVL6y
	TQQ/r5WJo5oAV3iW20THdBFoPFSnBkFFBBmsSI5f4be2IGLrmJFLHuFt25kFP/vrDzQBa
X-Gm-Gg: AY/fxX57X1Ox6sUSQdRJYaUiKK9R0whgpcxdBfAvgbaITmsw+fKZ5ivNpbaPX9OVSwb
	oI7vKbWWHoqFJ+mEW2X2kZc/4yykCFVQSiuQVtJ6+vcFhWLcn2PBtRPgrxeupyINjK5uaB3Z3jr
	79XE5Vv4EDulxd0vxmNnQETElFcRAYktP5AEELmXETTQ3JMNiqlYueDuS+ET5PxRrm+cwuITlus
	ScLyZIBIAjxUJHWGLOJCom3srr9ganbVqUEPgBbkRqLEOB4Jlw/vaCB8h5PSkSDJ4Je+56riIia
	zWgwYnXctHwpcdgKk1PvaqZ+sTfyiJyXsG3FFxyndfovcy/bfAyX3RlBRJix1109VjcWycC4RrK
	TFipZ8weEJU5FFKHPg9tMuo96UTSyc0DXtw==
X-Received: by 2002:a17:90b:1346:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-34e921353c3mr10942736a91.16.1766428183397;
        Mon, 22 Dec 2025 10:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGml6W1g+6zlHFeYje9V5PaBuG9NLw7j/lPizNZeqvzh0Q/4VauYRMx06q3Kyp6cIvUzEJnHw==
X-Received: by 2002:a17:90b:1346:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-34e921353c3mr10942711a91.16.1766428182801;
        Mon, 22 Dec 2025 10:29:42 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7720b52esm5608545a91.7.2025.12.22.10.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 10:29:42 -0800 (PST)
Message-ID: <b01eedc2-24b6-43fd-b729-85eded2d6b34@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 23:59:34 +0530
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
 <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
 <CAO9ioeXKBD0ab2+FmNnFQozKq_cp+hFwc5B6LtgfEC2FLULUYQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXKBD0ab2+FmNnFQozKq_cp+hFwc5B6LtgfEC2FLULUYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GNO66hyynkJ4Fy497fU825-g0rIUVHom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2OSBTYWx0ZWRfXysTDmJCrpnC5
 9ieIkYz4WvYxsCBifB0RAsVIxZzufcwE0ive53kLyqjy7bM6Pwn0VuV9RJVHrgOut4TR2uAmG36
 fy/oxjYb8tFgoDEyNhktXoHVe0ct3oHfJ902hSlCo77VtwFvOaR1lqBDV26lt9S/T5Ig3SzZYBx
 3B7XB1U234LHADXO0hJqY0qxrajsgBtJQqjWt4cpj3sb/e3Bhbtx6XE++ZPSglTok2zKmzxzP2E
 rbh+Xqyy6le3tUeRIIzBftAK2AvL7j+IUYYUBorh0cIgCyG16X14PPWaP4Mi+iEl3zqzlXcfCDr
 u8SYqjryj6Baylpl4HlXPzIDLcKsQHAS6ZQ1f854T+VO7DpBtsaX8OOfDNEuKJ+I1dCYJp7JyCK
 OlZBDJM/jUCM1Bu2lkmxSNpHbFSFyC0QgZGsQO/LwGcm7jRNuGReH3JMHsgBB9s8uRon9WFfrbM
 Mg/r1093DPtuXe4QF+Q==
X-Authority-Analysis: v=2.4 cv=YOKSCBGx c=1 sm=1 tr=0 ts=69498e18 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=oy5nMm26i85I/VS19bmskg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=qvHcGGk0DYwmpqrIP6UA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GNO66hyynkJ4Fy497fU825-g0rIUVHom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220169

On 12/22/2025 4:54 PM, Dmitry Baryshkov wrote:
> On Mon, 22 Dec 2025 at 12:54, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 12/22/2025 2:45 PM, Dmitry Baryshkov wrote:
>>> On Mon, 22 Dec 2025 at 09:19, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>
>>>> On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
>>>>>> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
>>>>>>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
>>>>>>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>>>>>>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> +                        gpu_opp_table: opp-table {
>>>>>>>>>>>>>>>>>> +                                compatible = "operating-points-v2";
>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>> +                                opp-845000000 {
>>>>>>>>>>>>>>>>>> +                                        opp-hz = /bits/ 64 <845000000>;
>>>>>>>>>>>>>>>>>> +                                        required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>>>>>>>>>>> +                                        opp-peak-kBps = <7050000>;
>>>>>>>>>>>>>>>>>> +                                };
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>>>>>>>>>>> or mobile parts specifically?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>>>>>>>>>>> here.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>>>>>>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>>>>>>>>>>> speedbins from the mobile variant until that is supported.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>>>>>>>>>>> non-mobile platforms.
>>>>>>>>>>>>>
>>>>>>>>>>>>> We cannot assume that.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
>>>>>>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>>>>>>>>>>> wise to use the configuration that is commercialized, especially when it
>>>>>>>>>>>>> is power related.
>>>>>>>>>>>>
>>>>>>>>>>>> How does it affect the speed bins? I'd really prefer if we:
>>>>>>>>>>>> - describe OPP tables and speed bins here
>>>>>>>>>>>> - remove speed bins cell for the Auto / IoT boards
>>>>>>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>>>>>>>>>>   declared in the GPU.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> The frequency plan is different between mobile and IoT. Are you
>>>>>>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
>>>>>>>>>>
>>>>>>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
>>>>>>>>>> has speed bins. How comes we don't have bins for the IoT variant?
>>>>>>>>>>
>>>>>>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
>>>>>>>>>> Auto bins:   0, 177,      156, 136, 105, 73
>>>>>>>>>>
>>>>>>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
>>>>>>>>>> starting from bit 21).
>>>>>>>>>>
>>>>>>>>>> Mobile freqs:
>>>>>>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>>>> 156:             745M, 700M,       550M,       435M,       290M
>>>>>>>>>> 136:                         650M, 550M,       435M,       290M
>>>>>>>>>> 105:                                     500M, 435M,       290M
>>>>>>>>>> 73:                                                  350M, 290M
>>>>>>>>>>
>>>>>>>>>> Auto freqs:
>>>>>>>>>> 0:         845M, 745M, 650M, 500M, 435M
>>>>>>>>>> 177:       845M, 745M, 650M, 500M, 435M
>>>>>>>>>> 156:             745M, 650M, 500M, 435M
>>>>>>>>>> 136:                   650M, 500M, 435M
>>>>>>>>>> 105:                         500M, 435M
>>>>>>>>>> 73:                                      350M
>>>>>>>>>>
>>>>>>>>>> 290M was a part of the freq table, but later it was removed as "not
>>>>>>>>>> required", so probably it can be brought back, but I'm not sure how to
>>>>>>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
>>>>>>>>>>
>>>>>>>>>> I'm a bit persistent here because I really want to avoid the situation
>>>>>>>>>> where we define a bin-less OPP table and later we face binned QCS615
>>>>>>>>>> chips (which is possible since both SM and SA were binned).
>>>>>>>>>
>>>>>>>>> Why is that a problem as long as KMD can handle it without breaking
>>>>>>>>> backward compatibility?
>>>>>>>>
>>>>>>>> I replied too soon. I see your point. Can't we keep separate OPP tables
>>>>>>>> when that happen? That is neat-er than complicating the driver, isn't it?
>>>>>>>
>>>>>>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
>>>>>>> as a max freq without speed bins. Later some of the chips shipped in
>>>>>>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
>>>>>>> MHz. The users end up overclocking those chips, because the DTB doesn't
>>>>>>> make any difference.
>>>>>>
>>>>>> That is unlikely, because the characterization and other similiar
>>>>>> activities are completed and finalized before ramp up at foundries.
>>>>>> Nobody likes to RMA tons of chipsets.
>>>>>>
>>>>>> Anyway, this hypothetical scenarios is a problem even when we use the
>>>>>> hard fuse.
>>>>>
>>>>> So, are you promising that while there were several characterization
>>>>> bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
>>>>> to the max freq?
>>>>
>>>> I have cross checked with our Product team. I can confirm that for both
>>>> internal and external SKUs of Talos IoT currently, there is only a
>>>> single bin for GPU with Fmax 845Mhz.
>>>
>>> Okay. Thanks for the confirmation.
>>>
>>> What happens when somebody starts working on a phone using SM6150 SoC
>>> (e.g. Xiaomi Redmi Note 7 Pro)?
>>
>> Update it in a way without disturbing the qcs615-ride.dtb? It is safe if
>> we add speedbin for Mobile in future, because KMD can correctly handle both.
> 
> Corresponding entry in a6xx_catalog.c will receive speed bin
> information. Will that break compatibility with the existing
> qcs615-ride.dtb?
> 

It won't. KMD will select a bin in OPP table only when a speedbin nvmem
cell is present. If the nvmem cell is not present, it will ignore the
speedbin table in the catalog.

-Akhil

>>
>>> Likewise, If I understand correctly, QCS615 RIDE aka ADP Air uses an
>>> auto SKU rather than the IoT one (please correct me if I'm wrong
>>> here).
>>>
>>
>> AFAIK, IoT variant is QCS615 and Auto variants uses SA6155P chipset.
>> Both chipsets are functionally same except some fuses.
> 
> Ah, ok. I wasn't sure if we are using QCS615 or SA6155P in the Ride devices.
> 


