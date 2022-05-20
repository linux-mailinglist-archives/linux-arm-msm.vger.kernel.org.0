Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A5252F1F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 19:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350383AbiETR7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 13:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236711AbiETR7d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 13:59:33 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410F8185CBC
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 10:59:33 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id n18so7970719plg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sbMDONAaztslfXaF78nBYtIMs/PV+y42syiXcKACw5Q=;
        b=Jhtlk8lHsn6u+oOAB7a/p0PWW3TbxTLhc0sW/6epPVuUiPMe9xLclwv5eDff7hIXaS
         ToKOYgr1XVTsrTSvAi7W/964Zo9RkvxQ5zeR/6658ije+WXP6Cr3FJ81KJR6gKLeeAgz
         d1MG24ovbIRoDgx4qFpciRFKWu2vG5eBp4Y7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sbMDONAaztslfXaF78nBYtIMs/PV+y42syiXcKACw5Q=;
        b=Vf7/qv0aMVfzjF0T5DRk5geaEM1j+Ns6I8etjvZmkIZp2CrZIX0zcT1Qv12kyRDPZP
         UZit/FNs7YGyIlYhcYRg81lJ+kH7EyaZtvtCZ16Nk81rCa9ZYpUIT+mhHiOINUXlODIC
         oXb8nIyKqVad/GnxY8Q6+E2u9cj6OTzrNeFgtTVZGfvvIrRvIT+9pF1zDejodpmyrxCZ
         S8R2cN132pa9HSCGb1ajPDdRr+zspjLAV2yzGypoYmehaMqDe1932L0ILviM1xVmVNXS
         BXc4G50CYaY7+NndMUS9f131Fv7qfK+mIwAs8SwSF6ilonnikjSllktmZtaZvCi0Gzy3
         8ezQ==
X-Gm-Message-State: AOAM530mlmSFu4nASOAphB1NnAzcmi7h4S2Yr6NcXCkGpraGkH20Pvlu
        0sUE5y6SskyRtb3Gs+act72Rkw==
X-Google-Smtp-Source: ABdhPJyrYcUsPiH2mjLiwGXoeb+Y+raXsTARhnMuiylx1OwmePb8juaW8TNHo0Rr/jBSXjxJppNMMg==
X-Received: by 2002:a17:90a:a384:b0:1dc:a407:b5ac with SMTP id x4-20020a17090aa38400b001dca407b5acmr12083393pjp.11.1653069572786;
        Fri, 20 May 2022 10:59:32 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:5332:2096:60a3:3455])
        by smtp.gmail.com with UTF8SMTPSA id p21-20020a170903249500b00161b3d5e3e4sm21287plw.304.2022.05.20.10.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 10:59:32 -0700 (PDT)
Date:   Fri, 20 May 2022 10:59:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v2 3/3] arm64: dts: qcom: sc7280: include
 sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1
Message-ID: <YofXA0QTpDYZj7wl@google.com>
References: <20220520161004.1141554-1-judyhsiao@chromium.org>
 <20220520161004.1141554-4-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220520161004.1141554-4-judyhsiao@chromium.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 20, 2022 at 04:10:04PM +0000, Judy Hsiao wrote:
> Include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1 as
> these boards use rt5682 codec.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

Please make sure to collect tags when sending new revisions, you already
had this for v1:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

