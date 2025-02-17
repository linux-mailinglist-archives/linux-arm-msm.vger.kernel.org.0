Return-Path: <linux-arm-msm+bounces-48310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E953CA38FAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 00:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90B6E7A2E85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B7A1AAA2F;
	Mon, 17 Feb 2025 23:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i4xJ/Xei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF815666D;
	Mon, 17 Feb 2025 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739835399; cv=none; b=MCA6oo57jhhhrneU8Zfmnu2N/oAOCel5w6mI962X4VeyBDnsQhRDuLBC48AsAJVzJ5PkOjWMw8EqG2FLt2cloeoXE18ZvJgiAQXbcg8OnP6F2AGFhp2JVL+loJ5azOmUa2iJmuMLPZS75c71/qcoxIDGqsd1D8Lz1tL+4Xg8PVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739835399; c=relaxed/simple;
	bh=b1NMjktdEW4cyABcNC8DJFFrZN0i8dJK7f9UZQsgBQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fe4neDXpylDvfED7mU4u4puR24hImxS9kowmQGYdIDf2x6gnBsmtb0gBMs5+CR/WCp2n6TAhfLmJhXeHe1srKFp7WeaSoXvBwyO/NUjlKrYnHJNNhFFn+x0zwSpxYgyApOZ08KIkWoSsdLt8S2+vNM7gkzcN2SxvbT/jDHik0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i4xJ/Xei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAUAi7007123;
	Mon, 17 Feb 2025 23:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bn8aLTOaSFfuTe1I2/VjlP8wLE0nfFKiGqo53Bp2LZA=; b=i4xJ/Xei9wH4mVst
	VWi5xRtLEkHZnaF7ifzKK/2SDuDN+rB2k/MeO5Uc5zEyctjF776iTCUMxqTWCdfX
	8Eemjs1HH9pFiURVOcR6BT1/8YtbkXdgqA53CxqCIo2nG6R8is+UG6NDc+Ed9D3N
	tP+oKQ8q3Wq7s4wD/kUgBbmRhB6CCOqBySjLC5aMCxA4zq3DEhGydHzrWE6kcri4
	nvLHk7JFs2WY+JHVo7lHtGtdHPRAoCgPwGsMHuYMLrWZUIQjLZkh3wi8TyamMspg
	Xe38dpT9vkxgpUxrwzGIWEGJAS4jr3fV9eabwKWr7QHQlbzeZrejFlRLmjbheZJ+
	EiFtAw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44v3du1p9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 23:36:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HNaWsA008837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 23:36:32 GMT
Received: from [10.4.85.56] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 15:36:29 -0800
Message-ID: <6594f69e-f4ba-4d2b-a3d6-7eb5c8f95ac4@quicinc.com>
Date: Tue, 18 Feb 2025 10:36:27 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] tee: add close_context to TEE driver operation
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-2-297eacd0d34f@quicinc.com>
 <20250217093546.GA2637163@rayden>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <20250217093546.GA2637163@rayden>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b1WFPEjf1AapS7mGgJWW9bwsRUorAjq9
X-Proofpoint-GUID: b1WFPEjf1AapS7mGgJWW9bwsRUorAjq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170179



