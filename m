Return-Path: <linux-arm-msm+bounces-73215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8D1B5419D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D28E1B20BF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9174D26E17D;
	Fri, 12 Sep 2025 04:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNkOHbJi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558ED26E6E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650207; cv=none; b=uO9pk+BLkfh7S7g99VT1l6TXu5esnHfByg2oQRZ+hIPBDNRP0kXW85wwbOp/ImWCU1CYt9kJRAuManxWESPei2/ve3BaOGfXKcnRyUT9zjqrzB+/U0p8nHJ5we11bld8ZArd1O94wtwAONV4kk0CimbJxBm0cFnTVHLE6IC0cZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650207; c=relaxed/simple;
	bh=lWF5Pqv5dDp12ZNWdsVqIArgd9i85v1YvdVOLDpSJwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSaNHOx1P/lV3Iprgkmqfx2CZJ8WJRXJ1rcr7mbJ3Nkj5h/2pyEmDRuT8s+KW5R2bghbwuU46Zx9e3GTV6GM83jhEhEdmJLTtEDBi2sYOgokCuJJbOdvY3x05xd2s3eo0vmj5YPf6oZVe5VGLMZAYpORlq7JSf7HLB9L6QBiwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNkOHbJi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJ3bGD002350
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KshnCh+SdyV/dCJ+ijsZgVdQUq4wg9HM9/HtdTEmuMI=; b=TNkOHbJixVcQOnfh
	AZOxdlwRhXQxWIhOXqJVpOwzmEMc1WQXIkrRAzlXzYas3JMyve3jBnXFFB2FEPZ/
	6A6BC4LlUnNg9B4U+k/0J27Hzt99BCU/JEAyojG8QvYicWvAYWTXBE5syg80kHcZ
	GmClmwlfWb3wMKbMlTkByAUL98QQmbY0HmciZ5ccchL7+LRu/uYyYHDJYOXRVzV+
	L0gtKmGiAapaAMUOfFbfSNv6fKBOgSfF9QfuQnXSYAkKjN4Tpb0XXXOtxpMW3gcZ
	ENfJqWQWi80cIrfqiiHu69A+wlqNf3EeZ9g3PWaSbLfNUKV6C385YhCSmWhClmTZ
	hr04lw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8t7rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:10:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47173afd90so1988968a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650203; x=1758255003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KshnCh+SdyV/dCJ+ijsZgVdQUq4wg9HM9/HtdTEmuMI=;
        b=esZCGDIMuRfTxx5OB2SLG1jNsp0Bo7jS9lcrNpfV2WNfkuvPwgnYorU6jExuzWqKbC
         ixiIiPwM0oIfsIfN1DcMrS90VglTCw0modLQ0j41HovhIggajtfvmB3szRKzo0GFFZeE
         gvlGWTt+aZJHStY6TtBJJ4ofq/IPsKNsXazVDrvtQRfAlOnba+B+JsHFr8Dn7re/laYF
         GzyIOonfoT9Wa7qU5N3KXl8i9Zd82oX8Doetv3Dj2hCgz00R/h4SNsEyPxe5yVbcdOe9
         HAiu9K0aiCGsc6E5L52KjMjXtjRafQpQ+MoLg4WiDS5Ksh3PIiWIefZDlwUWPscRRoLz
         kaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTv4Yy7pmfXmFxw2eQ5CVqfnj+bbHMbLxBlkCfdyHRIij7raEwW7taqUnrKjU7KOZ0lZjYBM8I3jf7oqWb@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyEjILcD7ZGO48t9GkCrHa0QYNeyuYtWzVgHfenz9q/q2HD+X
	hQQw0RBlSLLob+vNILdwN/uEJ8a5f2SzB+dZ5AnMYHhw/JqKTTOUg4hCkr8hjPJ0bkl4AL7OlPn
	PM2TfItPBfL5p3FsI6TEdWa1BziDHPX72WQwNooANMkFe/8V8+vrSugz3MNipjhnlUik=
X-Gm-Gg: ASbGncsvn33/2TDokPGgskjTbalMTzsFGKb/M5W2PVR7BC0SrtNs9k91FMShPEuS6Xj
	nfIbSx/ysFkkZc40cFDrjm+EMV60cXvXpAVmg2MtOLruFXBTpUOgFLRBLcBRRJFMY5pntqON35S
	LoRnkKU5IXz6r93v9vmpwy4PB+n3IlEwtC8IS4aZb/9PbaSvR6SOniPuFW28wWoTkj43tsUfDxV
	0NMIdpP5dWWsMfaasmsRQbXs9jDYEWo6RdILUUhH3QD4j+w4YS3olXhIHcMvpkg4AvgyMmZiW2I
	4z5sJicj4oZKnD5/S7Aoc5yW/CIBk/yfRROYumw08J4eQYJTnhDbnV5d6hw6W+cW+ogMJCO7iT1
	pQDsgEry8GdAwnPIE3l0cfH+LX9/030GjWxe4Nw==
X-Received: by 2002:a17:902:e806:b0:24d:9c86:5e53 with SMTP id d9443c01a7336-25d2528c33fmr25708505ad.2.1757650201604;
        Thu, 11 Sep 2025 21:10:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwp/HT+eze7OdmN0bL7uPSkHMToITqBrF5O2fzVOuInpFpVsUM/5RBxwa6aH5dJdICPsWOiw==
