Return-Path: <linux-arm-msm+bounces-88474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A312D111CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4B8B30590DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADAB33D518;
	Mon, 12 Jan 2026 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4ye38CG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LP74f7Cn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E0339853
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205563; cv=none; b=N5F6idgsnHe0BI5BiVTm3RJ3aEuOPP71hELTqc5mGq3BRfdvi/hl5ow2rTVJlYgbvpNxBobVwULhoyycgmoKOdvYJ+YP4t/kDTRvrhBKX7WggWexXooT/99XMTmC8/6u03xoaC1ikFQLd25NQ2iUiMABnbU4vIQpHZfxhCMp/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205563; c=relaxed/simple;
	bh=rx0ADWPbBZVNrxl+ANiAoIPEVGVu08ColIVNI01q/D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INO+SzTs3qNd16P9Y2R3x3DuLrmF6apP77wH92KQCjBmeTCnUqYM2C/4Cvq3wsXwCpkTd32ZALzB7mcIV5KybNiQ8NsgJRRQueg2WWB5Us4Ov9EeoQZ5UgFYphBJORBkbmyw5eqdVQGHMXfKUQF2Q9mgseu/XaTcUzWE0z6Jf24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4ye38CG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LP74f7Cn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C820p8141546
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rHx6+7ciUL03i0guL2Rb5hTvyVpZI0F9UvqFX3NlMQ=; b=X4ye38CGzEodNziK
	OHj0XsYSnCzN0R+Oi8KaKmSSYUk3WF+KjgVIehras7RQdCzJcW52EHfDM3yjpAnM
	SzXYpXYcIaR6lGVDKF3EF96LAt149rSzPjjj/lh9LXrQODoVqnMl3fajMyclKJDL
	QTh56BH/Mc3hZdaeJFq8fKshIxZk5mSpmtwfdVuOICyIUcBOCqEW0ywvEZq4TvvN
	Xii9bqOLIFKJXurd4m4S7niWW0S3kJw9tsC6Dx+cPTT9yaW74aU45C6XjbgJIvpR
	HLzcmQemUEOZaIFq6K1t+eH8+rreePM6VPyrSWN9HloOct2AteeHQosMNE5WpTEI
	qar3ww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyt658-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:12:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1413220485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768205560; x=1768810360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rHx6+7ciUL03i0guL2Rb5hTvyVpZI0F9UvqFX3NlMQ=;
        b=LP74f7CnamwHllg5gP7qd/u2orWUpCWOPDpEipGgBCbWNWmVI9t+L8J0PTv91XV7CD
         W9v/OBhelT9o+y41gFqRgAPPvRY6MpZGU3cqrDGLVmVQ/BKZSyw+IzTH+MIDk4zuFl2/
         8DIqhPZplCRMPiRFUPTwg+babNKjy0+0+SxJchAg9TXwIWB2gYc0+lw9BSlPehWNnozS
         8HXyhWJh4xnK7uTdfXpOv8vjJFvrfy2EU2XbveWctpQrIKiIrOjxQwYcFsxI8we/vq6T
         41sJtHTMPPdVaV2WipkZkS4lXcdJ1rVX+zypnVS+JuiXfgdahyqC5ueAv31MoAlHOuM5
         G6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205560; x=1768810360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rHx6+7ciUL03i0guL2Rb5hTvyVpZI0F9UvqFX3NlMQ=;
        b=HhzQiEjQJwLozJLwBWlg/frmmbOoHAEkAL3l9wRdo+XEsqgspt1N7R0p4V4vcBfSjR
         6a2vXIPC98CEWjhuvvs4aAGQgqfvEv7XDOGEWbfWmqZ6MfNU2I42ahIUR5zFuuDVPw/J
         uPKc63RribLXR+Xn2/TAVuYBZ94/BIdKiVVxN7BXnRgUqbG1XkHT/lxQXIyG0FfDbcu9
         4ln0njHgZo3KjRB94NxT3SBSyldgAB9ru9XhWrp6mngYqjjk8Qgf+jjPl+Jx9+WQhcjm
         nZ1FnGJjaxyASw0hnj8BDASqjfC719wYxN2LerrynUIc7k1nvd2sXzxOog3O89bJAaBZ
         PmAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqvmH9PaLZ1HWiYMCvcvsqIy2ssTjW8EQKzr+qpsQvZ0uC85hm6ckJkxmRYlmq2NWqHreH7cy1pSbd4cCW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/JWr4smg2ccPrqdAe1i6Hwg9aRO3MjqZcIMu5fHut8lBNbkN
	HmR85JXAIXv6ZMuMvG15Nf14unHtCi/Lqb2qbuVsZYpUQ6ioh5wnhIWelP/Mkdx729R4/E5lBN/
	U/n1bbKkbWJWZheuiVqZ4Gu0oagW8SnxjQ55yU0CV0RWfk7Oy1VGjWSBs+vGoLyllrPtg
