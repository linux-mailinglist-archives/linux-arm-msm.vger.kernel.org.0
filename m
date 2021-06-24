Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405833B34D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 19:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhFXRe7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 13:34:59 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:37549 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXRe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 13:34:58 -0400
Received: by mail-pl1-f170.google.com with SMTP id y21so3324426plb.4;
        Thu, 24 Jun 2021 10:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7mkCkEwXQBHYc4yoTuGzapJQixnK7les2iDpwlzJsuo=;
        b=NdDxU8/6SN3l+4qljsFjZ4gHMKksDEQPmLgiiBqm9NcXx8vTGNvhxC+nKf3LpiYlNW
         gL151sqWWu6PfHDIgAzpxJK8iOD5gLdpBRqWEvhsmMo3+17o7z6GpQ/rYH+2uDBBDg9g
         sk0+koYvwL9MW9w2i4NOWeFtlNcpvqNkwxm+4nwGS6WmAbLxIxtDsbK4u3/O0UoKIIB8
         ihis5nauAkFIOfCcmLpLEg3XlgWwi7Ryuglo/S9U5IdVxuJxrAbpbHstO3E5SScRaOiZ
         UYdZE9m6CgrR0qUt5YF25xdly708MDa3gpN3wvCxmW6FaYE25GD4nJEWVlDpqRqKl4o6
         7CJA==
X-Gm-Message-State: AOAM532m21JgHrX/dDx4Et0cv6p0K78VUdeKKD9fO7eMPrN4qtz1KDJO
        EDleOfHTDyGESxQAP0IdgyJ+c1lHHL5IeQ==
X-Google-Smtp-Source: ABdhPJyH4XqAg6hLJhMqZ3dMwRiI23X1p+PVWJycWy/irAG5i5R8Hsp0UPJpiZE9nWKXuPtateldQA==
X-Received: by 2002:a17:902:e545:b029:111:6990:4103 with SMTP id n5-20020a170902e545b029011169904103mr5192664plf.63.1624555957778;
        Thu, 24 Jun 2021 10:32:37 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id 18sm8741183pje.22.2021.06.24.10.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 10:32:37 -0700 (PDT)
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
To:     Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, hongwus@codeaurora.org,
        ziqichen@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Satya Tangirala <satyat@google.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
 <1624433711-9339-2-git-send-email-cang@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <71e7d714-8cb9-1f57-9035-e43c147b5c61@acm.org>
Date:   Thu, 24 Jun 2021 10:32:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624433711-9339-2-git-send-email-cang@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/23/21 12:35 AM, Can Guo wrote:
> Rename pm_op_in_progress and is_sys_suspended to wlu_pm_op_in_progress and
> is_wlu_sys_suspended accordingly.

Can the pm_op_in_progress variable be removed if the UFS driver checks whether
q->rpm_status == RPM_SUSPENDING || q->rpm_status == RPM_RESUMING instead of
using pm_op_in_progress? The fewer state variables we maintain the lower the
chance that these are inconsistent or incorrect. See also block/blk-pm.c for
the code that sets q->rpm_status.

Thanks,

Bart.
