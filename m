Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D3B294F0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 16:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442932AbgJUOuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 10:50:14 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44141 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442723AbgJUOuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 10:50:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id e20so2031880otj.11;
        Wed, 21 Oct 2020 07:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9tCGPZiH3HLE3A3gO8/F0g9g2XRSo76kbzY4eWDduj0=;
        b=YuMzwUqmrLGqzjd9Dvb3vfDROXadpww5Ootri10IBtH0qyLTs/aNwbPCZs6Z9YO1A0
         sI9G8ThEA+AlL0aEaEx7VcezGGMXrJAonDkagveKqaR4mFdjjWmKD25h9ELVw77VrQhW
         Ht5rSRUZ/avtNuGUFJo45H/RSGeMqrXoJ8ZHw+nzBpXykP252rUL/udCVH8sk7JE7d4U
         zjbubD+AjjcO7N9RZkk7KaJqqSaVFND8bcfuZRXVYhn6nw7+3DM6VQ4KTVACJLmGSkww
         yf+BannCkdvBn3aR+0j49+G6iO53cV2Iri5fOzpNQrqWOXStcmBxb/dlq1tWe5ztmfW0
         NKDQ==
X-Gm-Message-State: AOAM53269EnzJyoBmreh0TU8dXKInkaWqH8FDVtF6PmOEcCx/mExe0NO
        xOXNwG0ArUu0yUnNlPWzxg==
X-Google-Smtp-Source: ABdhPJwPP/7VS4LkVVhF1zn5d+NogOiuJGyeSB0911Bb5jkgM9/rUjXorN1ZhKI0Pb1uCq8JmoasbA==
X-Received: by 2002:a9d:6498:: with SMTP id g24mr2990938otl.179.1603291812991;
        Wed, 21 Oct 2020 07:50:12 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c12sm640103ots.48.2020.10.21.07.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 07:50:12 -0700 (PDT)
Received: (nullmailer pid 2770583 invoked by uid 1000);
        Wed, 21 Oct 2020 14:50:11 -0000
Date:   Wed, 21 Oct 2020 09:50:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Joe Perches <joe@perches.com>,
        David Collins <collinsd@codeaurora.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH RESEND v1 2/3] dt-bindings: mfd: Add QCOM PM8008 MFD
 bindings
Message-ID: <20201021145011.GA2770045@bogus>
References: <cover.1603232320.git.gurus@codeaurora.org>
 <7a89811f36fe858756daa62f1162d18da7e79a73.1603232320.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a89811f36fe858756daa62f1162d18da7e79a73.1603232320.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 20 Oct 2020 15:33:42 -0700, Guru Das Srinagesh wrote:
> Add device tree bindings for the driver for Qualcomm Technology Inc.'s
> PM8008 MFD PMIC.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../bindings/mfd/qcom,pm8008-irqchip.yaml          | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

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
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 852, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.parser.ParserError: while parsing a block collection
  in "<unicode string>", line 77, column 3
did not find expected '-' indicator
  in "<unicode string>", line 101, column 4
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.example.dts'
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/bin/yamllint", line 11, in <module>
    load_entry_point('yamllint==1.20.0', 'console_scripts', 'yamllint')()
  File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 184, in run
    prob_level = show_problems(problems, file, args_format=args.format,
  File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 91, in show_problems
    for problem in problems:
  File "/usr/lib/python3/dist-packages/yamllint/linter.py", line 200, in _run
    for problem in get_cosmetic_problems(buffer, conf, filepath):
  File "/usr/lib/python3/dist-packages/yamllint/linter.py", line 137, in get_cosmetic_problems
    for problem in rule.check(rule_conf,
  File "/usr/lib/python3/dist-packages/yamllint/rules/indentation.py", line 570, in check
    for problem in _check(conf, token, prev, next, nextnext, context):
  File "/usr/lib/python3/dist-packages/yamllint/rules/indentation.py", line 336, in _check
    'wrong indentation: expected %d but found %d' %
TypeError: %d format: a number is required, not NoneType
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1385253

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

