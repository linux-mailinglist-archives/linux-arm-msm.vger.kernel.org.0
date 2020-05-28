Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6BA1E6C7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 22:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407106AbgE1U2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 16:28:40 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:44664 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407026AbgE1U2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 16:28:38 -0400
Received: by mail-il1-f196.google.com with SMTP id j3so212921ilk.11;
        Thu, 28 May 2020 13:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tlbZ6Mr9e5Ay55YAAkLD4ho81QLBhLTS/l66ro00bxg=;
        b=BLR1Ezm+R2JuJet16gNZabgkN0qpG+viYI+QrF+LPmf/l5pVNZmsIRh7MGYKPC21gd
         4B4GqclljbK7VSK1hR2AKWEBwOkNCh63kY/Gy3OqUsbxfAuap348L3noR8tGmKJOy5Ii
         2p7tRi2M4XM6pn4VMBTPzhNdvkbe6CS877swO2SGRDuNBFoaP7JQHTY1ek9r16K39pvq
         ooDb7PfDvpgMKYD2tAM/cUSVqtQey42yCYnWA4dQeXr/hDFJkCRKm9jEKrcst2RDQiok
         D61lKGrgOmVgoFGudgt9P+9RlMAQkJyhpPruWZWk9Q8ghhtmSl2E/S8xQjENKrW8AsRQ
         XhEg==
X-Gm-Message-State: AOAM531ZjKExgD655XWAmzs0g91B2mokev0iKf/sq7/8qbFWKEuBHOZj
        XTDrJyuHODSnpvdW4WSZiBumWAo=
X-Google-Smtp-Source: ABdhPJyIrUUeCDXweziG8G0La28ky8xA33nLZOXZqRvWjgUI1JNY4RRki5w34no1B/2hanqz4tn0rg==
X-Received: by 2002:a92:4015:: with SMTP id n21mr4586732ila.137.1590697716290;
        Thu, 28 May 2020 13:28:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f9sm3123464iow.47.2020.05.28.13.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 13:28:35 -0700 (PDT)
Received: (nullmailer pid 623579 invoked by uid 1000);
        Thu, 28 May 2020 20:28:33 -0000
Date:   Thu, 28 May 2020 14:28:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eli Riggs <eli@rje.li>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add sm6125 SoC and
 xiaomi,willow
Message-ID: <20200528202833.GA623550@bogus>
References: <20200517115410.3374-1-eli@rje.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517115410.3374-1-eli@rje.li>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 17 May 2020 04:54:06 -0700, Eli Riggs wrote:
> Add compatibles for SM6125 aka SDM665 aka Snapdragon 665, as well
> as xiaomi,willow aka Xiaomi Redmi Note 8T, the international
> edition of the Note 8.
> 
> Signed-off-by: Eli Riggs <eli@rje.li>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
