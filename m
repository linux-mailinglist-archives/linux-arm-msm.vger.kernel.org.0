Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2EC48C099
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 20:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfHMScW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 14:32:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbfHMScW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 14:32:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DFF1A20665;
        Tue, 13 Aug 2019 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565721141;
        bh=W4OBBaZc9LcvHS9HatCqQdN4d7XWyG+yszN82yTksxY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FQD5LQN17V27tvKt9Kd2arov/3UM0ptRAl2A2Z34C4HEHRpE22jmS9ClrwNULFS7W
         UAiGNZMu/7r9e2T2n9uMB2Yy7wl+niqvujxoLu/IF2+fmti0jpAFInSYZ6Y/y/PWNn
         QLLVW/+6ig3Qs2M8e2GY6aFik9Vb6CBtgQlrxwl8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190813130946.16448-1-govinds@codeaurora.org>
References: <20190813130946.16448-1-govinds@codeaurora.org>
Subject: Re: [v2 0/2] Add Q6SSTOP clock controller for QCS404
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, andy.gross@linaro.org,
        linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
To:     Govind Singh <govinds@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 13 Aug 2019 11:32:20 -0700
Message-Id: <20190813183220.DFF1A20665@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Govind Singh (2019-08-13 06:09:44)
> Add support for the Q6SSTOP clock control used on qcs404
> based devices. This would allow wcss remoteproc driver to
> control the required WCSS Q6SSTOP clock/reset controls to
> bring the subsystem out of reset and shutdown the WCSS Q6DSP.

What changed from v1? Please include a changelog so we know what
happened.

