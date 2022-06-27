Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B25A55D118
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240923AbiF0UEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241007AbiF0UD7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:59 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F66C1C933
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:59 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id l81so14334995oif.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XNfcJEGE5VeJcaSJmH6wYZAst8nPhZtvYhkILSijpK0=;
        b=ndsdvUK4AAUrHcVZ1J4HwNh23+J9c+ZNsJPVvCmjyaXb51ODwpjv8b3VR/Swx+FGXS
         BceDBZbmpWbLX6qNIL1KmaAAF/+2x/uCkgO+lsu0UtYeL0ss6YQYWuB3tsR635rxs3Cf
         qJHkKgG8tdEVucAmbvXX9WiwsLoBSy9L3y7F8gg+2gZHPW/rUJCigvr9q9MU8lw052CP
         zX9jiFAIC5wXZxkWr+iE50rpXwX2aGiilm1EgiWSeKflJlxd0B0W4ujYYLbcKe0iHx9Q
         rWN9TuNuE2poon33dSpk+ZPfAPczGNvqPrt4uii2FhvRtWxOUiorN6bazddjkSaY1Sow
         G+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XNfcJEGE5VeJcaSJmH6wYZAst8nPhZtvYhkILSijpK0=;
        b=gsK1+DXXJv31EigfQlM6IBv5rFN4YPO9baz1J1dTYIH6/fJP2Abu3iR7waNrgt+IEF
         /9DWGEc1tLbgDCVnxUEajmTRa76tU/t3fzBZbXKxdPFDodH0LNXfi1uOksvWmz34rNoJ
         1NGKOPZDGHQ/T/SfKmV/t9MtMGfLDIUfnbPgu3ApPb3Lcdt7GDjIHgWD8Hpcx9z29N8H
         XoAsamaV15EEuoIjeHqISzMLnKhB+TkeiO6MQF8V8XTALi8Ig5uxZmqMsNWCk6sVSAW1
         NUt5mhToZI/weCYwfaAw1XZ9drID9lsvenYabai2PxZnYIW7FYJfuFnMd+FPOsSKHnO8
         /iTQ==
X-Gm-Message-State: AJIora/DOcijNt53Acc48nbHcSalTo47dtFy6pWqL4i4wSiFi6XsJqnC
        KsfpLO+dZeuBzp5DIIHca1/svQ==
X-Google-Smtp-Source: AGRyM1t4SlUC4fU5SXrb81Y8uVsAPJ87BS0b0ICBHEeIvOz2iUFpcj0q1aNfLM1V902xikJ5hhVnjA==
X-Received: by 2002:a05:6808:f12:b0:32f:7be5:9d5a with SMTP id m18-20020a0568080f1200b0032f7be59d5amr12137113oiw.150.1656360238767;
        Mon, 27 Jun 2022 13:03:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sm8250: Disable camcc by default
Date:   Mon, 27 Jun 2022 15:03:09 -0500
Message-Id: <165636016349.3080661.7786445899115469360.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220518091943.734478-1-vladimir.zapolskiy@linaro.org>
References: <20220518091943.734478-1-vladimir.zapolskiy@linaro.org>
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

On Wed, 18 May 2022 12:19:43 +0300, Vladimir Zapolskiy wrote:
> At the moment there are no changes in SM8250 board files, which require
> camera clock controller to run, whenever it is needed for a particular
> board, the status of camcc device node will be changed in a board file.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: Disable camcc by default
      commit: 1b3bfc4066c34da2f7808acf16344ac43722c2b7

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
