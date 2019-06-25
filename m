Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B86054E3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 14:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731501AbfFYMEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 08:04:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36083 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfFYMEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 08:04:34 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so12466218lfc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3uLUVt4+PyqNapscbK0+INaqomQ7Z5R6bzOtCzcM84k=;
        b=y70lH7CknFBUGMidxKOvlg3NBuPtjELWN7zCCwvow/EINNy6bFm8mNyR6Vyd6UvF52
         RhY3L2JqU0ir6w0u6WNL0GjNgSh0IgsF3ZFa5a3QPl8VWGihDexXJrYA7EzvEzHxTMvq
         y7WG0fDuq+lS4i5oCH0rc6GwKwsnj76+lV+bJJyTOOLKA4GTEN6tFN6hga5TWqVV8NHs
         q1HhIyOFXgFTC99Vq9XQiN5TRA35gYKyboYVtnTQFgIMNL9ZJnPXkdjrg37fER7brPDN
         mKtlMR4lbLXLB5haMEKn2GsfWRxONdTUJkg0mZ9nW9PQA0VyBjz06vI+57CLOujyqS7A
         41bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3uLUVt4+PyqNapscbK0+INaqomQ7Z5R6bzOtCzcM84k=;
        b=j9dJiE2iLBSN2plg8SSSyR/JHdvJTHC0/mbXzFNA7+o0g874CjxrsC2vUcDgdZqY2C
         T2lxpNTbUeFxoORDMg6eOBTKgZMuJbWFRlD0+L6J3ZSQO2rwMSdolGigCi/OLNeKdyVz
         rbaIwlQtwgj6d/ywCT5xeVT98fEhEcgZKisOi1shIjOgWRZ4h7iaRHD/vK5yNmUGg3/H
         Lbh2uCd1nKuY8p0/q3u0xWnImLcjZNWIkn5M03NU8/u6dYHmM7T8z2s2Tsbmbf+TQXXK
         N4kT6tuZ/nmcjpdgAwdLHrkUdtEEqaGB5cDD0ZFyvut01uw2w39A/B27IN3JYA+ygx0Y
         tdYw==
X-Gm-Message-State: APjAAAVwa+CTBZKeHHYaN5x8zVRiZKfiCRbGRypCJFhjkz058rER4xmY
        ruy/jxJSEZCHclKat+KdDlRmcQ==
X-Google-Smtp-Source: APXvYqwZlKm9Js7mpJhkZw7bczSfxMxrqGRD7K41K+QVVYo/A92X6/6gVg711xf+1xlbsCrSu177IQ==
X-Received: by 2002:a19:4017:: with SMTP id n23mr85397272lfa.112.1561464272546;
        Tue, 25 Jun 2019 05:04:32 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id m24sm1915887lfl.41.2019.06.25.05.04.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:04:31 -0700 (PDT)
Date:   Tue, 25 Jun 2019 04:31:55 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <agross@kernel.org>
Cc:     arm@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.3
Message-ID: <20190625113155.gncxhz2aeehawflw@localhost>
References: <1561006911-28519-1-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561006911-28519-1-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 12:01:48AM -0500, Andy Gross wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.3
> 
> for you to fetch changes up to 2410fd450c09a126aefefc9106b4652285b5d60f:
> 
>   arm64: dts: qcom: qcs404-evb: fix vdd_apc supply (2019-06-19 23:50:52 -0500)
> 
> ----------------------------------------------------------------
> Qualcomm ARM64 Updates for v5.3
> 
> * Switch to use second gen PON on PM8998
> * Add PSCI cupidle states for MSM8996, MSM8998,and SDM845
> * Add MSM8996 UFS phy reset controller
> * Add propre cpu capacity scaling on MSM8996
> * Fixups for APR domain, legacy clocks, and PSCI entry latency on MSM8996
> * Enable SMMUs on MSM8996
> * Add Dragonboard 845C
> * Add Q6V5, GPU, GMU, and AOSS QMP node on SDM845
> * Fixup CPU topology on SDM845
> * Change USB1 to be peripheral on SDM845 MTP
> * Add PCIe Phy, RC nodes, ANOC1 SMMU, and RPMPD node on MSM8998
> * Update coresight bindings for MSM8916
> * Update idle state names and entry-method on MSM8916
> * Add PCIe, RPMPD, LPASS, Q6, TCSR, TuringCC, PSCI cpuidle states,
>   and CDSP on QCS404
> * Add reset-cells property to QCS404 GCC node
> * Fixup s3 max voltage, l3 min voltage, drive strength typo, and
>   s3 supply definition on QCS404-evb
> * Fixup ADC outputs and VADC calibration on PMS405

Merged, thanks!


-Olof