X-Received: by 2002:a17:902:e806:b0:24d:9c86:5e53 with SMTP id d9443c01a7336-25d2528c33fmr25707515ad.2.1757650200511;
        Thu, 11 Sep 2025 21:10:00 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84f72fsm33947645ad.72.2025.09.11.21.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 21:09:59 -0700 (PDT)
Message-ID: <8eb37181-09fb-4d5b-8cda-83777dd5ece0@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 14:09:50 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 05/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
 <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-5-520e867b3d74@oss.qualcomm.com>
 <CAHUa44EsGNuYzjZo_kBJfa6O6u0o14tfDNo2fhSeo+g0BpwX7Q@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44EsGNuYzjZo_kBJfa6O6u0o14tfDNo2fhSeo+g0BpwX7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX7JTHnS+m3k9w
 ibxPXdkvfVvi2R/LzPmTNfeeIsMT2eZJSsv1Lp5Xg6ac40XQ7TZTNcb750tBXU6a7pspA4osS/W
 wREGg4skMyNBu5Abt1ceQ4S2udptfbE/vGVTU4DtBZQ58RofBlxUdnPcOUbLw6Np7s+5h2s/IwB
 4xxIEMhdrK4SSEh58E9FxGo0fQzIK4H1IwMzM9qjMfOBzG6QZKcH0xM9dwJv0vIxJfEuXxULB1l
 FhBse09nrXHoTZpZ2oZM/VF6o4kOI8CpCWJTk17/cJxehiLjC738v1kek7yGWezGlvrD8NOnF1h
 TFcMatZgJ6eGDQSzGU+uBDX2On0rRUFl2PpbS1T9FUfKrd5ndQGrJurE2iPaiPdY8y4DwicGr8i
 ONUzG5tp
X-Proofpoint-ORIG-GUID: yngIa8pYu8dneisoyql03LLpoywAAjKR
X-Proofpoint-GUID: yngIa8pYu8dneisoyql03LLpoywAAjKR
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c39d1c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=oB-xqKmB0luAZTjYqwwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Hi Jens,

On 9/11/2025 5:56 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Thu, Sep 11, 2025 at 5:41 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> For drivers that can transfer data to the TEE without using shared
>> memory from client, it is necessary to receive the user address
>> directly, bypassing any processing by the TEE subsystem. Introduce
>> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
>> userspace buffers.
>>
>> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>>  include/linux/tee_drv.h  |  6 ++++++
>>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>  3 files changed, 55 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index f8534a00c56c..bb2e3a6c23a3 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -457,6 +457,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>                         params[n].u.value.b = ip.b;
>>                         params[n].u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       params[n].u.ubuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>> +                                      params[n].u.ubuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -490,6 +501,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>                             put_user(p->u.value.c, &up->c))
>>                                 return -EFAULT;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
>> +                               return -EFAULT;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -690,6 +706,13 @@ static int params_to_supp(struct tee_context *ctx,
>>                         ip.b = p->u.value.b;
>>                         ip.c = p->u.value.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       ip.a = (__force u64)p->u.ubuf.uaddr;
> 
> There's a warning on arm32:
> drivers/tee/tee_core.c: In function 'params_to_supp':
> drivers/tee/tee_core.c:821:32: warning: cast from pointer to integer
> of different size [-Wpointer-to-int-cast]
>   821 |                         ip.a = (__force u64)p->u.ubuf.uaddr;
> 
> I think you need to cast to unsigned long instead.
> 
> Cheers,
> Jens

You are right. Updated. Thanks.

Regards,
Amir

> 
> 
>> +                       ip.b = p->u.ubuf.size;
>> +                       ip.c = 0;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -792,6 +815,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>                         p->u.value.b = ip.b;
>>                         p->u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       p->u.ubuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>> +                                      params[n].u.ubuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         /*
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index 824f1251de60..7915e8869cbd 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>         struct tee_shm *shm;
>>  };
>>
>> +struct tee_param_ubuf {
>> +       void __user *uaddr;
>> +       size_t size;
>> +};
>> +
>>  struct tee_param_value {
>>         u64 a;
>>         u64 b;
>> @@ -92,6 +97,7 @@ struct tee_param {
>>         u64 attr;
>>         union {
>>                 struct tee_param_memref memref;
>> +               struct tee_param_ubuf ubuf;
>>                 struct tee_param_value value;
>>         } u;
>>  };
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index d843cf980d98..0e3b735dcfca 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and output */
>>
>> +/*
>> + * These defines userspace buffer parameters.
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and output */
>> +
>>  /*
>>   * Mask for the type part of the attribute, leaves room for more types
>>   */
>> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>>  /**
>>   * struct tee_ioctl_param - parameter
>>   * @attr: attributes
>> - * @a: if a memref, offset into the shared memory object, else a value parameter
>> - * @b: if a memref, size of the buffer, else a value parameter
>> + * @a: if a memref, offset into the shared memory object,
>> + *     else if a ubuf, address of the user buffer,
>> + *     else a value parameter
>> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>>   * @c: if a memref, shared memory identifier, else a value parameter
>>   *
>> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
>> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
>> - * indicates that none of the members are used.
>> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
>> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>> + * are used.
>>   *
>>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>   * identifier representing the shared memory object. A memref can reference
>>
>> --
>> 2.34.1
>>


