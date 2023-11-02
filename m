Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3B37DF3FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Nov 2023 14:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376532AbjKBNkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Nov 2023 09:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjKBNkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Nov 2023 09:40:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD9813E
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Nov 2023 06:40:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9adb9fa7200so195532666b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Nov 2023 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698932404; x=1699537204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPXqa1Md7LiMjgxlnK3HQLQ5fI2nNY0ghcU9lcn1N40=;
        b=GoRetBfsGp0wCVNtwugEMDA+TCgLiCJ3UfpdC6v1DRxHDfUVRCgnvNmozIBiLTRRqq
         nO67ccLnPDbFJUMnEn4/oHtOWTk9E1SIipQiHyPBgXtuHgblGcApEraccQZ+JYYW0/KG
         JreT21XC8FxN/kQ5wwghXub7pzY+DzHHdNM9Ae5nQcQW1+cV4d8R1F/XW2E9GREOKBlL
         9NjU7at1IJ9amQ+LoU1Gq5Q1MBKk1iEikvWKyVZkfDIw7kchG0kTLvNuZ0cMnF8IZ5Bm
         p9M3EC79K/+WF3TcgpOtCiOYGugsoKe9wUDX8QO82iYADPkDDTEVmeWnJTTK2WxQ4ZJ/
         berA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932404; x=1699537204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MPXqa1Md7LiMjgxlnK3HQLQ5fI2nNY0ghcU9lcn1N40=;
        b=u4YadwSEQHHhHyZk2MUMX6iiQZcqGbZEeDSWyR8vQNzWJw6Z8eOgYU8YN5lLubK/NR
         mI27J5/XyHQOII1mr81shhhSLjNGFaYSGTPZX5Nlq7fuFwXS15Uu3El8DInmG+pBuId2
         SBNAJhcPm69jHVmMReCZDj/FYpDTG17vi7SvWoXENLUx2vt2nVdrpgDsDqr+pEWxTRJv
         ljtbScvkeklu1FwyNgF3FwgkP0dopY/byr7r1+8TBd5aihY/W+elJieCzqoEwIedhVkq
         iV3LppL67lWYW5Rbr1SvmDBkSCLSk24RF/L3BV0FRwv7dOKb/Y14jWJFrHmUhzDA+Pgs
         A2mg==
X-Gm-Message-State: AOJu0YxiqlYN/FeSmJxnTl8RSpF0lcNg6zS440fQ34w0a+OLyL38ypS4
        GBWesygw/inYS8daJHN5Wfbdrg==
X-Google-Smtp-Source: AGHT+IEsswBAHuzLu9D196nfD85BvKPRmI1i++AtJn78PYYpRezGZ2PqhT52cYwFQxCQqEHMUKjFIg==
X-Received: by 2002:a17:907:72d0:b0:9a9:f042:deb9 with SMTP id du16-20020a17090772d000b009a9f042deb9mr4563834ejc.19.1698932403774;
        Thu, 02 Nov 2023 06:40:03 -0700 (PDT)
Received: from [192.168.1.118] (abyj199.neoplus.adsl.tpnet.pl. [83.9.29.199])
        by smtp.gmail.com with ESMTPSA id v9-20020a17090606c900b009b27d4153cfsm1164662ejb.176.2023.11.02.06.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 06:40:03 -0700 (PDT)
Message-ID: <4b8dab99-05aa-9f50-def4-85058294f069@linaro.org>
Date:   Thu, 2 Nov 2023 14:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170 to
 camss-vfe-17x
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
 <20231102-b4-camss-sc8280xp-v1-6-9996f4bcb8f4@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231102-b4-camss-sc8280xp-v1-6-9996f4bcb8f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 02/11/2023 12:41, Bryan O'Donoghue wrote:
> vfe-170 and vfe-175 can be supported in the same file with some minimal
> indirection to differentiate between the silicon versions.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
But you directly assigned v170 to sc8280xp, without any renaming or
meaningful changes I think?

Konrad
