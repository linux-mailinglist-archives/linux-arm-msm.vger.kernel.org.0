Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C349203A6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 17:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgFVPOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 11:14:21 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:59306 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728951AbgFVPOV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 11:14:21 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05MF80B4019238;
        Mon, 22 Jun 2020 10:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=YA68rp2GcBNVbHKDQJaNZbD5aBuB8Gj1QhN4VwD4g18=;
 b=pXnn7VoViKb8ETOJPdlZm51DIPoT5w5oQZwY4HWFHDXP282cCpDAZglLe8A0cPjKou9E
 IuOYXhQUQh/MumzOWrCXkKprNWkKy9PQ3WuXb72IGD3/W+URRmbls64fGds2IRi8dSs8
 1hTkTSp6+pbJHSXkKLge8W5G7tYoNZfkcAfERdeWSqSgsjX3p2yxWMonJzhZykY4P/Zj
 uf0QO2U4Pt00lJO9wN2uUXYLE52ebMiRL9+Bw6MNVjBwlMueJNsgJ8t1Frw/2aQ193yF
 rIPKyfW0n0Ep3Q0KgmMVBWfTA3xsOkX+Oi3SZm51RlmMc3s7psODNBa8gx9+Hbq4tuiQ WQ== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 31sfv1tftd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Jun 2020 10:13:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 22 Jun
 2020 16:13:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 22 Jun 2020 16:13:34 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4884C2C5;
        Mon, 22 Jun 2020 15:13:34 +0000 (UTC)
Date:   Mon, 22 Jun 2020 15:13:34 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC:     Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] ALSA: compress: document the compress audio state
 machine
Message-ID: <20200622151334.GW71940@ediswmail.ad.cirrus.com>
References: <20200622065811.221485-1-vkoul@kernel.org>
 <20200622065811.221485-2-vkoul@kernel.org>
 <800a2632-b263-500f-707e-c1ce94ce92d4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <800a2632-b263-500f-707e-c1ce94ce92d4@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 clxscore=1011
 malwarescore=0 cotscore=-2147483648 spamscore=0 priorityscore=1501
 suspectscore=2 phishscore=0 mlxlogscore=871 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220114
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 22, 2020 at 08:28:48AM -0500, Pierre-Louis Bossart wrote:
> On 6/22/20 1:58 AM, Vinod Koul wrote:
> >+                                        +----------+
> >+                                        |          |
> >+                                        |   OPEN   |
> >+                                        |          |
> >+                                        +----------+
> >+                                             |
> >+                                             |
> >+                                             | compr_set_params()
> >+                                             |
> >+                                             v
> >+         compr_free()                   +----------+
> >+  +-------------------------------------|          |
> >+  |                                     |   SETUP  |
> >+  |           +------------------------>|          |<---------------------------------+
> >+  |           | compr_drain_notify()    +----------+                                  |
> >+  |           |                              |                                        |
> >+  |           |                              |                                        |
> >+  |           |                              | compr_write()                          |
> >+  |           |                              |                                        |
> >+  |           |                              v                                        |
> >+  |           |                         +----------+                                  |
> >+  |           |                         |          |                                  |
> >+  |           |                         |  PREPARE |                                  |
> >+  |           |                         |          |                                  |
> >+  |           |                         +----------+                                  |
> >+  |           |                              |                                        |
> >+  |           |                              |                                        |
> >+  |           |                              | compr_start()                          |
> >+  |           |                              |                                        |
> >+  |           |                              v                                        |
> >+  |     +----------+                    +----------+  compr_pause()  +----------+     |
> >+  |     |          |    compr_drain()   |          |---------------->|          |     |
> >+  |     |  DRAIN   |<-------------------|  RUNNING |                 |  PAUSE   |     |
> >+  |     |          |                    |          |<----------------|          |     |
> >+  |     +----------+                    +----------+  compr_resume() +----------+     |
> >+  |           |                           |      |                                    |
> >+  |           |                           |      |                                    |
> >+  |           |                           |      |                                    |
> >+  |           |                           |      |          compr_stop()              |
> >+  |           |                           |      +------------------------------------+
> >+  |           |       +----------+        |
> >+  |           |       |          |        |
> >+  +-----------+------>|          |<-------+
> >+     compr_free()     |   FREE   |  compr_free()
> >+                      |          |
> >+                      +----------+
> a) can you clarify if we can go from running to free directly? is
> this really a legit transition? There's already the option of doing
> a stop and a a drain.
> 

This is allowed in the current code, the kernel sends the stop
internally in this case, so it kinda does go through the setup
state just not from the users view point. I am not sure I have a
good handle on if that makes sense or not.

> c) no way to stop a paused stream?

Currently the code does allow this and it certainly makes sense
so should probably be added.

Thanks,
Charles
