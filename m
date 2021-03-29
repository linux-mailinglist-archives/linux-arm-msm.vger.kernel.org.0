Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4110B34C0B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 02:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhC2AvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Mar 2021 20:51:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:4032 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231643AbhC2AvE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Mar 2021 20:51:04 -0400
IronPort-SDR: 2DHVheUurMvLjwBU8OHPE6coY4UsMT/KTymeQTIZojbJQzUPevBEY5IYtpN0SG1rbswS/ZflJD
 RBRURisp5+Jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="191483948"
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; 
   d="scan'208";a="191483948"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2021 17:51:02 -0700
IronPort-SDR: 40zU5ISxmkGYAJuyQdJsEfIVD3hYBfGegW7OUK5gd9dlmpnibhAoz9jbRNN8qqvXiD1PYxBKOM
 53qDfXEvBYow==
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; 
   d="scan'208";a="410824156"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2021 17:50:59 -0700
Date:   Mon, 29 Mar 2021 08:50:09 +0800
From:   kernel test robot <rong.a.chen@intel.com>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH 5/5] arm: dts: qcom: Add initial DTS file for Samsung
 Galaxy S III Neo phone
Message-ID: <20210329005009.GI4176174@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326145816.9758-6-bartosz.dudziak@snejp.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bartosz,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next v5.12-rc4 next-20210326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bartosz-Dudziak/Samsung-Galaxy-S-III-Neo-Initial-DTS/20210326-230134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=arm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dt.yaml: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/root-node.yaml

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
