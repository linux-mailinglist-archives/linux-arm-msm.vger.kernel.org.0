Return-Path: <linux-arm-msm+bounces-73725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD32B59A69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 384774A3FED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 14:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A9D3376BC;
	Tue, 16 Sep 2025 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9+0IlNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAA422A808
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758032891; cv=none; b=fwFzRRaLCf74qWTCMIBRDkLe9Y3trlPHUJPd58J/Ru83UKUENuc5hKjBXQNhFm3leCzdTjIia60Ror69MB6Ml0m6tcsy91RN/9sBGfQ7kEVv6z3Be8I6QK2MAahqIgxOxiEgsZS0jrwG+fFISEowsXfmjBJJeNVolPkj+d7WuQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758032891; c=relaxed/simple;
	bh=MvB5R+g1Y5UMwU5wpYAtG6LHzlXTMocT+4+xJ12AnMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAp5KYO8e6pA/cN/hZwlrSQhJ5/eriDb2rsVn7X7GsHMS+rtn5+s4U7k34FdxNG9a3lGLkrecwKAwVjcqjFIdMSlgGbFI6CBmjX2/CY5AO6CC+jpRhsTrcDaXeuegNyfoJ/xmSVhvyDF8oFdw2prxhl0epjcXQ9sy49MDACmLLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9+0IlNU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAf83Z021231
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVazFxrBiaVWPr5/+h7Ed2VEmDRhLsCV8X1mrq96m1g=; b=g9+0IlNU/+nURk93
	+Smop83hTIb4LZ97NCbh+1tie8EpaIF4IDvh0/p5O0SODYIsRATFQI7KUW52+p/N
	tbO542Q9FrN7VZIN8t68Km2AEHM78lN278SVOoJoYtqFxT8KgH6e+mZOdHovzd3q
	NzoQskBV8fAmlaEfJx6uehPSzxSxLMFLTO6GsKPP9EWM7o8vop72qC8Y5wQqwoxP
	74eMuiFS6jgcj9y445GG3G1Pz++TvnZHWzaqMnX440zY23gNYjKm4/0xXS37jM59
	LiahGidMhYElLZpMatS+RdpA4Uiy0wLPv7mhmLfPSZwOhzoiHo5zveeEzscTqfyr
	0/OjrQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma955b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:28:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b54d6a67b5fso1340594a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032887; x=1758637687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVazFxrBiaVWPr5/+h7Ed2VEmDRhLsCV8X1mrq96m1g=;
        b=rLXD0GP+g+8ASPykJ5ZSmOW0Z1r6HJjVSIi/g6aNPXZ09s92D7uEOaOPbHlLkxStGb
         QwIwaMdhTyahDO11YYjvuGjCo1eo5iA3TMxLS2XOeoKqFxHoog0tcH+0H7QRFBetiuhp
         cgwYXvzVDrXMujP92cMaF7gJu6P0OKrhgA1EXojVpQ7jjL2IaSqcGGfBZs4+IVpxlEqD
         KZ62dBFRKztvkKn/q4P738PyVP7s9F7HZNlRyR2+hHyqEmP2uTdSFIXZlplaVPFbGj40
         xLQiVV96GDY4jBgtL2Nis4mHnvDAawugR3/r9xBBDnSoi7CksQXxIUo+TJaK+pcyZfbb
         lwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD1LXg1mNIYISz7nkRhN5xMTFez5sZ+ghKDRDSms9nnjlksqfPVzynRE+2BDFIL1fh//9KRZ9TJU4wamOk@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXA0tuM9Gn2aSULxHVija7K1BpZEtTvW++gKE0630MU+tMXWg
	BJVusFcNtwLsK410aHojvCrx+F2cMsKqVHY0v0saYTMrVwcgmY3YdnD93r3pfJqOHg+VeMaOhEI
	W9UtOhnTReMgizBBD7ucEO9BT12iUrsywdm1Tt46yMO8M/342ND8uJqp8NRGoVvKsEYMM
X-Gm-Gg: ASbGncul3kH6wrSdIbXhE58ntMSgr7uieuqly58gNls6k/ydQL2BWOdnu0+vXHziN79
	WdqKD2tY7OxcgyPGCJqhtKxKkvTAx+Udbcr7MUT7Cn9V4LGkPtakJ5tCN5ksw2WVMs/wJFDsAZw
	Nijv99L9KYI1U/yTQWO+pCsN/y1Vgq12VBk/ZgeWMRQDvniQbvj9T2HBeZnJi9NNujhp3rJoTuD
	vbRtINUvNKP2/9hMxjtHY4OAPB6ngZiYqy8Zc326o6x6Fdxpi45Patfr3ysHRSqddorGj9hbhU+
	7CuVMZfv/XBnUTEDYd+dFZ/MjsYF6QZtgFIpWtfUtVmSIrh/hDrIVkEViKt1tzgGItjruDKQ
