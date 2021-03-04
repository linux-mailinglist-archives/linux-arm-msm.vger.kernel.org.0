Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A9332CDE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 08:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234661AbhCDHqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 02:46:37 -0500
Received: from mga09.intel.com ([134.134.136.24]:9626 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233784AbhCDHqK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 02:46:10 -0500
IronPort-SDR: o08KycUjwuDIKeDJ8nDczSjBdROl5NW+aj9Qy/ldRW16qN76kfHKHZmGtH/xro0cL9sdiR/IOF
 /XerZ4uU1spg==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="187474885"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="187474885"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 23:45:30 -0800
IronPort-SDR: hkY77I0G+KUTEO604Z8Tm2pPYH4M5J4u+v9DAEWK93PyUI6UcFSjKovoamnImrgpXtNRD1ASTN
 YyZuu9fQLw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="406765459"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.76]) ([10.237.72.76])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2021 23:45:25 -0800
Subject: Re: [PATCH v10 2/2] ufs: sysfs: Resume the proper scsi device
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1614725302.git.asutoshd@codeaurora.org>
 <5d7c0cd1ff4bc5295015244f057d252fe9040993.1614725302.git.asutoshd@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <9edf7047-4845-5bb5-3307-fa6e11e5c923@intel.com>
Date:   Thu, 4 Mar 2021 09:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5d7c0cd1ff4bc5295015244f057d252fe9040993.1614725302.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/03/21 12:52 am, Asutosh Das wrote:
> Resumes the actual scsi device the unit descriptor of which
> is being accessed instead of the hba alone.

Since "scsi: ufs: ufs-debugfs: Add user-defined exception_event_mask"
is now in linux-next, a similar change is needed for ufs-debugfs.c.
Probably best it is a separate patch though.
