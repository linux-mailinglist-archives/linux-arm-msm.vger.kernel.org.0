Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF7F50A23F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389236AbiDUOaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389220AbiDUOaE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:04 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450D13DA68
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:14 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 1-20020a4a0901000000b003296ea2104eso874669ooa.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qfplEFqel18YWhzaQ99003BJu9htbTKjIoDfg6GItSU=;
        b=TzRChBfHXToDF1YopklQzLLKfLQkX9y4QWa7b/LPTqzIrQ3SoT9KAsDEofGqDpA0cQ
         7d8/uMn3qu+oh05Zx+H0VyliVXWqgiZR8CktNk3DC2xXGTufgcnZpl9aY0GRwCR78bCg
         FmP2uIs1p4pRNVp9+BMqx4lqzCkuKNoKOxMw9k4/YN8RQQ7ZH/ED4aY2+vzM86j2qTj9
         OysDt2E92eQjSxeEJ/NqHRTpvUX41FPEbyrB82xJLjJp/VlIiaPwETyuVluNS/3MayS4
         a35KTnDgm3YLoJ0G03mXPgvIpypirHleECT22/PNzPUcplXzCH3TifSwQdbru3aLWM1Z
         uB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qfplEFqel18YWhzaQ99003BJu9htbTKjIoDfg6GItSU=;
        b=Ip/0xyVDYkINSrzt2Tc3pJrllAhzRfC/zDsPkZCRg4mpVsAY2fodWUEd6AIwHk0qky
         2RWH+wq3fhBPyq+KsDkTcZb/V9/5VL9tKLTVoNPMML4x9qV7ubMNvijzlk0FcvdBURJe
         rxqBsNPzpHtnc4SxiNc9Z7qOsOwSbDS58mhIL3TYo6AANXpBpUMcBamkM5ZkB+8us0Vz
         ml4qwsC4mQW30WpG1MPjLTTuqjIerSL4YJXt5PnAXWeQVG3clGtOSlcPURaM5Kjndq7S
         pgdNq0Fbff1HM06ucaTWluRGtrUPB4nHfq9cYIBk6Yr1QDcQ2RFLPitSKgq6wUYYOh/v
         TDkw==
X-Gm-Message-State: AOAM532v0Qyp8watmtaXFh97GDZdHnDWlV3JOLLPsynVTUMcGCM2A8uQ
        Zm2ePX45k60ViF6bsMXck6k+fw==
X-Google-Smtp-Source: ABdhPJyS9XP4YCoqUaBjhLeuRUQ9UT8/u0P/JagyRIv7kOHQ0VczNWGDL9Y5QXsspb3Zhc1ijTu/4Q==
X-Received: by 2002:a4a:d4d6:0:b0:35d:83ed:12eb with SMTP id r22-20020a4ad4d6000000b0035d83ed12ebmr88624oos.57.1650551232749;
        Thu, 21 Apr 2022 07:27:12 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: (subset) [PATCH 1/3] arm64: dts: qcom: sm8450: Add thermal sensor controllers
Date:   Thu, 21 Apr 2022 09:26:50 -0500
Message-Id: <165055095989.2574292.5086269721501386213.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220410234458.1739279-2-dmitry.baryshkov@linaro.org>
References: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org> <20220410234458.1739279-2-dmitry.baryshkov@linaro.org>
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

On Mon, 11 Apr 2022 02:44:56 +0300, Dmitry Baryshkov wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> The change adds description of two thermal sensor controllers found
> on SM8450.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8450: Add thermal sensor controllers
      commit: 48995e863307bf08a51362a0aafb10e70bdafb4e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
