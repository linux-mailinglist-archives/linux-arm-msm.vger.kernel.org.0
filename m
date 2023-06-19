Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BDB734D99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 10:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjFSI0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 04:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjFSIYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 04:24:49 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725BC18D
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:24:46 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f86dbce369so1167676e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687163085; x=1689755085;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xKU5IWIJcAiDaFMH+yk9PdlcdpcsDuWuz875QJDE1Ic=;
        b=aoiUrCH+tY/MlUC5TlbeXguMNjDxr2gjA+8lreflX5gFHqhWk2ci+Eaj06hmV0u4tA
         7A3GGNc6x7MzEm4uh8EaBFr+diu70Gf1mW9GMUuab13p5lBgVdRx7zb+Nyq8B84UAft4
         t03OBx2Y2+FzhmfDk/CLNLe2C2+HoC7SLCrp78I18+6YNowkrVVH272oGYHAe+Gjftbt
         Z4mWpLvsw/8WZqYj26S21elgnwVbbzCUeHa5EvXMR2llCfhMDzxXeJzVUNTQX6/fUlYZ
         QpW2/K/oZ/qIlPIPpFlC1W7uF18+IOP4UBDZIDU64jazOaZr4RvG3kal3m6Eo7wW71Wm
         CrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163085; x=1689755085;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKU5IWIJcAiDaFMH+yk9PdlcdpcsDuWuz875QJDE1Ic=;
        b=EcmR5aOVC3QoHquxCS/4bH40XQg2Svpj1UyJXapTzhRNyyrODlZZN/e866O7vsmkeB
         SaoiZDtXlTkemgxKvO96iefgRrfZYllYSFArzBwOlh41gurZvAdCt++j8mMTqAFkA2Rx
         AOcx2LbDBTl2jarDxD6NFitkgv4fKNd3eDHnoVqWsuX1YLSh8EQfp5G/flWFIT4J6smN
         WwNMzLGByGib8Z98I1/1OKzylr4DGBppkCJ9VEM1muH2FswJ+gYP5dhYveZQDVypZUtN
         z8b2G0TLJc5tj5j9BHQWcMi7ZHfFcOjpuX0SlMm0qRJv4YilocqO9N/9K/SF3hQmSyQt
         IHfA==
X-Gm-Message-State: AC+VfDzCA1shUp3XIb7sxlndAfsmJVLS5+lfC4VD2rK/CrT4O2XXwlLY
        alets5cdcCEPVQP5MiktsHyKAw==
X-Google-Smtp-Source: ACHHUZ4+jX4FZlnXtL5k8LMKv4z6b140MPERZ25kaWntoayBugDhzpzca4nEamExOP4gUyh0AoMaBw==
X-Received: by 2002:a19:6450:0:b0:4f8:7503:203f with SMTP id b16-20020a196450000000b004f87503203fmr461458lfj.48.1687163084694;
        Mon, 19 Jun 2023 01:24:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id i1-20020adff301000000b002f28de9f73bsm30781262wro.55.2023.06.19.01.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:24:44 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] interconnect: qcom: rpmh: sm8550: mask to send as vote
Date:   Mon, 19 Jun 2023 10:24:39 +0200
Message-Id: <20230619-topic-sm8550-upstream-interconnect-mask-vote-v1-0-66663c0aa592@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcQkGQC/x2OQQqDMBAAvyI5dyFGItqvlB7WdFuX6iZkowji3
 xt6nDkMcxqlzKTm3pwm087KUSq0t8aEGeVDwK/KxlnX2b4docTEAXQdvLewJS2ZcAWWQjlEEQo
 FVtQv7LEQjD2is533rR9MTU6oBFNGCXONyrYsVaZMbz7+D4/ndf0Alku7opMAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jxHmmhC9d4Z9enBTmPuFaWJ3U1NZC+tBuwIvmiogVDM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkkBDKdL2vGCCMSnuuemOWGGLAn4xQrJCH1SqAY9Hr
 J1g+27WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJAQygAKCRB33NvayMhJ0XNoEA
 C6VaI//dxGtogZTiixUo+DhhWDLE4ykWQWFnpA50Cm48d2y+DEQhH5SzhaBboIXxNpdhAgZZ0GloEU
 owe87Uvrd1zh2wGalDMNFeY8ZXT/4oUkQngZQYlqaZeTqi8KiharT46YCiKM0uXt6OW9XT0XhAker/
 t5diU9q39IvUp/MQxrTO4o1yq/mddKtuIKFaAMphhwzgfpfLr+wBH+c2LxWp9WEBOzCI6B9N3t+Ibr
 aZTBeqVSBKJJxNXJ9XAk3WG0yuGS+4xQZhFtPCQ9Ytq3XyL8qNitMOgMqClfX5xQJ/I9biVqCoCxIk
 9suyiI8sq8JflDh7LBSXz8niUx+998SrLhTT0tFNUcQqrp7hcDYslTWF+KTt/JdypqX/enjnGqTdcZ
 xXvXvEjCYFCgkJvDauZSeWtuS2MEw6j7bh6PkiCX55UjMdPJUF5Xff3cJUpJRUjLIibNkgzAY4wopC
 TS0RrsQX9GZqTudIdCSG4Tp9mOSbH1Tu5ltTj+Am0es3lm0NCkKS1Y3xRzh6lkLFK5UJWqLc/MT+Aa
 Joas8PfU0P5gJwSMAt3lPcXN9unRgRAy5Q2QVU0WT513jINC9WvyLxHmLzovEpGisF2/kIFES1M8YG
 0VDXZdbL2ZAmDCJubklogNrheC0h/nmG+UGFchUAl4cwnC3CYL6ZhmgJFM/A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the SM8550 SoC, some nodes requires a specific bit mark
instead of a bandwidth when voting.

Add an enable_mask variable to be used instead of bandwidth.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      interconnect: qcom: rpmh: add optional mask to send as vote
      interconnect: qcom: sm8550: add enable_mask for bcm nodes

 drivers/interconnect/qcom/bcm-voter.c |  5 +++++
 drivers/interconnect/qcom/icc-rpmh.h  |  2 ++
 drivers/interconnect/qcom/sm8550.c    | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 47045630bc409ce6606d97b790895210dd1d517d
change-id: 20230619-topic-sm8550-upstream-interconnect-mask-vote-96aa20355158

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

