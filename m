Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A9E3548B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237939AbhDEWr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236097AbhDEWrz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:47:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD78C061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:46 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r8so2139228lfp.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kR3LsXvrCWcRRj0gv82Kxzr9iJDIuGioSMojGQ9an5U=;
        b=u11EAT+CbXI3aj4zXNW+rvvpjpeuoYV6AsGH29fKi4OcsGR3dYyFrfRSqfI7Eu6enm
         HFXVDBj03IpkNP39gizyNSu//7f2knEE7/qnOff25FYL67g4RqWG6BqsggcE3lwHtN2L
         QlRSnxS/i2JYxJEB6Sa0+9qNQLBMQ7N4zu6xdqKz2VURjYaftigiDuF9bI3C4s+lvEpb
         vFjKLfeifj8lUr/fGkOSCavWHvGYQ/wpuLbccT5xN2C5tSbAQcQTPJvChbomiVMgZi1v
         +mLx4jgLC0jMdQ7nFaHuB6jJstLL+Ha1NNj8HFwbqa/4MPNYJu/2qsPqYeCDE32TK2Yj
         ASpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kR3LsXvrCWcRRj0gv82Kxzr9iJDIuGioSMojGQ9an5U=;
        b=RMsXGPTdX+9wDFtYbntj/mV26G5mAAWNwiShUfxvD3EZGq1jAN6jdbAXi1XH7pzpeV
         8QI5YXy0ntTPDEBN1HiDqdBcAZH5lxXTqC6xa3JhBIS8kpT3OjEv4MnGk3EwhquDSiQb
         jJJ0GsJ8L74GRmoZmOy5gwx/0jmCjXf+nUuTPzArDREjwujhSFEpioW5FnMsK1RQhn+t
         JRDPgujagIUBdFeqDAaIZyNnf9wEuYaY6N/YgUMu/OKfN5+ZOIbqSvpaHrfuogULDMyG
         CNvHPmihtdljhZYw1g3NwvanSvMVqndxZeZyQLz8WCNb2M5gts/jFzfxaB677ulhEkir
         Qg8g==
X-Gm-Message-State: AOAM532t7KK/GzUtFvUjBe5/Nkcj7jLvww20H5fHnjWrkpAdWhpD1ykn
        2PBsWR7YhEiEjH9DINNEbdbAIg==
X-Google-Smtp-Source: ABdhPJy57k4WLbk6MWTTHQawcrZMr9h/yNPLYqEB8Uq6OjXtg5oR4k9XM1uJatsLcfjR9znrnfb82g==
X-Received: by 2002:a05:6512:207:: with SMTP id a7mr18822131lfo.393.1617662865208;
        Mon, 05 Apr 2021 15:47:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 00/33] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
Date:   Tue,  6 Apr 2021 01:47:10 +0300
Message-Id: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup several Qualcomm clock drivers by removing unused entries from
parents map, removing test clock, etc.

Changes since v3:
 - Use ARRAY_SIZE() for num_parents and parent_hws instead of
   parent_data where applicable as suggested by Marijn Suijten
   These changes are applied both as a part of 'convert ot parent data'
   patches and as separate changes to respective clock drivers (which
   already used parent_data).

Changes since v2:
 - Comment out unsupported video_pll0_out_odd/_even clocks instead of
   removing them or just using .name for them. The clocks are
   unsupported, but mux values are provided for the future reference.

Changes since v1:
 - Remove unused entries from gpucc-sc7180, gpucc-sdm845, videocc-sc7180
   and videocc-sm8150 drivers
 - Restore video_pll0_out_odd/_even entries in videocc-sdm845 driver as
   requested by Taniya Das.


