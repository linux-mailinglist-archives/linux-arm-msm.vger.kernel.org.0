Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41A095EF30A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 12:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbiI2KIX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 06:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbiI2KIV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 06:08:21 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4E9147F35
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:08:20 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id j7so937043ybb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ydGq/fPOdVjN/NSWHeJ2DxbY7fBp6o6MA/HFKMNqxgU=;
        b=AHHAs497vvbguPlXv7XHKDPBy/Di8mERVLRtJr6se1OXYNV4By1TAyWPXLp5A7mMel
         MpClPx+X43T1zrGG5JoQcPUEEHuA16XKqkCqtmfuEknM7GNANPQmBkdkshLFTUOMfkOF
         giogsSMyQmWV7j43RqgZ9wQXRqU46KN2hzxq0qUBNj9D2vwR+jlUwc/+s+Hf/HeNkhVo
         jQmQUY1xoYJqoMrBbMjHxczrDmORvqvUS/D8gPiWhfBH0nYz9l5KTPdqRYm+mhSysyz/
         5ANjBDd89CAkmP1titLwj6cudheqAQ+bBwppe7JkQMGweSqOjA2i4h60cXG/yqj8Jwcy
         QoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ydGq/fPOdVjN/NSWHeJ2DxbY7fBp6o6MA/HFKMNqxgU=;
        b=u9XjrO1HoRgm+lLeVp+y/BrpgHF1d7xh5Tejeudt2vzzXNMamH+p4OGsrux1qw1XQJ
         lLvb0Cv2ahrcCS0jaa50Sw8nJ4WcLjuabcaslz4dft8usRL7xn1rm6pRTtmYRZ8m1leY
         CrW94Q7FDU6sOvFZ+FrsCBIf14sZ9oQJ8AxBDUi6nU9CJPAzEbz2RB/VpPZiy0L+rRZ1
         sBZ4EF3i0w2NS9hjtDAjqE3f5hhD8KyYfqlRGElgtvZWuU4eLMxTOKn9yl6vQkqpswFN
         MSqBGu1r7k7C7JmWVkZEaXMjGwkEx/qV9PWhceiY7hLm2YeTxjIlgP4cklXONZR0E4uv
         Bt0Q==
X-Gm-Message-State: ACrzQf3A/3nFo5ODo4IYbMWIx4czrT1P/aPC6Py4oepxIeHVGtvaXhsn
        F2QaJzEN7cKusCTH7W/AgvzUISJNr93CqKtrNX7YIg==
X-Google-Smtp-Source: AMsMyM7ieyTxTTA6uPOVN42Yh8JamyiN03of0aSAkU5rfnFNvnB/25KQmZu9RYp8Jp/ffCRaoA5jEKsedRKVz9CMqvU=
X-Received: by 2002:a05:6902:102f:b0:6b4:7cba:b77a with SMTP id
 x15-20020a056902102f00b006b47cbab77amr2433124ybt.516.1664446099269; Thu, 29
 Sep 2022 03:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220929092916.23068-1-johan+linaro@kernel.org> <20220929092916.23068-11-johan+linaro@kernel.org>
In-Reply-To: <20220929092916.23068-11-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 29 Sep 2022 13:08:08 +0300
Message-ID: <CAA8EJpqirdWwWp7HJw8B3Wpnxzt9-rY+NmoKHPsRQ20LMscWZg@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] phy: qcom-qmp-pcie: clean up clock lists
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
> Keep the clock lists together and sorted by symbol name.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

--
With best wishes
Dmitry
