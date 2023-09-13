Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6736079E227
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 10:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238917AbjIMIbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 04:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238914AbjIMIbL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 04:31:11 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CDC19A3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:31:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52e5900cf77so8396801a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593865; x=1695198665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7nzo0mBjENVNjwT1E8eun5DMzL5PxsMw02AU6pjHR8Y=;
        b=wJfxyEYl+JaKjAueT7uGDJq8VMZuZ4iPa1jMlLi/5pyyV2DZakmjOlso39oZblFPif
         UJfIuQGUzw/emcZXeNpoa+9Op/pETTIwv684se7gwN+GJ2jsrL+BAdYNv2s8yDTggEpQ
         LH4QwuT8C9dqXyTdwRh/SkQ/rXSEJq2nU32XDoDPG6DnG1MG93x3B4kwXGY24kYcYNUd
         dFuqGeNTOvngsFOmkyZr8un4swNfAvgIiTzDshea7VD3nGysPnC8AwygSE4UwC4PKPqd
         DG5+PMr6ij1JbmSKGEZUZsDKybwgV8Bcp7B7ixGoD1nzp/PkviZSjH9vTLl1cGYSeKSf
         Iiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593865; x=1695198665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nzo0mBjENVNjwT1E8eun5DMzL5PxsMw02AU6pjHR8Y=;
        b=b4KFf8Fql4UI370+8bB+6VrMrIathdlCwQRiqA7eMvusnGEheJ1RfbO5USER0L1aRa
         tAct0ZvpD2AOEoc/igDpChWgxon3QBdY2BFOdKdPA2pIOo0N89ZekU6pvkVKFxnn8l/t
         z/+BNk0NcOMT9HoC/I3JWGiPTJqEYQ0ej5ilDotuDIV5ZhJu3DLUrQnmeqRjx+g3ESOl
         46ADV+aYX/Dy8UiomsJ2oEZFeH4pViYBdesUtsg5k6f4VsDc13z4pN9BMtJLMspEyf9n
         SIF5QUb3vMmjzNWvOPAvHZvq5qecfHXGiie8TM1OJdKirbWOxLpd8QucGOxhx93DlE8y
         lGzw==
X-Gm-Message-State: AOJu0YyYgP+EKl8VDwKR83EAL5Tc3kCcvGWx4uM4EggF8gouUGMgvNYi
        7OG93q+w9u8QzN1dIeoCcqxeAw==
X-Google-Smtp-Source: AGHT+IEDFU8uo2jjcapIncoL4rTY3D/qN2Y6HW1cFyiDzc+yf3VRdkx09zjwKC2+qlHYMrZdHuj1Fw==
X-Received: by 2002:a17:907:6087:b0:9a1:bebc:8282 with SMTP id ht7-20020a170907608700b009a1bebc8282mr1194759ejc.32.1694593865173;
        Wed, 13 Sep 2023 01:31:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id gs10-20020a170906f18a00b009a13fdc139fsm7992352ejb.183.2023.09.13.01.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:31:04 -0700 (PDT)
Message-ID: <787b7fd7-98b9-518a-01ac-7bcd66eb3311@linaro.org>
Date:   Wed, 13 Sep 2023 10:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: qcom: Add GCC clocks for
 SM4450
Content-Language: en-US
To:     Ajit Pandey <quic_ajipan@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230909123431.1725728-1-quic_ajipan@quicinc.com>
 <20230909123431.1725728-4-quic_ajipan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230909123431.1725728-4-quic_ajipan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2023 14:34, Ajit Pandey wrote:
> Add support for qcom global clock controller bindings for SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

