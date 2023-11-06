Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0C57E2F30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 22:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbjKFVvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 16:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbjKFVvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 16:51:14 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99719D6E
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 13:51:10 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c6b5841f61so53981201fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 13:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699307469; x=1699912269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rovd4JK5fHJcS4kL1plhiacylopFV6njcCJFrFhLJnc=;
        b=OMxPgAFdeJv0Um9Kxmxot7XqXGojjGFYxpFlWYBnEEoaj1FGvOrkphFgS1kgTkFSe9
         7LE3/sEPTg96upqUSJey8taQkyX9tJiXSgmhDKcMgFQulbxzkPLRL93grrVahjA+Kha1
         Eg4fSMYox2PsDRxIWisYMQL9N3X8bLui1q86U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307469; x=1699912269;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rovd4JK5fHJcS4kL1plhiacylopFV6njcCJFrFhLJnc=;
        b=q2Fotno0rIUgxaKpfUIMiNokx5LCEdavwZKW2tI8kx0lwu5Sxy1Zx4GeG/gi6zBMLK
         c+Hj54sP8p426pBfXw10jmVP2qKIpQDcNOwhu/e8lzBeL/H8bm6KHnSeEmR68ymshRgX
         IJ9pcnH/RvM9BGOpMXvcMyUhDo7Yy2y6Ars8IPZ/vcMsV6+mjDKswde8WihlQFrdkB81
         bvb6TYbW4uCde2SsL1NUnfSHPS983rnRrKHyWYfGYkFfXOHZe5WClaKjlGhSVL6SscT1
         Ax1e52BBXhQO4BLJFSrYuUTTcNh7FZKqAZBKOmc107IMqxxlEfd5vEweZBOIKNEQES9e
         Mjxw==
X-Gm-Message-State: AOJu0YzCtdi7tX1FaaRfesVRHv0e9c8DFGy4KDamcz2nZRGO+NwLEcom
        2N9YtjdNdnCRpeJjsIu+6Myz46IF+8Oqn2NI6iVaiw==
X-Google-Smtp-Source: AGHT+IEQchg2Mo9K99uoWXcnoWuD1S4/nlYDjsfTVQ9fI9R4y38bWmbo9tODWMPx0AJc7mfdxervYQJu7Q/ZYncfM9M=
X-Received: by 2002:a2e:978d:0:b0:2c5:2357:c6a7 with SMTP id
 y13-20020a2e978d000000b002c52357c6a7mr254675lji.17.1699307468524; Mon, 06 Nov
 2023 13:51:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Nov 2023 13:51:08 -0800
MIME-Version: 1.0
In-Reply-To: <20231103163434.5.I2910e7c10493d896841e9785c1817df9b9a58701@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231103163434.5.I2910e7c10493d896841e9785c1817df9b9a58701@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 6 Nov 2023 13:51:08 -0800
Message-ID: <CAE-0n513k3PRZrpEiwvgGwhX2H7SsJrD6DWFbzBS9dGo0t=HZg@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: qcom: sm8250: Make watchdog bark
 interrupt edge triggered
To:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2023-11-03 16:34:31)
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered. Make the change.
>
> Fixes: 46a4359f9156 ("arm64: dts: qcom: sm8250: Add watchdog bark interrupt")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
