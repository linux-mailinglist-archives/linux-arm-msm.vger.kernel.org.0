Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F31728AF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 21:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387450AbfEWTus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 15:50:48 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43979 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732184AbfEWTJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 15:09:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id c6so3746011pfa.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 12:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nu4ATjrqQqsM0pX/rCcIWFjpR3mlic29/RWxUeaEtwY=;
        b=K79gKRW/JknosTVB0FWYG94V0xmWP66HddU2XJjlge1xRraBz7b2P3GVnw1g99kj+p
         AH0pEr84Z9WIHP9dV4jtvVVbxNazILT46Uv1QMrsOWrZejFssLMYYuNRfz9DxuHvjCMy
         YtCuwR8/CVmTRBK4S4KpgTB/vJqtk6pvOu9LwMJhizbQ5O/2E0Kn2vk6aP7F6GMBCpkW
         Q2LMW7JaH1kJFzEG/3G6IXICIlQYDgqXyTfvtdXETjSKKdHqOGRGCYIWVxtO10r4aPRO
         TpA453wrrs3FnXfY0GpiM8STOIe4DAfN7DCCo+UlIakJNiAx++bPU24jzY/bY9T+HbYr
         KOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nu4ATjrqQqsM0pX/rCcIWFjpR3mlic29/RWxUeaEtwY=;
        b=WxhjcpJn+p7nPQo5+j2qEhsE7GjfZV6u/8FDTcWH8yM7oaKke/+XDvBYzXEPuqKSOt
         3vyRyORnHtk0uqaKs1IAsSqOdEJmYbbufxk9ULDmpP0fWSrNRlYmKpvJsM8vS0Y4J8bw
         64qOjwSNFqSFMnYboGNVQqdY3otMngxY9EpnDe4JkDJLgbX3DElHkf79Jvd2qisMG2j9
         jdUeMdtDEPVfw5dtinV+AnKmKNtI0ms3s7KzRiPntSlpP9Ux+Bf9akU66UQWxGc+3CuJ
         dGz63aB7RPfKVGvujtnrlvzwa3NWSe4EVmuD0iNejm6xeZyYg+bTWLWotDc1hUloMf0c
         VEwA==
X-Gm-Message-State: APjAAAUkNn9kpBK56H1uWZ+W5PTwZnwlIOJmdbbqliMKsQ9FOOskoPID
        lfBq6tFEbL2m4yDVnMlMlYT+7A==
X-Google-Smtp-Source: APXvYqzJVzBs96A0vZXeyNDI2SldyKqbOk+LVZ141h/UfoMVaEjbJAN4az6WNwpCYRb8DJaE+FJgNA==
X-Received: by 2002:a63:225b:: with SMTP id t27mr13484490pgm.25.1558638568172;
        Thu, 23 May 2019 12:09:28 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i7sm201071pfo.19.2019.05.23.12.09.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 12:09:27 -0700 (PDT)
Date:   Thu, 23 May 2019 12:09:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
Message-ID: <20190523190925.GU31438@minitux>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-3-bjorn.andersson@linaro.org>
 <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
 <5ce6e0cd.1c69fb81.9a03e.0260@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ce6e0cd.1c69fb81.9a03e.0260@mx.google.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 May 11:05 PDT 2019, Stephen Boyd wrote:

