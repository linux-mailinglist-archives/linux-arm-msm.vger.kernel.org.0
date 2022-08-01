Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4B758735D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 23:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbiHAVbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Aug 2022 17:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbiHAVa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Aug 2022 17:30:26 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F41145064;
        Mon,  1 Aug 2022 14:27:59 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id q191so3951275vkb.6;
        Mon, 01 Aug 2022 14:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sspu1aiGL43nr9IVysaTZTIRtv+Zlrj4M8SxcKWXKe8=;
        b=EcQ+yb2pj+9XwqrMh8x0n8bWmA7iUyMxs6yLt3DI8gWRnbcC5NEDPuSjSjkM4NHIYc
         CsGW31+iDbrTA48NbN4OG2MvGFd8WxmrMqlo84cGQ56omjmeefxbdpaYhyauifQE10dV
         8wkWlkNU8tMiUT/cfmUxOaVENIfVyLBRxNg+4I6wqXZNw5gh/1dwQLg5sjP77RNZz2KK
         3QOIpZdFxmRESI6V4fWn6wW9m0YHI6iWhTsj/4dpQ3Aekw2Zr3WNahzjyhiTrr1zKafp
         BegKk6jyhepay28zKMgfUpLhU90+Gbh3BasdpnXRlp/WUOOz9JM6+eP9qz2jOteFXCHs
         WrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sspu1aiGL43nr9IVysaTZTIRtv+Zlrj4M8SxcKWXKe8=;
        b=pk8r5P3nYKshwIWbrzTTumTQdj+1+EwUARDjYGAtNJVDBMVSNu7zhfX1TfSsBrLG49
         rLlFJg41srarCswln2xttZtd1SRhY2nqcoVOVbyVcWMKjjUGgunytaDJHs7zAauu371i
         Drw1clRYY1CKa1C/IStrx3uPsKSQQc3MvhuKIAn0igyrJLMhQvWFb/OQtpO7E6Hol5qw
         HmKE+atEtXK0e0qz13PCQFOyF6yuiYqaR/7DwTU65MdPEV3BXEe+NjyQeDKS/WoH0iHj
         Cc9pEXKZBJ2jpqzNVEHnN1JJedj2up+lQ584g5JiKWmMqC6LNDbCpuX1+zgfL167+chw
         th0Q==
X-Gm-Message-State: AJIora+z9D9bW+R1Js+ZZScsx/mNFkPanfqt+OrUiQm88vcm/pzX7jCj
        LuKtKitHit4uBTNQSnYHhsMuz7ZSN0uo3dRs53w=
X-Google-Smtp-Source: AGRyM1tx/zSezNi6en0j3RfnKhWhRyd5CGqR9SVVi08Tq6qFZuI8XZcKG7Wv7OR5bkJTsFGp6c8ufAqcUT0MC26EQkk=
X-Received: by 2002:a1f:260b:0:b0:376:4980:e758 with SMTP id
 m11-20020a1f260b000000b003764980e758mr6586368vkm.22.1659389278366; Mon, 01
 Aug 2022 14:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
In-Reply-To: <20220801211240.597859-1-quic_eberman@quicinc.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 1 Aug 2022 15:27:46 -0600
Message-ID: <CAOCk7NoZAg234iV0L0fvon+16vEP4k4on72rtO-8bkeHL+yWqw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        DTML <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 1, 2022 at 3:16 PM Elliot Berman <quic_eberman@quicinc.com> wrote:
>
> Gunyah is a Type-1 hypervisor independent of any
> high-level OS kernel, and runs in a higher CPU privilege level. It does
> not depend on any lower-privileged OS kernel/code for its core
> functionality. This increases its security and can support a much smaller
> trusted computing base than a Type-2 hypervisor.
>
> Gunyah is an open source hypervisor. The source repo is available at
> https://github.com/quic/gunyah-hypervisor.

Nowhere in this series do I see a change log, yet this is marked as
v2.  How is anyone supposed to identify what is the difference between
v1 and v2?
