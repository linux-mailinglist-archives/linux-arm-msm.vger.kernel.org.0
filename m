Return-Path: <linux-arm-msm+bounces-62905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E501AAEC781
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 16:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E9C117F08A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 14:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2AD194A73;
	Sat, 28 Jun 2025 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMMjvxsB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C52B2110
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751119264; cv=none; b=qskGJWV5mmJr47mB2mGUDQqfIUjZvEkXilbV8Gs+rBaxXYqmh5P4LW6miBDZSOqZ9ZPshOnEJ0EdzLQD1FtjHRtH1CePxSgFM8V6p6z4xCGbhV5f2FYOkiA7A4XDbc77Y3u/zjJDnxyUIvb+rHB9ZjfmOUbTwVHW1eHzlZTczss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751119264; c=relaxed/simple;
	bh=zsnb5IT4Nu73W2mBBV0UdtW39RJlWO97Dl+DazBOnfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTQTlQi7ErvXsA9lGcZ8vT6xqH16UTEl3DrE8jo8FCygKCK8rYGFGEzYhL/cYx6FZHfRycRdOmKB/1DBX4fTfZqlK8xuSKElxTzMLUUBP0jthpI6DdvGYawrsf3c4Ir9wlhmk3mRGE7/YUCR6cR1vfbeCTkIgq0Mjn0taPJ5/m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMMjvxsB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SBVG8C016475
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3JT6wnm3HmMSxPGvGdApEvmBmbOzlzJHc7HEBGLfKs=; b=dMMjvxsBPlLz7znF
	TyRro5S4OTjqx6mNav2awMV4rKk8IizEeJX5jI/W85puq+JPB/2vYVw+f5jCaYkJ
	Bn5KtLfE0OHjQqkiKuN6Ht73GvcydlfDxGVZSZYLbnPooHjHCAPi4bVrB0PXnm3P
	8zdwPX5SrEpo0+Cq5SUltCZQpwFa1xfqMeqpVPaj2k/+A7Utz+4uh6DiidfFKMh9
	8kYAK+k5wQ5X+eWVcBRRNIw60QLruk00nuzKgh50oBG4f4x90A5opYRd5wub88lv
	zkEku+rFxDtASDJW8nKrSo8E3BJ2x5toUzvN1JpsmdzWxKX3oP2vDmJyoROjXbcf
	XhG3rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9rskv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:00:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5aeebad31so7353811cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 07:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751119255; x=1751724055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3JT6wnm3HmMSxPGvGdApEvmBmbOzlzJHc7HEBGLfKs=;
        b=xPEZ4+M5R9qkgmPjh83rN8oDZBUK0Gm4+bRcZLHGB8GGyOAIU0PP+MeFJk0jM/UGWF
         Ad19+5YuqPQGPC+BljYxs4kHu4pBQQ7a/55++mlXlg+pkDSKatkdyRq6KrDHHJm/ZFRQ
         GUsrxd9PnhGRnc6CUmh1A3QNzcD89qnxGZ31tDaA9qQR0RNEfo6y0PHm4LGeG9BS03wg
         5Bq4zqT/JeeNPVEzr8M3t+5OWomN+HWar5xklFXMwfx6beASa8XwqxN8Rm3Q4Tnz861U
         5V8d5sO0y+6E6GG6TOGklZarhgQnB+464znH8SnrDzhWX0V50aDE6auFzxdRc4HVJPlX
         L2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/XoDdgjIKyms2PaJdDeRvWl10wSataxvwMpleyAN83RZ4KynVZl7+346Vl+lHiSxqyIkEemvZkTFF1jXd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd06uiaSIbgspnSzyHDSEctbPv1IQh2mzyK2U1LhpT3mv+wcMm
	xylZdgtb6nJC/gCEQ+JLYPfHnYwpdYHVv9FQNBiyGbPPt7JUwd74fI4NI5N4LkLORJrW7t7gz47
	gpzxXKVN3XbdGFPWQGm9bLKGCiK/Jm5kYirmeysArI4nSiHKIXvsFWqOw/Fhyd4rj6Lfk
