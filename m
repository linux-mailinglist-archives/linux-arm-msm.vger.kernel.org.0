Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3B54FFC41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 19:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237183AbiDMRVp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 13:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237262AbiDMRVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 13:21:43 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F783D96
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:19:21 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t12so2504558pll.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lME6SHAgnKlmWBOKOizWm8XVxJpddGvUH85Ld8tYptw=;
        b=UTabBOIrMAwX7G926h1g/XxwxCNw+redFrANl5vrbvEVFXqf3dVOsfKbJlN/8qVd6b
         9gZ/mx8JQZDJ2nW52LktmlO9klbmAm34eSmWShJ+HKBGgunwO3ZUW6fiHXwTKvXPPJwK
         EjYmODPltiC3D/nlbGntEawXo1fKfBXxUO7ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lME6SHAgnKlmWBOKOizWm8XVxJpddGvUH85Ld8tYptw=;
        b=tIq8IvfSHqM2Z+y0fVEDN9A7FzuTInq/MS4vrr5UBpvoPDUMN3HHdRmEDlukIMWHrn
         PZP6rGKaKMFqGQtzSJJ7mW2Uw3apgfX29ZaCbCmLFgNHzocyhmivlz5E5tn0bRyHey6t
         1OYkeFq/DUrmLyusrQxDvWp5YUxnsV9AhzZ3dnwM7vcvoPMtJRs79ilvlfGPJzDcIdnh
         BxC7Os07yn0gFbgu0l7m139Br1ld/j1nOCsyMMqvFrVzU0UqWzyHpZQIfKjTKKsZsdEQ
         IALGzswNy7Ppied5cV0YFBG6sNQWZwcttbxXBqSKFBA7eo6/NB7DbxXC/VI8vSe+kw9q
         fvdg==
X-Gm-Message-State: AOAM531emv4gJRzVWMy621KKG5L9hzHy2cDi1xxf3wByLL8sF28mFdaO
        8Grky65QiPVPFQJTgdxB+ugx1w==
X-Google-Smtp-Source: ABdhPJz7ppfzbQ8wE0OtGonV82yO6sDyoE48BgV4umaaIEAVFFGDk/8CJYoUUK24mmhN04OGb0xKpg==
X-Received: by 2002:a17:902:e74d:b0:156:9d3c:4271 with SMTP id p13-20020a170902e74d00b001569d3c4271mr43099858plf.79.1649870360761;
        Wed, 13 Apr 2022 10:19:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6a4f:9277:743f:c648])
        by smtp.gmail.com with UTF8SMTPSA id b25-20020a637159000000b00381fda49d15sm6821133pgn.39.2022.04.13.10.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 10:19:20 -0700 (PDT)
Date:   Wed, 13 Apr 2022 10:19:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: sc7280: Add pinmux for I2S
 speaker and Headset
Message-ID: <YlcGFlFXhh+bHGko@google.com>
References: <1649861047-7811-1-git-send-email-quic_srivasam@quicinc.com>
 <1649861047-7811-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1649861047-7811-2-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 13, 2022 at 08:14:06PM +0530, Srinivasa Rao Mandadapu wrote:
> Add pinmux nodes for primary and secondary I2S for SC7280 based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
