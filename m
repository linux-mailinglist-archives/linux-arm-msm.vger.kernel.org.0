Return-Path: <linux-arm-msm+bounces-49446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97AA458E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DF9F16D585
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8134A22423A;
	Wed, 26 Feb 2025 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQmWXoI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D987120CCEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559892; cv=none; b=osEQmUrhnNjLDu24PUe9WDkcumALUWUiIWT2tETQIyJu9ZU2sJWkKMPfZXRoYmmG0ZyFsugqeerRaQQ3iRhoagAIeAjlZbSghxJFK9bCspfx32deM/9iWLhyD1j8jODUXvCBHSxrDNz2Mukd8EYKbiOJTJHnCgQ+LBqsLOdFino=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559892; c=relaxed/simple;
	bh=7+mRjbFyGkkwleiZgQV2NLhfIkvCmnoAupYlD+d5k0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjTYnW1z8GO4hAmt+6r7oktXT+5Z2QabD/R8gRYYjFJT9Z80wAS8UkBnAJxg42AvsbjlxAy/CQvfquDX5qVrgvHOlUh6fH+NidtFsTqrXuH4cc8eA/T41LRPp3mwMTAdwymSXGZCHKcJnxgNXBzFJ1x085R449R3D9oSlWnc/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQmWXoI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMYH7q009609
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4VjD1sYyFXT8PlD76ASHg9J8NL6hi2pojwmwarL05W8=; b=GQmWXoI2IixbtGY8
	zaR2J/cz98+uAzqiEWqyP/XRpyLdcNmQ0/TocjXj8LWULwVt6ZVpvpI1wtzI0eCj
	JRE3GjzOcmvu2OLaIiQ1qMYia71rGty3FwjRBCNz3MjggXzTlEY9TCSRq5TWCYwr
	KMk69p6NHv8jUbrox4ke6xGVpJ/Kl0wziC+Odivo9Vn1C94XjvGiaAgbTKUvd1V6
	hgSUhZv1ij7og/m36lxCBHVOCO/K1r5Jf8Kc8cVm/yPkFkicy0WxIjXeo5H4522P
	bGTyy/jumwS/ND/oZCqvH+Y04szuMPpBm5//3VOmRrWvQbtWkiuIFqbgoEzOdJLM
	OojtCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmsafy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:51:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2233b154004so860175ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740559888; x=1741164688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VjD1sYyFXT8PlD76ASHg9J8NL6hi2pojwmwarL05W8=;
        b=Dwuz3ukGfDUqrYL2//Ss9wHWhPxslHtgiUiSeKhXBsjCi/ldPRG0LowxHeIkze6+tE
         y1DTUllKGqo5bpFEsSQMl5XzcIFQ46srTHlJo9+bSJR1IHlJ/8ew0cqjctGtelWqpvlU
         VEA0N5VnVKZPZVwf43ZKCBYRwmP0a/08W58CSPcqFN0GnJtqAJDd8pa3AXUnoy4FACK7
         jg8F6Dd+TVewtn7hHvroUpjJOCYyvZ6gYTglXyDJ/6YobR33uJGWKbtciKuvjA3MCLSV
         nThz7opepbME0x0xYVU6BmbSyxuH8IQay903D0a1dDEZ4VflGsGPcTMxLA7VvI2FsMWJ
         xkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY725sEk0fRqo0sfHMyMXMZRoJ7YRIv/GmNv1DNd5dECEo+IXcLWCaMZHCxkLhPHuxL/IjOA3w5g9TeeDU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw936lvT8g4MIH5vumRphw0InYdEr5A/b9TZ4N9Q8fFt+sf+dak
	doDOc7rxoXePz6hJa+Nvz05ETorwHYVgcuWQ3VBde28fyqCncBZsmSLRS8Sm6k2WFCZqjqcr3fS
	dD0BVlcwpLN4Xnrw13Xe8eoyyiM8y3w9v8lEyXMSbliix74prcyx1eIDlmYHI6jFA
