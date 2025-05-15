Return-Path: <linux-arm-msm+bounces-58058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451EEAB8372
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 12:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EE523B4DA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79533297B80;
	Thu, 15 May 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfEhLnC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45416297B70;
	Thu, 15 May 2025 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747303200; cv=none; b=PJwH8LhpH1OA4y98EHXoi+U0HIMOjjlQ50Gv9MROHIu5PSTPsb7fH0u1+FvQU/CkHqiIyrgeFDAyb73YL4DN8m8XtYtuadPk4NZlx/vebjruwqHb5G6VIfoU9DELbM54B4aIbr44qX0cfyLTLpeg/IkX2G82o5Y36/5yAgkMsOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747303200; c=relaxed/simple;
	bh=VMQcole329uRUQIb7gQ39u0k3dDBIl2mwPT+nF6StNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4QK9Ub8+LzvOMD9USrl8S842jyiExIbMBU9AQ+3bUwJyLEqxkGBLOwQvLMV7vAY7441HWSlmAziQ2+Xn1JaxurGZ0Jf8dNael8fIAGrz3DubjFBCck5RzYhB66AEWFVOi4dvoPpV6sbE1rYKlf3vYYhbTWjAvDw9gkbwOCvyyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfEhLnC8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8F8C4CEE9;
	Thu, 15 May 2025 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747303199;
	bh=VMQcole329uRUQIb7gQ39u0k3dDBIl2mwPT+nF6StNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfEhLnC82o5yTmtjGdRgVBv5TMNed9dsCrC8K6Pxk8P2BeMIPd5HZwu7azZPBq+/k
	 DUbHwrsPpDLvbzKdNJI9g3fxLYGivMg7iOHT2KG76QvNV9+hM5y62YiMz+BPIlnecC
	 Q+++nZOfj1KHxHBM3HwGVbN19cBF3x1BfmxH4a00hESLgspMwgQVsSsGnRHnGRSAs5
	 m3mQSWdEoMHaX2+ADzMgqYHBQUul9yi71Qk1pzzfOKGQn3GLMj4nAiA9byxbgZYleR
	 Fz/dtZ15lAb/bA9p02XN2iea3RvpTs5dAkjDoarXzwDNI2kLd/F62/7HEf+KqTzAoI
	 3XmGI7CQ8M+qQ==
Date: Thu, 15 May 2025 15:29:46 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/11] tee: add Qualcomm TEE driver
Message-ID: <aCW7Es42TmtMioVH@sumit-X1>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-8-6a143640a6cb@oss.qualcomm.com>
 <aCSZ4n5UMP_Jom2h@sumit-X1>
 <dc3c6aab-42d8-4741-826f-d22f140184e2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc3c6aab-42d8-4741-826f-d22f140184e2@quicinc.com>

