Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A437A35AA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Sep 2023 15:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjIQNU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Sep 2023 09:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbjIQNUp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Sep 2023 09:20:45 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCC118B
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Sep 2023 06:20:37 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-401d10e3e54so39859735e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Sep 2023 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1694956836; x=1695561636; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KeYIqn2tdFkcVAufe9gBvH8l2EIbPxMaLKSc9nvnSeI=;
        b=fGP/lbeOLDw9ka7WpYIOuuqmh2b0qkPdH4OKothbxnK3awDnxiGkVXPoqDUU4I9Bbh
         gHibX/usDnz6WHH2BHTYY6hKXtmwJaoLJJwJO+eP1isLelK6Cv0rlx8qXE1PIHe3RdpE
         XcENRMZei5ZaA5Fvoxugqi3n5axgIOIQQUdZgJjIe55D6YnWB74vgmU96fCdQHdgoCok
         9yl9FQBmzI4Cb/Ma8gdsOlXtdfw/w5wBdHZckbjoPkE7y3vlsdmHnAzaOXU/WePYx+Ti
         PZ4/2YQYNzvM6VH5IR8i9KlD7lXZJoBbqf30HE2nsZFJv5cbe0038aHxi4mRLphfmfVl
         CTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694956836; x=1695561636;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeYIqn2tdFkcVAufe9gBvH8l2EIbPxMaLKSc9nvnSeI=;
        b=ND/d+Wv899yY9oJyYZmYv5BS6o58VwCjJSmMyYHCJM4Y5LeK9EP8/F8xfwNe7GQQJn
         Im9Nmw56zzAfMqaDPvpI2Nn0wpbIUz56CzI7UkerSIhxVud5kZalgGuAkXuKomdEj3C9
         qClHWwQEGgMPZ/L4wCPgynv2Ev8w89D8mtpHmYUDKplNIAiLXAVOuYRPwUzW26YyPBd2
         MsakS+aEyHJK83sbxha65gN7tznS7mTEU2pswp0nwqGAy+MgsCfqTNZg7XOWog6zcZQA
         9DnRXho7AUiC9qXMY42mUzS/1RntGlxL1mwaLXxXlEgIhpbXU/Pcwcna4vcnT8TG49yK
         oZYA==
X-Gm-Message-State: AOJu0YwUpavjIDNx90uRDy3ZAwAEEWhVw0yxxyjsiezqD4hrNrIe3Txy
        Hi5tBNOeeGYnNj5dVqsDfXx96g==
X-Google-Smtp-Source: AGHT+IH4ywV4aEv+TpxbpFW30ZsBFhptGh4bDnt8s/U1O/3wFXPg4T07xR32tTPSdkwu/HFEYDVc2A==
X-Received: by 2002:a05:600c:2901:b0:401:906b:7e9d with SMTP id i1-20020a05600c290100b00401906b7e9dmr6226687wmd.18.1694956835911;
        Sun, 17 Sep 2023 06:20:35 -0700 (PDT)
Received: from ?IPv6:2a02:8070:d84:9160:acd3:26fc:724e:a2dd? ([2a02:8070:d84:9160:acd3:26fc:724e:a2dd])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c320900b00404732ad815sm8936077wmp.42.2023.09.17.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 06:20:35 -0700 (PDT)
Message-ID: <dd0f65048f7030184caad4d99b8277d589c6d352.camel@aceart.de>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
From:   lukas walter <lukas.walter@aceart.de>
To:     bryan.odonoghue@linaro.org
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lukas.walter@aceart.de,
        phone-devel@vger.kernel.org, raymondhackley@protonmail.com,
        robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Sun, 17 Sep 2023 15:20:34 +0200
In-Reply-To: <3a66a198-5817-4c74-9047-c49e5bcc84c2@linaro.org>
Organization: aceArt GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>Are you sure this is 3620, have you tried wcn3660 and/or wcn3680 ?

I am sure. Downstream source [1] and downstream dmesg (wcnss: IRIS Reg:
51120004 which should equal [2]) indicate 3620 (3620A does not exist)

[1]:
https://github.com/CyanogenMod/android_kernel_huawei_kiwi/blob/cm-14.1/arch=
/arm/boot/dts/qcom/huawei_msm8939_kiw_al20_vb/huawei-bt.dtsi#L5
[2]:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817e=
c874f325127b07609fbaeb8/drivers/net/wireless/wcnss/wcnss_vreg.c#L51
