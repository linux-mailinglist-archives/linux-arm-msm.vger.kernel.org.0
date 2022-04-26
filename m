Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 876A4510BA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 00:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355608AbiDZWGQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 18:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiDZWGQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 18:06:16 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C5748387
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 15:03:07 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q12so17119212pgj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 15:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XHM/fpedJbOmeE0HdLCMs3zLbUyITCTfReO7PA94A0Q=;
        b=kz81s0Aq9pekkJbqOoU/ux2Y2uHA0uLNPVgvlgMIb5Un07GsX5OcCr3iOqqMGyWnJ5
         fSxHHX4DPu5yjI05DMw6YvlQ/l4ZSv9OqHqhdgCLVAagfisjRkiF4e1R2zwjSXQYjzJc
         m9fHW2q0Xy+wJpVLOZZ9xXbN3BwwfPAYFf8VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XHM/fpedJbOmeE0HdLCMs3zLbUyITCTfReO7PA94A0Q=;
        b=SYFUGpWPg2cTq1kE38KAbhXa29OD6U30iOb6NsDV211qKMZRM8J4n90vwO/qhEkR8D
         GqpHWxq6RkXIjlZ7zARIAN09Vxg5okixaM9Y21519agxlifMNWBfgc7jV6GuE8PSwKri
         2Scm5LkiYZXg42m8D70kVQ8lH6v2/FxJHcVt0UB0tY3w7OWu0OIdL1j88ar/3pIr9RjH
         Zy7U6B+DPMHNSG5J+BuDntXj/JGpPJ6iAl2iB5my0odnwzKZl/kVy+aVUBKbrULs2+6Y
         qXn6+du3W+IMt/addtxGaobs3U5VVOo0qMN4lzMnISD6lM+f5n9Hw+Uclq4JjaL3dotE
         EDKg==
X-Gm-Message-State: AOAM531vOCIrPvC/2Sj5SfWBeQHUP3zADVQVPsLOznuvKf6HNsfpKf+C
        fXcgeyR9abylEbVy/u+2/Dx2lQ==
X-Google-Smtp-Source: ABdhPJyH3pRW5H6v8JbpozO6wlyaChBy9M/pX3yVPvcwr2kh9PXs7lGTW5JigWjRPkqPeJ8ebHHh3Q==
X-Received: by 2002:a05:6a00:1392:b0:50a:7d0e:7e0b with SMTP id t18-20020a056a00139200b0050a7d0e7e0bmr26602588pfg.85.1651010587326;
        Tue, 26 Apr 2022 15:03:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:eb63:4211:eb5d:f6b])
        by smtp.gmail.com with UTF8SMTPSA id la10-20020a17090b160a00b001d6a79768b6sm4051432pjb.49.2022.04.26.15.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 15:03:06 -0700 (PDT)
Date:   Tue, 26 Apr 2022 15:03:04 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: sc7280-herobrine: Add lpi
 pinmux properties for CRD 3.0/3.1
Message-ID: <YmhsGMd49+AS+K3C@google.com>
References: <1650957666-6266-1-git-send-email-quic_srivasam@quicinc.com>
 <1650957666-6266-5-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650957666-6266-5-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 26, 2022 at 12:51:06PM +0530, Srinivasa Rao Mandadapu wrote:

> Subject: arm64: dts: qcom: sc7280-herobrine: Add lpi pinmux properties for CRD 3.0/3.1
>
> Add LPASS LPI pinctrl properties, which are required for Audio
> functionality on herobrine based platforms of rev5+
> (aka CRD 3.0/3.1) boards.

Same as for patch [2/4], the patch alleges to configure the CRD 3.x
config but sets it for all herobrine base boards, which isn't correct.

Please move it to sc7280-herobrine-crd.dts
