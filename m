Return-Path: <linux-arm-msm+bounces-39504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD39DBE4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E673116418F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 01:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4614415AF6;
	Fri, 29 Nov 2024 01:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hu1kmMon"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232528EC;
	Fri, 29 Nov 2024 01:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732842846; cv=none; b=Wa2G45RiyN0EXvTc3+Y8N3Y+bBheAqtozHd8+epNqWBC+n8ogIkchmRGwgWkaKCQ4kwbU17xccEYLg6AAffExorcTOBvBfr4mqReVLMqgXbfhkJlf+TmKpxC+r/27dTr7CzYNGj+NZvqSaxtI2zSjIeG8zrwOjDqUKw+E81Ml54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732842846; c=relaxed/simple;
	bh=dXdlhcsVZZQqOQACHJGpcEf2fTPjPmByYBEbhqacoUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Psmb/l+xMhMTheXeYgRp+VWF7lPJk2wozjM5mABd2vKoBg9v63VH8PdxzGew5uBSPnnlU8Qp83o0SxdQG16ul9C1djo9iwye0ZDWgPAq7LF787H0eEOqQdnk7NC40qrr1aFISYV4723w+AUoJ/lHguQbDl+zUuDY5ECBKNjOf/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hu1kmMon; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732842844; x=1764378844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dXdlhcsVZZQqOQACHJGpcEf2fTPjPmByYBEbhqacoUQ=;
  b=hu1kmMonYSHi3DJH+WUDTYt5j4VAg522Hizd5h4BW6xOo0jINc11K0+a
   cKFWs+eyPk27TdH4s0KBAioVqRgWcCJOTyIHjV0iXVy5WSlcSJEj3JxTm
   wr/p+/Ygfs40qfJjNjyUvyNxVxLFpFrEcN8DxfmmBnW9DTAxo4IR5LkO0
   fnrc2zSoflX+iElv5rLCefMudJZ+G1NqTYsiCpycAGz+lbR8jU+xeo+3W
   oWDzz7yevVFCWBmaYmB3w1wKL/8PhOYVvtp5IM+w9vTv2OBnqhfL02M55
   y5kteal7I8Cj7o5lJY2ANOoeDwy4ILedNrDupQ7WZxnxQh1/k7nqlYP9h
   w==;
X-CSE-ConnectionGUID: 097epXpLR0ubPHEV1SpvTw==
X-CSE-MsgGUID: aaa+MbYhSd6weU4Bv5t+rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="35942529"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="35942529"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 17:14:04 -0800
X-CSE-ConnectionGUID: ciaQegXxTWiov1D6SbjeQQ==
X-CSE-MsgGUID: wNiWqnVBSsOp1kZ//FppoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92816678"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2024 17:13:59 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGpa1-000ADH-0t;
	Fri, 29 Nov 2024 01:13:57 +0000
Date: Fri, 29 Nov 2024 09:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Cheng Jiang <quic_chejiang@quicinc.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_bt@quicinc.com
Subject: Re: [PATCH v1 3/3] Bluetooth: btqca: Add QCA6698 support
Message-ID: <202411290858.nBlfcX9C-lkp@intel.com>
References: <20241128120922.3518582-4-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128120922.3518582-4-quic_chejiang@quicinc.com>

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f486c8aa16b8172f63bddc70116a0c897a7f3f02]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Jiang/arm64-dts-qcom-sa8775p-ride-Change-the-BT-node/20241128-201156
base:   f486c8aa16b8172f63bddc70116a0c897a7f3f02
patch link:    https://lore.kernel.org/r/20241128120922.3518582-4-quic_chejiang%40quicinc.com
patch subject: [PATCH v1 3/3] Bluetooth: btqca: Add QCA6698 support
config: arc-randconfig-002-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290858.nBlfcX9C-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290858.nBlfcX9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290858.nBlfcX9C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btqca.c:703:5: warning: no previous prototype for 'qca_check_firmware_exists' [-Wmissing-prototypes]
     703 | int qca_check_firmware_exists(const char *name, struct hci_dev *hdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/qca_check_firmware_exists +703 drivers/bluetooth/btqca.c

   702	
 > 703	int qca_check_firmware_exists(const char *name, struct hci_dev *hdev)
   704	{
   705		const struct firmware *fw;
   706		int ret;
   707	
   708		ret = firmware_request_nowarn(&fw, name, &hdev->dev);
   709		if (ret) {
   710			bt_dev_warn(hdev, "Firmware %s does not exist. Use default", name);
   711			return 0;
   712		}
   713	
   714		release_firmware(fw);
   715		return 1;
   716	}
   717	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

