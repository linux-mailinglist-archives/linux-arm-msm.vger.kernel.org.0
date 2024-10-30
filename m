Return-Path: <linux-arm-msm+bounces-36353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AF9B5940
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 02:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86D851C22636
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 01:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DD7176ADE;
	Wed, 30 Oct 2024 01:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4YPlHoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03715146D40;
	Wed, 30 Oct 2024 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730252507; cv=none; b=G5ybXEQ4l+pQnb4DBPi+OI3A6UM+gGBVwNpFeAn8N02alhalzo3b/31EwVFgly59jxivS+YU/H47TqvY24OPXhaBPB/cEtOft0s3IiawJtGgWxm9yWfeq1qyH/3xK1nyxxhF+OKbXwgP+rht9q+MHYf6xls9BI7f36iKH6RizzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730252507; c=relaxed/simple;
	bh=WcMfb/ZXzjJ5ndEdwQHbHhsDGnvuFA3OHZX79Q4P304=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhH1J9Mut6BZYjerWmFJbPi0v4uZlUSwR6TTIFN4bYLZJHFQ/HED47VrdPgWmV3NUhX0Ehd944UPEfcP+ExSwxV+HhwJIPLH0fhMahLpvygYHqhR4Gr3ad+dVpbK2LduAIlwlcAJVWZjawpUMALYbzwyHCjq3xiDAOqBa3BjaIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4YPlHoH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730252505; x=1761788505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WcMfb/ZXzjJ5ndEdwQHbHhsDGnvuFA3OHZX79Q4P304=;
  b=J4YPlHoHYBdnA5kpqNlIMavjWMJZQR5cIgFlTYeGmIjQ7pl3/aCdvEUu
   BoQS2XSCFYk/w2wvY4ik1msErXTpyw7GEubJkyCE2RMtsOj9R5PvN/W60
   sHSJEygCDEiLam4XWZI0GustDkreHfd7jzQt+8BdwiWDqOuYNasbhYTRp
   n9I3xcz+9qus+ILKJupllqr0ZPHNBaCc6hFydfzxPo+407f22b3Im1GI1
   4XX0t06iqfG7wfHrvrMoSVU9QkDA3JkHoHxgGkaG3n3HdppkwTU3ld05h
   8YvLggcnXgRSrbI/fLs/glAoznqP75XgbMKGnFyjkddQMnuAgzGPJqOR3
   Q==;
X-CSE-ConnectionGUID: /KfYJmWuQI2S7hogsRUafA==
X-CSE-MsgGUID: M6mQaQsWShai+no5HumT/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30043181"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="30043181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 18:41:45 -0700
X-CSE-ConnectionGUID: Cd5FePhgSs6Fqha/z81raQ==
X-CSE-MsgGUID: e13lZlRITLa/bV3qpXk1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82086912"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2024 18:41:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5xiL-000eNw-23;
	Wed, 30 Oct 2024 01:41:37 +0000
Date: Wed, 30 Oct 2024 09:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
	manivannan.sadhasivam@linaro.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, James.Bottomley@hansenpartnership.com,
	martin.petersen@oracle.com, agross@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_narepall@quicinc.com,
	quic_nitirawa@quicinc.com, Can Guo <quic_cang@quicinc.com>
Subject: Re: [PATCH V2 3/3] scsi: ufs: qcom: Add support for multiple ICE
 allocators
Message-ID: <202410300901.9B3oDYwL-lkp@intel.com>
References: <20241029113003.18820-4-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029113003.18820-4-quic_rdwivedi@quicinc.com>

Hi Ram,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.12-rc5 next-20241029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ram-Kumar-Dwivedi/dt-bindings-ufs-qcom-Document-ice-configuration-table/20241029-193301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241029113003.18820-4-quic_rdwivedi%40quicinc.com
patch subject: [PATCH V2 3/3] scsi: ufs: qcom: Add support for multiple ICE allocators
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241030/202410300901.9B3oDYwL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300901.9B3oDYwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300901.9B3oDYwL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/ufs/host/ufs-qcom.c: In function 'ufs_qcom_hce_enable_notify':
>> drivers/ufs/host/ufs-qcom.c:656:23: error: implicit declaration of function 'ufs_qcom_config_ice_allocator'; did you mean 'ufs_qcom_config_ice'? [-Wimplicit-function-declaration]
     656 |                 err = ufs_qcom_config_ice_allocator(host);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       ufs_qcom_config_ice
   drivers/ufs/host/ufs-qcom.c: At top level:
>> drivers/ufs/host/ufs-qcom.c:412:12: warning: 'ufs_qcom_config_ice' defined but not used [-Wunused-function]
     412 | static int ufs_qcom_config_ice(struct ufs_qcom_host *host)
         |            ^~~~~~~~~~~~~~~~~~~


vim +656 drivers/ufs/host/ufs-qcom.c

   635	
   636	static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
   637					      enum ufs_notify_change_status status)
   638	{
   639		struct ufs_qcom_host *host = ufshcd_get_variant(hba);
   640		int err;
   641	
   642		switch (status) {
   643		case PRE_CHANGE:
   644			err = ufs_qcom_power_up_sequence(hba);
   645			if (err)
   646				return err;
   647	
   648			/*
   649			 * The PHY PLL output is the source of tx/rx lane symbol
   650			 * clocks, hence, enable the lane clocks only after PHY
   651			 * is initialized.
   652			 */
   653			err = ufs_qcom_enable_lane_clks(host);
   654			break;
   655		case POST_CHANGE:
 > 656			err = ufs_qcom_config_ice_allocator(host);
   657			if (err) {
   658				dev_err(hba->dev, "failed to configure ice, ret=%d\n", err);
   659				break;
   660			}
   661			/* check if UFS PHY moved from DISABLED to HIBERN8 */
   662			err = ufs_qcom_check_hibern8(hba);
   663			ufs_qcom_enable_hw_clk_gating(hba);
   664			ufs_qcom_ice_enable(host);
   665			break;
   666		default:
   667			dev_err(hba->dev, "%s: invalid status %d\n", __func__, status);
   668			err = -EINVAL;
   669			break;
   670		}
   671		return err;
   672	}
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

