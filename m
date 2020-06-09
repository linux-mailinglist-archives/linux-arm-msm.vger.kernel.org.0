Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320E11F4982
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 00:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgFIWn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 18:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgFIWn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 18:43:57 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBD0C05BD1E;
        Tue,  9 Jun 2020 15:43:56 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id p20so335731ejd.13;
        Tue, 09 Jun 2020 15:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vXB5gpluMB0lOFLBpitZlFgfHQ/XlzIJ+dmR9JaAw9s=;
        b=AzHtaE2Lkh8H/AOyQ7Dg5nOjigUf6h3B/3+Xp9DAKQK7f+uZnR6M9AkGLq3D/zEPf6
         KGXydAltBQm2TxdndJXEP+baK+nPaU686iV3+QIDmtk7kh1gKiS2bcHfaqbwedUW7pC1
         Yt6wLdqm3TS6OcpJ2JhrixMI2NtFkZtOKQyPJNpiLMtAJs+maq2Qy6/OBzIlB4yp+l8h
         p0MIb0Ify5P8uhD+oL7q1YxFVxEz7a0UUJgIeS76a4P2mmnCXu8xrGsNlS+QvUzebo6K
         pIItD1us/1Ij9KQTdPsgCNNaOi9UhSeQSt8iNktOJ8Z8y9xPnFUXt8qFkVwKfZ/pJyeh
         33yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vXB5gpluMB0lOFLBpitZlFgfHQ/XlzIJ+dmR9JaAw9s=;
        b=oP6vGhJRtvKcgQ63St2/nuNPEjGl24a+oNNi1+dN9ymWN9DOc59x9QKMkNDXgQXU/j
         7t1vDYK9EI/kp3l9j1cDGop3d0axO8ZLDQAH8GQsJ4N7rrKg0yiWMgEUjKXXDmIpVGjh
         V0kSoAS9sGBzVNt5aFSsdLTU0pCAlY5Hc7Mnd8b0HkzICXgnXDuwadseLPkkUOoJWlVD
         UfWiU3HI+Unlu5IhpO5xNWVJ3aoXUZLEQU01Rpz8nwTnIWT4JLz6b+zMzUqXl1CR9LNx
         A3FzSZcFK6wqR45qtuoTgDHFv1c0ag5MkSZJKrW2DkemwHRsqs/fucBwD2frVzUpOIeL
         ULhA==
X-Gm-Message-State: AOAM533mRrEGGB7w63nN5XpFuBq7TW+ZwZfB5hT4POIV+nQZyG/thNWJ
        v+71XNNpelRe6pxAPT+jAMz3fy8LAe2cMikKzqQ=
X-Google-Smtp-Source: ABdhPJwN9jPv4IolKEOumXAjoRwK0NMxIMFahAbn/qm7zvM/qDz5Awmao4/g91Kf22umfwaTWyzg6FBx2yTf3qJgUWk=
X-Received: by 2002:a17:906:5e06:: with SMTP id n6mr550181eju.504.1591742635550;
 Tue, 09 Jun 2020 15:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200531174612.260113-1-konradybcio@gmail.com>
 <20200531174612.260113-3-konradybcio@gmail.com> <20200609221917.GA1595469@bogus>
In-Reply-To: <20200609221917.GA1595469@bogus>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 10 Jun 2020 00:43:19 +0200
Message-ID: <CAMS8qEVZuGh-hkUQDoC0avSb7gKkWE7cswvhXHZHJhDPPU5u+Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] Add compatible strings and the include files for the
 msm8992 GCC.
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>'dt-bindings: clock: qcom,gcc: ...' for the subject.
Will do.

>Don't care about DT on non-GPL OSs?
I'm not sure I understand? Now that I look at it the copyright to TLF
looks kinda out of place.. what should it be?

>License?
Derp. Will correct in v2.


Thanks for your review
Konrad
