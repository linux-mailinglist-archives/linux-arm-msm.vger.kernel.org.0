Return-Path: <linux-arm-msm+bounces-24681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBDC91C7EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 23:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7217C281486
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 21:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536987BAEC;
	Fri, 28 Jun 2024 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYyhk1yR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAED1CF8D;
	Fri, 28 Jun 2024 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609230; cv=none; b=Iqmlj58xnx6y7QJnjUCPzMJVKM7HFlNCOQ5UR/Z8nG/wLla7IMOdufgZRK6B0+aPzACoqHVqyW7lNH4nSeHkywMS0XmmAG0iUWUUL59mCup/r291+MnptKRfMyaHshR4WcppNvTjseiB32I4Eq6VRygeCmzUBx1Yq6At2fSByVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609230; c=relaxed/simple;
	bh=Iryb2m+gPPfQ3XTaob5zRURXXDuc2yMHNXPEQAvj6n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Te9YrYTHqaTxc7cagxRSDMf+i5KEaBQAHJTkuCsovDbz3CWKA5wVg7jFrgoPj/9N4gYGW4eDdw1psNPIszvuviKjo22fnOE2mETqzsJMLc8ye0WMG7Th5V5CmgdT0HHepIDVkzo4H1g7dJf4PxF7XZHpn7WIjs8KWxwZMtS1vPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYyhk1yR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719609228; x=1751145228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iryb2m+gPPfQ3XTaob5zRURXXDuc2yMHNXPEQAvj6n8=;
  b=hYyhk1yRzY/TxNECXv2mJn7i1LD+eFP40w6q+ogkc4v0jxrwAiUU0tSF
   zPoyj8w4lIqJ65CYDMiVWbxkLt/UrlBZJYg9HlQRxVboytCJDOaAeygw2
   Gv0+x1auZB8255Qah4jcTRRwa9PwmWBtKhCCX8k51o3CbelkaJf+PtAAG
   JW2eqfHf17NaMb/AAtePmBa15uPJEACmgoMKktQ0MLum4bGrzNp6RGllR
   21BMYmRlx8tVXc39VSp7IcNiM619eWq7XZ8I+vMfljg6TXArrMiUl52mY
   0lY66EP+myOHH79A/ueVP9WDxrnexKjVUNOG/PgfIazzoOpwnG/xmTVoO
   Q==;
X-CSE-ConnectionGUID: HH0QmtnCRa+suO1VVI8KuA==
X-CSE-MsgGUID: /nYmtFpESUKE2KOsXv7Ldw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="42226285"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="42226285"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 14:13:44 -0700
X-CSE-ConnectionGUID: boN5JxTlR36UuSKhRsTXaQ==
X-CSE-MsgGUID: rUbbWsXOSXaE3yQ4xFmbHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44838891"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jun 2024 14:13:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNIuY-000IUI-18;
	Fri, 28 Jun 2024 21:13:38 +0000
Date: Sat, 29 Jun 2024 05:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, sboyd@kernel.org,
	andersson@kernel.org, bjorn.andersson@linaro.org,
	david.brown@linaro.org, devicetree@vger.kernel.org,
	jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
	mturquette@baylibre.com, ohad@wizery.com, robh@kernel.org,
	sricharan@codeaurora.org
Cc: oe-kbuild-all@lists.linux.dev, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
Message-ID: <202406290444.4W2Fba5X-lkp@intel.com>
References: <20240621114659.2958170-9-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-9-quic_gokulsri@quicinc.com>

Hi Gokul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.10-rc5 next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gokul-Sriram-Palanisamy/remoteproc-qcom-Add-PRNG-proxy-clock/20240625-162317
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240621114659.2958170-9-quic_gokulsri%40quicinc.com
patch subject: [PATCH v9 8/8] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240629/202406290444.4W2Fba5X-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290444.4W2Fba5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290444.4W2Fba5X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@59000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@59000: 'vdda-phy-dpdm-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: phy@79000: 'vdda-phy-dpdm-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
--
>> arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
--
>> arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

