Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B4D172A80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 22:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbgB0Vxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 16:53:34 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44709 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729817AbgB0Vxe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 16:53:34 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so932061ljj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 13:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TciHlSTKGVGSwBjPpE6GdszVZvGGFdsKopsqP1eqA44=;
        b=R9wmRG8Zsj0hupJPPywP6/bpn+fXxWpBBjyuLdxnZKe76Pvx+79KpCZfPuJ6m9zgIB
         83dRXWqAbdH8mdUA2m5R6w1L5Jt/Nectudrnnm3VTIY8OxyPthplqvxqfFcG5SmgXxwL
         hEhb8GB0mIoGzRzN/dD6W9G//QmE5GgVN2PmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TciHlSTKGVGSwBjPpE6GdszVZvGGFdsKopsqP1eqA44=;
        b=Dc/OsdzbKLEaSuGn2FBHu+tuHCVDAtbNdFkLPqu91p2/8392sPjhaiZ7aaJnTn4jK8
         wLHN383td/Vs+lNqhk4qEB9ZqPtKpOboDw0DNPuIJdWQLuSNtwmuB07oKCsknYBJSHyz
         vSZPakDoRhVelr7oAUBxJwPK+YYWH0ca4QOPvdN93wGPxhJFtJOqibTT86mYLI6c+L12
         8s5x5SIQpzTYGq6B7koeaC0euEbZeX8wPPa2xpYDKYVOTLxIKV1baQoj3+qwBdrgYzZs
         9JYIpUxtQ/O6RxBUUWSIId0d/U5RYFPCCR07joJ74DKJ2Rx78iO1TYeRIwuRiYjXCsuf
         mCFA==
X-Gm-Message-State: ANhLgQ3VUE+TvEo1E7qaDJKEugajWBp9CMfk8YW48gRr3Gl5hD1tFCQp
        29MnbxnWENj8PKj3Gl5xCpJtikjvfo8=
X-Google-Smtp-Source: ADFU+vtqSWHKGqdNISkrMHVKcdwOMrDxWSFMgLx1sMCL5xdXsceucvFFR6RV+hoKNNpqe3ZCIDmc+g==
X-Received: by 2002:a05:651c:1045:: with SMTP id x5mr727307ljm.266.1582840412141;
        Thu, 27 Feb 2020 13:53:32 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id h19sm4080560lji.86.2020.02.27.13.53.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 13:53:31 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id w1so972194ljh.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 13:53:31 -0800 (PST)
X-Received: by 2002:a2e:8702:: with SMTP id m2mr734336lji.278.1582840410701;
 Thu, 27 Feb 2020 13:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20200209183411.17195-1-sibis@codeaurora.org> <20200209183411.17195-7-sibis@codeaurora.org>
In-Reply-To: <20200209183411.17195-7-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 27 Feb 2020 13:52:54 -0800
X-Gmail-Original-Message-ID: <CAE=gft5YrX9idSOgam5JR3m_R8OZ0ZG6KKe-w6GmtmxY83OPnQ@mail.gmail.com>
Message-ID: <CAE=gft5YrX9idSOgam5JR3m_R8OZ0ZG6KKe-w6GmtmxY83OPnQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: sdm845: Redefine interconnect provider
 DT nodes
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-pm@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 9, 2020 at 10:35 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> From: David Dai <daidavid1@codeaurora.org>
>
> Add the DT nodes for each of the Network-On-Chip interconnect
> buses found on SDM845 based platform and redefine the rsc_hlos
> child node as a bcm-voter device to better represent the hardware.
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
