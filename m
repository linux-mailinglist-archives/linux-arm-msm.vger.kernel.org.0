Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195883B23A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 00:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFWWn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 18:43:56 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:43695 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhFWWnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 18:43:55 -0400
Received: by mail-pl1-f173.google.com with SMTP id v12so1909494plo.10;
        Wed, 23 Jun 2021 15:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5O5xNxcANEBivHk9zm1gSgKOACRuoRtqCAHhhwLRszM=;
        b=RuApEn+vj0C4k6AJLolNaifapjyUACiGtQxP0EjDzJcaULCMwPl1QPhdsad2O+X2Oh
         wGr7xDz1KpEn6RD3Pmxa4pIGwjPwcZTgVQFAsIWh7HcJQJUhUSDIvupRu8IFIpaUwLcu
         wvOMpTUeck9zIFfzhhvCllNRUeUoPcnp2JFOT+8cOFvMWlTBdrYESjjKMuslcymgWwdz
         6X4oDVwofYWQHVPa60iL28pyn9mFwYmHKb8LmSWsRitmGC8mYKNyB+aL9gV90HeEAD7B
         2lqu2HDMxybi4ir56uqVKzDhB3BkPrf/pIRAI98bPlasuWREyC7D39qEoVNlElenQIqj
         wRtA==
X-Gm-Message-State: AOAM530T79ATp2lUJHOCKGqWyRSRz7LwrDx+I+VDTGqyFbAcatK2vxXh
        1Iurwub6lGl1cWzmxNhQyarv9a0LXpX+9Q==
X-Google-Smtp-Source: ABdhPJxpAhi0VXu1cQO0rXJS617rgaA7KTySsnIS5Qjqee5bXYu6O5vtr73k9ly0SRC/iQSWUMjUHg==
X-Received: by 2002:a17:90b:1946:: with SMTP id nk6mr1987445pjb.86.1624488095627;
        Wed, 23 Jun 2021 15:41:35 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id o72sm860706pfg.102.2021.06.23.15.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 15:41:34 -0700 (PDT)
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Can Guo <cang@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, ziqichen@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        Andy Gross <agross@kernel.org>,
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
 <YNOctRTGYZaSe6lw@yoga>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <b8d08321-b965-8273-408d-3987b8d88f9d@acm.org>
Date:   Wed, 23 Jun 2021 15:41:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNOctRTGYZaSe6lw@yoga>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/23/21 1:42 PM, Bjorn Andersson wrote:
> On Wed 23 Jun 02:35 CDT 2021, Can Guo wrote:
>> Rename pm_op_in_progress and is_sys_suspended to wlu_pm_op_in_progress and
>> is_wlu_sys_suspended accordingly.
> 
> This reflects what the change does, but the commit message is supposed
> to capture "why".

What's even better is to describe both: what has been changed and also
why a change has been made. See also
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes.

Thanks,

Bart.
