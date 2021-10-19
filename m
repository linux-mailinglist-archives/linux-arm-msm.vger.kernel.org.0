Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26AA743415F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 00:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhJSWbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 18:31:48 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:39828 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhJSWbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 18:31:47 -0400
Received: by mail-oi1-f181.google.com with SMTP id s9so4832704oiw.6;
        Tue, 19 Oct 2021 15:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xFYeVg6FWyXYKl+3smdoOZZ3xNnVCMuxzRBE3HFDtVI=;
        b=aq2R8cXClnmG+AfInUPmlIF/v5Xlj4AVw9CPKpGUsM0IMvBBicMeljs91Wg4M9rwNB
         ZJjmvn0E0Ub2HWysNtqOYxCqNPcOPNkxOkpoBavcK77q4ULAnQeWMCt7K0VEVrpxnHqO
         D0h4Q1FJP7q4m4d3OgbTGCI6i9W67kZ40hWvK1X+Qai87iViC070AcoXHiCI/rnbzSmr
         gBldK7Ypz81Bbc/y7XPwHedkShKqGQqDel68VgNZptAJ/hSgbe+FwD8ZdjQH1oMlJmjN
         rwj4kE0rRA35rA4NaArQKsXIcgFiNc7Ghikhlvt+n3nLlPAcJF7JrbjY4QZJOqq9XhNN
         Qb/Q==
X-Gm-Message-State: AOAM531dkoD69WSUh3e4t/rLeWJzq5A7AGhtzQCMCHuf8p36hem8/14Q
        MRP1JNwd0hcgvoWV7cISwg==
X-Google-Smtp-Source: ABdhPJx5DLaNmxHlBpFkTxJiZgmZX9VjbZj5Zt3zsB3Op8Z0QBBT8SmwYl+ZLxmDJuOiX5s/hM2IOA==
X-Received: by 2002:a05:6808:bc5:: with SMTP id o5mr6256847oik.129.1634682574072;
        Tue, 19 Oct 2021 15:29:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m23sm93946oom.34.2021.10.19.15.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 15:29:33 -0700 (PDT)
Received: (nullmailer pid 942683 invoked by uid 1000);
        Tue, 19 Oct 2021 22:29:32 -0000
Date:   Tue, 19 Oct 2021 17:29:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom-ipq4019: add missing device
 compatible
Message-ID: <YW9GzHDT8N4Ez78N@robh.at.kernel.org>
References: <20211009193102.76852-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009193102.76852-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 09 Oct 2021 21:31:01 +0200, David Heidelberg wrote:
> One board version (dk01.1-c1) didn't have set device compatible,
> so let's list it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
