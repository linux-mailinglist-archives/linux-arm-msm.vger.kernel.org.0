Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A4946258E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 23:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhK2WlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 17:41:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbhK2Wjz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 17:39:55 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269F8C1262BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 10:02:22 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id x5so17778173pfr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 10:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QXp6Rjdb9so9tn9PWuGIbuOUwfs9Jwsb1LIx5Ujs/yw=;
        b=OWuHk7RoCEwXKDMDXfCljE037wZMeREf4yKV9u6svRDiDf1m8rOYK2y6iK2FrztOTt
         ulu8jIK1sFPK88tkYTVGUMBm/iwGCD1nk1R1B5xcDAuMU8MRkTSuxNThPJ+ExZYIGyG+
         qn/tj3SRQs4Igp74uqeU0o/fqEg5xwKxZp3CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QXp6Rjdb9so9tn9PWuGIbuOUwfs9Jwsb1LIx5Ujs/yw=;
        b=bBEkl2iRjLfqsDF2XC243xLTk36LYyZyxKz6bTiA2NHaxHlrOcMAiG5WImhyhSArce
         ikK1ewbtC2f8YRhdUUgBhLwGe5mVxCQkBLKkuvZFO+KSlc1CK7qs/WN+UQMXlXai1VK9
         /BiOUiz5CSTB/cnwfZLI0eBWJjB3Dfp7cYMdTIBbaA9jfwHzfCrMz90Ll+7e3dstggAn
         m3p0oCnku2J4tnL4c5jWVmwp2SNFts+iM9vIlZDqip25AvVUj19yB+/oVRaaG+G8YRU1
         SzQ3i6ExY7i+Y5xrBFhCqszLSmNhMFWKXn/PvkJ4HoBTftcW8dxITlwza1M7Hd4RcpqL
         l0Jw==
X-Gm-Message-State: AOAM533UB9ro0nOcZt6TgRA5xnha8A9DSxUzyqCsz19aGvDDt8844flr
        pVY7Vb+AkTElluaQV3e7REedmA==
X-Google-Smtp-Source: ABdhPJzmsIA11/pFaCm4cakUSOz2ziL/uU5FLtsc2LHAl9CDHjLHoupWOsGCvTUPwfVjMQ9Wn70QUw==
X-Received: by 2002:a63:1956:: with SMTP id 22mr36174289pgz.452.1638208941713;
        Mon, 29 Nov 2021 10:02:21 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d16f:3a09:ab7a:238e])
        by smtp.gmail.com with UTF8SMTPSA id k19sm18083179pff.20.2021.11.29.10.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 10:02:21 -0800 (PST)
Date:   Mon, 29 Nov 2021 10:02:20 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH 1/2] arm64: qcom: sc7280: Remove USB2 controller and phy
 nodes from common dtsi
Message-ID: <YaUVrDw9j0Aks/pn@google.com>
References: <1637837815-8532-1-git-send-email-quic_c_sanm@quicinc.com>
 <1637837815-8532-2-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1637837815-8532-2-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 25, 2021 at 04:26:54PM +0530, Sandeep Maheswaram wrote:
> Remove USB2 controller and phy nodes from common dtsi file as it is
> required only for SKU1 board.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>

A series shouldn't break things if it is only applied partially (in order). In
this case the USB2 controller wouldn't work on the SKU1 board if only this patch
is applied. It should be squashed with patch 2 of this series ("arm64: qcom:
sc7280: Add USB2 controller and phy nodes for SKU1 board").

Also doing the move in a single patch instead of two separate patches for remove
and add makes it easier to review the latter part, since it's evident from the
patch itself that it's just a move.
