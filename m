Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7E32A0684
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 14:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgJ3NeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 09:34:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46773 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3NeA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 09:34:00 -0400
Received: by mail-ot1-f66.google.com with SMTP id j21so5501649ota.13;
        Fri, 30 Oct 2020 06:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rKj/rXvXD7snBbX0mySN8IBmNVtb3K7eqriwov03zlo=;
        b=mKTyxD0I49s+D/w7uF8i0u/wU7mVfIzorQNkOfUu5hpRDt47ZwscfQXmWjKWly8Sv8
         Q+LCp3in4Ew/BNBh0yN6njJyzx36XgasT3WzPmBAgZgphBw7j9iBG0iFyv6muwg4yLC8
         Ni40NRfD5NMR8vZ6ydOfhaZZGBVHV/Pd/EIUuLM0jgqC/90K7fvqlpZsBhsdEN3CYro0
         TrP84GhopMh7nM4MUVVIfOHkAgLOls2LsBuLxS7RJ/78rlajllx7dnwbaee2rJATflJY
         f6/E6QMEn3qTUiwtAZZzCwZxfXxCoETbK4USpjW/uuXwbenjTt3jT087P3PJH1leoQP9
         mcRg==
X-Gm-Message-State: AOAM532wEph8Gf+OgXsBVdmhIapQ1DxDNhf+vqkDbgaaSka9NlcOsKSm
        +BAPkvZ6ZStgaHXYAd6w9Q==
X-Google-Smtp-Source: ABdhPJyaYfCiPzTPqScVm//3Q+3WkTytFk0MtqWTCBzDRsZepma/DjK8TXWnnesWJz2ljK2udw985g==
X-Received: by 2002:a9d:6c9a:: with SMTP id c26mr1778080otr.78.1604064837862;
        Fri, 30 Oct 2020 06:33:57 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p126sm1348243oia.24.2020.10.30.06.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 06:33:57 -0700 (PDT)
Received: (nullmailer pid 3721586 invoked by uid 1000);
        Fri, 30 Oct 2020 13:33:56 -0000
Date:   Fri, 30 Oct 2020 08:33:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] bindings: pm8941-misc: Convert bindings to YAML
Message-ID: <20201030133356.GA3721479@bogus>
References: <cover.1603869292.git.gurus@codeaurora.org>
 <f4e47c587fdcf8542d355a379b5fb41af8f7957b.1603869292.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e47c587fdcf8542d355a379b5fb41af8f7957b.1603869292.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 28 Oct 2020 00:18:52 -0700, Guru Das Srinagesh wrote:
> Convert bindings from txt to YAML.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../bindings/extcon/qcom,pm8941-misc.txt           | 41 ---------------
>  .../bindings/extcon/qcom,pm8941-misc.yaml          | 59 ++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
>  create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
