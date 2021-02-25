Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6AE3256D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 20:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhBYTiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 14:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbhBYTgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 14:36:02 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B200C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 11:35:21 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id ba1so3785507plb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 11:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=r6wJvxB68vEymZci/szX9i/8klOR69G6A/W2Bpg+cp4=;
        b=nR9lCpX8XpkcvjIOmCara3uYiZ0lbn61xFo4C6F0Bs7EEf4jYjCeW2+fnj5qI3G6qH
         jGg2x/a4oChUVdBcmXH/Iwgjmglc+Hn8Czx8sSNYPr2jWYL94xZlsKLRwc3C0GIQdNpl
         W2c8M3fwHo2htxJvsNVv0ORyIYh0rpoLp5jEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=r6wJvxB68vEymZci/szX9i/8klOR69G6A/W2Bpg+cp4=;
        b=SL1UB/M0SNVpSUhClVCFhRbjHUVrPl2+1C5JY/6kbjic2Go3xSq99GEpQW3bjaKlIF
         OO5Bfw2oqNx9ip0VZ+9B7xqwK1sX42ws4uSOVNTIFxVnMe2y3lVWJ3FKjaKMfRhz8pLP
         awq0lW6+MdOa0n8RnM8IxRq6PFW3kSA+grVQuO/Q9vnxmECgEOPz3AyvjeEd/+3UUkp5
         /moDgRLUAFspMO0WnucXeMrv9Lw5vYNyMPH5B5kOlPsduco+XKa+vd//vHptejrVnjb0
         uTM1gUVFmKiSKMJAyGPFvb2tpWw8fbxyNvkAMHScoZ3SigxdhRm3kZrpPA/YMNtGisju
         177g==
X-Gm-Message-State: AOAM531dQ3ydd81OAPqCK1L9w/UBT2vzdCcuPwKwH52+JaE/bBO2o/MB
        USwSuAgT0ZZuG3aFmGCixOahoA==
X-Google-Smtp-Source: ABdhPJyskkONjLaGupEVZE1oDumXRSl08agvlDUkTMsRlO97Qz2/uswJYrl8oGCMV8rpq45ys5GPiw==
X-Received: by 2002:a17:902:ac82:b029:e3:bca2:cca7 with SMTP id h2-20020a170902ac82b02900e3bca2cca7mr4333204plr.43.1614281721158;
        Thu, 25 Feb 2021 11:35:21 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b942:93a8:e68d:5a90])
        by smtp.gmail.com with ESMTPSA id g15sm6841549pfb.30.2021.02.25.11.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 11:35:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f3b32d437d7c1165a74ceec2cd52ff56b496e5a3.1614244789.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org> <f3b32d437d7c1165a74ceec2cd52ff56b496e5a3.1614244789.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 1/9] dt-bindings: arm: msm: Add LLCC for SC7280
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Thu, 25 Feb 2021 11:35:18 -0800
Message-ID: <161428171894.1254594.5730779825217339020@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-02-25 01:30:17)
> Add LLCC compatible for SC7280 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
