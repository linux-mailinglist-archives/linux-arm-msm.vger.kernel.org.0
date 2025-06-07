Return-Path: <linux-arm-msm+bounces-60509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20112AD0C47
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 11:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6E11702D2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 09:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FC820B807;
	Sat,  7 Jun 2025 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7lx1wwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0320AF67
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749289584; cv=none; b=blkVOD/aJJDqJvhKSzSKCb/lRIs8+myHS6JVGUqBvaJlrWLMSjrNZKJjZxa8MjdSjQ53DpjMf5P4TJMKVMkSi9WCC4XocrKI3LD58szyOZdW7+SRi1K4nri/kGOu9HIo5SSYveGCtKmo0M5ja4qx2bxDZ2rIVVYxdpIaqoIkBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749289584; c=relaxed/simple;
	bh=RTIekZYMXT1HPwL+6JH2s6iXA9/KsXv5nouYl86M74U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4zod+qUXA/nZVpp7YlxhA36UCukyxUzrU3W6u/pt0FbetaY+Njw9iZMeWor8jLhBF8jUmpV4By8TvuhHDUvaeRTNBOPHY+9Vf2WKdDFp7Tow2BpC96MC6FwB1Zt9VUOoy2urNYMwNl/hDvzr1DwGsrJP+tkwhjE96OvZJP3axE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7lx1wwo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574eXCV012287
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOT1OH7Zs3RcqZzob/2wXtn6yUgIoxAj6wC5h6Z407U=; b=T7lx1wwoaYXYXFZu
	PWnTFfTJK53Q6R96BuWU/Vh70ppOHy0+pWHqAhGzxsvO0xQuCRKh/W4x+77rE0e7
	5KQfB9DiuhUKr2lxytKI3eP6fbnU/din7Ia8xVTf1l2il4BcF3JL2hT2X2PTNRYM
	X3kk7PUddjajdjxFZbwTRidUWCOb4ZyhecP1W0dz8xAv79OgM5GKK1V/HAcUsdnl
	pgvBpl8ilmWnew9u6KHuRjKJZzahyBUwCos3eAD0+7NDYEk8FCO/tJ/+QfxWJKo1
	NN+wmNmm3MKaGSxq+hH8N5WoTiL7HqQZgs5IYjUAuWNQMS0IsoYhY9o/f3gJsggo
	i8YnWA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpgau0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 09:46:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8aa327049so5785106d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 02:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749289574; x=1749894374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOT1OH7Zs3RcqZzob/2wXtn6yUgIoxAj6wC5h6Z407U=;
        b=Df2SC2sPMgbP4lQPmkMpp8OtqrRfZ2yhnIrjgNhcB5bFJ46KdheweYVy3fTRll1zzR
         W/cuqWUt/cSE6DvODsmzCCVuCyTr1StWIhs8Fh/44g1irIAAJ6bSwp2FEf6mWVuYqAbw
         QQouxqqOEiUrlmIZmu03E7vn+4/x5zeNy8ioDq7wwdeoKdbAJEhgCDhhlbZHhbtzaMt2
         LL/HbK16UK3wiTi2IFHMnUPL/E19sVEWfi6OxS7eM+KEVAB+fWcgnf7uJ619qNDKVQmn
         J2nekjFwv9Q+Vs489bubPXGJNquYJ6MYt8UcX4NXZdFuiDbP+3zl2M4cNqMVSRTFvGhV
         IADQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWBzdcCw8VXQxdEYOhhaiBxUK0bnziRKNJGH/WJ9JZ3XZZRN17VqnHtse8/CigszlzeOHCnXvTC2OoGQab@vger.kernel.org
X-Gm-Message-State: AOJu0YxGkMFh1w/2AV8CW8WIAZ+Wf4y6dI0km0v/dYkHR8wPauVtPMHt
	VrWignff81klXEK1cx+HqV6DdgQuLW0gtb43M6ppKZGdPmzGsEEPRkwXz7l0UxTp0BacS8GsCyF
	3LoH8t0yaOdzYyp7On35yj1FudeWwTUyhL8Qpj42SBNiaPUARmjKQDTXiNdyFGub0zOSY
