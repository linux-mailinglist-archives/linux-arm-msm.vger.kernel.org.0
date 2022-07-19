Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE5E579236
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 06:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbiGSEsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 00:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbiGSEsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 00:48:15 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2235D3A49D
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:14 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10bd4812c29so29282918fac.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+gDA2XB5R39MlqxFpgVfDWpQW7JF0nBGywVJBLQfYIk=;
        b=Xk4+wYxbsMiHklO6v/G93ogoOWHSq4S8wqUBon1FAzyqULgDZhyi1Jy8xzHJ1rCNmy
         gVDJNrsnNzMXO4DcEKz1mVfwnd69Mk8SsjFmc6jq9EBEngE5b6OJN6WdrMYCfGOzR/uO
         03lBIvZs/hDzWL7IXZyBybJll4LtK29ZAa3Zyk8kNkGqdq+bj0gs0OvFIJIDcyCn54hr
         V2dgFd+hWAmzjwIXuBLucTKpu6Isw931VRA6DO4sE6PWmGYRyESIt3HT1OuTAifPAOOE
         7/iNDFHAmtaVeRj/Nn7mUJNaMEXzZYX3r6s8EN8imIgxgO+F7fkYVGq4R0lZJxSzAvWk
         ibZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+gDA2XB5R39MlqxFpgVfDWpQW7JF0nBGywVJBLQfYIk=;
        b=gASkt7ZA8m8vcbFNS2PbTug2K0bqKQpkRF/vxol9Le017N96Tk8LB5ZFo70z+MZ7po
         I4CLYYBz2LjOS+dZaobSfd5/zgCY1rPlQ0Bjo4xY/2+DjFb6K9+I87FuGIDOpsZTDR2T
         UdI51bPpialhmK8T5U+hrNzACP3FXJy9B3m9vSg5JVVsEwzCt1j7jNKBSmcXNW5K71gZ
         krI7DyDECdGiYQWvQMXEsQJE/Ef7mt5gQk/MFpq0sWoq1O6h8eMUizGQPaufogaml6DE
         7rDLvSPIYAwKIiNAHeXhTSJwcJz/BDbTD9xSJrxanLazpRtoynlwHWmWw0D/i+MO2ik+
         hnRg==
X-Gm-Message-State: AJIora/5QH47te/cpWHSS4L6CG8VqtOG7GvI96V8VU+bZWcERsuknqQG
        HgjC4Xp8AkWCAtiLJ5XlaGtiqQ==
X-Google-Smtp-Source: AGRyM1tB4hUDkaP0vW8AbHY/0A3mWlus3kjVRO25yTAPLSnkefKF0zvrFSyBwFTw36+4KTdrrJPJnA==
X-Received: by 2002:a05:6870:ac14:b0:10c:1d60:d4d2 with SMTP id kw20-20020a056870ac1400b0010c1d60d4d2mr18934764oab.58.1658206093662;
        Mon, 18 Jul 2022 21:48:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:48:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_tdas@quicinc.com, mturquette@baylibre.com,
        Andy Gross <agross@kernel.org>, dmitry.baryshkov@linaro.org,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] clk: qcom: gcc-msm8994: use parent_hws for gpll0/4
Date:   Mon, 18 Jul 2022 23:48:01 -0500
Message-Id: <165820608075.1955453.5936899759101029858.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220620080505.1573948-1-dmitry.baryshkov@linaro.org>
References: <20220620080505.1573948-1-dmitry.baryshkov@linaro.org>
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

On Mon, 20 Jun 2022 11:05:05 +0300, Dmitry Baryshkov wrote:
> Use parent_hws for two remaining clocks in gcc-msm8994 that used
> parent_names.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-msm8994: use parent_hws for gpll0/4
      commit: 5e1e12d2992006a4e950ebf2e2a1f0ebaabd969f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
