Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95DF440EC5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Oct 2021 15:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhJaOSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Oct 2021 10:18:39 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:39653 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhJaOSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Oct 2021 10:18:38 -0400
Received: by mail-oi1-f181.google.com with SMTP id n11so13027432oig.6;
        Sun, 31 Oct 2021 07:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=7+WutpRKSgAxKB6SSYx+7xcYxePUoAkpe1h+WmxLKBc=;
        b=wdQviT/atZG3BFpDOFb1qv2FWbiZvQUdVLwOfiBDWeq8e5sC0ANssGmqtzNL9AhNIm
         f660BXZvIPmUPyLaROWgpJ4tW4sYPnlxIxWtHW/HxiZZaf04W3Q97fMpC48O46byVcVU
         jWR1qAAbiO40fJuuDyySBXPkDi/EHeiYwngIt7TwU7T7PPqoTq+6ZmGlWF+mjNIR2AZR
         PltzxOLfIVujafllZOGjZDdB7iD+e4V6Vn1YMHdZLmhr84G+AwfIz+lu5aEggYTdL2Zj
         xPu1+ImxXcD4KcxdOKboAus2p7ixXitugwDNIWeOEG2WxsQXlLhzKC5Xh5+q235x3wYF
         RKkQ==
X-Gm-Message-State: AOAM5301ZYwVElCtuGTCpz27jbXFqLLFoYQN7o2YFm37DGhI2U/PXMvv
        rA3x8YVifxct6XPIPlt1AA7rCHqlxg==
X-Google-Smtp-Source: ABdhPJylsheODMLLBuJtDPN5aZrTLHRyUgBP9GYP4P7rvuelDad3zoPXMkuAir42tdLFrJ8H+XmcQQ==
X-Received: by 2002:a05:6808:8d3:: with SMTP id k19mr20870159oij.163.1635689766457;
        Sun, 31 Oct 2021 07:16:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f14sm3123106otf.33.2021.10.31.07.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 07:16:05 -0700 (PDT)
Received: (nullmailer pid 2444176 invoked by uid 1000);
        Sun, 31 Oct 2021 14:16:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, tglx@linutronix.de,
        manivannan.sadhasivam@linaro.org, maz@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org
In-Reply-To: <1635552042-16250-2-git-send-email-quic_vamslank@quicinc.com>
References: <1635552042-16250-1-git-send-email-quic_vamslank@quicinc.com> <1635552042-16250-2-git-send-email-quic_vamslank@quicinc.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Add SDX65 GCC clock bindings
Date:   Sun, 31 Oct 2021 09:16:02 -0500
Message-Id: <1635689762.736828.2444175.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Oct 2021 17:00:37 -0700, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add device tree bindings for global clock controller on SDX65 SOCs.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |  78 +++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdx65.h         | 122 +++++++++++++++++++++
>  2 files changed, 200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml:71:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

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
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1548429

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

