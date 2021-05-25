Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2A838FDA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 11:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhEYJWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 05:22:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:31642 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231971AbhEYJWD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 05:22:03 -0400
IronPort-SDR: D3fPq79nSYoj4Y7x5KaEKq5WCeJJBz+He0TcQezOLBDtGqBI/0ly7WAIHaetJnFvWieetyp1FL
 T5sjruJvDrMA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="199094309"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="199094309"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 02:20:33 -0700
IronPort-SDR: OrD3r1B531jdCPZliHRgzxPYZP+m/ydrMHpCTNghEo9LHv25v5FXhv+aZlCgp6qQMQ27tw8pKQ
 ixxjIbewQRNQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="476329263"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.11]) ([10.239.13.11])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 02:20:28 -0700
Subject: Re: [kbuild-all] Re: [PATCH V2] arm64: dts: sc7280: Add qspi, qupv3_0
 and qupv3_1 nodes
To:     rojay@codeaurora.org, kernel test robot <lkp@intel.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
References: <20210422150556.450-1-rojay@codeaurora.org>
 <202104230503.T7HqjQbJ-lkp@intel.com>
 <6950c9c7b54892b2a8e81915743431ea@codeaurora.org>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <de30ea1c-5572-ca4e-e473-7b77724a90d8@intel.com>
Date:   Tue, 25 May 2021 17:19:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6950c9c7b54892b2a8e81915743431ea@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/23/21 5:46 PM, rojay@codeaurora.org wrote:
> On 2021-04-23 02:52, kernel test robot wrote:
>> Hi Roja,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on next-20210422]
>> [cannot apply to robh/for-next v5.12-rc8 v5.12-rc7 v5.12-rc6 v5.12-rc8]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:
>> https://github.com/0day-ci/linux/commits/Roja-Rani-Yarubandi/arm64-dts-sc7280-Add-qspi-qupv3_0-and-qupv3_1-nodes/20210422-230756 
>>
>> base:    c457d9676496f5a895509f9c510278beaaffc829
>> config: arm64-randconfig-r012-20210421 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project
>> f5446b769a7929806f72256fccd4826d66502e59)
>> reproduce (this is a W=1 build):
>>         wget
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>> -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install arm64 cross compiling tool for clang build
>>         # apt-get install binutils-aarch64-linux-gnu
>>         #
>> https://github.com/0day-ci/linux/commit/78ed1b1d4c9f34dd06ae4494b78d70334fa8d7c1 
>>
>>         git remote add linux-review https://github.com/0day-ci/linux
>>         git fetch --no-tags linux-review
>> Roja-Rani-Yarubandi/arm64-dts-sc7280-Add-qspi-qupv3_0-and-qupv3_1-nodes/20210422-230756 
>>
>>         git checkout 78ed1b1d4c9f34dd06ae4494b78d70334fa8d7c1
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
>> ARCH=arm64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/qcom/sc7280.dtsi:325.31-32 syntax error
>>    FATAL ERROR: Unable to parse input tree
>>
>
> This error is due to "clk_virt" node parse issue which will be defined 
> in ICC patches
> https://lore.kernel.org/patchwork/project/lkml/list/?series=488429
> I also mentioned the dependency in the patch.

Hi Roja,

Thanks for the clarification, we can parse the base commit from patch to 
avoid false positive:

     $ man git format-patch

          With git format-patch --base=P -3 C (or variants thereof, e.g. 
with --cover-letter or using Z..C instead of -3 C to specify the range), 
the base tree information block is shown at the end of the first message 
the command outputs (either the first patch, or the cover
        letter), like this:

            base-commit: P
            prerequisite-patch-id: X
            prerequisite-patch-id: Y
            prerequisite-patch-id: Z

Best Regards,
Rong Chen