X-Gm-Gg: ASbGncuQ9eeOBK4qcTL43Mkl49w7BJQyrIfmOOn6B5HHpmU4r1kB+LlbNifVTaeBvhS
	zDkXXR8fAj9M4lDE73nPgJd/mSgoPXIBR4c/dGQrsAXA3bHDrcojANgwJKW9n9GtKK9xQiqWxyF
	q2AerKbSAQyebebpoI/h/0FxjW9lWsqnoQv6TbQv9wpSd0XNOEjJdG7tXHRz4T3bI7wNf2KO8pa
	6AnRYrwZgZ8o+MXh3IQPk/5U7LKWc9zszmxxsl5uyUvImVrWGIghyohOn2E5VhaEesZWKy9MwDZ
	8Lh/XgPNKxHZRiSzwuls0zkOXmSzM4Up/BManR1JOYFOPbgf2JztnT9eoyftxDRa5Cqe53zUNNU
	BlHU=
X-Received: by 2002:a05:620a:2729:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d44c24928dmr146913085a.8.1751119255363;
        Sat, 28 Jun 2025 07:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdQ1yZeX8lDjDdM01e59r5DUWZcp4ZcpJ6o87OE6ncVesod8eJLazoWlAAUYkOLQCQ3gI54A==
X-Received: by 2002:a05:620a:2729:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d44c24928dmr146909385a.8.1751119254533;
        Sat, 28 Jun 2025 07:00:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0427bsm312587266b.84.2025.06.28.07.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 07:00:53 -0700 (PDT)
Message-ID: <19507b60-ef03-4fac-96dc-f8700f74c0e1@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:00:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
 <b7mv4u2parcyzrm67yufuor3cwx265kaoae23rksbbuu4aaayl@7a6xxfmganof>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b7mv4u2parcyzrm67yufuor3cwx265kaoae23rksbbuu4aaayl@7a6xxfmganof>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDExNyBTYWx0ZWRfX5ppjhCHyHiIX
 LabhMCLG8zUYZIws3SMZYVRIyLAxY5BErJW8nBUYNh2ERiWXxD7y0sOflptQh+vu9hj4QRgB9As
 zo0OWeAuq8eMFFzPkNJQPdjO32kEWAuinM8AYjkFIphr8XHkM65qWxYtRnmBGd1lFrn7oGBt1G1
 SBvF/IWyqxS0l8/G3wCho244qdwxjSSqUGAwyl+wnlu+raAoxNi20Aw+DEAr5wi3aIltm1X9bbx
 qOlTeYMwmH8fvq8Rs13pMuyu3Se4ZkAO74WeTDsxKNkyjkX9U0fIwKvX+dRXRQxiZDHjnUwXEX8
 gTrp7zTis3p9RoFzISoOqe+x3jVPT52vJmy9Hss5gJClyXZTll3kbtLyVhpmG01V5TrdB1YgLGs
 GPWTBqySPFlnWBjK+/CdGEYbxDX9Hedj+CVXZvItQJBqYhbJjoJD7JD8vWnMpk9o5h9vGIqY
X-Proofpoint-GUID: Mho3V3Kw7oOwWfDznbgXnD2jNI2TWukH
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=685ff598 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=QAmXqGSAIpqigZKsxncA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Mho3V3Kw7oOwWfDznbgXnD2jNI2TWukH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280117

On 6/28/25 7:44 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
>> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
>> as read-only for HLOS, enforcing access restrictions that prohibit
>> direct memory-mapped writes via writel().
>>
>> Attempts to write to this region from HLOS can result in silent failures
>> or memory access violations, particularly when toggling EUD (Embedded
>> USB Debugger) state. To ensure secure register access, modify the driver
>> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
>> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
>> protected memory regions, enabling reliable control over EUD state.
>>
>> SC7280, the only user of EUD is also affected, indicating that this could
>> never have worked on a properly fused device.
> 
> Most likely SC7280 Chrome platforms were fused differently or used a
> different configuration of the TZ.

They were not fused for production, as I understand

> The question is whether there can be other platforms (e.g. SC7180 Chrome
> or SDM845 Cheeza prototypes) which should use direct register access
> instead of going through the SCM.

TF-A currently needs an update to the SCM MMIO R/W address whitelist,
but in any case, a write from !TZ is not going to be accepted by the
hardware

Konrad