X-Received: by 2002:a17:90b:4b02:b0:327:b2a1:2964 with SMTP id 98e67ed59e1d1-32de4edd5c0mr24271848a91.15.1758032887081;
        Tue, 16 Sep 2025 07:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaRdyreAXTN3R4VZO/4YJ07pyOClNXcalPfMJAt0v6xilHbu5B83Umf7EFNgBl+2P0ENNgmA==
X-Received: by 2002:a17:90b:4b02:b0:327:b2a1:2964 with SMTP id 98e67ed59e1d1-32de4edd5c0mr24271789a91.15.1758032886468;
        Tue, 16 Sep 2025 07:28:06 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387cc21sm14557763a12.28.2025.09.16.07.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 07:28:05 -0700 (PDT)
Message-ID: <d662d014-5970-4d6a-b5c5-1722cb8a1a86@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 19:57:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 0/5] Add support for QCOM SPMI PMIC5 Gen3 ADC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org
References: <20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com>
 <20250829-imaginary-dove-of-music-afdb36@kuoka>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20250829-imaginary-dove-of-music-afdb36@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX2+bR/tq2NKIi
 EZFk6n7rc8JdEJKJIZNEI4/mBN68Wejt6Qe7T5NC/bXKOvKtJHUBi8kxdE5KWKPa4k7bLlbZpV8
 eG9ogYLSHgoa7C11R+NJAuyKWqsCcEi6bDfWmD4WgmqTWQF0Av90L7LhsrE4OQREOSZnj5twe5L
 5fQhoKo2LltJG6NcTkfo+x2CKu1gDsfdy1bMNHRkuJdpFUX/kkQjns8FX2+WQlJ80qi2Hb78WgF
 pFwmIKCAryAg3zmQX5tz/FnOZY1zaJ8/yC6RcsICyagWm34OGVA9+wzLVwRfrO+bJfuEiqJ4SFb
 2tRmAXLXGJ5shZkkLkxa9eFs2J8boqAzg5hceWfNL9/TjgriiVkgMJXZT9kaCoPuu2NYGx2RiNX
 Nlew8XZz
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c973f8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=a0YOPMXbwBXd-ClgL4oA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: HheY7l4rlUqp8cXykxiSIAb6q54oEHto
X-Proofpoint-GUID: HheY7l4rlUqp8cXykxiSIAb6q54oEHto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

Hi Krzysztof,

On 8/29/2025 12:41 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 26, 2025 at 02:06:52PM +0530, Jishnu Prakash wrote:
>> PMIC5 Gen3 has a similar ADC architecture to that on PMIC5 Gen2,
>> with all SW communication to ADC going through PMK8550 which
>> communicates with other PMICs through PBS. The major difference is
>> that the register interface used here is that of an SDAM present on
>> PMK8550, rather than a dedicated ADC peripheral. There may be more than one
>> SDAM used for ADC5 Gen3. Each ADC SDAM has eight channels, each of which may
>> be used for either immediate reads (same functionality as previous PMIC5 and
>> PMIC5 Gen2 ADC peripherals) or recurring measurements (same as PMIC5 and PMIC5
>> Gen2 ADC_TM functionality). In this case, we have VADC and ADC_TM functionality
>> combined into the same driver.
>>
>> Patch 1 is a cleanup, to move the QCOM ADC dt-bindings files from
>> dt-bindings/iio to dt-bindings/iio/adc folder, as they are
>> specifically for ADC devices. It also fixes all compilation errors
>> with this change in driver and devicetree files and similar errors
>> in documentation for dtbinding check.
>>
>> Patch 2 splits out the common ADC channel properties used on older
>> VADC devices, which would also be reused on ADC5 Gen3.
>>
>> Patch 3 adds bindings for ADC5 Gen3 peripheral.
>>
>> Patch 4 adds the main driver for ADC5 Gen3.
>>
>> Patch 5 adds the auxiliary thermal driver which supports the ADC_TM
>> functionality of ADC5 Gen3.
>>
>> Changes since v6:
>> - Updated auxiliary device cleanup handling to fix memory freeing issues
>> - Updated copyright license in newly added files
> 
> Eveyrthing is an update.... What did you change in copyright and
> license? And why?

I replaced the 2025 copyright with the new yearless one in newly added files,
following our new internal guidelines. There was no change in the license, I'll
fix this line.

> 
>> - Addressed some reviewer comments in documentation and driver patches.
> 
> What changed specifically?

I'll update the changelog here and in other patches to
list all the changes clearly when pushing the next patch series.

Thanks,
Jishnu

> 
>> - Link to v6: https://lore.kernel.org/all/20250509110959.3384306-1-jishnu.prakash@oss.qualcomm.com/
>>
> 
> Best regards,
> Krzysztof
> 


