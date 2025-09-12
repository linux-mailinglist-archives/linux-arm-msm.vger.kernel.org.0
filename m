Return-Path: <linux-arm-msm+bounces-73242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E55B54526
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28424A05E00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F36E23ABB0;
	Fri, 12 Sep 2025 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qvWnFw4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BA78F4B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665331; cv=none; b=FqLMIHwjeJc/YLIMsu9Sew2NPXE/KEXnr6JrOjgPs+WPKsRw8m8bsu05AXu/sacxjLomyW2LpBwk8masniwzIuAqbHPCRzmVhfP9QPjqZnP2p4b+UARzdkRMivoiwD/Op476pi8sN8ihije+kL5WllGydoBnbsVzJLoM4BvuLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665331; c=relaxed/simple;
	bh=E6SE8LLfjS2UCvp6Bidi5IuPPo1KwbyGGavK1DK/Utc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSbdojCc6jUUAbOtlBjdBDWm2sbi7yLvz6Vlb8+Ofcx/MQ5fcCBj8hsAsS4UeftybRO+aTRoptAmJTFfTPNyyapNncJfKOFZCSlEwjibw8ZkTcAnIxTasMA+DfGtaTtbwfRWcK20p4rQ2gCvM5dwAJhXLy/zf5kuZoDcJbiqtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qvWnFw4n; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-753b6703f89so332444a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757665327; x=1758270127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqmWGb+bqV5HnkceUK4yMUe3ao70v2Hu/Bx0pkeeRhg=;
        b=qvWnFw4nxnf6x6H3whV0i7y7zZ0146NpfnBRERdtdD9IhL5kxQwsHLff/bLJRNpbjS
         gkKWZq4YdLiK4Foj36xbhXgf6KiAtRo3ZIYfzKWo8HTvPG0495v5mZgeoXtsXB2AzRlo
         8dKQrJwp07K2va9dmeKiBtLz184hlOJaDYNuoVT2gzkOs53WQTbZ4y9zxhqwNHcxThh9
         JsLE+vyADiDVPN8AwkiHxJgxpttYAVHXA/NqZDxxqMxo+Gbp1lIq11lQo2Y2PXAo3aZA
         nhN7lDHQtJKr26UCcChEYyP6KOM7dVUOxouxvwNEZ3vefgG/BPMpcNq2dTsyvrzLx3Sz
         l/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665327; x=1758270127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqmWGb+bqV5HnkceUK4yMUe3ao70v2Hu/Bx0pkeeRhg=;
        b=OkcK7bxlWLDR/a64BUOHnR3SBzyk2uN0bC4bVQKEdunYe76LNaFiAA6ro8pjZk9GlX
         8N5T4azH61P6kPbyymQp5KJwdITMUme1ml8rKB00Rb1hJltn4MorUkyJoFpgsRFMtkh6
         U+khWq7Ztx5wPl4JUmS/9P43nvmuiWBJnGARLnj+I/kRzzUMtR629jw+q7T6sKtDy3F/
         szeTZYVXfAMGZaVMH+NnBFNDFjeJy1NxeCMW4qaAG7O50z5Ar2hUo0uxYBe6pec4MSqL
         KD9K2xsQEBZR2KXOEC6uiOajXVHhJBQK+K+Qsly1ou8tNCPT6f4jD8cqIpjphBR5HSiw
         cU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwCPtrDCUkkRHPyzDX3ynHayo2akL3CdF2wOnmY7a6hyZCbXywV/Ii42RQsop9oWgsJY24naZN4lDQ+pR8@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBHaYL1CYo8aPGvpEMgrtAAlrnoKYuRgaHszWs8F16HsMYzFk
	ummkRp5zjbE2qaA2RIi8NRf7AZXuJWUl6jKbwy9EbjD56cPYLWcB0+hDkIuiS7qhNi3tugAXKgq
	ZqLxI3OgeZcpaecrmqpa06EP8kR4CerQNiNBuQIAPHg==
