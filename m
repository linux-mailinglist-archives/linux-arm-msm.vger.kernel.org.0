Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FADA67D4D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbjAZTBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232315AbjAZTBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:15 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24642279BA
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:14 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id vw16so7597053ejc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4KAdu7fVD19fhLCdbp0Xp7Oejh/hWZQK5rs1qa1Pvw=;
        b=O0ivBoSVGtwzhFUvGcQPGXy0ZpjVU53bvGlbLDxv9YMFLR1iKbfh/7qi3nYki6Jrh4
         KsQPmNbs8HG9utJxL5v2c4t7NpUl9tuDRgPAmg76uPoFkmMYerXkXhwO8CDH47W2PQYR
         limoICSUkkTbLVQDiB4JlSKW2nNy123HSj7rdAd8btJc0R5c9K7ml/82OYENz/IRO5Xt
         305CuRSyc8BUWMqRXhCDl8jmf5mQuDrYlPBPvfueYeJe+/hJwTUXijSRR7Sv44aDPL/o
         zUq0e5SXh9bI8qJ116XPvzU4TT1UEj/Xii/zTRwKTdBML1Jtaes/2IIBV83fMgFs6PvX
         ih5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4KAdu7fVD19fhLCdbp0Xp7Oejh/hWZQK5rs1qa1Pvw=;
        b=DPh/XksWMLVI9jpML6qNcoOCjU6/UAOE/xiN6ft27rqohFYaly8n8YIXEOVi/tA1o4
         L12ADfhPGP0+IXje/ZBi2gbm+s11AaBnwfxXWuhFpbq2SDYTxQ4190feXXho2f/4E4ud
         4etCqcelVbbJktHxOPBXoh0bYNQSZsEi0bea4fP4a8npvwu4aoBy1UZaUcy0AUyQcIg2
         YWOREbEDonV/Wbk64iMme863aPNwOy0pj4LPdVi0ItO7aYT7F3FnTmziV6aNtREjDmba
         livjV+PHb7cf/BSll2PsJvZz7OMEeVgLXiiFGfO2mz0bP2KH0RIZj1zt6y8XoFyUTHS+
         ZXPw==
X-Gm-Message-State: AFqh2kqRAx7icNdFmc7VWP5dRPLIXc57xkxDyIu9OJ+BkilMYcq35AOw
        C4A/KnKneL/lnMquC2KWXsAg9Q==
X-Google-Smtp-Source: AMrXdXvu41l675MshRL57jAMLr96sbxQRNIf58cOG9+EOAVwYFrOA2yICLT+QRXIrFtq+izPN+BCxg==
X-Received: by 2002:a17:906:3518:b0:7c1:962e:cf23 with SMTP id r24-20020a170906351800b007c1962ecf23mr36294374eja.37.1674759672791;
        Thu, 26 Jan 2023 11:01:12 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
Date:   Thu, 26 Jan 2023 21:00:56 +0200
Message-Id: <167475959092.3954305.14748093187828121221.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121135457.2788199-1-dmitry.baryshkov@linaro.org>
References: <20230121135457.2788199-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 21 Jan 2023 15:54:57 +0200, Dmitry Baryshkov wrote:
> The field ubwc_static was removed from struct dpu_mdp_cfg some time ago.
> Drop the corresponding kerneldoc now.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/daa9a2ec3e07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
