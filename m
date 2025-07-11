Return-Path: <linux-arm-msm+bounces-64489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B2B01283
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 07:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECE76188BD90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 05:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7DF1AC43A;
	Fri, 11 Jul 2025 05:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9xo24QQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CF118BB8E
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752210360; cv=none; b=lrRUo0TuNKW4m9XABtN6VQvGlBOY3jnQ5OrU7FnWm6zHwNbEx4aXt4QfeXp9q7gg3ft/AxWZTVfV7G7RGKTSTztCzcDcqPJBVZc1C7X9tepSjpPI1ajZcKV7r/7uzVjCcTZQ75YtHnv/4EEMUAj3BqiKV4eYFAUa9F+NjR2FD0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752210360; c=relaxed/simple;
	bh=ZiQ3Fv8gmz6RId3auba0EbdkWD4thp4jNvTHfKbkpmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqySXyjn6wDlw9eAah7xuDyYksj65o4rMInwPoBYtz+FZ2MnKSkhAqFT/+40sUx/ZlkrtNvbWcKenB+QxpYJEKJXdUDvwZ4VZiQTEAz4WGW2pN0/4KF9Sn+OL144kxpZZvKUFAVnVhQcWh6HUQyxlaoGwM8pRzH0kJ9UQpURVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9xo24QQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XBXi011658
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ON4p5KKmBIR3FGHX5880lk4pL/vyxFoXHm7nsMOOrHc=; b=B9xo24QQrEIy7vY7
	2H/4mBPA3lz09M1dFW1fwOCkLhQfAW7ZCNoO5BPE83/2joulY+bKdcmmx1buzB4N
	DJ/k0jMO4qVOPlg9gxsmsShYUDwx4+Tkh5hVzS+GqIQA6tnG6jwrpqRQiwm6b9RS
	XPBK0WcYvjRKsCFErTQqZ8xDU9gfETVVz772t9enoch6qBI1PW/ivByxjkm8ZNhE
	V0l/K9PWd8NBcsTNpnzDVg2pVE4TydTdDmZEskeyhotPZmCkHAhrBUl8EulOipbr
	2hFqH7AF6YTK/z5hJYO5lxELm+g7qlasIirEqu+f1a1xEQdDlh6mI8QGPKeqqOBC
	j50esQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafq75h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:05:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23689228a7fso25386845ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752210356; x=1752815156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ON4p5KKmBIR3FGHX5880lk4pL/vyxFoXHm7nsMOOrHc=;
        b=T1d4i5PkvEnLjUzU4tcEXC9/a657x1wTMCa+QuQmPeOff5X1Z/q2J4YqgO+lLpV1H/
         dXGUU0iTMU3Z9G5ZOXhLqhpjxKrElAkRTP5jUy6tCwOej7goAAKgDVHaSQyQq+rSNV/Q
         ssXfblar7SXA7ltgam77TaZAJ4LweTtj27Jmv6Cqmlz3tDrbF/VuWgx09JZQqX8TUX7m
         a//GJL0aZZnQnFRUGyARy0zIeV9nP3eyTee/IfikFajaszyezqDRwJjgiI92Ak6EkGID
         MmUNlD9U/2kGwJ0Mb/U2+NKTNcyUpMyT4tesOAGE4r3x5UMuvZ5u2OCrp3gwdSuI+p4g
         ai1w==
X-Forwarded-Encrypted: i=1; AJvYcCXHPStICD3Ox0wTVJ3UcaEhu5UwTSMIERuJOeV1uMqYJvWPNIoJ2EGyaUT/SfYjETgGjuXZndBqPDsHrY5F@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvKdqTE8PDqH7z8kICTZ1PDFGsaiUQSGvXAlLD6baqenLBakS
	YtVKyFg6h5yHxHttpV/N32wHsVUNtugJ+uCrVQwdWISxqlgT5UmEJ557W55YAGqn1wrrzgvixkh
	7QTIkESDKcv95HUVwjW83zfQzKlzQK6VBbTNNrRolq+DlLjhErWXPCHUvyvpQmdzqoL0=
