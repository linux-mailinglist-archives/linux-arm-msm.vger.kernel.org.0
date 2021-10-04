Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6004207B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 11:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhJDJDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 05:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhJDJDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 05:03:20 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9760C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 02:01:31 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id l7so38361097edq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q3MZIqZDXegBSXIvBEMS5cUbXEk8VGglzQRc4EcONxg=;
        b=GewnubD5UIDtsgS/vO3SqD3Lp1e1ujOByHgoXS2PNKFieGqx6QwbKixv+gyOKCDZWs
         TbhBUq8u2fwjw8WzOAeUdZztsoK+mCew/UcQnRw19fM1rCgXMl9p9NXpg6t5McKXUMn6
         p3Ib4GmbJrEOcqzUf+13xIIv+J/2auic2TgcXYM3/fqy0TjML4pksBSodXuTbVYzZ+YF
         6uakSZoO1rygm8iAZGDa4BFYMaRUydMpndQFZ2kJeOoAR99tftbsMVf1zwxG2cgDk0ql
         7JX3rAGO6PMWAKwmm2p8PhHkQVKSCDHSRYqkQNdEY+nfU7OKBbl59CuF41xKk0Keu59X
         YDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q3MZIqZDXegBSXIvBEMS5cUbXEk8VGglzQRc4EcONxg=;
        b=M7Wj5bSs8wNvBJ5Ri/iqFD7W8cil7MD5AofZCgNjSUjdxfXxQInSrUMrqom2SwIg6J
         ZSHHDShrj6/XIvdCc+RB4TGIyePOLG4tKU1lbCu+Bau0KPoyfS/pQsVP7POc5sfVqmKe
         svFW6vFewYY0ZW5lpv+GvULfylq1WJ4rybhvgDtEu4qqFzIcvurRDGjn1ODRLDzcZxUf
         YVfOBR+YJdpK5Fpqswh4/sB3MkJ8CqAbmlnss1S//+leyx8XpoL7H4LknzlemTHobdYk
         UoNR+r8/PHpdUxwO3xCLZTwpyDgGQLUCNXoMCF0CeZcl3uZUcYExz2BD/BcPwKWLuJCF
         QucA==
X-Gm-Message-State: AOAM532xiCQCzGQyxx2sMBX8ElHParCBarKaJhjUhG2mE1ekxWw2/HCT
        UHg9mspBFsrxFK9nLy9T0Z5sqg==
X-Google-Smtp-Source: ABdhPJzQp7/tTml8Hy4AY7ZI0ADwKQ5HYvKR7HzlJDYAuJQcyUPufcn7tceWa6w1lMFK0BvE6l6mNw==
X-Received: by 2002:a05:6402:1b8a:: with SMTP id cc10mr16295980edb.313.1633338087640;
        Mon, 04 Oct 2021 02:01:27 -0700 (PDT)
Received: from [192.168.1.15] ([84.238.208.199])
        by smtp.googlemail.com with ESMTPSA id lb20sm6248548ejc.40.2021.10.04.02.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 02:01:27 -0700 (PDT)
Subject: Re: [PATCH v5] dt-bindings: media: venus: Add sc7280 dt schema
To:     Dikshita Agarwal <dikshita@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1632817373-25755-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b7ebd135-6bf9-b6de-d6fe-eb348c54c2bd@linaro.org>
Date:   Mon, 4 Oct 2021 12:01:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632817373-25755-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Thanks for the patch!

On 9/28/21 11:22 AM, Dikshita Agarwal wrote:
> Add a schema description for the venus video encoder/decoder on the sc7280.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> changes since v4:
>     fixed missing dependencies.
> 
>  .../bindings/media/qcom,sc7280-venus.yaml          | 162 +++++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml

I will push this through linux-media tree with Rob's reviewed-by tag.

-- 
regards,
Stan
