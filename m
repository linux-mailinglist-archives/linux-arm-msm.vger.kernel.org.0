Return-Path: <linux-arm-msm+bounces-78382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0CBFD5C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 211D6358C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CBA2C031B;
	Wed, 22 Oct 2025 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZvTP+At"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6014C1C4A24
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151662; cv=none; b=LRg0TkeZVmIOACqwY6kPNNcTXFqO0ttmWmA/Jl+aH8n+RJn1Tkx8aMn/rq1MmLvN3Djyxi97uoZKQpwNmaYYZ2YQNsZRyeoFrCSz0+WCMP6bZFrtwkduWMBlCPJ9TiuRx/ggNw0EMkUqe0xXrZIl/8fDkEauPg6q/UpaKBwAcbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151662; c=relaxed/simple;
	bh=kftTvkgoB2+kmPdzHa1FhFtBi7MwxF0f8K4Ba50t7fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvYa9vbKd2LNzVWboz0xUomfXSQN4wMvBj4ztf50LROyLEctsCbUbYqcHwBIpgMaqV7FNNuu19/s5MaOsUe3WCS6WhhgtHWwZgPRMX+9q20MhROIHSWIP5Bwo0VzVY9JjkTj4DFVqz5BgUjlK/mNsuK793Zft4Hv0vH1rIuQyn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZvTP+At; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MGSA8E003553
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J54evbYJoYZta2cuR3qWMTzZYbi8gteEdn4c6fa87tI=; b=LZvTP+AtfFxTO4X0
	2c/n76IYrcju04gIhO+A1jF88CjV4v7u7Pq9oXLYXOu5VYY+0UD1flNyDiTFwjLd
	+gYb2+cNUtkOCSbCrYNNNi6kSSdSLoO68a5iArJfwqww6a/OknOEqW6N+p2Ed3ea
	xIrcALj0EsxTZG54dhRFOeuLGTHOALdsbxOLpJ/A73S+FNWc0rBL62A5pMIB6mAA
	GejHjb3XKsfoIO2S7x7zeI9rVKH8yZPQD49dMfwfgW0m7MCMNdNJAE1WyRTir+Eb
	9VPJzCzWU74jPwMmtSWk1Ja6/72UR8EPv5nxOCeN5PGfp0WzmoTdHD8olmNn3Xy0
	VS/NEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsb0gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:47:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8aab76050so4949691cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761151659; x=1761756459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J54evbYJoYZta2cuR3qWMTzZYbi8gteEdn4c6fa87tI=;
        b=cCOiBYX9PUMwCj45xtgmai4vv6+CCOM2Xd2eHi/QAGcuGYu13Ah8q2xwgYtPsZOjrr
         dVE9InbT6yYksEXnB2kfbIkf0X2BgfKN63VGi90r46DkGwe0PF287F89zjXUupW9bynM
         h7nFlTdiHHxskCAObI3ar9Nyq5H2+KPa/DFUlkHWxPZkX/ScSVpJYiPqDLBRYFR5fsu+
         +OXhhhqsoRgrQna/dapcPyWU/Zh4dvLV9hc2t4Ccwl9vunoB//Ik9hZ0b8jQqSJ55HYm
         HqnPdFOjTkEoGn7gZZrmZ+BGO73MJy62Hf/iAP0xuIqsiZRl2Db8d7xQaRIEm+yNk6PU
         JD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6q8x7t62qzk5Fh0AX5csssu3WEXYKN1gyjJohJBA0OH8FHatxo+7uDqCZaTQLmaB5Eb+8nSsQOBQb6HAz@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/ELNnQRqN4AKlKfR5jfFCjr9l/FWZ/tm/KQNjTOl28+xu08J
	hi85C1SHSpRh2EeMCPd32Uyxk2kN39/NVtlN3A4ZosE/dVBNbPzqP5+r2TIjhiMg02DArqrYHvy
	aYXZdgorOfJcvwB17oQFEjzUfRb27dIG70vmfM4UaAqAuaxfIdqOBEnLQAMdElx9osSIX
X-Gm-Gg: ASbGncuRGt6Q8Wwtyg3T6scOo5QoDxMCVSexdvbospOUBoLbbCeOg4sdPr8Bo6x1INZ
	4yfZmWFLfq3Ypdzv2CJs4QfX0HoM70oo8W5BzqkQnBew0t3DWiHO5O9j5Tvjr5vy1vbRF8HQv11
	4v9U3ljKO0ieFZ+etimXk8tjAoM9VTvvi0KbwaeB8m7UCAEQ35y1Bc6hWaSers6nAdJAaOVhWDG
	sCmopwTILLTqIwBNpPIBYvMgJ6dgRDjxnKDJe/NrnErq6JEWCHuL/LbjGltKMGxxEOWO4S13XW2
	pYrCpD4b1NTiPkl/WnVCfHWqsM+BqfA65Ng9rzALyjbaspdIwYjf1e1rqwlj6F5qC4vgKHfC8Rb
	CL5H/2BBw4wVRYMlKvHLacyM5nHjYslWHwTTXN9bG/r60fG45mBMkVsG4
