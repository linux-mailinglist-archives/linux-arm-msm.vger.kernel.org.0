Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D11C55CA09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240841AbiF0UDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240835AbiF0UDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:23 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0BB1A806
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:22 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 7-20020a9d0107000000b00616935dd045so8165914otu.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcZnuhzt3HYaDmytiX2ksHnj//w4zRWfe3IXUnwjnFw=;
        b=HHAjhCYS1WVFcF0lGEHTQtbfWNuVttQmvCgBZKOet0J5f+hUfxXK4nZf1gXb9cs01I
         CeOpQ5aNDv2J2rywxFTRdOE7VZ1wgsjlRw0SCxn00kk7773k4xjR298VD2AZvWLk5KMR
         bhcq21IO8tjn8G7P6XYg++Ljxg5jw8Drczmj5UFN6CfPWyOdst8zC/K37EY9g81MToz1
         dno/a5n9ENGL9mpxRUpLbqwyCLpUcLzLPkaLElQE8b+EhhkoMMTG+37HGINpeeYZbsdj
         pMK+/FQdlCUvxL4lQtn7D6iGYiRth7xMgpWTrF/OKpBrMwGeUznUUDioaVYXOjB2iKfY
         njDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcZnuhzt3HYaDmytiX2ksHnj//w4zRWfe3IXUnwjnFw=;
        b=LpzfHq6ZHvnGDjhVIWYbpBArJg0fbBGHJuhaPhdHH7BoOix0O31akuFK5O9/UuRC2w
         2bDpB9Ul7ab1tSFSlfqORBeBGJ4D8zHYxK045WtPnMHUgDqRnOPbYR+WU3l/D3mCx5YW
         Snha2ME5vxFbWsmy6lL0ABTTHUG7cHippm1WAlbX5lMqgaK3H617b5PG3pp5McgE475G
         cn6H2pbgIPl6zEcwbrt1ihhZ7mG299TDWK9kcWHvECR8OcaVXKT5rFwJIOY83bw9FVEi
         6pQ/3bYHs2hMxGgM4Do4keY5FIaBex7p0rYtbmlSjIPcXsWPgfmX2AwvSl79OswvQ3RO
         JiXg==
X-Gm-Message-State: AJIora+/8G2MRb1lgIe+9g9gtvnhRcr2Zw6+3qH4GR5RdWSUtXy5rSSi
        YszTTGjUiAlIY4TWNWhxOdv6aQ==
X-Google-Smtp-Source: AGRyM1sE88yRTNZRJxl5JR2p38c65IqpGO41Uq88FeQMZLZcNvhgpaWWcvGvshuW4VQXKldNU8PAdg==
X-Received: by 2002:a05:6830:2a01:b0:606:d153:1ba0 with SMTP id y1-20020a0568302a0100b00606d1531ba0mr6651430otu.35.1656360202020;
        Mon, 27 Jun 2022 13:03:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 4/6] clk: qcom: mmcc-msm8996: move clock parent tables down
Date:   Mon, 27 Jun 2022 15:02:42 -0500
Message-Id: <165636016349.3080661.14609288184787240225.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
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

On Fri, 17 Jun 2022 15:29:20 +0300, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the MMPLL declrataions, so that we
> can use gpll hw clock fields in the next commit.
> 
> 

Applied, thanks!

[4/6] clk: qcom: mmcc-msm8996: move clock parent tables down
      commit: 208c564fe66e2f76abb29468d067223eb50b3005

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
