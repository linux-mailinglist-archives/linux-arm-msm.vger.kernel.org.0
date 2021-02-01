Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC3330B191
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 21:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhBAU2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 15:28:17 -0500
Received: from mail-pl1-f180.google.com ([209.85.214.180]:39429 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhBAU2R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 15:28:17 -0500
Received: by mail-pl1-f180.google.com with SMTP id b17so10672813plz.6;
        Mon, 01 Feb 2021 12:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U4ktwnjaRtmZk6EQoaTVD7VLH/ZerIN7F1qnQ1tll7I=;
        b=kWlGzJVcucH1INzDbcejNP9pnM9y37BvU260fpXYj7r+OdFM5u2CT+M0MjHwi1cmlz
         Tp8VJgfhU3qGRUGXrlUPq8hAEDKaBxAmnmYRYhnF6h1F75WjKVdkJm1hGOW3uSl+bb2I
         tnbw+U/RNpEo+FWtcqpYmd5KVWqREu+P0+YP6vrElo8iPwDLn2ND9IwK5HM8h+2IZxIk
         j6AW++My+nFWwv7RWsNm8KV7LlA0jeGG0U7X8VQLnooUCohhb1FiQY6/cnX4uUxOWz8i
         ZKqST7iRu9BXdSP/mf/xO5vJWy2H0fzARMdfgu6Oyhxue3AX25tL+ZWQANUOiTdxJS2L
         Vbww==
X-Gm-Message-State: AOAM530bQwjqRynv4V3q/KDnllE6/S0mul3lFmbsHogRyaNkKAj1ZZRK
        q/6+hC5Em51KI9K69gaeLKTSnTtsNeY=
X-Google-Smtp-Source: ABdhPJxsTFRGFSINdq7/ikXsc6+lSYpxRIMdEETAL7rgd7fuM5ecMeUKgJyGeVwv+9NxDJbjrY4t4Q==
X-Received: by 2002:a17:902:6945:b029:e1:5877:2bb1 with SMTP id k5-20020a1709026945b02900e158772bb1mr6976826plt.21.1612211256067;
        Mon, 01 Feb 2021 12:27:36 -0800 (PST)
Received: from ?IPv6:2601:647:4000:d7:2f4:69d1:f66f:971d? ([2601:647:4000:d7:2f4:69d1:f66f:971d])
        by smtp.gmail.com with ESMTPSA id b62sm19621643pfg.58.2021.02.01.12.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 12:27:35 -0800 (PST)
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
To:     "Asutosh Das (asd)" <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, stern@rowland.harvard.edu
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <cbc1ea4a-e44c-9d7b-a6f6-73959dd8afb5@acm.org>
Date:   Mon, 1 Feb 2021 12:27:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/1/21 12:11 PM, Asutosh Das (asd) wrote:
> Please can you take a look at this series.
> Please let me know if you've any better suggestions for this.

Hi Asutosh,

Against which kernel version has this patch series been prepared and
tested? Have you noticed the following patch series that went into
v5.11-rc1:
https://lore.kernel.org/linux-scsi/20201209052951.16136-1-bvanassche@acm.org/
?

Thanks,

Bart.
