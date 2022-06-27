Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3722B55D77F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240940AbiF0UDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240848AbiF0UDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:39 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997F91C936
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:33 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id u9so14276718oiv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJGIaiEzHKU6wwx8OVu6zgkeNxxNlZC3+zNUJNMZgL8=;
        b=OvKNdR22tXslO+7i0JA1hK1emUidBgKY6WKYfKG+pwb3AzXYrlZVTaa8ksdTNY8xZt
         nGpmRf/j4jl9bymWyQkPbgvc4hZYcktfHWWSzEjNY7kn5c95gBPIIEBkPQt9KjqCjU6Y
         vOehsMzSTN4V6R1RYLzwyBeuHvrt2d4yU+wMzs6UQwezIfcs4eKq6xMA49QO3EE5w5Vg
         B8+VWa8DQLvUXFNEcP1VEIa0GAzvZ5pY0jNhZfHMdd019tEWgifa8MXcmgy+Nvo56H5E
         teE1Vr6/DDhXkALhCs2WzsXyELyh2Yg3h7WmnAyox9YgBvm6IA3yf4nBjdMoUV3SGT3V
         L+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJGIaiEzHKU6wwx8OVu6zgkeNxxNlZC3+zNUJNMZgL8=;
        b=b0oZhBl85fWKiM8khaKvQAS+Dwc88lI08efdKkJeBHfF/OZFICqxG2s+D3AxlmVxwp
         L0K9NJ2tON8sMHIpZ2K63iDveIJf0ySXZ0UPcvcPciMXJ9rxsH5SMwufa5Zx7KqGd+9R
         i8pWA7rzVTjRXYJld5TUJtybufGBQm9nWnwi/+Rydbg7CASYwN1YSkrTtCeE0KYp5kge
         N9aw10jBaRJ6aykJALD8NQCCd8c3kbUV0YPPFphIEKqHNxHUIC+dOuPJgrf7ASaYdWaG
         z+WGTF74Ov4D3TCgAaa/mE5e9ysWoT9S25ermAC0aiVZYqefOE3fzbPgBrih2jTW2pow
         DSVQ==
X-Gm-Message-State: AJIora/q8CYY7R0WxzTQltETXnHyGrTcbjLaEmp3L+j1dEgh2wmwLJe1
        GAZ9Wu36mm8CfjPSNZOEd38z1g==
X-Google-Smtp-Source: AGRyM1snTvVLrNYu5gxZnjAVSrpS6qGlrfVIMksL2W1ijXFWHxrWdG8kCC557j2qQDl66bekNZgkNQ==
X-Received: by 2002:a05:6808:1a13:b0:335:870b:324e with SMTP id bk19-20020a0568081a1300b00335870b324emr1832264oib.297.1656360212870;
        Mon, 27 Jun 2022 13:03:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: rpmhpd: fix typos in comment
Date:   Mon, 27 Jun 2022 15:02:51 -0500
Message-Id: <165636016350.3080661.12816692025292966241.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521111145.81697-9-Julia.Lawall@inria.fr>
References: <20220521111145.81697-9-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 May 2022 13:10:19 +0200, Julia Lawall wrote:
> Spelling mistakes (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> 

Applied, thanks!

[1/1] soc: qcom: rpmhpd: fix typos in comment
      commit: a20e55d4771c1bcb531f77434a953cd7acdd1687

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
