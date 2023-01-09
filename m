Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E99FC663590
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjAIXoV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237961AbjAIXoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:11 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BC23FA2C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:02 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b3so15632653lfv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
        b=WymG9EYGwNpjOZu8XQGCmmXAH0fdbVSfAdqaleh8KnZy6WB8NMETRkYJmyFOFlaYpm
         DN/Pfpnv/qgNcOaCLoWLJApnt8Z9jX+rLqWOUx54nwg3IoO68WGmOUUNj/9d5vN6FXsM
         YTc98Kd7z0qbS65xFtl0KgN9j+x/NV1pRnHK7TaxOQ7x6K7Fwow/uJpPkrEYKt6Hq3DB
         1fa13/BQczvW/zOYdUGNfJuQGs/cHyJgTPFqARKfjxtINz8JkkgSSoiTRwjmPNBds59u
         TOVzpSXn7nOVmXYhKbfPOagwaXtjOaBb7DbkFAbhy5Uw6PcLYTe5c7hYr4Qe120+ayjS
         ejyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
        b=mPmZXYJwNM9YPGONkgeV4bXDPKQ3FETTER+pLYNA0jCYVM132KmdZdJ6jXUOObHoum
         1RBLo0diNzVBBwd824VhEBGmn47sw3XdLUk0MeBHlfB53MAwZR7BW1/vkcu2A6sv/8SL
         fXtKiOj7TVqznMDGOaq6kNHk9+eBAH6MW/65FPx799sEUN5e/oY+8mcf+RY+ZqLA+sEj
         u4kkO4x+TiMKDVkK5/NbUC3AiQNLdMs0gfdoh4nghLVUsLYjaWG2IGRXpsdABKiC3qEv
         fP5Xnr4yt4ASvRrGHAMUDAvzaGnx6KzingR3RMo3VLmR4EnBrGTu054Ye22zaN/nLeQQ
         R6zA==
X-Gm-Message-State: AFqh2kp6H9h7EMU0+9entLs1mSCvtWYTAHeKD8c1fzy3kTlC/Nhfy2ST
        xSkmMtGc1sh//yEM7VEGtCGB/g==
X-Google-Smtp-Source: AMrXdXtUH8/HDneehsv7HPVZGtwvYhSPv9laSh5y/3e00019/hxA5LPGKbrp+Bri2WRSow/UlphJvg==
X-Received: by 2002:a05:6512:c01:b0:4cb:3449:1354 with SMTP id z1-20020a0565120c0100b004cb34491354mr9712298lfu.22.1673307840979;
        Mon, 09 Jan 2023 15:44:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display/msm: gpu: add rbcpr clock
Date:   Tue, 10 Jan 2023 01:43:44 +0200
Message-Id: <167330408776.609993.2562174494126788375.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
References: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 09 Jan 2023 07:44:07 +0200, Dmitry Baryshkov wrote:
> Describe the RBCPR clock used on msm8996 (A530), MSM8998 (A540) and
> SDM630/660 (A508/A512).
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: gpu: add rbcpr clock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9bf1e33f9ca8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
