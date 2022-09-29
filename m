Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39C565EF30E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 12:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbiI2KJE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 06:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235252AbiI2KJD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 06:09:03 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9195147F27
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:09:00 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3539c6f39d7so9300207b3.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MXQESY1mHG8/5D/ME7ABQ5lBEKvt6gTe2x7xG90vFx8=;
        b=X2iymI2EEZhUIAYurukNRtZnYgro5MMmDG53TG8dBHxQ3R/Re3ZvfAt1sZpPhOTI3v
         hq7jJRQWZi6iCNANUCkgAwMZ8qSF3bYR2w1CBGOj/W1Ezgqxf06HKSV70s4X4jJoIHTh
         l0k8Yfk1J+MTZXJQPWiJxT5AHikQbNT9jk5s+oGpetr7gE+AFZ/tMQtA2CaTe9Tnggo4
         B/M8Ol7YYAR6ESa52OuByK7w4tm1eZFylKGDtf2k+Kn64MxHw9U5SwUwa9WNBH+wdrWt
         PvSemi1i1QbdPm/Bqe7K/C5/VRfPxVBdlIRADk8shXjcbi0NV29CK6ra/MtcgEzCAJim
         WZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MXQESY1mHG8/5D/ME7ABQ5lBEKvt6gTe2x7xG90vFx8=;
        b=hh29nxHrb0PC73Xaid8Zioc/8awrAM9fpB6N8mURH5z3vxKmPhEjZqThFCoVr+FOUr
         Uz3TZ7+0PfEvxrI6Vi99pTPUDEJq+RJk3deDdlE73Ar8h8f1eJUZtRy9gUT2+1X+4gyD
         KNNn8rRr+qN3G1a5QFi7pnIQC+gfF+7/faGlLuihB//tkmyhSfvvAljKlOSNj51Z2yIp
         31PtIp/wsZGUs8W6dM/0hp2Ef8OpBAvVAVkpcd8fUAPHIA6+07v8AdJEO6cYKpw1jOOi
         hyaES+N913Zv2SkrPqWRquaNYRcygYriR9W5hJpbIiV4n1wrbKfhFCwgTdxqptlviTnz
         8bpA==
X-Gm-Message-State: ACrzQf0XqZy1fJLY/OHooEPzLBU1tlkZvVN3bBSTZHGmi98dxjTRRB7W
        cOjM2/ePDza9Zwv6qlEECEWOCmJm6HI4JC0HUsTIGQ==
X-Google-Smtp-Source: AMsMyM7s37ylpy85RJLyzF4hNLN92DAViFRfIK0/3RnisNb3gJYZ94sOIWj8I9K0VQ4WODCIH9aXlyRdcfwv1rMknns=
X-Received: by 2002:a0d:f685:0:b0:343:bd3d:80b2 with SMTP id
 g127-20020a0df685000000b00343bd3d80b2mr2221076ywf.485.1664446140144; Thu, 29
 Sep 2022 03:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220929092916.23068-1-johan+linaro@kernel.org> <20220929092916.23068-8-johan+linaro@kernel.org>
In-Reply-To: <20220929092916.23068-8-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 29 Sep 2022 13:08:49 +0300
Message-ID: <CAA8EJpr9_1V8nb_VBn9cBsb1VvVpUh=Necv0ZK3f9t+X_Lbs1A@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] phy: qcom-qmp-combo: clean up power-down handling
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
> Always define the POWER_DOWN_CONTROL register instead of falling back to
> the v2 (and v3) offset during power on and power off.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)



--
With best wishes
Dmitry
