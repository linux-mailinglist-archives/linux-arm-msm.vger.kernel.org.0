Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C797671938E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 08:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbjFAGus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 02:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjFAGuq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 02:50:46 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3E0107
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 23:50:45 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-514953b3aa6so796754a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 23:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685602244; x=1688194244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3FPpYGCRQvqGtj5K7A51eFqGOlW0Bj/YEFDgkAuNzo=;
        b=HatPd+F8H/aKab99kJgFnaeCtplLVrq56nqL2I0/WH1jiSgmjWG9PvbDSMCBHbnY6g
         zSlbHMgSehUWW0ONEWn/zg0aDmY98jgPTZzR2N7jd8XpFBYJ/TzZR/+M/vCA5e8MY/PE
         5Wkbyh/eah/92hgn9cR16pPgz5PbyPJbsexP76NkVVlgjyS92JP1tbkdnpa7tny6CsiD
         hRih8p5yOZDDxM6irbA32cWINbP8j45+ST8WQZn4quYfDc+0pRlnZRlmCESVCMJHoT2x
         rsANKZfOq6OBm05iQrtVzyGJRu+fGQWxwQh6MSWBnp5SvFbaSkf8NZPIqrsgBJxQ9xlQ
         /mVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685602244; x=1688194244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3FPpYGCRQvqGtj5K7A51eFqGOlW0Bj/YEFDgkAuNzo=;
        b=WAmGpFxUpLbrCbxw/V+jG+qGUHTS4oevNDuOocZKGru+SCpD97dJsb7ZSPAWfIjhrO
         D0mVyiNR/pDijbgDv7YmS4fzbzA4AxLNcIHD9PiYRUjZmeda9lU5akdQbXrf9vDdYSbz
         oD1NRAMl1zBZR0Q9yONH6qE/3Ub7R+c2lp/mguWZiEqeha7s8h0ajjQphCAkXSMGchks
         KBdzF9sbQrDBMVHkVVMBCWIt6VTQ41WCN4UoquRrvaMjCzmIhRzhyo993Bd6WWAIYn8U
         RJkU9IPWXnYELACt0i308PhI9CG7JFjikDfMfeRToJLcLpgArMTB9pYIG0uqwzQi9qTf
         S7WA==
X-Gm-Message-State: AC+VfDzDPWzjWl7W8zp5+UahN6ryqZauUyuiQvktavd81M26DByQwK4c
        mGJfth7v547idvwwVejlcOCXxQ==
X-Google-Smtp-Source: ACHHUZ5SHYblK1UbhYQwS3N7gHnmMWs5GtDzRfns223BYfbgzoaLLZz0fOjxOwqbOYidv0xKi/FRbQ==
X-Received: by 2002:a50:fe8e:0:b0:514:9edb:185a with SMTP id d14-20020a50fe8e000000b005149edb185amr5244647edt.9.1685602243987;
        Wed, 31 May 2023 23:50:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j2-20020a50ed02000000b0050bc4600d38sm6260849eds.79.2023.05.31.23.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 23:50:43 -0700 (PDT)
Message-ID: <a29985be-da0d-f9d4-956d-f00748f06dcc@linaro.org>
Date:   Thu, 1 Jun 2023 08:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/8] dt-bindings: soc: qcom,rpmh-rsc: Require
 power-domains
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230531-topic-rsc-v1-0-b4a985f57b8b@linaro.org>
 <20230531-topic-rsc-v1-1-b4a985f57b8b@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-topic-rsc-v1-1-b4a985f57b8b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/05/2023 15:22, Konrad Dybcio wrote:
> The Linux RPMh implementation refrains from sending some RPMh votes until
> the system is about to enter suspend (which is indicated by all CPU cores
> entering a low-power state). Lack of the power-domains property will make
> it such that these votes are never sent.
> 
> Require the power-domains property as discussed in [1].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230512150425.3171122-1-quic_bjorande@quicinc.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

