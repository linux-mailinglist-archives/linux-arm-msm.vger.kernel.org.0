Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0E77B632C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 10:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239277AbjJCIGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 04:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239247AbjJCIGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 04:06:06 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B906AB7
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 01:06:03 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59f7cc71e2eso8057607b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 01:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696320363; x=1696925163; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+dCxHj9loHzO3/aljEjxLeeImmE0ebS+6n0wzTNDMU=;
        b=I/EdAr8xPZWXLEEj62X7a+wuYdYVmzHNiLeAyTv2FArjpMBUx0uGw2ianIOXSMc9Zi
         a4Ezx2ZvE7g6rnUWVVLXkFf0IYF9hlcP9jl4pPsQWAQ09vaqVeyxDiAxmzbCaxOorj7R
         z9PRrXzFe0z+pQK1sutAW2dJDrR14aMZp6SQsXEfoYeQbolzNCECf7fJjAxGN9IJ+3Ny
         gz3btNXbcowBBUAyCRBO1d8nz3+bqKJ2TXOsHzxd1giAkCS8cXv8yrUdxm09eFa2v8s4
         s2BAT/yOcg82Nxb8DzxYU1XnHaBwrMRA7vAFiovpHvYbu1O+KW9xCrqEiU4p72k45TVR
         6Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696320363; x=1696925163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+dCxHj9loHzO3/aljEjxLeeImmE0ebS+6n0wzTNDMU=;
        b=D1gJTfTzL99hkHQSHmHo19eMp5dR+7nBtETuepqRmKb6NydedYELa34VFvd59RQLV1
         m7HMqySDXb65XJDdkFWcbpq5VDEHwVvpczanBaPE+aF5k7F7Dln4aDQrijv+FaZWhEg5
         jnsyrowE5+5+9/N1VEEHkCy3lNd1Z/X52K8PMoOSzlt7SRlFSh8dQJ89U11YfSfkqLuO
         CoYYa++m2rsvRQyGGDF9vVFTHQ+syOLxOpSn9OZOxSC+OsDFpmQ3IczeNkkStELJfxjM
         u95JTxaHLPKfu5Bqe3yVhltdLNNtmx6lbwGbKmPnyLr4mrXiru2cReujOzGtH0HuDA8Y
         QqjQ==
X-Gm-Message-State: AOJu0YwSJesXgEIIi2smaHUWonzxF3puacTLrsr3wUQtX7SyhNY7Wte0
        oF/YSfsU5ivBcW/g1lLQmoUE73xOdftKWVioFRpz3Q==
X-Google-Smtp-Source: AGHT+IEqOjI+FF8gpM0hRv7J/2E2f4vH+CKbR/ppRY5K+RPqgRFAcoDQY30fbiDlg5LJV3atYQuY9xVgWztpUkkKYdo=
X-Received: by 2002:a0d:d54f:0:b0:59b:be67:84cb with SMTP id
 x76-20020a0dd54f000000b0059bbe6784cbmr13900277ywd.26.1696320362957; Tue, 03
 Oct 2023 01:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231002-topic-sm8550-upstream-type-c-orientation-v2-0-125410d3ff95@linaro.org>
 <20231002-topic-sm8550-upstream-type-c-orientation-v2-2-125410d3ff95@linaro.org>
 <CAA8EJpp2_eW+YukTq3eAFGXxtZ+YWYVkzEP9Qhs20TxoXy-v7A@mail.gmail.com> <a30c60f0-1710-405a-bb18-813ce30d975b@linaro.org>
In-Reply-To: <a30c60f0-1710-405a-bb18-813ce30d975b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 3 Oct 2023 11:05:51 +0300
Message-ID: <CAA8EJpqUQCXJB6V=aMnXxU_tmpefMiDno61WEvCL+HuewH3c9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] usb: ucsi: glink: use the connector orientation
 GPIO to provide switch events
To:     neil.armstrong@linaro.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 3 Oct 2023 at 10:13, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 02/10/2023 19:26, Dmitry Baryshkov wrote:
> > On Mon, 2 Oct 2023 at 13:21, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> On SM8550, the non-altmode orientation is not given anymore within
> >> altmode events, even with USB SVIDs events.
> >>
> >> On the other side, the Type-C connector orientation is correctly
> >> reported by a signal from the PMIC.
> >>
> >> Take this gpio signal when we detect some Type-C port activity
> >> to notify any Type-C switches tied to the Type-C port connectors.
> >
> > Have you checked, which UCSI version is implemented on SM8550?
> > Is there any chance of GET_CONNECTOR_STATUS / bit 86 actually
> > reflecting the correct orientation?
>
> I checked, and no, the UCSI implementation is based on the UCSI 1.x spec,
> and doesn't have the UCSI 2.x new bits.

Ack, thanks for the confirmation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Neil
>
> >
> >>
> >> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >
> >
>


-- 
With best wishes
Dmitry
