Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0779731695
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245389AbjFOLbi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245084AbjFOLbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:37 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35556270E
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b41e700103so12523681fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828694; x=1689420694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bQYiwI0riRd5ZPD263zPLo8B1Ez60Z4MDCuH7wIBjQ=;
        b=sWl8F2voBm4VFmhjOWk3Mvd56o9Q17pdEJv9OKmu6DX08C6AS4MlgML5SOfnv5fslC
         7qBZLjuUoIcOK9sSmwXsrygAORrMS4cr3gu6pxGmgED0Kf8eHW7QcCq6rkwN37PK0Qwi
         zmsQ40C4cNbcpmG44qwL8dILcT7HcqKRzcar6OU06XF3Mx9mMl1IA9floUpsxfa/Ba58
         yurRT51NVJOdVWVNUGIF7BzTv2+omNx+KlcDhPGSzDiHxOJz8M8GQgXVcD1dUxmAv0Ev
         cayZCZRY9fpfTyHgQbQzTeDYGNGXWiri7gr74KSNPDQaBD/difN/txZvGbWCawRXwur5
         Q1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828694; x=1689420694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bQYiwI0riRd5ZPD263zPLo8B1Ez60Z4MDCuH7wIBjQ=;
        b=KOtB7nuMs55XGPqnKUnSigWfhi6T2YM252DKTALnoyvvy48qu1Xg9XUWo97U5GqMCi
         8zSCDkI31PpyhIscOD9dwOtMIR/Njptf0HX6Ilyt79eEPLTx7IVO9MxjSb+DIRgGgBwg
         4QCaPWxfWOvc4bSOmxJoMepy0QEu9KWOU4PPHrwd/lEm6LPVrwUhhhGDUXVaoSdfMZrM
         /wTXraB9stFVFpnVbHSgLuCbx2Qo//BMh5RrgV8/B/KwJecGJ/+CDFCREJPQileQEUsp
         MTbNjyLYHZjKiQWtYlGdtiMlcHQ9rEv0aD7J3UHXbZwhKi0Y2PbYsqnb+0DGQ6f/LbrA
         GXlQ==
X-Gm-Message-State: AC+VfDx/KCokdAVzzcaEFJR7TipygqsxPoO/pHtlTRJRbgme49HXTp+x
        oKdeZn2Rs8GsdIK/5+tLmeToow==
X-Google-Smtp-Source: ACHHUZ5BGFBfj8nOlWec9YJ6ShqiniydUBQo2/Y5PM4Qt962d9gXvqSB8hbe2V3q7OxfNlIF5NHy4Q==
X-Received: by 2002:a2e:9f16:0:b0:2af:32a7:4eef with SMTP id u22-20020a2e9f16000000b002af32a74eefmr7484463ljk.35.1686828694598;
        Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Johan Hovold <johan+linaro@kernel.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Free resources after unregistering them
Date:   Thu, 15 Jun 2023 14:31:24 +0300
Message-Id: <168682860385.384026.4276167891794745473.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612220259.1884381-1-quic_bjorande@quicinc.com>
References: <20230612220259.1884381-1-quic_bjorande@quicinc.com>
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


On Mon, 12 Jun 2023 15:02:59 -0700, Bjorn Andersson wrote:
> The DP component's unbind operation walks through the submodules to
> unregister and clean things up. But if the unbind happens because the DP
> controller itself is being removed, all the memory for those submodules
> has just been freed.
> 
> Change the order of these operations to avoid the many use-after-free
> that otherwise happens in this code path.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: Free resources after unregistering them
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fa0048a4b1fa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
