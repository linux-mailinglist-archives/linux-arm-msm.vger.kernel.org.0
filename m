Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7051D13B540
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 23:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgANWVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 17:21:43 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37706 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgANWVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 17:21:43 -0500
Received: by mail-ot1-f67.google.com with SMTP id k14so14287160otn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 14:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WS8NlkYRgt1yxklwHlCzn8AYd/wck8523N3nH8IJHG4=;
        b=RDIcWwl2DmUXByZqMY00SIeFcfG+8D41c1LZDm19NZjDcXFRCfrdeGaO3ehWuMFHJE
         OCTgJnSrDPtPGDFM6LojF+1AYOjd8iXYN9+FFgScZcT2go+CoIHAb9n8eiz7LNrfHdrd
         BTOm0qfZzBX8GEWvVE+ZlvRA0HjmSsLjnugP24TJ4k9MOeZwJyoMt3ZK8SVV3MmPGfOa
         2WS5A7YWm+t62kzDHX1zZ/r5QzQf2YPcgltriD1RnQRTzJ3NWfkozuGZuaivzdmFrZO4
         URMjVFsJeW61Iqc+0eWwFpKBU9JXI8AILnF7mEAjhc0FgNSaMALvcVYMwwPlSLiuPxNM
         wibA==
X-Gm-Message-State: APjAAAVqB12bF4mfYTTRnMngKZLK5Uml+tIf+1e2hsw80QjzT23lUs38
        UgXRRzArq72+pq2UE1eWuxXmJPM=
X-Google-Smtp-Source: APXvYqzFdlTgoomKoawa2DpGgqzzMIBF2M4kJywgzzt7rAGlUVWenPk5l5ZbjAiMA6DpDm3H2PfIqw==
X-Received: by 2002:a9d:634e:: with SMTP id y14mr498553otk.162.1579040502394;
        Tue, 14 Jan 2020 14:21:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o20sm4989091oie.23.2020.01.14.14.21.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 14:21:41 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 16:21:40 -0600
Date:   Tue, 14 Jan 2020 16:21:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, maxime@cerno.tech, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH v8 05/15] dt-bindings: arm: Adds CoreSight CTI hardware
 definitions.
Message-ID: <20200114222140.GA20488@bogus>
References: <20200113213149.25599-1-mike.leach@linaro.org>
 <20200113213149.25599-6-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113213149.25599-6-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Jan 2020 21:31:39 +0000, Mike Leach wrote:
> Adds new coresight-cti.yaml file describing the bindings required to define
> CTI in the device trees.
> 
> Adds an include file to dt-bindings/arm to define constants describing
> common signal functionality used in CoreSight and generic usage.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../bindings/arm/coresight-cti.yaml           | 336 ++++++++++++++++++
>  .../devicetree/bindings/arm/coresight.txt     |   7 +
>  MAINTAINERS                                   |   2 +
>  include/dt-bindings/arm/coresight-cti-dt.h    |  37 ++
>  4 files changed, 382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
>  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
