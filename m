Return-Path: <linux-arm-msm+bounces-39515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E009DBEE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 04:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77FC9164AA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CEB15252D;
	Fri, 29 Nov 2024 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbK7j11C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8139433C5;
	Fri, 29 Nov 2024 03:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732851548; cv=none; b=m5CPQcmZA6z3P27O9vUOqvzHgBGAhDtWsA+pzn6klU0qMidwG0/8JWw7eVplRaxfR/PumMPQvmPyglozFd7Bj0xPMyRDowQSOxBc/QphY5zQCxVh4orgaMkSj9CIrmHThC6O234d9jQ5UPxj2S/Velaspt8Uo8uQWSB0v4L/2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732851548; c=relaxed/simple;
	bh=uXQy13BZgOa5L19ahrawleWv0o9BI/o1SY3gQQKTr0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myZrimbZCG5Cj89Fia++VN1OXj+T/lCzOWzjXssep+ybpXFJxidBKDSuX+dWf0MW3diuLaBFeTgiOmVool+JrPBC2b9KGDzpMsUqbxE90qgEgSSsNEB+478kS0iJotZVegyn9clpzHmUazDIGgCMkwzD3vPErFfUIdHXvnQS4+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbK7j11C; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732851547; x=1764387547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uXQy13BZgOa5L19ahrawleWv0o9BI/o1SY3gQQKTr0A=;
  b=CbK7j11C0n4ixiTyNVJ02criemgexAA/Or5JwFXZMbvskWlcLxUIVbXo
   z7bYzeXvJtAKNzizywlDXlJI64DqRZoJX7jykBzLAqALFFvyYxv/JDkNh
   gSKUbiF9x2CwJQTpjBV9cgQ/YUBz6d8LTKFa+zJPHEmnqIwUZ1rzHNOrd
   8A/gEPzvDZ5prv5ecKSFK4PtTXWTmEPVY6QL78LlR9Vcp6InipEQOpFm1
   heUomddjQhtQsb+XhlwUxy1gyEp7ads6t0OzXzT2pE12uqIcp9ateYP2f
   4sh1GZ6Qev9EQuRlXjn3MP3Pk5MrLZFQEtt3YAlPZk1kvWPiUGgenvCiA
   w==;
X-CSE-ConnectionGUID: B8Nr6rZvRmC0Gj01Ov6+qQ==
X-CSE-MsgGUID: PzC1kgwqR7qB75RFgr7Kkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33225635"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33225635"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 19:39:06 -0800
X-CSE-ConnectionGUID: koENwoPwTf6PKAUaeJdnGQ==
X-CSE-MsgGUID: CS5bmjCdQDyH3VAHk9nYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="97478220"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 19:39:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGrqO-000AIZ-0x;
	Fri, 29 Nov 2024 03:39:00 +0000
Date: Fri, 29 Nov 2024 11:38:46 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_bt@quicinc.com
Subject: Re: [PATCH v1 3/3] Bluetooth: btqca: Add QCA6698 support
Message-ID: <202411291150.ngHlIQve-lkp@intel.com>
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
config: arm-randconfig-001-20241129 (https://download.01.org/0day-ci/archive/20241129/202411291150.ngHlIQve-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291150.ngHlIQve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291150.ngHlIQve-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btqca.c:703:5: warning: no previous prototype for function 'qca_check_firmware_exists' [-Wmissing-prototypes]
   int qca_check_firmware_exists(const char *name, struct hci_dev *hdev)
       ^
   drivers/bluetooth/btqca.c:703:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int qca_check_firmware_exists(const char *name, struct hci_dev *hdev)
   ^
   static 
   1 warning generated.


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

