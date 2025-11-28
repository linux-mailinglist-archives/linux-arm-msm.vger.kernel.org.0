Return-Path: <linux-arm-msm+bounces-83775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81DC91F38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29F574E7C96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2C9327C15;
	Fri, 28 Nov 2025 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oj0wD+NB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZ3gEkA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E2A32827D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331754; cv=none; b=gLl6P5P2XN76wZjNLhbNx56RfHMGGYJqvf3jJ8dD1CJEWvZNpIo+olOtPeGhWpFCx+cpE06y5Kqofe/Rx2ne7eROZmHUyyePRWYjr1O3aEJfQ5Vd0BLsr4bPfjrnOdPZRXHneJwsB+vlYTJ154e9+xE6Sto6unDR3YReDLwEZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331754; c=relaxed/simple;
	bh=X1HS5RlkUvR5Mf8gx702VBsaC1MZAXNBdmskBGMUR0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFeKmMXVwiqT1c4HSWml9nrOi2uUjKyUGM3oV3Y65GZfNfA/fCnvmWCgq4GBYAMSMCszJ9ajsBMTMux61AhBeku4cBqQQariP0q5immQtLKBmypF8ILArnBJ3pZIpqt6b4WRKN9rALKvJcUvYWarz/AIHKt2oWbAB47mbELTp0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oj0wD+NB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZ3gEkA2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OM5M3967410
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oKr4XY9THa4Qu8ZVXHA8oIuhhADCzAa7liI6QcgD5Bg=; b=Oj0wD+NBsJfLG7kS
	rgz8ucAmAqBVj2irLdvWim0gmgDBwSzu++UOBfdAZrRouzbL8fUOHV0GG5xa8y/Z
	gQsnNdNIwV+dcUIk76tnVDcvpraFjGZoqEvgToT8Je9V89991MX+JGQw3W7RyOcJ
	m0VPn7sTll5B7FiJSBSIQl377H8qS0bOA53KYClZ3XYS7pjUtmquEKxvxDlDr6J6
	WZVWBjZv2vubGY1UXbp+yyBck2AFMb5xMEnYqgfXKm6BK18aY7S80DGKn/2S/BhI
	o946jj8nhZWdkmXvY79m2awy8O6/6YjqO9UM68mQDnz0Lxk7ZWIfl2A5MOzOM7vP
	9ZdvZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5kf1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:09:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ede0bd2154so5259511cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764331749; x=1764936549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKr4XY9THa4Qu8ZVXHA8oIuhhADCzAa7liI6QcgD5Bg=;
        b=bZ3gEkA2azsXUqHwBB+MyR6D4ZDe5Yxba6Ps5hYY+zAqLwfMVew+/B7n0VmxKlGa08
         3J9cgeMECU8p9zVgU4DNedDRfRXWQtpqOWnb+R9t7OJGJdMetwaPOl1UUCloHdfuo07t
         KD8xWedETYo17Eb1lv9PXUU/cdqN9yg0PjQp7h/60u8hm0s+dVcieyJ0BmqK9kCW7ysD
         Xx7ZG1o5Sj9gr4Z5mb0ksQbkUas8SwrmMMZyX1rpUWcnmxn+kricgqn4JGSPt8WO7h71
         BK8pBlN0oxas+XNKBBnDK6ZZx42r1JqKlwGzLFIFNwlcRfWUaWklazLsNy3oCgfv+sdc
         AqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331749; x=1764936549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKr4XY9THa4Qu8ZVXHA8oIuhhADCzAa7liI6QcgD5Bg=;
        b=LJkDn4HgkBFJnshduRPyXHV3J93dFWUckYO6fzZ1f2OvRhqGZ2hJsSA3Ic7vXTTqE6
         Ak+6SGvKA/ax6FyxG7UoGKJPYxfnG2tVYvVNUoTFlKdpy4+JRUQEnSrNIYc9ZHprdpsg
         BAXejQfDrH2eBkRAowcBEv2tyflHdPdTkBuzIfbW8AWyOOslkJPmjEFW+uCSeeyc1dsJ
         qHX3c2LDnUkUNgaaRiYn51JpISU192DdIANyn/PLFd+XalkS90RjO3hxEZbqoeNapu2Y
         +YnTL6mapH8legMzcPELK6MI7ohTRZfoLhmZgbMygnacTq8Az+6zNwbcwLgxG20NDaWc
         RVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsgfnf9F32t+6LC2TG7AIq6cM/offWz1r45EgAe0CWeAnvc55y8BF1MlCr3ZKgxRbRZfkz6q2jUkTcSUrc@vger.kernel.org
