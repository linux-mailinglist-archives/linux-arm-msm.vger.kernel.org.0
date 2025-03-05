Return-Path: <linux-arm-msm+bounces-50346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D78A4FD49
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 12:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 447AF7A2CF6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 11:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27B6233709;
	Wed,  5 Mar 2025 11:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqYBMGg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875DC221F04;
	Wed,  5 Mar 2025 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173065; cv=none; b=XXrLo2hIbktrwMKZGzjMDtlcuysKqaz45OL4U3gm2eIKWgcTRqK7eH1TQoE/7aKIVeg5uEWaBj7WJo2a4M0FiZgzr3KGaZhdoQ8qo1KOiLcnUHd37Ku+pOugpMbtyknXxhu8omTx0/z8DLmBLUmB6ksXJFzYwyqbXv5ePemApBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173065; c=relaxed/simple;
	bh=qTAsdsrJUTUWbKK4ZhG4aLb6W6hfmAB8F+V2U1SJfH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0R9IbGxTboKsNC0RDTDN/JXO2yTLOLyX7HBrVBLBCUNNRXN572aZUZLixhWm6yU9RDoChjnHYrj4XVPV8eVJ9BaHQyU+WwrcQ/s8+S3Q+ViyQbw4iguJTRknotz4eY8aG2skv4AcUUT23PAUPBAWwr9ySUOKTa4aqagdBA5x4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqYBMGg6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741173064; x=1772709064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qTAsdsrJUTUWbKK4ZhG4aLb6W6hfmAB8F+V2U1SJfH4=;
  b=LqYBMGg611hqYLrQkfU60T9M4P5AO//fuJ6JU/g4w2tpXRdk1teEvkX9
   QZ6/GDhxuHsSPncKnYlmBNKq5PJ7LQuq3p4/etH+0rVXuS0iCXKFP4VwV
   OKh/3SoXKdU+ydorkrfAUO/8Y8Lf18w7JyP/YJ43nvQqwpbWZ67rY1sQT
   pQFqDD7oSt5w5RT2gsBDBCK3dgvWV7HB+B68CLsXitSq3bSAMwGsyPgAC
   wwOtRCjh47NmB5JSb5htrL4VOdI7mACTKBIW9agZ8RjBzq++cyjFSRAKZ
   MOCdSdjVbwPprbAhHvAnLb9LlA5CKIarfKb6od2jFJqUY2zudbFqTmCxb
   g==;
X-CSE-ConnectionGUID: TXArdFR0QgiMkTHflGSoJw==
X-CSE-MsgGUID: WSa6s9TxT8KqK74+aSdAWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59674659"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="59674659"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:11:03 -0800
X-CSE-ConnectionGUID: MaOciZMWRDqStSP/9MpIeg==
X-CSE-MsgGUID: ikPbNuTZS7GH8zhz5aqrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123691321"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Mar 2025 03:11:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpmeL-000KsU-1o;
	Wed, 05 Mar 2025 11:10:54 +0000
Date: Wed, 5 Mar 2025 19:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, johan+linaro@kernel.org,
	dianders@chromium.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: Re: [PATCH v1] serial: qcom-geni: Remove alias dependency from qcom
 serial driver
Message-ID: <202503051821.tqFJ961p-lkp@intel.com>
References: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>

Hi Viken,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/serial-qcom-geni-Remove-alias-dependency-from-qcom-serial-driver/20250304-152222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250304071423.4033565-1-quic_vdadhani%40quicinc.com
patch subject: [PATCH v1] serial: qcom-geni: Remove alias dependency from qcom serial driver
config: x86_64-buildonly-randconfig-006-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051821.tqFJ961p-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051821.tqFJ961p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051821.tqFJ961p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/qcom_geni_serial.c:267:40: warning: variable 'port' is uninitialized when used here [-Wuninitialized]
     267 |                         line = idr_alloc(&port_idr, (void *)port, max_alias_num + 1, nr_ports,
         |                                                             ^~~~
   drivers/tty/serial/qcom_geni_serial.c:255:36: note: initialize the variable 'port' to silence this warning
     255 |         struct qcom_geni_serial_port *port;
         |                                           ^
         |                                            = NULL
   1 warning generated.


vim +/port +267 drivers/tty/serial/qcom_geni_serial.c

   252	
   253	static struct qcom_geni_serial_port *get_port_from_line(int line, bool console)
   254	{
   255		struct qcom_geni_serial_port *port;
   256		int nr_ports = console ? GENI_UART_CONS_PORTS : GENI_UART_PORTS;
   257	
   258		if (console) {
   259			if (line < 0 || line >= nr_ports)
   260				return ERR_PTR(-ENXIO);
   261	
   262			port = &qcom_geni_console_port;
   263		} else {
   264			int max_alias_num = of_alias_get_highest_id("serial");
   265	
   266			if (line < 0 || line >= nr_ports)
 > 267				line = idr_alloc(&port_idr, (void *)port, max_alias_num + 1, nr_ports,
   268						 GFP_KERNEL);
   269			else
   270				line = idr_alloc(&port_idr, (void *)port, line, nr_ports, GFP_KERNEL);
   271	
   272			if (line < 0)
   273				return ERR_PTR(-ENXIO);
   274	
   275			port = &qcom_geni_uart_ports[line];
   276		}
   277		return port;
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

