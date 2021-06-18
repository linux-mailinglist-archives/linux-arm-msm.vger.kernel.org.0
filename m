Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345CE3AC266
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 06:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhFREhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 00:37:55 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16904 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231852AbhFREhy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 00:37:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623990946; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=VS50oBO1Adu4g9icjdy9gPt5cwaT+R969SEWKsp0mcY=; b=DTha6zkM+aT7u4S/PtKLvHajfnqZjGj6jsiKwwTK43imShiTGtZ9aiYb73hBQVGaLwsCMteP
 NHQ48bgRVmNBAaiRHK+ENSakEzA28WwGSICVg75oB5QUmOp/N7bD098NhGQeaPgxoXm9Rg7t
 7y3aBKfPDzXQKhulsUjsf0m/R7A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60cc22a1b6ccaab75306dc10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 04:35:45
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0C512C4338A; Fri, 18 Jun 2021 04:35:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DDF3C433D3;
        Fri, 18 Jun 2021 04:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DDF3C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Thu, 17 Jun 2021 21:35:38 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     kernel test robot <lkp@intel.com>, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10 5/6] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
 property by default
Message-ID: <20210618043538.GD25299@jackp-linux.qualcomm.com>
References: <1623923899-16759-6-git-send-email-wcheng@codeaurora.org>
 <202106180154.U0by7POV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106180154.U0by7POV-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wesley,

On Fri, Jun 18, 2021 at 02:04:40AM +0800, kernel test robot wrote:
> Hi Wesley,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on usb/usb-testing]
> [also build test ERROR on robh/for-next v5.13-rc6 next-20210617]
> [cannot apply to balbi-usb/testing/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Wesley-Cheng/Re-introduce-TX-FIFO-resize-for-larger-EP-bursting/20210617-180037
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> config: csky-randconfig-s031-20210617 (attached as .config)
> compiler: csky-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://github.com/0day-ci/linux/commit/54b6eb3d44464c519a4546e9a2c3041eeced1009
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Wesley-Cheng/Re-introduce-TX-FIFO-resize-for-larger-EP-bursting/20210617-180037
>         git checkout 54b6eb3d44464c519a4546e9a2c3041eeced1009
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=csky 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "of_add_property" [drivers/usb/dwc3/dwc3-qcom.ko] undefined!

*sigh* this symbol is not EXPORTed...so you can't call it from a module.

Actually couldn't we just use device_add_properties() instead? And drop
patch 4/6 as well.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