X-Gm-Message-State: AOJu0YxSznX6rCHqsv1jZOP78mMOr2/xu23hAPSc4+VB4rPJAX1oZZcP
	G5Uoy99MJOY8lliGRt91EpvONKKK5ajfLMwkL8QVVIzwr6/FM63OcomGTokw2Hwyfmu9whrA1NF
	+PCvXz6hh50lBysaN1tgtGJGokT+94WD1dNp8jmyK/7iEdt+OPB0/pYiAPOrBP0l88HxP
X-Gm-Gg: ASbGncv5qNPQMp3KB2NzazR6V7wFiDnKnGBcjC9MSI0Id0h0GhjJoX2uXwBuTuxkm9V
	vDhupOfHRVZ+LiE+RBHYVoKtADrPWSW/XgmWWlNAmcnTGov92jCGnrY+8Ta+MLeAhVz8bcFDoAJ
	advD2pBeaYVu5qZR95H28rAxaQVt+UywICHPjNhxzrgeGpQsAFol8cSImjku+8DGX0+eY+iq0sA
	F24cX5+Wk36mXUY3voQNbWSH0LBCzO7w2Rl6Pg7poKoFTWYmx8+/Npk0KPD0vNI1G/zshZHhpE5
	op6B2FzXDgvvwxBg7b7POVbjZ3G8Rf6ArvHjrXRbormMYwo20xSVBFfSvXvkSwNtjfcc6hnIEaF
	YsZ74A7xId1XwJ1S5RwJ1Vaf2nMrS2ljQIb9dFU2uSGFBd5jWu7LMDDAWrh0C9PZC0rw=
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr276238901cf.3.1764331748343;
        Fri, 28 Nov 2025 04:09:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAlY7BCtEp8q1QrNP4N2hl0KDcfWriM03Y+3OtjNiiPI9HSZHAnlbAIOL1EnnUjZgYWinnMQ==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr276238361cf.3.1764331747902;
        Fri, 28 Nov 2025 04:09:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d49sm421867666b.14.2025.11.28.04.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:09:07 -0800 (PST)
Message-ID: <ad0ce240-ad84-47b5-b890-03a02efd8c08@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:09:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/11] crypto: qce - Remove unused ignore_buf
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-5-9a5f72b89722@linaro.org>
 <b1d8234a-6d29-49f6-bfc7-bdc738895d79@oss.qualcomm.com>
 <CAMRc=Mc0Mh5CjS0C+Ss-AG1qQ2YPOr=kkWc+Bbk5CLgPoPVrqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc0Mh5CjS0C+Ss-AG1qQ2YPOr=kkWc+Bbk5CLgPoPVrqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bYOWMaMC_1qwCNgeGv6GzGD1GCcwzfkF
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=692990e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jrMBgjXTAAAA:20 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ENz42x8E23rwaKT2S0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4OCBTYWx0ZWRfX06HzUb0hE5MF
 HxhieXdA9NBYmG3HOEpbDS6bzS6k/vjoUlcbdRbIEUA43uqZF/VJJ9ZHyCKbrXI8wIH7+pl/A2J
 ma8u2YBm0Q3bB1EyyeYZWHOhbMh5p3s2m5nihZ4rJ0D6LOJQ2oopPpbXfPXqlwcKGQCyPYTOvCe
 YycUq2hzvwVFQ/UlA3qwgSeRT6SdzPA8nd/zfXdw17sLzNqKhlmNyCOibiELou8IEjn0Bnjtpy7
 mGE4bULOjj1iGKe/xilTF5R+7cOae4b2IfVDrestY5plYefEruB4R6GgIYJdrLQOwcZxXsAMzh9
 FrcJfMwKVv9/D/7arCmqzLjm+xd8IzKOFoVVTgkDY91XPVxqduCeLDRN2fIlc/Jbz48D+gsanz1
 25QBi6OaRRjcCbCKeBfRAMWEtqhA8Q==
X-Proofpoint-GUID: bYOWMaMC_1qwCNgeGv6GzGD1GCcwzfkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280088

On 11/28/25 1:05 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 28, 2025 at 1:02 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> It's unclear what the purpose of this field is. It has been here since
>>> the initial commit but without any explanation. The driver works fine
>>> without it. We still keep allocating more space in the result buffer, we
>>> just don't need to store its address. While at it: move the
>>> QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
>>> compilation unit.
>>
>> It's apparently used downstream, at a glance to work around some oddities
>>
>> https://github.com/cupid-development/android_kernel_xiaomi_sm8450/blob/lineage-22.2/drivers/crypto/msm/qce50.c
>>
> 
> Thanks. This driver is very far from upstream. :)
> 
> I think it's still safe to remove it.

Seems so!

Konrad

