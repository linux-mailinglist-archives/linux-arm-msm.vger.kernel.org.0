Return-Path: <linux-arm-msm+bounces-74486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B736EB93C86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 03:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A5873A9585
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 01:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDADF487BE;
	Tue, 23 Sep 2025 01:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2g7pwnx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50B3A1B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 01:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758589439; cv=none; b=AYhy9r2g8y3NMLnQBb1zMqdqnk7IYsqt4GYbL+MFzgORdvd7r891/gZseHxZppTFHUL1gBQANPgnolhfW+mAewdbxs+uW2IiK8wtdXVWr1wIlVCWmZLlv7J5RcdAYV0Ze6U5RMY5bJIqqJM2J62awT4Qro+HHWh8bguAptKdb1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758589439; c=relaxed/simple;
	bh=AkmFWqZWKDdWgx+k3IxAC0AsHW+/Je62e22sgXDU+2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcpeEm2IXFuWnVmTLLv0WL7E1mfFWGDrbRQnv5W1Vq3oxQ8re7ir3VFh1aiN2BqP0cHLXQ1J2xCWfizXq9n8u/iVB14Bft+VtD9t8aXO21+qj3fQOnAR+uh/1HukMl+5eTYC1pPGkYJPaKD2L+VPBykOYqMaT4fTea0jFXkeZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2g7pwnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MG4OG3001358
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 01:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3r2gyH2o9KM3Y4VR/nSiqz6V1kwzJFKLhM9PNywxZ9M=; b=U2g7pwnx7X8Zkxz2
	z+R+FuWVj9i6fTjNhzSitDitg/0dKOsNgygJTVMxGczOSmW4fa/yp1tuZTSf09FV
	geRntp4WiiFIei/DNOpNVcvDXmvNSQSZYkjWFgKioptWGMniAb63x8pXLKrDtVLf
	UPBah2saDNqTLVn6h1RxHyuRa8ePxH6aOkXSpHospDU719xiWAK/mw8jZIafmXmp
	J6gZeOpKqxXfCMGp2l9wZb4Fsl2hl5vOnbU23h/Uzy/9k2Hq8wgvNeL1kpssCtFn
	T29DoN5oVUhwUJRkdd2l/zNMMyWbCDcVWHHNSu7ZUQuxO+14ZYvNKZcOOOYjJMuB
	vAXjrg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fejq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 01:03:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54d0ffd172so3949805a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 18:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758589437; x=1759194237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3r2gyH2o9KM3Y4VR/nSiqz6V1kwzJFKLhM9PNywxZ9M=;
        b=OAwcTHhKpzS+uCzuC4D49EBQfAaC8J/ZCw+bGNfoKx67wUxty4QP+BpWZYsOWLfwIh
         OmrcYrmK099iIpEzD0x8bvkUWkCpXxqIqC4BKfXOTejrXqJt8CyMNjuvx3FvQxg0HQbZ
         cuHglhKXhuKeyKXGH5LEKGIbcEsNhE3jaoPUbKsmLkR4e4UlrPPfEcCSL4ls+O7v3EgP
         QobZ3B0Iwwp7SscHy8PZAtCxgnbMvFTCfgSCiZlu1ZwI4PHcNdVE/BvD0l6D0RltsYEt
         NvlOWdax2zwhT34do7dDhiETM+xuB+a2Xmf14BeJoUA3H/EoJXljl2Rnu9lXLAe/gSEk
         2VLg==
X-Forwarded-Encrypted: i=1; AJvYcCVLWAtsus4LlomBh9e4uKAd+WHW0GntZDsebrUDKY2SnARxC8kjsUa+3WA0Lm6Vq/YAm3z57hy3c5Ze05KB@vger.kernel.org
X-Gm-Message-State: AOJu0YxOR1BqKtXYXFrST29Do04r4IRmEaAYc5qNz1ZHAqyhPTRqCnkp
	PUwUpLv2wH8VYdGmbF8UwF4PM6N1Q+sep70omRbkcwlm858e8Axw6IdMvZGGLiaGBNnJJiRFLtn
	7F0BrjT1Jka7FZSZw4ItA/waB13+hOc7eYIOKnYaEyolTI4E5TcBjG5jklz55xhH/LG3t
