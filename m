Return-Path: <linux-arm-msm+bounces-109690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILcbA6JwFGrNNQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:54:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BF5CC8E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D184130088B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892823F410B;
	Mon, 25 May 2026 15:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GKvggHB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33434344044
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779724444; cv=none; b=De79CcCDa1yz/aqSkReGxZnaphV5mpPmWVe0swH54/v8q43b8eQc3G9OMq3UYpgMC2j/fTPw6DeGScC76TuFJgafQafvnApk5reO/ZSOU4aq53auKnhb4+CnKHNuEnzcMUNiEJHIHT5DelNntIg1AqMveWwMq/nOC0EsFnM4XMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779724444; c=relaxed/simple;
	bh=WTWve7/R/9biter3wey9ECuw7gV8Rv5BZriu2yRI+ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuN6kJ+9A6Q86E48uzmPAJ2j8d536wrd0UdQJ8lj1707KaKXqsYqocZJz85NBNnfVUrvckM2Q561hdGJaRGuAIasBCn58G4q012mJhYQSQPZrwxycLGEh3Yu2EGYqI6aqClB6Ch4r2Ye0SyWBkOkVjKeuWBmRo/90+hoA3c7zTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GKvggHB5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2be75f658f3so46557055ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779724442; x=1780329242; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=REnW7M7rsjO1EkazViblmZkLWWBwB7aJ2DIMBhbGjIo=;
        b=GKvggHB54Hg1CclzZMvApg8XU6CJs1GIrS34xPreI1xE+Biv1j9Dw5IeQfoyyL2NN/
         huSfYU5S01tUF9/arZdHk+NtkfuT30JWW0W1CeUs4T/KySKJazkIlbWDko68INgxyp/4
         8jVtWV/xTYnQTCJmys1c2xzVVRF9OBu89sSS0T+qZL801/5Mv2gVuFduXu0bt7IUfmbX
         8ojhebnUcsgEd3id09xGjkhsylcAZbOaDz9AD+JjhlfvlG2SqaT0kDz5x8/bXu0Y2v9e
         SssKYZL7z3XOfQRctqyW4+fspgxxM3CfjCU9NBI5IlOfgSOxOY2o2M64KK5XVoERSNfp
         OgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779724442; x=1780329242;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REnW7M7rsjO1EkazViblmZkLWWBwB7aJ2DIMBhbGjIo=;
        b=M9aYjlyv72M8jA0pAW4Dz5mPwiuXlC4rUqExF0nGIG/rqmu0B3Xl5j+2inaGL13Crm
         ia2IJ9flICGQLB3T1ruXQoyTFRCMwB+gn+wrPYfn/h+4y1h3m4Bm+No6NN5ZrbSteEGE
         5f4sjzDdPy6sfO9NfNEEV9+LWjT7XFxAkWC6QTADnsGRVPJKBASpfCkeDdBBBM8Chzq4
         2B1dO2CTLCYK23NQ/ZY++Es1XjcIO6PfP4gz5lgAXllnDsLOZqFtSm+pE3ho76IBiX0Y
         tAsET9L1PdyvIPYca7ro6Wdk4zjb1M+VZDc/0rQbDgaMMPh9SYQbMtW8V9I8vtd/2rk8
         YGZg==
X-Forwarded-Encrypted: i=1; AFNElJ/admWKGrUHs65pNSDD//UgcxhoGN1X4LzqiDVSbsvXTMYBYzX9Sk8FDe/IQ5V6mkdq2bkLeBiMyqsx67NT@vger.kernel.org
X-Gm-Message-State: AOJu0YyzadWHaD7INuA8WKirsrEhmvNJkYCt/fgVr7ZpOzELsONXDC8t
	ECk3jGck3UYoNViHCXsfIm6f2D97qkkTmfRKYMXG4kxzDu+7IEI2cxWn5dgqilC6R9//8XNIbIo
	ml0Zu
