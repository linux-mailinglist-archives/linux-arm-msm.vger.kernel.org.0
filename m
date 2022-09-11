Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786085B51A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 00:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiIKWw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 18:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiIKWwx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 18:52:53 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B4F20185
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 15:52:49 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-12803ac8113so18977366fac.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 15:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date;
        bh=H7oMNplR0/sapgbTQ40U0Cn3+sk6O4LcF9QVNpOL2o8=;
        b=QeonR+svMWSQNpzNmzKsc4BKnv5NEK69QL/+ZID84pLU91reE1En30h4IcNE7NpNzD
         ZwnWebzEeccMNnRucE3LOSEm8GvTrBnXQWWoQuAApjGcQOp7riElOaeqMyORYWjCqtRo
         md8OZEHpOflu9aN470LAA58rYHXmT4Bzc8S7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H7oMNplR0/sapgbTQ40U0Cn3+sk6O4LcF9QVNpOL2o8=;
        b=oqzKV9bZkHidaKaI0OOLvVEM9+vD+y7R9zZcSD9WNm38NKGP9l/ovU3YFF1yPGfbUU
         lJtDC/5FI/AShmyT4CTZmf0IHhfFCl/0q57paFR86imI7FCbPw4778GNQv2khvbySAjq
         wBOBug1ypMnQHsrRcRUjMA53VzSDUYiR81ApTERlP0qttvFsiq6fZRZrYaZXJi+AGZCC
         S1VPtQscpwi5o4/mubYX3PqifKQIPMnlgkbIazOZsEErNpASCQ4XjVdFACrNU1oR4TCZ
         XJxrAXrPDMrtH0iiUAxeczMT++y3AaUNOvx2a+YHeHaaghI5kK3c9s0Bo5uwrOAVmnT5
         vMBw==
X-Gm-Message-State: ACgBeo3rZWaq43Ng6b4XdpPlM/21UhiSaCT5JlatIu21vQcLek5STpAg
        uThGYlOlAUNZkCl+91maT5mBkMp1aQaRk40/QkPzGw==
X-Google-Smtp-Source: AA6agR4ToSrTBZ3frIF1GrTKC3IhDO8U09cptKWPrbauOJKudE0gO0PvOR+To/mABijoLr6lZVAq4CM+NitMKsxvQUc=
X-Received: by 2002:a05:6870:e748:b0:127:dcb9:c59a with SMTP id
 t8-20020a056870e74800b00127dcb9c59amr9963928oak.0.1662936768620; Sun, 11 Sep
 2022 15:52:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Sep 2022 17:52:48 -0500
MIME-Version: 1.0
In-Reply-To: <1662643422-14909-2-git-send-email-quic_srivasam@quicinc.com>
References: <1662643422-14909-1-git-send-email-quic_srivasam@quicinc.com> <1662643422-14909-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sun, 11 Sep 2022 17:52:48 -0500
Message-ID: <CAE-0n504d-RnwNHBxZsDqEpwotnCUXOiGwuz+C9Gjj01Vz9b6A@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: remoteproc: qcom: Add SC7280 ADSP support
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-09-08 06:23:35)
> Add ADSP PIL loading support for SC7280 SoCs.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
