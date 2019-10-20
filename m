Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8965DDFF3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 20:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfJTSU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 14:20:29 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:36154 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfJTSU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 14:20:29 -0400
Received: by mail-pf1-f172.google.com with SMTP id y22so6890877pfr.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=hPpICzNZ4Kh87S4bTYCVObRqy3CHa+mSHYJpyaWsGjM=;
        b=bhffvDjVvdeFW/Tx78BtMAZVB8MmP3/OQBSp6HjqtMP8LyYpafnXDE/wsiq+AvVOKY
         8OvGACyriUjlq/mCmqnQm+CFvFAJKcU9RM2aPGmvPhm+5SBbmDXMSzWm1RMnRAaQqs11
         Xa9XawAtOzu61KafTJmjBMdZxOjhRB3SuO080=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=hPpICzNZ4Kh87S4bTYCVObRqy3CHa+mSHYJpyaWsGjM=;
        b=prX+vGMZG6/m3xUdNpFl1YsS1uC2FGwiqtb6uWCeBI9IYgsT6uaRDQIHyOZgG0+HBz
         eU7kxoOqY42J7ql6BjknvlPTAUVyDt/a0Eer0VU5HEXpji4ooWEjApRfIn75C77wDuyh
         QxWZpRk7U4psoYT0lBd4OLrEzYWbuHZx/F8OVyLSeyVW+lo9hC6AF1BYdgWTxyMQAibC
         b/FmGDdqIcozWFzS3Iht2Vnh7rSdnrpOm4ZyKzYZDZ7Dbm62s8tUjo8709Xc82e1PglV
         00x/WkNkijLa+k9AG5CpFGWebcYQut1lNChOr4h8+ho5jKstpKusgX7NmMSC40/X7LFn
         2pWg==
X-Gm-Message-State: APjAAAWwsUIAj8m2mGSFD7nhpPf0zpyJ9cmIrk8YcB31nq0/tdAG60jm
        YEVODVLRpVN/iLMTiTA4WG3mBg==
X-Google-Smtp-Source: APXvYqzfECRM11aVxu+TNtHORkU10rSq08jh5g9G7KzF4s/YTxkke2dpbf/yjDPkiZ2BfBZ0dIhqxQ==
X-Received: by 2002:a63:d246:: with SMTP id t6mr14765447pgi.5.1571595627178;
        Sun, 20 Oct 2019 11:20:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v35sm15092846pgn.89.2019.10.20.11.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 11:20:26 -0700 (PDT)
Message-ID: <5daca56a.1c69fb81.41ec4.5d65@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7b896d05df926c6443758b3162c24eb3e1d7510c.1571484439.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org> <7b896d05df926c6443758b3162c24eb3e1d7510c.1571484439.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 1/3] soc: qcom: llcc: Add configuration data for SC7180
User-Agent: alot/0.8.1
Date:   Sun, 20 Oct 2019 11:20:24 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-10-19 04:37:11)
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>=20
> Add LLCC configuration data for SC7180 SoC which controls
> LLCC behaviour.
>=20
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

