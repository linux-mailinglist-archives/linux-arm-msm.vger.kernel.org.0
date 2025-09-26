Return-Path: <linux-arm-msm+bounces-75229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E02BA21C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 02:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEF8A3A656B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 00:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCB084A3E;
	Fri, 26 Sep 2025 00:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEUGUi//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC226ACB;
	Fri, 26 Sep 2025 00:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758847855; cv=none; b=mhUw+gwJIYmRXiEo0kDlR+LGKX0W7tLRelaSFwebVWHhzNCOmYiftmdc0v98ynPbJxXSl6dUedR5j4bVhg5j5Kume3tnthdoybS5lZyugn6P7VnO5ejAlnVzPfJzVlxAuKZqagRpT2sQpF3NmB7ob9VZC8NVkwjrn9qIyUKAWQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758847855; c=relaxed/simple;
	bh=bNfp9W4rHs68BhEoWab1aN4qWrUqvFrlFErQ427POmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T38MgUfHy4oxtGuNaAIaJ9VvJEthGlVTq4KzHo+8pcqrsgMOF1lQ3fK/5zZgaEetdrmmQf6OmSeGyNScdHXsXLbp8LOKIvrg7voZCLPC2NghsIKH2ezlDSx/+vdqlYGlkI4Yg5b7FOVaeWZpco/1t8NnoWdZiTT5ytm0cJ2d7As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEUGUi//; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758847854; x=1790383854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bNfp9W4rHs68BhEoWab1aN4qWrUqvFrlFErQ427POmA=;
  b=PEUGUi//v7YMtkLolnDm6jihtGHWx4wiPc7E65cKGPTrZSMsraWOdaAw
   g734ymkn2zrX7w4DkI9KgIsq76pQ3lWJiUNevUGL8w1ti1hOKbfid8mV3
   kSUnS/Mo5id8vK+Jq+b8JHoeUK/g7ziPiNVNUd+1hOKCNaO94dSz8z5jv
   p0mWH5ZgOVitEeCcYDqzwANoQQbVG9qSFoObPp7Kj+yQ5hotUNCtQNKis
   aJ+lpfYzZ5thraKCvcFiEvXyck6aHmM84OduR9aSh+hdY/R1exdx9DvN1
   AJc5LyDhHLETQV6gGqPGvAS4jOInXLUItPrgDhjQJyaEqQ/i2AKm2UTsB
   Q==;
X-CSE-ConnectionGUID: 7YhoC15SRIKL4PlMGJD+YA==
X-CSE-MsgGUID: Awcf4+eLRfmVka68mIIOXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="64811011"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="64811011"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 17:50:53 -0700
X-CSE-ConnectionGUID: G7uNjpa8QJmvXrPPrQoIPA==
X-CSE-MsgGUID: QSowVCNgQHuBZHaB+Zjapw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="177871549"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2025 17:50:50 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1wfg-0005mL-1y;
	Fri, 26 Sep 2025 00:50:48 +0000
Date: Fri, 26 Sep 2025 08:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, lumag@kernel.org,
	neil.armstrong@linaro.org, johan+linaro@kernel.org,
	quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <202509260852.9BZHHRAh-lkp@intel.com>
References: <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>

Hi Anjelique,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.17-rc7 next-20250925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjelique-Melendez/usb-typec-ucsi_glink-Update-request-response-buffers-to-be-packed/20250925-074205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250924232631.644234-3-anjelique.melendez%40oss.qualcomm.com
patch subject: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to support UCSI v2
config: i386-randconfig-061-20250926 (https://download.01.org/0day-ci/archive/20250926/202509260852.9BZHHRAh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260852.9BZHHRAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509260852.9BZHHRAh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/typec/ucsi/ucsi_glink.c:98:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] owner @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:98:23: sparse:     expected restricted __le32 [usertype] owner
   drivers/usb/typec/ucsi/ucsi_glink.c:98:23: sparse:     got int
   drivers/usb/typec/ucsi/ucsi_glink.c:99:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:99:22: sparse:     expected restricted __le32 [usertype] type
   drivers/usb/typec/ucsi/ucsi_glink.c:99:22: sparse:     got int
   drivers/usb/typec/ucsi/ucsi_glink.c:100:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] opcode @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:100:24: sparse:     expected restricted __le32 [usertype] opcode
   drivers/usb/typec/ucsi/ucsi_glink.c:100:24: sparse:     got int
>> drivers/usb/typec/ucsi/ucsi_glink.c:152:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] owner @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:152:23: sparse:     expected restricted __le32 [addressable] [usertype] owner
   drivers/usb/typec/ucsi/ucsi_glink.c:152:23: sparse:     got int
>> drivers/usb/typec/ucsi/ucsi_glink.c:153:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] type @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:153:22: sparse:     expected restricted __le32 [addressable] [usertype] type
   drivers/usb/typec/ucsi/ucsi_glink.c:153:22: sparse:     got int
