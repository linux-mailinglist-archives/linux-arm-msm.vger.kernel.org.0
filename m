Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A2D3D3BC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 16:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbhGWNuh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 09:50:37 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:41828 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233665AbhGWNuh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 09:50:37 -0400
Received: by mail-io1-f46.google.com with SMTP id r6so2760470ioj.8;
        Fri, 23 Jul 2021 07:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=NCcIgxYk2Vttr+/GWq3ETgT01MgTyWJladRF/YKSKgE=;
        b=omq1YTcMadGVcmRusGPO7B9qiuZD110hkrcfnNgN+qOssMmYIbiLAT3aarRekpdCeo
         Alu1ESwPpYy/ky3Bcs27NwVWX7xU3Nwl0p4NhpWZJoZE13Ket7+TXJS+J2xCh0Cv8o9Z
         RTR+4gLC98o3NYSomYvyf68/8JkY3y30+ZrTgJ4OUyraUeD0lCUU5HFdmlm7EG0pxXgt
         +Fz/7R34A7KpGruSJecTgnl06s8z9+ev20gp6x9KoPebOSk8MrerSwXQXTBK7MJNgTa1
         7hujJWi+VvmuWUbPN2gLrY8bP9x2nTS4TcnoZTR3qLE+Sj+aYExAnz5TIXwQW2IGCsuz
         RlQw==
X-Gm-Message-State: AOAM530Qg2LVc9rbu3cH/jO1XGkFRXzRFAZLAg/tXDjM42Ew+wrCxWCm
        /seCPIUdDJtaUv/7xIO4b6a9uCqnXA==
X-Google-Smtp-Source: ABdhPJyro8jafGw1WcIhCSZ6bzKfFnYsROLksjos5spxpAsZb4yrc8UVZS1YcTFsQdppsjMPNB+EQg==
X-Received: by 2002:a02:c906:: with SMTP id t6mr4444638jao.117.1627050670595;
        Fri, 23 Jul 2021 07:31:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x16sm16094443ila.84.2021.07.23.07.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:31:08 -0700 (PDT)
Received: (nullmailer pid 1988198 invoked by uid 1000);
        Fri, 23 Jul 2021 14:31:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     linux-clk@vger.kernel.org, maz@kernel.org, sboyd@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tglx@linutronix.de, mturquette@baylibre.com, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
In-Reply-To: <40f4b835961e81283ee4b065804a86ddaf98cabb.1626986805.git.quic_vamslank@quicinc.com>
References: <cover.1626986805.git.quic_vamslank@quicinc.com> <40f4b835961e81283ee4b065804a86ddaf98cabb.1626986805.git.quic_vamslank@quicinc.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add SDX65 GCC clock bindings
Date:   Fri, 23 Jul 2021 08:31:05 -0600
Message-Id: <1627050665.694861.1988197.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 22 Jul 2021 14:09:38 -0700, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add device tree bindings for global clock controller on SDX65 SOCs.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  .../bindings/clock/qcom,gcc-sdx65.yaml        |  79 ++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdx65.h    | 122 ++++++++++++++++++
>  2 files changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 120, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 65, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 71, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml:  while scanning a block scalar
  in "<unicode string>", line 65, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 71, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1508862

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

