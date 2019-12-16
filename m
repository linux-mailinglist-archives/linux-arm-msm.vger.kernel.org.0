Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEDE111FFF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 09:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfLPIiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 03:38:18 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34916 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfLPIiS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 03:38:18 -0500
Received: by mail-ua1-f65.google.com with SMTP id y23so1796364ual.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 00:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OP2XiHV+z9XRmOc6CVIQd7a0qzdvr1/Q3scZZYxr1/c=;
        b=r186NgrdfTPHE2tpoPDJa7x9tQuQ/QFHgodakc61Ob+nFNnXNgovHI3f1/7CUBT/1v
         4wcw0kUA9wCRMKc6fuAe+RcZzpp3T5EIzlUrObzeRWgYp5L0/dyQfTt8+/apH0TPJ7Oc
         2gVCCjJ9L61hrUgACxE7Gx2t7WFaRzRM7IpiJWo+wTfIg292hispYmrOsZzsBvoLMNfF
         Ir+O1OpLqiEbXITQT6ito6EowgfIVcrr5s8cMA7qBowJYvBKBKvicFeL2es39Dvv6J+2
         aYXnn6xwZg35oIC5h21qC/j/dgwQFtPSlC2JSprHr5rDSXU9LNIuIsQCUbktM0XaS5j7
         bo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OP2XiHV+z9XRmOc6CVIQd7a0qzdvr1/Q3scZZYxr1/c=;
        b=h36kZgRcBa8cR4vFXxd2wva8zm+8rdnFjQTBBx8Mf58eCvIRndNevlLMox3H7+huN9
         nEf3jkAekoLA+JQNJEzgdSlcWrNpzem0f7BKMOLBSYWxEqmdD4SqqQgiC2H4nYVVUaop
         332NQ0hIo0L9vbQ8qLx93mN7Ay7MKqq6BMrDbzjA+X/EIG6nr2HhnQgwfgqhGjKkC3Jr
         OUL5toBv2clRMWzz8DajTlOwAXCOIXnR5SbyoUV3CjyS1e6PhaBWaO083sEjoWKp5r3s
         rmU9eWYoc93UMdKP7JZXqDOV+udGM7Hzuj1o3OBvvmn0inIFubjTBulrQr7vXo7LfOFb
         6+Og==
X-Gm-Message-State: APjAAAVPqaf+TNBhdVHV1FdMHeGjF7vQIOGiKNCfOUlHsKSHPLNZFRev
        RgadTMc3cjUasDSYtLmEiP1RANb0fFmc2S3GD2lpMA==
X-Google-Smtp-Source: APXvYqxWyOGptlYcgZ8GG7DRjA0eoZhkshCQNRcbI8e/5CoIydNXg1zYY8yTVFSvvZjiGUSUFzsofLus8fU624q0t2I=
X-Received: by 2002:ab0:5512:: with SMTP id t18mr22644336uaa.128.1576485497137;
 Mon, 16 Dec 2019 00:38:17 -0800 (PST)
MIME-Version: 1.0
References: <0101016ef36a5c54-2907cf32-2269-4a8c-9447-b086e7c86d98-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef36a5c54-2907cf32-2269-4a8c-9447-b086e7c86d98-000000@us-west-2.amazonses.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:38:06 +0100
Message-ID: <CACRpkdY9ETQRHn7x2D2XVLZ810Uo1cPQxMBqTy5LnrORRNjTVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add new qup functions
 for sc7180
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 11, 2019 at 6:24 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> Add new qup functions for qup02/04/11 and qup13 wherein multiple
> functions (for i2c and uart) share the same pin. This allows users
> to identify which specific qup function for the instance one needs
> to use for the pin.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Patch applied for v5.6 with the ACKs.

Yours,
Linus Walleij
