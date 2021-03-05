Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A3232F470
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 21:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhCEUIy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 15:08:54 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:35603 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhCEUI2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 15:08:28 -0500
Received: by mail-ot1-f50.google.com with SMTP id r19so3016574otk.2;
        Fri, 05 Mar 2021 12:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IKoVg7EZDRKR5Kv8ThsHTjZN2hVIlN+UQJmRUso+t/Q=;
        b=LwBOI4imRPsEnsZOAlP5wXtQFKoRuCRauu4MILwINzN0oNaOtLGfKVqHZbLQjdzDQL
         W3tyAbTVuOupKvdO/EdEO+OPu6n8XysjDImHNIYOXsCCBxG/Vn2A+iE2S3cLSezqhDl7
         UtxbE88J1waKIZCJA2I6n8pgvuxbHk7Fvl7TEgcju652aXP64EaoTHVC3Zuo0ZsvfJFq
         bOHi/7XjhzKOtMNMI4RTPEDKbSu4yNJ/KFGl88hNdqZDf0OTuXC8p3f1ps1GOx8JWE+C
         rjq9ks7spYyPSaGc6RSU+8YzkYqa3g1RzY7TbsRkJITEiAt68YyZi6Vu4TI3W8IpJlHs
         YSXQ==
X-Gm-Message-State: AOAM531gA6/ZSVOeYiqaJkMZvlZ36gej+Pw6Zm3E7JtN0hcYvB+x7Z0d
        laHKIsCwNoun46avPHtfPYUl3GLMWg==
X-Google-Smtp-Source: ABdhPJwNB5gUEQdYEvFFexBwLIA22J27uU79xfzDhKjxOAupXnJoK6yCNdI7ovSQ5Y0+xPkSZIOfpA==
X-Received: by 2002:a9d:1b6b:: with SMTP id l98mr9096868otl.182.1614974907435;
        Fri, 05 Mar 2021 12:08:27 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r81sm757024oie.2.2021.03.05.12.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:08:26 -0800 (PST)
Received: (nullmailer pid 566352 invoked by uid 1000);
        Fri, 05 Mar 2021 20:08:25 -0000
Date:   Fri, 5 Mar 2021 14:08:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 01/13] dt-bindings: arm: qcom: Document SC7280 SoC and
 board
Message-ID: <20210305200825.GA566304@robh.at.kernel.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
 <1613114930-1661-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613114930-1661-2-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 12 Feb 2021 12:58:38 +0530, Rajendra Nayak wrote:
> Document the SC7280 SoC and the IDP board bindings
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
