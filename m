Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E4659CEDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 04:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239125AbiHWC4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 22:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbiHWC4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 22:56:53 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F5E5A824
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 19:56:52 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id z22-20020a056830129600b0063711f456ceso8986343otp.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=pRP+8U5uk2FhrsR7FeF6rksjBRXFOZLP1bxG00VCGkM=;
        b=S1yE7/nR/xhnTOsCb6R09FAIiBcW9VLJt8RZ3aON13tDzQniu8n+fXwuYs7JvwdPYt
         RLoojZsaGPVMrtHXNQmeGkX2R+UnGtBkJDbttvGB5aj9/3xd3xShrXMrYipQ0UOLndl4
         HmiO/B+HQvfqvr4XJc7pVg13G5rpyAjBCdJGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=pRP+8U5uk2FhrsR7FeF6rksjBRXFOZLP1bxG00VCGkM=;
        b=HiBqzbnmPhmY2CpVICd1OiGO6UfaGO3goR4NAfBQeD3GjNQhCPP59+04fjCZrs+4lY
         qQvrCeLZtjwOJU9RPHNm5juJZGFFt7Qfy7eShMGTTUewLhsyZeBwltirOGIIxPHL48v6
         NCUZzmx20KPwDFnEJwfdW6/p1AA9hzpTtX3wVGvV34dOYcGyrB6XfNojl7AgbeMY1EuH
         awciebBaqxJwkrfiJtIc3LacvdDdA/9OF37eO2zleAWnDzoAcZ8yvQjalE7veHJQGd2J
         PUwk7sbhjRv8QAISMBk/wGoIizp261iZkPnJKonAVyfhT7U70mVTmAkL3GG4iaYOUt+R
         vPVw==
X-Gm-Message-State: ACgBeo0ZJd5SRNBPnVexQ328UJKN9VM1W25lDbVomI0B0esamywTVRPP
        OHfPg0oY6hR4vu4oolbn0irg6Q0fLtYJnLwHvhhaEQ==
X-Google-Smtp-Source: AA6agR750VjH+sLACBIdPvl7p7EMj4bzSIHj6n6+A+g0qZB4hZGSar3BcfSf3XzBZAYBm5qPDenRMmSBgr862x3rDUw=
X-Received: by 2002:a9d:53cb:0:b0:637:1ddc:615c with SMTP id
 i11-20020a9d53cb000000b006371ddc615cmr9123790oth.3.1661223411932; Mon, 22 Aug
 2022 19:56:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:56:51 -0500
MIME-Version: 1.0
In-Reply-To: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
References: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 21:56:51 -0500
Message-ID: <CAE-0n51ajuJAsTXUmgcve-3TA37sOq1j_2WawweZYxo3L0R-9A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop unused memory allocation
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-08-22 10:24:55)
> Drop the dpu_cfg variable and corresponding kzalloc, which became unused
> after changing hw catalog to static configuration.
>
> Fixes: de7d480f5e8c ("drm/msm/dpu: make dpu hardware catalog static const")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
