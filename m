Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439C578C9FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 18:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237472AbjH2QyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 12:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237558AbjH2Qx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 12:53:58 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377891BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 09:53:55 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52a3aa99bcdso6459808a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 09:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693328034; x=1693932834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ACmQAc0Os4N98Z3d3R/oIFedpQZZYFrbAteEg6HsG0U=;
        b=I/a0kp/X+qSLU+PdEBr24kCAVtAqmcmI7BCas6WtO3JCDrAbuQynu6E54l+oTgHKmK
         c9eA+7wqka6EVKEbwNbG4+Eqrp6RkjNGXq9irM4PWeJLwjx2Dmmu7j5EJj9/FiGvCX+E
         eJ8UJdQZX7URDGf0zr+99AJigTImTySx0pabeADIk6hAtTjCqlEejLjIJjwl9LnhW+MK
         6vvbpsTmdKZKkypszJJQ3eLuoGNchTYAOIek7jVanMZN8GCYPKbq7WAsYyadiilTApNg
         QifliMykN14crqmecnBJeWWOA8mvMzoN7EbyarrOlFh2tM6SUoF1oVtk6FgUd+p7Prv8
         YC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328034; x=1693932834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACmQAc0Os4N98Z3d3R/oIFedpQZZYFrbAteEg6HsG0U=;
        b=FEC+eExTCxl7Ve0kl0qRnSWZ8rOhTPKwUU0fF8amdXI0ApcxCkcxHzTaozxrHxXBKQ
         4I6qaN6+6b/7OxIdDFD+7TP2qTKVEHMrC4KMh884HcMTKLz2XCpMbZMsRT365cHfkoUG
         7mQpRpe2X+n1LU4nf76yBnf2CEtdooPw6TDfEix842ZGhWbbMEvt8/4XD/dkio3js5eX
         fRAWrSefSGiwxHkxMXnAvV7iRC8nUBESHCNuPtdF3S0OZV8vFQnwJRdqsTFUSaUe+MHK
         AEIPcL+2OhdRG2AKoTxB33y6wsASW3af+7/mAY85WftfvTyDcY1fdHSyowCQDunVPmxi
         S2Cw==
X-Gm-Message-State: AOJu0YxtalyE+hPBQGrGYLcs0PcmuyXEcH0qZKa4uIw+XnoF5OYNhOlD
        AEmGOmsXgxwqYTcWNQWZ7WT5+A==
X-Google-Smtp-Source: AGHT+IFj6qY9ZGIZ7zhLjscs5t/l6tiV+o0WMRw/Smkie7Au+T0++diSeuW+C9be47Z4c2Gxfc/m6g==
X-Received: by 2002:aa7:d9cb:0:b0:51e:309:2e11 with SMTP id v11-20020aa7d9cb000000b0051e03092e11mr23265767eds.36.1693328033755;
        Tue, 29 Aug 2023 09:53:53 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id bf8-20020a0564021a4800b00529fb5fd3b9sm5830878edb.80.2023.08.29.09.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 09:53:53 -0700 (PDT)
Message-ID: <ae477c6d-b5a5-929f-0a36-3c0d2484add5@linaro.org>
Date:   Tue, 29 Aug 2023 18:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/9] dt-bindings: phy: qcom,uniphy: Rename ipq4019 usb PHY
 to UNIPHY
Content-Language: en-US
To:     Praveenkumar I <quic_ipkumar@quicinc.com>, robert.marko@sartura.hr,
        luka.perkov@sartura.hr, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, vkoul@kernel.org, kishon@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com
References: <20230829135818.2219438-1-quic_ipkumar@quicinc.com>
 <20230829135818.2219438-2-quic_ipkumar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829135818.2219438-2-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/08/2023 15:58, Praveenkumar I wrote:
> UNIPHY / Combo PHY used on various qualcomm SoC's are very similar to
> ipq4019 PHY. Hence renaming this dt-binding to uniphy dt-binding and
> can be used for other qualcomm SoCs which are having similar UNIPHY.

That's not the reason to rename it. Keep the old name.

Best regards,
Krzysztof

