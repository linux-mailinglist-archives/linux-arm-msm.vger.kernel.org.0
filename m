Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9AC21E681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 05:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgGNDrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 23:47:22 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50315 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgGNDrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 23:47:22 -0400
Received: by mail-pj1-f67.google.com with SMTP id k71so933826pje.0;
        Mon, 13 Jul 2020 20:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZW7X7MiMm0piZVcnl+najW7cQiAtAEIaX/u1ZH2T6cM=;
        b=Bkxhn/73U045pf9sq5AaCbHqGuJz4CSD34ZXPdbHu+w7LT2k9XxWrOOhilvtJmYCyq
         Wy9GIRbgQmPziLjh0z0nBBtCKilhqawBQ1jRBPhmE6myBr6wNEzlxzwKi3SL4QlkeZSy
         RC4dGod7P5p5o4m/Czb7WVX6gnyZLNgQ1zVhEmJ/48c8h8EhtZXQpAIKUdzm5YvUsabb
         tDWRLx1V2u2AbpeZWluO/bPeEcL3LYlb1m/tYSNhgGIu3zrIe5YwwPNuBd0Ug4+gqlwg
         RfnT7vFkg4nKLcLBH1PSrvmLbIp3RrcR2rBPRL/Q8Y0NPkKv39G7uDukXkfOAebA1wG6
         Iy0g==
X-Gm-Message-State: AOAM532XVh2kzQ2/YrGE5/Dgqgmjesm5EpSJ/0qk8Xwcu95xjgLPWBh1
        BrEp8D1+AUuJBqrbZxlSvLeG1NOP
X-Google-Smtp-Source: ABdhPJw4nTTlAcX8d+BhUjxjdiFwhbDwVyk1t/I78GmhUejlpVVnVlmgNC4Agenn3OiQSj2VnHfthA==
X-Received: by 2002:a17:902:a50c:: with SMTP id s12mr2162224plq.119.1594698440688;
        Mon, 13 Jul 2020 20:47:20 -0700 (PDT)
Received: from [192.168.50.147] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id az16sm890478pjb.7.2020.07.13.20.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 20:47:19 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] ufs: ufs-qcom: Fix a few BUGs in func
 ufs_qcom_dump_dbg_regs()
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
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1594693693-22466-1-git-send-email-cang@codeaurora.org>
 <1594693693-22466-4-git-send-email-cang@codeaurora.org>
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
Message-ID: <7b0f8a73-d49d-eb7d-defe-8e77a49064ae@acm.org>
Date:   Mon, 13 Jul 2020 20:47:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594693693-22466-4-git-send-email-cang@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-13 19:28, Can Guo wrote:
> Dumping testbus registers needs to sleep a bit intermittently as there are
> too many of them. Skip them for those contexts where sleep is not allowed.
> 
> Meanwhile, if ufs_qcom_dump_dbg_regs() calls ufs_qcom_testbus_config() from
> ufshcd_suspend/resume and/or clk gate/ungate context, pm_runtime_get_sync()
> and ufshcd_hold() will cause racing problems. Fix it by removing the
> unnecessary calls of pm_runtime_get_sync() and ufshcd_hold().
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 2e6ddb5..3743c17 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1604,9 +1604,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>  	 */
>  	}
>  	mask <<= offset;
> -
> -	pm_runtime_get_sync(host->hba->dev);
> -	ufshcd_hold(host->hba, false);
>  	ufshcd_rmwl(host->hba, TEST_BUS_SEL,
>  		    (u32)host->testbus.select_major << 19,
>  		    REG_UFS_CFG1);
> @@ -1619,8 +1616,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>  	 * committed before returning.
>  	 */
>  	mb();
> -	ufshcd_release(host->hba);
> -	pm_runtime_put_sync(host->hba->dev);
>  
>  	return 0;
>  }
> @@ -1658,11 +1653,13 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>  
>  	/* sleep a bit intermittently as we are dumping too much data */
>  	ufs_qcom_print_hw_debug_reg_all(hba, NULL, ufs_qcom_dump_regs_wrapper);
> -	udelay(1000);
> -	ufs_qcom_testbus_read(hba);
> -	udelay(1000);
> -	ufs_qcom_print_unipro_testbus(hba);
> -	udelay(1000);
> +	if (in_task()) {
> +		udelay(1000);
> +		ufs_qcom_testbus_read(hba);
> +		udelay(1000);
> +		ufs_qcom_print_unipro_testbus(hba);
> +		udelay(1000);
> +	}
>  }

It is not clear to me how udelay() calls can help in code that takes long
since these functions use busy-waiting? Should the udelay() calls perhaps
be changed into cond_resched() calls?

Thanks,

Bart.
