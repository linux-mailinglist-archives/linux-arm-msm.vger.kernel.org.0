Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3336132FD0F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 21:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhCFURV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 15:17:21 -0500
Received: from mail-pf1-f180.google.com ([209.85.210.180]:44726 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbhCFUQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 15:16:50 -0500
Received: by mail-pf1-f180.google.com with SMTP id t29so4454388pfg.11;
        Sat, 06 Mar 2021 12:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nAGtQf/8APCUxEwm5cGdk08NsTyMPmkcIePTzCAz2RQ=;
        b=jHCicru+S75Ueuwzw7xDhdiTCNwhIc8n38F29uVSQ6HbVcM7E4QjYLx18IRFHxusLA
         tJZfPat3i7wTUrzStojWRC0P9nighdBNZ7g2FEJjInpGoKHOK7GncKOtRKT0DU25/tLd
         doGsOsHttdauk2nb2+qrCMQURCZWf8jIuUo3viWlqXLofJL/Lb3vfb1Tun4y0S6gX910
         QpIm4moUaed/ejOLW3sCLblQSaTctS5a9aZ20cfya+DoJtnoj/HMYKcqobvPM5zTcnWA
         pAEW33u9twE4EsznxFOss/z3RuF8o4GbuG3f60H1yD5ndZeIrdEd9n9vZSRY/+JjuTLt
         5h0w==
X-Gm-Message-State: AOAM532mzeApyzdLA9zuUNDANBP+pkLH25t9azhRtd/KwESb2KIqnpxr
        2T48W4vQDMDJnwYfzf6bflRy7A4O2VaH
X-Google-Smtp-Source: ABdhPJyuwQg1sSjBu/RdwCYsJwGlH1GB3BBlzSdF/QfdSNyjw3mGsDUPmV2unZrUjNrko4S2rHVpDg==
X-Received: by 2002:a62:b50a:0:b029:1ef:1ee8:1164 with SMTP id y10-20020a62b50a0000b02901ef1ee81164mr13605786pfe.72.1615061810218;
        Sat, 06 Mar 2021 12:16:50 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id q4sm6157153pfs.134.2021.03.06.12.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:16:49 -0800 (PST)
Received: (nullmailer pid 1146833 invoked by uid 1000);
        Sat, 06 Mar 2021 20:16:44 -0000
Date:   Sat, 6 Mar 2021 13:16:44 -0700
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, rnayak@codeaurora.org,
        kgunda@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: regulator: Add compatibles for
 PM7325/PMR735A
Message-ID: <20210306201644.GA1146780@robh.at.kernel.org>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614155592-14060-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Feb 2021 14:03:07 +0530, satya priya wrote:
> Add PM7325/PMR735A compatibles for Qualcomm SC7280 platform.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
