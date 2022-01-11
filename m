Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D169F48ACC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 12:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349575AbiAKLjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 06:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349600AbiAKLiu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 06:38:50 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60241C06175B
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 03:38:44 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c66so10770663wma.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 03:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pnu6UGDbRBgjoNjjcGKOnQBzy62GDlgIY1ryU4MyGWc=;
        b=HUn4eE5HzYGaec4AjypMC6I4AKWKzpM1AUB4v62bI4o8GZImBjO0M5bSc5yWhKJ7OB
         pJMcNKvDV1znmDIgX1ud7AGxJ/fyaQZ+VUHh1BDc0WaY6qx3YNGHeJoH8MDeUqE+aZD6
         kPLgL3pS+oUlwAitQ1l7ywSoNQzD0ElU4P3kOWEyKC7sEyQthuRA8je5JTRaic3Ufgfr
         JDHIQcTM9i53QaIYv6q5XCHuytK9v3L1V4LL12eSxaVIfK8U9dz0KlICy5Z0IoSrrjuX
         gQSrOMQjQz4hIyND+fTCXUCo+9UVSr+4xWObZ3g1yE68b53dMqjgwjvQGMxxgme+qMgK
         xNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pnu6UGDbRBgjoNjjcGKOnQBzy62GDlgIY1ryU4MyGWc=;
        b=0vsTad9MLZfBbF9VkcbcBQ+9lfiUsZ65pzoEqgYW+jfbzF5abDzyiN9mZlINokAbw8
         1r6Tvo5DHHB0ECqZ+KBzAXcuLIAaRLYtsXYUgfqB8g7w7/3cu1GN0N7D7tzYXHbA8+ld
         PxeBF2JHgeY/u0zqVb0IC7OXQyHsg6apREcqTItjc1OXKA+O8Ur/o2CTX2vqOQrfSjEe
         Ab2QPGcGMo0zhQASKkqq1zGYJZb+tTjPM4dUdAUxiaKnaH93ysOQovr4J0rz96irpfAs
         057tzFkBttNxEYOsbhSAWvNYJj699MkODxlundbi2qGUVnRWcYrHIODndVk1IPCR4hOm
         wK4g==
X-Gm-Message-State: AOAM533amJIhBfGLz4kWNGRcf+OnGfPZCMFNKvz2daj9lEF0UK8qg5R5
        p/QoWR3L+NNe4pxF959aA3CpCg==
X-Google-Smtp-Source: ABdhPJwbVYafRNnknTe4CZGxfyCwOWDWz/KyuCbHQv+3IZoBlFUIlEVsfsaIxr23TurFf3xY1Zs4JA==
X-Received: by 2002:a1c:9acc:: with SMTP id c195mr2097836wme.10.1641901122959;
        Tue, 11 Jan 2022 03:38:42 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id ba18sm9269272wrb.40.2022.01.11.03.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 03:38:42 -0800 (PST)
Message-ID: <dccec38a-913a-5b02-f02d-02021bc86181@linaro.org>
Date:   Tue, 11 Jan 2022 11:40:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 5/8] media: camss: Add regulator_bulk support
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jonathan Marek <jonathan@marek.ca>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, jgrahsl@snap.com,
        hfink@snap.com, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
 <20220109024910.2041763-6-bryan.odonoghue@linaro.org>
 <CAG3jFysaEh=ACt0SYun+8bgkMgts0JrgXkgt+VCtHBvqtUXj3Q@mail.gmail.com>
 <bff073f3-4763-cbfb-b462-40e7d55dc1ee@linaro.org>
 <CAG3jFyuVxjUtBgCyNyREsZPP8jucSOvE1uYevavkPQduGSHKWQ@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAG3jFyuVxjUtBgCyNyREsZPP8jucSOvE1uYevavkPQduGSHKWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/01/2022 11:33, Robert Foss wrote:
>     which means ARRAY_SIZE(regulators) == CAMSS_RES_MAX
> 
> 
> Gosh darnit. I even wrote a test application, how did I miss this. 
> Thanks for the clarity.
> 

np, I'll leave this change as part of this set anyway

---
bod
