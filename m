Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC1370D972
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 11:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236300AbjEWJro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 05:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235889AbjEWJrj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 05:47:39 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6168A12B
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 02:47:35 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so2166385e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684835254; x=1687427254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UUzrqfAn41OiLpwzHZwDoyliBOjoCFp0nDGKcNdfLk=;
        b=Ggfqdim8OknxGiaS8cpoROMYx1uKDod+xlzodv2Uyyj8LUUUFj1XKQepmWq3ya0r89
         SCo7bMYKY0PRlAmehGpJz7LjH5ttyqoJEdhcsJc1W81WHcvXM1ppc/C+Vz9s0D0uETpf
         tUlpmH49ONsebsCFlBouNpSw1l4gfbPeH2iSIUtM7nULniCQcUDmXbIZS4d3F16b3r14
         aGPiY+yrY6TF/IKobuxEHNvhP2wQHt3Kf4efeI2u/sd9wUInf800wRP6/feF5vOsbzNJ
         xdyvz48MK8UPYprsmPy4AJH0t50FZIpUPvK8CEL9ZSrLAGGVOaSNUZcXciDL/JlqViJR
         tzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684835254; x=1687427254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UUzrqfAn41OiLpwzHZwDoyliBOjoCFp0nDGKcNdfLk=;
        b=MH4RHf2P/vsnFPdMVFz1ysZGeqd/gliDaq4FxUpYb2Cv9hcTi6iGyK+HTncopwXikF
         oesT/ga4PtiL5CAHB7kLI3jy6Z2eIo2k/eu7vtJ7im0F3h7/6YrUuZcRC9MUotxNaMvD
         b5EGU0U/oDExG2lWbKT1BF7JeMUVDrWX9X7aU7BJTlZj6ZiR0c9g3gYL2T4xCnBHaeXu
         iVqbHReCReEwqFk0d1BotsEiYDtZ+8Fk3vH4eodzIA+2rxFhsX3PRfuBp/PUiU0wn2U/
         zF/0EaIqrCr59lPuHoy92hocaNUGegSjm6I3Hi8imfU36vAnjv3WxeOrO7WmLA4keC1y
         nb/w==
X-Gm-Message-State: AC+VfDzgXM5f52TDY2XrEiXaFyouewYBNkd2jURbTOOODPSd4w3gO1Gu
        5XJriRFw6UC5O8+nbgB2+IVqmg==
X-Google-Smtp-Source: ACHHUZ6bd1TERP2fQjRKpOW5RESnGSzbaSxaNEv0OuJwROCIKwwJpiJ/Jd574GsAVtOJTW6dZhgJMQ==
X-Received: by 2002:adf:f542:0:b0:309:4368:a8a0 with SMTP id j2-20020adff542000000b003094368a8a0mr8733321wrp.68.1684835253786;
        Tue, 23 May 2023 02:47:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b10-20020adfde0a000000b003021288a56dsm10627696wrm.115.2023.05.23.02.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 02:47:30 -0700 (PDT)
Date:   Tue, 23 May 2023 12:47:27 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: rpm: allocate enough data in probe()
Message-ID: <d5c41227-21d8-4f64-9433-a774ecfa5685@kili.mountain>
References: <a0f6184c-c2b5-4e8d-9b8a-867ae83f3094@kili.mountain>
 <2f03fa9a-1b4b-d208-f399-a31ab8c5b4cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f03fa9a-1b4b-d208-f399-a31ab8c5b4cc@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 23, 2023 at 10:31:27AM +0200, Konrad Dybcio wrote:
> 
> 
> On 23.05.2023 10:11, Dan Carpenter wrote:
> > This was allocating "sizeof(qp->intf_clks)" which is the size of a
> > pointer instead of "sizeof(*qp->intf_clks)" which is the size of the
> > struct (8 bytes vs 16 bytes on a 64bit system).
> > 
> > Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Whoops. Guess I was just really really lucky that nothing blew up for me.
> 
> Thanks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Hold up.  Wait...  Let's not apply this.  The bug is more severe than I
saw initially.  It should be:

	qp->intf_clks = devm_kcalloc(dev, cd_num, sizeof(*qp->intf_clks),
				     GFP_KERNEL);

Did we only test with cd_num set to zero?

regards,
dan carpenter


