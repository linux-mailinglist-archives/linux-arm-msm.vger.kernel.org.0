Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDD370D4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 01:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbfGVX1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 19:27:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40573 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728727AbfGVX1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 19:27:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id w10so18396731pgj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 16:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fBgf+Q+vkinrDpZV+VgHPbylGn8fCHsgqpUkQFyCRGE=;
        b=aUyd/VqQ72bWrzac2rWCM7rmT/HoUw2iXPuYr0Z+bkfBXXigQZkfKVG5jkHl/399lq
         D4sEkgwJtBpTXzvRHfiydb+H12cWGeINKcHaPCo5sVClvxSL0pqogwO5lAID5lD+yYAy
         1rW4lJlhoj7W2tX2+cuclbCbLVJKIMis+dX11k33IFe0aQZxratrEU7SisxSgrWP+eHq
         ZR1v8+G5ouz59nsUIy784sQeHTV9kCzZtYpz8o1RKKb5vpNul1+hh/vYqhnl6XtCZew+
         fiUwPA548dmNpqz3IIINgRYa+yxdVopVxKIGuOBMIWUfIPz5Y7zdz/8nap1g+AinMrkg
         WnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fBgf+Q+vkinrDpZV+VgHPbylGn8fCHsgqpUkQFyCRGE=;
        b=tZpjxTb8LCH+Fi60orwsMEQF+/2+0smIrGWzwiew0Q1UF8y8noBPApGPZYGhz3bR7M
         UK7IAjMmlwyphggQxRrGHvWGdSQ+N/fDK6NpxKP/u+3hnKSb+hf5obqA4HkA3rsczFzd
         QaXavKq9OuQ79MLrLVXa7OAu+iQeBD1sc1g8d4XvFJ4bysUOdzGIQDaO9ulj9dBhh+sv
         rr4wnWpgO3rICQD6R1SXCsSFdhkFRUm5GK3n7ShFXdUe6FjG8fdBZAOagpoDErl6bn/u
         yn/dlYWhSHL41REcu5iYpvAwAkUwvhMCQALghlxf7kRPlLwaSmaveoNA7bdOGkveOsUh
         4EEQ==
X-Gm-Message-State: APjAAAXAqxba/vws2nV6ixPFN5WjNO1vTuDXp7RZo6asT8HIcy94NiMk
        4T0PcfcPz7NspplN7dKyPkWkMA==
X-Google-Smtp-Source: APXvYqylTKDwODTJW9tUxv6uI8K4Q/IH9Ngu43INkSMBEqXMCRUmy8x64/UM2q5Wn1rAtPv5k7gPXA==
X-Received: by 2002:aa7:86c6:: with SMTP id h6mr2728534pfo.51.1563838041953;
        Mon, 22 Jul 2019 16:27:21 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b30sm59882598pfr.117.2019.07.22.16.27.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 16:27:21 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:27:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ian Jackson <ian.jackson@citrix.com>,
        Julien Grall <julien.grall@arm.com>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: Re: [PATCH 2/3] firmware: qcom_scm: Cleanup code in
 qcom_scm_assign_mem()
Message-ID: <20190722232719.GT30636@minitux>
References: <23774.56553.445601.436491@mariner.uk.xensource.com>
 <20190517210923.202131-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517210923.202131-3-swboyd@chromium.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 May 14:09 PDT 2019, Stephen Boyd wrote:

