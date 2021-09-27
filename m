Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D69419ECE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 21:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235847AbhI0TDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 15:03:12 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:33688 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235825AbhI0TDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 15:03:11 -0400
Received: by mail-ot1-f53.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so3746648otu.0;
        Mon, 27 Sep 2021 12:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KDfN3VPs9v1P9wRbetasKjyeNxBPhJmR/WhM7HctVEY=;
        b=vpj+FmV/eT7TetncPNUWzNfht1YRDC1qOYAD/dfg4QfLI6Z/C4mZ91GE2yqHCaB6Di
         0sZ9FgqLr+UpcZD8vKcHkN/PIuayzP1sdGPp9Stj/vkYYRPE6h0uxoxIxUZH/pvpUaCt
         ypzZT3eyvfz+1IPSDY3/3AwnWLRVrLJrv7HGbJevpOoLmPUshT1NrYstRQMZvHC0jCFk
         D7BSdhD5/vRPkSFxPyOnBVopFrWpGCdSYYAEpziwdXGaQSeEIRytrodCeea4Mju91ZPK
         OKpl039sq+3EIOcn6008/Qz7EpAHApXABRuLZ+Ltw9ZR9EdgCICXiU3z5qGLUQ7Fvdyi
         /vcg==
X-Gm-Message-State: AOAM533eaafWnDOgNjqGhTJzkZ52X1mtzfpf7g55YsjSQnFx8D6xQP/3
        ZnBEXaHPO4cyNMOp2fgkaA==
X-Google-Smtp-Source: ABdhPJz6z3MNPTLUXwOZo87wAe7zH1Ti2ldX1clqtvsG0UygqrhDcYkZP4+QP/c4OW/PUNc7UvO1ew==
X-Received: by 2002:a05:6830:2b27:: with SMTP id l39mr1444334otv.25.1632769293304;
        Mon, 27 Sep 2021 12:01:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z10sm4127882otq.64.2021.09.27.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 12:01:32 -0700 (PDT)
Received: (nullmailer pid 3670394 invoked by uid 1000);
        Mon, 27 Sep 2021 19:01:31 -0000
Date:   Mon, 27 Sep 2021 14:01:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     tiwai@suse.com, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        srinivas.kandagatla@linaro.org, swboyd@chromium.org,
        robh+dt@kernel.org, perex@perex.cz, rohitkr@codeaurora.org,
        agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org,
        judyhsiao@chromium.org, bgoswami@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        plai@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: qcom: dt-bindings: Add compatible names for
 lpass sc7280 digital codecs
Message-ID: <YVIVC5GFTMu2PjPm@robh.at.kernel.org>
References: <agross@kernel.org;bjorn.andersson@linaro.org;lgirdwood@gmail.com;broonie@kernel.org;robh+dt@kernel.org;plai@codeaurora.org;bgoswami@codeaurora.org;perex@perex.cz;tiwai@suse.com;srinivas.kandagatla@linaro.org;rohitkr@codeaurora.org;linux-arm-msm@vger.kernel.org;alsa-devel@alsa-project.org;devicetree@vger.kernel.org;linux-kernel@vger.kernel.org;swboyd@chromium.org;judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632313878-12089-3-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Sep 2021 18:01:15 +0530, Srinivasa Rao Mandadapu wrote:
> Update compatible names in va, wsa, rx and tx macro codes for lpass sc7280
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 +++-
>  4 files changed, 12 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