On Thu, May 15, 2025 at 02:35:34PM +0530, Kuldeep Singh wrote:
> 
> 
> On 5/14/2025 6:55 PM, Sumit Garg wrote:
> > Hi Amir,
> > 
> > Apologies for getting to this patch review a bit late, mostly due to
> > it's enormous size.
> > 
> > On Mon, Apr 28, 2025 at 11:06:29PM -0700, Amirreza Zarrabi wrote:
> >> Introduce qcomtee_object, which represents an object in both QTEE and
> >> the kernel. QTEE clients can invoke an instance of qcomtee_object to
> >> access QTEE services. If this invocation produces a new object in QTEE,
> >> an instance of qcomtee_object will be returned.
> >>
> >> Similarly, QTEE can request services from the kernel by issuing a callback
> >> request, which invokes an instance of qcomtee_object in the kernel.
> >> Any subsystem that exposes a service to QTEE should allocate and initialize
> >> an instance of qcomtee_object with a dispatcher callback that is called
> >> when the object is invoked.
> > 
> > I can't see any kernel subsystem exposing a service to QTEE as of now. I
> > suppose RPMB is surely going to be the one. So I would suggest you to
> > drop exposing kernel APIs for that and instead they should be pushed
> > alongside a patch-set adding a real kernel service for QTEE. This will
> > help in the review as well.
> > 
> >>
> >> Implement initial support for exporting qcomtee_object to userspace
> >> and QTEE, enabling the invocation of objects hosted in QTEE and userspace
> >> through the TEE subsystem.
> > 
> > I think this is the main goal of this patch-set, so we should limit it
> > to that.
> > 
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
> >>  MAINTAINERS                            |   7 +
> >>  drivers/tee/Kconfig                    |   1 +
> >>  drivers/tee/Makefile                   |   1 +
> >>  drivers/tee/qcomtee/Kconfig            |  10 +
> >>  drivers/tee/qcomtee/Makefile           |   9 +
> >>  drivers/tee/qcomtee/async.c            | 160 +++++++
> >>  drivers/tee/qcomtee/call.c             | 764 +++++++++++++++++++++++++++++++
> >>  drivers/tee/qcomtee/core.c             | 806 +++++++++++++++++++++++++++++++++
> >>  drivers/tee/qcomtee/qcom_scm.c         |  38 ++
> >>  drivers/tee/qcomtee/qcomtee_msg.h      | 239 ++++++++++
> >>  drivers/tee/qcomtee/qcomtee_private.h  | 222 +++++++++
> >>  drivers/tee/qcomtee/release.c          |  48 ++
> >>  drivers/tee/qcomtee/shm.c              | 149 ++++++
> >>  drivers/tee/qcomtee/user_obj.c         | 713 +++++++++++++++++++++++++++++
> >>  include/linux/firmware/qcom/qcom_tee.h | 302 ++++++++++++
> >>  include/uapi/linux/tee.h               |   1 +
> >>  16 files changed, 3470 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 906881b6c5cb..88a9ad34bcf6 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -20257,6 +20257,13 @@ F:	Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
> >>  F:	drivers/net/ethernet/qualcomm/rmnet/
> >>  F:	include/linux/if_rmnet.h
> >>  
> >> +QUALCOMM TEE (QCOMTEE) DRIVER
> >> +M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> +L:	linux-arm-msm@vger.kernel.org
> >> +S:	Maintained
> >> +F:	drivers/tee/qcomtee/
> >> +F:	include/linux/firmware/qcom/qcom_tee.h
> >> +
> >>  QUALCOMM TRUST ZONE MEMORY ALLOCATOR
> >>  M:	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>  L:	linux-arm-msm@vger.kernel.org
> >> diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
> >> index 61b507c18780..3a995d7f0d74 100644
> >> --- a/drivers/tee/Kconfig
> >> +++ b/drivers/tee/Kconfig
> >> @@ -16,5 +16,6 @@ if TEE
> >>  source "drivers/tee/optee/Kconfig"
> >>  source "drivers/tee/amdtee/Kconfig"
> >>  source "drivers/tee/tstee/Kconfig"
> >> +source "drivers/tee/qcomtee/Kconfig"
> >>  
> >>  endif
> >> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
> >> index 5488cba30bd2..74e987f8f7ea 100644
> >> --- a/drivers/tee/Makefile
> >> +++ b/drivers/tee/Makefile
> >> @@ -6,3 +6,4 @@ tee-objs += tee_shm_pool.o
> >>  obj-$(CONFIG_OPTEE) += optee/
> >>  obj-$(CONFIG_AMDTEE) += amdtee/
> >>  obj-$(CONFIG_ARM_TSTEE) += tstee/
> >> +obj-$(CONFIG_QCOMTEE) += qcomtee/
> >> diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
> >> new file mode 100644
> >> index 000000000000..d180a6d07d33
> >> --- /dev/null
> >> +++ b/drivers/tee/qcomtee/Kconfig
> >> @@ -0,0 +1,10 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only
> >> +# Qualcomm Trusted Execution Environment Configuration
> >> +config QCOMTEE
> >> +	tristate "Qualcomm TEE Support"
> >> +	select QCOM_SCM
> > 
> > You should add a dependency on QCOM_TZMEM_MODE_SHMBRIDGE too here.
> 
> I think you meant QCOM_TZMEM because MODE_SHMBRIDGE is one aspect just
> like MODE_GENERIC.

QCOM_TZMEM is selected by QCOM_SCM already. QTEE driver relies on
MODE_SHMBRIDGE to register memory objects with QTEE although if not
supported at runtime may skip that functionality. However, the config
option QCOM_TZMEM_MODE_SHMBRIDGE should get selected by default with
QTEE.

-Sumit

