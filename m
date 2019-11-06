Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78464F0D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 04:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730623AbfKFD5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 22:57:25 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44194 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfKFD5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 22:57:25 -0500
Received: by mail-ot1-f68.google.com with SMTP id c19so3557396otr.11;
        Tue, 05 Nov 2019 19:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=py0k6EUYYeSmHaWf8b61DJPhzhB9zPo4JBbzAH5bbDA=;
        b=pZ7HPLBHSSugSXNvvGOUPwA10eC+wvu8JIZkRy903gyQ4ds4po/8xSKmrKaTL9lh19
         DAX6LZcQLrBEdCF66L+fmWpTwu6zLJ5vd0SjKNifp7+GvHqiFU3cL0kwkYHQMlzviQ92
         m/0OT2rCYRkC4naAVl9Auapf6MOIjPyY/VD8qn2/pl/2qu3epZUwzc6Dde2rPs1qNEsq
         wueT3qZpuvrNtsw/QK5t+v0aI0lyIbezLLNkxKZhn5fos25oio73r9c3ffAzl2wmrx+K
         3YTV0cP94ETQIlFmSYZkmA5fGe3+O5g40NY5LTCP8XMoDbFcGxO0fKivpjCCeECUza3J
         YvpA==
X-Gm-Message-State: APjAAAU0QnLO4TjdGUZc/E8qDzT2CzRdpeL32a3vnwZyl99xjbZ+fMkx
        OEGodj0LGTYFT+pkCUsMiQ==
X-Google-Smtp-Source: APXvYqxhoUkUh4/ocp0Q+Ei5bNgYCZy9+LoviHrciti8k+fdcmqucLXu88Zxso3APp73Fi7zfaWQ7g==
X-Received: by 2002:a05:6830:2335:: with SMTP id q21mr200742otg.237.1573012642730;
        Tue, 05 Nov 2019 19:57:22 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r129sm2284230oih.49.2019.11.05.19.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:57:21 -0800 (PST)
Date:   Tue, 5 Nov 2019 21:57:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: clock: rpmcc: Document msm8976
 compatible
Message-ID: <20191106035721.GA32273@bogus>
References: <20191031112951.35850-1-kholk11@gmail.com>
 <20191031112951.35850-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031112951.35850-3-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Oct 2019 12:29:51 +0100, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Support for MSM8976 was added to the clk-smd-rpm driver: let's
> document here the newly added compatible string.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
