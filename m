Return-Path: <linux-arm-msm+bounces-30492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F64969730
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F94C1F2502D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC332139D4;
	Tue,  3 Sep 2024 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqIlh8kK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C361D54D3;
	Tue,  3 Sep 2024 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352496; cv=none; b=VQgzwpU0jJLy6qPQYgxy4mKBhK/GSz93rfTUnCVgBI1HtjAcptPXg05v4Ul3Rb8/ss2Ip5WFodYYjE8O4J2fWv1+S5HNWxUStL/qFmUmF7pK6fiA9Kf/frHGjpywWQKL1MnEKaIldDdou3Vae0Jvc9kouCfKZy+H5dojkaQmRTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352496; c=relaxed/simple;
	bh=DcqVGHAbdkZJ7C2Cnme5LXeOG99gJt2c8w9Iy8Jn+z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNzQzNyTR4Ec6N8aRL5Vkeo0gkV6MdUDkfxsR5BbSeWCp2jV0gtm+3ChPDw6jIkUzE63dnkGOv4erQrFh9+QQKDdJnVtUfg7jcj6y74qhIjfQquPVxgxjfliDbtQB4ByezNugGuMRKc64LZZsY5kMBbhmAx8gnaerdBJ6Ab4m7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqIlh8kK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725352495; x=1756888495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DcqVGHAbdkZJ7C2Cnme5LXeOG99gJt2c8w9Iy8Jn+z0=;
  b=iqIlh8kKSLVl3TWKrIhSoL/Veh+V7Gb3QzcykSQgsr4x+7oVTd3avF63
   JpLNZ65KdcDe5ChRXA/OKm9+84dBClNZBqFXB3nkvkF54OBWaglqryGPK
   jbsD8EV2iptWU6WsF2K4vQQsU4vFXLuulQA1/rQA1WcM0qOGlWudz9e+C
   +pZ1IWc9sPncx2P91ub072WIKcenNnmlJx8HMou8S5SfBloAxdEgrS5ov
   cVF7eg7A0Cgo0V8FV8voQBDslag1rfm18uF391UDfAriy9EEYsUJlpQpz
   vYA4qlYZOg94BhbvkbqGBk55hBTRxmoS7OvBEzOuhZETQ0jcXgBGAyF9+
   A==;
X-CSE-ConnectionGUID: klY8aux4RD2TMCT4VsT8zA==
X-CSE-MsgGUID: GAOT8KMiR22934+TfaLC3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34591477"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="34591477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 01:34:54 -0700
X-CSE-ConnectionGUID: qMqO0RE1TBOYiHK3mMpRoA==
X-CSE-MsgGUID: FHA1mpkLQnmg+WEKl/nAqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="95636522"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Sep 2024 01:34:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slOzw-0006Po-2k;
	Tue, 03 Sep 2024 08:34:48 +0000
Date: Tue, 3 Sep 2024 16:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?iso-8859-1?Q?'N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado' <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 6/8] serial: qcom-geni: fix console corruption
Message-ID: <202409031521.hMYVfAjO-lkp@intel.com>
References: <20240902152451.862-7-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902152451.862-7-johan+linaro@kernel.org>

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.11-rc6 next-20240902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/serial-qcom-geni-fix-fifo-polling-timeout/20240902-232801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240902152451.862-7-johan%2Blinaro%40kernel.org
patch subject: [PATCH 6/8] serial: qcom-geni: fix console corruption
config: arc-randconfig-001-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031521.hMYVfAjO-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031521.hMYVfAjO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031521.hMYVfAjO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/qcom_geni_serial.c:314:13: warning: 'qcom_geni_serial_drain_fifo' defined but not used [-Wunused-function]
     314 | static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/qcom_geni_serial_drain_fifo +314 drivers/tty/serial/qcom_geni_serial.c

   313	
 > 314	static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
   315	{
   316		struct qcom_geni_serial_port *port = to_dev_port(uport);
   317	
   318		if (!qcom_geni_serial_main_active(uport))
   319			return;
   320	
   321		qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, GP_LENGTH,
   322				port->tx_queued);
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

