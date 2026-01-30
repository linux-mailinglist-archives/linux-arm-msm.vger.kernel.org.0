Return-Path: <linux-arm-msm+bounces-91234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH+zLMErfGkfLAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:55:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D583B6F33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F1963007B2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F026D365A09;
	Fri, 30 Jan 2026 03:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfnXPMN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7847E331A6D;
	Fri, 30 Jan 2026 03:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769745334; cv=none; b=XWuIo0k8hHL2oX1vHHeJTUm9BGzz0bGq4GHXQ7lc0GXmXc4lhGeXuRDYuyEPTOBPoaljByB+IEQAwLXrJELSPLRwGC027C6TqtF6dNz0aCv2efC2/v0R1XLgU/lQS4a3mWS2E1ltm03nbeRtOHOUd8oP6PNt0GipwuraTC2U1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769745334; c=relaxed/simple;
	bh=KhWGgwgvDPdOVyC1KHPlz0xY4hWUFHb7XvduW4ZcQFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ddzm1vXU6DlFbWJzT6/nfyonBCT2kaWW0MnYAMyREhTAHoNp1tcK+LMtj4unnsPjKp+t1oTkee2R+XkmTAXJ0ilm4ThmEHYfvkUC+C0utRn/eNIl1zu67Dx7dGWCa5dtip37t1KHIqAlm9wBmosQIA5tyegTb8aAWzdZDXQKpek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfnXPMN8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769745334; x=1801281334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhWGgwgvDPdOVyC1KHPlz0xY4hWUFHb7XvduW4ZcQFQ=;
  b=AfnXPMN8sspMDBl+ls238SFkidNI7UqPC8rdZZgeww7CsszR7Jf4MGlM
   30yQD/nla+yQDHs8X8QktIggFObLUSyZ5wA0vpSOuiEHk9oEyS9KxtzsJ
   dCxo3EHKgUP2Q28L/gw4kzUjOH8pWMm493SOuGS/myELhVCaDLDN3GFG7
   7f9CY/Ym+wZ3n0ye476KhGkARgfSz2Jsgb6gFw74CqTsDoDwhsbodQOnC
   z9RBlbuoX9NphMP8Gg1X5y5hiOoafeH1ilxGvBxReWMOyUNsniov22Op6
   dLY9FAkFhMoUtRO4DHrgDuGch86lgiaZWEWyfy5UIjcS3lFghWna5yGth
   g==;
X-CSE-ConnectionGUID: A99/W2WoSX2Z3ZGiN3ii3g==
X-CSE-MsgGUID: tcqaPJdGS3ezo+/gpe47rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71048419"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="71048419"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 19:55:31 -0800
X-CSE-ConnectionGUID: jLLz5KQMSPqMJFNaKzPA+A==
X-CSE-MsgGUID: 4w2UY78vRCeyyD7R/ZCT7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="240005116"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 19:55:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlfbR-00000000c98-3Q7O;
	Fri, 30 Jan 2026 03:55:25 +0000
Date: Fri, 30 Jan 2026 11:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sumit.garg@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <202601301122.Oy62xjdX-lkp@intel.com>
References: <20260129062825.666457-5-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129062825.666457-5-varadarajan.narayanan@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91234-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D583B6F33
X-Rspamd-Action: no action

Hi Varadarajan,

kernel test robot noticed the following build errors:

[auto build test ERROR on fcb70a56f4d81450114034b2c61f48ce7444a0e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/arm64-dts-qcom-ipq9574-Add-gpio-details-for-eMMC/20260129-143219
base:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
patch link:    https://lore.kernel.org/r/20260129062825.666457-5-varadarajan.narayanan%40oss.qualcomm.com
patch subject: [PATCH v3 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
config: arm64-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260130/202601301122.Oy62xjdX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301122.Oy62xjdX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301122.Oy62xjdX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb', needed by 'arch/arm64/boot/dts/qcom/'.
   make[4]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

