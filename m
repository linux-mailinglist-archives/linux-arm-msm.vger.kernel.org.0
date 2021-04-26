Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D19436B2AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 14:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhDZMCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 08:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhDZMCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 08:02:54 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14171C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 05:02:13 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id r7so43599855wrm.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 05:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dlXiJtCn0s+aaDuctWLM7HtLWjJzy8K6ynFsRo1e9Mc=;
        b=KtUUkdpd9b1BZDqOUu9VsrBbLlN7/sRB8xKXqraMzWh8tLUOifgiF7gA5ROgD0XZZQ
         GC/kqdgAuNAYH05p6ilYOoCb6X/CU+07hlsFcz4HaboclAw3CGUWYYZdznKXenKWcitw
         CFIb/Ybo1NJQU5GJOnO+Vnxvz5vsOQeMuymOaEBnQcQ6GoVxgjvx1hgZly6xrY4tlm+o
         VdX+VADYdAm07kvq8/2MYHTCyX1i/8TSgX1kqPxJc/fh47Nz2+AoTkf5wHcxXwbgD7tR
         Q9eGc0I1M62Ss+mt85q8LTIYT3ziX+8TIkpYrVb9NpEBvuEoFa9AEXM45jSuwt+sSFYd
         uONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dlXiJtCn0s+aaDuctWLM7HtLWjJzy8K6ynFsRo1e9Mc=;
        b=UawYjnvuuy2L8zOZf8ypZHdkamQ6TUDogopyjmh4gFHBb4FDTF1KEFtiCYqEqLAjG3
         RZdiWILkJDqfhiXj6CwXE5oss7VDBK06GCMk+wepUgrBbfKY3VVJUE2RbGeW7hCdecua
         0yW09+9gxAdCbzR1GEh009cnU8zmpwOUzXIcsUHBMHeL8MDgroyMTECBVX7diXLTiCHr
         hpu8hGg6r/8876Buk6tUaeOrQV2Vfv9lXdBZBZPyQeANiJQvLQCsgcZk7GkFMnvEC16s
         UG6K40lA6QFtU9n0QdMyi76QCaiMVdjdiqvt6KF4c5tynQqRAyLZgzKuKnvwDSKnyO+6
         Ot/A==
X-Gm-Message-State: AOAM533dQz7ZvV2fBlX3RQPopSTLv3kO5pznPp24qaoHbWlKy8qtVh24
        PkFwtbDMzp/WnRkqN8OXnfBvDA==
X-Google-Smtp-Source: ABdhPJyTc2fkLuXmgK68TyYD8RdgPfGi1FfadAmiAGZHkC1QleJ5aJX5zoXJKuMXKY7liIRlAEXBww==
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr23425336wrz.105.1619438531812;
        Mon, 26 Apr 2021 05:02:11 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d22sm7385598wrc.50.2021.04.26.05.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 05:02:11 -0700 (PDT)
Subject: Re: [PATCH] regulator: Fix current limit for QCOM PMIC VBUS
To:     Mark Brown <broonie@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org
References: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
 <20210423163203.GF5507@sirena.org.uk>
 <a2152494-4e8f-27ef-07e7-e575ce3ee653@linaro.org>
 <20210426115548.GA4590@sirena.org.uk>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <c7f797da-f5b9-5c95-4664-efadf4e7b86b@linaro.org>
Date:   Mon, 26 Apr 2021 13:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210426115548.GA4590@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2021 12:55, Mark Brown wrote:
> It may be out of spec for USB C (though I can see someone choosing a
> limit of 2A to give headroom on a specified 1.5A limit, AIUI the limits
> in USB are on the side drawing the current and there's no requirement
> for the supplier to enforce the limit) but that doesn't mean that the
> hardware has been designed in a way that makes it safe to just increase
> the limit.

I get your point, however, the downstream kernel i.e. the kernel that 
ships with the n-million qcom devices sets the limit to 3 amps.

To my knowledge all qcom downstream hardware/software implementations 
based on the pm8150b set the 3amp limit so, what we are doing here is 
closing the gap in upstream.

---
bod
