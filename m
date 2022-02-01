Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17F74A5662
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbiBAFUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbiBAFUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:38 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5E4C0613E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:34 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id s6-20020a0568301e0600b0059ea5472c98so15127394otr.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LvAQN8dUS0+XkffJ1XQgKjOB8AsXGCjt9K5IDpVPCug=;
        b=xrHWHKvjSM6yZ9sW/la0fVwj2uTq7ONafyoMhfEEQppdnMoAP4pDml/QEl6Ojzx4Sd
         yC4La9gViReoOr+gFQtK6Cf4ckGvlOWf/ClNEZut24TW2ydHS5LnMe7UN2fUVbiWarBb
         mH9rmpYfSs9MoItrw79RJ4+OrKqFNf5hdnBBz53hzt0OFkdIlMZbL8sUB89o39D8RTM/
         Hm1eW6R6T3Cp4J9wuRqKOFhc4q8+S09dGEVet8Ye+9ofhHZkb4maNNtI7xkTXOR9Me3T
         26M7aUvAgG+FCWFoLsGxguSMLC0P/CcoaiFUwGX+885wzFAOYj8WYLBaDE+KmgYEVYh+
         hSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LvAQN8dUS0+XkffJ1XQgKjOB8AsXGCjt9K5IDpVPCug=;
        b=EYhGe6kMJeiN9QyddvcbOjIQseCMkeOwVJ8XDFVTVMtV7gc7I/mDPkQTA4rDVMQO4Y
         MRgpm8v4y76x3z3O2zpZm/Du327hrkYfvErD1BbENL/kslAfTwRhd61OCwRZ/8dc8cft
         FVxIdf5vZT4UexSmJOWsBs2Pmlm6qKUUXjA45Bkza/uBr9tzfCCX/I81e5qd+pLZ0c4c
         js6qiJhYa+Ra8KC7IKGkF94ofTFd52foEinitoe2XtHFInnzmkHaXPhEtwKBZYv0TYf/
         u5dFEItHRjiySebeT1JsQEzSa1YpAiS7Wbfc7mlv4uIuqieLjgRPn1bWZ+I3D2B4VQ/P
         H6gQ==
X-Gm-Message-State: AOAM5326bWqnqAaTu6GmnKY6gWqaTof7GmGF9LjVlh/dPMqg2ybu3h1i
        VP+EENqDjwLKO4olZUrPnej5AA==
X-Google-Smtp-Source: ABdhPJxtSe8cPKNC5PUUwFsEvKkTGox8FyK3dfg5Eg9w9nIPzmLbFUbR1gVH3JNCGtSqxJ9Hty+CTA==
X-Received: by 2002:a05:6830:314f:: with SMTP id c15mr4916828ots.28.1643692834010;
        Mon, 31 Jan 2022 21:20:34 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:33 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] ARM: dts: qcom: nexus7: remove vcss supply which never existed
Date:   Mon, 31 Jan 2022 23:19:42 -0600
Message-Id: <164369277344.3095904.3596257991206574402.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211225212000.80459-1-david@ixit.cz>
References: <20211225212000.80459-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 25 Dec 2021 22:20:00 +0100, David Heidelberg wrote:
> Probably got in by accident, search trough documentation and kernel code
> didn't found any occurences.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: nexus7: remove vcss supply which never existed
      commit: 3be5acc8586bde3884f61b78e915a468b01b3a9d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
