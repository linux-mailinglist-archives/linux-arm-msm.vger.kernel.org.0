Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96D2552B53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 08:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346183AbiFUGzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 02:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbiFUGzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 02:55:01 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D8A1CB16
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 23:55:00 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id cu16so18458493qvb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 23:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RSa8jrClGDA2tFtOGptl0Oo8l560h/UCVEpeEMIh4Bg=;
        b=FuK2wNxaws2uw8oizsv8YfrFiwI+VXapXplvut6EeVzRts/YDCrzRy4engy49/BWrI
         /JUraVJdm+pdH+PQ9hDrJDB4/ae8LXt/q6diW0wND9JTXszOYRE1QF5A9Pk+/QyJLF/O
         6TeRiw7uGd8bXsxPUF28h7ZUKA/OruOwYRuMaJPNHJmuHOlUNdRc6fnm57KBx+g/sVb0
         N3SPojMq22bTw4Bqy/vjvVgFXdB15rdSpGE4zNHHcO4RNu/n5JuWkfxF7H4I+GHbnaeL
         /CCvxS1lp0ldUb0EBYVczCnICPwxNdFFP+CQ1K9BhMw4tUzkfMpIjxF96ZprUMDOESB2
         qPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RSa8jrClGDA2tFtOGptl0Oo8l560h/UCVEpeEMIh4Bg=;
        b=xICr6Q0K1CW4DZpUxOj2lp+LqBvZmD5JLZcj7ED/UMamDHlMZ2BlaZE8cpaN+M7vEN
         yTduVr7e/6rYKr70IDAGq7Ln3/IxTcXMQwaOI2miBzwtoyJ6NBAsLrWb5tzKu/lBXm81
         5rzEgtGbbQB0KZjdUSlaId6RT62XWQAmgFvco3lOYd6+9v6ajdZMb3bAKoKj1o94/FNf
         uyniJHwbh9Duzp4bY4waXPgz2ckvo/NhL78k4FX5fxlCBANgZxwshp3KDynsgsG4B88B
         C3EYqAX/a7RHbqzRdEbYZ6f+d23m5YbeXHuLXWPq1FVsgO6ecBcEJvl5rqNHJmEKYfbR
         vAyw==
X-Gm-Message-State: AJIora+S3oaz30gLmlcqDpiML45ML1ZgPQjYoTi+QHb5MwHpCrmpjmUF
        TugZuoOpcbVW9jxO62gj0i4nmgUSh3kTMxb+2bomAA==
X-Google-Smtp-Source: AGRyM1sRH6DIPLEbODu3wVohAC9xeARKZiESG0XcyVTajdZyb0MNS/6sIDRVwZAWU+3lLQ7eq+++tnCYE0ucMV59+44=
X-Received: by 2002:ad4:4d88:0:b0:470:46d2:5653 with SMTP id
 cv8-20020ad44d88000000b0047046d25653mr4952039qvb.115.1655794499103; Mon, 20
 Jun 2022 23:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220620080117.1571807-1-dmitry.baryshkov@linaro.org> <202206210257.lD0x1WPz-lkp@intel.com>