X-Gm-Gg: ASbGncv1oX4q6IpxrmUbv98zefzm1yvD+ubsh2Bb6RsEeEvDu/ExwCNC+NY/pfuAI3H
	74kyPx8G9MsDLdW9dTxueS8uuR6uLHy9jsozErFCvjZNbBZMMOLMkyzzJie9nmMtTx6DlOYmTGY
	0ZrqYEDmygC5Fn6iAxEhsNM/dNIbvCvN83ZY8SMPw31lr+s08m+k/XWp+etMfujYSntKkOMFKeB
	ct+MgnNZdSYk46X0CymN6V4g+qntAjLThCLT2gKilc569y8VHIETS6fJzpkaXVkSc1/dJeIlipx
	k+elWv3qdwG6hrQUuMrQerPW6GRph6Nn6pA50ZNcPF6uQycUpHXS4926nDy1f1plyw==
X-Received: by 2002:a05:622a:ca:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-4a6691b6c5emr32043911cf.12.1749289574331;
        Sat, 07 Jun 2025 02:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwWPtI2+ioHKumywO8IMNaOAQ5iYNQdemythHKIGMF/B1bpE+Qxn0ZZITwuEqzQ+j9BmQlPQ==
X-Received: by 2002:a05:622a:ca:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-4a6691b6c5emr32043651cf.12.1749289573920;
        Sat, 07 Jun 2025 02:46:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c0581sm2174164a12.51.2025.06.07.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:46:13 -0700 (PDT)
Message-ID: <219a46d0-446c-4eed-8809-4f2400de0ef9@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 11:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
 <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
 <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68440a67 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=j_8uj707ZTFaWRZCUGIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA2OSBTYWx0ZWRfX5kda1JTqXlT9
 Q1TtO75w/gFhxOLQjR9N/ZDb+mJO0sw7ScBg0LDMEnqefnRR7Z+jEXgDg6X6SXPY++Ukgf7pnVB
 uviFTZiNkWDZaQuEq0TUapV2GjgSxelWZz//m2T94xkh9LYW8WI/DFAGuEXvVaQX41RcLz8NVgi
 yzla/WzE5yr/NLMoARpjsra2lpxznkHTYoPc+Z4JGxHtCpKqCAv6EYLwcstLxc/3G1GjZPWaDxj
 zV4pKt/OlTmOf7qF9CuqOyDygc+8lftOWJ2e9CfIjcqlj+EgTtx+GX5nrDs1SC2WnhvTvj8nScU
 krSbDLlS4P6hzqA/JcqRRBQyf04gK9O9gPSakIYE0zmdU6cjTZQJeH9E5FPSaQFo2zTFav1Afv9
 YApAIbz+ytasSIClj70aWv79sNW2+cdBEhAWyOxSj/b9ZtDCsb+YqaF6VvzNuQcBRs4MKo+5
X-Proofpoint-GUID: QMkCkuMsoQy3LH871S1nAhIhMM5uIy7z
X-Proofpoint-ORIG-GUID: QMkCkuMsoQy3LH871S1nAhIhMM5uIy7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=698 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070069

On 6/3/25 12:37 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
>>
>> On 5/31/2025 6:36 PM, György Kurucz wrote:
>>>> Add charge control support for SM8550 and X1E80100.
>>>
>>> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works
>>> well, I finally don't have to worry about leaving my laptop plugged in
>>> for too long.
>>>
>>> One small thing I noticed is that after setting the sysfs values and
>>> rebooting, they report 0 again. The limiting appears to stay in effect
>>> though, so it seems that the firmware does keep the values, but Linux
>>> does not read them back. Indeed, looking at the code, it seems that
>>> actually reading back the values is only implemented for the SM8550.
>>
>> Right.
>>
>> Based on offline information, X1E80100 doesn't support reading back those
>> threshold values in battery management firmware, so I can only use the
>> cached values for sysfs read.
> 
> Which limits usablity of the attribute, it is now impossible to identify
> whether it is enabled or disabled. Is there a chance of fixing that for
> the X1E80100 platform?

Is there a chance we store that value in SDAM and can read it back?

Konrad

