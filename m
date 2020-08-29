Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DC425644F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 05:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgH2DN7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 23:13:59 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34281 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgH2DN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 23:13:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id i10so1338930pgk.1;
        Fri, 28 Aug 2020 20:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XXakmc3gymcUqXRvGokRvFPmNkxunt9+SUPrMkXb9nc=;
        b=bZahgTx3i8Ja1CI6Yq6N28bx3gbkFQ1Fc8k1ixM5MSN+NZOzR0wK3lWBbTrgMuEAQC
         EosoOAKr8oIyhielm4TmuzUPU6dx3FDHoZALx+mJLV5npGHKu94xtHOZ+N+J2p3hLO3L
         jwwlVGoAQUBp1dw+TwLJLVQ2RSiNR0CJcXKHubWfCfAuh/s/aroTn9L7dt8oZ0ebooKV
         elXamfA6lu1rcqgK43quQUBx4zJ1grVYFiW3Suw3UJph4GPf+Ch3JqKymtc1BBsP8JmC
         7/ipwFHhjJt0rXSpk9Zpn4/e/CJy1Q2dXRnwD2Z71Ar4BBYY4Ld2juOphnfoCmmRP8Su
         jUZg==
X-Gm-Message-State: AOAM532Gx1lI05VXGKtxrUznEWwkocHrYWHbAX1/mtm9Mt4X8ud2lVlQ
        SWhkJDUTJHuvK41WMiRM2hFGpYxtasI=
X-Google-Smtp-Source: ABdhPJxZDjcDaFzrw9x270ZWvw3zZ2ML/zi1tOS4TX5PMIckDdeT7sMYwnV1Qj4rln4We5u18iu2qQ==
X-Received: by 2002:a63:c901:: with SMTP id o1mr1218245pgg.2.1598670837823;
        Fri, 28 Aug 2020 20:13:57 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id f18sm857290pfj.35.2020.08.28.20.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 20:13:57 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to
 Auto-Hibernate Timer
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>, cang@codeaurora.org,
        asutoshd@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>,
        open list <linux-kernel@vger.kernel.org>
References: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <56c8bde3-2457-402f-0ad2-94fc1fe12cd5@acm.org>
Date:   Fri, 28 Aug 2020 20:13:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-28 18:05, Bao D. Nguyen wrote:
>  static ssize_t auto_hibern8_show(struct device *dev,
>  				 struct device_attribute *attr, char *buf)
>  {
> +	u32 ahit;
>  	struct ufs_hba *hba = dev_get_drvdata(dev);

Although not strictly required for SCSI code, how about following the "reverse
christmas tree" convention and adding "u32 ahit" below the "hba" declaration?

>  	if (!ufshcd_is_auto_hibern8_supported(hba))
>  		return -EOPNOTSUPP;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", ufshcd_ahit_to_us(hba->ahit));
> +	pm_runtime_get_sync(hba->dev);
> +	ufshcd_hold(hba, false);
> +	ahit = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
> +	ufshcd_release(hba);
> +	pm_runtime_put_sync(hba->dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", ufshcd_ahit_to_us(ahit));
>  }

Why the pm_runtime_get_sync()/pm_runtime_put_sync() and
ufshcd_hold()/ufshcd_release() calls? I don't think these are necessary here.

Thanks,

Bart.
