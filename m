Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED48062998D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 14:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiKONEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 08:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiKONEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 08:04:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5B6A1BE
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668517428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pwFTRSjvBq3e+IXuQuSlNARebSjDFofjy3AIZnLKcDs=;
        b=DI+U5LtGZm3xOiD2I4bTT8BmbqY9OGzGS2tcBxmtwFVDeiRPMPRCrN7Q4BxyD7bnRDN+N+
        shCbyCxqvQqqunvWUD2xIIZfAnJr12DexEVr6tVc6Yr3Fn7v58PLQ6lmPdBfByLELZaGiv
        HV41aH8+gPZb1iD5ZAD/MMAD5bGdfjk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-5G7w5w0jNIOpVQxRA0WUPQ-1; Tue, 15 Nov 2022 08:03:47 -0500
X-MC-Unique: 5G7w5w0jNIOpVQxRA0WUPQ-1
Received: by mail-qt1-f198.google.com with SMTP id i13-20020ac8764d000000b003a4ec8693dcso10273964qtr.14
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwFTRSjvBq3e+IXuQuSlNARebSjDFofjy3AIZnLKcDs=;
        b=qq1IcOXeXK6fZFvft1GOIY8lwQ6d0Cy/gGKmJM35W0YmsrYjtcBI/X0IdC6QM9XWNB
         BT5lYEoqyG0JTNMjT2DdCUy34sGXsJggzKz7BQZ+4ehHNFXziHLM4xo2rJdmA1ZI1ioc
         eUeBaTzD2A69+EDnkYf1DiSa26Kf6x98f/upwzZ2ZKvmau5+vPIqmiDXzhovB+gZvF/F
         J9UNKC2A6msjkrWekudsrRspejbMaH7ZX1RZY2kZxesAh9UVc4ggqSDto8EIHgogcJkt
         LOhOb4xdiWF9QpPGR1SAT6UKcj+wc+p991LHlcNdDKupXNWQ2jTv8v19gmfEPdKwDyT/
         ATLQ==
X-Gm-Message-State: ANoB5pnIC1haUTpWeH5dxl38MXajX51Y+F6mETOVB4Z8460sXZycJ2IS
        QWWDhn3eOrHV5YMZoJIa1BjT24ZrXRxd23Ox1V7UsXJfI1CzgFBhxN1EW6/XREdsIoqP/BdlqE5
        PObavlHFJ9Ve0pEndRIkPWqNokQ==
X-Received: by 2002:ac8:4415:0:b0:3a5:2556:42ed with SMTP id j21-20020ac84415000000b003a5255642edmr16135252qtn.422.1668517426808;
        Tue, 15 Nov 2022 05:03:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6g4wONIalNVue6tn6WP7hXmPOBZBfpwYnNOhI3Rflggb5LyweprHhYoAyHIk52G5OdRUrCgA==
X-Received: by 2002:ac8:4415:0:b0:3a5:2556:42ed with SMTP id j21-20020ac84415000000b003a5255642edmr16135238qtn.422.1668517426562;
        Tue, 15 Nov 2022 05:03:46 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id o26-20020ac8699a000000b003a50b9f099esm7112858qtq.12.2022.11.15.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:03:46 -0800 (PST)
Date:   Tue, 15 Nov 2022 08:03:45 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Shazad Hussain <quic_shazhuss@quicinc.com>, andersson@kernel.org,
        sboyd@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-sc8280xp: add cxo as parent for three
 ufs ref clks
Message-ID: <Y3OOMXZBvew9eg9T@x1>
References: <20221115102217.6381-1-quic_shazhuss@quicinc.com>
 <Y3OLDj6xzOVjvEdV@x1>
 <Y3ONkOhcdK+gt46g@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3ONkOhcdK+gt46g@hovoldconsulting.com>
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

On Tue, Nov 15, 2022 at 02:01:04PM +0100, Johan Hovold wrote:
> > Put this Link beneath the --- since Bjorn will add one that's specific
> > to your patch when he adds it to his tree.
> 
> I think it's ok to keep that Link if it was intended as a reference to
> the discussions leading up to this patch. There can be more than one
> Link tag, and this one is more in line with how Linus thinks they should
> be used than the ones added by tooling such as b4 when applying.

OK, good to know. Thank you!

Brian

