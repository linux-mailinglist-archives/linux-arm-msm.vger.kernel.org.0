Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98DF4D236B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 22:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350460AbiCHVjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 16:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350410AbiCHVjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 16:39:40 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E461A4A3F0
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 13:38:42 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id z15so505077pfe.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 13:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lin5Y8pF3h0JfcTJYxJlWCUsz7xHO5MQVqx+KQ1pPe0=;
        b=Nl2mwGfNB4uAEP7nSP27iHZ+vcTK2mnzgyu6mfHRIot/6jRLLZBRhAAIKM7SX7JOHg
         xCWQ4z4H5EDT2fBS/wIshVb+VG6agnNKHe0B9zpnfgrltyl0/EGImhsM8UMIrWnRhHaY
         FNWHuypztgPBv/5P/AgSXMHddz25JMLYdD7Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lin5Y8pF3h0JfcTJYxJlWCUsz7xHO5MQVqx+KQ1pPe0=;
        b=QnlsRgzUXR5tGtNHu5TDPHVu3Lkp+hsgaZGlaZlTyB9Jh7eOYd2QTmWAG0QR57A5Vl
         NsJXq80HhFLGnUostdLjbaL4AYvsij9mfq8HiKUzpMBgc5N0Rl9ZFU141rzBV04PltFa
         /awu6pJ71jJzLNluvM7X9MbADE/Noiw2Jgn5AtUqUECNCdnlnwxunQYKdDwCledWkz7b
         QITzkDmNU4seuUH60lP7L+UFO8z0EUPWqZVnS/xGbgAvYWIOvnWkxQYblwKjCTV7uluA
         /TJ4HDsHQZtUf2p+N/LbcJbzV0XIzOCYUbLiSsMfylI89iYqn6vd10W2T8v1daNqlo5X
         6ANQ==
X-Gm-Message-State: AOAM531PwlGjEuKFaudsH08TN1u9QglOlysFDOC+r+2cvwU13nGmSpaB
        kgFAFYUexbS1jLeFN27x24L/hA==
X-Google-Smtp-Source: ABdhPJzrgLQf/DqUeQXsVR8B5HrfPYq3WyesRBpFzpPMlLrv7WRweCT0FnTFBhAHd3828TyujBP9kw==
X-Received: by 2002:a63:191e:0:b0:37f:f33c:2d43 with SMTP id z30-20020a63191e000000b0037ff33c2d43mr15535537pgl.43.1646775522474;
        Tue, 08 Mar 2022 13:38:42 -0800 (PST)
Received: from localhost ([2620:15c:202:201:1278:2de3:d283:6ca])
        by smtp.gmail.com with UTF8SMTPSA id w204-20020a627bd5000000b004f6f70163e8sm20901pfc.31.2022.03.08.13.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 13:38:42 -0800 (PST)
Date:   Tue, 8 Mar 2022 13:38:40 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Delete herobrine-r0
Message-ID: <YifM4KCXvaYLVc59@google.com>
References: <20220308125044.1.I3e4a1a9c102d194698b68661e69efebafec8af1c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220308125044.1.I3e4a1a9c102d194698b68661e69efebafec8af1c@changeid>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 08, 2022 at 12:52:35PM -0800, Douglas Anderson wrote:
> As talked about in commit 61a6262f95e0 ("arm64: dts: qcom: sc7280:
> Move herobrine-r0 to its own dts"), herobrine evolved pretty
> significantly after -r0 and newer revisions are pretty
> different. Nobody needs the old boards to keep working, so let's
> delete to avoid the maintenance burden.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
