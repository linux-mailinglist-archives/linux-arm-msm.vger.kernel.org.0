Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F7A2EB8DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 05:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbhAFEYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 23:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbhAFEYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 23:24:34 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD6FC061357
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 20:23:54 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id q25so2142934oij.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 20:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k0i3enRu3hyKlPA+1xEo/MmMl5HhXf8GucycwKwD1yE=;
        b=YmLbNsAnXgfNy224NEcuX9hdiztWZPxaNC2Cvt3F6ZqAOPQDUJ6iYzm14W5r6EbCDW
         USpwl0tBwuUFyDzeqgaoGAR2wEEq/FlQxRs64PNon0Hf9N6sTGQ1x0FvkCoP6jb1iJNv
         7LYZqKeO9g9O2joaQYO4wdbxfwMhIoWJhcv5PeJBZEIHIBRCxbBcQcclQFjJ3o+lXhRl
         QIFlNi3/EYxbA+OXyrqNS2sKLRQnOTG/fX+jQHH9npJDkK3eCgPC1h8NWOl5lu9qe5/t
         T1itW7BWibsKQnuVDMS3NQZwMm/QSjTZwgSdYbkup3QbTxTdeGhcZC8pp55qcMHtOGU9
         yxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k0i3enRu3hyKlPA+1xEo/MmMl5HhXf8GucycwKwD1yE=;
        b=JSYbY+jnBAzQbZymL3g2Lei/BMiGH5keUA/DfENIZp21ZroDq93n+HYvlPry0aiUIg
         /PndZoSQYrwYg4Sb12oE5o/AAHYt6cs7j0CCS+cZBcQzQNHQUuUtZShumzvHCKLoezdE
         j7tSfaHS6CReCJauY+CiEPm3/gSblRhK2QJ0RabwyHSn5QWRvcHmR7TZP2WZPh3zBsnk
         pPugsTaSiSGmkg2/peQOkducu020On3V5u+dn9OawlaESbABgiwYrgfLF4dM3XR9Hxga
         pRSnPMpFIni7HlNfGVnPyi4duFIH33lRY9erqUQU+YZMYerATraHoGvMZ+5iJ1AV2AAy
         Vuew==
X-Gm-Message-State: AOAM531smV96+luilfrfFl5Le/KJA9zMiAOeG+fbZjTpDWYhigDE8/Ye
        E7dU+/2CLEPlYNZzKBH5+b/iYA==
X-Google-Smtp-Source: ABdhPJz2xl+B7kjgfvIk6OHpFiqGJZ8MncwBec6HcfksdGfnE6TVHnyumO3Y5Sj3Uy0zR75UjnpSNg==
X-Received: by 2002:a54:4694:: with SMTP id k20mr2074670oic.64.1609907033620;
        Tue, 05 Jan 2021 20:23:53 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z14sm291412otk.70.2021.01.05.20.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 20:23:52 -0800 (PST)
Date:   Tue, 5 Jan 2021 22:23:51 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     kernel test robot <lkp@intel.com>, agross@kernel.org,
        ohad@wizery.com, kbuild-all@lists.01.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: glink: add a header file
Message-ID: <X/U7Vz1LaA0o0M5u@builder.lan>
References: <20210105235528.32538-1-elder@linaro.org>
 <202101061021.f4FjA3GK-lkp@intel.com>
 <X/U2MmdpU96WdUGw@builder.lan>
 <f2325ccf-3d59-0c26-9371-20734cc61376@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2325ccf-3d59-0c26-9371-20734cc61376@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Jan 22:19 CST 2021, Alex Elder wrote:

> On 1/5/21 10:01 PM, Bjorn Andersson wrote:
> > On Tue 05 Jan 20:42 CST 2021, kernel test robot wrote:
> > 
> > > Hi Alex,
> > > 
> > > I love your patch! Yet something to improve:
> > > 
> > 
> > Alex, this turns out to be an existing problem. Please have a look at my
> > proposal for a fix here:
> > 
> > https://lore.kernel.org/linux-remoteproc/20210106035905.4153692-1-bjorn.andersson@linaro.org/T/#u
> > 
> > If you like it I can merge it and then apply this patch on top.
> 
> Go ahead and merge your patch.  If you are sure mine will
> work afterward (I think it will) I would be happy to have
> you accept that as well.  Thanks.
> 

Thank you Alex. I've merged the pair (and that other patch of yours).

And thanks KTR for reporting this.

Regards,
Bjorn

> 					-Alex
> 
> > 
> > Thanks,
> > Bjorn
> > 
> > > [auto build test ERROR on linus/master]
> > > [also build test ERROR on v5.11-rc2 next-20210104]
> > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch]
> > > 
> > > url:    https://github.com/0day-ci/linux/commits/Alex-Elder/rpmsg-glink-add-a-header-file/20210106-080024
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> > > config: x86_64-randconfig-s021-20210106 (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > reproduce:
> > >          # apt-get install sparse
> > >          # sparse version: v0.6.3-208-g46a52ca4-dirty
> > >          # https://github.com/0day-ci/linux/commit/333b19e6f90b89d18b94be972c0823959373dad8
> > >          git remote add linux-review https://github.com/0day-ci/linux
> > >          git fetch --no-tags linux-review Alex-Elder/rpmsg-glink-add-a-header-file/20210106-080024
> > >          git checkout 333b19e6f90b89d18b94be972c0823959373dad8
> > >          # save the attached .config to linux build tree
> > >          make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=x86_64
> > > 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > > > drivers/rpmsg/qcom_glink_ssr.c:65:6: error: redefinition of 'qcom_glink_ssr_notify'
> > >        65 | void qcom_glink_ssr_notify(const char *ssr_name)
> > >           |      ^~~~~~~~~~~~~~~~~~~~~
> > >     In file included from drivers/rpmsg/qcom_glink_ssr.c:11:
> > >     include/linux/rpmsg/qcom_glink.h:27:20: note: previous definition of 'qcom_glink_ssr_notify' was here
> > >        27 | static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
> > >           |                    ^~~~~~~~~~~~~~~~~~~~~
> > > 
> > > 
> > > vim +/qcom_glink_ssr_notify +65 drivers/rpmsg/qcom_glink_ssr.c
> > > 
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  60
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  61  /**
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  62   * qcom_glink_ssr_notify() - notify GLINK SSR about stopped remoteproc
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  63   * @ssr_name:	name of the remoteproc that has been stopped
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  64   */
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 @65  void qcom_glink_ssr_notify(const char *ssr_name)
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  66  {
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  67  	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr_name);
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  68  }
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  69  EXPORT_SYMBOL_GPL(qcom_glink_ssr_notify);
> > > 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  70
> > > 
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> > 
> > 
> 
