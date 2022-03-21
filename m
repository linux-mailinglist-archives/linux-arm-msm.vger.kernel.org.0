Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE674E31BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 21:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344532AbiCUU3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 16:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344188AbiCUU3H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 16:29:07 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3371667D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 13:27:41 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 12so17462281oix.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 13:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/5gH+Qk/caAbvq7TLc6uNTtoIHOsS/ggONeWolYhjMM=;
        b=mEcN0FZvNBnkfx7mE4kl+or2ZB2DdbADQOvjLZLMB/upcuDs29r4wkQBmVg8gaHYEQ
         dfZWuFIzHOja4/hU+Dz+KqtJWatcWb0brjy7gm5sD2ALSbWuw9sPCm4wpKl84kmWftXV
         sqILuV9AtC8LNg6mQFW2t3zFHWT/5JdNK6w8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/5gH+Qk/caAbvq7TLc6uNTtoIHOsS/ggONeWolYhjMM=;
        b=rw58wA00HcrlTy/prFcFL3qDeiqtT85So2HvlZOvCR1Azg8xQidi3+mC2Wv31T1cr3
         pf/zGz6lZfqmM1Uat/99UJoWaB0CFmovkHmbEB1ZT+ig8/3BrIRKQD6H+H+EmXU98YIc
         ZAK/BAdyrdp2v4IKiDCfr48WkTwLOfKJLO9//Si6JpcOzCLfX86oWyIuk+CTtAbsxw2g
         s61L06Gn58Byou/qM3UurtzWqdAvQEdUCnXZtmknXlqz8+MNa1VTi/vDvwhtSrt7tEi7
         0+plW0mHQYB3x6lb/cDa5J0Y2sgvRo+0PmYfDmIRTJ26F6nlZ3jz9RpAop6g02zGVI1F
         TOeA==
X-Gm-Message-State: AOAM530HXkVCyiGKg9H9OPIwgpTIo4FnN59s3tOC4MzLWjk04iRZ+TXL
        hXmKx3YvIaCn84C/YrcL8osn7NaHYkFVIEsZdw5VVA==
X-Google-Smtp-Source: ABdhPJw+A5rqkEWBNBweCGwqww2vtbVI+22foZPQUlqvzbELO20xQTnLvWV0Mg8PC6ygwybxFAg1YwvsKQmOBZn3rpQ=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr424975oie.193.1647894460872; Mon, 21
 Mar 2022 13:27:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Mar 2022 21:27:40 +0100
MIME-Version: 1.0
In-Reply-To: <1647863959-3289-2-git-send-email-quic_srivasam@quicinc.com>
References: <1647863959-3289-1-git-send-email-quic_srivasam@quicinc.com> <1647863959-3289-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 21 Mar 2022 21:27:40 +0100
Message-ID: <CAE-0n50yxLZ6j32Cmx9gdACnKT3uJxc5wsOp3SAd4VHB7aNUvw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: sc7280: Add pinctrl for wcd938x
 codec reset and CTIA/OMTP headset selection
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-03-21 04:59:17)
> Add pinctrl nodes for wcd codec reset and CTIA/OMTP headset type selection.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Please combine this patch with the consumer that uses the pinctrl nodes.
Otherwise it is too hard to review the contents of this patch.
