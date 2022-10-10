Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7510E5F9805
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 08:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiJJGBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 02:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbiJJGBs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 02:01:48 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E29725C74
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Oct 2022 23:01:47 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y1so2774125pfr.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Oct 2022 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLFFl+TOQassZdn6wQ2sIkMIl9C8kuqX8WPaUzFUJHc=;
        b=cLH4GmtTWciKxYTfweQOH3NL4/UTY2xCIPEL405GpBK/9TF9re0EbAiVMfF9HlYC5F
         El4lM3FAQ88r7pqkjmLbNTXhFvZ5nczoA1wKx5etZuYQ/jVVH7x2DqW26xyyrJAP1aaC
         mImzX2BSmuCFzq3UpbA6AgZqAZ+LfGoLDpFJs3P7mxsjJ7bf8+4lcoIha2skv4cJTr1n
         umKyFBW4VJsFeyYQ8QGzPN5ZEgaY0bEZT+50zk+Z1vBxcfD5+x94e2H2UE77gNgiu2xy
         Fn901TMEqPj1mB8gvkrOyy0NP9nubv21hJvg+eeB8umTwWQhb57eU1KhFkZ2WDuX2Uk9
         WDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLFFl+TOQassZdn6wQ2sIkMIl9C8kuqX8WPaUzFUJHc=;
        b=aMaE62aWpgIR29zzViGtc9XkYNmw8wD/RqMu7ZfIvqfA3D1hnp8efE4wYov7mjRWVi
         k+amvOQPSDk9xoTPxBtBC2/61fUsX2T7HsjDJqZ9RxzzBaBm3yEhVJltNTrxA/0FS0pi
         egsdpYoW84OjzOaSSt0ipKIjZJfo3HvYEI60ZYl0vLmFXO1AKUKpBmB0SN5uDLCdL2oQ
         yAbhDCXk6rD3DHqyg2EVYkeOJRhnR7x7xbF09BP/SFdjMJe7F13hW2HDtZ7Pvd1HIqSX
         KkgQSssaKEQpgRK8/Kwcts++aikhxnabvHixpRNtUmGDZsS7R4KOZJl/ofnNf8AzGEKO
         mYxw==
X-Gm-Message-State: ACrzQf0KojyxhZkvyeLcK+YljDrAORj++FV9rU1yQFk9VfUkE8nOaYKB
        Ibd05vKMHLNbEafFlkNYbS3UBQ==
X-Google-Smtp-Source: AMsMyM6BdxiAcjpv5WmwjG8JQ3jWRKQT6G9tizF5O18tqkgC9hFyXB+svbLYjD12wId0ki53KoYGYQ==
X-Received: by 2002:a05:6a00:8cb:b0:52c:6962:2782 with SMTP id s11-20020a056a0008cb00b0052c69622782mr17841459pfu.81.1665381706877;
        Sun, 09 Oct 2022 23:01:46 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id e18-20020aa798d2000000b005624e2e0508sm5883035pfm.207.2022.10.09.23.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 23:01:46 -0700 (PDT)
Date:   Mon, 10 Oct 2022 11:31:44 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Fabien Parent <fabien.parent@linaro.org>
Cc:     ilia.lin@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        rafael@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] cpufreq: qcom: pass pvs_name size along with its
 buffer
Message-ID: <20221010060144.ba4scbti63fxevne@vireshk-i7>
References: <20221001171027.2101923-1-fabien.parent@linaro.org>
 <20221001171027.2101923-2-fabien.parent@linaro.org>
 <20221010055251.ulgevsdqudors3t3@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010055251.ulgevsdqudors3t3@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-10-22, 11:22, Viresh Kumar wrote:
> On 01-10-22, 19:10, Fabien Parent wrote:
> > @@ -265,7 +269,7 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
> >  	struct nvmem_cell *speedbin_nvmem;
> >  	struct device_node *np;
> >  	struct device *cpu_dev;
> > -	char *pvs_name = "speedXX-pvsXX-vXX";
> > +	char *pvs_name = PVS_NAME_TEMPLATE;
> >  	unsigned cpu;
> >  	const struct of_device_id *match;
> >  	int ret;
> > @@ -306,8 +310,8 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
> >  			goto free_drv;
> >  		}
> >  
> > -		ret = drv->data->get_version(cpu_dev,
> > -							speedbin_nvmem, &pvs_name, drv);
> > +		ret = drv->data->get_version(cpu_dev, speedbin_nvmem, &pvs_name,
> > +					     sizeof(PVS_NAME_TEMPLATE), drv);
> 
> Since the pvs name is always PVS_NAME_TEMPLATE, why are we even
> passing it and size here ? Why not directly use it in those
> get_version() implementations directly ?

I understand how &pvs_name is used here to later set the prop_name. I
think instead you should also implement drv->data->prop_name() here,
which can return valid name or NULL.

-- 
viresh
