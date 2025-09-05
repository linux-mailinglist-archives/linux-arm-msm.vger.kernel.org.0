Return-Path: <linux-arm-msm+bounces-72280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD3B45752
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24A1917C387
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069FA34AAFB;
	Fri,  5 Sep 2025 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0r9UQ4C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F07934A333
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074233; cv=none; b=EVEE5qWGKBgDrg+K1gVCqs8rjvuBNBTtAKDPzSKCXR22C8pP3dqeJ0zGlgmaRgsghehkY+nnGQ+xlv3iwLDLxnN4ThnMYuvm8Bt5b+4DF0PUh6Suphb9SYzSCnIJ+KZ6ze/hkAOV7gJFkwPOeTR+IuFeI2N0HCeQNrEn9MD3qvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074233; c=relaxed/simple;
	bh=ErCJ6Ql1rDMt2vKVLJW9jn9Ni3tpQtFY2dmm34Q5uBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7+JNWFlCGbODU+tEYpJv4CrIWQWlSOyW8ZIbDrJGD/0CpcA3wGKOETnUsWnUMyGSki7CLgo+MH0orgm877BBfdPUkoIyYXtecfd/I4pL1pgFoUqegDLZjulkUt0abI4DE75g34XeqhUsB7bBsjC5VY/DcmHBWxMVE1gjwGRD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0r9UQ4C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857adem012043
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3CXvHZCGtK3JzFKnruevi9kzIT/zr8k7RvjkNKrle0=; b=m0r9UQ4CLWMjutZQ
	qETbEc2XdgjwRETjCNkkIMt0KynIg4Qxw3/QNyNYNWIoF5s6EQK+MmTf8jkzQ1KK
	SlRMk0Y2Cn+TAsMW10hykObKOX/tZ/7PRIJ7tLOoNGnN2dZOPm7XzgnJKyGOVZmn
	FC85p/oGlW/yqEQvbmqO7FTO01Wu5ktI+iuC31bDI8/ydyfM6taqlZaAw9dwc+P/
	oxO2b/8jg+eaF4roRMEgRimjFezbnlVumB4ywh+Sckr2BOFj5tMpQKwOK1v1VuKy
	T5Rysd6oAMP0z2HdnqLBFPgfl+tgqE8TIyZmPkO5h7HZHYWi8LupJLaQ6Q+ORNds
	oCOtlA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj7daw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:10:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b307e1bef2so5829471cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074230; x=1757679030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3CXvHZCGtK3JzFKnruevi9kzIT/zr8k7RvjkNKrle0=;
        b=EnkGzFTRhAOhOdfI3kz1PU22AnicPYldZrgrQ0bkzKz3+Du0SXosfOB9tJTVH1lALv
         xB65RkNX6yHOt5UbvwMDyKNXQLRAYnsxfzf8INtjSZtTwm6uS8qj4RUy4KgY78wnxhSd
         XoqIKl8Uf8GL5bcEWZE2lWfbanvXC25LdNXyzbM9cug2bvP2Be5MC65TmdPE76Wb2kx1
         pfh6BnNd6wQPvcojsfswGE81LoQBsKlWs4rjyINuYKnVcL4C6B7TVQkSxS/vrP18WCZu
         UfaGbmnNfh6fufzOlBR84v4UuDvFSm7CaNfH8cIfi/gZvG8IW7+AfwcPNJ0ta9KYGNvX
         yMgA==
X-Forwarded-Encrypted: i=1; AJvYcCW8BLCOciEumVO94m8wzEQG/qPNwGpoLyLazEmYQnX5L0+GnTIvpZ9Bk5pASz/CgUvjBXh9K0eJN/Z06Cta@vger.kernel.org
X-Gm-Message-State: AOJu0YwEoLCH9Ua6U1v7YFQpWzejp+ZVpoLso/towEPS5WbavqZVNNe6
	dKM+bhz7y8zGdmXJFKAyECZA3cOZkxdE0fpw27TagF1OEi8xygAh9juhAuBa0ez70P2YeXqLtqo
	+5TTdIW0GrUH8yFoxV3cYgGHYK8K77DLAy8EAjGeGQcO66e7QvGAdDAQtVZnRi88zQHoT
X-Gm-Gg: ASbGncunAl/kjMHaX0A4dSqrBTOBtyXZrkvH6tVyvOwTOzcIbjmu/6URsGZgYXAQ1Fn
	aXSG/cX/9+wl3ouQPAOnxOkRz15EOvZo/6k48yGJehfwLDGoslE/jmoBk23JGdUVvbS3vi1n8Y5
	WHAUPVo/7VZ9tQGkL5t1Hqp/3oaMp/GfVnr5G+Q2Pup8gBUrLY+k4xTAeCqAz/iuR+uFhMAdmuX
	3wPRJNzhZMuNdM+5yDVLn3hqQBIV+AtseUJbynJH7EyoIAZ7H4+FwrUcfsV+IXquxG+r3InEiEe
	UfQuwwQwdiV7OskmutczxMg3yHAS8MEHtHT3j6v8jzZGSGf5WntQIBYQB8GInsEirFGLAn4c8hF
	yC8x3Rw3uB1SdR+2l5iix3A==
X-Received: by 2002:a05:622a:11c3:b0:4b4:946a:df22 with SMTP id d75a77b69052e-4b4946ae541mr79001991cf.9.1757074230289;
        Fri, 05 Sep 2025 05:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/V1Ut9FoAm3PMIuMlaHnEJiGeKOqT+3I7Y49huAY9u92oCVKu3lzCxSzcPEtH0e3dxFF09g==
X-Received: by 2002:a05:622a:11c3:b0:4b4:946a:df22 with SMTP id d75a77b69052e-4b4946ae541mr79001621cf.9.1757074229739;
        Fri, 05 Sep 2025 05:10:29 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7caesm16131666a12.9.2025.09.05.05.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:10:29 -0700 (PDT)
Message-ID: <a61d5e22-6a0b-49df-a203-aa408856cf43@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:10:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-12-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-12-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX5T/3XL+8n27P
 YiNW38BS1h9H05QldbcdWnwodco90yq20ok5bhXivVr4wiwm72kiicml2HC0YNGlGBjJ3oNpis7
 3fByC3sGdsACjJGuzYIXz5Jh95dsg5hrkk8L4HXA8HBQlWhfuqUCLPHiQjzAua428MsRxqPddeg
 Ptf2Wu4ro1on4d4zJU2a2Z8rdoCASkM2RJtYBNWACjASbGsYXzqLXCEYunUKMVz7FPVDbXPu3Ek
 RdHw9E/FtHfBDWqK1E5GPXFqS863dCKdDarx2hsuVWXgVUL5q9cqCbVV8D0PHPntFmEOuOF4MqJ
 DIFwrvSO6qyJrCLExMXcSLWwv8gohSGoqLmm9y8aq3YfVJKRO1w4a/XLoi9P2nPEuhwbZ/w84/W
 TUW+gvYk
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68bad337 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=eKh8lGy-H4yf2MGC_tcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eekK7bT4RFtdefQto55hzHiu7uWSPvbT
X-Proofpoint-ORIG-GUID: eekK7bT4RFtdefQto55hzHiu7uWSPvbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> 
> Enable the QCA8081 2.5G Ethernet PHY on port 0. Add MDC and MDIO pin
> functions for ethernet0, and enable the internal SGMII/SerDes PHY node.
> Additionally, support fetching the MAC address from EEPROM via an nvmem
> cell.
> 
> Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