X-Gm-Gg: ASbGncvwa1xcfUE1J4Id5GVy+u3AMjYUiqBFMlpouSGP+s/Rtv6lWLs1F62sL2iQ3/B
	CPPh1FRN2XCzEZce/C3uC1+680BBLMfxdtoNIxz9yeF4XjFTlBf3YJfcZLZCRzeTAEjEqD++zt6
	MI0IGJwa5Ml+F/hAmz3zX+kmeYUpvuVOwYNTnHmTsnO39B4MYmvBrBLTPIxgBTcE0wF2AGNStE+
	iRF/KOU6+C+ue+4Kkr95ITQ6u4Koi+TpjOGqWme8+/gPEKoIkumYbMfdahBi9FKJILa0jKjsibx
	HhJwiGHLfn0mRiqFTsbqrS2yUYDcMJopUlatFS8ge21NqkgntxOErV9OZusd2zERE1Oo54EEo7d
	z62A2nQLf3RvDHdnn3tlYzOjtrdsAnqNz6GbcFw==
X-Received: by 2002:a17:902:e54a:b0:234:8a16:d62b with SMTP id d9443c01a7336-23dede38615mr28066665ad.12.1752210356349;
        Thu, 10 Jul 2025 22:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc9IdZCzOQJSKnApzYY4Ey9QwM3RLDd7RZBRwcYVcIK2ljlo/TA59XUzUEdTJNZzy9kf6SxQ==
X-Received: by 2002:a17:902:e54a:b0:234:8a16:d62b with SMTP id d9443c01a7336-23dede38615mr28066255ad.12.1752210355851;
        Thu, 10 Jul 2025 22:05:55 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de432289bsm37082315ad.118.2025.07.10.22.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 22:05:55 -0700 (PDT)
Message-ID: <ad88258e-dc44-4b82-b49c-e327609ab774@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 15:05:46 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] Documentation: tee: Add Qualcomm TEE driver
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-12-024e3221b0b9@oss.qualcomm.com>
 <aGu7boxOTB3TFRNU@sumit-X1>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aGu7boxOTB3TFRNU@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=68709bb5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=XIjxTgID6P44-LRwrwcA:9 a=QEXdDO2ut3YA:10 a=M0EVDjxxv-UA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: xjsRhr-kaOfj-BtY845FdVAA2BVRRvqa
X-Proofpoint-GUID: xjsRhr-kaOfj-BtY845FdVAA2BVRRvqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAzMyBTYWx0ZWRfXy6IKBunLx8Xf
 l6FPkd42qu+cTQxDltcvvRrNLS7hdr++JthzMpwEkUjFyqArcp6FJAudoNVc5BGuHjeJcCblgTt
 d/g3e2g6nw2GzH25Wm1ZJ/4xLIw6LqCIZDe8pzgcPuCcw+uix9zzEhraICBq9VDPNyHr+Rd289j
 3v0DadjSP7L9oI2ndMCeQiJGE1wIi+qh6qRKAQMQcvcFVkEuVg0V9A4fWRmp4Xsfw0dHkXzaJcF
 aAuPlXyPV45jeb6Gzh1ksCnAiCiutRueLCo+fgXEE/MHWQb3QfxHTqE3FJ+o8ryYGi4LxQuf54T
 zcA1sPbdtLbftVNC06qfOJUU/SLD6Ku4KkoOvtqrekGD4gUwNaZv5n2/2yZWwI4m9jCqPc6FM4v
 LQ9g/Y24ECT/qrXgeqn7aRnkD1HgCnsmCst7rzHnLEnsg9VEOrgKARE5ClqBdV4OnVmwPLlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110033

Hi Sumit,

