Return-Path: <linux-arm-msm+bounces-66474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA64B106AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCFEA168AC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A572561C5;
	Thu, 24 Jul 2025 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ga0S4BPE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974E52561A7;
	Thu, 24 Jul 2025 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349784; cv=none; b=bEOWmxzJY75YZJQ9BQ6SgWfMLc8T8WicH5aDblkHqLd+7PUJJJkrneGkXXMsw1hVCJiPc5CTYz3vZUhsIko/Zi97n14MngFPQ56wALoJfBiepvtMtkufh4QKl5sBtXo1eLEKVsACG1PU+ThdL3s4xo4uqZ1oqIMvmwlTK/XRp9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349784; c=relaxed/simple;
	bh=XCziqESd+YYVhw/cl0OMsGz/+9Lqhbo2tR7bJ32WGSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvFvKiO539h9DAEg/N4ThnGE8BmItwRmILKMUS6UfumJc5G6lzgLTu6JQcjmuJ4c0yku1c54HlxJnhysHlDNjxjzUVAwi8wrxgC30V9utiDJOavCDYzq+uXdyC2I1sbDy4k3KCQIWm3oSV6Ov6l9B/AE7AlwnZWZ2xG13PqpSo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ga0S4BPE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F47C4CEF5;
	Thu, 24 Jul 2025 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753349784;
	bh=XCziqESd+YYVhw/cl0OMsGz/+9Lqhbo2tR7bJ32WGSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ga0S4BPERhpnLwJftdqgOrH6zMXuZzd+NyTRW/7olHY7XM2Z1ek79eiNId5bKRI+Y
	 zKzllaJ97FdY6MnoPqVDJgOLt3dV4lN4oQbCBsGh143t/ggUoX3MZ7NsGLA44rfIpz
	 i4hqwcM9J2hojJZwf0NqWbOO+blUMkzcV0JI8qr4=
Date: Thu, 24 Jul 2025 11:36:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <2025072446-ensnare-hardhead-12f5@gregkh>
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>

On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for operating system running at EL1, enforcing access
> restrictions that prohibit direct memory-mapped writes via writel().
> 
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
> 
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v7:
> - Updated the commit message as per Greg's comment
> - Link to v6: https://lore.kernel.org/r/20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com
> 
> Changes in v6:
> - Propagating the error code from disable_eud(), per Dmitry's suggestion
> - Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com
> 
> usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
> 
> Changes in v5:
> * Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's review
> * Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v4:
> * Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
> * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v3:
> * Moved secure write before normal writes
> * Added error checking in disable_eud()
> * Use ENOMEM error code if platform_get_resource() fails
> * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> ---
>  drivers/usb/misc/Kconfig    |  1 +
>  drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
>  2 files changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636cdfd756344b9ed4e7 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
>  config USB_QCOM_EUD
>  	tristate "QCOM Embedded USB Debugger(EUD) Driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_SCM

You now are preventing this code from ever being able to be built in any
testing systems, including mine, so I don't even know if this patch
builds or not.

You did not even document this in the changelog :(

{sigh}

greg k-h

