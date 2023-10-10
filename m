Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3B77BF87E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 12:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbjJJKWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 06:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjJJKWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 06:22:17 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1554094
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 03:22:16 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-405524e6769so33029705e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696933334; x=1697538134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOnXO7EKaf0EOokobQtVAAu2tx5uKFd7+PWdPbsHLfU=;
        b=zKbw8sinNvKnLQtOkwNul7+frWAb22hD3P5ancgXxP1d/Q8Vh7EgsVsgVd+EOU3PIo
         guceTDCCzCyfEiQU/P/n8H57WX6fULqveOHpz2CoC8eM8C7hhvCecvvh5tJW1d9+MdT3
         LcBAUGzeD7yqctvIigExM4JT37Zhj+ZUHBglFIsjxEaALGG1s+JJMFFT1lLvPhAzcPWp
         mhbyNVxOKlao/y8pVlRtoPzvh7hw73PoMJeMSYk5eMIYDa5xzCMof/FeK4BjbzR4PkAE
         tRI/MRPe1/JtjeQDI5uI7UL7/ZTIj8fED6jGK5ZzqO7fieBrVk+efa/OEL5vOuIIN0aX
         9iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696933334; x=1697538134;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOnXO7EKaf0EOokobQtVAAu2tx5uKFd7+PWdPbsHLfU=;
        b=dn4BIKy0++rPB1wuj3qSj/R28dsMCIUxaASBFXfTQ9KjFiSftqv/lR3Ji1CZPVb0+R
         rroMIlxN/celrJMlEYmxsJjiLksx6lrnYpTffY1yvMePAAKGCHmT43BHT8CuQlBdV3MC
         gWunmTM7UPvSphiRlXpSMXnfL+cDk4W57XOSiwuwI8fJZNVjgvglX8HftyqX/ZUA0rvV
         kgm2MUMCjxt/5KUEk0oS9P74jB//zBPp5b5KMGEiqFazI/G96KFBAjqs6SIAn7m0l0pa
         UKxhTWJ31zkanMcuUBK3zEbs5UxkTeRvTa3UmiTHwyr1D7XNLbop+dZmt8klgSgeT3Fe
         ZdMQ==
X-Gm-Message-State: AOJu0YzGkF+4X8gYiWxjSZrRoenqFOpeBHrCWDt7C8JSY6gA/WeQope+
        cCooOdg9Bktl1Z5T41ZCjOEJjw==
X-Google-Smtp-Source: AGHT+IFUeBm2O24A2BrOv84DLfJjrqB87wIDcheavX/dGTttVBzeSNynZC957qRv67a/24SqjxErcg==
X-Received: by 2002:a05:600c:5189:b0:406:5a14:5c1e with SMTP id fa9-20020a05600c518900b004065a145c1emr12038758wmb.1.1696933334375;
        Tue, 10 Oct 2023 03:22:14 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id l34-20020a05600c1d2200b003fef5e76f2csm8004398wms.0.2023.10.10.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 03:22:13 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com,
        stable <stable@kernel.org>
In-Reply-To: <1696916367-3131-1-git-send-email-quic_ekangupt@quicinc.com>
References: <1696916367-3131-1-git-send-email-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v1] misc: fastrpc: Unmap only if buffer is unmapped
 from DSP
Message-Id: <169693333362.116551.3621782633535162294.b4-ty@linaro.org>
Date:   Tue, 10 Oct 2023 11:22:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 10 Oct 2023 11:09:27 +0530, Ekansh Gupta wrote:
> For unmapping any buffer from kernel, it should first be unmapped
> from DSP. In case unmap from DSP request fails, the map should not
> be removed from kernel as it might lead to SMMU faults and other
> memory issues.
> 
> 

Applied, thanks!

[1/1] misc: fastrpc: Unmap only if buffer is unmapped from DSP
      commit: d4ed3ed0086f03f210a6e171a581c332dde9e961

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

