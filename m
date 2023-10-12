Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7706A7C7335
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 18:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347307AbjJLQkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Oct 2023 12:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347311AbjJLQkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Oct 2023 12:40:15 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341B9C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 09:40:12 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so14682831fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697128810; x=1697733610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWO94gUYYbgFYpZi/S4rt4kc1CR6230PtdfFhraso7w=;
        b=jh0kjXqUamh6aVpbk1nt+KzL0+z3CaCBqotLZcHybrKkrXG4iPdzoaoeURp5ztoz0g
         cJZy7zkEAPdNAS09oJL7dYzGUGcOhvmHqW/wv/9r1t7gElxFUmxorf7hu5SAjCFjrr36
         KTSDN00n+YAT4t7Oe+Qlhzcm+HfOo/yFQQNbi7M1ak1Qe+K1YiYnJLYyDeOHUI80rgJ+
         vRa9T+6EzrqAQZnci6qgGAyHsIDQB5lM0KIuVCMgGnxPOpyX8YPt01BwKcZs66hgl7jt
         V/APUJ4mRbcpWkl4IYzVhovlc6cgXGonaVPGjcYnrW78jGGctGbdZqhTmsnPcUxQ3ify
         askQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128810; x=1697733610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWO94gUYYbgFYpZi/S4rt4kc1CR6230PtdfFhraso7w=;
        b=msqQa57QC3K2EpCy9AR3e1J9qeHSoWEonG3EuBFt7m45ANHLr86SH7qQcUrYjsnIAb
         KOe28hO4wisOHtK2LXuXhBARADscXiHCwtXxLY6YEttqxTc5g7Udhd8jy4OyOEC1t7JB
         +WVxjrfbcd4rLrGoT43vPKIeG5qmHu5sjo41Sxl+p5ahtFFcNjD7hQ89yJn2VC3viwtJ
         p7tU3n7N+zbWdW1KWhVIkdnr4T1zVbVvaQpb6MkQJOjhsTb7/JXp1s9szvRadNUl9GEO
         yxzDrKH4lwzk464Q7lY/7HaRWPf5uQB233xFypm7IH9O2imTpi5cxRrKyrnukW/tQTqV
         /sPg==
X-Gm-Message-State: AOJu0YwTX6IVcsglRUCHWLk1uec30CTjTlnmfuIWg+LqfB2PV+/lxe1A
        vu79Hl43FWwwdoW3bCtIqmU4vQ==
X-Google-Smtp-Source: AGHT+IEYH8hBoN/7cTp7puXpUYmr5Xg/tD8Pp3yR7oEc8+89bjqPg5QHPIIa55HkW5/PuUtCf0tgsQ==
X-Received: by 2002:a2e:7c15:0:b0:2b6:e2e4:7d9a with SMTP id x21-20020a2e7c15000000b002b6e2e47d9amr22634688ljc.38.1697128810439;
        Thu, 12 Oct 2023 09:40:10 -0700 (PDT)
Received: from [172.30.204.175] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p9-20020a2e7409000000b002bfe8537f37sm3633373ljc.33.2023.10.12.09.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 09:40:10 -0700 (PDT)
Message-ID: <467dd1cc-64af-43d7-93ca-be28043e2765@linaro.org>
Date:   Thu, 12 Oct 2023 18:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/10] arm64: dts: qcom: sc8280xp: Add multiport
 controller node for SC8280
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, ahalaney@redhat.com,
        quic_shazhuss@quicinc.com
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-9-quic_kriskura@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231007154806.605-9-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/7/23 17:48, Krishna Kurapati wrote:
> Add USB and DWC3 node for tertiary port of SC8280 along with multiport
> IRQ's and phy's. This will be used as a base for SA8295P and SA8295-Ride
> platforms.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
[...]

> +
> +			interconnects = <&aggre1_noc MASTER_USB3_MP 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_MP 0>;
Please use QCOM_ICC_TAG_ALWAYS from 
include/dt-bindings/interconnect/qcom,icc.h (like in sa8775p)

With that I think it's good to go :)

Konrad
