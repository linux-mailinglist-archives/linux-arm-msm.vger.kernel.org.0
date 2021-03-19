Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DA03424C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 19:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhCSSfl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 14:35:41 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:46852 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhCSSfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 14:35:23 -0400
Received: by mail-pl1-f177.google.com with SMTP id t20so3360039plr.13;
        Fri, 19 Mar 2021 11:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xQw+L3RNfqCsT579pHnTD6SwVA6plQagWHOVeC6fOqA=;
        b=qrRj85sHI4RbxPKvJBa+lwy0egeYrg2g2vsT5Ee5bt0+cSIG7+GwfTqK7mRRjxiqAP
         3wrRWNUEo0mPGaUNIw/v+kXBsTkEeQkF77ALTHljxNb24QZEtMDjR2T89qId4ea67SvJ
         LPNnJrldmEExOcBO7/J8VvfqEIx+M0jogVkzFD7Ox5I80CJ/kTFLQ/cNNELT/OWPTPYD
         I7wX9gKLwzr9ceo315gx9LPj2/ulrsxPWvkBQGLCPYMydR0qvkN61AazMK2oJ2P0Nxo9
         GBrtUc/wVPdkoklCNt2zquHFEj36S3V4oJGCyqvoFPdxBSm1k08mZLi6PQ2UP/5hdVPz
         2fCQ==
X-Gm-Message-State: AOAM531mDsI4jRm9jhpHDInoPAsZ9UmeIUqwlrPbchgdCwsn92+el/Xb
        E6k6pBf5YdzlD813T7m4QZ4=
X-Google-Smtp-Source: ABdhPJzFo7QHStjFhBxDOIaDuwYNxhKN1zCo26bd0Gn29vucjEp7hfSfrzJVXYZuNWDn7lAuUVKFfQ==
X-Received: by 2002:a17:90a:c201:: with SMTP id e1mr10961474pjt.30.1616178922687;
        Fri, 19 Mar 2021 11:35:22 -0700 (PDT)
Received: from [192.168.51.110] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id f20sm6380016pfa.10.2021.03.19.11.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 11:35:22 -0700 (PDT)
Subject: Re: [PATCH v12 1/2] scsi: ufs: Enable power management for wlun
To:     Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
References: <cover.1616113283.git.asutoshd@codeaurora.org>
 <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
 <88730ac9-d9c5-d758-d761-8c549c488aab@intel.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <ed3b5ad6-4396-d861-9bb2-40c05f4a8ece@acm.org>
Date:   Fri, 19 Mar 2021 11:35:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <88730ac9-d9c5-d758-d761-8c549c488aab@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/19/21 10:47 AM, Adrian Hunter wrote:
> It would also be good if you could re-base on linux-next.

Hmm ... my understanding is that patches should be prepared on top of 
the for-next branch of the maintainer a patch is sent to, in this case 
the for-next branch of 
git://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git.

Thanks,

Bart.
