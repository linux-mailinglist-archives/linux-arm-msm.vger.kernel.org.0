Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D39A915263C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 07:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgBEGVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 01:21:15 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37257 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgBEGVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 01:21:14 -0500
Received: by mail-pf1-f196.google.com with SMTP id p14so652033pfn.4;
        Tue, 04 Feb 2020 22:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ECOPUnHJYw3SVf2CKPyph34mtGffruwoj4HtB5jABLw=;
        b=AXB6HcLp1xb5ZRKGdw8OQ27xBNaL5Aebdt/6u7e9EpKht3e//Y85UI0b3sddn7yaZK
         wfEZxY7HfK8R2cDWUuFgAQX4fZ/aomSgO1Lpvb1PgdnvB8S/l2ESvsP/FNP9atHT5ZYm
         P7vW5RTAIv6D14SirTv0/ih28qNW5/ygs9P0kIPHKVghY7yJ3eYYHX5ZH2hBeXecgx8r
         HrZjzMVfuPqfXweu3Qlpw/UbjEp48p1SBX1oFk4L8PAzlR7v8js+Npc4ruWMUAUGbiiL
         1VI88pgK+Ka11pUan22grt5y/XMwsZCi1Dp3J0gQXQxH5uNMy7shA/DTlUGr+nobxUXu
         zIQg==
X-Gm-Message-State: APjAAAWlFmQMVkaRBvKeyV5NG6yKYahfmF5nEBh98QI9SOa8HmQ81JaM
        SIoJBKr6OmQ8nef2u7uHGePdJYspqlCwgA==
X-Google-Smtp-Source: APXvYqymWvyAwOwGjKFzhv/YfJVjc0bej7RZ0q2+2yExcuo3o1tIBxQQX2X/zlurZ2VcNszyB2PUZQ==
X-Received: by 2002:a63:1b0a:: with SMTP id b10mr34525865pgb.56.1580883673595;
        Tue, 04 Feb 2020 22:21:13 -0800 (PST)
Received: from ?IPv6:2601:647:4000:d7:55d5:fbd1:6791:7dd1? ([2601:647:4000:d7:55d5:fbd1:6791:7dd1])
        by smtp.gmail.com with ESMTPSA id b11sm19588244pgg.13.2020.02.04.22.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 22:21:12 -0800 (PST)
Subject: Re: [PATCH] scsi: ufs: Fix registers dump vops caused scheduling
 while atomic
To:     Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, hongwus@codeaurora.org,
        rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1580882795-29675-1-git-send-email-cang@codeaurora.org>
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
Message-ID: <3e529862-7790-c506-abaa-9a6972f5d53c@acm.org>
Date:   Tue, 4 Feb 2020 22:21:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1580882795-29675-1-git-send-email-cang@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-04 22:06, Can Guo wrote:
> @@ -5617,7 +5622,7 @@ static irqreturn_t ufshcd_check_errors(struct
>
>  					__func__, hba->saved_err,
>  					hba->saved_uic_err);
>
> -				ufshcd_print_host_regs(hba);
> +				__ufshcd_print_host_regs(hba, true);
>  				ufshcd_print_pwr_info(hba);
>  				ufshcd_print_tmrs(hba,
>					hba->outstanding_tasks);
>  				ufshcd_print_trs(hba,
>					hba->outstanding_reqs,

Hi Can,

Please fix this by splitting ufs_qcom_dump_dbg_regs() into two
functions: one function that doesn't sleep and a second function that
behaves identically to the current function. If the function names will
make it clear which function sleeps and which function doesn't that will
result in code that is much easier to read than the above code. For the
above code it is namely impossible to figure out what will happen
without looking up the caller.

Thanks,

Bart.
