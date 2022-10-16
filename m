Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356AA5FFD89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 08:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJPGXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 02:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiJPGXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 02:23:42 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A283913F
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 23:23:40 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a29so13151135lfo.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 23:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2LHDa1F/8X6ZWAQVXUe1Mk1A9yLGivtpcD/rS0YNKg=;
        b=AXil7smYB7PfmYlTdVof4PbndKTMln2PigDU3ZL7xnDFyxAcLPedAhZe2vPHsRrW1D
         +lOI1m1xBpjCoKlOdxAWjxb/sIwA8V/In+3EsNEENfNzzD2Gd5QIB2iOvAgvGr1+b6aD
         MV4Nj64GoUJawOorRVEfCIucWHPADyXWsGybs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2LHDa1F/8X6ZWAQVXUe1Mk1A9yLGivtpcD/rS0YNKg=;
        b=5E5uNsCSW0fNZkQndb6OVsnAu3E3PfsaIzcS/E08XX7QRh/BG0KqJ9GaMyrzvCg5Cg
         8xWobiiVN+shR8YSd7dUazVby9LyHp/NfS9iVm9Xowv0fz6xQjSXCOpLoB7F3+qzRbjv
         ggWMwZW3YS/zLPkWGnb7m60spLFzP6LK9dK2EzpDVni5No9wjNwhdyje8+xJGiN+CSYe
         dnCDoUX6hxDfWyxF5henPKf/NoUqBCTpKtSQA2dCKktR1SGZ7XFZHF71V6SvCD8tsRK5
         xlHybrXhjLgV6KOtD1MCJapdGxWKifrWGY0/WF8ZkcpxIPMwsLFBqZVssLQKZ6DrEOIT
         L9Ag==
X-Gm-Message-State: ACrzQf3b1GEho2l5XRLYvcPXq+oTalj+gw723R8b10rH1ZNznDWycGbP
        MyptbSGEqV0B48XoSC3Gk7bohULtMur6PpkhDIZaYQ==
X-Google-Smtp-Source: AMsMyM4QkdUrKzw3LU316fQN2RC+8LGox104OVgN8g2hZ4RR5XJA8gQ5I8NuBJvXDuGPOuBNhX81APjz3z1+qKDx0Z4=
X-Received: by 2002:a05:6512:3d89:b0:4a2:4d71:7d9e with SMTP id
 k9-20020a0565123d8900b004a24d717d9emr1799720lfv.145.1665901418938; Sat, 15
 Oct 2022 23:23:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Oct 2022 23:23:38 -0700
MIME-Version: 1.0
In-Reply-To: <1665825530-7593-1-git-send-email-quic_srivasam@quicinc.com>
References: <1665825530-7593-1-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sat, 15 Oct 2022 23:23:38 -0700
Message-ID: <CAE-0n51KTx+XBewfCq3GKK++iqzhNNKRMCY1RC-_8QzcfdSpeQ@mail.gmail.com>
Subject: Re: [RESEND] Asoc: qcom: lpass-cpu: Mark HDMI TX parity register as volatile
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        andersson@kernel.org, bgoswami@quicinc.com, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-10-15 02:18:50)
> Update LPASS_HDMI_TX_PARITY_ADDR register as volatile, to fix
> dp audio failures observed with some of external monitors.
>
> Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
