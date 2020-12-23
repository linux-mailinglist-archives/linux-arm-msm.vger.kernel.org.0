Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EB82E202B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 18:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgLWRsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Dec 2020 12:48:45 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:34836 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgLWRso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Dec 2020 12:48:44 -0500
Received: by mail-ot1-f53.google.com with SMTP id i6so15741345otr.2;
        Wed, 23 Dec 2020 09:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=K5Yix/37ki3dCZFopkSSkjKG5evvMj86JkeiVkAJ78g=;
        b=QuOpbnlLbsSmLmldLs32r/uNlUxqfAuC1Mg1NbCKLy8UCSlGNU/rSnU/Jv+/7I99iI
         9ORidiHPcb64fBA4Vgl1U3vo9rhV/gc6FA8DLcGLutO7KnQqz1qqjLi8fBo5KzVWgCkB
         +7G+uZmaonqsEeecKhUMXz6NxeGUebf3WTfrrJGuOdeAEg5iHvK6LSY38UKkaUUOZ0D6
         tIA5VcEIS96OXIdVl/KK1fQoxuqyqGV0/9cyWlfW/SX8KjuDDjHeZukXfUeVrf1XdDQF
         1kTqPBaY7hyWt/fUc3dFuAiLVTPaUvOHZF1UQTIFTF0bmZlVlzr4KWwN8GNQewF3lpqr
         BjoQ==
X-Gm-Message-State: AOAM5334vGT2yCkl4lDsBwSlNYIvFsLWJtfLb5vJt4ilcNZpZOAFRy2l
        hrQSDW9rbs6bA/T5hJXjBg==
X-Google-Smtp-Source: ABdhPJwwkIwBeMc0P36eD46ujc2g7Yxv3OUhQoIQbvvQcZl95unXLd2lLce2YlPC5c6HviQS6uif0g==
X-Received: by 2002:a9d:640b:: with SMTP id h11mr8626511otl.224.1608745683770;
        Wed, 23 Dec 2020 09:48:03 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j10sm5938165otn.63.2020.12.23.09.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 09:48:03 -0800 (PST)
Received: (nullmailer pid 762424 invoked by uid 1000);
        Wed, 23 Dec 2020 17:47:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Stephen Boyd <sboyd@kernel.org>, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: spmi: modify the constraint 'maxItems' to 'minItems'
Date:   Wed, 23 Dec 2020 10:47:58 -0700
Message-Id: <1608745678.788845.762423.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 23 Dec 2020 10:44:26 +0800, Hsin-Hsiung Wang wrote:
> The constraint of 'maxItem: 1' might be larger than 1, so we modify it
> to 'minItem: 0'.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spmi/spmi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml: properties:reg: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
		'minItems' is not one of ['maxItems']
		'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'default', '$ref']
	0 is less than the minimum of 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml: ignoring, error in schema: properties: reg
warning: no schema found in file: ./Documentation/devicetree/bindings/spmi/spmi.yaml

See https://patchwork.ozlabs.org/patch/1419575

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