X-Gm-Gg: Acq92OHGawWlYZX0YSoMUhckiyKDI4Xv3jXfSOcIBjq4zrGP7AIvrGx+kMu2G+orPjR
	/49TG9DQuyRa/TUdhNU4TXzG0X4ahwblzKznPvaIeYoXE9fZGWwgHY6KQsAw1GmxFvgjjOxOw/h
	sd6pFrPqwNBMwAMiFojkotMYj56bbCU61A7awaKMaICfJ7Dgt7XiQ/Cz8JjwSlVo2nHbNsHVxke
	RAa6g0UXUlgkmlzdmLz+hxA/fZ5MLbGCp1EcLB0djKG1UhC2xwT258jBcpnYlTm7f+PxqvUsMan
	CmBHFX2xFwXWuV+1+liI+5h2hmcnHOkCGVLGHkhZ/GZbmUoP1Uif6tdwwxGQlWHEgAVbVQsX0gM
	/SL1t7E5e8TsdJ/Oo+EPu15mmdRWg9faay1OekTFVeKkM8k4MubWGiNVpKqMsj8CWfTa8MazHOC
	Vpcj6JEXHEEtaZXJ1dPacpe1ehV9o=
X-Received: by 2002:a17:903:3c2d:b0:2bc:db02:d1e6 with SMTP id d9443c01a7336-2beb07de949mr161866255ad.38.1779724441101;
        Mon, 25 May 2026 08:54:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bf9f:259d:c433:fb32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f9100sm95149915ad.37.2026.05.25.08.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 08:54:00 -0700 (PDT)
Date: Mon, 25 May 2026 09:53:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/5] remoteproc: Move resource table data structure to
 its own header
Message-ID: <ahRwlftSboEC2Xw2@p14s>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
 <20260506050107.1985033-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506050107.1985033-2-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109690-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 665BF5CC8E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 06, 2026 at 10:31:03AM +0530, Mukesh Ojha wrote:
