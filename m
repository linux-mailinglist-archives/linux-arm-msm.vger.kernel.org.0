Return-Path: <linux-arm-msm+bounces-69074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4CBB256FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEAAD3B2FA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 22:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B1D2FB97F;
	Wed, 13 Aug 2025 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fjd/24VX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE582FB97A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125539; cv=none; b=kz4x6UbCwKxXdUyCpkeCNWKhraujoi2NhLBoiVPYGegpTJnwjVbBSnRlLHmmJt7/nJvN/phYQWh6nBUQTIJN3/7U6SHAtCNj1NS+SCCPm6HMq/bSIxL0YYI6Bu12zCaWn3cZemjpcx1BpADy20LRTCWSCu64eNYr0kRinVzh+c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125539; c=relaxed/simple;
	bh=gpvubl7IBMGZ3fNhTgbXzyPTB7BEybWTWqj8EEGwPiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9zH6TKubT+5rAC16yPPpaVBaYgzSmuXBVUbzNMGLo5HZ/lybXo9qOfj5ODu/myA6jKly/4bxt0qQGymvSaHwjbRYKcWewzPzU4jRj4oG5586Pc5KwY+tkjr7maT2IFLkB3Tc5Xi5nIp3zDLgh56m6XCT7BsOnICRTRd44CPrJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fjd/24VX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLfrE029021
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t42PazxIAwcY8zhaSfswxJzoFRiL77Ql0tEpJIyMuFY=; b=Fjd/24VXocnkshuC
	d00CX9XpBwlgTwwRriOLYf7uwSvAm8cs1rWazUkX4qDzJgFYycUVeGbRoujWltSG
	HwSuWa5l/p0Iz5QISvF8myCaFiA4NKiLJQKcCPbOZHKnw6qgBcoUxsHVwLf+9ubM
	0Lb8tppanA1gEPCy6TO2avDw2BYmvMA7j7bjOcUadWvTV1rndO+g7894Y1+k0yr+
	4+WJFfDx3v1JbNIOVXoijYZzDLXD9UzZ3DRO9KlS/VljDE06Bqp2mNVjUMIz3W7o
	9tXhUGZuYatTyGlTF7uyQ5cOE+xB42i5KSlV1J4McSHLJOC+1R/BZ0/FT66lXYRO
	sPbLyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9vjrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:52:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8707254e0so9656685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755125536; x=1755730336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t42PazxIAwcY8zhaSfswxJzoFRiL77Ql0tEpJIyMuFY=;
        b=Qvx9c3s5NkS1EbXtp8w/QDewKOZFP6dV/SP2XR5LN4xesD09+p1WXkWhEUjfHhEKHw
         CSmIi8HQn7Ud5WTZoOUvLQh1tVKuWxFlFpX7OSj18qxY7bntybtNLzn9x+mwVl5BgyZH
         xbFoNgbzOJZbMJg9mFfJTr7BRVeu9RxpWMDAvSNXveIqHixKcR3tvCV+cwz9ThQ6zdDu
         r6Isp9Jd85PVnSqSgooAVVVOWdOv7PMicgjrI5EGBrDUecMk81dcQy5yvNbE/AOaavfC
         BTLIdbKmJriujaw28pfEMtzws0x/EHntFrb8kqacxaVkILiSb2X0MKk5LgYfUe/noGKQ
         7Ajg==
X-Forwarded-Encrypted: i=1; AJvYcCUzqCMqELScf7l4mlRmGSphX+jSjUoUh5/6KyrkTwxxUYsJvFYHdKLzZVX90oAcpJK27PwtSF3sLd1IrcWl@vger.kernel.org
X-Gm-Message-State: AOJu0YwGA815PMfXd806oVwPAMCM67zc1TCTlDRVxHD5SfBoRNONVqZu
	ENrlnZlrL95jzJKtz7Mz7H9wQkedKGB3nsIlzCB1d7SRu9f4tzTA2gZzzyanjAnUp+3YsjgdWHx
	Jr8ZtKP3Js/CTkHkYVzWpJMP8ydItVyRU9Ax/w6GxkeKaAu9yn5e02ZX88OgE1hlPS3BG
