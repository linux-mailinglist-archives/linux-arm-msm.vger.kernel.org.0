Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2366B455D25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 14:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhKROBZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 09:01:25 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:33785 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbhKROBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 09:01:25 -0500
Received: by mail-ot1-f43.google.com with SMTP id h12-20020a056830034c00b0055c8458126fso11155662ote.0;
        Thu, 18 Nov 2021 05:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WmMfhkzPjWTKlEZ9yIh2W7NHeFSMUgJDMyPJqo/TBCY=;
        b=z+52wmb0eCrhn3TG40GOvPaE+QAUJSBSl6goVgKe/6bhu5pIWygvddA4jQcGNF5AcT
         eCmeEqVGwwDei8iWHzwQV2O96qRRYkBrdjfdI5CukidmaZg5D674rIvuor8JGyzviTKK
         fhAhOAr4fl/EqI+AK2Y534yngpg92NoO1WyCsgG3QGN7gqmvpR1kMirncVvkr22tEAMb
         ap5iAkXphCy+gRyhaFVHBJjRbNmne7xPHEc3nkocJ8j8sORirYz+HMVspRvJyIAtVv1P
         KyTaJYMdc/NJk5TFh1jJEa6OyL5uvYNELgtw03pvXQxOG4+D3PiegK5b3WoOe5NtAU3x
         6faA==
X-Gm-Message-State: AOAM531hbGolQ0ysBki/+cC4YXvQiBbUchc2NYukDA5S+7MU3DhPGZK5
        rBaTvF8kXWc45eAhDcLs+w==
X-Google-Smtp-Source: ABdhPJzWykudMzngz7+fYsbqh9ICTA5Q5lY0M4wTA9me0nH9FEPyMXguhDFWK2e4MNPzw3UyklnkQw==
X-Received: by 2002:a9d:7a42:: with SMTP id z2mr21463015otm.362.1637243903121;
        Thu, 18 Nov 2021 05:58:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q33sm522530ooh.16.2021.11.18.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:58:22 -0800 (PST)
Received: (nullmailer pid 998654 invoked by uid 1000);
        Thu, 18 Nov 2021 13:58:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, bjorn.andersson@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        plai@codeaurora.org, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, judyhsiao@chromium.org,
        bgoswami@codeaurora.org, perex@perex.cz
In-Reply-To: <1637239506-9387-2-git-send-email-srivasam@codeaurora.org>
References: <1637239506-9387-1-git-send-email-srivasam@codeaurora.org> <1637239506-9387-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v6 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
Date:   Thu, 18 Nov 2021 07:58:21 -0600
Message-Id: <1637243901.366064.998653.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 18 Nov 2021 18:15:05 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 171 +++++++++++++++++++++
>  1 file changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@0: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@1: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@2: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@3: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@5: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1556613

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

