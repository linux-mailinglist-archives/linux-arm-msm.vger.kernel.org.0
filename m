Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52F82DD8B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 19:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730138AbgLQSvW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 13:51:22 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:33037 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgLQSvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 13:51:22 -0500
Received: by mail-ot1-f41.google.com with SMTP id b24so10874799otj.0;
        Thu, 17 Dec 2020 10:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=qlJFlB7HjjvTFCWg7/nxoqqPepj3Ubcj38fpiOs2Dd4=;
        b=EsbUEFXnkDF0IDiSCZCKTtoB22AurbPUVo2hDkXC7Mr0nmmRA4YQa3KpjLWOuMC+dq
         YvgW2U1CKUSgvYu218e5sDX0puMFA3W7ZZhA933ljhvIu0Fn7/ehBpnVPaXmVR28x9Q7
         8ISVJeeZeP5njHZxXqqsztT3LyTic7Yo6TErEd6TVh675qnxM0CO2hf2cUIKgA7glxGO
         2rPsWTOZQ/udh82It+bIszKwCTVGTtjx9kKjvB7wzi3GkG0S7KieROaLG8mp1eMOZ75D
         +FWQ6O/qBGM6GCMsUDV7S0C6KSwFg7kRSDN8WRjelJqvu5xOsOH0mdE6nOS0zWirXa5o
         jJ/A==
X-Gm-Message-State: AOAM533f//SCcz6j5qRnW4Y/o6FGvfYnZm+PNWevrKX8Gv/OsLXwrt6f
        yBMO/Pcdu6YvWtqGZOmniQ==
X-Google-Smtp-Source: ABdhPJyBB3fAMa2TcDvusNcGTtyzOV+RpbnHLor10hqoZxQ/TC8vmfDN9oKSTYKoxW8AwCDlXAZ6TA==
X-Received: by 2002:a9d:37c4:: with SMTP id x62mr214831otb.87.1608231041130;
        Thu, 17 Dec 2020 10:50:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s139sm1247838oih.10.2020.12.17.10.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:50:40 -0800 (PST)
Received: (nullmailer pid 50651 invoked by uid 1000);
        Thu, 17 Dec 2020 18:50:36 -0000
From:   Rob Herring <robh@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <1608205123-23119-2-git-send-email-kgunda@codeaurora.org>
References: <1608205123-23119-1-git-send-email-kgunda@codeaurora.org> <1608205123-23119-2-git-send-email-kgunda@codeaurora.org>
Subject: Re: [PATCH V3 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml format
Date:   Thu, 17 Dec 2020 12:50:36 -0600
Message-Id: <1608231036.368473.50650.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 17 Dec 2020 17:08:42 +0530, Kiran Gunda wrote:
> Convert the bindings from .txt to .yaml format.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 -------------
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 127 +++++++++++++++++++++
>  2 files changed, 127 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml:39:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 850, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 731, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 39, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1364: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1417646

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

