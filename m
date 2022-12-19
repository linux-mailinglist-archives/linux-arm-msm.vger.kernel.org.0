Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE19D6512A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 20:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbiLSTS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 14:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbiLSTSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 14:18:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2507512D04
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671477438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lw/Fj1Iw2Xi8gGiXlXcO2+qBIKUYLL1c1CqizXCd5bE=;
        b=Hmpzuv5/QeSE6nPAJeG/nRQQerChfCcoE9h44NqUGej+jM8Jpb64JUh7Qr7l6xP4ClGM0o
        SXQmLVCbHfM69usqpWVTIFW/jRhvBp5hL0ov8206VcPZnzjlibTYOI3W3ObDnrr9eRhDPO
        Xory/bUfSKI9KCsKM44Sv/cj0ixU9B0=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-_xjqaUqlMUiJQRuEUybKKg-1; Mon, 19 Dec 2022 14:17:16 -0500
X-MC-Unique: _xjqaUqlMUiJQRuEUybKKg-1
Received: by mail-ua1-f69.google.com with SMTP id y10-20020ab0560a000000b003af33bfa8c4so4152553uaa.21
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw/Fj1Iw2Xi8gGiXlXcO2+qBIKUYLL1c1CqizXCd5bE=;
        b=ky0xNvzgpKLJ7jaGIAGqZ5ArxkUJxPue8PRbPz/6JNoARkNTFhVKdiUMmaOQFkGA6o
         VgoAiFfPVreVuvAY9kb/f32mte2qvYUz5lkrbVa9Mxwfj/H0GHIppzu1F5S8Mtlb1/eO
         ebGs9WOiNRTqIQ8p6exwM/3E2kNfiO32zqi5iIzbxNwzseYdjmGtmjkZSrwh0cngy3sV
         T+uHOlFoP7hca4xX67RZVqnKE0Lt5nYRuulqeN9rCAudE0oj7lo3C5XO+87Z9W1IjXOd
         Z7tZY4rKsC4Ljxdw6AHELi6sON/OtnSlpXu8g59F4JcAeamLI1FFoMqrumgLeZog4uqx
         cLtg==
X-Gm-Message-State: ANoB5pkr0gb9xYk3GlAGr7Gp4YxK2KaJ7N1ts830BQ1m6OFaqOUaQFPu
        APkaVP40yPIbqA/7JQLYAYArmqevzpSVPOufb2xPW+CHc5ergaC8FLXzGDlKDnC+nw23jeCu5gY
        4T0j6fLTZqEB+1RMKVsfhvJlSag==
X-Received: by 2002:a05:6102:3083:b0:3b1:4937:2877 with SMTP id l3-20020a056102308300b003b149372877mr23080825vsb.21.1671477436389;
        Mon, 19 Dec 2022 11:17:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4iWPbVRwLj078zkvGVS/rMXaSWd3/HYmSgeJhJHRGIOBQ4Q1rAtNoBQr169ipCDx2TZD4nMw==
X-Received: by 2002:a05:6102:3083:b0:3b1:4937:2877 with SMTP id l3-20020a056102308300b003b149372877mr23080807vsb.21.1671477436170;
        Mon, 19 Dec 2022 11:17:16 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id bp43-20020a05620a45ab00b006fb7c42e73asm7668029qkb.21.2022.12.19.11.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 11:17:15 -0800 (PST)
Date:   Mon, 19 Dec 2022 14:17:15 -0500
From:   Eric Chanudet <echanude@redhat.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: rename pm8450a dtsi to
 sa8540p-pmics
Message-ID: <20221219191715.7vhu2wtrs45zvmh4@echanude>
References: <20221216232606.2123341-1-echanude@redhat.com>
 <20221216232606.2123341-2-echanude@redhat.com>
 <7b6e1c29-4e33-b66c-00c8-836a62a0941d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b6e1c29-4e33-b66c-00c8-836a62a0941d@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 17, 2022 at 03:36:58PM +0100, Konrad Dybcio wrote:
> On 17.12.2022 00:26, Eric Chanudet wrote:
> > pm8450a.dtsi was introduced for the descriptions of sa8540p based boards.
> > Rename the dtsi to make this relationship explicit.
> > 
> For the descriptions of PMICs used on SA8540p based boards, I suppose?

Absolutely, thanks! Amended in v4:
https://lore.kernel.org/linux-arm-msm/20221219191000.2570545-1-echanude@redhat.com

-- 
Eric Chanudet

