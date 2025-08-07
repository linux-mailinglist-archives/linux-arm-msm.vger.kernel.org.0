Return-Path: <linux-arm-msm+bounces-68014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006BB1D85B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 14:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD2523A9EFB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3DC2566D9;
	Thu,  7 Aug 2025 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqHaH9ZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E62550AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 12:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571421; cv=none; b=Ot1/O9fu+xH9TOWhwbLbjIweQz0WFwD1ZTR7AgRz1hOwIet6KhnWWyWODncfO+921NglLKtjokB7lpGzth4JSlwEpzBv5PjHi5Ze97nplk8AsY0ZPFp0bxJH3XWzeC0XtLmGpsAQwVNdUQa7yQMTzLgTeZqKDtR/lczhFd35bm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571421; c=relaxed/simple;
	bh=+ti21F36hzIyeMi3iqLYoXGECEKA4dF5hB1/sbWmpNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPpIR9RtLVZ5Fd7nQ9JpBzyHyIPM8QLCi/VV1QsdY5YLOP7S+xnUyrgIOQX4q2/tzelyQLFpxWvCiP03Dmg+7O/Yl653o2is0SCSlYivD92/6Ajoswvh0fwzoUAocpeKQeH18RXwtaci1kQFj422zRvZvDL7WHSEILhOXRAeTn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqHaH9ZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D8hh003587
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 12:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rs/suGrOJP0BPrfZE4kiooTTaEQ8m0Lae2xORIeWkZA=; b=SqHaH9ZJWkJpW10y
	c0fiTZ79fUI+/4eeFZoqwHJn/LbUDVZ7Zrxo7ichxr8jG53VUxSFIBvCOZa1LpSH
	tbsHIwBGAW4VuCOmLK9Qg9XJgvWhJvuVBUL6QcrMYPnmJpa3Vd0lagG5jhPfCg0B
	TEFGguketGQPmMSf5ayc6NdgD6BzXyh6IZRk2GYKs2GTf4LW1xxh9FD0fKwRAzO5
	0CKJL96INsNfSf4lL+4mxvI9Ld/n/pSUQ6OwFkOYrxtaOTOFP7OtGjfbvP0B+oy9
	PNNUvpdJxi8wV7TOuheKGnYZnASXKsfcPkVGNheu/v70w7jqVfJwttY7BbA/iIMv
	GGiuEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyxfhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 12:56:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08f6edcedso3274711cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 05:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571418; x=1755176218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs/suGrOJP0BPrfZE4kiooTTaEQ8m0Lae2xORIeWkZA=;
        b=Qdo8L9Q0DvCS46s/TxliHcJAOX+o0vgfR5dkyeVvH+cJNQhWlS5CShdfh9rkuq6QTS
         PHReL0O5hBR0/0igWoJq9RX/PNJVrH+HaLoTbRR03hg/YXx6HgXKU9A/M9t8kXQ32QBp
         IydkmwncgPwrjjNQbwlkuY/jp74l5+ltGFhCoJJWEpumzgYqQW9j9oG+uJ5e+rhX2kZT
         BYPCwAQPqXw08Oy+CKEcFmYYLF4lG3QoMkO/GpCFtjxdBAJeSnIFFEpGc4BewTvyKRGn
         Nw4QtFeCSgUp4trEmdBO1GHqqzKp5b7x0j9h4yDNFUydyUDVhJbk1cYqbkp5F+iZyIID
         X1kg==
X-Gm-Message-State: AOJu0YxcJJBWIP9urnhKrDbsPZIr6OhfVsqCKLpcmr4hpOhOZ2uJD/dT
	Hak30xouK6Owhn+vLcawncv6/dLXZyA8WVUDGEU6QB/rKBlWDROp/7WS2lw4J6/mrEeP65IRF/g
	Tan23r9PBa0RBcY0xdZcdQrtFQi+YQ6k/gW+CUSpFW4F4QGbJNPOz4bYJ1ME3iHIqSJm3
