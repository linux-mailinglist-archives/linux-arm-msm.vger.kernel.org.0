Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F230D700AC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 16:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241571AbjELOyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 10:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241617AbjELOyu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 10:54:50 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3856B100D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 07:54:40 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f315712406so325594605e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683903278; x=1686495278;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/c6xQdMNlqD6BX9rAHAsLSjJBDh1LbniTf1OGAulrY=;
        b=U2JR9M3KsiuTLgnyul8FlKynONlWgVFiVIR9EFUtuPYv4x+DUoZEI3pmNxbDCbASva
         c+0KKSPZhLfwTHLjqXbliWEOANLEqAmcL8T8R+HJICchD+HG4OonhZXLOBSFIKAD3SXc
         04DmZBs6n/QMuPSv3V44+n6HLVO3i2PVh7uyxe9UdDnq50xjAj+agCWMGR41NYgw31rl
         MmeCGXLRFmqjEnnH1VHvkmOeHbzGQ6+VNqu6mMQge/xVCOp2uxJbUeRONhckqoXOjugb
         sb5vzECoctwRRvcs6jTisujerrpzoMP7nFfJbe225QyRd9aOAbdfWfaUrod6d4U3iPXc
         9nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683903278; x=1686495278;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/c6xQdMNlqD6BX9rAHAsLSjJBDh1LbniTf1OGAulrY=;
        b=E5ZsFaGFp/0ExW5PQBFfyv8y3afg1YNj9/CVZJ1DUnHbEXaESqJx/Kus/VD129Q4Py
         a3AFgEio6KujSMY2zKzmo5e3kyUasRnvMGflDaCW9BAiSVRvNMGORsRpFmTmPg7okGjg
         nhtOWqjyoZPusP25q7ZdfXcF8s9JHsq4gvWUT99sQuk2QRiLsKUt0Kwtdmjccx4NAATt
         sFlwUR5sJQXoDS2HBzrmuVQvUwm6KLl/gbKoCRAAS69cExfMJIm0FYp2UXo5CzBDviWt
         rCCn+jBkmSc7CN5axNReAksove7BAMcLS9gFkGKWmzUWFJF8tbkyKsTCRF37fY+0eDj6
         ZPAw==
X-Gm-Message-State: AC+VfDzgfbgRXBUN0bMFbetog95juIRgxj2i+qF1jV8DuKCKDtG3JQ1w
        qsQB7Tb3Wq1ksc57sWvQZs8gtQ==
X-Google-Smtp-Source: ACHHUZ7STIqlliSH6S01kSMH6qPCsoMbcUPRMKbDI84fu8KRRpED6A+uJUgkCvv/6LOelckEf5mwxg==
X-Received: by 2002:a05:600c:2197:b0:3f4:2158:28a0 with SMTP id e23-20020a05600c219700b003f4215828a0mr12511244wme.12.1683903278554;
        Fri, 12 May 2023 07:54:38 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b003f32f013c3csm28953540wmh.6.2023.05.12.07.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 07:54:37 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, bkumar@qti.qualcomm.com,
        fastrpc.upstream@qti.qualcomm.com, stable <stable@kernel.org>
In-Reply-To: <1679394100-27119-1-git-send-email-quic_ekangupt@quicinc.com>
References: <1679394100-27119-1-git-send-email-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v1] misc: fastrpc: Reassign memory ownership only for
 remote heap
Message-Id: <168390327749.185210.3662822283273466169.b4-ty@linaro.org>
Date:   Fri, 12 May 2023 15:54:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 21 Mar 2023 15:51:40 +0530, Ekansh Gupta wrote:
> The userspace map request for remote heap allocates CMA memory.
> The ownership of this memory needs to be reassigned to proper
> owners to allow access from the protection domain running on
> DSP. This reassigning of ownership is not correct if done for
> any other supported flags.
> 
> When any other flag is requested from userspace, fastrpc is
> trying to reassign the ownership of memory and this reassignment
> is getting skipped for remote heap request which is incorrect.
> Add proper flag check to reassign the memory only if remote heap
> is requested.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Reassign memory ownership only for remote heap
      commit: 5fad4a6b2d8f05c4823a08465e584f46df798b1f

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

