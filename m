Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109D02EB8D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 05:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbhAFEUD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 23:20:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbhAFEUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 23:20:02 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62986C06134C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 20:19:22 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id 143so1508468qke.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 20:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u+rZTgPQ/0tYd3Q31a5yndOfQlqM+ffAw2M2RQLrP9Q=;
        b=yrawTDvHsjFvSCz1+bQA79KljxWL4RkQREP8vqoQRrSudyNjL5fvJ+fvKe+8rtM0h6
         iexQ5282IhJyo/AJA4Vkss2w+huVTU25wQu0Z9hhA8zPCQhDa7GLg1tbq5Ad3vOF3KY2
         tOFmI8+lizcZuiVHMWBv8Gvjo86caYhDU1c4MOOh/W47oV6OMEbx3NHutFYqiPNoat+j
         d0vcv84v+g1B24EhOq8XSeNAczGCoCjWHy3IutJpdz3yaEa3Ewu/af7W2qMn42yc88uW
         3xKgU4JtddiepxaeVRab4r6gWgdYxTm11S0Bg5UDi76a6OlE5Uksv5v91bxCKn9GH8HB
         2UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u+rZTgPQ/0tYd3Q31a5yndOfQlqM+ffAw2M2RQLrP9Q=;
        b=NwJ7S5Lv8JafgOFISNidXY17ULPGzviy3xK1yVXtRX11/Jxs6q+5JhE1KDIUvGCTWf
         yxVOrFWSFBMXELfp7Opz44Z6C2BGx6Gyr8eyfynVkASWKUmXtzw4yDtrYMbY/LDKX8MK
         E3gyJo83+yp6035MbAUHKwXELmrEyjNL1UluTBJuTxxYTeZ7i/pdyX0zNhhtsLQUU4FO
         PYAwiyE1Ow2rnFifdmHy4Au+hJHseBWhaqTJZBln2prMyT/GGu1pDGQNGeACNHncL5N1
         SSVwgPeTZqa+sWav21zTN6lnvyu9X3krfnvGFOlEXDYgYSPVGgUF/f4xiD94I85QmFk0
         uO3Q==
X-Gm-Message-State: AOAM531u/rxC/6pjsfqbsXm56vHKccjEpHD+UTM3zBjOFCWQh0VUdaDD
        pqt6G5Avyz+XVoEvleTbVmQpEw==
X-Google-Smtp-Source: ABdhPJxbIickrC2TsmgL5GUzwX9jnmOjni5nZnGWx8E2KzrC15rbaZoNRbshNcXAhQK23LuRgEzCZw==
X-Received: by 2002:a37:b204:: with SMTP id b4mr2789502qkf.72.1609906761519;
        Tue, 05 Jan 2021 20:19:21 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id 1sm796693qki.50.2021.01.05.20.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 20:19:20 -0800 (PST)
Subject: Re: [PATCH] rpmsg: glink: add a header file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        kernel test robot <lkp@intel.com>
Cc:     agross@kernel.org, ohad@wizery.com, kbuild-all@lists.01.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210105235528.32538-1-elder@linaro.org>
 <202101061021.f4FjA3GK-lkp@intel.com> <X/U2MmdpU96WdUGw@builder.lan>
From:   Alex Elder <elder@linaro.org>
Message-ID: <f2325ccf-3d59-0c26-9371-20734cc61376@linaro.org>
Date:   Tue, 5 Jan 2021 22:19:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/U2MmdpU96WdUGw@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/5/21 10:01 PM, Bjorn Andersson wrote:
> On Tue 05 Jan 20:42 CST 2021, kernel test robot wrote:
> 
>> Hi Alex,
>>
>> I love your patch! Yet something to improve:
>>
> 
> Alex, this turns out to be an existing problem. Please have a look at my
> proposal for a fix here:
> 
> https://lore.kernel.org/linux-remoteproc/20210106035905.4153692-1-bjorn.andersson@linaro.org/T/#u
> 
> If you like it I can merge it and then apply this patch on top.

Go ahead and merge your patch.  If you are sure mine will
work afterward (I think it will) I would be happy to have
you accept that as well.  Thanks.

					-Alex

> 
> Thanks,
> Bjorn
> 
>> [auto build test ERROR on linus/master]
>> [also build test ERROR on v5.11-rc2 next-20210104]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Alex-Elder/rpmsg-glink-add-a-header-file/20210106-080024
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
>> config: x86_64-randconfig-s021-20210106 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce:
>>          # apt-get install sparse
>>          # sparse version: v0.6.3-208-g46a52ca4-dirty
>>          # https://github.com/0day-ci/linux/commit/333b19e6f90b89d18b94be972c0823959373dad8
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Alex-Elder/rpmsg-glink-add-a-header-file/20210106-080024
>>          git checkout 333b19e6f90b89d18b94be972c0823959373dad8
>>          # save the attached .config to linux build tree
>>          make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=x86_64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/rpmsg/qcom_glink_ssr.c:65:6: error: redefinition of 'qcom_glink_ssr_notify'
>>        65 | void qcom_glink_ssr_notify(const char *ssr_name)
>>           |      ^~~~~~~~~~~~~~~~~~~~~
>>     In file included from drivers/rpmsg/qcom_glink_ssr.c:11:
>>     include/linux/rpmsg/qcom_glink.h:27:20: note: previous definition of 'qcom_glink_ssr_notify' was here
>>        27 | static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
>>           |                    ^~~~~~~~~~~~~~~~~~~~~
>>
>>
>> vim +/qcom_glink_ssr_notify +65 drivers/rpmsg/qcom_glink_ssr.c
>>
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  60
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  61  /**
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  62   * qcom_glink_ssr_notify() - notify GLINK SSR about stopped remoteproc
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  63   * @ssr_name:	name of the remoteproc that has been stopped
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  64   */
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 @65  void qcom_glink_ssr_notify(const char *ssr_name)
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  66  {
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  67  	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr_name);
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  68  }
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  69  EXPORT_SYMBOL_GPL(qcom_glink_ssr_notify);
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  70
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
> 

