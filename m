Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C454E7446
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 16:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbfJ1PAS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 11:00:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38545 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfJ1PAS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 11:00:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id c13so7049653pfp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2019 08:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:cc:to:subject:user-agent:date;
        bh=MTTVVCGnYYa+0y7u4ASzLEPiU17XRxSToavC2yaOJYI=;
        b=IO3JNKK/w9Pw+TBvaaeDL+vHVoIXi3Bca/2/Pih7WoSBuzCqtP7W1mBQLha0Q6fZTH
         1/tuL7aUzLgbrahGTyKjk+xJ3iScXtIz64qoluta9k/H8Ga6Pe042pgsaOMpEvJoZluh
         aNPyLeU8NNFBD1X09tKqOe09KVaIfBowwLpg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:cc:to:subject
         :user-agent:date;
        bh=MTTVVCGnYYa+0y7u4ASzLEPiU17XRxSToavC2yaOJYI=;
        b=kuHorzd5Y1rVNbiFXNFFLLmSMsjIX8CEOlZ2eUekL1hg23moE0p2/Bp+90ckooaZV5
         OLhl1DJV2CxTJwiOww1JSSKu/M8WTWW/WTU+TC/c64lhPnFr7S3X9Ir7ctp0mkPOp6YF
         BepvXPsxkDLWhdwj9mkkVj7MWSSJDcq8brMKvC4/UtspFLmrLrcDVRlnAPN699vqiPWg
         oHRBpz6pED7uACDYTdf9fhAkGxGTTbyi8N7Fi5sYn9gsgziuNQXekdC77n1YXb4S9cS3
         qk5gzTGHm5FLupwk5Zq7T+Ladmv5pFbBoPcvnkk/Xbb8b1alWXIzRGvtnGzDBV5hA+X4
         RA9g==
X-Gm-Message-State: APjAAAXGy3p8E5AWHMGHP8vJ5s1JUegpaSwaePWZx6KpYeInY3OR59H4
        xuRkbbKLmw/dqPhbqCgbTjw6hXcVlmKdA5EJ
X-Google-Smtp-Source: APXvYqzBoVFd0sHisLrTISIXTJ2g2OheAr8faUVDpE649aEq5i8UVcr2ktpqDSPiVqc2A6BLLgnnWg==
X-Received: by 2002:a17:90a:304:: with SMTP id 4mr524532pje.128.1572274817037;
        Mon, 28 Oct 2019 08:00:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r33sm3125806pjb.5.2019.10.28.08.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 08:00:16 -0700 (PDT)
Message-ID: <5db70280.1c69fb81.c9f08.a848@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c20319ce-77e2-a4ea-5d7a-a84b8858a938@codeaurora.org>
References: <1570700803-17566-1-git-send-email-akashast@codeaurora.org> <5d9f3f4f.1c69fb81.5120f.b90e@mx.google.com> <a7dabb1d-b6af-acc5-ba4e-923ee5fc6ee3@codeaurora.org> <5da627aa.1c69fb81.e2d51.203d@mx.google.com> <c20319ce-77e2-a4ea-5d7a-a84b8858a938@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
Subject: Re: [PATCH V2 2/2] tty: serial: qcom_geni_serial: Wakeup over UART RX
User-Agent: alot/0.8.1
Date:   Mon, 28 Oct 2019 08:00:15 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-10-17 04:10:10)
>=20
> On 10/16/2019 1:40 AM, Stephen Boyd wrote:
> > Why can't we make this driver use runtime PM?
>=20
> Currently there are no plans to use runtime PM as we are interested in
> enabling wakeup irq as part of system suspend only.
>=20
>=20

Does the wakeup irq code require runtime PM? I thought that any wake irq
attached to a device is armed during system wide suspend and disabled on
resume. See device_wakeup_arm_wake_irqs() called from
dpm_suspend_noirq().

So why can't we use the common code that manages wakeup irqs for
devices?
