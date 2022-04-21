Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBF450A22F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389210AbiDUOaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388932AbiDUOaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:01 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557C119C0D
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:11 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so5536560fac.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zc771pCV5yvkuoxGNN54eOQ2bsAjCQt8Qb/qBZt7/8Q=;
        b=jou0aJXIAc2MC2fbWw5xleaGzI6yD0lTBjd+otkGFCzVE1+TaV7nOEhWN8PBZcngfq
         zwziu3h8j+wNHcLMcwD4cBDcYEGpofpDtmOlKLVgyvx8sersaZk/INJVM5MCaqnHh0ro
         wb24Mndr2GN7mShoQqUJbrYqelSNhIX8o4jbXWdDbrid7H55O3hjM4+umakrU9ZU+Kkj
         +McTWYklbfspcKq9UbW4GR2Wi+yss6GctbS5lpVxi+Bcvgk3WwNxhyLbsLcsd/nQDQ5S
         hDTx8QWC6qJ3t0sgjBdYtAoAkPUfMTZvRmKUR9rrXW7cwUu0vicI8flh1eyjnnnO1hc9
         9ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zc771pCV5yvkuoxGNN54eOQ2bsAjCQt8Qb/qBZt7/8Q=;
        b=EM7+dr7s01bmvwIKT6W/VLnUW4uo8TdVx2bjsztqlPbZXjA3aDNByvWe54rxSQHYdZ
         OWgnz/wMF7PLT8YM6grXGT+0ZDb3lf1+gT7GblqcMNOLkRdBjeh9cZoywU/LLVR/ZQe5
         5QGebKsAlkJWVGhjV8wwgbk0ueiv/o3XCFW1ZJOwQcflb6vau7srlm6yS6LbWZTnUpcU
         W8/E0VmELx4A28D5GMlMVmUaPVD9Lnw+7TaUBjyejNTCp0+3YpxK1gKWuldIzaEYk3nC
         iXnDz0t93qdEyelOwgMQJdG56rE9wLu/9xmenC1Qmhhk0EBFjr91v6YebJA04PD8O4oR
         /ZNg==
X-Gm-Message-State: AOAM532iRL0VHrIhD3JdQDbVNAuvVF0bs3P2qZuCxB3udsXvwBfNBpPK
        fGye2ez9OpU8xa3Z4vpDSZVv4BISmc90iPrO
X-Google-Smtp-Source: ABdhPJzt/PYWMrBMEIEGEJh3pNdTVUBzzPxFqC12SNwy7kn/EzU9QYMEQoqNS71+4dfulmuoud5F9w==
X-Received: by 2002:a05:6871:297:b0:e5:f100:602f with SMTP id i23-20020a056871029700b000e5f100602fmr4010890oae.126.1650551230731;
        Thu, 21 Apr 2022 07:27:10 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     vladimir.zapolskiy@linaro.org, devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     jgrahsl@snap.com, hfink@snap.com, dmitry.baryshkov@linaro.org,
        jonathan@marek.ca
Subject: Re: [PATCH v3 0/3] Add camss to SM8250 dtsi
Date:   Thu, 21 Apr 2022 09:26:49 -0500
Message-Id: <165055095990.2574292.14686683834583624191.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220415164655.1679628-1-bryan.odonoghue@linaro.org>
References: <20220415164655.1679628-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Apr 2022 17:46:52 +0100, Bryan O'Donoghue wrote:
> V3:
> - Reorder new DTS include to be alphabetised - Vladimir
> - Place pinctrl-names after pinctrl reference - Vladimir
> - GCC_VIDEO_AHB_CK -> GCC_CAMERA_AHB_CLK - Vladimir
> - Adds suggested sleep_clk - Vladimir
> - interconnect-cells - I believe is correct as-is - Bryan
> - power-domain-names - not added camss does dev_pm_domain_attach_by_id() - Bryan
> - Added Reviewed-by to #3 as indicated - Vladimir
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8250: Add camcc DT node
      commit: ca79a997f2c0826ccf7d313068de3d04d5e8c82b
[2/3] arm64: dts: qcom: sm8250: camss: Add CAMSS block definition
      commit: 30325603b910e4ca61d56d20e2f5b9076d371e83
[3/3] arm64: dts: qcom: sm8250: camss: Add CCI definitions
      commit: e7173009e139bc13bf7833ea4185dda4779b95f3

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