> The resource table data structure has traditionally been associated with
> the remoteproc framework, where the resource table is included as a
> section within the remote processor firmware binary. However, it is also
> possible to obtain the resource table through other means—such as from a
> reserved memory region populated by the boot firmware, statically
> maintained driver data, or via a secure SMC call—when it is not embedded
> in the firmware.
> 
> There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> etc.) in the upstream kernel that do not use the remoteproc framework to
> manage their lifecycle for various reasons.
> 
> When Linux is running at EL2, similar to the Qualcomm PAS driver
> (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> also want to use the resource table SMC call to retrieve and map
> resources before they are used by the remote processor.
> 
> In such cases, the resource table data structure is no longer tightly
> coupled with the remoteproc headers. Client drivers that do not use the
> remoteproc framework should still be able to parse the resource table
> obtained through alternative means. Therefore, there is a need to
> decouple the resource table definitions from the remoteproc headers.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  include/linux/remoteproc.h | 269 +-------------------------------
>  include/linux/rsc_table.h  | 306 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 307 insertions(+), 268 deletions(-)
>  create mode 100644 include/linux/rsc_table.h
>

This patch is giving me a checkpatch.pl warning, related to a missing SPDX
header.  With that addressed:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..7c1546d48008 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -42,274 +42,7 @@
>  #include <linux/completion.h>
>  #include <linux/idr.h>
>  #include <linux/of.h>
> -
> -/**
> - * struct resource_table - firmware resource table header
> - * @ver: version number
> - * @num: number of resource entries
> - * @reserved: reserved (must be zero)
> - * @offset: array of offsets pointing at the various resource entries
> - *
> - * A resource table is essentially a list of system resources required
> - * by the remote processor. It may also include configuration entries.
> - * If needed, the remote processor firmware should contain this table
> - * as a dedicated ".resource_table" ELF section.
> - *
> - * Some resources entries are mere announcements, where the host is informed
> - * of specific remoteproc configuration. Other entries require the host to
> - * do something (e.g. allocate a system resource). Sometimes a negotiation
> - * is expected, where the firmware requests a resource, and once allocated,
> - * the host should provide back its details (e.g. address of an allocated
> - * memory region).
> - *
> - * The header of the resource table, as expressed by this structure,
> - * contains a version number (should we need to change this format in the
> - * future), the number of available resource entries, and their offsets
> - * in the table.
> - *
> - * Immediately following this header are the resource entries themselves,
> - * each of which begins with a resource entry header (as described below).
> - */
> -struct resource_table {
> -	u32 ver;
> -	u32 num;
> -	u32 reserved[2];
> -	u32 offset[];
> -} __packed;
> -
> -/**
> - * struct fw_rsc_hdr - firmware resource entry header
> - * @type: resource type
> - * @data: resource data
> - *
> - * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
> - * its @type. The content of the entry itself will immediately follow
> - * this header, and it should be parsed according to the resource type.
> - */
> -struct fw_rsc_hdr {
> -	u32 type;
> -	u8 data[];
> -} __packed;
> -
> -/**
> - * enum fw_resource_type - types of resource entries
> - *
> - * @RSC_CARVEOUT:   request for allocation of a physically contiguous
> - *		    memory region.
> - * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
> - * @RSC_TRACE:	    announces the availability of a trace buffer into which
> - *		    the remote processor will be writing logs.
> - * @RSC_VDEV:       declare support for a virtio device, and serve as its
> - *		    virtio header.
> - * @RSC_LAST:       just keep this one at the end of standard resources
> - * @RSC_VENDOR_START:	start of the vendor specific resource types range
> - * @RSC_VENDOR_END:	end of the vendor specific resource types range
> - *
> - * For more details regarding a specific resource type, please see its
> - * dedicated structure below.
> - *
> - * Please note that these values are used as indices to the rproc_handle_rsc
> - * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
> - * check the validity of an index before the lookup table is accessed, so
> - * please update it as needed.
> - */
> -enum fw_resource_type {
> -	RSC_CARVEOUT		= 0,
> -	RSC_DEVMEM		= 1,
> -	RSC_TRACE		= 2,
> -	RSC_VDEV		= 3,
> -	RSC_LAST		= 4,
> -	RSC_VENDOR_START	= 128,
> -	RSC_VENDOR_END		= 512,
> -};
> -
> -#define FW_RSC_ADDR_ANY (-1)
> -
> -/**
> - * struct fw_rsc_carveout - physically contiguous memory request
> - * @da: device address
> - * @pa: physical address
> - * @len: length (in bytes)
> - * @flags: iommu protection flags
> - * @reserved: reserved (must be zero)
> - * @name: human-readable name of the requested memory region
> - *
> - * This resource entry requests the host to allocate a physically contiguous
> - * memory region.
> - *
> - * These request entries should precede other firmware resource entries,
> - * as other entries might request placing other data objects inside
> - * these memory regions (e.g. data/code segments, trace resource entries, ...).
> - *
> - * Allocating memory this way helps utilizing the reserved physical memory
> - * (e.g. CMA) more efficiently, and also minimizes the number of TLB entries
> - * needed to map it (in case @rproc is using an IOMMU). Reducing the TLB
> - * pressure is important; it may have a substantial impact on performance.
> - *
> - * If the firmware is compiled with static addresses, then @da should specify
> - * the expected device address of this memory region. If @da is set to
> - * FW_RSC_ADDR_ANY, then the host will dynamically allocate it, and then
> - * overwrite @da with the dynamically allocated address.
> - *
> - * We will always use @da to negotiate the device addresses, even if it
> - * isn't using an iommu. In that case, though, it will obviously contain
> - * physical addresses.
> - *
> - * Some remote processors needs to know the allocated physical address
> - * even if they do use an iommu. This is needed, e.g., if they control
> - * hardware accelerators which access the physical memory directly (this
> - * is the case with OMAP4 for instance). In that case, the host will
> - * overwrite @pa with the dynamically allocated physical address.
> - * Generally we don't want to expose physical addresses if we don't have to
> - * (remote processors are generally _not_ trusted), so we might want to
> - * change this to happen _only_ when explicitly required by the hardware.
> - *
> - * @flags is used to provide IOMMU protection flags, and @name should
> - * (optionally) contain a human readable name of this carveout region
> - * (mainly for debugging purposes).
> - */
> -struct fw_rsc_carveout {
> -	u32 da;
> -	u32 pa;
> -	u32 len;
> -	u32 flags;
> -	u32 reserved;
> -	u8 name[32];
> -} __packed;
> -
> -/**
> - * struct fw_rsc_devmem - iommu mapping request
> - * @da: device address
> - * @pa: physical address
> - * @len: length (in bytes)
> - * @flags: iommu protection flags
> - * @reserved: reserved (must be zero)
> - * @name: human-readable name of the requested region to be mapped
> - *
> - * This resource entry requests the host to iommu map a physically contiguous
> - * memory region. This is needed in case the remote processor requires
> - * access to certain memory-based peripherals; _never_ use it to access
> - * regular memory.
> - *
> - * This is obviously only needed if the remote processor is accessing memory
> - * via an iommu.
> - *
> - * @da should specify the required device address, @pa should specify
> - * the physical address we want to map, @len should specify the size of
> - * the mapping and @flags is the IOMMU protection flags. As always, @name may
> - * (optionally) contain a human readable name of this mapping (mainly for
> - * debugging purposes).
> - *
> - * Note: at this point we just "trust" those devmem entries to contain valid
> - * physical addresses, but this isn't safe and will be changed: eventually we
> - * want remoteproc implementations to provide us ranges of physical addresses
> - * the firmware is allowed to request, and not allow firmwares to request
> - * access to physical addresses that are outside those ranges.
> - */
> -struct fw_rsc_devmem {
> -	u32 da;
> -	u32 pa;
> -	u32 len;
> -	u32 flags;
> -	u32 reserved;
> -	u8 name[32];
> -} __packed;
> -
> -/**
> - * struct fw_rsc_trace - trace buffer declaration
> - * @da: device address
> - * @len: length (in bytes)
> - * @reserved: reserved (must be zero)
> - * @name: human-readable name of the trace buffer
> - *
> - * This resource entry provides the host information about a trace buffer
> - * into which the remote processor will write log messages.
> - *
> - * @da specifies the device address of the buffer, @len specifies
> - * its size, and @name may contain a human readable name of the trace buffer.
> - *
> - * After booting the remote processor, the trace buffers are exposed to the
> - * user via debugfs entries (called trace0, trace1, etc..).
> - */
> -struct fw_rsc_trace {
> -	u32 da;
> -	u32 len;
> -	u32 reserved;
> -	u8 name[32];
> -} __packed;
> -
> -/**
> - * struct fw_rsc_vdev_vring - vring descriptor entry
> - * @da: device address
> - * @align: the alignment between the consumer and producer parts of the vring
> - * @num: num of buffers supported by this vring (must be power of two)
> - * @notifyid: a unique rproc-wide notify index for this vring. This notify
> - * index is used when kicking a remote processor, to let it know that this
> - * vring is triggered.
> - * @pa: physical address
> - *
> - * This descriptor is not a resource entry by itself; it is part of the
> - * vdev resource type (see below).
> - *
> - * Note that @da should either contain the device address where
> - * the remote processor is expecting the vring, or indicate that
> - * dynamically allocation of the vring's device address is supported.
> - */
> -struct fw_rsc_vdev_vring {
> -	u32 da;
> -	u32 align;
> -	u32 num;
> -	u32 notifyid;
> -	u32 pa;
> -} __packed;
> -
> -/**
> - * struct fw_rsc_vdev - virtio device header
> - * @id: virtio device id (as in virtio_ids.h)
> - * @notifyid: a unique rproc-wide notify index for this vdev. This notify
> - * index is used when kicking a remote processor, to let it know that the
> - * status/features of this vdev have changes.
> - * @dfeatures: specifies the virtio device features supported by the firmware
> - * @gfeatures: a place holder used by the host to write back the
> - * negotiated features that are supported by both sides.
> - * @config_len: the size of the virtio config space of this vdev. The config
> - * space lies in the resource table immediate after this vdev header.
> - * @status: a place holder where the host will indicate its virtio progress.
> - * @num_of_vrings: indicates how many vrings are described in this vdev header
> - * @reserved: reserved (must be zero)
> - * @vring: an array of @num_of_vrings entries of 'struct fw_rsc_vdev_vring'.
> - *
> - * This resource is a virtio device header: it provides information about
> - * the vdev, and is then used by the host and its peer remote processors
> - * to negotiate and share certain virtio properties.
> - *
> - * By providing this resource entry, the firmware essentially asks remoteproc
> - * to statically allocate a vdev upon registration of the rproc (dynamic vdev
> - * allocation is not yet supported).
> - *
> - * Note:
> - * 1. unlike virtualization systems, the term 'host' here means
> - *    the Linux side which is running remoteproc to control the remote
> - *    processors. We use the name 'gfeatures' to comply with virtio's terms,
> - *    though there isn't really any virtualized guest OS here: it's the host
> - *    which is responsible for negotiating the final features.
> - *    Yeah, it's a bit confusing.
> - *
> - * 2. immediately following this structure is the virtio config space for
> - *    this vdev (which is specific to the vdev; for more info, read the virtio
> - *    spec). The size of the config space is specified by @config_len.
> - */
> -struct fw_rsc_vdev {
> -	u32 id;
> -	u32 notifyid;
> -	u32 dfeatures;
> -	u32 gfeatures;
> -	u32 config_len;
> -	u8 status;
> -	u8 num_of_vrings;
> -	u8 reserved[2];
> -	struct fw_rsc_vdev_vring vring[];
> -} __packed;
> +#include <linux/rsc_table.h>
>  
>  struct rproc;
>  
> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> new file mode 100644
> index 000000000000..c32c8b6cd2a7
> --- /dev/null
> +++ b/include/linux/rsc_table.h
> @@ -0,0 +1,306 @@
> +/*
> + * Resource table and its types data structure
> + *
> + * Copyright(c) 2011 Texas Instruments, Inc.
> + * Copyright(c) 2011 Google, Inc.
> + * All rights reserved.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + *
> + * * Redistributions of source code must retain the above copyright
> + *   notice, this list of conditions and the following disclaimer.
> + * * Redistributions in binary form must reproduce the above copyright
> + *   notice, this list of conditions and the following disclaimer in
> + *   the documentation and/or other materials provided with the
> + *   distribution.
> + * * Neither the name Texas Instruments nor the names of its
> + *   contributors may be used to endorse or promote products derived
> + *   from this software without specific prior written permission.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> + * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> + * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> + * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> + * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> + * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> + * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +#ifndef RSC_TABLE_H
> +#define RSC_TABLE_H
> +
> +/**
> + * struct resource_table - firmware resource table header
> + * @ver: version number
> + * @num: number of resource entries
> + * @reserved: reserved (must be zero)
> + * @offset: array of offsets pointing at the various resource entries
> + *
> + * A resource table is essentially a list of system resources required
> + * by the remote processor. It may also include configuration entries.
> + * If needed, the remote processor firmware should contain this table
> + * as a dedicated ".resource_table" ELF section.
> + *
> + * Some resources entries are mere announcements, where the host is informed
> + * of specific remoteproc configuration. Other entries require the host to
> + * do something (e.g. allocate a system resource). Sometimes a negotiation
> + * is expected, where the firmware requests a resource, and once allocated,
> + * the host should provide back its details (e.g. address of an allocated
> + * memory region).
> + *
> + * The header of the resource table, as expressed by this structure,
> + * contains a version number (should we need to change this format in the
> + * future), the number of available resource entries, and their offsets
> + * in the table.
> + *
> + * Immediately following this header are the resource entries themselves,
> + * each of which begins with a resource entry header (as described below).
> + */
> +struct resource_table {
> +	u32 ver;
> +	u32 num;
> +	u32 reserved[2];
> +	u32 offset[];
> +} __packed;
> +
> +/**
> + * struct fw_rsc_hdr - firmware resource entry header
> + * @type: resource type
> + * @data: resource data
> + *
> + * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
> + * its @type. The content of the entry itself will immediately follow
> + * this header, and it should be parsed according to the resource type.
> + */
> +struct fw_rsc_hdr {
> +	u32 type;
> +	u8 data[];
> +} __packed;
> +
> +/**
> + * enum fw_resource_type - types of resource entries
> + *
> + * @RSC_CARVEOUT:   request for allocation of a physically contiguous
> + *		    memory region.
> + * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
> + * @RSC_TRACE:	    announces the availability of a trace buffer into which
> + *		    the remote processor will be writing logs.
> + * @RSC_VDEV:       declare support for a virtio device, and serve as its
> + *		    virtio header.
> + * @RSC_LAST:       just keep this one at the end of standard resources
> + * @RSC_VENDOR_START:	start of the vendor specific resource types range
> + * @RSC_VENDOR_END:	end of the vendor specific resource types range
> + *
> + * For more details regarding a specific resource type, please see its
> + * dedicated structure below.
> + *
> + * Please note that these values are used as indices to the rproc_handle_rsc
> + * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
> + * check the validity of an index before the lookup table is accessed, so
> + * please update it as needed.
> + */
> +enum fw_resource_type {
> +	RSC_CARVEOUT		= 0,
> +	RSC_DEVMEM		= 1,
> +	RSC_TRACE		= 2,
> +	RSC_VDEV		= 3,
> +	RSC_LAST		= 4,
> +	RSC_VENDOR_START	= 128,
> +	RSC_VENDOR_END		= 512,
> +};
> +
> +#define FW_RSC_ADDR_ANY (-1)
> +
> +/**
> + * struct fw_rsc_carveout - physically contiguous memory request
> + * @da: device address
> + * @pa: physical address
> + * @len: length (in bytes)
> + * @flags: iommu protection flags
> + * @reserved: reserved (must be zero)
> + * @name: human-readable name of the requested memory region
> + *
> + * This resource entry requests the host to allocate a physically contiguous
> + * memory region.
> + *
> + * These request entries should precede other firmware resource entries,
> + * as other entries might request placing other data objects inside
> + * these memory regions (e.g. data/code segments, trace resource entries, ...).
> + *
> + * Allocating memory this way helps utilizing the reserved physical memory
> + * (e.g. CMA) more efficiently, and also minimizes the number of TLB entries
> + * needed to map it (in case @rproc is using an IOMMU). Reducing the TLB
> + * pressure is important; it may have a substantial impact on performance.
> + *
> + * If the firmware is compiled with static addresses, then @da should specify
> + * the expected device address of this memory region. If @da is set to
> + * FW_RSC_ADDR_ANY, then the host will dynamically allocate it, and then
> + * overwrite @da with the dynamically allocated address.
> + *
> + * We will always use @da to negotiate the device addresses, even if it
> + * isn't using an iommu. In that case, though, it will obviously contain
> + * physical addresses.
> + *
> + * Some remote processors needs to know the allocated physical address
> + * even if they do use an iommu. This is needed, e.g., if they control
> + * hardware accelerators which access the physical memory directly (this
> + * is the case with OMAP4 for instance). In that case, the host will
> + * overwrite @pa with the dynamically allocated physical address.
> + * Generally we don't want to expose physical addresses if we don't have to
> + * (remote processors are generally _not_ trusted), so we might want to
> + * change this to happen _only_ when explicitly required by the hardware.
> + *
> + * @flags is used to provide IOMMU protection flags, and @name should
> + * (optionally) contain a human readable name of this carveout region
> + * (mainly for debugging purposes).
> + */
> +struct fw_rsc_carveout {
> +	u32 da;
> +	u32 pa;
> +	u32 len;
> +	u32 flags;
> +	u32 reserved;
> +	u8 name[32];
> +} __packed;
> +
> +/**
> + * struct fw_rsc_devmem - iommu mapping request
> + * @da: device address
> + * @pa: physical address
> + * @len: length (in bytes)
> + * @flags: iommu protection flags
> + * @reserved: reserved (must be zero)
> + * @name: human-readable name of the requested region to be mapped
> + *
> + * This resource entry requests the host to iommu map a physically contiguous
> + * memory region. This is needed in case the remote processor requires
> + * access to certain memory-based peripherals; _never_ use it to access
> + * regular memory.
> + *
> + * This is obviously only needed if the remote processor is accessing memory
> + * via an iommu.
> + *
> + * @da should specify the required device address, @pa should specify
> + * the physical address we want to map, @len should specify the size of
> + * the mapping and @flags is the IOMMU protection flags. As always, @name may
> + * (optionally) contain a human readable name of this mapping (mainly for
> + * debugging purposes).
> + *
> + * Note: at this point we just "trust" those devmem entries to contain valid
> + * physical addresses, but this isn't safe and will be changed: eventually we
> + * want remoteproc implementations to provide us ranges of physical addresses
> + * the firmware is allowed to request, and not allow firmwares to request
> + * access to physical addresses that are outside those ranges.
> + */
> +struct fw_rsc_devmem {
> +	u32 da;
> +	u32 pa;
> +	u32 len;
> +	u32 flags;
> +	u32 reserved;
> +	u8 name[32];
> +} __packed;
> +
> +/**
> + * struct fw_rsc_trace - trace buffer declaration
> + * @da: device address
> + * @len: length (in bytes)
> + * @reserved: reserved (must be zero)
> + * @name: human-readable name of the trace buffer
> + *
> + * This resource entry provides the host information about a trace buffer
> + * into which the remote processor will write log messages.
> + *
> + * @da specifies the device address of the buffer, @len specifies
> + * its size, and @name may contain a human readable name of the trace buffer.
> + *
> + * After booting the remote processor, the trace buffers are exposed to the
> + * user via debugfs entries (called trace0, trace1, etc..).
> + */
> +struct fw_rsc_trace {
> +	u32 da;
> +	u32 len;
> +	u32 reserved;
> +	u8 name[32];
> +} __packed;
> +
> +/**
> + * struct fw_rsc_vdev_vring - vring descriptor entry
> + * @da: device address
> + * @align: the alignment between the consumer and producer parts of the vring
> + * @num: num of buffers supported by this vring (must be power of two)
> + * @notifyid: a unique rproc-wide notify index for this vring. This notify
> + * index is used when kicking a remote processor, to let it know that this
> + * vring is triggered.
> + * @pa: physical address
> + *
> + * This descriptor is not a resource entry by itself; it is part of the
> + * vdev resource type (see below).
> + *
> + * Note that @da should either contain the device address where
> + * the remote processor is expecting the vring, or indicate that
> + * dynamically allocation of the vring's device address is supported.
> + */
> +struct fw_rsc_vdev_vring {
> +	u32 da;
> +	u32 align;
> +	u32 num;
> +	u32 notifyid;
> +	u32 pa;
> +} __packed;
> +
> +/**
> + * struct fw_rsc_vdev - virtio device header
> + * @id: virtio device id (as in virtio_ids.h)
> + * @notifyid: a unique rproc-wide notify index for this vdev. This notify
> + * index is used when kicking a remote processor, to let it know that the
> + * status/features of this vdev have changes.
> + * @dfeatures: specifies the virtio device features supported by the firmware
> + * @gfeatures: a place holder used by the host to write back the
> + * negotiated features that are supported by both sides.
> + * @config_len: the size of the virtio config space of this vdev. The config
> + * space lies in the resource table immediate after this vdev header.
> + * @status: a place holder where the host will indicate its virtio progress.
> + * @num_of_vrings: indicates how many vrings are described in this vdev header
> + * @reserved: reserved (must be zero)
> + * @vring: an array of @num_of_vrings entries of 'struct fw_rsc_vdev_vring'.
> + *
> + * This resource is a virtio device header: it provides information about
> + * the vdev, and is then used by the host and its peer remote processors
> + * to negotiate and share certain virtio properties.
> + *
> + * By providing this resource entry, the firmware essentially asks remoteproc
> + * to statically allocate a vdev upon registration of the rproc (dynamic vdev
> + * allocation is not yet supported).
> + *
> + * Note:
> + * 1. unlike virtualization systems, the term 'host' here means
> + *    the Linux side which is running remoteproc to control the remote
> + *    processors. We use the name 'gfeatures' to comply with virtio's terms,
> + *    though there isn't really any virtualized guest OS here: it's the host
> + *    which is responsible for negotiating the final features.
> + *    Yeah, it's a bit confusing.
> + *
> + * 2. immediately following this structure is the virtio config space for
> + *    this vdev (which is specific to the vdev; for more info, read the virtio
> + *    spec). The size of the config space is specified by @config_len.
> + */
> +struct fw_rsc_vdev {
> +	u32 id;
> +	u32 notifyid;
> +	u32 dfeatures;
> +	u32 gfeatures;
> +	u32 config_len;
> +	u8 status;
> +	u8 num_of_vrings;
> +	u8 reserved[2];
> +	struct fw_rsc_vdev_vring vring[];
> +} __packed;
> +
> +#endif /* RSC_TABLE_H */
> -- 
> 2.53.0
> 

