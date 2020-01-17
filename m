Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA4D91401DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 03:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388745AbgAQC0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 21:26:39 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:44054 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730284AbgAQC0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 21:26:38 -0500
Received: by mail-pf1-f182.google.com with SMTP id 62so4554298pfu.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2020 18:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:cc:to:from:user-agent:date;
        bh=VAmOrArutl62PzP5mzQbvYL4N//Br/2fAr/HcMCRVjY=;
        b=WIEMxSOZi1Icp0GFQ9ts2y7+gCgVfokCR/CqaPH04zJKpndx4rZ7vSgvJ7tFaaQyXO
         zExYBLNSj+Gq8Zix832ff+qMY6iQAKjuuW8Fqa+DrLwWMuW/6pSWo4HddYCa1Vx7Zn3f
         PPTJNFroyPXatSW3cKeDqXHGS4UTrERH5Wotg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:cc:to:from
         :user-agent:date;
        bh=VAmOrArutl62PzP5mzQbvYL4N//Br/2fAr/HcMCRVjY=;
        b=cDY1SEPZ2v8D3lXS8DR8+IkpSsCZw6FW6jfwQCPZXvzk2c8WHukCMHKttgtmB05U++
         CwD0xppcLRKBsQHcEvWd1bNZIJQzX7bVN9JpEqAZ+vgs66jqLBg2rLKy36o92HkP+pR1
         lCpfi76MSZTcbK622vg7ONpUqiNWMqFcyE3Y2HQSfVM0zXA0niP+ORIHEfslK+xPbE1z
         tshBK2fJYsNhFvSETVjmk1aGzcNTTD4br4032XsL1UWZckgvLahT4lGjsYKdE2ZPDXqr
         d85wSeos2j6EqrQmUwpyfGQ2TwZ8trnbx1AC0smYSlSYG0vzq3HfaCKtZXIRko0/qR9g
         Zjlw==
X-Gm-Message-State: APjAAAXIv9/IUMme/cTdOrIdGUinwlSjDzC3NXwNfbsM+rVwtzOYycWT
        DEu3j3T4Pjyg6uvjpyjHGNE3lA==
X-Google-Smtp-Source: APXvYqxpUd5r+QQwvhdp81j46cKbjAPZSkr2FDEgoseBTHLTKoZiDBze/ERqIArmFEUy8NVTR7eyxQ==
X-Received: by 2002:aa7:8e8f:: with SMTP id a15mr638012pfr.153.1579227998167;
        Thu, 16 Jan 2020 18:26:38 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m14sm208874pjf.3.2020.01.16.18.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 18:26:37 -0800 (PST)
Message-ID: <5e211b5d.1c69fb81.dd7e.0ff7@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7a8c9a5a39d9d95b9bfca1de3b1f63489d3a4d2d.1579203281.git.saiprakash.ranjan@codeaurora.org>
References: <7a8c9a5a39d9d95b9bfca1de3b1f63489d3a4d2d.1579203281.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2] arm64: Add KRYO{3,4}XX CPU cores to spectre-v2 safe list
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andre Przywara <andre.przywara@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Thu, 16 Jan 2020 18:26:36 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-01-16 12:03:53)
> KRYO3XX silver CPU cores and KRYO4XX silver, gold CPU cores
> are not affected by Spectre variant 2. Add them to spectre_v2
> safe list to correct ARM_SMCCC_ARCH_WORKAROUND_1 warning and
> vulnerability sysfs value.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>

