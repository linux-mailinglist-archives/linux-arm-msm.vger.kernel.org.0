Return-Path: <linux-arm-msm+bounces-56129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 428AAAA0CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 15:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 380065A0970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 13:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B2C2C374F;
	Tue, 29 Apr 2025 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UL+EEVJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36DA2C2AB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931684; cv=none; b=B4A3href80rfDX1VrKSj4tUrOyylUgpzan78jxmM874nb/VcEn/ZWdtnL856Gro2vDaURbiV7XpKS8KA3IT/+Rf5jvdW/FmbFTfV8zur06m1HEpVFl9fzGTF/46jWFXiHIQMQeLwhDBsLEYgn2ChkvU+npg/pbNdDsLSH9BUT0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931684; c=relaxed/simple;
	bh=DFeDFQIgqisFrRbTyxkaRmuV5afJwHFeG7TqQcoSyTU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IF37/DhQMDjts2ZJ1woPfDSal3VK6iYos/lmPJ8WXkt7lLfUsFO+wpBiBFlHNkCcTuARzDdr4cvrY9joK5C3AEwiYwSYqH2MPJKnCvq70wxWXnQm447MxAXPE7uxv4JJoqzFqQ5GHxHlowXi67k3Ed93+XjG2GwUHNi6pcsbHsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UL+EEVJp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so6439733f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745931679; x=1746536479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MONQIfm/Oa04J/4iy7mo5OMqJtr7l+XlLP0uVBN0U7E=;
        b=UL+EEVJpULaP5vT8KeWbx2RKvDMn0sc85NmKUEHoeUsw95lkgnFPHSZx0uh5z7EdAo
         aXnrwd+ohFp25coTNqHUdmFvErkXwHqz0A2j1HKLpzTRpMRKngXV7H7TIunY7f9/JEtc
         PpnFq0kJedyLwlKas9XCShI/mh1TRB84DUDwXNxsTkES5JESlFjPK4isxd5n/6ugGtsy
         E7an7MSyfVbpA0Ndv4B1mD31vOt6G/WUfEWkiF3RkmSzcR398IwNo9x2Z9SZBvIG1jAv
         6LUSTmMIwac8vwid9GH8p9RhZUMNI905uOKWkzkpL+LCs8DT9xmcIy4pfyz7VegROUyM
         HxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745931679; x=1746536479;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MONQIfm/Oa04J/4iy7mo5OMqJtr7l+XlLP0uVBN0U7E=;
        b=ibvwCF+037xbAK9lnoQhS0vg5Dx7few7LpibB6OBw5aPBwKUUqX1ai1AEFLCwzuuqq
         MjFqKwhhR7zW0WMsTOkNGz1g+0HcvllT1Ad/gzn/uSGaf0E9JLyRryXggqSja8SdQ2LN
         40N75pcuAWa9NwMn3queVeOS9p73k94Y+/x7yWIlSZWiYfiVrR3PZgF+3h3PKOW4VQiP
         VBVnPfISV4LSurVbYSg8ZNXljh9rnnepCqBY/EQ2NYK3wYVjDzqvog/a532u8XFq7M8P
         FpJB//Lp+yS/42/1US0+us25uQZ3aVGL5QlZaulM3j1tQsIa4fRhJpuaglaQUMtaQF1N
         DbhQ==
X-Gm-Message-State: AOJu0YxahuxE6Z30K/Ri2vDAnwkPzCXkd8y7LPIGKoVydhcZByu8UA5p
	3k0FRs3TURs+llzzrQ9G2R1bpBiqv2GeEHygQ7QD8zAjiMS+YzDJT54d/s7S9cM=
X-Gm-Gg: ASbGnctqVWJjnC/cIUhtMk0SXYYV8xc0jA4nZomGL/clQyokH7wBWfSznVKLVH+YyfL
	qifi3vbLygYtRCBmyivBzmUmM0Qv8rTy0qCjeVCZva8V82irplB845q+Uyfc6F+VTKpjo5Al21b
	Jr8IAvQUnPfqbCjS22sno8EJhQfXWKqt+V4iNTRfdN8usmqtvGNXN2J2HYRz2wEMkXyqmFZkAEO
	5sw6KkODaQabsecShPbkQgPWHQSX/C7ue0OdK/3NEWB95CPJAHL8UQIOzy1U354Qv9FjpylgGrO
	FRt87ILZHCBlEZDDmLmwoHw4yflrXvHszdfXlcn5+qTAiPw2Usd/NYEK1xtqQEEu9lyilWxbAsw
	F5fEG+yTb6rBiQfmptw==
