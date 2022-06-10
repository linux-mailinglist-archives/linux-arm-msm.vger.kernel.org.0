Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C88545ED8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 10:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347675AbiFJI0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 04:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346851AbiFJI0h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 04:26:37 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A496F7C16F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 01:22:34 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 3-20020a17090a174300b001e426a02ac5so1604469pjm.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3CtnHIzyhGEYhzx3WNgUS+gaxi+Uj76buOwhyxDW9JA=;
        b=P+icoPLQ8Nk+Gmp8FoNBjVlU1AFx37XNMv9ixnzv9UeVE6iuCIsRY6I1D1wzejPsVd
         IhKlmYVqH7LgrgIqcvUlSSlV84NKzulcBXdxxK0r3OX9mQhcc7HQr5Ip/IjMQKQiijfn
         GPYGNvBp4sT1+cCpTOgcdc29yGw8TYXHNgKldrOv4PoxSLJTTfLYzRVzYIKYh6UdIvZe
         YYSne0wQ8MdBiVavj6nUDLym7VZBhGOUC60J1lP7rXVrXb8K+ExNSAG0lDvM3PqoLVh2
         O/FmFuFtYp/TOonqdBt+3t3HGTDlNbHnDdOL7MmF4b7YimLZbgwR1QNIngCaK6XY364s
         E7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3CtnHIzyhGEYhzx3WNgUS+gaxi+Uj76buOwhyxDW9JA=;
        b=mzQ7KQfwIJ+qqZwOn2E/rw4r2iG/DZ4VdTZPZL+YknO/VrIR/xE/QBghpasQ/SDuP9
         fXsSUFO0ur5wCm0KDiUOx2NyOeNhojbm5FTTsTeb1x7hTOPr+8KTmYhqvL/O1LjAobXJ
         rGLjkZbGIY2tfwHx7ZJROVJZBBEsPnLJlBKQf3BQO3WEJQqG9ZOURYS2tdchhlr5TQLM
         e/0oYNope8/9mk04D/dQzlwbyz3MM7V4A1Yf2ilfmYFXWZ7ngo8yTB/je6u/Gvs5a8u0
         Gt3UA7I2IWgsu77CKPIXId4MLuxOY/mVqzJl4KxUhfBH0bpnQFPlC7XTN2TYtRflNkIG
         Se/Q==
X-Gm-Message-State: AOAM532zqsfIStqCrsYNS52s3hdjX8AHXak1a5R9gEeFInaxhfzeozfw
        JxHGUvm7fqwtMsFIwPblp8MazA==
X-Google-Smtp-Source: ABdhPJzfwsXTu9tAeQ+ghYeLVfc5S9wlWaBhaOGYpPwAKkcSzkaa8cG2JwnafTcUroGpeaE9qHkq+Q==
X-Received: by 2002:a17:90b:3a8b:b0:1e8:3056:10fc with SMTP id om11-20020a17090b3a8b00b001e8305610fcmr7694914pjb.145.1654849354195;
        Fri, 10 Jun 2022 01:22:34 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id o21-20020a170903211500b0015e8d4eb26esm17970929ple.184.2022.06.10.01.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:22:33 -0700 (PDT)
Date:   Fri, 10 Jun 2022 13:52:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [RFC PATCH v2 4/6] PM: opp: allow control of multiple clocks
Message-ID: <20220610082231.nyywda5j6c5tr7tv@vireshk-i7>
References: <20220411154347.491396-5-krzysztof.kozlowski@linaro.org>
 <20220425072710.v6gwo4gu3aouezg4@vireshk-i7>
 <dea39b1f-0091-2690-7f07-108d07ef9f3c@linaro.org>
 <20220510044053.ykn6ygnbeokhzrsa@vireshk-i7>
 <1e533194-7047-8342-b426-f607fddbfaa3@linaro.org>
 <20220511050643.hd5tcrojb3wkbg7t@vireshk-i7>
 <20220518235708.1A04CC385A9@smtp.kernel.org>
 <65a4c28d-6702-3a9f-f837-1ea69a428777@linaro.org>
 <20220531103029.ntoypaafnd6447ag@vireshk-i7>
 <7a66f2e2-1a2a-a262-138c-f535499984ae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a66f2e2-1a2a-a262-138c-f535499984ae@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-06-22, 13:23, Krzysztof Kozlowski wrote:
> In general this looks reasonable and matches how the UFS gears should be
> modeled. It does not match how UFS drivers implemented the clock
> scaling, but that's the internal problem of UFS drivers. They scale the
> clocks only max or min, even though there are multiple gears in between.
> The new approach looks therefore appropriate.

Hi,

I have finally finished working on this and sent the last patchset and
cc'd you. You can also directly use opp/linux-next branch for the
same, which will land in linux-next as well.

Thanks.

-- 
viresh
