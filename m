Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844866EDC9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Apr 2023 09:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbjDYHaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 03:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233589AbjDYHaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 03:30:18 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071BB12CA6
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 00:29:28 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5083bd8e226so8234039a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 00:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1682407753; x=1684999753;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jHmIZD4RXv4wERr6vBqr7AcaO8T03eQv3P/wXRu/HQ=;
        b=gzhTsr4+WChTHJvHWdXXBrW9ux1sRr2gpeKZ4tIk82UreaDk1LdMl7b36UHj+0hLtU
         OiT1r57rNIo0j9Of24Diao9PsmFMMm8bfVyq8QfM2MDf2gYrU/ZGEKjFWH6OE3eVMB3I
         JR9IsToZqY6kYZEhnuw31CscY6m0cIvQdim2wmcyRkUP4+hp3GNTeqJ4MLQO3LtB3gFv
         DPDssDl/9tludPQ5os+/vLV/w2N9GuaeVidSI0TOQp0L1uddfTdOqCkHq6bIvVHM7OkD
         rGE/oqvnWfN9qDtk0EimhGoO/0qzRSv6E+Wa9f/ROiZYgKxLT0IxLBvCol4CRSQPZOe0
         qcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682407753; x=1684999753;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7jHmIZD4RXv4wERr6vBqr7AcaO8T03eQv3P/wXRu/HQ=;
        b=hNdqed5CidZId9F9z7qypUS9AOEn8dq1wIf8P+lsU3imikJoR1gKnRnS4FMTyJjHsB
         q0Q5wL17AZPYTRMu82Y1lqY0YdJf/sipLQvKDyJVfwQrAdwvHAZf8Ff1J2HAxv9v25gu
         QIfk+JsRaVAreKVdeGmsZNF1ujU6WX5N0VM4H5/Povy46k4+S00Dg/MElPi4qGTCbUoJ
         RvPUXli/263uXVOG6gAy7tesJ7VC9l5u1D6Q9TqscDUfHSw8SXkqj8bJfNCzNzIyFn1Z
         Txeu5IHsvZPcWRUWkcmhopeMKfI9kC0/ZYs/ijpPHFq9DajO1kXhqbBpiYmHZj/0pYnq
         umeA==
X-Gm-Message-State: AAQBX9fmmqFdHwA680MXzvvioA6W/avdghXYyZJqtlbWf+C6penUbBQ4
        F5TNXLDnAuvi/qXwL5fj8P5rkQ==
X-Google-Smtp-Source: AKy350bl/3t1ZjKngKuumsWAFjbUMjnA6Q8pky9nKyUkME5rUVYt2VcTxPzCwIYBhz6EOVxCh3lNgw==
X-Received: by 2002:aa7:c316:0:b0:506:c1a6:2771 with SMTP id l22-20020aa7c316000000b00506c1a62771mr14871319edq.39.1682407753214;
        Tue, 25 Apr 2023 00:29:13 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e9-20020a50fb89000000b00504ada6d718sm5363494edq.38.2023.04.25.00.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 00:29:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 25 Apr 2023 09:29:12 +0200
Message-Id: <CS5NRVQOIUY3.30RZ3BCV0OI7B@otso>
Cc:     <caleb.connolly@linaro.org>, <konrad.dybcio@linaro.org>,
        <subbaram@quicinc.com>, <jackp@quicinc.com>,
        <robertom@qti.qualcomm.com>
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
 <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
 <CRWA2OP2T6KT.RCWAVWF5Q2T2@otso>
 <ccc9fa4c-ca52-d8f3-a8b3-45031bea673f@linaro.org>
 <CRYUWMIJDSB2.BJWEPJEA3Y1D@otso>
 <75d00efb-ff3c-b1f8-a141-3fa78a39557a@linaro.org>
 <CS2D1E4ZYKZ8.2CWDCP9VR0C11@otso>
 <c0a231db-ba7c-c540-a745-3fd3dc47abe0@nexus-software.ie>
In-Reply-To: <c0a231db-ba7c-c540-a745-3fd3dc47abe0@nexus-software.ie>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun Apr 23, 2023 at 12:16 AM CEST, Bryan O'Donoghue wrote:
> On 21/04/2023 11:26, Luca Weiss wrote:
> > With the "user-space triggered role-switching" patch I can see that
> > whatever scenario the USB-C port is in, the role is stuck on "device".
>
> Hmm.
>
> Could you share a branch ?

Sure, at https://github.com/z3ntu/linux I pushed the following branches.
All are a bit messy, sorry for that, but the end result should be okay.

* fp4-6.2.y-wip-tcpm2: TCPM patches v4, worked for the most part apart
  from the host mode not working in one direction as mentioned in the
  emails there

* fp4-6.2.y-wip-tcpm3: TCPM patches v5

* fp4-6.2.y-wip-tcpm4: TCPM patches from the branch you posted, probably
  not much difference to the previous branch

Regards
Luca

>
> ---
> bod

