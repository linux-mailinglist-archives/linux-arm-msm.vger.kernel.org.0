Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADF2750B3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 16:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbjGLOol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 10:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232943AbjGLOoi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 10:44:38 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117121FC0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 07:44:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3163eb69487so219215f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689173071; x=1691765071;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bKIIR9OjtgBpDDvqKxLO6IX1x7WUFG2/ayGOLgpUek=;
        b=ZApMAuCqQ9Yyv4TWJRovqk71j+frwCNOsbkzGFbvPhTEScmFWELEj5ccqfqPMrqp/X
         qvX4hrKCwXZeCoqcTGxJLGqXXduYBqQ5mmtCojK7u1PqFkro0sSuFR9lfV9byXcN7+Gl
         SHofKDLd013XUs/WNs6A+F5tIe7S6/NJ/OqhYzJCC1QOdEnBqXkn/jle01pwcnGvuTm2
         TZeCxTC/07WBAg5doPXez23CmmUbJKKUrbdbHCWxZGROIADkueUe3ZQMA81gIvsDcKza
         vX24AxvBco0X8twoxska0+Hjn07NGQlPnJYjLdlcKMCF53kfuJZxhNb2kNkev+ZhIS2y
         NwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689173071; x=1691765071;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bKIIR9OjtgBpDDvqKxLO6IX1x7WUFG2/ayGOLgpUek=;
        b=EQUTp+2KioNnzqUdLX7wvOwi1mqzD2+tNPAmAh3cOenAz8HZer2jklMMZ3dLnLxFw8
         BcQ/i07uNxQ5exYzVo28B/AsOptvWwFWAymkV6Or3aB/cEmZWL6/Xlv1VTsUyp0jSC2C
         XrSgl2c72c0/2nkNEu9f4dr6AHPXGp6+SQNigQ0FUDRsgt9Npiph3jpaDtYCEmdx8n22
         nabheNDFOugd8MATlEG6zjutw0dFw8Dk0270UL1xQfyNVGHom47tZw5KtmzHdVMnVY6P
         AO5qbQjJIkjdtQwhIitOOzA49fp/CMwAZDo7fDtOGDBFNfjs9SCNDWXtjAS4kWxtEB2A
         pUKA==
X-Gm-Message-State: ABy/qLaP16PC9PSdbmctQFG3g+IKRqqHf+VAKTUr3HS4LXh4atIn5w4S
        d7JOqlyQ/J0d3u95z0vVb65ZpdcZTru91qadnQg=
X-Google-Smtp-Source: APBJJlFPG+2s4x3l2bjFKssERNkMbuuHjE2WIpn8o+0mfboYULQzNu5jhtu14gy1VsT0eXo3vSrTUA==
X-Received: by 2002:a5d:538b:0:b0:314:914:66cc with SMTP id d11-20020a5d538b000000b00314091466ccmr1947027wrv.8.1689173071526;
        Wed, 12 Jul 2023 07:44:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b003141a3c4353sm5321548wrq.30.2023.07.12.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 07:44:29 -0700 (PDT)
Date:   Wed, 12 Jul 2023 17:44:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     dmitry.baryshkov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [bug report] drm/msm/dsi: do not enable irq handler before powering
 up the host
Message-ID: <6b3de033-47f3-4699-9a41-d9862d47c8d8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Dmitry Baryshkov,

The patch bf94ec093d05: "drm/msm/dsi: do not enable irq handler
before powering up the host" from Oct 2, 2021, leads to the following
Smatch static checker warning:

	drivers/gpu/drm/msm/dsi/dsi_host.c:1890 msm_dsi_host_init()
	warn: irq_of_parse_and_map() returns zero on failure

drivers/gpu/drm/msm/dsi/dsi_host.c
    1882         /* OPP table is optional */
    1883         ret = devm_pm_opp_of_add_table(&pdev->dev);
    1884         if (ret && ret != -ENODEV) {
    1885                 dev_err(&pdev->dev, "invalid OPP table in device tree\n");
    1886                 return ret;
    1887         }
    1888 
    1889         msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
--> 1890         if (msm_host->irq < 0) {

The irq_of_parse_and_map() function returns zero on error.  There are
several IRQ functions like that.  It's a mess.

So I think this should be if (!msm_host->irq) or possibly if <= 0.

    1891                 ret = msm_host->irq;
    1892                 dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
    1893                 return ret;
    1894         }
    1895 
    1896         /* do not autoenable, will be enabled later */

regards,
dan carpenter
