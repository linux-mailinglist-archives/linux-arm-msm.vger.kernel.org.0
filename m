Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245EB620D02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 11:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbiKHKTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 05:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbiKHKTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 05:19:08 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24E8E0D3
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 02:19:04 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id i3so13376952pfc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 02:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mzN5KFd2Y8I/q67uNmUdKzDvTfRtrUq0Ss4XZ+RPexg=;
        b=Y762+Z7+yJXkYybXyvsdCWsLlLawNmZSVHud6lRjtqz/U1O/w89HGZ17E085oW1TX+
         MugDWPz5mhnEuoCvYo6FU4REmALXzFFFb88J0A6iKutYsHiXdoByrsWdiRzR9dUbYa9L
         nb9oXGH9Epohl+7s1/7gvl3mW2mh7vKCJ4acMh05S50XWyF/1OEmtEhJbKQUA5HFUZq1
         FoNn/iaZPISGLVEFWaXaTkh/pgJoppSiaOXQFWBft6KzZkCERrXjTHDR2hHnWAtBtJt7
         cToPq3/W2gm4tLBjQ0df7HXVS2AfQhaFJbe+YCZmXM5GWCw6247kEQDNVktHfitQMq3G
         cy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzN5KFd2Y8I/q67uNmUdKzDvTfRtrUq0Ss4XZ+RPexg=;
        b=gVlUcL8lPC6MERw37DBPsxiF4vdillZvd7QLR6SCgLJ+bNdXInDbHBNzb5ZkxqsJrx
         4RIGb2nHbHzAHEaFm/Fd6tgTnct8myT3YCwX572sLj+WyjK84PuVpNwpJJd3wDwmknv6
         STBwf7S5c2W0TXkRzv9/JGb/uKYl2YS+Xmg03YGDZy+WljlUHAlH6XL772xPEZmIGWvW
         JAHK59ptcdqxApmWjGibUkOoJBnRho8oLwIaKkH8vy2Bi4nifTyeCLY1lg/52A9Rl/+h
         rDtuTvowU8m9XQJoOtym7KAfcc4B5l2sP0JSzrt02oDmdGbkxysQWWUxTem7Cyg9XdoZ
         sN1w==
X-Gm-Message-State: ACrzQf2CevywuYcR60D0j94NFOHDQRVXQb25mA/RuWZv85MVLP1PwDSS
        EDikIxtTjppb9ZFsGTBKBRpt+dTOJtHWpw89lV08IA==
X-Google-Smtp-Source: AMsMyM7vNqP5xj1WaQF2hJQ70H9fGNDZKo70toyjGFxR5FLwldoGzpWM/PBOrVNOYQG3pn0UbkBMDCGyPh1OOl1Hh1w=
X-Received: by 2002:a63:464d:0:b0:441:5968:cd0e with SMTP id
 v13-20020a63464d000000b004415968cd0emr48838238pgk.595.1667902744501; Tue, 08
 Nov 2022 02:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20221018152837.619426-7-ulf.hansson@linaro.org>
 <202210190144.WIiituiJ-lkp@intel.com> <20221107170127.i5bfkx45egaf2oh4@builder.lan>
In-Reply-To: <20221107170127.i5bfkx45egaf2oh4@builder.lan>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 8 Nov 2022 11:18:27 +0100
Message-ID: <CAPDyKFpsPk5uhva2F+=b0r7FeO-8n9+tMAA9iaxGmZZgrtoZUw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] soc: qcom: rpmh-rsc: Write CONTROL_TCS with next
 timer wakeup
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     kernel test robot <lkp@intel.com>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kbuild-all@lists.01.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 7 Nov 2022 at 18:01, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Oct 19, 2022 at 01:47:17AM +0800, kernel test robot wrote:
> [..]
> >    155        #define USECS_TO_CYCLES(time_usecs)                     \
> >    156                xloops_to_cycles((time_usecs) * 0x10C7UL)
> >    157
> >    158        static inline unsigned long xloops_to_cycles(unsigned long xloops)
>
> Any objections to me changing the type to u64 while applying the
> patches?

No objections. Thanks for making the improvement!

>
> Regards,
> Bjorn
>
> >    159        {
> >  > 160                return (xloops * loops_per_jiffy * HZ) >> 32;
> >    161        }
> >    162

Kind regards
Uffe