On 2/17/2025 8:35 PM, Jens Wiklander wrote:
> Hi,
> 
> On Sun, Feb 02, 2025 at 06:43:30PM -0800, Amirreza Zarrabi wrote:
>> The tee_context can be used to manage TEE user resources, including
>> those allocated by the driver for the TEE on behalf of the user.
>> The release() callback is invoked only when all resources, such as
>> tee_shm, are released and there are no references to the tee_context.
>>
>> When a user closes the device file, the driver should notify the
>> TEE to release any resources it may hold and drop the context
>> references. To achieve this, a close_context() callback is
>> introduced to initiate resource release in the TEE driver when
>> the device file is closed.
>>
>> Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
>> tee_device_get functions to tee_drv.h to make them accessible
>> outside the TEE subsystem.
>>
>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>> ---
>>  drivers/tee/tee_core.c    |  7 +++++++
>>  drivers/tee/tee_private.h |  6 ------
>>  include/linux/tee_core.h  | 11 +++++++++--
>>  include/linux/tee_drv.h   |  6 ++++++
>>  4 files changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 24edce4cdbaa..721522fe5c63 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -79,6 +79,7 @@ void teedev_ctx_get(struct tee_context *ctx)
>>  
>>  	kref_get(&ctx->refcount);
>>  }
>> +EXPORT_SYMBOL_GPL(teedev_ctx_get);
>>  
>>  static void teedev_ctx_release(struct kref *ref)
>>  {
>> @@ -96,11 +97,15 @@ void teedev_ctx_put(struct tee_context *ctx)
>>  
>>  	kref_put(&ctx->refcount, teedev_ctx_release);
>>  }
>> +EXPORT_SYMBOL_GPL(teedev_ctx_put);
>>  
>>  void teedev_close_context(struct tee_context *ctx)
>>  {
>>  	struct tee_device *teedev = ctx->teedev;
>>  
>> +	if (teedev->desc->ops->close_context)
>> +		teedev->desc->ops->close_context(ctx);
>> +
>>  	teedev_ctx_put(ctx);
>>  	tee_device_put(teedev);
>>  }
>> @@ -1037,6 +1042,7 @@ void tee_device_put(struct tee_device *teedev)
>>  	}
>>  	mutex_unlock(&teedev->mutex);
>>  }
>> +EXPORT_SYMBOL_GPL(tee_device_put);
>>  
>>  bool tee_device_get(struct tee_device *teedev)
>>  {
>> @@ -1049,6 +1055,7 @@ bool tee_device_get(struct tee_device *teedev)
>>  	mutex_unlock(&teedev->mutex);
>>  	return true;
>>  }
>> +EXPORT_SYMBOL_GPL(tee_device_get);
>>  
>>  /**
>>   * tee_device_unregister() - Removes a TEE device
>> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
>> index 9bc50605227c..d3f40a03de36 100644
>> --- a/drivers/tee/tee_private.h
>> +++ b/drivers/tee/tee_private.h
>> @@ -14,12 +14,6 @@
>>  
>>  int tee_shm_get_fd(struct tee_shm *shm);
>>  
>> -bool tee_device_get(struct tee_device *teedev);
>> -void tee_device_put(struct tee_device *teedev);
>> -
>> -void teedev_ctx_get(struct tee_context *ctx);
>> -void teedev_ctx_put(struct tee_context *ctx);
>> -
>>  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
>>  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
>>  					  unsigned long addr, size_t length);
>> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
>> index a38494d6b5f4..8a4c9e30b652 100644
>> --- a/include/linux/tee_core.h
>> +++ b/include/linux/tee_core.h
>> @@ -65,8 +65,9 @@ struct tee_device {
>>  /**
>>   * struct tee_driver_ops - driver operations vtable
>>   * @get_version:	returns version of driver
>> - * @open:		called when the device file is opened
>> - * @release:		release this open file
>> + * @open:		called for a context when the device file is opened
>> + * @close_context:	called when the device file is closed
>> + * @release:		called to release the context
>>   * @open_session:	open a new session
>>   * @close_session:	close a session
>>   * @system_session:	declare session as a system session
>> @@ -76,11 +77,17 @@ struct tee_device {
>>   * @supp_send:		called for supplicant to send a response
>>   * @shm_register:	register shared memory buffer in TEE
>>   * @shm_unregister:	unregister shared memory buffer in TEE
>> + *
>> + * The context given to @open might last longer than the device file if it is
>> + * tied to other resources in the TEE driver. @close_context is called when the
>> + * client closes the device file, even if there are existing references to the
>> + * context. The TEE driver can use @close_context to start cleaning up.
>>   */
>>  struct tee_driver_ops {
>>  	void (*get_version)(struct tee_device *teedev,
>>  			    struct tee_ioctl_version_data *vers);
>>  	int (*open)(struct tee_context *ctx);
>> +	void (*close_context)(struct tee_context *ctx);
>>  	void (*release)(struct tee_context *ctx);
>>  	int (*open_session)(struct tee_context *ctx,
>>  			    struct tee_ioctl_open_session_arg *arg,
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index a54c203000ed..d5f0c70ac95c 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -96,6 +96,12 @@ struct tee_param {
>>  	} u;
>>  };
>>  
>> +bool tee_device_get(struct tee_device *teedev);
>> +void tee_device_put(struct tee_device *teedev);
>> +
>> +void teedev_ctx_get(struct tee_context *ctx);
>> +void teedev_ctx_put(struct tee_context *ctx);
>> +
> 
> Now that these functions are available to all the backend drivers,
> please add some documentation for them so it more clear how they are
> supposed to be used.
> 
> Thanks,
> Jens

Ack.

> 
>>  /**
>>   * tee_shm_alloc_kernel_buf() - Allocate kernel shared memory for a
>>   *                              particular TEE client driver
>>
>> -- 
>> 2.34.1
>>


