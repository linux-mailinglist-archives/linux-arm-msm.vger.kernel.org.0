Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD209205396
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 15:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732674AbgFWNgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 09:36:02 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59656 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732665AbgFWNgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 09:36:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2372A1C0C0A; Tue, 23 Jun 2020 15:36:00 +0200 (CEST)
Date:   Tue, 23 Jun 2020 15:35:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, dhavalp@codeaurora.org,
        mturney@codeaurora.org, rnayak@codeaurora.org,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] nvmem: qfprom: Add fuse blowing support
Message-ID: <20200623133559.GD2783@bug>
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!

> This patch adds support for blowing fuses to the qfprom driver if the
> required properties are defined in the device tree.

Should we have this in kernel?

If so, should we make it harder to use, like passing module parameter 
enabling this kind of support or something? Kconfig option as most users 
will not need this so this should be compiled out?

									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
