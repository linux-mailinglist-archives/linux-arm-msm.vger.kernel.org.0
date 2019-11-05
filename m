Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99CADF0543
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 19:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390612AbfKESmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 13:42:15 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41974 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390485AbfKESmP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 13:42:15 -0500
Received: by mail-oi1-f194.google.com with SMTP id e9so14607079oif.8;
        Tue, 05 Nov 2019 10:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iJBXvdlpG9BhPNruKX39AR0akfvMBjiyYLN4NObqeeA=;
        b=s/KhZusKl3Q1EgkvHM44zbffFncnSR700yIMhpRxCtHBwpbh9sQxNc/LZZqtnIsIRO
         NU2Zy4wCOUXFliADai4OCqNX5uBsdvbOXj5swrX6foSDBtn2QdamFdwvhCbunKhZ79/M
         mOgaEiB/sf7bj5qJCrcQDvd68RPrROxHuqJlAkFmzMugGV1D6Xk6yXFb8Al+Me1rVfXH
         jU68B22KQCQLb5ONHmbtSck45MP3jUbQmmNpSqugXm69aVRhU1vILHXC0tHA0x2eNZ1N
         ldIz0c5tbkNJChGQc18kgoQZV3qSyOrgTHZJVR3+OLE4yF6KIltJkQT3c8oXEO9R3SXT
         KawA==
X-Gm-Message-State: APjAAAV5EtzUZhHh6nRKbDg6Cq67JzRztnKrD2jfc+2pWUYcF962QOC8
        g6HXd43CT/v/IURhWP3hxQ==
X-Google-Smtp-Source: APXvYqyvswQl1WFYxSY5AvP/Ru+pCT4LPGDpmwpqONjetjHzezRNCjSNOQaKI/yDjC67JfGUUEfHng==
X-Received: by 2002:a05:6808:2d0:: with SMTP id a16mr317070oid.149.1572979333259;
        Tue, 05 Nov 2019 10:42:13 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a9sm6429109otc.75.2019.11.05.10.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 10:42:12 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:42:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ccross@android.com, mark.rutland@arm.com, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, marijns95@gmail.com,
        kholk11@gmail.com
Subject: Re: [PATCH v2 1/5] dt-bindings: iio: spmi-vadc: Add definitions for
 USB DP/DM VADCs
Message-ID: <20191105184211.GA30975@bogus>
References: <20191031111645.34777-1-kholk11@gmail.com>
 <20191031111645.34777-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031111645.34777-2-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Oct 2019 12:16:41 +0100, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Some PMICs, like PMI8950, feature two ADCs, at 0x43 and 0x44,
> respectively used for USB D+ and USB D- (DP/DM): add the definition
> for them as VADC_USB_DP and VADC_USB_DM.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  include/dt-bindings/iio/qcom,spmi-vadc.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
