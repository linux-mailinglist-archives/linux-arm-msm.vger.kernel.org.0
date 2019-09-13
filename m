Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21AE8B278E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 23:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390169AbfIMVtC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 17:49:02 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45818 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389815AbfIMVtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 17:49:01 -0400
Received: by mail-oi1-f196.google.com with SMTP id o205so3858683oib.12;
        Fri, 13 Sep 2019 14:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:to;
        bh=yfgqSFtw1luhLgArZwnEc8F6Xhggtmf4n8ZGTf+re+Q=;
        b=bz1yG4NHplyXnQ3Gz5TkD6Rc1wMDy5lO+dMNbCM5/cKeEqunpaGO6uj0Xqfjwb5/iK
         N17s9h2XgXQoSV0nGDIiLm2ndKo5a2cPkkp5Xu9ns/afYTDocPmvYu17P2hv4aS2k6Ms
         Pb+NGhuDpSc9iTVgcFp2qxgSskZnAaI+AJDYUvYwxB6XQCwuDztQk/yl1zdC2Vlt92JC
         I7hffJFaf5zpruym6Ki/aVhH1bDo66QqLGqfkTv0I6Q8mLiSsPmChaIC3BZA+Jo8EeHX
         YgYKuZW65S2poO+XTaAGJMNFVpSDKHoBl9nXGK1Ifl1lFqx8cmfKxWCpm9KMTTS3TYry
         hLfg==
X-Gm-Message-State: APjAAAXX4GpjxNb31wGBrDc8ieUVvnE+LlQZpgUrBSlrsmyM1hw/SRaR
        0LZ+W1H79F2jmggwHEiQ9rgKCY0=
X-Google-Smtp-Source: APXvYqwXGGOdmVJ9VM0SMs+yDbufGw9QI/c2JyZOHo8t7vKAYhKyPcGBFklrMw7/VRt0sQyrUUFE9A==
X-Received: by 2002:aca:ebd1:: with SMTP id j200mr5079576oih.111.1568411339449;
        Fri, 13 Sep 2019 14:48:59 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r7sm1417118oih.41.2019.09.13.14.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 14:48:59 -0700 (PDT)
Message-ID: <5d7c0ecb.1c69fb81.74810.a358@mx.google.com>
Date:   Fri, 13 Sep 2019 16:48:58 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 10/12] dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org> <1568375771-22933-11-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1568375771-22933-11-git-send-email-gokulsri@codeaurora.org>
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

On Fri, 13 Sep 2019 17:26:09 +0530, Gokul Sriram Palanisamy wrote:
> Add compatible for IPQ8074 support.
> This does not need clocks for scm calls.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

