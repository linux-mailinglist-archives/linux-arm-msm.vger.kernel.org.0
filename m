Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C63539A649
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 18:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhFCQyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 12:54:38 -0400
Received: from mail-pj1-f49.google.com ([209.85.216.49]:33507 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhFCQyi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 12:54:38 -0400
Received: by mail-pj1-f49.google.com with SMTP id k22-20020a17090aef16b0290163512accedso3695927pjz.0;
        Thu, 03 Jun 2021 09:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A4PUrNAyORJrJtmrQDwf06S8baOEzVduzKP2wT3KDSU=;
        b=RtdCKAf7FrR+LdK5t99yhknuZvT2vKvoE2j6U5dVZymA9QyrLTkQ6nLhvWJDop7Ql/
         P9P1IUG5BmzjMX2DEOfQWRsM5hkbOyJUKOpwJTsqOCIKbrcBLcZrSNgaVPAXB2ppPoX6
         y8PdE4Danw46njO4VeUrwKMa+HYPzxF4dxQGJSVj3/HSd8NIIIFJ3g4/aIbO84vHR9Eo
         opHLspi4qErKr+QsilIV6h+vUXESEx55+17AZ+GpjmbcyE3A25LyxkfkJxYcxHqjkRgW
         nmMjZYnghtu3MvnnorNbsXOs+fJrYH50o1eZFqNtx+KQP4SkKq2ONCU5u8t5m4b2Xn3T
         s9dQ==
X-Gm-Message-State: AOAM531w3Ju9PlUq4vpiDEXgEMO9UuMvActo9ArDWUlI3eSVmN0EJrDk
        5dA4YaHBHgMsXepkA2OJzYvVyWuxtbM=
X-Google-Smtp-Source: ABdhPJzWPJhxQy7iqzH9sbtkolZXhfMH4Ry88gBWFj3lcinDhqrOzw9Ol/DA6KAVd276NDUF52RmMA==
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr149454pjq.228.1622739172619;
        Thu, 03 Jun 2021 09:52:52 -0700 (PDT)
Received: from [192.168.51.110] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id e6sm2925710pjl.3.2021.06.03.09.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 09:52:52 -0700 (PDT)
Subject: Re: UFS failures with v5.13-rc4
To:     Felipe Balbi <balbi@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <87lf7rc9es.fsf@kernel.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <f3488feb-9a22-cfc3-a2f2-3c324c9646bd@acm.org>
Date:   Thu, 3 Jun 2021 09:52:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87lf7rc9es.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/3/21 7:25 AM, Felipe Balbi wrote:
> Today I managed to trigger some pretty bad faults with with v5.13-rc4
> running on SM8150 (Snapdragon) and iozone.
> 
> It seems the problem only happens when using bfq iosched, as I couldn't
> trigger it with mq-deadline.

Both the UFS driver and the BFQ scheduler have been changed 
significantly recently. It would help if this issue could be bisected. 
That will reveal whether the root cause is in the UFS driver or in the 
BFQ scheduler.

Thanks,

Bart.
