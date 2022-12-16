Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A2F64EDD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Dec 2022 16:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiLPP0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 10:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiLPP0L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 10:26:11 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E4762E8B
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 07:26:08 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id e13so4083581edj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 07:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKpnCX1We6Wd+jFghY+6E3YYWeYuw8xu63PLFG+p7NQ=;
        b=mUCc71x2gfj8zWHkucpemaG9ceX9LG3EweMQXIAWBlZTy3Y9h+Ho2Ln0ho92leTzUC
         z6jTiXF32YnMtX/Fq2VsEVuabr3WksUq745MBuT00/4zwoe5k0rP9XXrRzeTufO4yNe1
         pJgodK/x+6zCI3Wvpzl7KjyHuka22cQpmupeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKpnCX1We6Wd+jFghY+6E3YYWeYuw8xu63PLFG+p7NQ=;
        b=10j81J55WZNbuIRfbVG7CzoXJTy+zOOfqtiV9S+AdmUC/YrlK8+s0ZyVhvxuNnfnWT
         I3/r34pRE1EcxAIeqSJRRgCQ5uMTnvwWwwSsLBmrjadZN2Wsd7pKCJAa+eoRBODC1NIi
         Cdj0IbxIK1YHQbtbi9te3PVEzsVPU0iKxJQuB+3Yb4uy7oaqAgVGu+C4Z9kb4mNxcKk3
         C6lPejbZ6ObCaIXqMTjeiFOVfWlP6/JS8iVKdlSIjSPCPd54+zT4C90S/doPLq6Gj4Bp
         daLPTz8wNfPohEKThUeb6pOzEO4qVMrR7RvMXm07L46AZ0+iX6QYFblwK9oOWTEft7nF
         w8sw==
X-Gm-Message-State: ANoB5pmOb4Bz4IBPxx5+Sghjiewfl3sspnKRqYYkfbvTTVwKZi46YJu/
        bzjhxqmhf0KkEHqb/i4+30nAOIZVGyxiaHK9FzM=
X-Google-Smtp-Source: AA0mqf6a2iXPmhRUzuPRhWPL8poI+O8J4Pc8J8jVrM19rVfuB4sPPFaY05aAdcR7vX6jlCy3YqLREw==
X-Received: by 2002:a05:6402:3646:b0:45c:a5f2:ffea with SMTP id em6-20020a056402364600b0045ca5f2ffeamr38461498edb.7.1671204367062;
        Fri, 16 Dec 2022 07:26:07 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id d8-20020a056402144800b0045b910b0542sm975197edx.15.2022.12.16.07.26.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:26:05 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id bx10so2906103wrb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 07:26:05 -0800 (PST)
X-Received: by 2002:adf:fd89:0:b0:242:1f81:7034 with SMTP id
 d9-20020adffd89000000b002421f817034mr27601714wrr.617.1671204364781; Fri, 16
 Dec 2022 07:26:04 -0800 (PST)
MIME-Version: 1.0
References: <1669810824-32094-1-git-send-email-quic_vnivarth@quicinc.com> <82ec225f-64e2-40a1-aa3e-58480f293d17@quicinc.com>
In-Reply-To: <82ec225f-64e2-40a1-aa3e-58480f293d17@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 16 Dec 2022 07:25:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+XG9ZBFZOjnVVXfCQnPSCjdAwB095tiomhE9DNbW1Ag@mail.gmail.com>
Message-ID: <CAD=FV=V+XG9ZBFZOjnVVXfCQnPSCjdAwB095tiomhE9DNbW1Ag@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: gpi: Set link_rx bit on GO TRE for rx operation
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 16, 2022 at 4:15 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Gentle reminder to review/approve please.
>
> Thank you...

I was expecting you to send a v2 where you beefed up the patch
description to add the "why". Maybe others are as well? I suppose with
that I could add a weak Reviewed-by to the patch.

This is also a bad time for patches to be applied--it's right in the
middle of the merge window. Usually the best time to send reminders is
between -rc1 and -rc5. Officially "Fixes" could be applied at any time
(even during the merge window), but unless it's urgent that usually
doesn't happen.

Speaking of which, given your updated description, I'd say that this
_is_ a fix. Perhaps you should add a "Fixes" tag? That might actually
help it get applied sooner. ;-)

-Doug
