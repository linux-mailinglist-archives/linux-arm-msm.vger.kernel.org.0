Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1282356F9C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349032AbhDGPCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243243AbhDGPCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:02:14 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C114C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 08:02:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id n138so29068111lfa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LBtCivT8RjVxvsmi0WxRFn8L0eyOzWjgUYimtMST2k=;
        b=SYjfGs/hCTzsdJPGSZT5lbyFGm+CbUsITCHHvnZz+buGVcvltB/e9AmsHLQc6C+6rt
         i7V7OT2Vy8LXGem+BJHUY5d6WlWH5h4D2Uc6EuoDZ3SspKAX59VQWr+mCU7lDK8AB72w
         IUIs3orUjIyDMNsxjkJMawuPzsciI2ApBJ0nSDzNm6DIPxmO9vZc9h48KjuEMeRVBMvQ
         5JKhyKAFaGrb9UTFxa+lZRCDIK9sU4+k+wbvjJQnKf+GMam18pXsHeUv4YtFiETbSE4E
         8psB3UN9MD05kvQBaE0QxJIM8RG4wLX0w3closJNtrhDgsjFWaYVoSUmCJU2o8ya0Vdl
         0IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LBtCivT8RjVxvsmi0WxRFn8L0eyOzWjgUYimtMST2k=;
        b=OhVqcuBwpJDxGaAaJmDeYLdhoRt5zzN7oM0LzeXWezpQ7md+5QcDukIATuIJAl6e8N
         u8x9XaI44xsbpdvEtsFFg1k26DHw8he1F4Wp03hGkhyuz/V6YK2p46GjsV52D0CdDMUE
         Z28RBIjloaEC2GPPO3L95AS2cRRPDZ9I52h1ScMC7bhJ9fWzRU8MRr7ScsyCQzSeZ18h
         JCmDF5Da9hFxDMk9H/t5aIueK8mgaREZret77VFvU/HoN946f/xNDYLc+maIYKsMwsLL
         skTf/SNdSzvhUyICeaFddqKfmR05fa/GbzJH1vSBUH+ywRJb8n6zHPbxCO4LyApFRZHQ
         ItnQ==
X-Gm-Message-State: AOAM5332Mkn5GHaPBHDImCPsxDWU8NLp8NH5f2d1SqcXU1YKB6RA7PCZ
        1fPKMMZ7vEW9jS8DbKYhWenGUw==
X-Google-Smtp-Source: ABdhPJykHSWWklYcE1eNJZmtmV9MVnhC03A+eepjyV3mrjNDR/ybJhP6m7UIxJqF3QhM4rq7fON97g==
X-Received: by 2002:ac2:599c:: with SMTP id w28mr2652623lfn.381.1617807721313;
        Wed, 07 Apr 2021 08:02:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o11sm2552142ljg.42.2021.04.07.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:02:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] drm/msm/dpu: always use mdp device to scale bandwidth
Date:   Wed,  7 Apr 2021 18:01:53 +0300
Message-Id: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently DPU driver scales bandwidth and core clock for sc7180 only,
while the rest of chips get static bandwidth votes. Make all chipsets
scale bandwidth and clock per composition requirements like sc7180 does.
Drop old voting path completely.

Changes since v1:
 - Add dts changes as requested by Kalyan Thota


