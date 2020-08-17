Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6D82467FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 16:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbgHQOJE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 10:09:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14050 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728399AbgHQOJE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 10:09:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597673343; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=t4hLN9MLXcZJt9GM/Fc8JoQMEeFYiDnOvn2HIImnesY=;
 b=RqD/Z/7LpEoeCVP3lkCRHr5VVkhGA8hFrw8l7/7rXXbzQgbYlDiAb81BMmXDQLU2dH+vApq2
 hgI3+hzS9oTlsB3H52QVhOEnbifKAwLJjrAUyKM/GHlMVVd2H/V1hgjx806d/XOfF2EvqlRL
 uohSSjswVvH4Ir46bgajvsv0HN0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f3a8f7346ed996674108e83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 14:08:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56138C4339C; Mon, 17 Aug 2020 14:08:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B220C433CA;
        Mon, 17 Aug 2020 14:08:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 17 Aug 2020 19:38:50 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: llcc: Support chipsets that can write to llcc
 registers
In-Reply-To: <202008172052.mtVMHotl%lkp@intel.com>
References: <20200817081138.6755-1-saiprakash.ranjan@codeaurora.org>
 <202008172052.mtVMHotl%lkp@intel.com>
Message-ID: <ca48bfaf94267bc9883ad6c41de3f796@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-17 18:13, kernel test robot wrote:
> Hi Sai,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on linux/master]
> [also build test WARNING on linus/master v5.9-rc1 next-20200817]
> [cannot apply to agross-msm/qcom/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:
> https://github.com/0day-ci/linux/commits/Sai-Prakash-Ranjan/soc-qcom-llcc-Support-chipsets-that-can-write-to-llcc-registers/20200817-161342
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> bcf876870b95592b52519ed4aafcf9d95999bc9c
> config: mips-randconfig-r006-20200817 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> de71b46a519db014ce906a39f8a0e1b235ef1568)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 
> ARCH=mips
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/soc/qcom/llcc-qcom.c:343:28: warning: unused variable 'np'
> [-Wunused-variable]
>            const struct device_node *np = dev_of_node(&pdev->dev);
>                                      ^
>>> drivers/soc/qcom/llcc-qcom.c:324:34: warning: unused variable 
>>> 'qcom_llcc_configure_of_match' [-Wunused-const-variable]
>    static const struct of_device_id qcom_llcc_configure_of_match[] = {
>                                     ^
>    2 warnings generated.
> 

Ok, W=1 build and CONFIG_OF=n, so I need __maybe_unused for 
qcom_llcc_configure_of_match.
Will add and send v2.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
