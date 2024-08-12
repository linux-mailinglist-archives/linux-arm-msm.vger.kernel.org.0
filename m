Return-Path: <linux-arm-msm+bounces-28341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F04DC94F6FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 20:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9783A1F21E15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 18:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF7E1922CF;
	Mon, 12 Aug 2024 18:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XB3oATZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96E6191F87;
	Mon, 12 Aug 2024 18:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723488949; cv=none; b=YAkCJ5bP+VddBDpvZGNAA694dO7S4JBTC+nhTm5hdCFYBo3rr4ZQv/ymkcdWx4vmMBHjeCHPHMqtYhHOfVpc2Sn8RL8IEK6uLbtz6595iccInbF8c+nGrLupheHkjWRB0qR9mWbzvmZBc3QzfthOwui5iTzIUpQwytdeL/iosX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723488949; c=relaxed/simple;
	bh=B5BEooWbXns9FqM7SphnSy2fTJ6k8eGrtOclcI7lgiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsxyVsyr0omMGx5/IHkt0fWFbWf8NOVYdhEoKVV+382vSS7rVtAAxZByul/Ma1Og02CCUayPAELun830V5erbDsxYc9Di4ojBVq9uHWJtBDJMVUUWE1qY1XbJbf5P9AvoAEEDboQFovK1iDcXPx/KOE9BGK8gZH0cs6wXVUSh1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XB3oATZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1787DC4AF11;
	Mon, 12 Aug 2024 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723488949;
	bh=B5BEooWbXns9FqM7SphnSy2fTJ6k8eGrtOclcI7lgiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XB3oATZZq/HVwy3getzobhmfKDZGNXrFpNepiFYAIqlUjEFKqt+4V6RwwPUtwZ9W+
	 b1ms3Tj8ArDRybPqIGszJxuB5ioaMJNimQotOprxiDpijYFrsssQUZrbqzyZcGPvQ7
	 vszd69VkHrHwkX0GVKctOI+ze/+Oa/5kUnFhez4eHnYZBeweiHg9arDhqtamvC5OHW
	 hS+OqE6bDTC30Zl7GpKrWPfbmb+R/ut9HiwbpvNpHy+PJDpWdciUtTGjR63nVvyoZ8
	 1Geb4WtinZgapHY80eYVwNle6l1OXS2S4iZpc/ahGYAVc3BFUjhMNkdqUcbuN/QF4p
	 zw7XPQLy5HMvg==
Date: Mon, 12 Aug 2024 12:00:08 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Message-ID: <ilm5yfvrlabfe45d6cf2zazzdxw3qcknrthbgzroi764jhh2wo@qcn2ozt6mer3>
References: <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
 <202408122011.adSQGOUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408122011.adSQGOUp-lkp@intel.com>

On Mon, Aug 12, 2024 at 08:21:54PM GMT, kernel test robot wrote:
> Hi Bjorn,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 864b1099d16fc7e332c3ad7823058c65f890486c]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/dt-bindings-usb-snps-dwc3-Split-core-description/20240812-111102
> base:   864b1099d16fc7e332c3ad7823058c65f890486c
> patch link:    https://lore.kernel.org/r/20240811-dwc3-refactor-v2-4-91f370d61ad2%40quicinc.com
> patch subject: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
> config: i386-buildonly-randconfig-005-20240812 (https://download.01.org/0day-ci/archive/20240812/202408122011.adSQGOUp-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122011.adSQGOUp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408122011.adSQGOUp-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/usb/dwc3/core.c:39:10: fatal error: glue.h: No such file or directory
>       39 | #include "glue.h"
>          |          ^~~~~~~~
>    compilation terminated.

Sorry about that, seems I missed the git add on the header file where I
declare the exported symbols.

Regards,
Bjorn

> 
> 
> vim +39 drivers/usb/dwc3/core.c
> 
>     36	
>     37	#include "core.h"
>     38	#include "gadget.h"
>   > 39	#include "glue.h"
>     40	#include "io.h"
>     41	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

