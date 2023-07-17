Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333C2756D9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 21:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjGQTtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 15:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjGQTts (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 15:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3708F132
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 12:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689623340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m2rRzgR2bCR4WLQV/L/SdDZ43J6JQqvM6vx+FxfFLaM=;
        b=BxRnQPu3wILjD5g2suqbAlxADBqkznE+MfVxoVGJj5PMUZHfH6ikD5rnL5wHgfkfojYkho
        zrrjl5wMbux3hn3uRTHjFX1S/O5wQ0Y33tpvbLriRBEGFzpXQJcq18nanxc72t2oBcDsSh
        JpIoIacYV7ncRGeKJn+WISQCo4/Ik2w=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-348ee_HSMLOcBPdrq17iKA-1; Mon, 17 Jul 2023 15:48:58 -0400
X-MC-Unique: 348ee_HSMLOcBPdrq17iKA-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-78f62807a12so511683241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 12:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689623338; x=1692215338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2rRzgR2bCR4WLQV/L/SdDZ43J6JQqvM6vx+FxfFLaM=;
        b=PtNlReo3JqCdA3puLzozqdcs13LEt2f2I1biImiUoTKNz+sw+npdiBg2SQ9vqGSe5Z
         PdWkrRpplfTibuhi4c4XY9XmfdQ6YzwEehQe8U1WumhFnXH5lGx1ypOOBXuJhHBlZLYk
         YzjgjjiXkqzX7rowUhm+n9AHuR4LQaJ8A4mvxRY2oD4OsR8ZbaoEwrsIPtuKKn+RLxRE
         Dg7h2MfoWPo5xH17Gdgw+iLZtCRd1ScCXnPD8vtDs3mVDo0zqmQUlZ/WnM08gAH5+Gey
         qX/e1ISYRS/q3JJ7LAZjj4Z17MToOG74O+l3yF1gX0EAVwfxnVN1Va6TFi2XrUJ/uJ5j
         967A==
X-Gm-Message-State: ABy/qLaq0RMMC70HKbAJnrYPCnFlcwCjoXqP0w8cZVZfbUHidkag5uhg
        zwE5dnVNMOCBUjrW/6HLfuu/cZHfgmsRCLI35IQtpIc3kf6AvVs4K70SiG19PGQdkF66i4p1LZk
        k5jgXJmewtbx8oeKpS/iiPByEjw==
X-Received: by 2002:a67:e3a3:0:b0:443:5ec3:55da with SMTP id j3-20020a67e3a3000000b004435ec355damr5207076vsm.15.1689623338326;
        Mon, 17 Jul 2023 12:48:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEmuKfhqUNybdA9S/7JJsY6kGCiUUlRIJFJBn/SN8CN1hqWuSmyjKp1TapgDjsKCWociDChlg==
X-Received: by 2002:a67:e3a3:0:b0:443:5ec3:55da with SMTP id j3-20020a67e3a3000000b004435ec355damr5207071vsm.15.1689623338093;
        Mon, 17 Jul 2023 12:48:58 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id g15-20020a0caacf000000b006263c531f61sm154184qvb.24.2023.07.17.12.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 12:48:57 -0700 (PDT)
Date:   Mon, 17 Jul 2023 14:48:55 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [RESEND] clk: qcom: rcg: Update rcg configuration before
 enabling it
Message-ID: <e2xxoobnbtepdsplh2wv6l7k7snncbwssp43pttii4xnjj6egy@r24o4s6klhs7>
References: <20230712014812.3337992-1-quic_skakitap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712014812.3337992-1-quic_skakitap@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 12, 2023 at 07:18:12AM +0530, Satya Priya Kakitapalli wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> If rcg is in disabled state when clk_rcg2_shared_set_rate is called, the
> new configuration is written to the configuration register but it won't be
> effective in h/w yet because update bit won't be set if rcg is in disabled
> state. Since the new configuration is not yet updated in h/w, dirty bit of
> configuration register will be set in such case. Clear the dirty bit and
> update the rcg to proper new configuration by setting the update bit before
> enabling the rcg.
> 

If I understand correctly you're saying that without this patch:

    devm_clk_get();
    clk_set_rate(rate);
    clk_prepare_enable();

would look like it worked (i.e. clk_get_rate() would return rate), but
in reality the clock is running at whatever the "default" rate is.

That sounds like it could use a Fixes: tag if so!

Thanks,
Andrew

