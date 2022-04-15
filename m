Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07C625033DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356654AbiDOXqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 19:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbiDOXqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 19:46:36 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE84DB6D32
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 16:44:06 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id c23so8205428plo.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 16:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w2QrILTyqQ+Pt7TX+dc/u5nUBhPOOUFyhDJl0/uG8KA=;
        b=WQYEUw+TfPdba4M0qoV3YoYNx0EokWXTwcm94AT/cqahCQWwwjBWEbOZD4bvmT0NFb
         Xcx5ODn0k7YRALA13OhixgkDU8uYYogteOunDDY5goCtmJyK/qUBiMez/8Ex2AWPKxfs
         zWYTFOtjGivIKkh9dDxV5C6NheZrsC87+NjXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w2QrILTyqQ+Pt7TX+dc/u5nUBhPOOUFyhDJl0/uG8KA=;
        b=ZZd5d/4AlvID0bsV5yGL+0MCFWNw8r37oWOzmyzeqJQbYayHznmHRBw2rB3qU7RpR9
         lFidKlZJM4sRsyOQLWi8wt8mYBkp7Y2j6ahYZvPT4OZcwx4g2Ocx7AvWoMul0tM9XoMP
         kkR8oBYk2UrK2XFRkjZzcIT0nVKqg20sJP9f6DJQMx7fgNysa4/jOOynSX0FKUrcmcdD
         Y/r67U6Gl+V8F5czWM9p7ntLB9uE9iThOPbXh1+k9eNvw3izK0U3ztDhFEfle3AA9qFo
         EMekFTpKjw2J90Z2wnvlkFjSyEfgUtZbuCg3slg6IihXvkqvX/vDqECybtUF0HOHLGX+
         8n/g==
X-Gm-Message-State: AOAM533OeQ3HMK3h4qMubOt8B6UD6WwW7oHgbA1ipEIlhP6wGand0Ow0
        O+SUBvqaw/uKugC7CP6cPClBIw==
X-Google-Smtp-Source: ABdhPJx5DUqDtUFoTZutT3tV3A+5mldSPzpeVrsrxCdXDbVcaqBeXAPd4TrSNpEqM3FQkJq1z1ovDg==
X-Received: by 2002:a17:90b:1b44:b0:1cd:49b8:42b8 with SMTP id nv4-20020a17090b1b4400b001cd49b842b8mr1313605pjb.102.1650066246324;
        Fri, 15 Apr 2022 16:44:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b27a:b3e7:2e3e:e4be])
        by smtp.gmail.com with UTF8SMTPSA id k10-20020a056a00168a00b004f7e2a550ccsm3938967pfc.78.2022.04.15.16.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 16:44:05 -0700 (PDT)
Date:   Fri, 15 Apr 2022 16:44:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v12 7/7] pinctrl: qcom: Update clock voting as optional
Message-ID: <YloDQ7V7JTNYkjWu@google.com>
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
 <1647447426-23425-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1647447426-23425-8-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 16, 2022 at 09:47:06PM +0530, Srinivasa Rao Mandadapu wrote:
> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, as these macro and dcodec GDSC switches are
> maintained as power domains and operated from lpass clock drivers.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
