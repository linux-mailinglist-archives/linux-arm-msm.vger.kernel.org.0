Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CB1797D40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 22:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240525AbjIGUO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 16:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240560AbjIGUOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 16:14:54 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3901BDF
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 13:14:37 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5007616b756so2285439e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694117676; x=1694722476; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5TA5uE3Uk5A+of280Cw4ik4ScxEAKm82TieyZqTk6I=;
        b=g5M63ZrNHHUdpkbESOvznsRXmApMcNWLGdKYPxcr6KZhdIomeJLULYLWbU0DMFeZ9P
         XkU/kGd8BGBQweMnRG3aBZpBXmKBWgXNa+006/Us4yvdw15AJNY9QkHFmVDmOAZQxs1M
         8u5YF/5zX/2U1j5b+RvtI1NUw0lG5Ozkvr31I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694117676; x=1694722476;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5TA5uE3Uk5A+of280Cw4ik4ScxEAKm82TieyZqTk6I=;
        b=Y3/JOSV4wSB3l7E92rjQkm7YJFmOUCuqQGWG4iMKm3d8ool3P9YjOSWK8TK4+w2WnK
         ou3R3hmmq0QaOsj8e4fxza0ec9T9tcqoiIOLipUqBnx417I/Qhsxom7a9UPXF+GkGbGG
         ClDT1ngkV5BRuTRDYu14Szj2PTV/ZHrNWp1sVjgs85gOyr3AKQAqjwh3o7v6UN/GB2Rb
         +g4ooXIKLW9lO+TUASE4ZPB6xOG71BmGF9DbPaw7X1uBqbsu3XfNfO7IzwwiMlr89wpz
         S1KtlQIGgUWEaNH2PwJ9kbTxisdmSO4I70x2tocnVyM3mKv1xARAOkg/q1PyRzA8BmB3
         lyCg==
X-Gm-Message-State: AOJu0YyvUlM5B16QU9itnV/1P1s5VRZjv10qt6CzW3Fg5aP7dZ3f2Drp
        o4qkLtbCS4F6spIczr9emDXWZl0pQFTQM51naMYB7A==
X-Google-Smtp-Source: AGHT+IFDlLqLCI8T7zpy/pdPZ6eZpiApuUfi47QxbxEsrcYUVafEqNFM6iApLs5D0S7TkMsAG6R5z7eIJl8qz36MNl4=
X-Received: by 2002:ac2:5b4d:0:b0:4fd:fd97:a77b with SMTP id
 i13-20020ac25b4d000000b004fdfd97a77bmr308004lfp.50.1694117676286; Thu, 07 Sep
 2023 13:14:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 13:14:35 -0700
MIME-Version: 1.0
In-Reply-To: <20230907-sc7180-adsp-rproc-v3-4-6515c3fbe0a3@trvn.ru>
References: <20230907-sc7180-adsp-rproc-v3-0-6515c3fbe0a3@trvn.ru> <20230907-sc7180-adsp-rproc-v3-4-6515c3fbe0a3@trvn.ru>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Sep 2023 13:14:35 -0700
Message-ID: <CAE-0n53=aT9Ri6GwDYaTKKbapc3sk6dZEnTngKuziBD1FH0ypg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc7180: Add ADSP
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting 'Nikita Travkin' via cros-qcom-dts-watchers (2023-09-07 03:02:37)
> sc7180 has an ADSP remoteproc that exclusively controls the audio
> hardware on devices that use Qualcomm firmware.
>
> Add it along with the relevant audio services.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
