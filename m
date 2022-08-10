Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8525558E60F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 06:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiHJENP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 00:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiHJEMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 00:12:41 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D5A74DE4;
        Tue,  9 Aug 2022 21:12:40 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id j8so25536657ejx.9;
        Tue, 09 Aug 2022 21:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TrFjVqflz6+wQGcWavh3EQvquqkQRAgCycEBYuU2UTo=;
        b=i2pGvVH+FOi/R2alPbVQa3dXjN45ZlmOWsqBJiBGgY3UhBXJ6nrlKJHH8/95NKF38l
         G2kGd9/Kb/9pPDnxdd9sDjC0uXqnWXTm2Tr+qfUcu3FmvAJC+trdvOxGqnImAhc9NRTt
         R16Ufnh8swi2ySTlZ7QEMhgmpWCa8a1MDuXGbnsQ6LQr6ZkaPTXjHCXCNRnbdiMpatkD
         QY9NNTidctlNXIIwfTyktS6xD0gg/bcsBphzJD0GNwYu6mE+ZuLPFjTeRag0Wh1YSbda
         nh+96uE0NEZXNCx7Z365a/ZLkIXAOfqBoi0CCn+SjlIja3O/pyWGTu1TvysIlCcypOen
         R29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TrFjVqflz6+wQGcWavh3EQvquqkQRAgCycEBYuU2UTo=;
        b=zmp69EklaXlNfUC+sEvmkMD8CBLCD+vBebrgwLEdNFYnugSaehY5rSNZh5JDSMBjZI
         MtTdRMM/Opu+C87atQDFn5CkJbmqYPxSPVvxYzkJkFRsBqEAyhlpnRfCwBTKbePKJDSN
         rA2aDcuRzrXzja+o9V7UfvTYjhUT9ARJNNjZCuaFXu7JDJK9Fx696CVF29vf4NW5WrOd
         FvCr96vXMMM50JAGdn9nY99bSw2DziXzZ8J5q/PhymhX9vxh3xEuqAyBc9Eq6Q/301Yp
         ZAuoX7svED2rmbgCbe3hmWsWQWriYIHo//JEVQsuzJlD9kYS/AzUF2X24SH+X0eQUHxS
         lMow==
X-Gm-Message-State: ACgBeo206zpGO+SYwvSorRFueJbNdk7JUcDXL944MdXt9gkpw5v0txOh
        5fEd3tx15ZwFIDZtOf4ozrq8U0izGGiFY+Nii08=
X-Google-Smtp-Source: AA6agR57Tqz8I7fcOeweGZq8o7N7WtanULxpiLpAZJVwRn6LNp+Md9gja04FimwmnIJqoqIMfnF6EaA98rqnqZbAoWE=
X-Received: by 2002:a17:907:9809:b0:733:1ce:9564 with SMTP id
 ji9-20020a170907980900b0073301ce9564mr1865820ejc.363.1660104759290; Tue, 09
 Aug 2022 21:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <50230652-c1ae-4ce2-907c-9bdc6b827f8e@linaro.org> <62073cb8-0211-3b49-11cb-aceea6df0845@quicinc.com>
 <a71bea49-130f-61d8-2692-23ab9a8fe939@arm.com> <36303c20-5d30-2edd-0863-0cad804e3f8f@quicinc.com>
In-Reply-To: <36303c20-5d30-2edd-0863-0cad804e3f8f@quicinc.com>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Tue, 9 Aug 2022 23:12:27 -0500
Message-ID: <CABb+yY3MESqeZveYg5e18PWTLNcg82r4AtaRYJh-9c==mysw7w@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 9, 2022 at 7:07 PM Elliot Berman <quic_eberman@quicinc.com> wrote:
>
> On 8/9/2022 6:13 AM, Robin Murphy wrote:
> > [drive-by observation since one thing caught my interest...] >
>
> Appreciate all the comments.
>
> Jassi,
>
> I understood you have talked with some of our folks (Trilok and Carl) a
> few years ago about using the mailbox APIs. We were steered away from
> using mailboxes then. Is that still the recommendation today?
>
Neither I nor Google remember any such conversation.

Doorbell had always been supported by the api. It was the
doorbell-mode of _mhu_ controller that had some contention.

I haven't read the complete history of Gunyah yet, but from a quick
look it uses the hvc/smc instruction as the "physical link" between
entities (?).    zynqmp-ipi-mailbox.c is one driver that uses smc in
such a manner. And I know there are some platforms that don't call
hvc/smc under mailbox api and I don't blame them.

Let me educate myself with the background and get back.... unless you
want to summarize a usecase that you doubt is supported.

Thanks.
