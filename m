Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9283918186A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 13:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgCKMqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 08:46:09 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:36488 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729287AbgCKMqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 08:46:08 -0400
Received: by mail-wm1-f48.google.com with SMTP id g62so1975193wme.1;
        Wed, 11 Mar 2020 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=vX7xay1c272z5yWnR8Vm2AwXwafctOSlGFV/CAr3lyI=;
        b=cpYVxJokDUEk+/C8NFK/CPVc5LRy+3ROB6BEZMu4V+wxk700micwN7r7SdhA9yluJh
         a7KDXzoNYNN8xWsWkE2xGen+YUJtH0+ERwlKg5mVWshT5TJvTx63k1u+549yNls9xgT/
         1/xXodKdej8umcgYWTpcmDw5IY5B9kCLgwe8bhN1LXtaSDGw87SkSfjR+GrkgioMRDGA
         uNoEU8XQYPPFriqobX+KKIjlYT00KycIhNd1W1a5Z6hPmRbDrqGlWoEukQE9mcDe+jEi
         CUfC7w9+Ev8k7Uu83l9IjeRQurJY29PCHDoTTz0FZs5tEfrgSLz8we+BX30VRQLjBl4v
         FX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=vX7xay1c272z5yWnR8Vm2AwXwafctOSlGFV/CAr3lyI=;
        b=RXYfAx55O7wPVvu6I0KMFdNxwxPkMC6PCXGTnrCUrzWM3ZKO9q2G+nmONe8uBjfLjj
         AB9v7PDLtiGJ9956Om3jLnZyg4RCBlm4cbjeIEhJoZ4pMSZB0fW4zb4PuqNrTGXMRO0t
         CWA3FQibSLZd8OVIjo33/xn+cfR7D94NJxPmoCoRvE7rlleqZ3jbbZoWoP8ikfcbfiAh
         SJQSPWgI7+wID3J1pZH81WXacxoRVMO77mBP5I9XIizB2USwqCXUBKp0+yyHoSiLKScZ
         U3g6RE7k3xI+Qmn093MFUbAw+j548A6kfhUN2AWoM0EDh3Nfy1OXaH5MUecR3APLsqRc
         hHMA==
X-Gm-Message-State: ANhLgQ1ljkjlMucyup6ARnzzG+0/y6IkXgZfip3MSr0vK33TeuGxWkCx
        aVr+vdhlp48pAi9gkQ5bl0vhWOq5hfM=
X-Google-Smtp-Source: ADFU+vsVDxCVTN+N2Gw1D6GVC46ov+wXcq58elUBcCdzA8VarIJLUeD9zJfJLE7Z/1kCYEaZaD1GOg==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr3702859wmc.171.1583930766069;
        Wed, 11 Mar 2020 05:46:06 -0700 (PDT)
Received: from AnsuelXPS (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.gmail.com with ESMTPSA id v10sm179900wml.44.2020.03.11.05.46.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Mar 2020 05:46:04 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     <sboyd@kernel.org>, "'John Crispin'" <john@phrozen.org>,
        "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <sboyd@kernel.org> <20200310143756.244-1-ansuelsmth@gmail.com> <20200310184109.GA2508@bogus>
In-Reply-To: <20200310184109.GA2508@bogus>
Subject: R: [PATCH v2] clk: qcom: clk-rpm: add missing rpm clk for ipq806x
Date:   Wed, 11 Mar 2020 13:46:02 +0100
Message-ID: <06a501d5f7a3$06ba72f0$142f58d0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQD2n4NGhC+p0cGdAsYRRjYyx9FyPQH+RYtGAlzKsDSp3y3+UA==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Tue, 10 Mar 2020 15:37:56 +0100, Ansuel Smith wrote:
> > Add missing definition of rpm clk for ipq806x soc
> >
> > Signed-off-by: John Crispin <john@phrozen.org>
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > Acked-by: John Crispin <john@phrozen.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
> >  drivers/clk/qcom/clk-rpm.c                    | 35 +++++++++++++++++++
> >  include/dt-bindings/clock/qcom,rpmcc.h        |  4 +++
> >  3 files changed, 40 insertions(+)
> >
> 
> Please add Acked-by/Reviewed-by tags when posting new versions.
> However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

Sorry it was asked to resend this as there was a bug in the software used to
apply this. 

