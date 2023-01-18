Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF916711D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjARDYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjARDYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:24:38 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0C553570
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:35 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id s3so9701923edd.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hfByT3XPIIBtEMphICjivjtBS1usb2S8m4PFSVMxjfk=;
        b=PDM4ZC2iRec3CPN1tjGInxDAqgdmGQflGmlfq4HwSs75xGjghkQXnE///SrRlF8hMQ
         Qo3JGMklyjaacq5UrP/4TLhogF+tDswRA+i9jtee5AzsLXZrmgej0d3j/KShszZwYCd7
         C0Bpljm3dAQCxllPIZMIeNGZA7GOPBkzTs491DiJybMiBG6ifPj2GpwkEwQXWiHeYimm
         I9YP278HdGRK+AP9k9kTl21qWRudauU3r3F6fbqfSTxeyidH3dD4jTF3T9/B5cEK3+fD
         QfHxm3P8Ecv+cBl6k8wvbYIt+JUo4Jc3isfBHkFI41Ar3N1v6rPZe8jAhWMeZ1bKsQoT
         Cu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfByT3XPIIBtEMphICjivjtBS1usb2S8m4PFSVMxjfk=;
        b=G4ML+YUYu2z8X+JHQKZErDb+SQEgD7rxAqFjMykQWW7O9cbvWmJPAXXeHcOb7NuOkR
         I1XHNgRKJm7ztF8u2enEvrYAvfOWHu0ohlRAVtOQ27kr5b4/4drLkVDovCDgxZaHTijm
         3K5CuYwFM39ub8Zg9275EZ3dLstD2cmPgdomko+TEMfRwEncHTOS80bgdAfioOGtXAtP
         g61KjC3k6E+clZpjCFo3eJVUS603gR5tkRtqQIphBvKlEF4RPTwxwvpjvsTQHSwj6vey
         bNp9/QMgYDb22wdsKHfR/RXaQpOapZNJYtgvJX+YnRAdW781/0/pR0+BrrHAe1BF48st
         bHgw==
X-Gm-Message-State: AFqh2kr5PJya+FrA2EQ3Zkavpvbak0dWuYiIZRHPNGLb2oRxz1vnm6m4
        qU63oHweGwdfeNovmqe4tBLGd4skmMTLEbij
X-Google-Smtp-Source: AMrXdXv5ySMa8omogU2DWfZzBFlpGddX6yt47sQUUg/eO5RJgAycTZNSEcC/IRMs9Fu2HFoh4SpaUA==
X-Received: by 2002:a05:6402:5002:b0:49e:1d53:5e20 with SMTP id p2-20020a056402500200b0049e1d535e20mr6130218eda.23.1674012274513;
        Tue, 17 Jan 2023 19:24:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:24:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/4] dt-bindings: display/msm: more dsi-controller fixes
Date:   Wed, 18 Jan 2023 05:24:28 +0200
Message-Id: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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

A small set of patches to go on top of Bryan's changes to fix a small
number of remaining issues.

Dependencies: [1]

[1] https://lore.kernel.org/linux-arm-msm/20230116225217.1056258-1-bryan.odonoghue@linaro.org/

Dmitry Baryshkov (4):
  dt-bindings: display/msm: dsi-controller-main: remove
    #address/#size-cells
  dt-bindings: display/msm: dsi-controller-main: account for apq8064
  dt-bindings: display/msm: dsi-controller-main: allow using fewer lanes
  dt-binbings: display/msm: dsi-controller-main: add missing supplies

 .../display/msm/dsi-controller-main.yaml      | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

-- 
2.39.0

