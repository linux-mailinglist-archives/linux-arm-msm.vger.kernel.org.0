Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0999A3B39CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 01:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbhFXXos (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 19:44:48 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:41611 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhFXXor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 19:44:47 -0400
Received: by mail-pg1-f172.google.com with SMTP id u190so6062967pgd.8;
        Thu, 24 Jun 2021 16:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q4KvsDRCAo0bmbM75TlWBAKQaF/UlLGslOyWVCtR9PY=;
        b=LzoLVUuJkJqMV3aP66SH6rdtNsRzRkS8+Byt97nyaadlvtUmX80TCgK402NMzbHVxH
         djGVhkFFMG7OdbzmSU+d4HX5GpN6cESU0ry8xVQyoBhX4AXuTsMxW37NZlcB2uDrcdjn
         xfz4EguhfJ7Ty7jDP+V5+tHU8ReGhemY7yCubU+yJWav8lCGorzUwoPgezXmkRGIfEhh
         tA4/uWBW09t9WDZIsTdhjr0Dbv1WmlZMy5YbrkvU3XKjPGLls1FyviMTT0phAExYyB0U
         QFYt4387D90hYTf6gIz7ANKtf1AgaU7clyymKW3PFekcqMJ+JitGVgc5HfBX/+l+k/ir
         HU3g==
X-Gm-Message-State: AOAM532aPm2mvSTtc+Z4ePCuBcMLERdx5BE7rAMvGuieu4ZyMMHWQlmF
        UWJzQqGVvVZPnXqaNbYjwvKR3jfJ/JqEQQ==
X-Google-Smtp-Source: ABdhPJwnsnFl9ZagfiALgc+cYcg05o/+hOblazqtfmyqQDTIJBW4DbXSCmxOpnf8C2bCPebs3J1TMw==
X-Received: by 2002:a05:6a00:1146:b029:2fe:d681:fbcc with SMTP id b6-20020a056a001146b02902fed681fbccmr7665994pfm.31.1624578146818;
        Thu, 24 Jun 2021 16:42:26 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id n33sm3343362pgm.55.2021.06.24.16.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 16:42:25 -0700 (PDT)
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
Message-ID: <cb39c5d7-c21d-66b1-0a86-f9154f73a94e@acm.org>
Date:   Thu, 24 Jun 2021 16:42:23 -0700
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

Can the is_wlu_sys_suspended member variable be removed by checking
dev->power.is_suspended where dev represents the WLUN?

Thanks,

Bart.
