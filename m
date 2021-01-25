Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B03302EF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 23:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732140AbhAYWX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 17:23:59 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:35807 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732259AbhAYWS4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 17:18:56 -0500
Received: by mail-ot1-f51.google.com with SMTP id 36so14376524otp.2;
        Mon, 25 Jan 2021 14:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yuRJ5XXNmCcnnSjJmwKB5dtvH2780WSd0v/kIk+gCHw=;
        b=UOBjE7rzXGxGRCFXUGCz+UIR05MX2vMw+wrqaxqtQycXhWLuZ8x+mq4Wn784ifyBg7
         w/CPZJhyA00lU7QGVg8V+qXLop+2vX4aSQ+YrspduFdPOY5HnQtg38TAVgJBnRC5XsM9
         u2bCwLgDQ79E8aw9WnA6dSHFyNgDDKN/0n0TxBUHQqUSfRp0444FV/A8D/3mI6gVlUEn
         M7zo1YTCZ410VYtdN/6rCZumb6hSfe512cWkTKuBy4EQ8Njma4z+x97lq4sVFQLJepv1
         EocP97Svm+AQBKpLCvyxPBmIXL+VIR9N0khbiUoc4yVPnuwyBG7ZBxk3RWMtiXNDa6dh
         Fmvw==
X-Gm-Message-State: AOAM5322L3RydLHr2deX14X0Z8aryb77h3s3COm9ZBG+rAfRXjKA0L7s
        Ox4vqND/3eu+heWB/FPWsNVyNmPYnQ==
X-Google-Smtp-Source: ABdhPJxLmwOp2RDIRETQouyajpF6d+Q1vWI5hgWCBBP+Wckj414QPqg+qNxlc15tQpggvc6DqEhTZA==
X-Received: by 2002:a05:6830:1f02:: with SMTP id u2mr1956465otg.124.1611613095102;
        Mon, 25 Jan 2021 14:18:15 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w5sm3113210ote.29.2021.01.25.14.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:18:13 -0800 (PST)
Received: (nullmailer pid 1120980 invoked by uid 1000);
        Mon, 25 Jan 2021 22:18:12 -0000
Date:   Mon, 25 Jan 2021 16:18:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: Document bindings for new SDM845
 devices
Message-ID: <20210125221812.GA1120729@robh.at.kernel.org>
References: <20210114203057.64541-1-caleb@connolly.tech>
 <20210114203057.64541-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114203057.64541-3-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 14 Jan 2021 20:32:06 +0000, Caleb Connolly wrote:
> Document compatible bindings for the new OnePlus 6/6T devices.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml        | 5 +++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
