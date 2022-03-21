Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D484E2B93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 16:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349869AbiCUPQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 11:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244557AbiCUPQF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 11:16:05 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09FBEDF2B
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 08:14:39 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id e5so1248691pls.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vi2+JCSaediMV4fIRxpn8hEQFvyNR6zHSaSxlfbydg8=;
        b=mLSbZHC5mXRJErPc17RhtONtOQCHY8pq0NzHcS7uaZ910+4dxBn9jTc0IKBXhFIuhs
         ccpSCGG4YvS1YN8hLFwH9A5NWkZfCHOywaFpvlU4UTxmL0QBCB1k3SuyD7GUEQzF+U+u
         AKPENS44CZC7tmpv3Ny11bGHLN9JK8YhNonpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vi2+JCSaediMV4fIRxpn8hEQFvyNR6zHSaSxlfbydg8=;
        b=5P+ICrn+RsW04LAyU+jnueNahM2m55wZf3sOHTXkupmICcdZsox767s+wYVSjB8wMN
         qcGWbTsCoLjb23svHrToG4q6VJRLW8NpvIrNTTJPOP3qWuEUgFavmds9EQMfI1MMJHx+
         nZRChLomUuoI+J02e3kFdTimzugCbAfBjmaQz5cOyDYWgSOUgeOze7oN31rMfPLsWH5g
         DyCsJCk8xeIH5y0K7p2Q/3z3btsGZMNhSPjq4Re384wXLO2WXAeRaj8fqQWBW0PUs4H7
         5P0gTYFhDOQRXRVzvUz+3V+ZMssXMhIQs2+oELZqHAHBGsXN2bfhLp8eXJOuKAhNOGfE
         3Tzw==
X-Gm-Message-State: AOAM532sXgzOyzBir3jY0heF9g+Y+Isw0NFaGtjsSd6SlnGkgmjAeZoi
        7fqduc6A/wM5nq2NZFhHesmhP+lEJJwrsw==
X-Google-Smtp-Source: ABdhPJxSC/CLQYd2LeqNM7sSaZIcmei/abLlLofHzwrzcpTZquto/ceY3Edydh9kY4LGGH98pFuBMQ==
X-Received: by 2002:a17:902:ce8e:b0:154:2ebc:8d49 with SMTP id f14-20020a170902ce8e00b001542ebc8d49mr11701225plg.135.1647875679186;
        Mon, 21 Mar 2022 08:14:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b32a:e805:a393:534b])
        by smtp.gmail.com with UTF8SMTPSA id s3-20020a056a00194300b004f6da3a1a3bsm20367875pfk.8.2022.03.21.08.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 08:14:38 -0700 (PDT)
Date:   Mon, 21 Mar 2022 08:14:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: Add 'piglin' to the
 crd-r3 compatible strings
Message-ID: <YjiWXA40Nh0jBPO9@google.com>
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
 <20220316172814.v1.2.Ib0fbb7e5218201c81a2d064ff13c9bc1b0863212@changeid>
 <c808dc08-09c8-bb08-6656-18dd649af036@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c808dc08-09c8-bb08-6656-18dd649af036@quicinc.com>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 21, 2022 at 11:14:56AM +0530, Rajendra Nayak wrote:
> 
> On 3/17/2022 5:58 AM, Matthias Kaehlcke wrote:
> > With newer bootloader versions the crd-r3 (aka CRD 1.0 and 2.0) is
> > identified as a 'piglin' board (like the IDP2 board), instead of 'hoglin'
> > Add the compatible strings 'google,piglin-rev{3,4}'. The hoglin entries
> > are kept to make sure the board keeps booting with older bootloader
> > versions.
> 
> The older bootloaders really look for the google,hoglin-rev3/google,hoglin-rev4
> compatibles or just google,hoglin? If its just google,hoglin, won;t it pick the
> crd-rev5+ dtb now?

They look for the -revN compatible, I confirmed that on my CRD 2.0.
