Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D9A4215A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 19:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbhJDR52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 13:57:28 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:33438 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbhJDR52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 13:57:28 -0400
Received: by mail-ot1-f48.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so22720693otu.0;
        Mon, 04 Oct 2021 10:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qbZN6rMSWR0gbKjL6x8M6wey/LpUEac+LmLt3k0AccY=;
        b=4GpAM4wKmzzJkymVL82BoKUMzxUHSwpQJ9rkm6I3V3PdtxHBgHuxP9a8Dmob64PfYO
         cURZJUFxJngS5fAQ5dDHPsoOtll/3VsLSEUzkSSBA78zx9s72rPjkNmSy5wNdiiFmvu+
         cEiAn9YbjhYTzqPBYVOA9QBbfsmTiGHaMBFPGiDS6Qq7drhtY2c0TbKQuzFUiqLVf33d
         7B6ZM5QaVPlw6XzoAj0SKk7z48QHHFu/5emxWc2mbecQWC2Bc5wkLA/WcY0/mBjfJ9QM
         sYOk83kytiky6e8xbFjHv5mtvp8DYzwe+GumcM4N2s/3PsloN0egTxBJKCsKol7d7OcE
         GFCg==
X-Gm-Message-State: AOAM533PqWBFpFZsCOUzGXbTHtvxb0zCUxzXLNNyhwHz54lwOYOx7Ybu
        W1DyCayZq+bZoxCOc+jKTQ==
X-Google-Smtp-Source: ABdhPJzE8ansEYAF7nfdPkNvh9Xlpfn9aiNclDdmzorIs3IpHlu8p25hfzxxPbmIHxHpA+9LIrdmYQ==
X-Received: by 2002:a9d:4618:: with SMTP id y24mr10505775ote.326.1633370138696;
        Mon, 04 Oct 2021 10:55:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w21sm2840108oif.13.2021.10.04.10.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 10:55:38 -0700 (PDT)
Received: (nullmailer pid 1559992 invoked by uid 1000);
        Mon, 04 Oct 2021 17:55:37 -0000
Date:   Mon, 4 Oct 2021 12:55:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: add bindings for the Sharp
 LS060T1SX01 panel
Message-ID: <YVtAGXwLr8FepT+I@robh.at.kernel.org>
References: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
 <20210926001005.3442668-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926001005.3442668-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Sep 2021 03:10:04 +0300, Dmitry Baryshkov wrote:
> Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
> using NT35695 driver. This panel can be found i.e. in the Dragonboard
> Display Adapter bundle.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/panel/sharp,ls060t1sx01.yaml      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
