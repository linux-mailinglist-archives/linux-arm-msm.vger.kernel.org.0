Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C713380A1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 15:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbhENNIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 09:08:12 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:36701 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhENNIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 09:08:12 -0400
Received: by mail-oi1-f181.google.com with SMTP id f184so8171694oig.3;
        Fri, 14 May 2021 06:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=xsr+bWKwuW4tk5N9DGDtkhdre8uPMY0bSblwLz/bg7A=;
        b=diRd6of1VnkOd2gXE+rO2lt0RXHmFgsvUHP0fFd7VXP6/5BAQuJh28ZJn6VYBlsVgo
         GdH/1ClhAUrulW7QQjthPEWrHikrthdH3CnGztvoQ1HqQ9NNXmgmedr1ct5BvITUwErx
         WWWxb2Uo25lHCOiEs8sUdOxeS6GiKZN7cN7tt2n+kytVTisO0T6NuSNVIBXpQU/Msxfa
         16veCczM0kD7SBFPRY7vt6ddTKLkXmj4rLbsj/bxvFnUa07De+L+I64V5GHAPysb/M2/
         dIYbgOnR4WyRyAflkhI+DuESda6oMKIu335Imp7KxTBFaM6Sj5ITcMgDIbQRXiX4ultK
         gt4w==
X-Gm-Message-State: AOAM531KegglMWgX4z1KGcNjSlnZu3ehuBcuJ67boR108K/Amp8wkt9M
        mvGTBg/60SVLtv4Az83Rneyp3f5Bvg==
X-Google-Smtp-Source: ABdhPJyTLkIGalK7Hhz9McZmfImPTNomf+7yyVG+dUjpHbgMR3nw3fADc9HjeU0kaxCmXkvYKiEiyQ==
X-Received: by 2002:aca:bdc6:: with SMTP id n189mr6747381oif.156.1620997619918;
        Fri, 14 May 2021 06:06:59 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e7sm1299368oos.15.2021.05.14.06.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 06:06:58 -0700 (PDT)
Received: (nullmailer pid 3936689 invoked by uid 1000);
        Fri, 14 May 2021 13:06:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        devicetree@vger.kernel.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210513175258.5842-3-jonathan@marek.ca>
References: <20210513175258.5842-1-jonathan@marek.ca> <20210513175258.5842-3-jonathan@marek.ca>
Subject: Re: [PATCH 2/3] dt-bindings: clock: add QCOM SM8250 camera clock bindings
Date:   Fri, 14 May 2021 08:06:56 -0500
Message-Id: <1620997616.581063.3936688.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 May 2021 13:52:54 -0400, Jonathan Marek wrote:
> Add device tree bindings for camera clock controller for
> Qualcomm Technology Inc's SM8250 SoC.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,camcc-sm8250.yaml     |  73 +++++++++
>  include/dt-bindings/clock/qcom,camcc-sm8250.h | 138 ++++++++++++++++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8250.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml:22:1: [error] duplication of key "properties" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 421, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 121, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 714, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 435, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 253, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 284, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 4, column 1
found duplicate key "properties" with value "{}" (original value: "{}")
  in "<unicode string>", line 22, column 1

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 625, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 421, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 121, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 714, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 435, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 253, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 284, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 4, column 1
found duplicate key "properties" with value "{}" (original value: "{}")
  in "<unicode string>", line 22, column 1

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** Deleting file 'Documentation/devicetree/bindings/processed-schema-examples.json'
Traceback (most recent call last):
  File "/usr/local/bin/dt-mk-schema", line 38, in <module>
    schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 587, in process_schemas
    sch = process_schema(os.path.abspath(filename))
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 561, in process_schema
    schema = load_schema(filename)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 126, in load_schema
    return do_load(os.path.join(schema_basedir, schema))
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 112, in do_load
    return yaml.load(tmp)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 421, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 121, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 714, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 435, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 253, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 284, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 4, column 1
found duplicate key "properties" with value "{}" (original value: "{}")
  in "<unicode string>", line 22, column 1

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** [Documentation/devicetree/bindings/Makefile:62: Documentation/devicetree/bindings/processed-schema-examples.json] Error 1
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1478165

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

