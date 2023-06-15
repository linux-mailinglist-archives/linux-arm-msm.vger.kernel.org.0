Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E05D731692
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245469AbjFOLbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244888AbjFOLbf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:35 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697622710
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b344476313so25995851fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828692; x=1689420692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70uYOl22od6voBT++PO0PloxqsuILnAv+rJj4oS0Q5U=;
        b=JLeyIJZxnpVHC3jQwlds4ko3NwjIUHoLiSFmDPH9ZXv0XPS6TQ717WiJlKIY0ymaDv
         gTV2pR0kfwphmwKiPsSgwodV7AcsW2CInL712psWsqWfvF/fD4FgR3t7mBUIntqDgoZd
         bnY6NA/AvyNZ6lmkyZhVnpmHcCJSfZIAM71On2h+KYCyqilFGx4/dil3oq+tv9HNIynE
         4efo5Tl5+Pg12RNUw8ztzxHaYItnuD8pO3srvL0YoiflNO6RMUA72osBEDDxmlY6sVnd
         qc3uNxJBLY7OkiYtZQtMhQ7M5wy/7mnrBRzYxPTW4+YrdXhqVCBX2YvZbI9jttdpN/nx
         TVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828692; x=1689420692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70uYOl22od6voBT++PO0PloxqsuILnAv+rJj4oS0Q5U=;
        b=TbpwoQHkcdBjY0XDyOf7rfI7np4dAiM8NHHsbgLcIghyEviJ2ZIrmdj+m3qrwRcLm1
         aYIRo081oXBCqnw1WYEq8qYEjnPFRvB+UkMTt2uVzPqmrVPB2vgCrMYK0Xua8nqt4tgE
         FI+4pftG/XrcocDHe0akmHq6/EesWH0ZqfyJ2O5gME+KP8JkG3bD633zhTR8mwpUUCOK
         aFppsloSjAGVWpNMB6Ldq+OuLtYwAdK5AL7X7SKBiKW8/QELwv2y7qz2F/MhIe3u0yCp
         aMfE1LnHQWCXzdIofjIqEQpu0PPTJ7vRprnpE5SSq2qPgBMtBQRMjkOPMqTcbeP2OD6t
         qpMA==
X-Gm-Message-State: AC+VfDzjyf7VlaV74dj6GG6wh5PXelYnsQNRj4/uSdq7wVdQmGgdvTcI
        LW0LQaBe5yQtPLbCWpck4D8RTw==
X-Google-Smtp-Source: ACHHUZ5Li3AXk78OUM4vR7rskyjT/kylPI5nBf3KDCjoapmUh5UQ5ppn5e5dUqqp32J7YHO0DEY3cg==
X-Received: by 2002:a2e:9582:0:b0:2b1:c7f7:188d with SMTP id w2-20020a2e9582000000b002b1c7f7188dmr8807832ljh.23.1686828692640;
        Thu, 15 Jun 2023 04:31:32 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 00/22]drm/msm/dpu: another catalog rework
Date:   Thu, 15 Jun 2023 14:31:22 +0300
Message-Id: <168682860384.384026.9850510984858511761.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 13 Jun 2023 03:09:39 +0300, Dmitry Baryshkov wrote:
> Having a macro with 10 arguments doesn't seem like a good idea. It makes
> it inherently harder to compare the actual structure values. Also this
> leads to adding macros covering varieties of the block.
> 
> As it was previously discussed, inline all foo_BLK macros in order to
> ease performing changes to the catalog data.
> 
> [...]

Applied, thanks!

[01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5efc0fec31d8
[02/22] drm/msm/dpu: correct MERGE_3D length
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f01fb5e211fd
[03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
        https://gitlab.freedesktop.org/lumag/msm/-/commit/17bf6f8efc50

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
