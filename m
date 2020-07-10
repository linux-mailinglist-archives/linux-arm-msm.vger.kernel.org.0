Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DB321AF3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 08:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgGJGRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 02:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgGJGRC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 02:17:02 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDE9C08E6DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 23:17:02 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d10so1832912pll.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 23:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Dm+DnuSu65AAz7ad3kKqpwMvvV9c9j5Xmv9xtyqJu+8=;
        b=XxwiBGAN+c26EFwmdNtyCR5546KEhOr6l15A/2WA1cMLP8pN66LrG3+GuOSJsd6Hp1
         P3RLqUYcFx0leBYljcKfft2ychVjMOysL/rNcIN+uHyImok3/nIrLFNcnANED1dCbRYj
         AS5NtypFHnNy0fI3n6QTErnWlMhhZ+KYQiiF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Dm+DnuSu65AAz7ad3kKqpwMvvV9c9j5Xmv9xtyqJu+8=;
        b=NRZD3RrKyadCA9PDY647GuCo67yNn9PTk4ONJDLW4m+voLjAqCRivowD03zpOiq4x7
         KWSCsJh9Dl09D3EDxn9APws+GZpyD7foxK2e5JfOlanoRMYksluJgANkgInd/T0TJIKv
         4cwbY7CKJ8pfIv3JeVOVWyAR36CfI7N3Q2+HD5Nyh6DLesv4+IU0T/qfez4c8fHMRArH
         PHV3fvj7RHS5TdKzDRj5ZyggoBemj0MYcDhUdZ2fgrEkRgT+RSENFhfOKMvPawDKdup0
         CgtKmrCipl2NzVdkH2tkhoulVa8uAdA94nTN8n/ij/0eQz/B3QALhvWKLd/H5Bki7uPh
         ZNrw==
X-Gm-Message-State: AOAM530/7EHCPrlbt2ci9Nf14MuLSQpiXVibyq7mZXBBAfPffYOGgxPn
        dlCIiJqwr7upV6jOVQlf+sMGcR7yE/M=
X-Google-Smtp-Source: ABdhPJxeORysV4VYKgc1U20BRm3mRz4m6pPLeqkD6XUKkuZx9wgWwg2gIJCbKPZnAH4/WMJhJFYXPw==
X-Received: by 2002:a17:90a:30ea:: with SMTP id h97mr4037122pjb.32.1594361821473;
        Thu, 09 Jul 2020 23:17:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id v197sm4888519pfc.35.2020.07.09.23.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 23:17:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594235417-23066-4-git-send-email-sanm@codeaurora.org>
References: <1594235417-23066-1-git-send-email-sanm@codeaurora.org> <1594235417-23066-4-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7180: Use pdc interrupts for USB instead of GIC interrupts
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Thu, 09 Jul 2020 23:17:00 -0700
Message-ID: <159436182019.1987609.12377232042152594056@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-07-08 12:10:17)
> Using pdc interrupts for USB instead of GIC interrupts to
> support wake up in case xo shutdown.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

I suppose wakeup-source should be added in the board files.
