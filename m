Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1877E7C7230
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 18:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbjJLQNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Oct 2023 12:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235765AbjJLQN2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Oct 2023 12:13:28 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1F3EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 09:13:24 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-533df112914so1913454a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697127203; x=1697732003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MnFQr6jYAWszvBkm1ZQBSlRvBAO0cVodRWwMD84lNmo=;
        b=g5/kzYwX0+W5cx1T3YboYvLDu0ueSn4Bsf3UZ0wiEUY1R41Ti1Z0gZY/0hPtuuOiTa
         nTE2jP+K2cyR3qKAXPFjM18mG2vWBr0Lb0jSzlfq8g9YwDJryCH/DcbgBNhZ/UoGchki
         thLvJxE9hn/kp2uRH81XVUZ/XSf5qWtKF0KHDylF1R+NEmwad9yIlws7wupTEKu6FRVl
         DcEtJMMggSM/AifeWS3D0h2fshtu/sdYLPlcizl36BID9zmlEKEnoMRGzm0iYlTm3PoQ
         f52/PXpLnOpWEBv4ShFPn48l3xZH1Vc6aWqBRIhITPea73OetuQJaXCcrs3PUj8MMLDx
         WxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127203; x=1697732003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnFQr6jYAWszvBkm1ZQBSlRvBAO0cVodRWwMD84lNmo=;
        b=ipxz2XwAMtRV77V/P8gpNJrE2r+5lBPBf2PmKOoxIGAkMTGyyDFUUTC9gNxxAeUvBF
         guNdyXouev1D9b6EPG9eELLHHGq7BP3/YLlrYpPGMeF6rFZKA90zPG+Adu0kWI3OGeuT
         yQJZzQD00LpBt2wKP6a6m4Q1Vh4swfk0DvcEqlzAFnydgRK61aIhWQfQsFs6hR+Qec9M
         MyOZ5mvfkJGLpVqlmWmGHXfZ+b2v72ohnFDfRnh5FgaQ3QFLAYn6uiqXhP7cw7dWK5RA
         yW7Q3aClvwA0I7wKh2lDd4ORleXB7763RGltIu7cjLzX7AFn4Rzn1V9b7cC0l1cYJ6xb
         9OIg==
X-Gm-Message-State: AOJu0YxCEW5Ie2JeIDFj/se/Ucsy86/plkZxYVwq63qxIwudjaj/z4vB
        jUQju/Bl5B0m5meAH6auAGvuzw==
X-Google-Smtp-Source: AGHT+IFOiYf0k5d4B4vLBtX0oIcpHRdtEKqYYefcW1oOnsQ3xCONkHjy1mgRmErlEYAkDMqxvkKKsg==
X-Received: by 2002:a17:907:b12:b0:9ba:246c:1fa9 with SMTP id h18-20020a1709070b1200b009ba246c1fa9mr8958480ejl.10.1697127203087;
        Thu, 12 Oct 2023 09:13:23 -0700 (PDT)
Received: from [172.30.204.175] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id lc16-20020a170906dff000b0099c53c44083sm11162480ejc.79.2023.10.12.09.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 09:13:22 -0700 (PDT)
Message-ID: <0b51b73b-8ead-400f-bf66-1df1fde23b56@linaro.org>
Date:   Thu, 12 Oct 2023 18:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: clean up a check
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Robert Foss <rfoss@kernel.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/12/23 11:42, Dan Carpenter wrote:
> Imagine that "->vfe_num" is zero, then the subtraction will underflow to
> UINT_MAX.  Plus it's just cleaner to use >= instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
