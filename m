Return-Path: <linux-arm-msm+bounces-14130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157987BC1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 12:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C9BAB22249
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 11:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39046EB73;
	Thu, 14 Mar 2024 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EH8tH1tt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CAF6EB72
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710416655; cv=none; b=qLJRENlaITi1PdIMI1+poCbFGrNqj6KLg2KvjClPTc1QLq5/JpxJkH/OJWP5B+5jMbit0zz7SFKApFdAVXhOBcmVqR87/3+6aFqS83A/GyT3dnZ+f+hax1/DW1Bx1ouSyglTiYj4wrGDodXlevfZi8ppiVtPMWfr60c9fo5l9j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710416655; c=relaxed/simple;
	bh=uHmXx1vffgb10IBWDDsRkysFRIXMcuzCGZ7lRM+V3YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUg90/2b8/ra+4H2K5fMeAaf/2cYct1FifrnHP/8UIrCmARjfnpUscUKTqZoWTjHRUg+wlRr4xNLp1/FC8Rt7CQrCOrywhORrzjJEzgHF/Jb4EZpfMIyBZmZOkKDEj0RE9wI9VUG/okF5gd/hEQmaVQN4VtnhGyYnCXWhyR9eZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EH8tH1tt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710416654; x=1741952654;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uHmXx1vffgb10IBWDDsRkysFRIXMcuzCGZ7lRM+V3YM=;
  b=EH8tH1ttM3ezuXqMzvC/22781dlq5xbHr8dvqyCVImX4GcUw5Zw0WVDm
   i0N7ZV5aHhPrKYD3M+gzBean83dyTHaca4evJuYqkvxO0P/vWOdp2sbxH
   MwTQt0RJ+kiO6VV6Kwa/H+e5pNSZvHp8oCswodDNhZlg+9gkAB2RqBRmP
   EuPkQ0+PcwKVgJmrjKe18sPwI30IdBIg+esIc5eGjQo9SIXTMzxUrghQv
   B3DscKEGsBfKftHfyCVOlcxUhDlfdjY9y+2IJXUJn8iCIuVR25j5Xhs3J
   XhKmODmwisBPe6/dYj6rIMJbWNWO0gkpYsESIO+1GLe80aiuc6NL9QSV7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30667519"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="30667519"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 04:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="16923748"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.171]) ([10.217.160.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 04:44:13 -0700
Message-ID: <e53e5a34-b9cd-4147-9d1a-f46f2cc65a63@linux.intel.com>
Date: Thu, 14 Mar 2024 12:44:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] accel/qaic: Add fifo queued debugfs
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org
References: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
 <20240311165826.1728693-4-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240311165826.1728693-4-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 11.03.2024 17:58, Jeffrey Hugo wrote:
> When debugging functional issues with workload input processing, it is
> useful to know if requests are backing up in the fifo, or perhaps
> getting stuck elsewhere. To answer the question of how many requests are
> in the fifo, implement a "queued" debugfs entry per-dbc that returns the
> number of pending requests when read.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  drivers/accel/qaic/qaic.h         |  1 +
>  drivers/accel/qaic/qaic_data.c    |  9 +++++++++
>  drivers/accel/qaic/qaic_debugfs.c | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index 03d9c9fbffb3..02561b6cecc6 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -288,6 +288,7 @@ int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
>  void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
>  void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
>  void release_dbc(struct qaic_device *qdev, u32 dbc_id);
> +void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail);
>  
>  void wake_all_cntl(struct qaic_device *qdev);
>  void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 2459fe4a3f95..e86e71c1cdd8 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -1981,3 +1981,12 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
>  	dbc->in_use = false;
>  	wake_up(&dbc->dbc_release);
>  }
> +
> +void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail)
> +{
> +	if (!dbc || !head || !tail)
> +		return;
> +
> +	*head = readl(dbc->dbc_base + REQHP_OFF);
> +	*tail = readl(dbc->dbc_base + REQTP_OFF);
> +}
> diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
> index 9d56cd451b64..12a65b98701d 100644
> --- a/drivers/accel/qaic/qaic_debugfs.c
> +++ b/drivers/accel/qaic/qaic_debugfs.c
> @@ -97,6 +97,36 @@ static const struct file_operations fifo_size_fops = {
>  	.release = single_release,
>  };
>  
> +static int read_dbc_queued(struct seq_file *s, void *unused)
> +{
> +	struct dma_bridge_chan *dbc = s->private;
> +	u32 tail = 0, head = 0;
> +
> +	qaic_data_get_fifo_info(dbc, &head, &tail);
> +
> +	if (head == U32_MAX || tail == U32_MAX)
> +		seq_printf(s, "%u\n", 0);
> +	else if (head > tail)
> +		seq_printf(s, "%u\n", dbc->nelem - head + tail);
> +	else
> +		seq_printf(s, "%u\n", tail - head);
> +
> +	return 0;
> +}
> +
> +static int queued_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, read_dbc_queued, inode->i_private);
> +}
> +
> +static const struct file_operations queued_fops = {
> +	.owner = THIS_MODULE,
> +	.open = queued_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
>  void qaic_debugfs_init(struct qaic_drm_device *qddev)
>  {
>  	struct qaic_device *qdev = qddev->qdev;
> @@ -112,6 +142,7 @@ void qaic_debugfs_init(struct qaic_drm_device *qddev)
>  		snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
>  		debugfs_dir = debugfs_create_dir(name, debugfs_root);
>  		debugfs_create_file("fifo_size", 0400, debugfs_dir, &qdev->dbc[i], &fifo_size_fops);
> +		debugfs_create_file("queued", 0400, debugfs_dir, &qdev->dbc[i], &queued_fops);
>  	}
>  }
>  

