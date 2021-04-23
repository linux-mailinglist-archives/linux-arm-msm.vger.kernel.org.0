Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB83F368FB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 11:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241898AbhDWJrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 05:47:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46118 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241818AbhDWJrE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 05:47:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619171188; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Y4r/sBksddih4An+rVdi9oFleJsyckug23va/2vBzpA=;
 b=YO1NQJnRB19iJi6IVW8coBuapJT8sf08SpIxOHLYYtLZZP7477x6h4ZhCW8ddVv1SRlJRbIG
 oduYVKEELXwVf4wPMla5Sr78f6vqdIByHxLZfoEdHo9CsgWmAQDPPyOTpe9mIEc1Dc5GQJ0u
 Ry2ZGLUbFVbUNDhEXF7YHYk2CEI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60829772215b831afb08e8da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Apr 2021 09:46:26
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E0E2EC43143; Fri, 23 Apr 2021 09:46:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C3513C433F1;
        Fri, 23 Apr 2021 09:46:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 23 Apr 2021 15:16:24 +0530
From:   rojay@codeaurora.org
To:     kernel test robot <lkp@intel.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2] arm64: dts: sc7280: Add qspi, qupv3_0 and qupv3_1
 nodes
In-Reply-To: <202104230503.T7HqjQbJ-lkp@intel.com>
References: <20210422150556.450-1-rojay@codeaurora.org>
 <202104230503.T7HqjQbJ-lkp@intel.com>
Message-ID: <6950c9c7b54892b2a8e81915743431ea@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-23 02:52, kernel test robot wrote:
> Hi Roja,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on next-20210422]
> [cannot apply to robh/for-next v5.12-rc8 v5.12-rc7 v5.12-rc6 v5.12-rc8]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:
> https://github.com/0day-ci/linux/commits/Roja-Rani-Yarubandi/arm64-dts-sc7280-Add-qspi-qupv3_0-and-qupv3_1-nodes/20210422-230756
> base:    c457d9676496f5a895509f9c510278beaaffc829
> config: arm64-randconfig-r012-20210421 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project
> f5446b769a7929806f72256fccd4826d66502e59)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
> https://github.com/0day-ci/linux/commit/78ed1b1d4c9f34dd06ae4494b78d70334fa8d7c1
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review
> Roja-Rani-Yarubandi/arm64-dts-sc7280-Add-qspi-qupv3_0-and-qupv3_1-nodes/20210422-230756
>         git checkout 78ed1b1d4c9f34dd06ae4494b78d70334fa8d7c1
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> ARCH=arm64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm64/boot/dts/qcom/sc7280.dtsi:325.31-32 syntax error
>    FATAL ERROR: Unable to parse input tree
> 

This error is due to "clk_virt" node parse issue which will be defined 
in ICC patches
https://lore.kernel.org/patchwork/project/lkml/list/?series=488429
I also mentioned the dependency in the patch.

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
