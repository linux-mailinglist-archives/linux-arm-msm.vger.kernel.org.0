Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673A9257823
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 13:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgHaLTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 07:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgHaLR6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 07:17:58 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2297C0611E0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 04:09:42 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id c142so392056pfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E02AUVeFQVT/Yby1TXwpBy6LjVsB+G1ulzMrGLTQLsU=;
        b=FNd/akIMkL3eaopJcpGVw841qNXHifVpshOPHlo/uuzzMC1uIxR4rpF1cuEx20MJW8
         zRU3b7IXYtOiWUHE2usegI5lqkz29pQSEe7lc2Zn6kFtFUMZkTsgPTu53uMWFebd0coM
         iLMT0oFYlNnVymD+VsZPkcbeOQMjtAIsBp7DxOf1eo/wPc9H61/kybyugntRfQEZbv8D
         gwC6Tj3nw1Cui3GshhMMxUmIqh6mQUDR4d6WK83d4fAnnl0g+V9RF79Hz/YfHby4mlw7
         mR3PyKcjWV5VnHdjRO8FhwNUz77opdus4HEGeEpTBOw/d8C3bmxPjA6qWJWpAFad6iz7
         g8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E02AUVeFQVT/Yby1TXwpBy6LjVsB+G1ulzMrGLTQLsU=;
        b=gCSxqCtrXrMWEocQEs7DtpurFBVN3w/dy3RSj8afzEgYUFQdreIYfHLrdc2I3ddDUn
         5wm/T7tapl/kLKTlU+gOIn9IjKnyb+l4qq00cOfP4GR+2Fw6ZPEV/Vt0tmGFAsjyNhYa
         WAhfMuYhHFpMaaAOMAWRM1hu9gcHSWLoOPmJHO1K8z57FXT9UJXjqoLGqQeJPFpMvxSF
         ge8ute1FQWLyCWj6O3vAColF9P+o267+P5GzBXeljfZ/LDdMmSs4tQ3ZquTmcNx4KQkR
         0TF4SrfcIw1CLYQ99sP5v9KJHWlevj5PsOeXQ3QRImDTcsBqTmHDNwSL7c3UlaumxoeI
         Rfmw==
X-Gm-Message-State: AOAM531zNAFtMxp9TVbX8abfX0c+eGjvIWNFZSRVkQpnIH4DV63XsTtq
        qxDxVLaS93bcjRm2HHlEHtKcAQ==
X-Google-Smtp-Source: ABdhPJzSBT56cUJvUmQ1jeDl1RjMGJiu46b0HYsbuCGKuS2QrgmD92t81oKVAXJFmHCb4EhXLUuNfg==
X-Received: by 2002:aa7:9207:: with SMTP id 7mr819876pfo.156.1598872182053;
        Mon, 31 Aug 2020 04:09:42 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id u16sm7495367pfn.134.2020.08.31.04.09.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 04:09:41 -0700 (PDT)
Date:   Mon, 31 Aug 2020 16:39:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rnayak@codeaurora.org, Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Clark <robdclark@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>, Shawn Guo <shawnguo@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        lima@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH V2 0/8] opp: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20200831110939.qnyugmhajkg36gzw@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1598594714.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-08-20, 11:37, Viresh Kumar wrote:
> Hello,
> 
> This cleans up some of the user code around calls to
> dev_pm_opp_of_remove_table().
> 
> All the patches can be picked by respective maintainers directly except
> for the last patch, which needs the previous two to get merged first.
> 
> These are based for 5.9-rc1.
 
> Viresh Kumar (8):
>   cpufreq: imx6q: Unconditionally call dev_pm_opp_of_remove_table()
>   drm/lima: Unconditionally call dev_pm_opp_of_remove_table()
>   drm/msm: Unconditionally call dev_pm_opp_of_remove_table()
>   mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
>   spi: spi-geni-qcom: Unconditionally call dev_pm_opp_of_remove_table()
>   spi: spi-qcom-qspi: Unconditionally call dev_pm_opp_of_remove_table()
>   tty: serial: qcom_geni_serial: Unconditionally call
>     dev_pm_opp_of_remove_table()
>   qcom-geni-se: remove has_opp_table

During testing by some of the Linaro folks on linux-next, we found out
that there was a bug in the OPP core (which makes the kernel crash in
some corner cases with these patches) for which I have sent a fix
today which should be part of 5.9-rc4:

https://lore.kernel.org/lkml/922ff0759a16299e24cacfc981ac07914d8f1826.1598865786.git.viresh.kumar@linaro.org/

Please apply the patches over rc4 only once it comes out (I will
confirm by that time once the patch gets merged). Else you guys can
provide your Ack and I can take the patches through OPP tree.

-- 
viresh
