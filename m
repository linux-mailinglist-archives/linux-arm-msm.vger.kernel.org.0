Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4D3E6F828B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 14:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjEEMFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 08:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbjEEMFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 08:05:44 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49AF9EF1
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 05:05:42 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-52c690f7fa4so1075005a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 05:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683288342; x=1685880342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NWXugzf9IwHfTkCjdGSHgOMZEK8Ay75ykttzhebpUiU=;
        b=MoZOxXq9olSI26ve+QVUvreFy9I9MRIXESMUrHNeIjgS5/+xdLE0FVbj59UlK0dXpo
         Q/e8zaee6rgmO4GHx5yoaRQGUspVlyNXRfRySTLh5DzY4a1E0UiK3Hv9jIJgi5T7e1Bk
         XR1H0/3hihiZr6fXhJIAYrynGI3y50rEivNnNauUJ9KPTPyuI518qRiUK/kIxhu+Pno9
         vZxWBgZrNry2ERbCaYItbfH3or7E7rhUqbjHlLmAASiQvxgjEVX06jciXovgtZVhJxwK
         pmVNl4dz4CSr8gdfh6Sm6ut98FjZ9xhwd9aoWakMgBjWfQq8MPA043RTcNTW/J6tBVrx
         R0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683288342; x=1685880342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWXugzf9IwHfTkCjdGSHgOMZEK8Ay75ykttzhebpUiU=;
        b=lPKkC80hzdDyXPmKIIJf5+W9X7VIfwN6hza9msYsJitjdpQ+rxrgNW/iXnBMgyGzbo
         WkH5fvNzfiwS/dAmA77f7r9MEIh6g0pKGYiTDTSWO4quSZZtZGcrAHUmnWEw3PldwFfb
         3/9I1b15UjsDleMEic38rmqkRUM2wiOwoT1KXlHB9MeAZyzgaPFKAsXZayp10FoqVV7T
         4IYCyxESmyBCFY44ZxzW1RrdllaKtixcrcgVLvRQN8phw6a9e+eP8W46jCzmjBDVcrXW
         Znz8SRkOg67Lnk1Tql6MhPE4md3kB47/RYY6wBtmykmxsE3LTTy6AG1QUKMwiP4z4jTe
         akgw==
X-Gm-Message-State: AC+VfDzCOJf+9SrKLocgq6Sr2Rhlx67MvxdaJ3YoC3hLnoQ70BWx5QDG
        vA43vx5op2/74CmggByahxIfiQ==
X-Google-Smtp-Source: ACHHUZ5krNkiPeRVhHxeYrz0et4F4wGWS5JLUD/rLBhKxSpjJ0ze4Kz+k3UrsgXBdBFupw0mQlVyAA==
X-Received: by 2002:a17:902:6901:b0:1a1:956e:5417 with SMTP id j1-20020a170902690100b001a1956e5417mr985308plk.22.1683288341941;
        Fri, 05 May 2023 05:05:41 -0700 (PDT)
Received: from leoy-yangtze.lan ([107.151.177.135])
        by smtp.gmail.com with ESMTPSA id v24-20020a17090331d800b001a245b49731sm1623301ple.128.2023.05.05.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 05:05:41 -0700 (PDT)
Date:   Fri, 5 May 2023 20:05:29 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Hao Zhang <quic_hazha@quicinc.com>,
        Mike Leach <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: Add Coresight Dummy Trace
Message-ID: <20230505120529.GB898031@leoy-yangtze.lan>
References: <20230505092422.32217-1-quic_hazha@quicinc.com>
 <20230505092422.32217-3-quic_hazha@quicinc.com>
 <958ae925-dee2-3273-0cd6-b5edc891ba70@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <958ae925-dee2-3273-0cd6-b5edc891ba70@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 05, 2023 at 11:54:03AM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> > +title: ARM Coresight Dummy component
> > +
> > +description: |
> > +  Coresight Dummy Trace Module is for the specific devices that kernel
> > +  don't have permission to access or configure, e.g., CoreSight TPDMs
> > +  on Qualcomm platforms. So there need driver to register dummy devices
> > +  as Coresight devices. It may also be used to define components that
> > +  may not have any programming interfaces (e.g, static links), so that
> > +  paths can be established in the driver. Provide Coresight API for
> > +  dummy device operations, such as enabling and disabling dummy devices.
> > +  Build the Coresight path for dummy sink or dummy source for debugging. > +
> > +  The primary use case of the coresight dummy is to build path in kernel
> > +  side for dummy sink and dummy source.
> > +
> > +maintainers:
> > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > +  - Tao Zhang <quic_taozha@quicinc.com>
> > +  - Hao Zhang <quic_hazha@quicinc.com>
> > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> Given this is a generic "CoreSight" component, I would prefer to have the
> CoreSight subsystem maintainers listed here (too). I don't mind
> the entries above, but would like to make sure that the subsystem
> people are aware of the changes happening here. Please use:
> 
> Mike Leach <mike.leach@linaro.org>
> Suzuki K Poulose <suzuki.poulose@arm.com>
> Leo Yan <leo.yan@linaro.org>

Given I am spending little time on CoreSight reviewing, I'd like to
use James Clark's email address to replace my own; I believe this
would benefit long term maintenance.

  James Clark <james.clark@arm.com>

Thanks!

> With the above:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - arm,coresight-dummy-sink
> > +          - arm,coresight-dummy-source
> > +
> > +  out-ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port:
> > +        description: Output connection from the source to Coresight
> > +          Trace bus.
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +
> > +  in-ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port:
> > +        description: Input connection from the Coresight Trace bus to
> > +          dummy sink, such as Embedded USB debugger(EUD).
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +
> > +required:
> > +  - compatible
> > +
> > +if:
> > +  # If the compatible contains the below value
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: arm,coresight-dummy-sink
> > +
> > +then:
> > +  required:
> > +    - in-ports
> > +
> > +else:
> > +  required:
> > +    - out-ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # Minimum dummy sink definition. Dummy sink connect to coresight replicator.
> > +  - |
> > +    sink {
> > +      compatible = "arm,coresight-dummy-sink";
> > +
> > +      in-ports {
> > +        port {
> > +          eud_in_replicator_swao: endpoint {
> > +            remote-endpoint = <&replicator_swao_out_eud>;
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +  # Minimum dummy source definition. Dummy source connect to coresight funnel.
> > +  - |
> > +    source {
> > +      compatible = "arm,coresight-dummy-source";
> > +
> > +      out-ports {
> > +        port {
> > +          dummy_riscv_out_funnel_swao: endpoint {
> > +            remote-endpoint = <&funnel_swao_in_dummy_riscv>;
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +...
> 