>> drivers/usb/typec/ucsi/ucsi_glink.c:154:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] opcode @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:154:24: sparse:     expected restricted __le32 [addressable] [usertype] opcode
   drivers/usb/typec/ucsi/ucsi_glink.c:154:24: sparse:     got int

vim +152 drivers/usb/typec/ucsi/ucsi_glink.c

467399d989d799 Dmitry Baryshkov   2024-06-27  142  
62b5412b1f4afa Neil Armstrong     2023-03-21  143  static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
62b5412b1f4afa Neil Armstrong     2023-03-21  144  					const void *val, size_t val_len)
62b5412b1f4afa Neil Armstrong     2023-03-21  145  {
87289544ef0b29 Anjelique Melendez 2025-09-24  146  	struct ucsi_v2_write_buf_req_msg req = {};
87289544ef0b29 Anjelique Melendez 2025-09-24  147  	unsigned long left, max_buf_len;
87289544ef0b29 Anjelique Melendez 2025-09-24  148  	size_t req_len;
62b5412b1f4afa Neil Armstrong     2023-03-21  149  	int ret;
62b5412b1f4afa Neil Armstrong     2023-03-21  150  
87289544ef0b29 Anjelique Melendez 2025-09-24  151  	memset(&req, 0, sizeof(req));
62b5412b1f4afa Neil Armstrong     2023-03-21 @152  	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
62b5412b1f4afa Neil Armstrong     2023-03-21 @153  	req.hdr.type = MSG_TYPE_REQ_RESP;
62b5412b1f4afa Neil Armstrong     2023-03-21 @154  	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
87289544ef0b29 Anjelique Melendez 2025-09-24  155  
87289544ef0b29 Anjelique Melendez 2025-09-24  156  	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
87289544ef0b29 Anjelique Melendez 2025-09-24  157  		req_len = sizeof(struct ucsi_v2_write_buf_req_msg);
87289544ef0b29 Anjelique Melendez 2025-09-24  158  		max_buf_len = UCSI_BUF_V2_SIZE;
87289544ef0b29 Anjelique Melendez 2025-09-24  159  	} else if (ucsi->ucsi->version) {
87289544ef0b29 Anjelique Melendez 2025-09-24  160  		req_len = sizeof(struct ucsi_v1_write_buf_req_msg);
87289544ef0b29 Anjelique Melendez 2025-09-24  161  		max_buf_len = UCSI_BUF_V1_SIZE;
87289544ef0b29 Anjelique Melendez 2025-09-24  162  	} else {
87289544ef0b29 Anjelique Melendez 2025-09-24  163  		return -EINVAL;
87289544ef0b29 Anjelique Melendez 2025-09-24  164  	}
87289544ef0b29 Anjelique Melendez 2025-09-24  165  
87289544ef0b29 Anjelique Melendez 2025-09-24  166  	if (offset + val_len > max_buf_len)
87289544ef0b29 Anjelique Melendez 2025-09-24  167  		return -EINVAL;
87289544ef0b29 Anjelique Melendez 2025-09-24  168  
62b5412b1f4afa Neil Armstrong     2023-03-21  169  	memcpy(&req.buf[offset], val, val_len);
62b5412b1f4afa Neil Armstrong     2023-03-21  170  
62b5412b1f4afa Neil Armstrong     2023-03-21  171  	reinit_completion(&ucsi->write_ack);
62b5412b1f4afa Neil Armstrong     2023-03-21  172  
87289544ef0b29 Anjelique Melendez 2025-09-24  173  	ret = pmic_glink_send(ucsi->client, &req, req_len);
62b5412b1f4afa Neil Armstrong     2023-03-21  174  	if (ret < 0) {
62b5412b1f4afa Neil Armstrong     2023-03-21  175  		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
62b5412b1f4afa Neil Armstrong     2023-03-21  176  		return ret;
62b5412b1f4afa Neil Armstrong     2023-03-21  177  	}
62b5412b1f4afa Neil Armstrong     2023-03-21  178  
62b5412b1f4afa Neil Armstrong     2023-03-21  179  	left = wait_for_completion_timeout(&ucsi->write_ack, 5 * HZ);
62b5412b1f4afa Neil Armstrong     2023-03-21  180  	if (!left) {
62b5412b1f4afa Neil Armstrong     2023-03-21  181  		dev_err(ucsi->dev, "timeout waiting for UCSI write response\n");
62b5412b1f4afa Neil Armstrong     2023-03-21  182  		return -ETIMEDOUT;
62b5412b1f4afa Neil Armstrong     2023-03-21  183  	}
62b5412b1f4afa Neil Armstrong     2023-03-21  184  
62b5412b1f4afa Neil Armstrong     2023-03-21  185  	return 0;
62b5412b1f4afa Neil Armstrong     2023-03-21  186  }
62b5412b1f4afa Neil Armstrong     2023-03-21  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

