Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E39F4DD0E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 23:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiCQWvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 18:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiCQWvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 18:51:47 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2F81B2C46
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 15:50:29 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id q11so5640435pln.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 15:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xk909YqHig2dTJkrGG5jWlYP+uFJEr1ye3KArdszZ98=;
        b=ZtR9XBXP0tnt33OHp6tXns5ztKTnoKlugIT84xYV3Jz81q/cHRGa2oQF60MGC77Ojm
         eCPLOhCB1kR+zFCf8hITs/cOEDiKcX0eU4fzOAXBRXbR6hp1eLMCC6/ZhHJD5bl5+aiE
         MeY9h9UVbwlFAXTw/YRetY6h798vUz4FE2g+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xk909YqHig2dTJkrGG5jWlYP+uFJEr1ye3KArdszZ98=;
        b=G7J94hRsWeoXyQv9rBbNkqYXF99mfgyCfbiUmvTbpmllnqVuj85ApedHQvBL4zYSUA
         T4blVkJXvLtZAawiwVsBcCNV11NT7zZqCjtFekUDY+8eNGtICeBJBhzpS7Wmnb8xUdB0
         hcxEkVJtKhx/G2z88oMCVzbWh/ZtTRnfZFrGaa93xOFye4cYoxs7/RoUg6fm5lMEEQzU
         n85QRkvI5Tq4ReBzkTA6KxSrVhdxdvFlvQRDuZpGOvuXeYYtQlGOx9lRa8rg799yWGZL
         YsBwDohJOxi85NlEVlVhH5i3v894Z7DlGHkYXV4h35kvZM+ZbsmGtF93Cm1F7Tfi39Hr
         reGA==
X-Gm-Message-State: AOAM532/t/+LIV4sQ0LxU/3ljS5qki4vZdktzRxBmvcXzC9/IiqFRDUE
        nbYQHNyJpGHn4ovDB4CBgAa/ptH/J4GLww==
X-Google-Smtp-Source: ABdhPJz9LmVQbJFg5JioOzdBn0BkssnDZHF4Fl4RFFtnVqU7ZJ7qGJAZrexvP2RYmJkTaYZ451L0lQ==
X-Received: by 2002:a17:903:32c4:b0:151:c6ae:e24b with SMTP id i4-20020a17090332c400b00151c6aee24bmr7376058plr.85.1647557428876;
        Thu, 17 Mar 2022 15:50:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ae74:932d:af6a:6079])
        by smtp.gmail.com with UTF8SMTPSA id d11-20020aa7868b000000b004f768dfe93asm7358337pfo.176.2022.03.17.15.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 15:50:28 -0700 (PDT)
Date:   Thu, 17 Mar 2022 15:50:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Fully describe fingerprint node on
 Herobrine
Message-ID: <YjO7Mlr5HUy8XyXT@google.com>
References: <20220317010640.2498502-1-swboyd@chromium.org>
 <20220317010640.2498502-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220317010640.2498502-3-swboyd@chromium.org>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 16, 2022 at 06:06:40PM -0700, Stephen Boyd wrote:
> Update the fingerprint node on Herobrine to match the fingerprint DT
> binding. This will allow us to drive the reset and boot gpios from the
> driver when it is re-attached after flashing. We'll also be able to boot
> the fingerprint processor if the BIOS isn't doing it for us.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
