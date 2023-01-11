Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1275E666576
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 22:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjAKVTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 16:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbjAKVTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 16:19:05 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E6B1056E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 13:19:03 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d30so20583275lfv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 13:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv2a1NqKo5aZA53tRjiZ0Ie1voogHfFfahY4ZwIQhHM=;
        b=g41EMSDqpmA2PVl35TdVoQieEn9RXxLBsba8XhY33RIx97XHiCTrABe7GsZVKLqnee
         4DKyj9VMgcbmQkUaYvOsZbERNL84+qvNqLvDhxMLbYkqEBVMB/syYg1LsSd84f7Xq5I/
         Auq8FAc7ODW9BgcnI5Rt8SuvsY+JKjQvMhDjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv2a1NqKo5aZA53tRjiZ0Ie1voogHfFfahY4ZwIQhHM=;
        b=DXBI4yJcyS4Mz64vQkK7+HnG5zobjpEiGdKwQjXyd5UyZdnHshz+xE3zs7MB+MLx5k
         2c1fLt5lfB80Pjc3xu0iyHoTczwvhNuJEaBemyF1C5I3+P4SJ9V1bLN4Q6BW1Dg6IATJ
         cN0e8BfNVyabUMFDencR6kkBxcxHPJuGE5vaJXjeVXzVMFdC2/TamdnDy2PsPVAcIbCC
         5mPn8d3j1LLlpxGxnbhG7eN49n3OiU4D9lxO3nnMC7zfTEJdvRWXLrBzzkcOyX6TN1Lj
         7i9NRi4xHjnMVKP9EJjjojpD5KDadGBI5pmSBZFHPVZCmJnczGy41mXxEAkMMKTsdANu
         WH7w==
X-Gm-Message-State: AFqh2kqJ3nP5QBYwWn6JHD1gpW1NEFVUboZQPpw2e/d4TLbt+ygwcCWA
        /GIhcBnp5kbG6yUQA7Q10RiKoGnkIfXkgeRmTzwCCw==
X-Google-Smtp-Source: AMrXdXu1qo8ydiSXNkr1gjUsIvDH+a+2FznMvvYgUDkJX3Tg9MLCiUuN3WSQ+haee1cIOmrRtPXxP5rU3apLNHYFPww=
X-Received: by 2002:ac2:5dc4:0:b0:4b6:e4c6:b751 with SMTP id
 x4-20020ac25dc4000000b004b6e4c6b751mr3249961lfq.309.1673471942140; Wed, 11
 Jan 2023 13:19:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jan 2023 13:19:01 -0800
MIME-Version: 1.0
In-Reply-To: <1672849297-3116-2-git-send-email-quic_srivasam@quicinc.com>
References: <1672849297-3116-1-git-send-email-quic_srivasam@quicinc.com> <1672849297-3116-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 Jan 2023 13:19:01 -0800
Message-ID: <CAE-0n50bLN_E+yXvwN3QX-ETewqDm5YuCePMfyKRE5sAeqyR9Q@mail.gmail.com>
Subject: Re: [RESEND v3 1/4] dt-bindings: clock: qcom,sc7280-lpasscc: Add
 qcom,adsp-pil-mode property
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-04 08:21:34)
> When this property is set, the remoteproc is used to boot the
> LPASS and therefore qdsp6ss clocks would be used to bring LPASS
> out of reset, hence they are directly controlled by the remoteproc.
>
> This is a cleanup done to handle overlap of regmap of lpasscc
> and adsp remoteproc blocks.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
