Return-Path: <linux-arm-msm+bounces-65874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE67B0C189
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 12:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06B9F7A40AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 10:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712B6294A11;
	Mon, 21 Jul 2025 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlmGrbRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40420294A03;
	Mon, 21 Jul 2025 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753094509; cv=none; b=Dom1Gm9LF1k3rCr3KCzDrfTkbyQJk4pAqMtV8rKAMFl6Ui+WhiOOGaTd1HlbGm1zA7rY1j1gvOvTJJ8KOWOy05rTp5U6JkC7xFWbslMJdlCBmhuHyAwflhQKU8hXpijOc+jgzxcRk2BPqswP14NpcB2vnHVraema4QrDG7q0+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753094509; c=relaxed/simple;
	bh=32Ezd9NHPvzGB4MDFi30pMB3r9Wjp+fpFw2xP3JHvY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qywd4gcDqzDQP8yJg6I9Zbp2u84uiKQ0v2kQb/Cxabnrlyc1LJkz1Dlk6D4ZQ6wxmy5Mf98Mkd5pERPSGBt2dmLgpUcbD3zlhR0e540bgZfLX6Z1lqjnrHKuvMXS17XXEDpez+WK/QsnTkbAl6xWu0UikkTWzudka59X1bf1MWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlmGrbRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8605C4CEED;
	Mon, 21 Jul 2025 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753094508;
	bh=32Ezd9NHPvzGB4MDFi30pMB3r9Wjp+fpFw2xP3JHvY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LlmGrbRwMWzgGwcOoMjFfintV8khXNcvjHKwl4d5ba703ep1CUXoCSElSrZg41zJL
	 NiwpSBE1SpIFC8eashXR3B3/MbumZoqlqQpc1W6Panr7a+ba4Yuez589tTwZQGHs4G
	 WvaU5rDfW9uBKwQhe1dVtobUkiOnUzZ91ufbNvvUt5NPeM7Ebca4kMejSnmJNMpfgC
	 43/WqkAfQCU9EgY+NdsZ2u6gUszl+BLcTSY6Xu2E5sLMggIWdEYoJkTcLLEBy2uMsg
	 i7ICE/bBMUfhF4rUoaI+KQHN40j8JJvBRlNNpDm9mPb/rXSpf8v6wyeBZZwGDNMcad
	 n2ieNHuK0n9sQ==
Date: Mon, 21 Jul 2025 16:11:34 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 12/12] Documentation: tee: Add Qualcomm TEE driver
Message-ID: <aH4ZXmsKu08F5uPL@sumit-X1>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
 <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-12-697fb7d41c36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-12-697fb7d41c36@oss.qualcomm.com>