X-Received: by 2002:a05:622a:148b:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ea11710be3mr65084281cf.7.1761151659178;
        Wed, 22 Oct 2025 09:47:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj8qiX+rxxJ2hj8wzB2Dj2Legx07HCdjLsPBTADHiywti4Ja2LxpeA8g0P+Na+7eOQovPAFg==
X-Received: by 2002:a05:622a:148b:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ea11710be3mr65084061cf.7.1761151658630;
        Wed, 22 Oct 2025 09:47:38 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d40790b88sm38876266b.25.2025.10.22.09.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:47:38 -0700 (PDT)
Message-ID: <dddbb37d-04a2-4f16-a9e8-cdad503c033c@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:47:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: andersson@kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, linux-arm-msm@vger.kernel.org,
        loic.minier@oss.qualcomm.com, rosh@debian.org
References: <27b309ab-e0b2-4f00-84d6-48fc1b027e40@oss.qualcomm.com>
 <20251009103041.22568-1-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009103041.22568-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX99Gjh96R/mPA
 rwwzt79OqFle/RRmHNj/thKfLCBh5aH+5hliIjrb3wVAriSOHLB9kfrWkPrQB4/UsLegleFWiLv
 pHztlPVNNhumB4IsScphKaDTNUXC+sY3tA7ReHqPLqyAw8PEvH/KP4oV+/C19Ot55p3LnX7cEDs
 qoU2Pk0wCbd0d7OLBcCBalgYXoN7g7f/6c2EtF3J8ErpyZKXJ6SKtMVW6YV5c8/m2AyWEQgLPOh
 3SqsUoYPSebIzHHOeBUiyfwJ537yhHKDS3BgVVom7EYqb6LbP/joMsWVAI7h/PHhZaLMLkW8ZWw
 ikP/rm26NUDbWSkx/0P/BiCWz6xR56vbDt9pUaNyXd3RRLMVOnocFF+BHgxTUEqJvTmOcuzKtN0
 j3+zbwlRmTwZijgcclduMFqMFA90Kg==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f90aac cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=HdDCulNxiGjrx9QmGWMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UXzwbBbux2KnXo_RP_Fbe3e7nET-Ale9
X-Proofpoint-ORIG-GUID: UXzwbBbux2KnXo_RP_Fbe3e7nET-Ale9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On 10/9/25 12:30 PM, Hongyang Zhao wrote:
>> On 9/30/25 6:32 AM, Hongyang Zhao wrote:
>>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>>> QCS6490 SoC.
>>>
>>> Works:
>>> - Wi-Fi (AP6256)
>>> - Bluetooth (AP6256)
>>> - Ethernet (AX88179B connected to UPD720201)
>>> - USB Type-C
>>> - USB Type-A 2.0 port
>>> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
>>> - M.2 M-Key 2280 PCIe 3.0
>>> - RTC
>>> - 40PIN: I2C x1, UART x1
>>>
>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
>>> Cc: Casey Connolly <casey.connolly@linaro.org>
>>> Cc: Christopher Obbard <christopher.obbard@linaro.org>
>>> Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>

[...]

>>> +&thermal_zones {
>>> +	cpu0-thermal {
>>> +		trips {
>>> +			cpu_tepid: cpu-tepid {
>>> +				temperature = <65000>;
>>> +				hysteresis = <5000>;
>>> +				type = "active";
>>> +			};
>>
>> these are not useful unless you wire up the fan here
> 
> I wrote a service program at the user levelthat listens for netlink messages
> from here to control the fan.

Creative!

> Controlling the fan at the kernel level should be a better approach,
> and I have verified this. I will make modifications similar to the following:
> 
> 	cpu0-thermal {
> 		trips {
> 			cpu_tepid: cpu-tepid {
> 				temperature = <65000>;
> 				hysteresis = <5000>;
> 				type = "active";
> 			};
> 
> 			cpu_warm: cpu-warm {
> 				temperature = <80000>;
> 				hysteresis = <5000>;
> 				type = "active";
> 			};
> 
> 			cpu_hot: cpu-hot {
> 				temperature = <90000>;
> 				hysteresis = <5000>;
> 				type = "active";
> 			};
> 		};
> 
> 		cooling-maps {
> 			map-cpu-tepid {
> 				/* active: set fan to cooling level 1 */
> 				cooling-device = <&fan0 1 1>;
> 				trip = <&cpu_tepid>;
> 			};
> 
> 			map-cpu-warm {
> 				/* active: set fan to cooling level 2 */
> 				cooling-device = <&fan0 2 2>;
> 				trip = <&cpu_warm>;
> 			};
> 
> 			map-cpu-hot {
> 				/* active: set fan to cooling level 3 */

You can drop these comments

Konrad

