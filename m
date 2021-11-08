Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D077449E3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 22:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240350AbhKHVdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 16:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239289AbhKHVdf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 16:33:35 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17DAC061570;
        Mon,  8 Nov 2021 13:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=0iwskvT7/hdjJZTdU1Eyzgws/WDVQd1HAOKc57+uQjw=; b=pocPJMpyTmtM9PRMwz8gM4cb65
        ARrDqhE6l7qEoqBDn++car9Pk7CDPei4UiXKcIDsH/a1HDLe6m2anTctYJ62lvbBmUynMSr0G0+yZ
        b75PmapDuqR+2iZrpLdqTgkA0usuSwZ86/bjCEqWJrjVJUkmMfzUuON1gWib2CGIZ0BWuuOWKZ00d
        RtKjM2s7wqMwC262T1JMmh65f+iu3S+hh1vAV4sRq5pZHW1YTr/6yBjjRAs4aDk6BeGRIn9InQwEq
        GeZQBBjbwIrbskHtmOw1Og0DWU7kH2MMn5gKVxTOMB+ti/ODlT/TrdS9oCok+IWUIuKMXcpkQpT2N
        jU+nRFxQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mkCE1-008jfC-Qe; Mon, 08 Nov 2021 21:30:46 +0000
Subject: Re: [PATCH] rpmsg: Fix documentation return formatting
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
References: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <67712270-d8b3-8475-f365-d24ed4cbb117@infradead.org>
Date:   Mon, 8 Nov 2021 13:30:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/8/21 6:01 AM, Arnaud Pouliquen wrote:
> kernel documentation specification:
> "The return value, if any, should be described in a dedicated section
> named Return."
> 
> Signed-off-by: Arnaud Pouliquen<arnaud.pouliquen@foss.st.com>
> ---
>   drivers/rpmsg/qcom_glink_native.c |  2 +-
>   drivers/rpmsg/qcom_smd.c          |  2 +-
>   drivers/rpmsg/rpmsg_core.c        | 24 ++++++++++++------------
>   drivers/rpmsg/virtio_rpmsg_bus.c  |  2 +-
>   4 files changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
