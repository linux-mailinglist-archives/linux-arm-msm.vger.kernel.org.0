Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1675E665962
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 11:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjAKKvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 05:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238972AbjAKKvL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 05:51:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED5214D3B
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673434200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KicQRhRW4GIgvI9D3cmZlt5g4pih7zwKs4FM1PmEwRI=;
        b=GH40aqMMeSvTpDouuOrZ+GyFr7SEXn+Tw7eTXHiWmQPrqNM4EAI88BslI9kx30A7j5oKew
        MRauiek9MujU8bmMOJzB+MIxLxgemBTeeKufeuDAxxOKMlXZBb6855Nv/JvkLfMJ7m0f6K
        5kBqG9PmybF+6N4hTEXr1iyXdFInwrE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-kOet15PtM0WHJZHqsmdi1w-1; Wed, 11 Jan 2023 05:49:57 -0500
X-MC-Unique: kOet15PtM0WHJZHqsmdi1w-1
Received: by mail-il1-f200.google.com with SMTP id h24-20020a056e021d9800b0030be8a5dd68so10625546ila.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KicQRhRW4GIgvI9D3cmZlt5g4pih7zwKs4FM1PmEwRI=;
        b=Le1180yyTT/E49ALZ/xJBfAB4l4J+Xy+GwuNOjvrC/ODQCJyHA1Wy+lwSnlRBBQgrX
         e8a+O8xnNc862Uwb+pURy7nj1HlPGtLvfsnv6vi5RYGxIuHFRuwXUsU7DIcxpZD0Ya2y
         bX9o+Vd7SbzrVL+CL/0ARH3YCD+DjNS9BqGAC12GbTm9UnnKIy6VhGsRGuF+hlyJ4D4x
         +l1rjvbdqQvR0iooyTxNfo9FfC3qIlMm/+cXrncRY/w4aGbZ7Z9uELZqfoh4n63ePLZY
         NhfdxoEVy6PzT+DLDkPYOF8cWG2UEsi3My6UB8Emnhd06vYnNNAXSVebn0tXi09SPN4z
         +BMw==
X-Gm-Message-State: AFqh2kpHmVdF/G+l3j7Hz83Jv0LUUmcGmzVvWST1vTghBuj+tXF5pbAn
        XY8DKIdi5EVgMvkknROyrGRqrOYvZnP9eXhbTNwko3xukL9tTNVik3OwHZpJTtbcdx5NU/l+TTl
        VvDtBCdACtDJ2O6rwt6XdeMrUDQ==
X-Received: by 2002:a5d:9cc4:0:b0:6e5:d1b2:d925 with SMTP id w4-20020a5d9cc4000000b006e5d1b2d925mr49142221iow.6.1673434196857;
        Wed, 11 Jan 2023 02:49:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3Y45SXB/Nt9M0C16VUqO/0EV+05Hlv3juN5iJV2s2eapIOTQnzGAYArJYogQH6E8bee7eFw==
X-Received: by 2002:a5d:9cc4:0:b0:6e5:d1b2:d925 with SMTP id w4-20020a5d9cc4000000b006e5d1b2d925mr49142208iow.6.1673434196657;
        Wed, 11 Jan 2023 02:49:56 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id v19-20020a02b093000000b0039e8c12414asm2287897jah.164.2023.01.11.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 02:49:55 -0800 (PST)
Date:   Wed, 11 Jan 2023 05:49:53 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Eric Chanudet <echanude@redhat.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8450p-pmics: add missing
 interrupt include
Message-ID: <Y76UUZ7ZbM6csqmV@x1>
References: <20230111082331.20641-1-johan+linaro@kernel.org>
 <20230111082331.20641-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111082331.20641-2-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 09:23:30AM +0100, Johan Hovold wrote:
> Add the missing interrupt-controller include which is needed by the RTC
> node.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

