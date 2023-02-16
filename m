Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F29698C01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 06:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjBPFbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 00:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjBPFbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 00:31:17 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92D3170D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 21:31:07 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so1371642lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 21:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFQCMoGRAPH6dehjVG/yBE9xvAz6XsP3o4px0fSg/AM=;
        b=VwmWqxzsNj9sHR7iN7HlMKc//rExG1U9GW4iut0f8hvW3evoQRmPOFxjMUT1tymqv3
         XQmq3KR1NUtc24ypeu2MCrJv00KF9uXWf1N6QQ5iToqoyZDQd1KuOxFsN01xIbMbj+To
         k49ZaioWZ4sQyn83Mw5B+y2wv/gG0BmyXcyX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFQCMoGRAPH6dehjVG/yBE9xvAz6XsP3o4px0fSg/AM=;
        b=n+wsJi9UBNXAyXyvsUIARzkjAciW6cHl2I0kGo6X4zWvyISvDavnJQO72znlg4pgl3
         XO31ssGT0u7KLybZKTrAZ82i1vRI7OTM8P2NlxH9PKlkex301bvhHUiW3KXOlBN1uTwv
         zhJkEYCIsQNQ4RY+qmsosr73DM9ZZjREucPu7+1qIsvWjmO0U4+5aLZLon7t4QIzcVC7
         /ZvOiXptVXqqAmS9dPjbA8g08m+E5a2bIAvLuM6uJIdk/Qus+Vxbvtnh6nYANsxH9JQd
         LJGbi6MWAmIfv+8/D6Y5RQUbYGn279gDHDeHkx/k40zx50cLqwuo07CKDFr7lkfEaApt
         YLwg==
X-Gm-Message-State: AO0yUKVul1tj0db+yFU3cJ9tFv5a79vYeH5SjQCK+f5wcYcAS0X0W9QI
        Md/gdyCG6Sx27+T7Y4ZFERUHx+VkHmukDSlqBBr0lRErWnUSqQ==
X-Google-Smtp-Source: AK7set9zOf0Nj+96wPZzv/vZ3f7zQsOYTb0J2vm25mrASaWg6smR9eD6/ZCsK+Fc2IYoEm/MvAwwsI/20Ivhbdf/C/0=
X-Received: by 2002:a05:6512:96b:b0:4d5:ca43:704a with SMTP id
 v11-20020a056512096b00b004d5ca43704amr1294568lft.13.1676525466138; Wed, 15
 Feb 2023 21:31:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Feb 2023 21:31:05 -0800
MIME-Version: 1.0
In-Reply-To: <20230215151330.539885-5-quic_mohs@quicinc.com>
References: <20230215151330.539885-1-quic_mohs@quicinc.com> <20230215151330.539885-5-quic_mohs@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 15 Feb 2023 21:31:05 -0800
Message-ID: <CAE-0n53mDzqua47jEqrJwQBhcQcyBjJAtNvH2J-tCPhkvV9JtA@mail.gmail.com>
Subject: Re: [RESEND v8 4/5] clk: qcom: lpassaudiocc-sc7280: Merge AHB clocks
 into lpass_aon
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        quic_visr@quicinc.com, robh+dt@kernel.org
Cc:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mohammad Rafi Shaik (2023-02-15 07:13:29)
> @@ -828,8 +830,9 @@ static int lpass_aon_cc_sc7280_probe(struct platform_device *pdev)
>         if (of_property_read_bool(pdev->dev.of_node, "qcom,adsp-pil-mode")) {
>                 lpass_audio_cc_sc7280_regmap_config.name = "cc";
>                 desc = &lpass_cc_sc7280_desc;
> -               ret = qcom_cc_probe(pdev, desc);
> -               goto exit;
> +               ret = qcom_cc_probe_by_index(pdev, 1, desc);

Where is the patch to the binding yaml file?
