Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DC0718B81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 22:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjEaU4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 16:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjEaU4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 16:56:32 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B8C129
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 13:56:31 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-3f7fd59bb13so57047131cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 13:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685566590; x=1688158590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYHmPPdm4Dau+d947lCnpQiMGTh8x8NsQoxsSBGTC/s=;
        b=X1NbQ/MSBszVuLd5RdbvzcWYbpZWRuzTYKxxHtlA+3P1lHFARVvs6ve+bJc6sDz9q6
         XW3Nbpz9FVMyUSdx5q6gFqlgks2NpqkiwRajg5R2a24YJQGijfZ9rAob+agFbo4PR//P
         YB1GHs6CtQC0b7tsV8DGqjFA/j+FRKGoYiix8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685566590; x=1688158590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYHmPPdm4Dau+d947lCnpQiMGTh8x8NsQoxsSBGTC/s=;
        b=THkpHA+ELA1mvntIzP8m2/0bk1oSL2NwsCntKSUdAtCLVGEhB93v/iPwCvrHd9KJKz
         gEf9Tzyv12ZCnZiOftfFzHEB/ZQw8ObV5YC7yuUNQ/kTjWxeoPm4NqRZtLLFDjMMTV7F
         3UZkzQoVyEp3KGGpF49N/ugz2gP9UXkPrxZ7QJcAllGU7yZjxW82u13bKYm4pPfvO2DG
         qTr8VmXE9od7HF7/dDrf+csQGJiJis8mlRordi0MA9/Jmj6TBAdoTufyjhk7AdcL3t3+
         XDfxsbpp36Ibp4UV7FsMvo06zaJMJWVTVUukeBhtpqCzOj+kN7d57mrw4rnEh6ZZoqzO
         XfRQ==
X-Gm-Message-State: AC+VfDz1QkMfgbD1Ti1UKYj0F1c/+n4rNtU5S7EpsMgU1J/0+ZgulrGy
        jF8W5CF3jqz3rn4zPejcaK5IX/81Hc8+b8j/h/o=
X-Google-Smtp-Source: ACHHUZ6IA9W7k2zdMP26ghRjg6v7Yvvsrf3OV6Gk7P+MMGH5iENYPiuWlBpz0aRCz+HPRJVXcEu+Ww==
X-Received: by 2002:ac8:7f95:0:b0:3f3:93cd:ff39 with SMTP id z21-20020ac87f95000000b003f393cdff39mr7058512qtj.31.1685566590059;
        Wed, 31 May 2023 13:56:30 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id r6-20020ac85e86000000b003f018e18c35sm6441923qtx.27.2023.05.31.13.56.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 13:56:29 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3f81ffc9065so16461cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 13:56:29 -0700 (PDT)
X-Received: by 2002:a05:6e02:b42:b0:33a:e716:a76d with SMTP id
 f2-20020a056e020b4200b0033ae716a76dmr37485ilu.27.1685566153516; Wed, 31 May
 2023 13:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230531-topic-rsc-v1-0-b4a985f57b8b@linaro.org> <20230531-topic-rsc-v1-6-b4a985f57b8b@linaro.org>
In-Reply-To: <20230531-topic-rsc-v1-6-b4a985f57b8b@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 May 2023 13:49:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vx9txUs4=b_enDMTBXuNsTGXO2v3KyauuD8k_J++vbfA@mail.gmail.com>
Message-ID: <CAD=FV=Vx9txUs4=b_enDMTBXuNsTGXO2v3KyauuD8k_J++vbfA@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sdm845: Flush RSC sleep & wake votes
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 31, 2023 at 6:22=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> The rpmh driver will cache sleep and wake votes until the cluster
> power-domain is about to enter idle, to avoid unnecessary writes. So
> associate the apps_rsc with the cluster pd, so that it can be notified
> about this event.
>
> Without this, only AMC votes are being commited.
>
> Fixes: c83545d95376 ("arm64: dts: sdm845: Add rpmh-rsc node")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 950305aad44d..707550ef4990 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -5138,6 +5138,7 @@ apps_rsc: rsc@179c0000 {
>                                           <SLEEP_TCS   3>,
>                                           <WAKE_TCS    3>,
>                                           <CONTROL_TCS 1>;
> +                       power-domains =3D <&CLUSTER_PD>;

It would be good to confirm that this doesn't throw sdm845-cheza for a
loop. No sdm845 Chromebooks ever officially shipped, but some people
like Rob Clark still use the old boards in their CI farms. Adding him
here in case he wants to check. Worst case we could just delete the
property from the cheza device tree.

-Doug
