Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6DF576FC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbiGPPTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiGPPTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:21 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEC91CFC4
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:20 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id k25-20020a056830169900b0061c6f68f451so5646156otr.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yr9AcP6Q9m+AFtN5e8B4KVnxj2haGWiQApKKEeYW7EM=;
        b=YY6N4hZmSUhhQmS94vIOqkjfJl3rP36QV7Zy8V4onsW5KE1l+YOINu0tbQ5lBbW6f9
         IHFqPMP1Q7mtEUjqnMd5TD+yfPIohQwhOzRSXienIUExTHEPPS05PAc1xCpprBnd3Lb8
         o4oFuMp+KAMGGNCwdizYzZpEsyjJDW9q+JhaQhxcICUZIoU0kc93ApXWeqsZVu3PmsLH
         JdyUPg/ttn39+7w1UAxjDoOlsO1+auUV/+nmWGZB3/EgDy+kIS9QpPe2yF9Q26yG5nfS
         3essKaqqptma6lj5umOnxeDZCMW6J+aBTuqvZslzU2GqErN4csnHcDeXbJft7YvMLUVL
         U2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yr9AcP6Q9m+AFtN5e8B4KVnxj2haGWiQApKKEeYW7EM=;
        b=0TpJBCYfyy7gzqd9NdHW/IGKr/iEDDdbWDZmVQCBDj2pubWFbGHfQz2vUIxFU/L8sA
         4NrLzHGOKrK/uuemw+iZ/58XTqrD8n0lRTD7KA6jrtV5qBKlVkgDf6c69X0Zv7Sh0sZA
         ANAm6yTW2RzrMVkG/+7X0fKmqs2ZOT5U7nchprSZcSYLd4sIcHi3YMQ+cz2fbQeNUEyf
         9DCb/fh4aZxaYTjmLVRYaplOGAyOkZhYcbnyQx3RBD5GhMGTSbyd7jqkgc6Y/yf8qfQa
         QItXWF+eyBaNDt0FLr1nJTkw9Fe0GkaemwzgoX+PraIgSghzGkIHxLA+btmU9yO6uyvU
         E5hA==
X-Gm-Message-State: AJIora+QG0sUe9M5LTXaQKpxhtkFcxshTZRLW1XCHZhepNpGwziKqTfe
        Fi4cdIsQPHnA0WBahb/FXsPLMw==
X-Google-Smtp-Source: AGRyM1s0VzvkawhZuWLi8ZYiH6UyOJOtEn2aRv40f543AAAZvwKvYegURJ5TMhvo1I/FRidcnibY7Q==
X-Received: by 2002:a05:6830:628c:b0:616:b704:344d with SMTP id ce12-20020a056830628c00b00616b704344dmr7676983otb.209.1657984759636;
        Sat, 16 Jul 2022 08:19:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: fix the smmu interrupt values
Date:   Sat, 16 Jul 2022 10:19:02 -0500
Message-Id: <165798474064.1679948.9455837410937483640.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220711174133.28882-1-quic_ppareek@quicinc.com>
References: <20220711174133.28882-1-quic_ppareek@quicinc.com>
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

On Mon, 11 Jul 2022 23:11:33 +0530, Parikshit Pareek wrote:
> There has been wrong values introduced for context interrupt for
> smu node apps_smmu. Fix those ones with due correction.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: fix the smmu interrupt values
      commit: 1189a9cf144a745e4b98ff4f6cf5f79ab0b56cfb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
