Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD40A46AC21
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 23:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357226AbhLFWen (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 17:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349589AbhLFWej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 17:34:39 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29033C061A83
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 14:31:10 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id u74so24114429oie.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 14:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qq78z0NHjEwA+124YJAfXzlLqwdJ9fvjq8n6HGk0oQs=;
        b=OVuSxC2lcwkdAR8CVsOqRUevq1YzOkLgFN1nKte//59whrLb1o2W87NbMhaGzd6PzN
         zNluYSE8l/tItwU5cvKHCeA1PEnerMzBrpt2mKUg5E1YYu8UfHy2jDmCsztIl5DXrTQS
         uO28qLaECyhzzo6+VMTUJAroUfdf4SOY2i2gQrFWU4CjVNCSXQyYHB8DZXte8p+WC/6o
         EnQp5ICiLysmMisoyZjGewmyNaicyspGQy965EVTboccIxdbUxcGtSvJPR2bYFfKQFob
         2JSYcSwFvAAyeVQOcMqVomiQF60907qFRmeYZ6rFkwZNWmWvggMMg/2HO315MtaAt8uW
         vu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qq78z0NHjEwA+124YJAfXzlLqwdJ9fvjq8n6HGk0oQs=;
        b=tmBPipp5lXWMxdmsY1F6eqcGrWI/HsC26W5pIkGTOyoSb3yB+HDpzibrEjOBGgwB+1
         I3tbQCqxG/nxV/CSzcXc2f74FG5lQtu+uj5pdbzH9/wSk38kDOC0aTdiyBAHFBEa4vaO
         rfeOmWaW+q0Bgopx1tZk8+MdWAZs1mPtDGH7DNoqO8GabEnYvvKQxqkl0/Cn98CaF8bq
         DfRcQNL4USRT1/QFvL6Oc0m7uvQjFGH1zd2GPhhPSlqd/dDUxoxJ6tmAUJtsNA7gVoSH
         37nAbWVyAQNvRyVnuEtqz4XmvCVEhheH6fPR8Cgd6QLcRnTxoJs8O+jRFHwuj4SrNrZR
         cLXg==
X-Gm-Message-State: AOAM530+mMe2rdJTyreyD6pIx4Zb1gg0BpvrmZ00JJruSjcYtBFyk8xA
        lCEdOius1S36tkBEMDPskWXoqw==
X-Google-Smtp-Source: ABdhPJwkJrzUqguY3mZZb6B6HrmKYK8hSC2ot3TTx4x2nA1AUMDIyBsv8+NWJlEv04t1H6fe6JEqow==
X-Received: by 2002:a05:6808:301e:: with SMTP id ay30mr1625744oib.36.1638829869470;
        Mon, 06 Dec 2021 14:31:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm2911815oiw.20.2021.12.06.14.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:31:09 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] A few smd-rpm clock driver cleanups
Date:   Mon,  6 Dec 2021 16:31:00 -0600
Message-Id: <163882985136.2324147.15735697314524211594.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211031020715.21636-1-shawn.guo@linaro.org>
References: <20211031020715.21636-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 31 Oct 2021 10:07:12 +0800, Shawn Guo wrote:
> Here are a few smd-rpm clock driver cleanups found in the code
> inspection.
> 
> Shawn Guo (3):
>   clk: qcom: smd-rpm: Drop MFD qcom-rpm reference
>   clk: qcom: smd-rpm: Drop the use of struct rpm_cc
>   clk: qcom: smd-rpm: Drop binary value handling for buffered clock
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: smd-rpm: Drop MFD qcom-rpm reference
      commit: 00a123e962f7f17163ee7f665f483d3ba25f54a6
[2/3] clk: qcom: smd-rpm: Drop the use of struct rpm_cc
      commit: b406f5e92b3ba6c8fe89f16cb61e60190e45171b
[3/3] clk: qcom: smd-rpm: Drop binary value handling for buffered clock
      commit: b26ab06d0969ed9e901f93390242437ac5802c4d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
