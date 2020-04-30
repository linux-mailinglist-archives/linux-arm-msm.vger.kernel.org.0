Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED431BF01A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 08:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgD3GPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 02:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726752AbgD3GPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 02:15:12 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1028FC08E859
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 23:15:12 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e6so291351pjt.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 23:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x7/KKFn8BCkAckmQr7phq+s/+BjeL7Rl1CFL6HKpG5M=;
        b=uU8jiMQxr10bGxm1TozvntSNrpr/ofFVgKkcU+ecnvJtkVeym8FAECunFnlZFR0G2Y
         WhyOkbEirdhHPcBYUu1pigRboOOZG2esfQr8eoOFw0OXW9HJcjtuuD3ZkNIP3RYguMoc
         ScHCiHedlV342uWa5kG8ZeS/ITDKoWZ0ngJICR6hnpGdkHIF/NUUM2DDVbpSg9QMFUXM
         BJI50pwbVHokPxJGuiWJRQo6No6yo1uEFAyUm5dvpgknd385NcgRv1vH3yjTYwsdkMw3
         pcdV5B6DFjV8SeOz5ql+qKl53Rg1N+kVpXDFYoyKRBGViIvdCTSWC4YDxtK8r1IRce2j
         VBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x7/KKFn8BCkAckmQr7phq+s/+BjeL7Rl1CFL6HKpG5M=;
        b=XgUPqRew7STh64Ae3Dfu1HIVp1nUhQri7zsBlXR0wf38vGANT4JFneBuk2fSQsZuG3
         gsNUEzB0Zmo56pJyd5VWbnDxLZ7PLfMYrdRARrR16iAEOpY4q3YLJ8AYSoNaVEy6t0vD
         8vqsVsDNal5YFZt4NmCYilZ1n0WS1PyCZINy5eEHEZ1Qr6pYtqqzciG65+oF7jGl2faQ
         AtMdwjN5+csBAdpgQybg2azQ8frmYEZ3aKWrQIVnNDPjbsQyqRs6zQ+tSRMQmx37mx7a
         +0d7TnG+9eTbs2qNdnI3co0lmWVskuEjnWNX0O0Sl7fkq4Z5FHn8meWew+fDzZMbVdsq
         lnoA==
X-Gm-Message-State: AGi0PuasvLqGoX1vP1gEGfwmlGDQl+cE4Vqs4cNRMAaYXYH+sgTj5xqW
        I98d5ZX2fzdSal3a8FHwyQ+inQ==
X-Google-Smtp-Source: APiQypLAiOVZAO2gmBRBnYBAlX/vRL0D7u6b7kPT99EVAW2lZmw9h7hDYcoo39quYJ+JkeBMpT6Wrw==
X-Received: by 2002:a17:90a:5287:: with SMTP id w7mr1254117pjh.66.1588227311459;
        Wed, 29 Apr 2020 23:15:11 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id s76sm2283379pgc.85.2020.04.29.23.15.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2020 23:15:10 -0700 (PDT)
Date:   Thu, 30 Apr 2020 11:45:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 03/17] arm64: dts: sdm845: Add OPP table for all qup
 devices
Message-ID: <20200430061508.6ktamklc4nslf5qp@vireshk-i7>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-4-git-send-email-rnayak@codeaurora.org>
 <20200429000234.GK4525@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429000234.GK4525@google.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-04-20, 17:02, Matthias Kaehlcke wrote:
> Judging from SDM845 (which has more OPP tables) the convention seems to be
> to add OPP tables to the nodes that use them, which seems reasonable and

I don't think that's right. The same DT opp tables are used for
multiple CPUs and they are placed outside of any device's node.

And that is the reason we have handled that specially in kernel (which
Rajendra shared in another email), to not create a platform device for
the opp table.

-- 
viresh
