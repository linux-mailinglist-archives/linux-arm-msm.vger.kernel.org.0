Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76DAB5620FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbiF3RM3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235130AbiF3RMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:12:22 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4126A3ED3D
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:12:21 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id w83so123173oiw.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y6DkU6unvFq/epfz0T61FMvsr3c8FnoPOdbOM2kIYTM=;
        b=DJd5lnw20Em6KF++SAOBDORtfraTfBV4IERCyfIRJYJP1xrQx/lueDRvDMTe7RkrLD
         cfbeaFCWF7wFbN6QqVi9Xd7JWKeAlbvOiKMasiHfH9IZjSYgRfIxkUR/jG4U8xAJcJgR
         jpjltNE5Pi1gQt7Q+ls53U6ohlbXFxGVLL5VM7lF4XjY6OZhxeFL/yvjlivTlbLwmF0v
         i/3Vl/laIl26jQWi7eD/CnO+YsjVvhJoxMn0hjqo3VwaDzJgqb08ai9YM7q0RjLc62Gj
         3VwarAOReV2NoQgYVxCilzZp5GV8iRdkVihrDUAEJqmEEoBEeZtxTXvag2clKroC/eX3
         BRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y6DkU6unvFq/epfz0T61FMvsr3c8FnoPOdbOM2kIYTM=;
        b=MGkP70meeCnB04xKs7g8UOdJqXqBAIVjtCQIH61n64sen5nQ3HlSmCdKdK19mmGrjN
         6vFOZ0+SF/91C7X171RnVHOUOt13XrTkqdwN3kmWwJOSj/Jc0uB3wnUzaRi+65kf8zCE
         lqvvluqrSs9quGM/47rHvAd/LHrKOGx79K1WnFLfFSTEy4TchtLOaftascL+WmSpk9iK
         UknTiSqrLU219RPPFMezkQbnTLhukH84lJNbM6Y8qSWXrkaOAH7OPHrGoleMgAsqAiF3
         E43GJbrW2Ccsab/WuS4NIEE2rWQTQQqtePjPT8sN/58yUDhl/lSbUWArVHz7s8cUS9YE
         keKA==
X-Gm-Message-State: AJIora/A0ReD8LZEHqildC/+45buPn8jCJwjbFEfYjVozHVf1Z5zOdAI
        trhQsrAqCHItWX1f6c3ySMzcOg==
X-Google-Smtp-Source: AGRyM1vYV/1SLXnnhRjMlNdBGcQm2Z5iYiXBH0NyUJBWczzuTWGpf7kSSRTOVOSf9682pD+uViAOtw==
X-Received: by 2002:a05:6808:1486:b0:335:b75d:6c1c with SMTP id e6-20020a056808148600b00335b75d6c1cmr5100164oiw.263.1656609140545;
        Thu, 30 Jun 2022 10:12:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 65-20020a4a1a44000000b0035eb4e5a6bbsm11341066oof.17.2022.06.30.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:12:19 -0700 (PDT)
Date:   Thu, 30 Jun 2022 12:12:17 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 7/7] clk: qcom: add camera clock controller driver for
 SM8450 SoC
Message-ID: <Yr3ZcclsaBJP55Bs@builder.lan>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081831.2554107-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081831.2554107-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 30 Jun 03:18 CDT 2022, Vladimir Zapolskiy wrote:

> Add  camera clock controller driver found on QCOM SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