> There are some questionable coding styles in this function. It looks
> quite odd to deref a pointer with array indexing that only uses the
> first element. Also, destroying an input/output variable halfway through
> the function and then overwriting it on success is not clear. It's
> better to use a local variable and the kernel macros to step through
> each bit set in a bitmask and clearly show where outputs are set.
> 
> Cc: Ian Jackson <ian.jackson@citrix.com>
> Cc: Julien Grall <julien.grall@arm.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/firmware/qcom_scm.c | 34 ++++++++++++++++------------------
>  include/linux/qcom_scm.h    |  9 +++++----
>  2 files changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 0c63495cf269..153f13f72bac 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -443,7 +443,8 @@ EXPORT_SYMBOL(qcom_scm_set_remote_state);
>   */
>  int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  			unsigned int *srcvm,
> -			struct qcom_scm_vmperm *newvm, int dest_cnt)
> +			const struct qcom_scm_vmperm *newvm,
> +			unsigned int dest_cnt)
>  {
>  	struct qcom_scm_current_perm_info *destvm;
>  	struct qcom_scm_mem_map_info *mem_to_map;
> @@ -458,11 +459,10 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  	int next_vm;
>  	__le32 *src;
>  	void *ptr;
> -	int ret;
> -	int len;
> -	int i;
> +	int ret, i, b;
> +	unsigned long srcvm_bits = *srcvm;
>  
> -	src_sz = hweight_long(*srcvm) * sizeof(*src);
> +	src_sz = hweight_long(srcvm_bits) * sizeof(*src);
>  	mem_to_map_sz = sizeof(*mem_to_map);
>  	dest_sz = dest_cnt * sizeof(*destvm);
>  	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
> @@ -475,28 +475,26 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  
>  	/* Fill source vmid detail */
>  	src = ptr;
> -	len = hweight_long(*srcvm);
> -	for (i = 0; i < len; i++) {
> -		src[i] = cpu_to_le32(ffs(*srcvm) - 1);
> -		*srcvm ^= 1 << (ffs(*srcvm) - 1);
> -	}
> +	i = 0;
> +	for_each_set_bit(b, &srcvm_bits, sizeof(srcvm_bits))

The modem is sad that you only pass 8 here. Changed it to BITS_PER_LONG
to include the modem's permission bit and applied all three patches.

Thanks,
Bjorn

> +		src[i++] = cpu_to_le32(b);
>  
>  	/* Fill details of mem buff to map */
>  	mem_to_map = ptr + ALIGN(src_sz, SZ_64);
>  	mem_to_map_phys = ptr_phys + ALIGN(src_sz, SZ_64);
> -	mem_to_map[0].mem_addr = cpu_to_le64(mem_addr);
> -	mem_to_map[0].mem_size = cpu_to_le64(mem_sz);
> +	mem_to_map->mem_addr = cpu_to_le64(mem_addr);
> +	mem_to_map->mem_size = cpu_to_le64(mem_sz);
>  
>  	next_vm = 0;
>  	/* Fill details of next vmid detail */
>  	destvm = ptr + ALIGN(mem_to_map_sz, SZ_64) + ALIGN(src_sz, SZ_64);
>  	dest_phys = ptr_phys + ALIGN(mem_to_map_sz, SZ_64) + ALIGN(src_sz, SZ_64);
> -	for (i = 0; i < dest_cnt; i++) {
> -		destvm[i].vmid = cpu_to_le32(newvm[i].vmid);
> -		destvm[i].perm = cpu_to_le32(newvm[i].perm);
> -		destvm[i].ctx = 0;
> -		destvm[i].ctx_size = 0;
> -		next_vm |= BIT(newvm[i].vmid);
> +	for (i = 0; i < dest_cnt; i++, destvm++, newvm++) {
> +		destvm->vmid = cpu_to_le32(newvm->vmid);
> +		destvm->perm = cpu_to_le32(newvm->perm);
> +		destvm->ctx = 0;
> +		destvm->ctx_size = 0;
> +		next_vm |= BIT(newvm->vmid);
>  	}
>  
>  	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index d0aecc04c54b..1d406403c843 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -57,8 +57,9 @@ extern int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
>  extern int qcom_scm_pas_auth_and_reset(u32 peripheral);
>  extern int qcom_scm_pas_shutdown(u32 peripheral);
>  extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
> -			       unsigned int *src, struct qcom_scm_vmperm *newvm,
> -			       int dest_cnt);
> +			       unsigned int *src,
> +			       const struct qcom_scm_vmperm *newvm,
> +			       unsigned int dest_cnt);
>  extern void qcom_scm_cpu_power_down(u32 flags);
>  extern u32 qcom_scm_get_version(void);
>  extern int qcom_scm_set_remote_state(u32 state, u32 id);
> @@ -95,8 +96,8 @@ qcom_scm_pas_auth_and_reset(u32 peripheral) { return -ENODEV; }
>  static inline int qcom_scm_pas_shutdown(u32 peripheral) { return -ENODEV; }
>  static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  				      unsigned int *src,
> -				      struct qcom_scm_vmperm *newvm,
> -				      int dest_cnt) { return -ENODEV; }
> +				      const struct qcom_scm_vmperm *newvm,
> +				      unsigned int dest_cnt) { return -ENODEV; }
>  static inline void qcom_scm_cpu_power_down(u32 flags) {}
>  static inline u32 qcom_scm_get_version(void) { return 0; }
>  static inline u32
> -- 
> Sent by a computer through tubes
> 
