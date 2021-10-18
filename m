Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E41432806
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 21:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhJRT6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 15:58:20 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:34485 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbhJRT6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 15:58:19 -0400
Received: by mail-ot1-f48.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so176462otb.1;
        Mon, 18 Oct 2021 12:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3L6QOkuFLcgE5W3ceKjU2uKuh6rzvOKHux3CYfUbxiI=;
        b=A/NdxxVdzHePP2mP/TAQEZFEgIBy//9Z5xJqmfUuULbVG7tpAySMZsNWLG++Ybvzmh
         nnCGcuGZzLX/aaAclssAWY2lWxY3M1k/dQDaX8WYFyHCAY1j/o2VhVfn4KLQKC+0hQiv
         EcWOujar0U4Yzm4X4+2ToVv3leiH1yMCIH6ZhXBrgN4YxpVxkuwkhl3CYzSQjUDLxXng
         mSXxwCSutlbV9PlV/bTfqvd6enFxT9mSljcrkT5M+oMPVOdftFpjf9S+YV2lTDKM1LI2
         NxDFPVDR5cutVkWvvPkVqWTDxrIZQ/qv0RzHqHPnhIgDbxLjFJUHltO5e3bKjVRbAxBz
         wY/Q==
X-Gm-Message-State: AOAM532vY17YJMS0G7d2exBhYLos6MLuVC+qeBZszogE9JFevff38M1/
        CjUdBB28QRlpXqk+RfeOpQLkPO1M0w==
X-Google-Smtp-Source: ABdhPJwDXefZjoCNowW+4ibn6PpPNFPgk/bJSOebUBl9W/nxuMLVHib0NBbGSGsComHcepZqoi2E2A==
X-Received: by 2002:a05:6830:237d:: with SMTP id r29mr1598808oth.5.1634586967968;
        Mon, 18 Oct 2021 12:56:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id az14sm3144739oib.51.2021.10.18.12.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 12:56:07 -0700 (PDT)
Received: (nullmailer pid 2848116 invoked by uid 1000);
        Mon, 18 Oct 2021 19:56:06 -0000
Date:   Mon, 18 Oct 2021 14:56:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Andy Gross <agross@kernel.org>, konrad.dybcio@somainline.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 09/11] dt-bindings: arm: qcom: Document sm7225 and
 fairphone,fp4 board
Message-ID: <YW3RVhgON3wstUhn@robh.at.kernel.org>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
 <20211007212444.328034-10-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007212444.328034-10-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 07 Oct 2021 23:24:36 +0200, Luca Weiss wrote:
> Add binding documentation for Fairphone 4 smartphone which is based on
> Snapdragon 750G (sm7225).
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
