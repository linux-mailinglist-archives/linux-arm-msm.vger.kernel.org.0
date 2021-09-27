Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D45FE41A0BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 22:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237172AbhI0U4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237207AbhI0Uz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:56 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85798C0617A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:07 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso26117746otb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H/1gZtc1poDY8bi7y1uCSE4LwRoLuhavbBlTDBIZBIs=;
        b=OS/9OXvdxz2u/sAdEd9Um2VSv1Or5L6pwwGm8sWU2Y5gGr7IvOEKIUY8qGxra55iZU
         5UwJJsgNfhbxYFmjg/0y2mnKfOEaseOvbmLFzw/GNqELKwLeJWc8SZmOLdKHPQjVgu6A
         KXr0oYjHNuy2X5AdPIWDq0EVUXsl0Rn+A138p4ASjrOFOB2bqdVpecRG2cBccfGe1ayV
         udPCOxqtqNBYM4HlHm27pvDuMM8NGUaE/v4juspZzEfG9bcQD+oA5uXeiU8pEJTNx6O8
         t5WdLCmbxqKGWWy84hz+S75Uq8nlDEOtDyrXg1uOqN+0tZB3+iRmn449Rtb8hacXQ3y1
         /uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H/1gZtc1poDY8bi7y1uCSE4LwRoLuhavbBlTDBIZBIs=;
        b=0HB2Z0HjPwjd1zluDhuqU7BE3wFVhT/Kpi7/YjGGo1qfyuhUbXzLIhXgzRdRLJBxuq
         91xyfhMTM0wD6keQeHgJwCvHG5fzBKWN6baYqoIxUetRDDCQP6UBcf3U2PcFj9Ldc/g9
         shI+pC9XlgXBCYistSoDUW+/+nDb3kulzob1kRbrg2vcrtTrVPLIVR6qZn8Ihxzigj5r
         4ayY84Z2XnOoRKMq79pyKCFX2MpGmheIwNnz52J8Xr9ro6T6U9NMTlMgk5ySEVp1kHND
         AqauDoWp4J6EcqYpQtH27S+Jw4qKVc4FD1zxkp079OyrpeVqbn5ITtMxM86f6Z1/02e4
         1TSA==
X-Gm-Message-State: AOAM53239+Zxcwct4wvblRfo8Tl0YsATg/yhA5vjniW5xM3d4ZjBM56z
        J2E4ifLaMcN1zN/SPu4Ad32GQw==
X-Google-Smtp-Source: ABdhPJxfkuE6fsAjAJhVV9xU/JhO/XLGt0nkHD77Y4BTOBoKXpAkEhRGu0cTm6LkL/+eLLFq96zScQ==
X-Received: by 2002:a9d:734f:: with SMTP id l15mr1810307otk.4.1632776046881;
        Mon, 27 Sep 2021 13:54:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rishabhb@codeaurora.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 10/13] arm64: dts: qcom: sm8350: Use QMP property to control load state
Date:   Mon, 27 Sep 2021 15:53:57 -0500
Message-Id: <163277593826.1470888.1989839830062398875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-11-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-11-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Sep 2021 19:29:27 +0530, Sibi Sankar wrote:
> Use the Qualcomm Mailbox Protocol (QMP) property to control the load
> state resources on SM8350 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
> 
> 

Applied, thanks!

[10/13] arm64: dts: qcom: sm8350: Use QMP property to control load state
        commit: 6b7cb2d23791c541dff2f152d9c5c2f9da065289

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
