Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E701F15D55A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 11:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgBNKRr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 05:17:47 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43694 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbgBNKRr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 05:17:47 -0500
Received: by mail-lj1-f196.google.com with SMTP id a13so10100672ljm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2020 02:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v8ypgl7dFd+FN00YxlfzHIJKl3YchrCCrbKgFjCVTDU=;
        b=MNxQ+HuCDY088dTom9PFOh4rxyHd576KmzzMsyWnYhyp0UpgWA19L6Nitp2AQc9dOy
         Karscw08YlX4Dg1W61ESUi5f/31NGIDZm4EqIus9tIQf+O5M28Y0jyTAuo9dR1Y0H0rz
         2AVAJRbtO9yn7RjFNZXS30hjpVKDSBST7Y0jgBDL2snZDVKS2dRMHy3QacypQ2LxKwZV
         trk4g/jfx145+VkRAcZ465GPkGogpEK8AuFur1fwyfBP6l7dThSPi/EbX65bqU7Qi44y
         VyHWfpFOgYhi74jRlwh6ixM7165ALYt30ELZoP2vcFxOIAzfaRAipnLZObe3Kz/Jmo8W
         S6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8ypgl7dFd+FN00YxlfzHIJKl3YchrCCrbKgFjCVTDU=;
        b=Efbv8gU7YdDNODF686Gt1qwpFZG+KOfpBiN49er+NZdDpkWiIzw6n382kEUC34/BA/
         6HLBD4Ckxvqf5nZLhGJH8wqWaQU1z8MzZX2wahmvrtLueMK8r9vj+dDKe0mX9p5ajMEM
         n9/Xy/qLQUmidHKhMYCsS3njhEqfpiZoFTh9WRbgU/Ejo+Gl8BB2y8uolnHgikc2uDtc
         UYPQ4ghKpCt6OStvwG4168wW9ee3jWdMSQfFwWf6FmEGaPyJ0wfPQGn0GG6UKW3CwVG7
         Q6RmgXo2Mt+Bmd6tgkYUVRj9RWRMpDf9hnYAKV8kRomeJJSefpRrdZtc0Gzr0VRUtLeF
         A+2w==
X-Gm-Message-State: APjAAAVIpM/BuCQNpU6RGtxQycCBKWmVBaFSbbNHFNAyB3i7kLAhSUuA
        3pZ0HiLgx6AeUSyCM+Vfp7LLp3ex7nKvaltiNmfnbA==
X-Google-Smtp-Source: APXvYqyC9kNfFIiiOrwmF4acw1MAKutkTjdFGe1E/MwMDJJksNCwGjs1TmU24KDB/f98Aqw0M3pRNognuV+WdjgeGVA=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr1678145ljg.223.1581675465087;
 Fri, 14 Feb 2020 02:17:45 -0800 (PST)
MIME-Version: 1.0
References: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org> <1579439601-14810-3-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1579439601-14810-3-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:17:34 +0100
Message-ID: <CACRpkdY-O3es1xcPxnb+3KKucUFx95WDXawnKeq1fo0rX9N+3A@mail.gmail.com>
Subject: Re: [PATCH V6 2/5] pinctrl: qcom: Add ipq6018 pinctrl driver
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, sivaprak@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 19, 2020 at 2:13 PM Sricharan R <sricharan@codeaurora.org> wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for ipq6018.
>
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

Patch applied for v5.7.

Yours,
Linus Walleij
