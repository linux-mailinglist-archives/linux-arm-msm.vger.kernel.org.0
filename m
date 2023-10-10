Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4BB17C01CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 18:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbjJJQh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 12:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjJJQh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 12:37:57 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77ED4B7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:37:55 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so55532105e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696955874; x=1697560674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28FsmsxBSnUs8EmJUEgqHqFQ9eCoGaSDrH/d3p/nXA4=;
        b=WYUzaJR6dofsl/GgGJeRtAtCZ0x3DUo7mhFGX/ES8OT161uAdUSClPl7tO1+2F4ww8
         ybi+4S1iMTcT4zLSmnAuiw94T/6GFbSsLgfl7jaKSp0/BKr6xGul2XM2Sf4POG0O2VGQ
         qSYfiyWLshIRxIkr1ZExzUdyC63DOTu3WEb0PRTyCkMI+/EvNj6JAhfZkyfCWAVZtk2q
         +FtyFX4YN8RqzyFvBeuEINyc8iz7Gh9A0trpUyq0SQ+EU/WueZ1QSkkLr9fEOy0VrBM4
         qt4d+KgBIro1MH7BS4+bQDe20hx1xgRDCt7Uk8s5dW3ulpTlvPKQe+fW+PXDtzJPaI5J
         9Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696955874; x=1697560674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28FsmsxBSnUs8EmJUEgqHqFQ9eCoGaSDrH/d3p/nXA4=;
        b=n2GH5PI9hFERXBGPnQI6glNNUIWNlAPQXNgpgpDQEcoz5DH8xyhVpQQkNBWp8TRKb4
         76IxOMbnkVYNCBFlXjsHhncUt0QMnBIsz0tGRD7WNWVrSb3EhttipjznpIiq9u1mRLbI
         Of/zlW/87nhyCpn4zbdPzg+B+5RAlsV25/aXzUi0O7jQyk1kod1PvW8Opvvg+iHE4FWC
         wqKfy8Q8K8agTve7R7h2ZCuaLyLdBQOJOJzdxaUXwTIIK5Y3CmPNT7O/V4q+z+r4K+tP
         KAh/67p2W+qWVz1cjl0EbeqnxDgq/+5pcy3ltwSJYCPJZtcqnWFjkUODZeFhZA0lDzL+
         ItJQ==
X-Gm-Message-State: AOJu0YzCev+jivqDwpAcaw1tLZgiNaaqlqr4x1+ZazZA9j9/mwZ7DK0C
        zSJYBpPoqVbGvoOgaJoEPtpitA==
X-Google-Smtp-Source: AGHT+IHpggw/6Wzqr7mlaGRW5zJRTbTQYJV+r5jXJ9QMDpy9OgyCEkRyV3yHIsxz8TwemEWQEt7Zag==
X-Received: by 2002:a05:600c:2298:b0:3fe:1af6:6542 with SMTP id 24-20020a05600c229800b003fe1af66542mr16753039wmf.33.1696955873876;
        Tue, 10 Oct 2023 09:37:53 -0700 (PDT)
Received: from [172.30.204.182] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id bg24-20020a05600c3c9800b004063c9f68f2sm11675343wmb.26.2023.10.10.09.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 09:37:53 -0700 (PDT)
Message-ID: <f189b1e9-e1cb-4bbb-a138-b10322684b09@linaro.org>
Date:   Tue, 10 Oct 2023 18:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mfd: qcom,tcsr: Add compatible for
 sm8{2|3|5}50
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1696954157-16327-1-git-send-email-quic_mojha@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1696954157-16327-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 10/10/23 18:09, Mukesh Ojha wrote:
> Document the compatible for sm8{2|3|5}50 SoCs.
sm8[235]0 would work as well ;)

Konrad