X-Gm-Gg: AY/fxX6MJNyzORgoma6YDylTDY5ftAjSHCQAE/7vys4RqOwz+5+T6N8+rzBOjCXqnM4
	GgfS7dBohoqt/9O1sd8SRH2V3actN/G33p4SEiX0juwsVRlsb4X0AtOPT0e9DA+lTIHWeRPTDyV
	M8OdCL7GSwsdEq+vIYvNEdrnpODS5/oF14RXLF+GuuTP4ncLNuEUXQDEMAF6R6XlVBhTcJLQLda
	2fLHz+mTsGpuNuV4rrVBBrbTuDmLg0kXrzkvSUkzz6iKgjVNWVS74phcZh8Xas2DfTOVwvzBNsD
	3X5zPHC1izDTXyYCh9Xm834Vui3QNeDjvljhE4tDrOHVuJIDU+z9ut/0SaGGj9aO1w+wZM/Mr78
	5FDJ7oUrMtRBOwLhOheTlllH80w0XizC84Ifs/bPYXlPPzhEGgRQeHi79f5iOWZ/YouuOyA5C
X-Received: by 2002:a05:620a:410d:b0:8b2:e9e1:4023 with SMTP id af79cd13be357-8c37f51e74amr2685763685a.27.1768205559713;
        Mon, 12 Jan 2026 00:12:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2NrfsZRvfllfTvbqNJMiRjjckaOgHj4A7nBaUlmjO6oO55LZTBcoWtqvhlqCGtQv6Tza+eg==
X-Received: by 2002:a05:620a:410d:b0:8b2:e9e1:4023 with SMTP id af79cd13be357-8c37f51e74amr2685760985a.27.1768205559334;
        Mon, 12 Jan 2026 00:12:39 -0800 (PST)
Received: from [10.111.171.88] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a97fesm1449875285a.4.2026.01.12.00.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 00:12:38 -0800 (PST)
Message-ID: <699c570b-6b0f-4547-988c-850b8f0d57d1@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 16:12:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: add support for SM6150 camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-2-df8469a8343a@oss.qualcomm.com>
 <63205098-76fd-4a85-b7c7-c0ddfd974693@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <63205098-76fd-4a85-b7c7-c0ddfd974693@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8D9Mk-4dT6-NdSSpXCwjT--vRWw6BkUx
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964acf8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jlQZH_QiD4FEkZ2AKb8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8D9Mk-4dT6-NdSSpXCwjT--vRWw6BkUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MyBTYWx0ZWRfX2x0MRq8hO84O
 lSvrnFX0hYD9kzW59mMHa68aw+kFPJuVtIcxTNX4NtCaIJLrXmyJDGWpi3zm0f5klORGPB9p1fA
 A9kJfXUsNgRMdNVMWKS4/dRlzR2gyyID/83epC/d0BD+xvEw48BjUPWGQJFMe3/h++7T4nx0k9y
 acG0c+WmnAuU151vV4BvdRK8FOabLQ6HvC4s1Bsr9eMB4pdQn61cgMFnooH0g71OJcoydyiz41Q
 7eitHeio6N/0JCmiGVyMDHysLbhE+pnNULt9SMzIFlIjWnWLycffDywyj1WMUQxV7Nj4QAXLvdc
 6neGst/ala/u3Ey+B7eVTcklIQWXrb8/guC+NnDhhf3/0t/zTjO9IkXwxJwMhEkQUJRQm1zjklW
 VIiBQ/LYPd6DBI+CFu8oy6kWgRQVxGBna6D1P7+YDMLlVReQaJyuZLIOHbel313OdhlJ/1wdKEF
 95vGTETZLJtrPgcfAqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120063



On 1/12/2026 8:34 AM, Bryan O'Donoghue wrote:
> On 22/12/2025 08:28, Wenmeng Liu wrote:
>> +static const struct camss_subdev_resources csiphy_res_sm6150[] = {
>> +    /* CSIPHY0 */
>> +    {
>> +        .regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
>> +        .clock = { "csiphy0", "csiphy0_timer" },
> 
> Not compatible with your own patch...
> 
> https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1- 
> wenmeng.liu@oss.qualcomm.com/
> 
> Dropping, please rebase, on your own code ..
> 
> ---
> bod

Ack, done.

Thanks,
Wenmeng

