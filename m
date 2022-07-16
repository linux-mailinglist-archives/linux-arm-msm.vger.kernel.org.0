Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F48C576FD1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbiGPPTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbiGPPTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:32 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9794A205E6
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:25 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-10c0119dd16so12852866fac.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZQ+Qsz5zgM9FsGolE/SVUSRHh3M+xTy+9KH+0BNOcjA=;
        b=nbgMNkiwe9xlZW+2ezPj0lDg90C8k/xuG5XfSXrsSNhEL1sOjmPwVQWZinS8Cspgtk
         5mqMr3c8JPCvA8lR0NFLldOkY9W7beh7bEE3T+W/8wSkrTUCw/EaUypoV6KVaKNbbywk
         zsZCFBdB+O2Kvot1hS2AeWe5596CnwYyi+bXrS61mc64SUQ+T63Vmj+qEefhWZ6w3eE1
         5NZ5NH8yv2mF/dXPCWv3G7XedPOTVIKiQLdQr1OWDnpQ3lxU1zRNU429mHp4eUzS+jE3
         7wZLlZQtVksvtLRQ1f3gOOVh/jzhYN/AXHs2mysEiSUzdfPSPNbVg3qKeXjrfBZyQhXn
         otdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZQ+Qsz5zgM9FsGolE/SVUSRHh3M+xTy+9KH+0BNOcjA=;
        b=IWhX0Vc+xSayRP/hHn/lNrCU1Kv6K5FKFu8TVPr63iIGVc92M1gBG09afBZCZADaB/
         zg8N5zuBYrsdpOTjDLR75PugLbLAnYRtPoXpjBCmwD/lEHbktEtHkX77WzUyf/aMoQ0N
         hrQqDz5IoNoLlHDzaFQBrux1irFGuLPlJBhItSw6cMKeDnbgE5U+zE3tsdge3cGIxm4b
         ncGS8Zky1/8r0N4NrCVgDwwJLIQcmIE0fUSi8lZOcJ8tpkgsSxb6c9jZoXZr7IJbB87z
         3UiT+HG9VfnSEZgI51Qf/0GcADctrB1KV7H7jmqPM8033zXA6Xi/1E9pr/0NQLG2GZkX
         QhoQ==
X-Gm-Message-State: AJIora8PHxGoU3k3sASgRBju1Gk/OQzNAPffxCjk9ZRZxMkI0CCMsxIv
        XFoXaBTaK+1Wm0VcL9cMc8OveJ8J+gqNNw==
X-Google-Smtp-Source: AGRyM1ujAHW/0attGZNaMS40qL0pgNP86ALPCbbNnxdU+XXA+URVNTSxqECBfkRHN7ua1zH7jc9y4A==
X-Received: by 2002:a05:6870:898d:b0:10d:96:732d with SMTP id f13-20020a056870898d00b0010d0096732dmr6112650oaq.107.1657984764901;
        Sat, 16 Jul 2022 08:19:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Sumit Garg <sumit.garg@linaro.org>,
        devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, mworsfold@impinj.com,
        bryan.odonoghue@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        andrey.konovalov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        nicolas.dechesne@linaro.org, daniel.thompson@linaro.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH v2] arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
Date:   Sat, 16 Jul 2022 10:19:07 -0500
Message-Id: <165798474064.1679948.4116544372157778043.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220711083038.1518529-1-sumit.garg@linaro.org>
References: <20220711083038.1518529-1-sumit.garg@linaro.org>
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

On Mon, 11 Jul 2022 14:00:38 +0530, Sumit Garg wrote:
> Currently the DT for QCS404 SoC has setup for 2 USB2 PHYs with one each
> assigned to USB3 controller and USB2 controller. This assignment is
> incorrect which only works by luck: as when each USB HCI comes up it
> configures the *other* controllers PHY which is enough to make them
> happy. If, for any reason, we were to disable one of the controllers then
> both would stop working.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
      commit: 58577966a42fc0b660b5e2c7c9e5a2241363ea83

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