In-Reply-To: <202206210257.lD0x1WPz-lkp@intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 09:54:48 +0300
Message-ID: <CAA8EJppbejsNXkxz=LFFVBDL=YLkOqQrk0tzx965PiNDznBdWg@mail.gmail.com>
Subject: Re: [kbuild] Re: [PATCH] clk: qcom: common: use parent_hws in _qcom_cc_register_board_clk()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>, lkp@intel.com,
        kbuild-all@lists.01.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Jun 2022 at 09:46, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hi Dmitry,
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/clk-qcom-common-use-parent_hws-in-_qcom_cc_register_board_clk/20220620-160242
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git  clk-next
> config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/archive/20220621/202206210257.lD0x1WPz-lkp@intel.com/config )
> compiler: hppa-linux-gcc (GCC) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/clk/qcom/common.c:172 _qcom_cc_register_board_clk() error: uninitialized symbol 'fixed'.
>
> vim +/fixed +172 drivers/clk/qcom/common.c
>
> ee15faffef1130 Stephen Boyd     2015-10-26  129  static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
> ee15faffef1130 Stephen Boyd     2015-10-26  130                                        const char *name, unsigned long rate,
> ee15faffef1130 Stephen Boyd     2015-10-26  131                                        bool add_factor)
> ee15faffef1130 Stephen Boyd     2015-10-26  132  {
> ee15faffef1130 Stephen Boyd     2015-10-26  133         struct device_node *node = NULL;
> ee15faffef1130 Stephen Boyd     2015-10-26  134         struct device_node *clocks_node;
> ee15faffef1130 Stephen Boyd     2015-10-26  135         struct clk_fixed_factor *factor;
> ee15faffef1130 Stephen Boyd     2015-10-26  136         struct clk_fixed_rate *fixed;
>                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> ee15faffef1130 Stephen Boyd     2015-10-26  137         struct clk_init_data init_data = { };
> 120c1552839036 Stephen Boyd     2016-08-16  138         int ret;
> ee15faffef1130 Stephen Boyd     2015-10-26  139
> ee15faffef1130 Stephen Boyd     2015-10-26  140         clocks_node = of_find_node_by_path("/clocks");
> 43a51019cc8ff1 Johan Hovold     2017-11-11  141         if (clocks_node) {
> 43a51019cc8ff1 Johan Hovold     2017-11-11  142                 node = of_get_child_by_name(clocks_node, path);
> 43a51019cc8ff1 Johan Hovold     2017-11-11  143                 of_node_put(clocks_node);
> 43a51019cc8ff1 Johan Hovold     2017-11-11  144         }
> ee15faffef1130 Stephen Boyd     2015-10-26  145
> ee15faffef1130 Stephen Boyd     2015-10-26  146         if (!node) {
> ee15faffef1130 Stephen Boyd     2015-10-26  147                 fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
> ee15faffef1130 Stephen Boyd     2015-10-26  148                 if (!fixed)
> ee15faffef1130 Stephen Boyd     2015-10-26  149                         return -EINVAL;
> ee15faffef1130 Stephen Boyd     2015-10-26  150
> ee15faffef1130 Stephen Boyd     2015-10-26  151                 fixed->fixed_rate = rate;
> ee15faffef1130 Stephen Boyd     2015-10-26  152                 fixed->hw.init = &init_data;
> ee15faffef1130 Stephen Boyd     2015-10-26  153
> ee15faffef1130 Stephen Boyd     2015-10-26  154                 init_data.name = path;
> ee15faffef1130 Stephen Boyd     2015-10-26  155                 init_data.ops = &clk_fixed_rate_ops;
> ee15faffef1130 Stephen Boyd     2015-10-26  156
> 120c1552839036 Stephen Boyd     2016-08-16  157                 ret = devm_clk_hw_register(dev, &fixed->hw);
> 120c1552839036 Stephen Boyd     2016-08-16  158                 if (ret)
> 120c1552839036 Stephen Boyd     2016-08-16  159                         return ret;
> ee15faffef1130 Stephen Boyd     2015-10-26  160         }
>
> "fixed" is not set on else path.
>
> ee15faffef1130 Stephen Boyd     2015-10-26  161         of_node_put(node);
> ee15faffef1130 Stephen Boyd     2015-10-26  162
> ee15faffef1130 Stephen Boyd     2015-10-26  163         if (add_factor) {
> ee15faffef1130 Stephen Boyd     2015-10-26  164                 factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
> ee15faffef1130 Stephen Boyd     2015-10-26  165                 if (!factor)
> ee15faffef1130 Stephen Boyd     2015-10-26  166                         return -EINVAL;
> ee15faffef1130 Stephen Boyd     2015-10-26  167
> ee15faffef1130 Stephen Boyd     2015-10-26  168                 factor->mult = factor->div = 1;
> ee15faffef1130 Stephen Boyd     2015-10-26  169                 factor->hw.init = &init_data;
> ee15faffef1130 Stephen Boyd     2015-10-26  170
> ee15faffef1130 Stephen Boyd     2015-10-26  171                 init_data.name = name;
> daa853a735065a Dmitry Baryshkov 2022-06-20 @172                 init_data.parent_hws = (const struct clk_hw*[]){ &fixed->hw };
>                                                                                                                   ^^^^^
> Used here.  This would work if fixed were set to NULL at the start but
> I kind of hate that it requires us to know that ->hw is the first member
> of fixed struct.

Thanks for reporting this. The problem is a bit worse. If the node
exists, we are expected to use the existing global clock here instead
of the newly created 'fixed' clock.

>
> ee15faffef1130 Stephen Boyd     2015-10-26  173                 init_data.num_parents = 1;
> ee15faffef1130 Stephen Boyd     2015-10-26  174                 init_data.flags = 0;
> ee15faffef1130 Stephen Boyd     2015-10-26  175                 init_data.ops = &clk_fixed_factor_ops;
> ee15faffef1130 Stephen Boyd     2015-10-26  176
> 120c1552839036 Stephen Boyd     2016-08-16  177                 ret = devm_clk_hw_register(dev, &factor->hw);
> 120c1552839036 Stephen Boyd     2016-08-16  178                 if (ret)
> 120c1552839036 Stephen Boyd     2016-08-16  179                         return ret;
> ee15faffef1130 Stephen Boyd     2015-10-26  180         }
> ee15faffef1130 Stephen Boyd     2015-10-26  181
> ee15faffef1130 Stephen Boyd     2015-10-26  182         return 0;
> ee15faffef1130 Stephen Boyd     2015-10-26  183  }
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> _______________________________________________
> kbuild mailing list -- kbuild@lists.01.org
> To unsubscribe send an email to kbuild-leave@lists.01.org
>


-- 
With best wishes
Dmitry
