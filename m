Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033CE41F563
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 21:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhJATFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 15:05:25 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:33744 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhJATFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 15:05:24 -0400
Received: by mail-oi1-f175.google.com with SMTP id 24so12691406oix.0;
        Fri, 01 Oct 2021 12:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=AaCeKJcib3FJiV3HX2sgMBrTcdReAxBxq1SITEI+C/0=;
        b=PDd/173tMlEb0Qtk3MqOBdqCeRo0Sr8QGAPK7Emc7/0lMZIcsukw48YsgqEwmHebCm
         jix6zg6FbIFz1qGfsLRDEsTAm/fd+BURPdOAvb7kV1Fmopdrua/xc6dQhDESdUb3ka/C
         rd/48YaPynLdSrD6BckP1FP8lUvYFlQCmPlZpHgk1ZYK0b0HTAvvG64MIT7Abn6mJEUJ
         yrkBVvkin5AqgMNDE+SMIhPJAtqwdxIeLJS8TmYuUsponhZb2loJN9foCtYePPKjb8AS
         7NwPZJhPf9gzWn02seu6B22uVV05ANCQ9XJ8opjcz7fkiKsQZNp/Wohy3H9PNoj9uyQF
         xVYg==
X-Gm-Message-State: AOAM531PG2uyDUimHLK1tjFyG55Lb9khIpaH8nybQ0ysLwDHy/bL1k1N
        CNIBtlvBZyuhe6d1IjH0dw==
X-Google-Smtp-Source: ABdhPJzXM+LsFeHXSBeISyHVxuZDXoVUYnnKfozOL/f9TaZwO8L5uAzXQWnqiUUWxIbNabeOU0oUhg==
X-Received: by 2002:aca:2319:: with SMTP id e25mr5080076oie.175.1633115019612;
        Fri, 01 Oct 2021 12:03:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l1sm396946oop.28.2021.10.01.12.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 12:03:39 -0700 (PDT)
Received: (nullmailer pid 4113071 invoked by uid 1000);
        Fri, 01 Oct 2021 19:03:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     bgoswami@codeaurora.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        broonie@kernel.org, srinivas.kandagatla@linaro.org,
        plai@codeaurora.org, devicetree@vger.kernel.org, tiwai@suse.com,
        lgirdwood@gmail.com, swboyd@chromium.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        judyhsiao@chromium.org, agross@kernel.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, perex@perex.cz, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
In-Reply-To: <1633087292-1378-7-git-send-email-srivasam@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org> <1633087292-1378-7-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH 6/8] ASoC: dt-bindings: Add SC7280 sound card bindings
Date:   Fri, 01 Oct 2021 14:03:37 -0500
Message-Id: <1633115017.918117.4113070.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 01 Oct 2021 16:51:30 +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for lpass sc7280 based soundcards which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>  1 file changed, 61 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml: allOf:3:then:properties:interrupt-names:anyOf:2:items: 'anyOf' conditional failed, one must be fixed:
	[{'const': 'lpass-irq-lpaif'}, 'lpass-irq-vaif', 'lpass-irq-rxtxif', 'lpass-irq-hdmi'] is not of type 'object', 'boolean'
	'lpass-irq-vaif' is not of type 'object', 'boolean'
	'lpass-irq-rxtxif' is not of type 'object', 'boolean'
	'lpass-irq-hdmi' is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml: ignoring, error in schema: allOf: 3: then: properties: interrupt-names: anyOf: 2: items
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml:0:0: /example-0/soc/lpass@62d80000: failed to match any schema with compatible: ['qcom,sc7180-lpass-cpu']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1535291

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

