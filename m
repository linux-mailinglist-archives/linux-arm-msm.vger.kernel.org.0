Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FCA67D687
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 21:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbjAZUhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 15:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbjAZUhO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 15:37:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571237448C
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 12:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674765381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Sw4KxlWv6KpVe3egxVDGwOgJo4CmF2S3SgyJLNLgqiQ=;
        b=cn7homqOyIzm7ZJdk6+nx3iEokSS+D63wU1xwHMePU5BA8kTciXiDMsKl9PM5U14f+cDsc
        KXXMgJ34ez8wqSw13o4ksPWkTadtLBHoltqFCncYNwyHuSrFEwql4SaPtNi4bhXoHrNmTb
        I7zZN58TNGjlMOqDosWOJ4mNLYhZZyc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-pCYiKmljNEicobZ4a5vmzw-1; Thu, 26 Jan 2023 15:36:20 -0500
X-MC-Unique: pCYiKmljNEicobZ4a5vmzw-1
Received: by mail-qk1-f197.google.com with SMTP id bi7-20020a05620a318700b007091d3fe2d3so1771415qkb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 12:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sw4KxlWv6KpVe3egxVDGwOgJo4CmF2S3SgyJLNLgqiQ=;
        b=J9w8zGDZzi0vbmS+drcvHCjPdt8A8C9v26JLy4WIK1Gj66EtZAI6xNjW2kzJZVkyU4
         /PZlGDUhzx5QJ3OvURWOoAKlHSzeaSlJUZ++8r6TFljKmNlk3/Ff0OM8j38cLePUNKJE
         k8QSujAqa25T1wN4zjt9oYlvxntnKOHZY41GR+kAaDz25uNIg/sCqEizj5+IF3MlS/nn
         dLTU/UWGuBfPClfQJ+9pxEDmS3No/NkcQ/wu91w1oIt0VxHJE/0xD1lKc7u5QZfy00U1
         9fzKMWVp7IZsXgYXlCR6krQzBPYDCRVu3vxMkNTSkMuK3puG2DvEuI+5eJjfHyooeIh+
         4vtg==
X-Gm-Message-State: AFqh2kodYg58mmgIeR9tn+3lvMSDH3Y23n9U53ymdrTzd+95Pu2SW5WY
        pzWqbzA+QtyyV8ssyrd66eFg5ZCE+sHnzVQLaMJfg3cTbV+M19Z2AprLJ0jvLLWsjAwa3ZvUDNY
        aKlVDxiTZbonKVFhzzG6FZ5oMSg==
X-Received: by 2002:a05:6214:5e04:b0:531:e1dd:c4d0 with SMTP id li4-20020a0562145e0400b00531e1ddc4d0mr54232903qvb.37.1674765379844;
        Thu, 26 Jan 2023 12:36:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvwOFBTT+t6+IREbUQb6eiBYg2AMk1i+IREHkHQzlfvLVMlpLpWNUZpAG89LRG9LhLj1H0Jxw==
X-Received: by 2002:a05:6214:5e04:b0:531:e1dd:c4d0 with SMTP id li4-20020a0562145e0400b00531e1ddc4d0mr54232878qvb.37.1674765379636;
        Thu, 26 Jan 2023 12:36:19 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c2-20020a37e102000000b006fec1c0754csm1526771qkm.87.2023.01.26.12.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 12:36:19 -0800 (PST)
Date:   Thu, 26 Jan 2023 15:36:18 -0500
From:   Eric Chanudet <echanude@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: qcom: document the
 interconnects for sa8775p
Message-ID: <20230126203618.nbqwppaddncq7on7@echanude>
References: <20230118140825.242544-1-brgl@bgdev.pl>
 <20230118140825.242544-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118140825.242544-2-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 18, 2023 at 03:08:24PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a DT binding document for the RPMh interconnects on Qualcomm sa8775p
> platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../interconnect/qcom,sa8775p-rpmh.yaml       |  50 ++++
>  .../interconnect/qcom,sa8775p-rpmh.h          | 231 ++++++++++++++++++
>  2 files changed, 281 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,sa8775p-rpmh.h
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
> new file mode 100644
> index 000000000000..672c7aaa8ed7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,sa8775p-rpmh.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm RPMh Network-On-Chip Interconnect on SA8875P

s/SA8875P/SA8775P/

-- 
Eric Chanudet

