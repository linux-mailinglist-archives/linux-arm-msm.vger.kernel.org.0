Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5947845F39E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 19:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237481AbhKZSVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 13:21:52 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:39926 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhKZSTv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 13:19:51 -0500
X-Greylist: delayed 495 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Nov 2021 13:19:51 EST
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 61DBFB8285D;
        Fri, 26 Nov 2021 18:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C814C93056;
        Fri, 26 Nov 2021 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637950099;
        bh=AMYW7hcJgPl+oHSg7EPTJNrl2HEys7cYfBojY2Z53rc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uQmAdhyx6rzwGLSYAGnm57p3wmQkxjXofsUX+OYYGfcESn5xTFtM9Hf9c/LnXBSNE
         0mfTQC65DAjVBV5Ij9Ydzet5tsBTcbzxDJh19bl+qxwzbOy3FNkInQKqZ5Q04/mNA+
         JWEJfQtCesATFPyc3Ea5afJg/J+yXUGt1PSuiCbGy8C3YQNb2y963jcih8dpjurbeV
         CSbljSLXAbrgGU8Z7D3s8Sr2GnxsoarB+cf4rZeYb4YT365VVdnAwgfDftKe9ljk3f
         l9js6LtVAKXHtzdBUgL2SxLCgkP5sxP8J7AodrqtxMdENDIuDuwRTpGp/fh23Qk3qB
         f++pErYG42W/A==
Date:   Fri, 26 Nov 2021 10:08:17 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Alex Elder <elder@linaro.org>
Cc:     davem@davemloft.net, pkurapat@codeaurora.org,
        avuyyuru@codeaurora.org, bjorn.andersson@linaro.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net: ipa: GSI channel flow control
Message-ID: <20211126100817.09de8f7f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211124194416.707007-1-elder@linaro.org>
References: <20211124194416.707007-1-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Nov 2021 13:44:14 -0600 Alex Elder wrote:
> Starting with IPA v4.2, endpoint DELAY mode (which prevents data
> transfer on TX endpoints) does not work properly.  To address this,
> changes were made to allow underlying GSI channels to be put into
> a "flow controlled" state, which achieves a similar objective.
> The first patch in this series implements the flow controlled
> channel state and the commands used to control it.  It arranges
> to use the new mechanism--instead of DELAY mode--for IPA v4.2+.
> 
> In IPA v4.11, the notion of GSI channel flow control was enhanced,
> and implemented in a slightly different way.  For the most part this
> doesn't affect the way the IPA driver uses flow control, but the
> second patch adds support for the newer mechanism.

Applied, thanks.