X-Gm-Gg: ASbGncvnIrP6qip0isnqsPFyXwoYDRl8xRx0JROAMqrZ/McB0zQwBoUFQ415AqMnRoj
	IaoCo9b0rk7dOQxk19bd3L4PNf1v4t5z9YfuHPTt4vXS9CPDFhMuDDDW9SOW8WN1dzAS653W6py
	B5unKw9GwPhBOB0lM5+Y1PwCrZ1BlaAZPvSUSjQSPl440dXUI9VIXYnLhOC3A+6+p5lWcmdtDjF
	7KImSbIBi3+isdCdpQ7WSo7bC3DdPMKLQ0Vy4OaivDVOnKS2rsj75EjXHoefdl8FyAi2qvYiVzN
	f1tDzo0iGoBpXajVunkjruiO9ejWLRgKBb+zHlDNdXumTBAVTyxrZAl5FcuksLQB8+KiREP+ngh
	3ZrePcb4WN0mHNDUqCQ==
X-Received: by 2002:ac8:5749:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4b09135e41amr53229451cf.4.1754571417866;
        Thu, 07 Aug 2025 05:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZnomUsqZ2CreTcOGq6BMGfm1RnWr01IsDdTPln/U7H3ddYFyVhGlaxBP4aHtRcryBUJPKiQ==
X-Received: by 2002:ac8:5749:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4b09135e41amr53229281cf.4.1754571417408;
        Thu, 07 Aug 2025 05:56:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23bedcsm1300244566b.120.2025.08.07.05.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:56:56 -0700 (PDT)
Message-ID: <abcbdb9a-f067-4bd1-be17-fe11b24dfacc@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:56:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
 <20250806095828.1582917-3-krishna.kurapati@oss.qualcomm.com>
 <83c54b3e-8e31-4ca1-9ca6-31703211d507@oss.qualcomm.com>
 <233c62be-c0fa-499e-9f8f-e90cf0b23aa3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <233c62be-c0fa-499e-9f8f-e90cf0b23aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bMCX2wsjBtYgeGGRjl0VzgLtmBsqLaIE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX31tQW/ZhlyPw
 30EMSwyJLyDemF9ghf3KEnjFK3nz/DNrQ5zSzFa0uRfAHwcIt/qqmINE8m1XjO91RSxGwIRAfTe
 WV3pVp1fnl2lNpQt0vR6kY3koy28Blbg9FOUWXJpU6s8C0L55e24Vy0F4wvjWFxdS/4eAlCcO6G
 u55ifE9gn4TEC2afrXbFRY7Yc6kshlekW6Z37U2WqcV5UuX+8ZM55dWawzSoE7ZKnloEptLlTVe
 NfJLZCQwd70Vt5eYk8XladIXWfeDsPRxEu0oZJ2TiVFXb5sCCRElRRz3cpnkjrQv0jMK1XSwlWx
 XQPOsx+QbwjtHsdD6iDgqwtaMh5VrjRbAGr1PZh02igKbByNU5q2BhhIU5V0U1cGZEf3NTpTEVm
 O6uGm5m+
X-Proofpoint-ORIG-GUID: bMCX2wsjBtYgeGGRjl0VzgLtmBsqLaIE
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6894a29b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ft_1D6qkK9_HpyV9u2kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/25 7:17 AM, Krishna Kurapati wrote:
> 
> 
> On 8/6/2025 4:02 PM, Konrad Dybcio wrote:
>> On 8/6/25 11:58 AM, Krishna Kurapati wrote:
> 

[...]

>>> +    if (qcom->mode == USB_DR_MODE_HOST) {
>>> +        qcom->current_role = USB_ROLE_HOST;
>>> +    } else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>>> +        qcom->current_role = USB_ROLE_DEVICE;
>>> +        dwc3_qcom_vbus_override_enable(qcom, true);
>>> +    } else {
>>> +        if ((device_property_read_bool(dev, "usb-role-switch")) &&
>>> +            (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
>>
>> currently this will never be true on any qcom dt ("role-switch-default-mode" is
>> not present anywhere)
> 
> Agree. But I wrote for the sake of covering all cases and just in case anyone uses this property tomorrow.

This is fine, just wanted to make sure this is intended

Konrad

