Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3172558DC26
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Aug 2022 18:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245089AbiHIQe7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 12:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245087AbiHIQez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 12:34:55 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654DA20BC2
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 09:34:54 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10dc1b16c12so14572895fac.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=6LR5d866oe6PIinAHHUItmicfDWEx4Jz1iksYtzFN5g=;
        b=Evi/hpBZLqwm0d4VhPxhjrQrCNOjsJcpxTkjJTmb0ttychMFqGRQziKhQC9RbzzZDB
         M+YLvlTz2Ue1ZF4Lc7qvMYfzhXY+600SSD+Myx7hqkozF7FAP+n6/XNFexcrK+rBw/jg
         aui7glwMycfA6XXUO/TfRydb5c+7229tbR0hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=6LR5d866oe6PIinAHHUItmicfDWEx4Jz1iksYtzFN5g=;
        b=Gq7X4dlD4xDmNVBIcWqImJF6uxMerDJhHB4Lb+9gVGVe+jzxzPuyFMaFtNrAQ8ZK6e
         odBTr/qZA8hKikVZTPb9KQWiSdCAELLu7nTjg8/xG6nxdYovgA5pJDev+hMkufIf0qJZ
         oaD3zBD7nz4zf7PIfYpRFSg8OSfAYhzQJ17to/5PvwZvT09MgTpfWuGsDuYuR5B2A7U8
         wLNLPwKXSV5JiRe0h2yRKhEhkebTk6IBD5l/QbELdO5U0+XSFnbbBBXNEPVF+PuE5vOS
         fMeiyiKIARF/GkhLgZDJy1Aayb61Yd+dFs6RGiQYGTT5MTjSGnXjewrrFD9RYGt7nYpB
         FUgg==
X-Gm-Message-State: ACgBeo24U1YzT+Hh8BHyKT0WPaVfLQu77tnGZOie81QaxCd0uYvsSe9P
        7Y9t/BZR7MwFAsqFSFzUTysAFSSB1C9PNVGGTFoCKQ==
X-Google-Smtp-Source: AA6agR58hPo6lYtBAKK8AafaLO/foW5eZ1t7LMTpy1FreZHLUbpm/8q7BOV42H1KXun+0aqIgnswlGR0XzFLk0n4pfc=
X-Received: by 2002:a05:6870:9a17:b0:e9:3d1:f91a with SMTP id
 fo23-20020a0568709a1700b000e903d1f91amr10876240oab.44.1660062893804; Tue, 09
 Aug 2022 09:34:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Aug 2022 11:34:53 -0500
MIME-Version: 1.0
In-Reply-To: <1660026909-7365-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1660026909-7365-1-git-send-email-quic_c_skakit@quicinc.com> <1660026909-7365-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 9 Aug 2022 11:34:53 -0500
Message-ID: <CAE-0n50BqexcwfFtFL3ebVfyZ4rqh6HU05anLxt9BD5zYf17uQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] arm64: dts: qcom: sc7280: Update lpassaudio clock
 controller for resets
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-08-08 23:35:08)
> From: Taniya Das <quic_tdas@quicinc.com>
>
> The lpass audio supports TX/RX/WSA block resets.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