X-Google-Smtp-Source: AGHT+IFzOm/zeLBXb8tq9k3CffyVspFovQWIpznGeeVBZrU7maNGW9UIaOh5zs9qS8Jytx7rDtlTQw==
X-Received: by 2002:a05:6000:2a1:b0:3a0:89df:3b85 with SMTP id ffacd0b85a97d-3a089df3e89mr2974196f8f.38.1745931678644;
        Tue, 29 Apr 2025 06:01:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7eea:fda1:4564:f556? ([2a01:e0a:3d9:2080:7eea:fda1:4564:f556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07a7c39a0sm10970372f8f.101.2025.04.29.06.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 06:01:18 -0700 (PDT)
Message-ID: <3c4e3ed8-ceaf-45c7-a52c-dc7b8209418b@linaro.org>
Date: Tue, 29 Apr 2025 15:01:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2025 08:06, Amirreza Zarrabi wrote:
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
> 
> Kernel and userspace services are also available to QTEE through a
> similar approach. QTEE makes callback requests that are converted into
> object invocations. These objects can represent services within the
> kernel or userspace process.
> 
> Note: This patch series focuses on QTEE objects and userspace services.
> 
> Linux already provides a TEE subsystem, which is described in [1]. The
> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
> can be used by userspace to talk to a TEE backend driver. We extend the
> Linux TEE subsystem to understand object parameters and an ioctl call so
> client can invoke objects in QTEE:
> 
>    - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>    - TEE_IOC_OBJECT_INVOKE
> 
> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
> used for invoking services in the userspace process by QTEE.
> 
> The TEE backend driver uses the QTEE Transport Message to communicate
> with QTEE. Interactions through the object INVOKE interface are
> translated into QTEE messages. Likewise, object invocations from QTEE
> for userspace objects are converted into SEND/RECV ioctl calls to
> supplicants.
> 
> The details of QTEE Transport Message to communicate with QTEE is
> available in [PATCH 11/11] Documentation: tee: Add Qualcomm TEE driver.
> 
> You can run basic tests with following steps:
> git clone https://github.com/quic/quic-teec.git
> cd quic-teec
> mkdir build
> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
> 
> https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
> needed to build the above.
> 
> This series has been tested for basic QTEE object invocations and
> callback requests, including loading a TA and requesting services form
> the TA.
> 
> Tested platforms: sm8650-mtp
> 
> [1] https://www.kernel.org/doc/Documentation/tee.txt
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Changes in v4:
> - Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
> - Rename object to id in struct tee_ioctl_object_invoke_arg.
> - Replace spinlock with mutex for qtee_objects_idr.
> - Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
> - More code cleanup following the comments.
> - Cleanup documentations.
> - Update MAINTAINERS file.
> - Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com
> 
> Changes in v3:
> - Export shm_bridge create/delete APIs.
> - Enable support for QTEE memory objects.
> - Update the memory management code to use the TEE subsystem for all
>    allocations using the pool.
> - Move all driver states into the driver's main service struct.
> - Add more documentations.
> - Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com
> 
> Changes in v2:
> - Clean up commit messages and comments.
> - Use better names such as ubuf instead of membuf or QCOMTEE prefix
>    instead of QCOM_TEE, or names that are more consistent with other
>    TEE-backend drivers such as qcomtee_context_data instead of
>    qcom_tee_context.
> - Drop the DTS patch and instantiate the device from the scm driver.
> - Use a single structure for all driver's internal states.
> - Drop srcu primitives and use the existing mutex for synchronization
>    between the supplicant and QTEE.
> - Directly use tee_context to track the lifetime of qcomtee_context_data.
> - Add close_context() to be called when the user closes the tee_context.
> - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
> 
> Changes in v1:
> - It is a complete rewrite to utilize the TEE subsystem.
> - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
> 
> ---
> Amirreza Zarrabi (11):
>        tee: allow a driver to allocate a tee_device without a pool
>        tee: add close_context to TEE driver operation
>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>        firmware: qcom: scm: add support for object invocation
>        firmware: qcom: scm: remove unused arguments to the shm_brige
>        firmware: qcom: tzmem: export shm_bridge create/delete
>        tee: add Qualcomm TEE driver
>        qcomtee: add primordial object
>        qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
>        Documentation: tee: Add Qualcomm TEE driver
> 
>   Documentation/tee/index.rst              |   1 +
>   Documentation/tee/qtee.rst               | 150 ++++++
>   MAINTAINERS                              |   8 +
>   drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
>   drivers/firmware/qcom/qcom_scm.h         |   7 +
>   drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
>   drivers/tee/Kconfig                      |   1 +
>   drivers/tee/Makefile                     |   1 +
>   drivers/tee/qcomtee/Kconfig              |  10 +
>   drivers/tee/qcomtee/Makefile             |  11 +
>   drivers/tee/qcomtee/async.c              | 160 ++++++
>   drivers/tee/qcomtee/call.c               | 770 +++++++++++++++++++++++++++++
>   drivers/tee/qcomtee/core.c               | 815 +++++++++++++++++++++++++++++++
>   drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
>   drivers/tee/qcomtee/primordial_obj.c     | 115 +++++
>   drivers/tee/qcomtee/qcom_scm.c           |  38 ++
>   drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
>   drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
>   drivers/tee/qcomtee/release.c            |  48 ++
>   drivers/tee/qcomtee/shm.c                | 146 ++++++
>   drivers/tee/qcomtee/user_obj.c           | 713 +++++++++++++++++++++++++++
>   drivers/tee/tee_core.c                   | 127 ++++-
>   drivers/tee/tee_private.h                |   6 -
>   include/linux/firmware/qcom/qcom_scm.h   |  31 +-
>   include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
>   include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>   include/linux/tee_core.h                 |  54 +-
>   include/linux/tee_drv.h                  |  12 +
>   include/uapi/linux/tee.h                 |  54 +-
>   29 files changed, 4427 insertions(+), 32 deletions(-)
> ---
> base-commit: 33035b665157558254b3c21c3f049fd728e72368
> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

# /unittest -d
[test_print_diagnostics_info][52] 831360          = Total bytes as heap
[test_print_diagnostics_info][53] 111707          = Total bytes allocated from heap
[test_print_diagnostics_info][54] 700160          = Total bytes free on heap
[test_print_diagnostics_info][55] 15280           = Total bytes overhead
[test_print_diagnostics_info][56] 4213            = Total bytes wasted
[test_print_diagnostics_info][57] 454160          = Largest free block size

[test_print_diagnostics_info][60] SUCCESS.
# /unittest -l / /smcinvoke_skeleton_ta64.mbn 0
[test_read_file][246] File //smcinvoke_skeleton_ta64.mbn, size: 32856 Bytes.
[test_load_sample_ta][199] SUCCESS.

Thanks,
Neil

