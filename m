Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE2C665F4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 16:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjAKPkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 10:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233256AbjAKPNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 10:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69913658E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 07:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673449964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TIKVKM4pIPCidy3CH3fpZ9rlRwAY/u57PoiVvzmqTZw=;
        b=CBP1fawxSoSBf7jOoiYln4wYSDqyAJ+G0r1Cne7cq3Bf9dgOmroQ5e+uJatUzNhxPbPCnA
        irkuQ6t1zEojgfaEQLGd66cJiHWcyv6Le3Spf42DvvAqdqAC6DmOpro5V8ZVTAa7VLpkx2
        DEbWybI0S7PqmywIUmwBVLnETq/G+pk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-FH-luTABOtaj2yHv-DgLxw-1; Wed, 11 Jan 2023 10:12:43 -0500
X-MC-Unique: FH-luTABOtaj2yHv-DgLxw-1
Received: by mail-qk1-f199.google.com with SMTP id de38-20020a05620a372600b0070224de1c6eso11209868qkb.17
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 07:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIKVKM4pIPCidy3CH3fpZ9rlRwAY/u57PoiVvzmqTZw=;
        b=SrRjuHtD0YaqOO+8aWgUdkikJxHyeUyiCI/glqhVgIS8J530offUXCOBu2LR6GXN7a
         4A2ULE8ZHg+eQQuHn+7QZPEajpsTtn9bYEjPmVYVEtgFW4qV8FfwzLZ14vAGVPMZxmwR
         sZpPr7upYEqLVJoU4EypqJIzHyzmMP4KOabfl9yz3M8E88rrduUny5dXbI4t9Tgmeh9v
         TbROH5YWNjIf0bUCyD3f/ayds6CQuSKcKiABKBv4h2cpnLaqc2WjptS0oaJfK7lJNLRQ
         dVVDiIofPENwO3azYyl8USyPJ2pTWNcFebpsTalSCZM76Txu2uEqRwV5+4WRBryfUEVl
         aUnQ==
X-Gm-Message-State: AFqh2ko4x2Dp9muJ4amDGWFmOzhNAZrlIwan8eaCsbeChu1rNxhiF4D9
        XfoB+KURfSYuFIOOKRI9ng/PxXNSZfMDkxlMWw+BV0lOOpsrkt1M6+9pV5gEAdGy1qrHKCmDnqY
        hM6yTzoMu8LNdN/s8To5i7lo0NA==
X-Received: by 2002:ac8:43d2:0:b0:3a8:137e:2963 with SMTP id w18-20020ac843d2000000b003a8137e2963mr9834179qtn.20.1673449962979;
        Wed, 11 Jan 2023 07:12:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwuEld4JOQo3C/4cSnLqKobKbsU8yRCRzgaWn9prK9qPOI0q9TYANO88JMgh9AzvK3NYXGvg==
X-Received: by 2002:ac8:43d2:0:b0:3a8:137e:2963 with SMTP id w18-20020ac843d2000000b003a8137e2963mr9834153qtn.20.1673449962780;
        Wed, 11 Jan 2023 07:12:42 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id b20-20020ac85414000000b003ac83b7f5d4sm5562621qtq.29.2023.01.11.07.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 07:12:42 -0800 (PST)
Date:   Wed, 11 Jan 2023 10:12:41 -0500
From:   Eric Chanudet <echanude@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8450p-pmics: rename pmic labels
Message-ID: <20230111151241.inli6ywo3hrk5f6c@echanude>
References: <20230111082331.20641-1-johan+linaro@kernel.org>
 <20230111082331.20641-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111082331.20641-3-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 09:23:31AM +0100, Johan Hovold wrote:
> The SA8540P PMICs are named PMM8540. Rename the devicetree source labels
> to reflect this.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Eric Chanudet <echanude@redhat.com>

-- 
Eric Chanudet

