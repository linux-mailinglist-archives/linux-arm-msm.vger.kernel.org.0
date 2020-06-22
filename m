Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7585A203866
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 15:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgFVNqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 09:46:45 -0400
Received: from mga09.intel.com ([134.134.136.24]:29044 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728449AbgFVNqp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 09:46:45 -0400
IronPort-SDR: ZoVnyPNsPsyW885V0cjoi4K1ureypVgEC+PZk1q3tzpwLV6gN78e5369MxBhUxkLi6clczgINv
 qQNAmG7tfn/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="145269603"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; 
   d="scan'208";a="145269603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2020 06:46:44 -0700
IronPort-SDR: dKvK79inM4zSyJRZ2y4dBvRyTrKxultGjoc1LegHMIjo5FMhForkLdK7G7mqNZbzCgxwofb1wm
 vSlRraV+aGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; 
   d="scan'208";a="262971334"
Received: from agsoto-mobl.amr.corp.intel.com (HELO [10.251.3.142]) ([10.251.3.142])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jun 2020 06:46:43 -0700
Subject: Re: [PATCH v2 1/3] ALSA: compress: document the compress audio state
 machine
To:     Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20200622065811.221485-1-vkoul@kernel.org>
 <20200622065811.221485-2-vkoul@kernel.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <800a2632-b263-500f-707e-c1ce94ce92d4@linux.intel.com>
Date:   Mon, 22 Jun 2020 08:28:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622065811.221485-2-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/22/20 1:58 AM, Vinod Koul wrote:
> So we had some discussions of the stream states, so I thought it is a
> good idea to document the state transitions, so add it documentation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   .../sound/designs/compress-offload.rst        | 52 +++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
> index ad4bfbdacc83..6f86db82298b 100644
> --- a/Documentation/sound/designs/compress-offload.rst
> +++ b/Documentation/sound/designs/compress-offload.rst
> @@ -151,6 +151,58 @@ Modifications include:
>   - Addition of encoding options when required (derived from OpenMAX IL)
>   - Addition of rateControlSupported (missing in OpenMAX AL)
>   
> +State Machine
> +=============
> +
> +The compressed audio stream state machine is described below ::
> +
> +                                        +----------+
> +                                        |          |
> +                                        |   OPEN   |
> +                                        |          |
> +                                        +----------+
> +                                             |
> +                                             |
> +                                             | compr_set_params()
> +                                             |
> +                                             v
> +         compr_free()                   +----------+
> +  +-------------------------------------|          |
> +  |                                     |   SETUP  |
> +  |           +------------------------>|          |<---------------------------------+
> +  |           | compr_drain_notify()    +----------+                                  |
> +  |           |                              |                                        |
> +  |           |                              |                                        |
> +  |           |                              | compr_write()                          |
> +  |           |                              |                                        |
> +  |           |                              v                                        |
> +  |           |                         +----------+                                  |
> +  |           |                         |          |                                  |
> +  |           |                         |  PREPARE |                                  |
> +  |           |                         |          |                                  |
> +  |           |                         +----------+                                  |
> +  |           |                              |                                        |
> +  |           |                              |                                        |
> +  |           |                              | compr_start()                          |
> +  |           |                              |                                        |
> +  |           |                              v                                        |
> +  |     +----------+                    +----------+  compr_pause()  +----------+     |
> +  |     |          |    compr_drain()   |          |---------------->|          |     |
> +  |     |  DRAIN   |<-------------------|  RUNNING |                 |  PAUSE   |     |
> +  |     |          |                    |          |<----------------|          |     |
> +  |     +----------+                    +----------+  compr_resume() +----------+     |
> +  |           |                           |      |                                    |
> +  |           |                           |      |                                    |
> +  |           |                           |      |                                    |
> +  |           |                           |      |          compr_stop()              |
> +  |           |                           |      +------------------------------------+
> +  |           |       +----------+        |
> +  |           |       |          |        |
> +  +-----------+------>|          |<-------+
> +     compr_free()     |   FREE   |  compr_free()
> +                      |          |
> +                      +----------+
> +

Sorry, this confuses me even more...

a) can you clarify if we can go from running to free directly? is this 
really a legit transition? There's already the option of doing a stop 
and a a drain.

b) no way to go back to SETUP from PREPARE? What happens if the app 
never starts but want to tear down the resources?

c) no way to stop a paused stream?