X-Gm-Gg: ASbGncuRD8v+i+xYmKVumjsBIEbbAFd8H/ZSSDCN6kx4Rj1n+IJiiyEwc5DCba7gwo3
	L7wfC+Yj/inbUv25y03bCjuSlmB9K9MB+vbviZXoNTDNT1xUxnndPjEGiZnMxT/APWwd3fxyBoL
	xQDAlQIB7LPW/sj0LNx7q+EF8ZTreX/lmrKvO1LBneZW6NvQ1XgPGsmrbFq0HTrExV7iQoSyVe3
	F9COoWy30TaS9zJYslMMry/WPQalTt4gcSYHdYGmouZ4cSHYQ5OPUE0w7aDAtTDSYK3XdL8ZsPn
	zcX1o/3y43NFWid4Yc4+i3hL0Trwab9ri5if/gHf+zry
X-Received: by 2002:a05:6a00:188d:b0:730:8a0a:9f06 with SMTP id d2e1a72fcca58-7348be46522mr3841045b3a.16.1740559888167;
        Wed, 26 Feb 2025 00:51:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyOKbTj63fRQ3DOeiJ/Br05cS3kX5z5jN+WYxVkMhS0rQZSOJ82JrbY+gclE5cbOxV4EvLxA==
X-Received: by 2002:a05:6a00:188d:b0:730:8a0a:9f06 with SMTP id d2e1a72fcca58-7348be46522mr3840996b3a.16.1740559887775;
        Wed, 26 Feb 2025 00:51:27 -0800 (PST)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda7e84cc8sm2693368a12.25.2025.02.26.00.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 00:51:27 -0800 (PST)
Message-ID: <8e1df0dd-d92c-4355-888e-12d7568a083d@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 14:21:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/5] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen3 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, dmitry.baryshkov@linaro.org,
        konradybcio@kernel.org, daniel.lezcano@linaro.org, sboyd@kernel.org,
        amitk@kernel.org, thara.gopinath@gmail.com, lee@kernel.org,
        rafael@kernel.org, subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        quic_kamalw@quicinc.com, rui.zhang@intel.com, lukasz.luba@arm.com,
        lars@metafoo.de, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_skakitap@quicinc.com,
        neil.armstrong@linaro.org
References: <20250131183242.3653595-1-jishnu.prakash@oss.qualcomm.com>
 <20250131183242.3653595-4-jishnu.prakash@oss.qualcomm.com>
 <20250201113358.565de2e1@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20250201113358.565de2e1@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -Q27Kw-gwZH9MkO7eSYyQ_7KHq1DeaW-
X-Proofpoint-ORIG-GUID: -Q27Kw-gwZH9MkO7eSYyQ_7KHq1DeaW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxlogscore=603
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260070

Hi Jonathan,

On 2/1/2025 5:03 PM, Jonathan Cameron wrote:
> On Sat,  1 Feb 2025 00:02:40 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> For the PMIC5-Gen3 type PMICs, ADC peripheral is present in HW for the
>> following PMICs: PMK8550, PM8550, PM8550B and PM8550VX PMICs.
>>
>> It is similar to PMIC5-Gen2, with SW communication to ADCs on all PMICs
>> going through PBS(Programmable Boot Sequence) firmware through a single
>> register interface. This interface is implemented on SDAM (Shared
>> Direct Access Memory) peripherals on the master PMIC PMK8550 rather
>> than a dedicated ADC peripheral.
>>
>> Add documentation for PMIC5 Gen3 ADC and macro definitions for ADC
>> channels and virtual channels (combination of ADC channel number and
>> PMIC SID number) per PMIC, to be used by clients of this device.
> 
> A few really minor comments inline given you are going to be doing a v6
> for the build errors Rob's bot found.  I guess this is racing
> with some other changes.
> 

I'll address all your comments in the next patch series.

Thanks,
Jishnu

>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---


