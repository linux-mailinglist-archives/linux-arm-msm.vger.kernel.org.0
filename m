Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCFD34E29A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 09:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhC3HzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 03:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhC3Hyr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 03:54:47 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE1FC061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:54:46 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id w11so5736649ply.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xy5n2ZjYeu50xNrbkfvZegJVRO8o58K5oJo4KWUxE2Y=;
        b=dcgHsWK1o7Evo+tSpxbnU7pQvPEt0SVedYITmkyZ7hWaSMK2buuZx79Pi94Kbl5iD9
         m+zTpeQn7E5qE8qj0W/cFOrQqIoh4fMOWJHkCqKHQojRQo3FhpvI6pHvtIr1N0OjWkku
         8UOPVdPQKBPY1Kbi1MEtHxwdVOtJmLNjrj7tyqnwhU0rG5P1NLylJx21yyE/NgBCL3ox
         wk3mH8giqKsnfdqAl/TpH1Izb320vzNPYuESVI2tE57Rzm1q3sdRoz31XBsYWNYTZA/b
         dHE/yok+H3y7qt83Xq5B7oRRe3HbAYRK4lM/0Dju49yja98Z6N7/p1ZhIzY3CpODQ7yA
         TGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xy5n2ZjYeu50xNrbkfvZegJVRO8o58K5oJo4KWUxE2Y=;
        b=gZi61o90h5X3uyw9vA7lz1D5uNA5f9A6pIvbYxehBS+PAp2QswJThnBSsTt0ArPsxS
         TScKqGjPuPIlUqFMnY+GVvXc+chFNrjsbo9Pl+4PIy8OoI3lTE4BNh8VeyRcI8x9m39P
         wjsCer6c9CjGt8HMtvmbxLGOuTOMz3MlpDGgpUtkVHPX8k/UZllvrD/HGDu8Z2Kj6mox
         qesMDLyibCGTz6qff87l98IpNR/uIPMbUnEc9Ve9OcwtmaRO822Oa7HyDRIDXX7gILNp
         ZzWKQTqN0nh/IuBiG2feELmyR55BcAr4Pfl9hW+bqWpPVNCpSDws6EDlY96vYKUFRbH1
         UTsg==
X-Gm-Message-State: AOAM530iJck2h3wsrymDdx9yrUKL3HVHe0vKoTwmMy7k+m7TfTPtTIoV
        z/X535xoazi/c4KKFeaEtuus1318IP4gjVKzDsZHnQ==
X-Google-Smtp-Source: ABdhPJxkN1LxQLahq1BuoNFFoX+Car4xmUj5L4S5rqhujQWBYEqnqsOdU9cTSGZ8HYEvorOziY/juBzXW0jcpKgPz1s=
X-Received: by 2002:a17:90a:1463:: with SMTP id j90mr3100022pja.205.1617090886311;
 Tue, 30 Mar 2021 00:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org> <1617067704-28850-6-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617067704-28850-6-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 30 Mar 2021 10:02:55 +0200
Message-ID: <CAMZdPi_qu_3qvyvRo+fqJ_qDaMuKr7riDfuvddba-jJ_3Y-ecQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] bus: mhi: core: Identify Flash Programmer as a
 mission mode use case
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>,
        abickett@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Mar 2021 at 03:28, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> MHI power up can go through an EDL to Flash Programmer path when
> the device has a blank NAND. In those cases, mhi_sync_power_up()
> can timeout waiting for a mission mode execution environment.
> Allow a successful power up instead by identifying Flash
> Programmer as a valid mission mode execution environment with a
> purpose to flash the device image contents.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