On 7/7/2025 10:19 PM, Sumit Garg wrote:
> On Mon, May 26, 2025 at 11:56:57PM -0700, Amirreza Zarrabi wrote:
>> Add documentation for the Qualcomm TEE driver.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  Documentation/tee/index.rst |   1 +
>>  Documentation/tee/qtee.rst  | 150 ++++++++++++++++++++++++++++++++++++++++++++
>>  MAINTAINERS                 |   1 +
>>  3 files changed, 152 insertions(+)
>>
>> diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
>> index 4be6e69d7837..62afb7ee9b52 100644
>> --- a/Documentation/tee/index.rst
>> +++ b/Documentation/tee/index.rst
>> @@ -11,6 +11,7 @@ TEE Subsystem
>>     op-tee
>>     amd-tee
>>     ts-tee
>> +   qtee
>>  
>>  .. only::  subproject and html
>>  
>> diff --git a/Documentation/tee/qtee.rst b/Documentation/tee/qtee.rst
>> new file mode 100644
>> index 000000000000..8ae4da17c3a7
>> --- /dev/null
>> +++ b/Documentation/tee/qtee.rst
>> @@ -0,0 +1,150 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=============================================
>> +QTEE (Qualcomm Trusted Execution Environment)
>> +=============================================
>> +
>> +The QTEE driver handles communication with Qualcomm TEE [1].
>> +
>> +The lowest level of communication with QTEE builds on the ARM SMC Calling
>> +Convention (SMCCC) [2], which is the foundation for QTEE's Secure Channel
>> +Manager (SCM) [3] used internally by the driver [4].
>> +
>> +In a QTEE-based system, services are represented as objects with a series of
>> +operations that can be called to produce results, including other objects.
>> +
>> +When an object is hosted within QTEE, executing its operations is referred
>> +to as direct invocation. QTEE can invoke objects hosted in the kernel or
>> +userspace using a method known as callback requests.
>> +
>> +The SCM provides two functions for direct invocation and callback request:
>> +
>> +- QCOM_SCM_SMCINVOKE_INVOKE for direct invocation. It can return either
>> +  a result or a callback request.
>> +- QCOM_SCM_SMCINVOKE_CB_RSP submits a response for a previous callback request.
>> +
>> +The QTEE Transport Message [5] is stacked on top of the SCM driver functions.
>> +
>> +A message consists of two buffers shared with QTEE: inbound and outbound
>> +buffers. The inbound buffer is used for direct invocation, and the outbound
>> +buffer is used to make callback requests. This picture shows the contents of
>> +a QTEE transport message::
>> +
>> +                                      +---------------------+
>> +                                      |                     v
>> +    +-----------------+-------+-------+------+--------------------------+
>> +    | qcomtee_msg_    |object | buffer       |                          |
>> +    |  object_invoke  |  id   | offset, size |                          | (inbound buffer)
>> +    +-----------------+-------+--------------+--------------------------+
>> +    <---- header -----><---- arguments ------><- in/out buffer payload ->
>> +
>> +                                      +-----------+
>> +                                      |           v
>> +    +-----------------+-------+-------+------+----------------------+
>> +    | qcomtee_msg_    |object | buffer       |                      |
>> +    |  callback       |  id   | offset, size |                      | (outbound buffer)
>> +    +-----------------+-------+--------------+----------------------+
>> +
>> +Each buffer is started with a header and array of arguments.
>> +
>> +QTEE Transport Message supports four types of arguments:
>> +
>> +- Input Object (IO) is an object parameter to the current invocation
>> +  or callback request.
>> +- Output Object (OO) is an object parameter from the current invocation
>> +  or callback request.
>> +- Input Buffer (IB) is (offset, size) pair to the inbound or outbound region
>> +  to store parameter to the current invocation or callback request.
>> +- Output Buffer (OB) is (offset, size) pair to the inbound or outbound region
>> +  to store parameter from the current invocation or callback request.
>> +
>> +The QTEE driver provides the qcomtee_object, which represents an object within
>> +both QTEE and the kernel. To access any service in QTEE, a client needs to
>> +invoke an instance of this object. Any structure intended to represent a service
>> +for export to QTEE should include an instance of qcomtee_object::
>> +
>> +	struct driver_service {
>> +		struct qcomtee_object object;
>> +		...
>> +	};
>> +
>> +	#define to_driver_service_object(o) container_of((o), struct driver_service, object)
>> +
>> +	static int driver_service_dispatch(struct qcomtee_object *object, u32 op,
>> +					   struct qcomtee_arg *args)
>> +	{
>> +		struct driver_service *so = to_driver_service_object(object);
>> +
>> +		switch(op) {
>> +		case OBJECT_OP1:
>> +			...
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	static void driver_service_object_release(struct si_object *object)
>> +	{
>> +		struct driver_service *so = to_driver_service_object(object);
>> +		kfree(so);
>> +	}
>> +
>> +	struct si_object_operations driver_service_ops = {
>> +		.release = driver_service_object_release;
>> +		.dispatch = driver_service_dispatch;
>> +	};
>> +
>> +	void service_init(void)
>> +	{
>> +		struct driver_service *so = kzalloc(sizeof(*so), GFP_KERNEL);
>> +
>> +		/* Initialize so->object as a callback object. */
>> +		qcomtee_object_user_init(&so->object, QCOMTEE_OBJECT_TYPE_CB_OBJECT,
>> +					 &driver_service_ops, "driver_service_object");
>> +
>> +		/* Invoke a QTEE object and pass/register 'so->object' with QTEE. */
>> +		...
>> +	}
>> +	module_init(service_init);
> 
> Lets drop any reference for kernel client/services since they aren't
> supported by this patch-set yet.

Will do.

Regards,
Amir

> 
> -Sumit
> 
>> +
>> +The QTEE driver utilizes qcomtee_object to encapsulate userspace objects. When
>> +a callback request is made, it translates into calling the dispatch operation.
>> +For userspace objects, this is converted into requests accessible to callback
>> +servers and available through generic TEE API IOCTLs.
>> +
>> +Picture of the relationship between the different components in the QTEE
>> +architecture::
>> +
>> +         User space               Kernel                     Secure world
>> +         ~~~~~~~~~~               ~~~~~~                     ~~~~~~~~~~~~
>> +   +--------+   +----------+                                +--------------+
>> +   | Client |   |callback  |                                | Trusted      |
>> +   +--------+   |server    |                                | Application  |
>> +      /\        +----------+                                +--------------+
>> +      ||  +----------+ /\                                          /\
>> +      ||  |callback  | ||                                          ||
>> +      ||  |server    | ||                                          \/
>> +      ||  +----------+ ||                                   +--------------+
>> +      \/       /\      ||                                   | TEE Internal |
>> +   +-------+   ||      ||                                   | API          |
>> +   | TEE   |   ||      ||   +--------+--------+             +--------------+
>> +   | Client|   ||      ||   | TEE    | QTEE   |             | QTEE         |
>> +   | API   |   \/      \/   | subsys | driver |             | Trusted OS   |
>> +   +-------+----------------+----+-------+----+-------------+--------------+
>> +   |      Generic TEE API        |       |   QTEE MSG                      |
>> +   |      IOCTL (TEE_IOC_*)      |       |   SMCCC (QCOM_SCM_SMCINVOKE_*)  |
>> +   +-----------------------------+       +---------------------------------+
>> +
>> +References
>> +==========
>> +
>> +[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70015-11/qualcomm-trusted-execution-environment.html
>> +
>> +[2] http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
>> +
>> +[3] drivers/firmware/qcom/qcom_scm.c
>> +
>> +[4] drivers/tee/qcomtee/qcom_scm.c
>> +
>> +[5] drivers/tee/qcomtee/qcomtee_msg.h
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 99fe1ae22ae0..42823d33cc03 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20515,6 +20515,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
>>  M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>  L:	linux-arm-msm@vger.kernel.org
>>  S:	Maintained
>> +F:	Documentation/tee/qtee.rst
>>  F:	drivers/tee/qcomtee/
>>  F:	include/linux/firmware/qcom/qcom_tee.h
>>  
>>
>> -- 
>> 2.34.1
>>