X-Gm-Gg: ASbGncuyVlDoVclRjVKrd5RsfTO6pkkusbgkHRW+AM/kFDjdy1g8LQqXP/aHVThVUmN
	ZMkpDHFBo83kMyjGvo7OlfFLbQxK7AttRUloyKNWsvs//wmGr73Lc1FQp75t2pR5nscD0yDIXgh
	Erz2p5zDVpOYa7mNrfNW+OT+ITIKp4CuMDHTLAsMRz4sToxgzDHvolGVhIx2pT/KdE0WsbwbHMX
	/rDyl4/
X-Google-Smtp-Source: AGHT+IF6KSmtzV3lD8Ye2Smqf1AHbbHzZL7yhMscYVEGZKEmeFM9f9fBRAk0lKMT9A8gz3y+3CIy3hDQkioIiFSlJ2M=
X-Received: by 2002:a05:6830:6a94:b0:745:9d11:cc87 with SMTP id
 46e09a7af769-75355ac462dmr1395964a34.35.1757665327140; Fri, 12 Sep 2025
 01:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 12 Sep 2025 10:21:55 +0200
X-Gm-Features: Ac12FXxUkHtHNTLgZu3XBq2-UbPsnB-71u1NgRvPtOLVCD8F1behB1r-vwEiHeY
Message-ID: <CAHUa44Fow6BhkdTki=rt2psOC=dq99cRgwXsVagmQU7fttXyCw@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuldeep Singh <quic_kuldsing@quicinc.com>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 12, 2025 at 6:07=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
>
[snip]

I'm OK with the TEE patches, Sumit and I have reviewed them.

There were some minor conflicts with other patches I have in the pipe
for this merge window, so this patchset is on top of what I have to
avoid merge conflicts.

However, the firmware patches are for code maintained by Bj=C3=B6rn.
Bj=C3=B6rn, how would you like to do this? Can I take them via my tree, or
what do you suggest?

It's urgent to get this patchset into linux-next if it's to make it
for the coming merge window. Ideally, I'd like to send my pull request
to arm-soc during this week.

Cheers,
Jens

>
> ---
> Amirreza Zarrabi (11):
>       firmware: qcom: tzmem: export shm_bridge create/delete
>       firmware: qcom: scm: add support for object invocation
>       tee: allow a driver to allocate a tee_device without a pool
>       tee: add close_context to TEE driver operation
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>       tee: increase TEE_MAX_ARG_SIZE to 4096
>       tee: add Qualcomm TEE driver
>       tee: qcom: add primordial object
>       tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
>       Documentation: tee: Add Qualcomm TEE driver
>
>  Documentation/tee/index.rst              |   1 +
>  Documentation/tee/qtee.rst               |  96 ++++
>  MAINTAINERS                              |   7 +
>  drivers/firmware/qcom/qcom_scm.c         | 119 ++++
>  drivers/firmware/qcom/qcom_scm.h         |   7 +
>  drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
>  drivers/tee/Kconfig                      |   1 +
>  drivers/tee/Makefile                     |   1 +
>  drivers/tee/qcomtee/Kconfig              |  12 +
>  drivers/tee/qcomtee/Makefile             |   9 +
>  drivers/tee/qcomtee/async.c              | 182 ++++++
>  drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++=
++
>  drivers/tee/qcomtee/core.c               | 915 +++++++++++++++++++++++++=
++++++
>  drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
>  drivers/tee/qcomtee/primordial_obj.c     | 113 ++++
>  drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
>  drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
>  drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
>  drivers/tee/qcomtee/shm.c                | 150 +++++
>  drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
>  drivers/tee/tee_core.c                   | 127 ++++-
>  drivers/tee/tee_private.h                |   6 -
>  include/linux/firmware/qcom/qcom_scm.h   |   6 +
>  include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>  include/linux/tee_core.h                 |  54 +-
>  include/linux/tee_drv.h                  |  12 +
>  include/uapi/linux/tee.h                 |  56 +-
>  27 files changed, 4410 insertions(+), 28 deletions(-)
> ---
> base-commit: 8b8aefa5a5c7d4a65883e5653cf12f94c0b68dbf
> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>
> Best regards,
> --
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>

