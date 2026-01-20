Return-Path: <linux-arm-msm+bounces-89821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGy3OGwncGmyWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:10:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E444EE75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AAADC3EB093
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89BA42314E;
	Tue, 20 Jan 2026 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghVv+3rr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DD5421F09;
	Tue, 20 Jan 2026 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768908791; cv=none; b=FmP9rMfHRaGhLSe9ToYBZV7xKwcpqjLCMNXlBE3ONcuL2foFYFBeyziFrEDFz68d75rvJe/gK6dt1IcPv3nRn9tAIsnj2QaCOoiPZMSyLtRcgxuWOyKZwo4IlFWnegdR7OCzwblCfkTa8DySrzF+7ZRpodjKtLW1RsdhUNp7BnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768908791; c=relaxed/simple;
	bh=A+Z3wrnP5sDbDJq3uwHYkkcS4B4ltkl3d1XG5v73lM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2ecsmKGUSx3JriUzvagOL5gyPaEOkjOuV3H1eoj6rOCoSqlk3VVnbXYHn69kDC54uXdByzbAfZKLdeTKXPqt933Kv7HKI+IBDsqreDPQpSn+4T7g/lxu4Eq9XbRxw6D3Eo/U4C3o4JH7QyXrJ1KYQW1TQX1MzQDMWiievRtQZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghVv+3rr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768908790; x=1800444790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A+Z3wrnP5sDbDJq3uwHYkkcS4B4ltkl3d1XG5v73lM4=;
  b=ghVv+3rrIZ3NNgW8kMZw3DZrZI1zBQuyHmW9okFqQKKS5p2zMNlZ4Gxr
   PLatPq/W4M93jriyq6ku5lNlMND2AxKSv/LF9SpvIDShC5SG7epStsMSG
   UbYw32FBYmihQQGSNpYFuoL3PN0P6Ah89ho6DYHdISdSxaa/idASiDhLP
   iQmGHjMhJjfw7p4fxYvma68z1X/3g+j0PzrfdW5RWMk7jZujwgBjy4QTL
   a94ygf7nehSEIatMPqDF1IT1Na/wLbXG1ZjLgYBGQwqWXhsZYnKP1gbW/
   76K2kUEKxLSlNhQ5cpl5aDQ4sbb5JjF3ewBc1NXBI3E8zHfmkyoaMWdwX
   g==;
X-CSE-ConnectionGUID: b3z+rzBXRUyUWdnRquDwuA==
X-CSE-MsgGUID: ucadC5PYR92bW97VQY+mXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73982619"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="73982619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 03:33:03 -0800
X-CSE-ConnectionGUID: lOKi9zYeS56TXwlx2KAP8A==
X-CSE-MsgGUID: umVVrEKHQya7yS7W3Ll2Ug==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2026 03:32:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi9yi-00000000OtN-1vy4;
	Tue, 20 Jan 2026 11:32:56 +0000
Date: Tue, 20 Jan 2026 19:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH 2/3] iio: light: add AMS TCS3400 RGB and RGB-IR color
 sensor driver
Message-ID: <202601201908.GaxFkE6t-lkp@intel.com>
References: <20260119-tsc3400-v1-2-82a65c5417aa@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-tsc3400-v1-2-82a65c5417aa@protonmail.com>
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89821-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,protonmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm,petr.hodina.protonmail.com,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 90E444EE75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Petr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Hodina-via-B4-Relay/doc-add-Device-Tree-binding-for-AMS-TCS3400-light-sensor/20260120-012240
base:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
patch link:    https://lore.kernel.org/r/20260119-tsc3400-v1-2-82a65c5417aa%40protonmail.com
patch subject: [PATCH 2/3] iio: light: add AMS TCS3400 RGB and RGB-IR color sensor driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601201908.GaxFkE6t-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201908.GaxFkE6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201908.GaxFkE6t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/light/tcs3400.c:82:18: warning: unused variable 'tcs3400_gains' [-Wunused-const-variable]
      82 | static const int tcs3400_gains[] = {1, 4, 16, 64};
         |                  ^~~~~~~~~~~~~
   1 warning generated.


vim +/tcs3400_gains +82 drivers/iio/light/tcs3400.c

    81	
  > 82	static const int tcs3400_gains[] = {1, 4, 16, 64};
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

