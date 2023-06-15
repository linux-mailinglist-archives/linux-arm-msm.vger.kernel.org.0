Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F8B73168D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244542AbjFOLbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245084AbjFOLbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:31 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCC12710
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:30 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b1b06af50eso25805101fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828688; x=1689420688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e40W025fGlyFZ6vbS7Ked1F1cVNFU/7QwbFD14aLFE0=;
        b=aZ1dgoWOAzw6+ndlGgXRJr5Q2d6b+HaXXL3amtujOQVHYUMr4kZX/ftwKA2h7pS/nS
         YjHq3QBSXgO3uw2TEjznxl9r+vNBiGNuv0P2g7Ll7MBjjH6lzaCQJ9FVj9fQLvTrWg7S
         TnF0kL89hFtuV9JqHaJJcKfhn4lJ64z5W24YFG+4cpVr30qvyXLpUB6frTp4pqqKn/yT
         wPCV+VrppV9bMN9Gt3d3cxICGyHMqRplbxUvwzgWwmWRJkCY//K71MDFxa8nqdZ1oWzg
         FVmL6avzf4qJH3WxTgIpstb96I0YnVU0oelEjIu7Gk/1WLrPx/YHJigQhW8EqW0efvva
         miHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828688; x=1689420688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e40W025fGlyFZ6vbS7Ked1F1cVNFU/7QwbFD14aLFE0=;
        b=QbUHel4HO0u9ZEjw8TRf/TaQNbPirbZfkMyC0D8QcQbFd7qQEA4609u0dfshcQZ/NE
         5xXfiAAtkQZMIjuo61hCXb9bx3gga5VmD9Nu6oOaqUSsPsolDTKW0Wc7GgjTxhkqZgXo
         02q1ZviLweaBg2a1KF27ZGoyjWhq6tEvAaFZAYol5hd+qUlZGFsLSujy0EXTFDNE4TsB
         YDMrpqhi/MwzqfY6xmfXoaRtVSBztrJ3F3lZEDFl5tlcdXAnlBbM4xGWjjk7vnGF8ff5
         J/7q1OvdHQy5aQn8B+K5g/RN9krsc/aix8A/6Dl5xGbkZ0hY51/ljy05Lwe2ppVXY+d7
         mwIQ==
X-Gm-Message-State: AC+VfDxtGl67prQjZKcKOmY5tohpp3EtyTSBb8ul3zha6UFG2bLdRji8
        uHODvLMyRxrg8+jAstxtQiPD4A==
X-Google-Smtp-Source: ACHHUZ4+CoEubc9a0pwP+plqW87Gnde1h5kz7Nyk8WNw40KCefSourZBUvGxIorUMAuqTSez5dAtjA==
X-Received: by 2002:a2e:9942:0:b0:2b1:b7bc:c64a with SMTP id r2-20020a2e9942000000b002b1b7bcc64amr8672970ljj.41.1686828688425;
        Thu, 15 Jun 2023 04:31:28 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:27 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        Yongqin Liu <yongqin.liu@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: do not enable color-management if DSPPs are not available
Date:   Thu, 15 Jun 2023 14:31:18 +0300
Message-Id: <168682860388.384026.128437075326886928.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
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


On Mon, 12 Jun 2023 21:25:33 +0300, Dmitry Baryshkov wrote:
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: do not enable color-management if DSPPs are not available
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3bcfc7b90465
[2/2] drm/msm/dpu/catalog: define DSPP blocks found on sdm845
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c72375172194

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