X-Gm-Gg: ASbGncuanwbVovm0RBj86E8HSr8uVz6WGBdU2NAEOjDwzQe10gTfx5ZtyhdtaqdwO3b
	U4OpfCVr2t8KHs9GK8VN9a7PCZLlSATmDG8syJKz2wn8NQPh24/4bEydlTGUN/xEN+k6/UwY9DJ
	EL3q1Hh4mtugmQ0tl46X56m+xQw4NjqCOI27trmZtFDd4ehcXt4tWE5WwXfk4XTPhGgpR1AJ/1B
	lRlNJG89QhsmrXyMh1pMP7mfUdVxuEBD6VDazuE74CmZqSbWtF4PXClFFhdeK7Q5kWLqzyGUUiV
	SCKGo+ZvFWz5UkTISy9ygZjVXGU9t0VClU23VW9LNDwokXdjS1M85j803lgVwZY7cOnYEFofvRF
	zArOJf8OdMna9eoF4IgpGCemga5tjwUI=
X-Received: by 2002:a05:6a20:a10f:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-2d10ea02f65mr823594637.12.1758589436708;
        Mon, 22 Sep 2025 18:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZu5szyIQ3+/h2P8RAeWjsUwtJhLpq8SVRmJe1NhdUsMWX4SpcQc49bQMtqaOjrR0EYSzmzw==
X-Received: by 2002:a05:6a20:a10f:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-2d10ea02f65mr823558637.12.1758589436149;
        Mon, 22 Sep 2025 18:03:56 -0700 (PDT)
Received: from [192.168.1.239] (syn-075-080-180-230.res.spectrum.com. [75.80.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2deca77asm5515903b3a.98.2025.09.22.18.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 18:03:55 -0700 (PDT)
Message-ID: <95c59ba6-fd9c-ef59-c5c5-33cb2fb5db8e@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:03:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 9/9] phy: qualcomm: m31-eusb2: Make USB repeater optional
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-10-wesley.cheng@oss.qualcomm.com>
 <umoo45pmamr3qraaiommpqh37tgmqidylmtjh3iamlxs34s7wf@ouug53aqvdfd>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <umoo45pmamr3qraaiommpqh37tgmqidylmtjh3iamlxs34s7wf@ouug53aqvdfd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KS1YmIulH5_9cr7jP_Y6ZIi1MYig0aw1
X-Proofpoint-GUID: KS1YmIulH5_9cr7jP_Y6ZIi1MYig0aw1
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d1f1fd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=agQD+r7xwyS+FYqxhQjztw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2H1wgwkl3dmy4IbtCtkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX/StmYSKYk3qX
 aQ+2H8wKuVWfu3fRt5iV9SfbZJ6kIreWN9ontB5oxU2mFSnmWjizfqcApxaapvgAdLsvQw685rQ
 Xjnt7Ox13jk6JpaLW2JTFCAPiYL9Gwe7wayYQA6Db330O0WIDLnGgJwpqAlCtn1QbtDLi99pxHB
 ujzSZcNUGSmVKYi58U7k4EMsz7SzGz8WjKw2lNcOSQrVOdokwhORUUDahy2MRCE7EYocyLi+ROx
 2PJheMInHCOLBHtjceDq2XBp69xQXZweUlGEn505eWQnE/d0w1xfSvpw2LFwr9p/D0txKQh0Zpj
 3FSCFcN/dK1phczk79CtMLDW505hbQ4BXM7yFB2kk2bGiwJBFYiwgaYtdM9RZONroWnX+pUiFbq
 ac6EI3FQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037



On 9/20/2025 8:42 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 08:21:08PM -0700, Wesley Cheng wrote:
>> Change the notation of making the USB repeater a required DT parameter.
>> Issues were seen when supporting USB2 across different form
>> factor/platforms, which led to enumeration issues due to improper eUSB2
>> repeater tuning.  By making the repeater optional, for SMB/QC PMIC based
>> repeaters, it can utilize repeater settings done in the bootloader,
>> which cover a wider range of platforms.
> 
> No, please don't depend on the bootloader settings. Instead we need to
> implement proper prgramming / tuning for eUSB2 repeaters
> 

Hi Dmitry,

Will update the next rev with the entries to support the SM2370 repeater.

Thanks
Wesley Cheng

>>
>> For other repeater vendors outside of the SMB/QC PMICs the repeater
>> should be defined and managed within the kernel.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> index f4355d38aad9..b8ddadf78c53 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> @@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>>   
>>   	phy_set_drvdata(phy->phy, phy);
>>   
>> -	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
>> +	phy->repeater = devm_phy_optional_get(dev, NULL);
>>   	if (IS_ERR(phy->repeater))
>>   		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>   				     "failed to get repeater\n");
> 

