Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B9A131B0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 23:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgAFWH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 17:07:28 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38868 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgAFWH1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 17:07:27 -0500
Received: by mail-oi1-f196.google.com with SMTP id l9so14263192oii.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 14:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mX8Apg3ZN6eJo68XMUgHBKoUIUkBElk8pz2rAOhoL5k=;
        b=J8Bjty16fhD0Uf2fWVExHa7y5NBrlKVuP01xIftzIiTx8H+s2RJqm63YDhVvrhze0Z
         L8tFY4M7hOSHLR4Ls2uCrxBuhAldpuciL41naTG7+ZrjdQjncMtgKPIpXPDsab2bx2au
         FFY4TomVAYN+GdQu9y+iV3nBYf61L9TwAIAPBTEaKaJKep+LoboPWuIQ9D3C43pja24+
         gP5mWSC6ASw97A5d0wNdBcaBuhqGIKF0c0rFdg+yCSKo4Xsf2z6Yv5Cz4G0HRrrom0ee
         h31NYX5st/pawYl88G9jdwS5WIR23NxOqo8LuQYO6u6MNz1MOOvIazvXJ4CaezdEsScl
         lzsg==
X-Gm-Message-State: APjAAAUslDvrqXls1muCvaISzthCkNJGrCJXjtre5dj8rqj7tDGJ/0vd
        AECvPMZ/n0nWFptjRurbCXXOHoc=
X-Google-Smtp-Source: APXvYqxNy8PzpqI3IjILLlJcbSaIuHUykswCwE3LQL3cCtR11IAuA5pKcmTTDZBftzL0tBOOUJUozg==
X-Received: by 2002:aca:ad11:: with SMTP id w17mr6732704oie.85.1578348446535;
        Mon, 06 Jan 2020 14:07:26 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id i6sm19107531oie.12.2020.01.06.14.07.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:07:26 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2207cd
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:07:25 -0600
Date:   Mon, 6 Jan 2020 16:07:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 09/12] dt-bindings: media: venus: Add sdm845v2 DT
 schema
Message-ID: <20200106220724.GA15963@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-10-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-10-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  6 Jan 2020 17:49:26 +0200, Stanimir Varbanov wrote:
> Add new qcom,sdm845-venus-v2 DT binding schema.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,sdm845-venus-v2.yaml  | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
