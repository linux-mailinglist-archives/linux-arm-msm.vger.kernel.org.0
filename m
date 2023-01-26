Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E577667D4D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbjAZTBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjAZTBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:11 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9150B47407
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:09 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ud5so7710607ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/hgeihi7ZjGYYdLqZARIRAYjr8aF0qhlO8SOLhtlp8=;
        b=qndTHlbjpfaL6qbJ/TvhR317D4OWWuUDGHqKGvEvJGVZMtUSWBCvv/fbfwkd49hUiQ
         z6tgwBIqOisziUxGn3G5MR0YEe/SQLl4hSZX6ISXXw+aL05DsyTFplYtqN5OZuaXE35N
         m4c+MEHsQ8f9oIrxbnTqQAyHli3m0WXvwjS01o74nplXedX6pgel4YFGDBoeCdZu4Dhr
         J8D23fLhzTjqcWYWMpmofj6GunWPTssTaEjYj3HIjME37A4jcNjGOSOsmlN0Qes+DGoV
         3KLIssWXrBdbaNQgnhUBqmGPzhbt3UKCh5nwIkjyj0SGSRKbjH1dYhN7hg9zsN+4K2HA
         kQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/hgeihi7ZjGYYdLqZARIRAYjr8aF0qhlO8SOLhtlp8=;
        b=XVEuIAS8Y4MyNwa6hWct1i1gZ9qD3CVtldNq9G5xFMhShh/4wNvsgAAH3/HklsDpMv
         Ne9ye6F7+qHnLZ+tQXPB/C36u1NS9r0reyTNCAbzzKjrPZsG7p9r9L5vXW4HW/h6wwom
         reJXfwzcLP2w2ju0leeWyjLrPf6YzbXW8xTHEAhBy2Jx0+ilwVLY/Mr5FDvCH7RIThQF
         VBMh7ig13yjvPbXE4HTVnrxnKPlgF+XAshSRKNDFweaTM6BfxjTHXjE1jwUIr9P7xWvQ
         4SLFEZUTdiZGd6PG6H1VPWQZh9BFAsxUYuN9Y6kBS4ahjsnyjEnAfU4fa7YZKKIxMSl3
         Rh+w==
X-Gm-Message-State: AFqh2kocODeSdSuFUjhkQ7uPf3FXWZc6U6J4cpjkvRdZ2mLcz/ssRQWL
        vzSw3Toaji34J4h+o9zmOrcIXbP4KraVy9yp
X-Google-Smtp-Source: AMrXdXtE8qV5H9Cp8tQfmuHwc9+X5j6HSC+5QPwvvBHlPV3xWsNS21kkvSCJq1otXOROOXqurM207A==
X-Received: by 2002:a17:907:9150:b0:84d:150d:5006 with SMTP id l16-20020a170907915000b0084d150d5006mr34691515ejs.49.1674759667959;
        Thu, 26 Jan 2023 11:01:07 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/2] mdss-dsi-ctrl binding and dts fixes
Date:   Thu, 26 Jan 2023 21:00:52 +0200
Message-Id: <167475959094.3954305.603604364773846840.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118171621.102694-1-bryan.odonoghue@linaro.org>
References: <20230118171621.102694-1-bryan.odonoghue@linaro.org>
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


On Wed, 18 Jan 2023 17:16:19 +0000, Bryan O'Donoghue wrote:
> V9:
> - Adds Rob's RB to #1
> - Fixes two check splats - Dmitry
> 
> V8:
> - Squash first and last patch to fix bisectability
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0c0f65c6dd44
[2/2] dt-bindings: msm: dsi-controller-main: Document clocks on a per compatible basis
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d10bdc6ec6ac

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
