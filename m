Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28FA576E6A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 13:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbjHCLSi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 07:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbjHCLSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 07:18:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A481A5
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 04:18:36 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe2de785e7so1499705e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Aug 2023 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691061514; x=1691666314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVMtPnE0Jb/J9QxlUytkL4duX4FZWHFBp/OP8kiAwAA=;
        b=kal3dk9nda2u/3tB1viAQMR0L+3pUMGDhUd2QCFVid4mUMGAdEKYuavISSPyIKokFD
         TgC/qi7ryRCd9vbKYXe34j0lFy5wG2FzNyEGiT//5VEW3KsPlLqEinqDhh0pu8tALa4k
         itRxbwI6lzjTXRBckCh4wCZU8FZJubZKt4TN3ga8ZIY1dWZYv54f3hKxAQhozdag9pKw
         NjPXZuM2ErBdtqp2Ac5BfFjAqIa6GRSgOZlNXihJpqxdPuOfMl7muoxEpHau7j6mmewH
         glCZas8+O4ga/Lxx4jIWsYZr3aD4Q1alTWeeUUrGbvWIQdINQ2CaAkxCU9TeqBktG/9P
         V3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691061514; x=1691666314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVMtPnE0Jb/J9QxlUytkL4duX4FZWHFBp/OP8kiAwAA=;
        b=DYOQfpsr9ayVNYaoVDJFLYe3x/XtH9zMyo9JbOkLbBdnGXpqAmHurbJjhV7Vu1B/HO
         J0ts76PX3hfllQ9xWYFyjhwu8LCx9ZtWF1xT/OQz+NwqpCswuK4ZCim7ql4Lg4C+YR9+
         k7M6zqqRRrNZyGIewYUcNDmAWW2A78smja5cX7nbSQaI+rsN8uz6kXBJkbQNPzExCGFa
         84MOtplVuqUnR7QAba/iCDNYHgqsxyIhjPh9L+xvqsdlmiKryk+spDcbjZTHGqCWkekJ
         IrCauH4pBaSz0qyD++mcSBfkixjkx/penQjzZVAfNhFgEvHSmSWBBN5mRYdwNhPHdvXo
         KCPA==
X-Gm-Message-State: ABy/qLZMGw0MO5rWpe7Iaw+1VwBylTIabYHOrGjLYeZPGRGqSJ6Pv2lW
        SLBHHTGoedYMNM9c76zysWSTYA==
X-Google-Smtp-Source: APBJJlH0pAA+7qtJlp2hvnz725PBTJoYabs1TKO9v3OgLTpxg8UmqkP9rCFsq0g7E9dMQnMgVshsdQ==
X-Received: by 2002:a19:e008:0:b0:4f8:8be4:8a82 with SMTP id x8-20020a19e008000000b004f88be48a82mr6449087lfg.22.1691061514124;
        Thu, 03 Aug 2023 04:18:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f14-20020a056512092e00b004edc72be17csm3296417lft.2.2023.08.03.04.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 04:18:33 -0700 (PDT)
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
        Ryan McCann <quic_rmccann@quicinc.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Date:   Thu,  3 Aug 2023 14:18:32 +0300
Message-Id: <169106148046.4192382.8826688814736988415.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 02 Aug 2023 21:36:54 +0300, Dmitry Baryshkov wrote:
> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
> This includes the common block itself, enc subblocks and some empty
> space around. Change that to pass 0x4 instead, the length of common
> register block itself.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: fix DSC 1.2 block lengths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e550ad0e5c3d
[2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
      https://gitlab.freedesktop.org/lumag/msm/-/commit/57a1ca6cf73b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
