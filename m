Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A8DB2786
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 23:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390018AbfIMVs7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 17:48:59 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33172 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389815AbfIMVs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 17:48:59 -0400
Received: by mail-ot1-f66.google.com with SMTP id g25so29544362otl.0;
        Fri, 13 Sep 2019 14:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:to;
        bh=FuZeSZ6suMRyFSY+TgPf5fhNfpPgBW4o0HF/Qo2+lDg=;
        b=X1mZ6BhCAJ6LUqCJdreOaGPkNzKTh/5gF/mmbK8NnoQ83ry/pKNxmqmqSTVGNa93G1
         dCGsD6KIghnZiFCvDpOcHIPQBpWFHVBvlb4P5N1tUMk+RLv1C1lPfSO5uL6gGchZN/gd
         IMchp2sgBCo5qc6FDpa6dBS8MVrpBvn3+2DAWLOYBdWC6f5FfKDrNab+IkFSOmOPL5ft
         xzaxrKk2+JglBJ3r4dGmngZkm/4GXvN7BNOD8DG2ORXdrOfZVEgvkkWdO3bg0d4v5EQW
         7+GhPm/6Ym5czbrVQV3/fAkW/ogNhJtbqEZN8FH1Irvp6pEIwiHPgt0LIp7qxbHnVeFa
         pSIw==
X-Gm-Message-State: APjAAAV0sP382DzLS8+smmokfsqFkfAjFq4y+p35WeIf0I/QLnAMNflo
        h6aRZvSYG66gl1RMK7kSiQ==
X-Google-Smtp-Source: APXvYqzSLsUvpdiX85+khBXjWKU0L/holDjcWNZzszftRdJGuioOAZ3AJ0onAlQBAbfHxVx0wgoK3w==
X-Received: by 2002:a9d:6c12:: with SMTP id f18mr1011655otq.297.1568411338421;
        Fri, 13 Sep 2019 14:48:58 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l1sm10325918otq.6.2019.09.13.14.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 14:48:57 -0700 (PDT)
Message-ID: <5d7c0ec9.1c69fb81.a7d47.78c1@mx.google.com>
Date:   Fri, 13 Sep 2019 16:48:57 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 08/12] dt-bindings: mailbox: qom: Add ipq8074 APPS compatible
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org> <1568375771-22933-9-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1568375771-22933-9-git-send-email-gokulsri@codeaurora.org>
Cc:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Sep 2019 17:26:07 +0530, Gokul Sriram Palanisamy wrote:
> Add mailbox support required in IPQ8074 SoCs.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

