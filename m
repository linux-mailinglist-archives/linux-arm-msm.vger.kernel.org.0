Return-Path: <linux-arm-msm+bounces-82973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32806C7D1AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 14:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06F134E1E18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 13:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5738F156678;
	Sat, 22 Nov 2025 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqVWyPrd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPn6Npuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301110F2
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763818669; cv=none; b=UHo8DRK9IH67ULMlStAjd+w24VyA6ES3DWxtpnVoub504ijUHMv5xDVJd9tB1GdfC/VIHc32g0rHMqLpHvYTy47Q7igzFrOYvDLRuI+AgU7ktMYet0bB2sFychvNBY8L8qsawne8vVrEGmIpspI3Tf8qDWZQC5v/GD+bBbS9n0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763818669; c=relaxed/simple;
	bh=u6BauhfFyOUtj6qYbL0c4k+4saAV/sEZnEnpWETEeu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iV6kXBW3OLHsWuFlHDpkBbyeOmz2Fy6UaCt9HT8nTW3AcsnHG40GjCq3cvj+Umbz7J/6JX0ZTLVuO+IR9vB+q/63/hCnAYovN/azne/EjqEgPD1biEjfmrFnzx8kkT8LOl0GThyGras9o64MAZ5psotPL4BVgT3efvg9cJXwsZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqVWyPrd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPn6Npuu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMCbmLC2955851
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vpKlju2borCnF5T0A8CLiJv8yDluVEw4QY6DSS08xXM=; b=eqVWyPrdXhpla72C
	qS95Kdp6woviucvBADPP34opafepdhEddkKNmJc2d0ux66f667lXwuzlWJ+dngqe
	liLCtdnGHLmgTVYLK50AUzkNjQQ3pxGxT3mlLQFGCgkU3huC59hoAsVDJFAwmA2I
	VA4825HrQC4Rbj5nU5OhbxishIzOQL6on9EcspqMAeqFWnBnareB3dEruG0XWmvQ
	0kKF+mPiobsobSayMKYTYvPWTZn6xb8dTT/LT+B2X5NMRyaFzz/sk23pa7vxyhFH
	50rHMSdhOSB+1d3UVAy7SiSU02pgJh9MECVbcrI5mQ1s/hfSQuPWUE58wa5OO0sm
	+1jL2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69sgrbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:37:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so8762691cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763818666; x=1764423466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpKlju2borCnF5T0A8CLiJv8yDluVEw4QY6DSS08xXM=;
        b=YPn6NpuuuE07XrI1vYldEGrcN81RQ/n38otfbZlfhO05VD7/78ATNMGfOTWboYpMki
         rFqcDMCn+7FkECSFigGEMvAtwJ664V9524gofp/FuD64jfFotJxTK2xGGu6DDgFsTnnP
         AJqdFyc4iMoy8XJtvj7ofKoxNI4BJqhi1QzUxNvMqg0mY3WsCxEhN1PGfJeX0I27XyOi
         WMjVfkE4aaGp3P5ysjEYeZNYNmZz4biRshamKMEORJfb0HofyQvWHUyIpyEXVLw3abhb
         ui8oaRac4uJfv+xaCkt6Z1Fltsu7SKQ/a0oc6g6P5PnMStdPEdciqw84jVnsSf1xKiGV
         UbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763818666; x=1764423466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpKlju2borCnF5T0A8CLiJv8yDluVEw4QY6DSS08xXM=;
        b=GXgVOcDHQPbOaVfBi8W2EbFDcGPS5kjvqw6ErQt2mstta+zxu/Ld8lAKbwIp6AmdyQ
         ixDZRcxwvc37dzp40AKozC346SJ6IwnU3QbY4EKoz7Je/G8/6tGX817fH51X4/+QjInZ
         zVw0YJfe0MWLNYMPzP8Yw8gVX7Gev01KuXHyvHLTrtEc7TW9MJVxQ+dhflOfAvDsQ3ZV
         xYIsXkY012NP8k8c3ZShrSB5dtIWWDwKAEUW8yr5QVY81XlZjIq7uFaZ0grZ075sIKrc
         g21+zMPOIVpD1TpZdq94FG+ukuJ9lH0F1calrE6AVHHACrdTgBJNEN9VGZXMZOIXiWXe
         PyBg==
X-Forwarded-Encrypted: i=1; AJvYcCVV38hR5wLFsI8ddzEOnJyOmcTDH57sjCC9SFIebVfDfFhno58fo1bqUUmyKThN8kYXkP2+BtN1WpE8eWO9@vger.kernel.org
X-Gm-Message-State: AOJu0YxYvll0ZHH1rL1h0Ux2nMaANKEyrp4dqZi0QBI4+mHTFcTB84iW
	KezqVFX5WewMMR1wUIcw/2krTuOk/I1CLoxdryhvbVeX0baSU6qIA0BoUU07sNphmIqwqYmXAPK
	gTgM5Lpwfjbw8PjtLG2RTpSeN/Mtgg5wx+dG0z90AqO/XcelX/IFnQkIAZS1KHxShWwUw
