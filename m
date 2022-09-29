Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915585EF304
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 12:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbiI2KH0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 06:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbiI2KHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 06:07:25 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F37B14768D
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:07:24 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 65so940805ybp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6P2cTknVyAGavRlD+4eMAUvWg3EU64xB/MzdvQ6eJEo=;
        b=Mr0hHY25uWS/mzDOzdRpAXl8R7VGuP4kg0xBwT4V/d9SnLCA0A5tHrk1adD7v3SnJ/
         s0zDwqEB0WKkZRrH6hMCHUMaJk9kpNyjChl9BeFHaBYweiCfARHmKqKA3QhBxeFX6OA+
         D/5yN1FzmTqzKM8bS68xBJ++Pzb0TcBAC7gI3mKmmwBJiYt9HZ1jnVPFqSs4GB5L0exU
         1W4M6NO6ERECu0iETHzedRPGyYirhLtBBBlbumILi3wkfYl3Eo6dL/+CbtkIjiK5JdY3
         ZZAiloIEalCuQJ7QFRyrT/ZacJzKHF6Pt68RK61ov017ULboqSJwwm2YiBhZ+lgF9vme
         kykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6P2cTknVyAGavRlD+4eMAUvWg3EU64xB/MzdvQ6eJEo=;
        b=wWhTdqUahX2Y7BAC+aQZwc/XGPCLN8uVQseZc1i8goJXGCDCVI00JlpIDB7Hw620D5
         Tzi4DutASDKIU+884oDmLdARGVCHpbqn4u5lVcaEWmU1BPOQQVrHqz+9iAL7eyzfvfRp
         nnp/+bTj7wmIHbMP7z/N7jh2H6LXWWbq0zEsywjNQENNs5V/8zBjwb129t9TsrwijmUE
         /EKyyzeh8GZ+jkXjUCJofGni9iXLZsnnIDX4eU9cyxEJwBRjcuYhZDFNmB8C2NHIQQRe
         p7A/D+/rE5hx4Msvtn9ICuH9XmIzFwAWgOUt4eYcITHsyd8OXSxIBFqWafzMnyu3+aLS
         Y8GA==
X-Gm-Message-State: ACrzQf3uXuqUcWM0LYwJMnMfkLzfbcbbdceZ8ITtoKP53uoYCdeoJX3s
        gVZSHXB/TBNr7C+fF4OOGC5lpSjMW9SzpoSHtCeSLw==
X-Google-Smtp-Source: AMsMyM6D7SqrPmQfsbrIbYDPacs/gjDFTKXsYNUovfxlVQCoXY4xCWnklSmGugX8OW+YECAv0AUBs3whESatrlacJZY=
X-Received: by 2002:a25:a502:0:b0:6bc:2835:a88a with SMTP id
 h2-20020a25a502000000b006bc2835a88amr2355273ybi.15.1664446043618; Thu, 29 Sep
 2022 03:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220929092916.23068-1-johan+linaro@kernel.org> <20220929092916.23068-7-johan+linaro@kernel.org>
In-Reply-To: <20220929092916.23068-7-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 29 Sep 2022 13:07:12 +0300
Message-ID: <CAA8EJppf5JkYYiCvjdZkPvKQLSP+F=fwEu93U8yD325ES8Mzcw@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] phy: qcom-qmp-pcie-msm8996: clean up power-down handling
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Sept 2022 at 12:29, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> This driver uses v2 registers only so drop the unnecessary
> POWER_DOWN_CONTROL override.
>
> Note that this register is already hard-coded when powering on the PHY.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)


-- 
With best wishes
Dmitry
