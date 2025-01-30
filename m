Return-Path: <linux-arm-msm+bounces-46563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAEDA22778
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 02:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38E207A2588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 01:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D895BA3F;
	Thu, 30 Jan 2025 01:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzZqnHIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B294431;
	Thu, 30 Jan 2025 01:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738200335; cv=none; b=Y02NByAaIF8Df+JKGw2Le+5e1eaGjSVAUFGW3huB2EVU1yza9yngO7V6fm0jfcnYBavPMBJeWhyuw1Tr/JwCtNrLLZH3ghZWwB7lk67w5hq1RAcfC3cfHQf6BG09CR+PGXMq6ooAXhwx7ms3TxUTWLgXJ069MZs2K20D2wCizh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738200335; c=relaxed/simple;
	bh=a9EQGLaLQ63V8C1g4jacKCgE1IBr1sG4RVQZ6PHSF4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQs6nKPdsOyzSI2iltRswMwnFUBCxOeHwZ9XpHoupEfc7dGyZ9MemWn42Ee5ISfGutddFWpJoAad+OLfBzuaFkTu3LxXBfHNIi01vnTtapREpSc1w5NnHvTg8NH4K4QdIAuCVvbzum6/8n/9uX70+FAOd63tR8SN8D9xH0raBk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzZqnHIy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AECC4CED1;
	Thu, 30 Jan 2025 01:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738200335;
	bh=a9EQGLaLQ63V8C1g4jacKCgE1IBr1sG4RVQZ6PHSF4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzZqnHIyUkdd9j4YPjb7ti9EY012tiiYl4bzdy8COzBwzCvPYAQHccVgM+YI27XQX
	 Fwi8b5P8qgCVZ3LmzBOzCbxcM8MecOF1WaHP9p814TKLgL8zoLZNaNxbhcJV+JenAD
	 Dj0XFfhbQ/Pa0cpRju1wxolpv1PypDJuEiN8DiuVcNwUE5+4GXK/iwFHriIqd0uYYe
	 bJYnzrQBdH3OV0kqaGD2wLUFgQGL0k4EWKwGTJ/yA6T/DHzmCOS1Jk4f2Zis2OhcGU
	 Nxj0eKP1T6mMZ9ISe8feNeFEIltjv4YJQ+ARXdBe5jp2iV+VC+NkPHULttSTEQ5Bw/
	 OLuLMJDeMh7Ow==
Date: Wed, 29 Jan 2025 17:25:32 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Satya Tangirala <satyat@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] scsi: ufs: fix use-after free in init error and
 remove paths
Message-ID: <20250130012532.GB66821@sol.localdomain>
References: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>

On Fri, Jan 24, 2025 at 03:09:00PM +0000, André Draszik wrote:
> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshcd and therefore Scsi_host
> allocation.
> 
> During driver release or during error handling in ufshcd_pltfrm_init(),
> this structure is released as part of ufshcd_dealloc_host() before the
> (platform-) device associated with the crypto call above is released.
> Once this device is released, the crypto cleanup code will run, using
> the just-released 'struct ufs_hba::crypto_profile'. This causes a
> use-after-free situation:
> 
>   Call trace:
>    kfree+0x60/0x2d8 (P)
>    kvfree+0x44/0x60
>    blk_crypto_profile_destroy_callback+0x28/0x70
>    devm_action_release+0x1c/0x30
>    release_nodes+0x6c/0x108
>    devres_release_all+0x98/0x100
>    device_unbind_cleanup+0x20/0x70
>    really_probe+0x218/0x2d0
> 
> In other words, the initialisation code flow is:
> 
>   platform-device probe
>     ufshcd_pltfrm_init()
>       ufshcd_alloc_host()
>         scsi_host_alloc()
>           allocation of struct ufs_hba
>           creation of scsi-host devices
>     devm_blk_crypto_profile_init()
>       devm registration of cleanup handler using platform-device
> 
> and during error handling of ufshcd_pltfrm_init() or during driver
> removal:
> 
>   ufshcd_dealloc_host()
>     scsi_host_put()
>       put_device(scsi-host)
>         release of struct ufs_hba
>   put_device(platform-device)
>     crypto cleanup handler
> 
> To fix this use-after free, change ufshcd_alloc_host() to register a
> devres action to automatically cleanup the underlying SCSI device on
> ufshcd destruction, without requiring explicit calls to
> ufshcd_dealloc_host(). This way:
> 
>     * the crypto profile and all other ufs_hba-owned resources are
>       destroyed before SCSI (as they've been registered after)
>     * a memleak is plugged in tc-dwc-g210-pci.c remove() as a
>       side-effect
>     * EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) can be removed fully as
>       it's not needed anymore
>     * no future drivers using ufshcd_alloc_host() could ever forget
>       adding the cleanup
> 
> Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to blk_crypto_profile")
> Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Acked-by: Eric Biggers <ebiggers@kernel.org>

- Eric