X-Gm-Gg: ASbGncsyYwBAbeoqD1cAQQkwFI6A6Run3HecBZfOOXhrGCGRFxuFleGsruxFCUuNV1t
	r8XOSwTGKQKAOREbjrT9y/Kbog6TSA67hWf1qcfImfasPbxFEOzaTfZ3Zx0leC81h+Uagxe3AwQ
	yiAHYAGG0EM9DQBBtqAKoxMd1IZx8cWIUyvb5+MivC9tF2Fu9CKNJWJaVO25sERf8e+mMAGi9Ij
	4DDWnQC3O0YYd5sG1+Y7mzajJuLnJpBGmAO4Z3QZx/xq9Yq5kXkXo03z9xCCG6z2m0XQlDmRTaC
	79zGMVo2Z+0CdoeG0MLJruDUvvkn8ZZ5Dievqrj8kY8IbVxKHNoUtZWWYMwHIUcA7kARSvlTslA
	slCkxk5oPe/3v/Irebfw/iHwSenqmCFooieC4/s6DEDh+Hh2NeuKpCykgAd56uWnqbk8=
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr61120441cf.2.1763818666108;
        Sat, 22 Nov 2025 05:37:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoep6nfGiw+VpxZkfaKHeCgO/XxMbNv1FNgkeFxXOdBWbxoTvU1FtSK/h2lVrS77kwEGBxsA==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr61120141cf.2.1763818665629;
        Sat, 22 Nov 2025 05:37:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdabd0sm718995766b.12.2025.11.22.05.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:37:45 -0800 (PST)
Message-ID: <d6018a1f-12a6-431b-9367-65c65e1d920f@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:37:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Maud Spierings <maud_spierings@hotmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
 <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
 <PR3P189MB102003218DCCE87EEB69A0E4E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <57bab427-d8fd-490d-88f6-358b79367ed1@oss.qualcomm.com>
 <AM7P189MB10093041E89777C2AFAE2CEEE3D2A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <AM7P189MB10093041E89777C2AFAE2CEEE3D2A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PNMCOPqC c=1 sm=1 tr=0 ts=6921bcaa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=Ufo_hXmgmYuxYTG_NCgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: fGQT4pmfjNG8rm6DQ6sPWxYzhHLf7jSw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExMSBTYWx0ZWRfXxzN/CWl1Ilvq
 Sa1PZRJ2bHMFzcQEiysGokm597PVRimZLak0mTwn/CwJCPt7y0SFI5Ra8Yw/Zw9yVwvxAmjtFxo
 xRk9zL5mav/Jue6T33RJz4Rrdz1q1zX2luuBmuo7t/mvXpMh5OHTYL3UG5ojiS46/GCCtZceB4D
 S1IyKcIpib3QeqgtJbq23lqNyzOilpV6Rb4a80K7QOiwZQk2T+pM5YQAY6bcpybQpybdwMPLNX1
 oRJ6Cywy3ZSrn1+v+jOVBOm2kRZiGdfX9Z6szcN2992EsJ+jl/HF+m70Ln9OwYTsJXebcAzVBgB
 K4J3ahD3304BCv4hHquMgbUtRehTfSqAiYUbtR4n2dJ1XEHB2ZiG3BrQu8RmUZE6mNpyBMl1pOy
 klxT1l4KgFyjkJjoaFOUReBmiW/YeA==
X-Proofpoint-GUID: fGQT4pmfjNG8rm6DQ6sPWxYzhHLf7jSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220111

On 11/22/25 12:07 PM, Maud Spierings wrote:
> On 11/20/25 16:36, Konrad Dybcio wrote:
>> On 11/17/25 4:44 PM, Maud Spierings wrote:
>>> On 11/17/25 16:35, Konrad Dybcio wrote:
>>>> On 11/17/25 3:13 PM, Maud Spierings wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 11/17/25 13:59, Konrad Dybcio wrote:
>>>>>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>>>>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>>
>>>>>>> Add nvmem cells for getting charge control thresholds if they have
>>>>>>> been set previously.
>>>>>>>
>>>>>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>> ---
>>>>>> Have you verified that e.g.
>>>>>>
>>>>>> connecting the charger
>>>>>> setting the charge threshold
>>>>>> rebooting to windows
>>>>>> rebooting to windows once more for good measure
>>>>>> rebooting to linux
>>>>>>
>>>>>> still has the settings persist?
>>>>> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.
>>>> Hm, I wonder if Windows/UEFI overwrites these values or whether they're
>>>> used by something else..
>>>>
>>>> Can you set a threshold in windows and see if Linux can read back that
>>>> data?
>>> the values in /sys/class/power_supply/jada-jada/ are zero when rebooting from Windows into Linux after enabling charge limitting in the Asus application.
>>>
>>> I remember my old vivobook (x86) also forgot its settings each boot, but given the nvmem cells that should not be happing here I guess. It is odd that there seems to be no collision between Windows and Linux. Maybe the Windows mechanism is doing the old trick of writing it in there every boot?
>> Odd indeed.. Does it work if you reboot from Linux to Linux?
> It seems not, I seem to remember testing it quite some time ago, but I cannot get it to remember any way, at least it is not popping up in sysfs, always back to 0

It seems like the driver currently only populates the sysfs start/stop
values if the "enable" bit is set

Could you check this (hacky and wrong) diff and give it another try?

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index c8028606bba0..9ebd8adfb8eb 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -733,7 +733,7 @@ static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *batt
        u8 en, end_soc, start_soc, delta_soc;
 
        ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_en", &en);
-       if (!ret && en != 0) {
+       if (!ret) {
                ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_end", &end_soc);
                if (ret < 0)
                        return ret;


Konrad

