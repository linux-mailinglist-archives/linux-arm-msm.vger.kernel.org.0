Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E05B534057
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 17:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241325AbiEYP0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 11:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240406AbiEYP0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 11:26:02 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEC3B043D
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 08:26:01 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id p8so19509386pfh.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yhe5331qppP84xsi1X8zty7rzehNpn0wLIMR29IPkso=;
        b=CtlqkVLfclrXgtQY9eq5OtF/WaWfENYsCPm+euTrRKFGI9id5VujlzxHSaESfCyrgX
         n0YlP7mUkWvh4zmdmLwSYr7Kj+3PtC8jmbURUFkGz9A8Doa7xoaLzUxaVwVTA8DUEo/I
         1e5fRtCNT4zEdJpl8ZTNSdspuq8McOuZxE2gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yhe5331qppP84xsi1X8zty7rzehNpn0wLIMR29IPkso=;
        b=sjjdmlqCiBn6kPFZdMcVDdHul7ehpIGMBmzq4urrE2ImlJ1ACTycP6MOKbAwpP6lyR
         fLXHJakU5P2DFmaRaHT4807wcuqt+kwKzTsGcoFdfyF7s41Y6sGRv+yXNCLp91JaCSYp
         UY/n+V/iW8FXdeJ6wGZrPnOQpzG/bQX90NO2FAt8tH6TnwFjGBBRfKCjBNoiISANMewz
         9mcU45h2bpTLyXEoxgSgSugdQh73l6kiLn4riEIqsBg+xpf1pWyoyALy7t6HbDCDUeLM
         oTEF4dsCh3t3upYukD7qs9cOvOc+yUwhLs2VIggIyNoZ6I0jP+Yk9Sxw7nj9MOlIxB2z
         242g==
X-Gm-Message-State: AOAM530zzp7fTcDSV4EOqE7e8JtC1HKfcT4LL6QriVu1HHWfCCM6HtOl
        CWBgzGkvHqYvTKSGahQBwNjVHQ==
X-Google-Smtp-Source: ABdhPJyzd4RC6tbH7od7x1K/AAvVKfDiKpH7Mt1LIRh/6pinYpf0SidpTMtigLVk5PZwFZGmXJqrPw==
X-Received: by 2002:a05:6a00:8cb:b0:510:9ec4:8f85 with SMTP id s11-20020a056a0008cb00b005109ec48f85mr34438802pfu.24.1653492360757;
        Wed, 25 May 2022 08:26:00 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:4d83:f549:9abd:427])
        by smtp.gmail.com with UTF8SMTPSA id p9-20020aa78609000000b0051878e8cc13sm9996124pfn.116.2022.05.25.08.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:26:00 -0700 (PDT)
Date:   Wed, 25 May 2022 08:25:59 -0700
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
Subject: Re: [v3 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf
 settings for mi2s1
Message-ID: <Yo5Kh1/nBBj6B81J@google.com>
References: <20220525014308.1853576-1-judyhsiao@chromium.org>
 <20220525014308.1853576-2-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220525014308.1853576-2-judyhsiao@chromium.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 25, 2022 at 01:43:06AM +0000, Judy Hsiao wrote:
> 1. Add drive strength property for mi2s1 on sc7280 based platforms.
> 2. Disable the pull-up for mi2s1 lines.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

You already had my 'Reviewed-by' tag for version 1 and 2, please make
sure to include these tags when you post a new version (unless there
are significant changes). That way maintainers can see that a patch
has been reviewed previously, without having to go through the entire
patch history, which they are unlikely to do. And your reviewer don't
want to be burdened either with having to send the tags over and over
again :)

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