On Sun, Jul 13, 2025 at 05:49:24PM -0700, Amirreza Zarrabi wrote:
> Add documentation for the Qualcomm TEE driver.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  Documentation/tee/index.rst |  1 +
>  Documentation/tee/qtee.rst  | 96 +++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |  1 +
>  3 files changed, 98 insertions(+)

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
> index 4be6e69d7837..62afb7ee9b52 100644
> --- a/Documentation/tee/index.rst
> +++ b/Documentation/tee/index.rst
> @@ -11,6 +11,7 @@ TEE Subsystem
>     op-tee
>     amd-tee
>     ts-tee
> +   qtee
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/tee/qtee.rst b/Documentation/tee/qtee.rst
> new file mode 100644
> index 000000000000..2fa2c1bf6384
> --- /dev/null
> +++ b/Documentation/tee/qtee.rst
> @@ -0,0 +1,96 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=============================================
> +QTEE (Qualcomm Trusted Execution Environment)
> +=============================================
> +
> +The QTEE driver handles communication with Qualcomm TEE [1].
> +
> +The lowest level of communication with QTEE builds on the ARM SMC Calling
> +Convention (SMCCC) [2], which is the foundation for QTEE's Secure Channel
> +Manager (SCM) [3] used internally by the driver.
> +
> +In a QTEE-based system, services are represented as objects with a series of
> +operations that can be called to produce results, including other objects.
> +
> +When an object is hosted within QTEE, executing its operations is referred
> +to as "direct invocation". QTEE can also invoke objects hosted in the non-secure
> +world using a method known as "callback request".
> +
> +The SCM provides two functions to support direct invocation and callback requests:
> +
> +- QCOM_SCM_SMCINVOKE_INVOKE: Used for direct invocation. It can return either
> +  a result or initiate a callback request.
> +- QCOM_SCM_SMCINVOKE_CB_RSP: Used to submit a response to a callback request
> +  triggered by a previous direct invocation.
> +
> +The QTEE Transport Message [4] is stacked on top of the SCM driver functions.
> +
> +A message consists of two buffers shared with QTEE: inbound and outbound
> +buffers. The inbound buffer is used for direct invocation, and the outbound
> +buffer is used to make callback requests. This picture shows the contents of
> +a QTEE transport message::
> +
> +                                      +---------------------+
> +                                      |                     v
> +    +-----------------+-------+-------+------+--------------------------+
> +    | qcomtee_msg_    |object | buffer       |                          |
> +    |  object_invoke  |  id   | offset, size |                          | (inbound buffer)
> +    +-----------------+-------+--------------+--------------------------+
> +    <---- header -----><---- arguments ------><- in/out buffer payload ->
> +
> +                                      +-----------+
> +                                      |           v
> +    +-----------------+-------+-------+------+----------------------+
> +    | qcomtee_msg_    |object | buffer       |                      |
> +    |  callback       |  id   | offset, size |                      | (outbound buffer)
> +    +-----------------+-------+--------------+----------------------+
> +
> +Each buffer is started with a header and array of arguments.
> +
> +QTEE Transport Message supports four types of arguments:
> +
> +- Input Object (IO) is an object parameter to the current invocation
> +  or callback request.
> +- Output Object (OO) is an object parameter from the current invocation
> +  or callback request.
> +- Input Buffer (IB) is (offset, size) pair to the inbound or outbound region
> +  to store parameter to the current invocation or callback request.
> +- Output Buffer (OB) is (offset, size) pair to the inbound or outbound region
> +  to store parameter from the current invocation or callback request.
> +
> +Picture of the relationship between the different components in the QTEE
> +architecture::
> +
> +         User space               Kernel                     Secure world
> +         ~~~~~~~~~~               ~~~~~~                     ~~~~~~~~~~~~
> +   +--------+   +----------+                                +--------------+
> +   | Client |   |callback  |                                | Trusted      |
> +   +--------+   |server    |                                | Application  |
> +      /\        +----------+                                +--------------+
> +      ||  +----------+ /\                                          /\
> +      ||  |callback  | ||                                          ||
> +      ||  |server    | ||                                          \/
> +      ||  +----------+ ||                                   +--------------+
> +      ||       /\      ||                                   | TEE Internal |
> +      ||       ||      ||                                   | API          |
> +      \/       \/      \/   +--------+--------+             +--------------+
> +   +---------------------+  | TEE    | QTEE   |             | QTEE         |
> +   |   libqcomtee [5]    |  | subsys | driver |             | Trusted OS   |
> +   +-------+-------------+--+----+-------+----+-------------+--------------+
> +   |      Generic TEE API        |       |   QTEE MSG                      |
> +   |      IOCTL (TEE_IOC_*)      |       |   SMCCC (QCOM_SCM_SMCINVOKE_*)  |
> +   +-----------------------------+       +---------------------------------+
> +
> +References
> +==========
> +
> +[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70015-11/qualcomm-trusted-execution-environment.html
> +
> +[2] http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
> +
> +[3] drivers/firmware/qcom/qcom_scm.c
> +
> +[4] drivers/tee/qcomtee/qcomtee_msg.h
> +
> +[5] https://github.com/quic/quic-teec
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9fc58f48fa14..391fc6e6defc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20706,6 +20706,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
>  M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/tee/qtee.rst
>  F:	drivers/tee/qcomtee/
>  
>  QUALCOMM TRUST ZONE MEMORY ALLOCATOR
> 
> -- 
> 2.34.1
> 

