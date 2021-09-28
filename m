Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB3341BA54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 00:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243032AbhI1WaG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 18:30:06 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:54224 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhI1WaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 18:30:05 -0400
Received: by mail-pj1-f53.google.com with SMTP id r7so132928pjo.3;
        Tue, 28 Sep 2021 15:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L4PeQh3kD+GfKN85vnh/cbftyd2x4+/N2mzuA1Lb0/M=;
        b=M88p0x4njBOkszP0kjiUNLwJIb36pkWQRdVJviTEqgx9wV7qke4GYnzNqXx8zcbUmD
         kCp9UEtfEc3FrKHgXfKcl+qeikAvLenQOb8EvXAwaRj+KpIsJJKCnhFHx1FIFQ5AbRJF
         YIjb923UhwrLEFn8J3IxHh1HpSvT8gFveqY3gB2ht+mWurlwGPBLU3uv2v6qoZU1NvhS
         +F3aMZYpmGMN4fsbgeY4KDz2jC4Ps2Yf0LaYP0/eZKt7WaZqkoaCb3uPNzQI5U3mSLYv
         NoDsNci2xm4j3vMcK73v20sbpqkmFKmUOEVG7mTf8wYiIzM7BNf3XTfPSsrKiCOW3MYV
         UK1A==
X-Gm-Message-State: AOAM531DZmG0fYstQRlj2i+dvq+/6SdAwhz+wzKJCS9/L75gvcpImDY5
        wukFSaySzXociT5iM99bK4vdT+M9qsg=
X-Google-Smtp-Source: ABdhPJyKBPcX+yB1j7K4p4mRxP84BtAdJNnFlrEqgpUy4Dj9dnNmY3iTVbsfUV9W8u4eDwwfMEU0qw==
X-Received: by 2002:a17:90b:ed4:: with SMTP id gz20mr2572746pjb.35.1632868104649;
        Tue, 28 Sep 2021 15:28:24 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com ([2620:15c:211:201:f36:4e58:55a1:b506])
        by smtp.gmail.com with ESMTPSA id o2sm169181pgc.47.2021.09.28.15.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 15:28:24 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] scsi: ufs: export hibern8 entry and exit
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>, cang@codeaurora.org,
        asutoshd@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Keoseong Park <keosung.park@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1632818942.git.nguyenb@codeaurora.org>
 <a29bfdd0c8f1d1a3e5fb69e43ea277c97a7f0cb6.1632818942.git.nguyenb@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <64d912b3-8c5c-8898-3988-d8860ebee192@acm.org>
Date:   Tue, 28 Sep 2021 15:28:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a29bfdd0c8f1d1a3e5fb69e43ea277c97a7f0cb6.1632818942.git.nguyenb@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/28/21 2:06 AM, Bao D. Nguyen wrote:
> Qualcomm controllers need to be in hibern8 before scaling up
> or down the clocks. Hence, export the hibern8 entry and exit
> functions.
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