X-Gm-Gg: ASbGncvclMSg2b+kCtMoPVBsXwqz/ptQySQaisz8/A78Qz54A2CIAE+QaPNH+8kpDwF
	BUqbkEt2jXrdYY4xmgARgKj1vHfl+j7bIQlJ5XxvyX/qXYF26i8JKSD2A2kStRSWPYwP1P7mVNe
	MzZhYEzvVQ2HDGAQxMvOtDM133UkW6+W9Dv16GdVxPI+RkSs5GkcBpUDdldhFZO7nsa7g47MN8I
	P7U/2+8OOKvL3uMnC8Brw3WKcmN0Tq4DJNvLtB+5iSaPGAuJ10tEPg3d6UVhShKLd8dwfz5BSwy
	hFvUKwsTWPtCq0K1ojIVK2X5M65iQOhTvVy2mdh7U6qtxiLtcWpmjyBsZn1bzo3K4vSAzJc5TSs
	U95pDcZl2CH58491YmA==
X-Received: by 2002:a05:620a:4623:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e8705a3275mr89868885a.8.1755125535594;
        Wed, 13 Aug 2025 15:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHclD7EUgbPfmus8NrnhqiEVqDLALZXNIA0vOZsJQC8vPRZCLtqwvV5bJV25qlMQ6s/DbEOQw==
X-Received: by 2002:a05:620a:4623:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e8705a3275mr89866185a.8.1755125534989;
        Wed, 13 Aug 2025 15:52:14 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6186bfee29csm2338635a12.15.2025.08.13.15.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:52:14 -0700 (PDT)
Message-ID: <176361cd-a095-4b81-9e36-f933d159d249@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 00:52:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] firmware: qcom: scm: add support for object
 invocation
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
 <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
 <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689d1721 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=pfBxzQCg3Pwb8BljcmgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wzfMtcIupA-xWrMxBNsSABCELWoYiT6K
X-Proofpoint-ORIG-GUID: wzfMtcIupA-xWrMxBNsSABCELWoYiT6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX0ln6wpHgdrWd
 16CDiJ5Z0A37nDmlunZ/E/504FtAmU2u4OSFzhCAJv9L7xmVOAV8Y5QNwxs/+zB65pZzmdHHStF
 VXsxPj3sUn75LOm6irLCu/iQ9dhBTzBI70s4BDj2KltxN3yEBWTUf4Ume+8dt8bQ5rThZPHigzb
 nMzi3MDgZHGWqiwNiG+5HHup6VCJWE+eke4kLDvF8r+UzhpWIYSk5A54TTVUR7Is+j8WC4nFBwD
 nZQLNw2RJicag+593gf7nUN3mqhUVwImEsmt1IEospcTsjlx+4TlZEyQjuklMbV9hbAdH61E3jN
 BsLay5NPI6szDvfFyqzZH/7PRqoeGSL2K7ycmwh1OBLTcIJMZvCd6Y+IEWNVEB7Tt/9K1i2i1Ip
 ROPhVzGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

On 8/13/25 11:37 PM, Amirreza Zarrabi wrote:
> 
> 
> On 8/13/2025 7:53 PM, Konrad Dybcio wrote:
>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
>>> the secure world, accessed via objects. A QTEE client can invoke these
>>> objects to request services. Similarly, QTEE can request services from
>>> the nonsecure world using objects exported to the secure world.
>>>
>>> Add low-level primitives to facilitate the invocation of objects hosted
>>> in QTEE, as well as those hosted in the nonsecure world.
>>>
>>> If support for object invocation is available, the qcom_scm allocates
>>> a dedicated child platform device. The driver for this device communicates
>>> with QTEE using low-level primitives.
>>>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> ---

[...]

>>>  /**
>>>   * qcom_scm_is_available() - Checks if SCM is available
>>>   */
>>> @@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>>  	ret = qcom_scm_qseecom_init(scm);
>>>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>>>  
>>> +	/*
>>> +	 * Initialize the QTEE object interface.
>>> +	 *
>>> +	 * This only represents the availability for QTEE object invocation
>>> +	 * and callback support. On failure, ignore the result. Any subsystem
>>> +	 * depending on it may fail if it tries to access this interface.
>>> +	 */
>>> +	ret = qcom_scm_qtee_init(scm);
>>> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
>>
>> This will throw a WARN on *a lot* of platforms, ranging from
>> Chromebooks running TF-A (with a reduced SMC handler), through
>> platforms requiring QCOM_SCM_SMCINVOKE_INVOKE_LEGACY (0x00) cmd
>>
> 
> Are you suggesting I remove the WARN? If so, how should the user be notified?
> Should the error simply be ignored?

I suggest using dev_info/dev_notice, WARN prints multiple dozen lines
and taints the kernel

Konrad

