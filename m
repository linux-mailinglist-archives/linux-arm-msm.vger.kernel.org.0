Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB4326215E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 22:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbgIHUty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 16:49:54 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43100 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgIHUtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 16:49:53 -0400
Received: by mail-io1-f67.google.com with SMTP id z25so807827iol.10;
        Tue, 08 Sep 2020 13:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l6Ml6GUsFvFs2hmUbBhScVBvUaAujChY5id6z4NCBL4=;
        b=sASPHLuGB9PHconzuB6LRRphRNUTCeg20ViM7IUJ8rUcocTCZzDbNFnpbXfAM+yxLK
         Gb7nF1PYQu+bOlTNkTneEWRQLd2cg/y3eiPTaO1r5jj4hZDC/+9oClbhzvB8bQpSei8H
         UEAhK1HFKQyMBtGO+8kxJY2zhd1XvSANM1owW88Qz+PYn3h5jcCCmz1K/j1wHII2anDD
         3ROp5A2JwMT+QlL9LrrtEfBxqpZoCoL6b5aPMyaiXH7WpPjQAWTFBqI79QVrMe60dPT2
         1pO2tFr86N0sRU++xIbx5jry7us/AUTZOHulcANs85qzrr3BuCmxJGeK6M361k0pCbaN
         XK/g==
X-Gm-Message-State: AOAM530pJy0Q/J2A0sWgqXAtN38lcahq0EuOXCVIOdi/6NETKSsdpXrH
        EjRXeXgz8Lh3D2Sj/JkgjA==
X-Google-Smtp-Source: ABdhPJyul47wGDEorl9zgNUus3MDtK7opu0OS0zlBS8occCySSRUeRKc5hrknvTvzMWAL0NLClcy2Q==
X-Received: by 2002:a02:ccdb:: with SMTP id k27mr768174jaq.103.1599598192571;
        Tue, 08 Sep 2020 13:49:52 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i10sm209529ioi.39.2020.09.08.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:49:52 -0700 (PDT)
Received: (nullmailer pid 894747 invoked by uid 1000);
        Tue, 08 Sep 2020 20:49:50 -0000
Date:   Tue, 8 Sep 2020 14:49:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20200908204950.GA893759@bogus>
References: <1598006677-7953-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1598006677-7953-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598006677-7953-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 21, 2020 at 06:44:36PM +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../devicetree/bindings/spmi/spmi-mtk-pmif.txt     | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.txt

Bindings are in DT schema format now. Please convert this.

Rob
