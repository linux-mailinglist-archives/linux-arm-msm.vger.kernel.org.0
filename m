Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5979A4AA2EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 23:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347770AbiBDWPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 17:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346890AbiBDWPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 17:15:15 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A8AC061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 14:15:12 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id d3so6022922ilr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 14:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fc9tivpfIRMekzY3db3T+X+KpuiUHIxykgYorNMpzAY=;
        b=L+fT4PDH2+t16RxVDgAHTAQsmZACpVKJh73Hna2PF28G5x+rSbX9tupHTM+jUmD+yC
         GgVyrkhP3t0MBbegTuFzfEFfefBpKMy0D2vpVAXNOVP54a6I3tsvehHf/NaKKIBZ/Tdd
         JB/B6W40iergpQA67eMzBPNMjRJNLxjwvIYY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fc9tivpfIRMekzY3db3T+X+KpuiUHIxykgYorNMpzAY=;
        b=XTj/BHHFAVUyymRGeYorkWxASwVkWPvroj5rvfGzJmzQQe8AP5TKtec6olFYlLrMs+
         BS7UcD6CMKDGsA7ulpckYMIEYR6hHxE2cTwl02hd+D4M8uYLegrf+ipOpeI+jjhDONh8
         e9t0/Ks7Vb6d8ZYEt3ioWg2PcRrggPKaGp4vBjGMezZXlIH6/CkEcWuxPP6hDK3WwNFr
         vj8WUH9Eku6dFvBsYxiWzwzvk63Liw4f2ANJcCsNNV4nqxmK3VsSwKzmwElnhIsAhiw8
         3F56JStDxyXAQlho8YT+kKqAfWoO4AyRMQgrOYnE2gJ0mnMRtz/f0x63H36AxXDV0dTX
         rgcQ==
X-Gm-Message-State: AOAM533UxRa60mE9SqAmuunxWNNp5hFTH4f5ctr6COcOz+OHTNhLAkl7
        2ZRF5nEeynxkF7B6iQHEW/NIq3mhUeZ+tg==
X-Google-Smtp-Source: ABdhPJwHj6K8X0ulS0b6C37O6g7wDEnl6esfV/5T0tlEyOHHvPf+p/ckhkxAwKS9Hgg4mzkOzpA3YA==
X-Received: by 2002:a92:cbcf:: with SMTP id s15mr585985ilq.161.1644012911421;
        Fri, 04 Feb 2022 14:15:11 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id m13sm1598021ilh.18.2022.02.04.14.15.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 14:15:10 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id m185so844996iof.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 14:15:09 -0800 (PST)
X-Received: by 2002:a02:cc8a:: with SMTP id s10mr527250jap.263.1644012909511;
 Fri, 04 Feb 2022 14:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20220202212348.1391534-1-dianders@chromium.org>
 <20220202132301.v3.12.I5604b7af908e8bbe709ac037a6a8a6ba8a2bfa94@changeid> <CAD=FV=XXFEM4u78qQZoGrdxpSTjdjWQ_01m+af_Xz1j_TNNDJw@mail.gmail.com>
In-Reply-To: <CAD=FV=XXFEM4u78qQZoGrdxpSTjdjWQ_01m+af_Xz1j_TNNDJw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Feb 2022 14:14:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VDA_=pW0jHPi=OpLf6xhe_Ln_eUPrCAoTzK_qyvb9XSQ@mail.gmail.com>
Message-ID: <CAD=FV=VDA_=pW0jHPi=OpLf6xhe_Ln_eUPrCAoTzK_qyvb9XSQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] arm64: dts: qcom: sc7280: Add herobrine-r1
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 3, 2022 at 3:26 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Feb 2, 2022 at 1:24 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > +&pcie1_clkreq_n {
> > +       bias-disable;
> > +       drive-strength = <2>;
> > +};
>
> As per the discussion [1] then maybe the above should be
> `bias-pull-up` instead of `bias-disable`. I'm happy to spin this, have
> it fixed by the maintainer when applied, or do a follow-up patch to
> fix this. Please let me know.

Breadcrumbs: since most of this series landed but not this patch, I've
sent a new version with the fixup.

https://lore.kernel.org/r/20220204140550.v4.1.I5604b7af908e8bbe709ac037a6a8a6ba8a2bfa94@changeid/
