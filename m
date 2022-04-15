Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F91650203B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 03:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348524AbiDOB6p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 21:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348520AbiDOB6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 21:58:44 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B89AC049
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 18:56:17 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id w127so7245414oig.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 18:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=zb5VRa9j2WpBHtiOkYhvOFGcHzF1H645EcsaS5Prt90=;
        b=Ld64SqixvFcrmCytaQr8+TbODVWCbNOIXbWvATydO1fa79oXg8DW1mO577xwFv/J9v
         7ywgj38vU9v/e0NbdmLTAEZQ74eqUAcGxb5yaIAx9gV19P3sNQxBfYpI51P7xXnjJ2fH
         OkrL+Z0EEeX4xdmgPtgW3gyVgoevkXEVd8Imk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=zb5VRa9j2WpBHtiOkYhvOFGcHzF1H645EcsaS5Prt90=;
        b=qZ0C1MpZbGbK7frxv5lgU2h1fbsJoXlJ7DyKp1CG0RVPl/ribGceM+XBMvwTVrddEv
         Y2J5c1fQospN7s8+EDW5IFcTSVaFrvAKlhysHQN3Dt7vjXKtOK5PhJm3l8TBsAY4Ry03
         VdHp9vaHYvMmWkQvQ25MCjwMTdSEa6cfzKPJRsRr7GosEq0iC2fg7JPpvWP1nq9et5va
         Z/rLaCc0ZxxagS5wfI2Lmg/UjRhau03i4Y7/uKO9l3oIZeXPIgfccUP+mY/pqRWTJy0E
         eFiwIe6FLV/0ml/XCzkVGpecpXtw3PE94i9uxkjhG6OW2xF+PMZlxspkqnBIF9234Lwd
         eq7w==
X-Gm-Message-State: AOAM533Egp2BjW98mxko7W8inZGLF+nWIBJW7UUere7QtST2doIZZxyF
        nHkjWqX/dUKMPoqzqbSvgkgcQezhQnYwG22a/Npabg==
X-Google-Smtp-Source: ABdhPJzSo+f10NdPVe/fodZNohcKYB8P57215emKTGiEa1TbINGw0Ry/S2UzvI7a3f/4JIwLSmjQNz+6CI80KKnn1Qk=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr660742oif.63.1649987776048; Thu, 14 Apr
 2022 18:56:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 18:56:15 -0700
MIME-Version: 1.0
In-Reply-To: <1649863277-31615-4-git-send-email-quic_srivasam@quicinc.com>
References: <1649863277-31615-1-git-send-email-quic_srivasam@quicinc.com> <1649863277-31615-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 14 Apr 2022 18:56:15 -0700
Message-ID: <CAE-0n51B_QdU7tjgFgXQ0aaBOzs=XoFHwcmrDhnDe4FVJNiytg@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] arm64: dts: qcom: sc7280: Add lpass cpu node
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-04-13 08:21:16)
> Add lpass cpu node for audio on sc7280 based platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
