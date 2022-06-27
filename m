Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6920C55DE65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240834AbiF0UDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240832AbiF0UDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:23 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D7B1A3AA
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:21 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id s13-20020a0568301e0d00b00616ad12fee7so7272947otr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xY1dgKqhnv3kojP2EXoYZ+xUIjzOiuLgDkxMFGR/9jU=;
        b=HTbmj5YgNjQIJRUivUos/4RUsJUepRMWJEfIJmDrZC0LFWwfZaS+y1i1E7YYbWnTg7
         Ht8058hfrXWRoN8bS+tDwoUp2ZwCObMQXOu6388qoaR5QBjWjR3b6aABokO8lCa9lsvc
         0SgHqOKl0nrJBtyrmpFsLS92nSDurclJTB1Blp+TqaxwRiKOL4pcCyWG4joJpXrknogW
         1rdykS57FagzTFiUyqPfDgdYperGQa9WC6TpqoLTmaEG17J499lnSMSUwPpDPy7KCUT2
         H/AZLlUKERC9gV4x/cxggOMYhPeXprn4Jta2MUnWgKnOSCx4tzu7Cgzj4/v1buHXQ0zv
         OHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xY1dgKqhnv3kojP2EXoYZ+xUIjzOiuLgDkxMFGR/9jU=;
        b=j3A8UHdQwaWr2PrxbsDFljA+nLFRkA5U0f7/A3Xrk4SFe7QFLIkP2tFagytxCwW5uP
         T/aVLgHP0niJako+4gowxeWbI2/BDw26iQ9m6M+2UpW9PcGXHmVr7+15GaCZMHy5r5/I
         /7e0+CALk7tHApHtheGUfk7UvYVBqFs+SOA4oOsheplglFn+WdUSouO6uD0Mu2ms/N3O
         ALESNm3L2nLDLRut3h8YG1F5+Lgzb2P1ZrKvh2CNFuhpdupPZXiAiu9ywoU4g8DFcaTp
         FA/hiAkCyfbFG6beg/hrOcYdmGf5ai6teFDFODr4A9Hr55yzMoW7JjdHRmNgOjCcnZlI
         Arog==
X-Gm-Message-State: AJIora9+kIMVqEc+niJcoSjmE5PBjAvtiAS23e30k3vgiKY/e3FbYJ0v
        5lHmbSCgQ9Ri/S3gX5gNsFWgYQ==
X-Google-Smtp-Source: AGRyM1uz/LeMT6xt6vCg+wqWPxn+uaJQ6yqDdo4q7FEuAuhLmZQzGkuPm4y94tS1I2FXH1IJqCF3yQ==
X-Received: by 2002:a9d:610a:0:b0:616:cd8c:a671 with SMTP id i10-20020a9d610a000000b00616cd8ca671mr3096278otj.297.1656360200876;
        Mon, 27 Jun 2022 13:03:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:20 -0700 (PDT)
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
Subject: Re: (subset) [PATCH 3/6] clk: qcom: mmcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
Date:   Mon, 27 Jun 2022 15:02:41 -0500
Message-Id: <165636016348.3080661.2270128941891514134.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617122922.769562-4-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-4-dmitry.baryshkov@linaro.org>
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

On Fri, 17 Jun 2022 15:29:19 +0300, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> 

Applied, thanks!

[3/6] clk: qcom: mmcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
      commit: a7a4fc9498f55f3e91f89a19f74e2016c3e7f62f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