> Quoting Doug Anderson (2019-05-23 09:38:13)
> > Hi,
> > 
> > On Tue, Apr 30, 2019 at 9:38 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > 
> > > +static int qmp_qdss_clk_add(struct qmp *qmp)
> > > +{
> > > +       struct clk_init_data qdss_init = {
> > > +               .ops = &qmp_qdss_clk_ops,
> > > +               .name = "qdss",
> > > +       };
> > 
> > Can't qdss_init be "static const"?  That had the advantage of not
> > needing to construct it on the stack and also of it having a longer
> > lifetime.  It looks like clk_register() stores the "hw" pointer in its
> > structure and the "hw" structure will have a pointer here.  While I
> > can believe that it never looks at it again, it's nice if that pointer
> > doesn't point somewhere on an old stack.
> > 
> > I suppose we could go the other way and try to mark more stuff in this
> > module as __init and __initdata, but even then at least the pointer
> > won't be onto a stack.  ;-)
> > 
> 
> Const would be nice, but otherwise making it static isn't a good idea.
> The clk_init_data structure is all copied over, although we do leave a
> dangling pointer to it stored inside the clk_hw structure we don't use
> it after clk registration. Maybe we should overwrite the pointer with
> NULL once we're done in clk_register() so that clk providers can't use
> it. It might break somebody but would at least clarify this point.
> 

I had to read through the clock code to conclude that this was indeed
the design, so I'm happy with your patch of ensuring that this is
followed. Perhaps add a statement in the kerneldoc for struct clk_hw as
well to state that init won't be accessed past the return of
clk_register.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index aa51756fd4d6..56997a974408 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3438,9 +3438,9 @@ static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
>  	return 0;
>  }
>  
> -static int clk_core_populate_parent_map(struct clk_core *core)
> +static int clk_core_populate_parent_map(struct clk_core *core,
> +					const struct clk_init_data *init)
>  {
> -	const struct clk_init_data *init = core->hw->init;
>  	u8 num_parents = init->num_parents;
>  	const char * const *parent_names = init->parent_names;
>  	const struct clk_hw **parent_hws = init->parent_hws;
> @@ -3520,6 +3520,14 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  {
>  	int ret;
>  	struct clk_core *core;
> +	const struct clk_init_data *init = hw->init;
> +
> +	/*
> +	 * The init data is not supposed to be used outside of registration path.
> +	 * Set it to NULL so that provider drivers can't use it either and so that
> +	 * we catch use of hw->init early on in the core.
> +	 */
> +	hw->init = NULL;
>  
>  	core = kzalloc(sizeof(*core), GFP_KERNEL);
>  	if (!core) {
> @@ -3527,17 +3535,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  		goto fail_out;
>  	}
>  
> -	core->name = kstrdup_const(hw->init->name, GFP_KERNEL);
> +	core->name = kstrdup_const(init->name, GFP_KERNEL);
>  	if (!core->name) {
>  		ret = -ENOMEM;
>  		goto fail_name;
>  	}
>  
> -	if (WARN_ON(!hw->init->ops)) {
> +	if (WARN_ON(!init->ops)) {
>  		ret = -EINVAL;
>  		goto fail_ops;
>  	}
> -	core->ops = hw->init->ops;
> +	core->ops = init->ops;
>  
>  	if (dev && pm_runtime_enabled(dev))
>  		core->rpm_enabled = true;
> @@ -3546,13 +3554,13 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  	if (dev && dev->driver)
>  		core->owner = dev->driver->owner;
>  	core->hw = hw;
> -	core->flags = hw->init->flags;
> -	core->num_parents = hw->init->num_parents;
> +	core->flags = init->flags;
> +	core->num_parents = init->num_parents;
>  	core->min_rate = 0;
>  	core->max_rate = ULONG_MAX;
>  	hw->core = core;
>  
> -	ret = clk_core_populate_parent_map(core);
> +	ret = clk_core_populate_parent_map(core, init);
>  	if (ret)
>  		goto fail_parents;
>  

I've reviewed this and it looks good!

Regards,
Bjorn

> 
> > 
> > 
> > > +static void qmp_pd_remove(struct qmp *qmp)
> > > +{
> > > +       struct genpd_onecell_data *data = &qmp->pd_data;
> > > +       struct device *dev = qmp->dev;
> > > +       int i;
> > > +
> > > +       of_genpd_del_provider(dev->of_node);
> > > +
> > > +       for (i = 0; i < data->num_domains; i++)
> > > +               pm_genpd_remove(data->domains[i]);
> > 
> > Still feels like the above loop would be better as:
> >   for (i = data->num_domains - 1; i >= 0; i--)
> > 
> 
> Reason being to remove in reverse order? Otherwise this looks like an
> opinion.
