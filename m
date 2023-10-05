Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3405D7BA102
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Oct 2023 16:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237169AbjJEOqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Oct 2023 10:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbjJEOno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Oct 2023 10:43:44 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E7716AEF
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Oct 2023 07:21:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50567477b29so1367348e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Oct 2023 07:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1696515667; x=1697120467; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=onRU8Y/jXDlaGXA+m6kH7bamAm9GIlcBQ1TGe+vGhSQ=;
        b=Xa2ycxitRJmkmyEPwvy1Ky5DIfNkkHFzikrjB2wJ7CqXvvmT/Z/MZnGcGgTZdCInRN
         oCGvz1UKgsRIj0lG7hAHF/IMkLubyfCiAh/yAQvfhWMKUuZLdGrJD/NaYtH60jysuVC7
         1KbxrebVK+c+x9p16HQqKvB9ZtH7P5n04xkqYT1yHm7zZy1n1Ud6NAedTuvwLRdCOgwh
         cy/32XlHQcX9/BvG/N9Ta7YSVBt6/Yr2x4/dftCaW9Ayzi7oqFO3rslV4f3seZj7h/6N
         TlXK/hNyM499cTblUyi1QaiCDX4fKJQ7zVfYDtAVEz/BgTj4ohw6aexdfPeRAjMMgxS2
         6bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696515667; x=1697120467;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onRU8Y/jXDlaGXA+m6kH7bamAm9GIlcBQ1TGe+vGhSQ=;
        b=JrSdgh9ukj79/hotFUfOkaRPVrbIfnBSqQ+Zvgd63aPonL6C3jvDwOgyHBa4L9AUKK
         IOe1zRz1hxP6WNuNsRN0VoAfBk/bKwaGxzNe68GrahhclD8WVFUoa9kNDMoH4nZixtl3
         s3WGXXcZw2ceHLMs7T23mgP6AmmcykihvG5avTHGJ3BuNj0TW0qHkBsCtkXo+s/rMwTZ
         a7oRNTwKrbZ/7c0fBU3AQM5domEPa+iSIktqAg1R+rO9RZk7f7IgztuceZwzjsVYh22z
         3PguwzXshQg8IZ4tsuBDbps9KA/iQWTBbMIpK+Bcj4Rw1lrfp3lhZBlHKSZVSsNFAh6K
         6B8g==
X-Gm-Message-State: AOJu0Yzoe7kdOqJJwz+jPIx9VD+00Pbuz+us9wYqFtMq6IDjkoSmPZhr
        ORXu2wO51bIxFKQkWmeB3e3eTg==
X-Google-Smtp-Source: AGHT+IH4VhF219dRGP70eZMjQoWP5soQazPniTQw0zoui1ncQEviX4+FQu6riCbAWM7259/4rJ7fLg==
X-Received: by 2002:a05:6512:210c:b0:4fb:bef0:948e with SMTP id q12-20020a056512210c00b004fbbef0948emr4039144lfr.5.1696515667464;
        Thu, 05 Oct 2023 07:21:07 -0700 (PDT)
Received: from [192.168.2.171] ([94.186.212.25])
        by smtp.gmail.com with ESMTPSA id y22-20020aa78056000000b00692b6fe1c7asm1457287pfm.179.2023.10.05.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:21:06 -0700 (PDT)
Message-ID: <284103cfa6bc312ccf12a552dd61d12108fabfbd.camel@aceart.de>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
From:   lukas walter <lukas.walter@aceart.de>
To:     konrad.dybcio@linaro.org
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lukas.walter@aceart.de, phone-devel@vger.kernel.org,
        raymondhackley@protonmail.com, robh+dt@kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Thu, 05 Oct 2023 16:20:57 +0200
In-Reply-To: <8e6a41b2-7ad9-4cc6-8f95-93b8c2e4151f@linaro.org>
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

>> Is this fine?
>> Should I send a V2 with the signoff and reserved-memory changes?
>I don't quite get it, what signoff?

Krzysztof noticed that the Signed-off-by are in the wrong order.
But I was told this alone is not worth a V2.
