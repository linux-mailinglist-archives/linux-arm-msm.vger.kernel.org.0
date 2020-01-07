Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C541131CDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 01:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbgAGAz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 19:55:28 -0500
Received: from mga17.intel.com ([192.55.52.151]:4762 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727233AbgAGAz2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 19:55:28 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jan 2020 16:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; 
   d="scan'208";a="210958509"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
  by orsmga007.jf.intel.com with ESMTP; 06 Jan 2020 16:55:25 -0800
Subject: Re: [kbuild-all] Re: [PATCH v2 9/9] drm/bridge: ti-sn65dsi86: Avoid
 invalid rates
To:     Doug Anderson <dianders@chromium.org>,
        kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
 <201912212109.ehZOyrlG%lkp@intel.com>
 <CAD=FV=Ui=ZbzdyV6SjLvrL-zj6e+upog_wZMG4seOsdgZpF6tg@mail.gmail.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <997d40ad-2a86-7a21-b16c-f33f4e2ebca8@intel.com>
Date:   Tue, 7 Jan 2020 08:55:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Ui=ZbzdyV6SjLvrL-zj6e+upog_wZMG4seOsdgZpF6tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/7/20 6:43 AM, Doug Anderson wrote:
> Dear Robot,
>
> On Sat, Dec 21, 2019 at 5:57 AM kbuild test robot <lkp@intel.com> wrote:
>> Hi Douglas,
>>
>> I love your patch! Perhaps something to improve:
>>
>> [auto build test WARNING on linus/master]
>> [also build test WARNING on v5.5-rc2 next-20191220]
>> [if your patch is applied to the wrong git tree, please drop us a note to help
>> improve the system. BTW, we also suggest to use '--base' option to specify the
>> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>>
>> url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/drm-bridge-ti-sn65dsi86-Improve-support-for-AUO-B116XAK01-other-DP/20191221-083448
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 7e0165b2f1a912a06e381e91f0f4e495f4ac3736
>> config: sh-allmodconfig (attached as .config)
>> compiler: sh4-linux-gcc (GCC) 7.5.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # save the attached .config to linux build tree
>>          GCC_VERSION=7.5.0 make.cross ARCH=sh
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
>> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>>
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/gpu/drm/bridge/ti-sn65dsi86.c: In function 'ti_sn_bridge_enable':
>>>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:543:18: warning: 'rate_valid' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>         if (rate_valid[i])
>>             ~~~~~~~~~~^~~
> I love your report!  Interestingly I had already noticed this problem
> myself and v3 of the patch fixes the issue.  See:
>
> https://lore.kernel.org/r/20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid
>
>
> If the maintainer of the robot is reading this, something to improve
> about your robot is that it could have noticed v3 of the patch (which
> was posted several days before your report) and skipped analyzing v2
> of the patch.  I'm currently using Change-Ids embedded in my
> Message-Id to help automation relate one version of my patches to the
> next.  Specifically you compare the Message-Id of v2 and v3 of this
> patch:
>
> 20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid
> 20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid
>
> Since the last section before the "@changeid" remained constant it
> could be assumed that this patch replaced the v2.  I know there's not
> too much usage of this technique yet, but if only more tools supported
> it then maybe more people would use it.

Hi Doug,

Thanks for your suggestion, the root cause is that the v3 wasn't handled 
before this report.
We'll definitely give serious thought to your suggestion.

   v2: 
Douglas-Anderson/drm-bridge-ti-sn65dsi86-Improve-support-for-AUO-B116XAK01-other-DP/20191221-083448
   v3: 
Douglas-Anderson/drm-bridge-ti-sn65dsi86-Improve-support-for-AUO-B116XAK01-other-DP/20191222-062646

Best Regards,
Rong Chen

>
>
> -Doug
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org

