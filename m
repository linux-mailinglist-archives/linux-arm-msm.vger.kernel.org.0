Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF7D2F6808
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 18:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbhANRqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 12:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbhANRqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 12:46:53 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94044C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 09:46:13 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id s2so6766628oij.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 09:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SAnzF7R6Caz4U+k3zwE4s0KEM6nSZw6o6b8hrTbUJ9s=;
        b=dDY591TeiEex0IDZVa/g13w58AYUJ7xykGJHjag8jJsoVndObeoyBf6J73APGlUdhj
         LlZi4Vg2uiwFehg89ZtylcOMKuduc2N/a5v8y4VTWkYBNn+g4EMPZWhY62RizcEVZRcg
         RCC/Ki7LRJnW+eDZ8G4QHtWbqZzn64pIs4x9coAzHcWTHvKUnEOFcbOg3gHsqxTnvFQW
         goPf/KvB2U2Fwc2E/iEcpkooK3xnUX9gHGx6T1VFHrtCc9WeEtCzuk+EDWPhQWTMbmJZ
         47l+elc8RtcWXEgRVqWAmbxlNgsXqixmILcT2mZeawK05Peu23pqGqBVGHd1a0Sgoo3u
         ydvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SAnzF7R6Caz4U+k3zwE4s0KEM6nSZw6o6b8hrTbUJ9s=;
        b=IfBYY0UxwYaOzvqF2p3Zd4SZThNdMGESVvdfn8Y/1QIEvkSJTvvvoA3qYbhhN3VoNi
         njdSABk9r3AcgUAcasY7RBgmg6Vu69Uai2KZoyl7mFbP0gPd3evRRnILQ3VbAY3M95mw
         RLHwuH8MdKrojuoTj0tlBCk70bkuMAKvF65c+zjTbAWmxgof+wx8prsCuBKi/y4ODkh4
         Frp4HrCb/FLwRB9V7GiSJDVohEkLRHGHWdq+ocFsJDVJ3aertSJ2i9tDu9a90Xk6QAUe
         UJdTR7o+nYqWXkgZAw4qilB6+kbwYWbUZBURbwPLQk2KpsxjmG+oia0go6SuHEBFW5HT
         S8DQ==
X-Gm-Message-State: AOAM530njHirO4ze/r1qiuLlL5ncqqpgRjgwl+qB8ZwJGSEwwAlccqvm
        vf53i2Rq+Pq2RMV+I1/cxcLiOg==
X-Google-Smtp-Source: ABdhPJzXHRNwTVfJj0bP0ahMUpFVNKwa6CFVWry7BHzkSkKF0N4sfEFJaGH3XORIo2JK8erZfssHBw==
X-Received: by 2002:aca:50ca:: with SMTP id e193mr3191502oib.154.1610646372950;
        Thu, 14 Jan 2021 09:46:12 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i1sm1230373otr.81.2021.01.14.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 09:46:12 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:46:10 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Read hash from firmware blob
Message-ID: <YACDYu/qaYPyfKqS@builder.lan>
References: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
 <1609968211-7579-4-git-send-email-sidgup@codeaurora.org>
 <X/elgO+66ibjeL+3@builder.lan>
 <ec2a7223-d785-a9f3-d864-3c03e4965be5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec2a7223-d785-a9f3-d864-3c03e4965be5@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 13 Jan 17:01 CST 2021, Siddharth Gupta wrote:

> 
> On 1/7/2021 4:21 PM, Bjorn Andersson wrote:
> > On Wed 06 Jan 15:23 CST 2021, Siddharth Gupta wrote:
> > 
> > > Since the split elf blobs will always contain the hash segment, we rely on
> > I think it will sounds better if we add "should" in "we should rely on..."
> Sure
> > 
> > > the blob file to get the hash rather than assume that it will be present in
> > > the mdt file. This change uses the hash index to read the appropriate elf
> > > blob to get the hash segment.
> > > 
> > > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_mss.c  |  4 ++--
> > >   drivers/soc/qcom/mdt_loader.c       | 38 +++++++++++++++++++++++++++----------
> > >   include/linux/soc/qcom/mdt_loader.h |  3 ++-
> > >   3 files changed, 32 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > > index 66106ba..74c0229 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > > @@ -4,7 +4,7 @@
> > >    *
> > >    * Copyright (C) 2016 Linaro Ltd.
> > >    * Copyright (C) 2014 Sony Mobile Communications AB
> > > - * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> > > + * Copyright (c) 2012-2013, 2020 The Linux Foundation. All rights reserved.
> > >    */
> > >   #include <linux/clk.h>
> > > @@ -828,7 +828,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
> > >   	void *ptr;
> > >   	int ret;
> > > -	metadata = qcom_mdt_read_metadata(fw, &size);
> > > +	metadata = qcom_mdt_read_metadata(qproc->dev, fw, qproc->hexagon_mdt_image, &size);
> > >   	if (IS_ERR(metadata))
> > >   		return PTR_ERR(metadata);
> > > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > > index c9bbd8c..6876c0b 100644
> > > --- a/drivers/soc/qcom/mdt_loader.c
> > > +++ b/drivers/soc/qcom/mdt_loader.c
> > > @@ -103,15 +103,18 @@ EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
> > >    *
> > >    * Return: pointer to data, or ERR_PTR()
> > >    */
> > > -void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
> > > +void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
> > > +			     size_t *data_len)
> > >   {
> > >   	const struct elf32_phdr *phdrs;
> > >   	const struct elf32_hdr *ehdr;
> > > -	size_t hash_offset;
> > > +	const struct firmware *seg_fw;
> > >   	size_t hash_index;
> > >   	size_t hash_size;
> > >   	size_t ehdr_size;
> > > +	char *fw_name;
> > >   	void *data;
> > > +	int ret;
> > >   	ehdr = (struct elf32_hdr *)fw->data;
> > >   	phdrs = (struct elf32_phdr *)(ehdr + 1);
> > > @@ -137,14 +140,29 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
> > >   	if (!data)
> > >   		return ERR_PTR(-ENOMEM);
> > > -	/* Is the header and hash already packed */
> > > -	if (qcom_mdt_bins_are_split(fw))
> > > -		hash_offset = phdrs[0].p_filesz;
> > > -	else
> > > -		hash_offset = phdrs[hash_index].p_offset;
> > > -
> > > +	/* copy elf header */
> > >   	memcpy(data, fw->data, ehdr_size);
> > > -	memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
> > > +
> > This seems to duplicates parts of the loop in __qcom_mdt_load(), how
> > about breaking this out to a separate
> > 
> > static int mdt_load_segment(struct device *dev, const struct firmware *fw,
> > 			    int idx, void *buf, size_t len, bool is_split)
> > 
> > Which either just memcpy from @fw or does the filename and loading
> > dance, based on @is_split?
> Since mdt_load_segment won't know the name of the firmware without a global
> variable
> (which in turn will make it non-reentrant), the idea of creating such a
> function and not passing
> the actual name of the firmware seemed wrong.
> 

Wouldn't you be able to pass "firmware" as an argument to the
load_segment function?

> If we want to pass the firmware name in this function the code size will be
> more or equal to
> what we started with. If that is not a problem I can make the changes.
> 

Perhaps I'm missing something here, I do expect that you would end with
code similar to the hunk you add here. But in doing so we should be able
to reuse that in the __qcom_mdt_load(). Or am I too optimistic?

(In particular I'm not fond of the fw_name dance and doing it twice is
worse)

Regards,
Bjorn

> Thanks,
> Sid
> > 
> > Regards,
> > Bjorn
> > 
> > > +	if (qcom_mdt_bins_are_split(fw)) {
> > > +		fw_name = kstrdup(firmware, GFP_KERNEL);
> > > +		if (!fw_name) {
> > > +			kfree(data);
> > > +			return ERR_PTR(-ENOMEM);
> > > +		}
> > > +		snprintf(fw_name + strlen(fw_name) - 3, 4, "b%02d", hash_index);
> > > +
> > > +		ret = request_firmware_into_buf(&seg_fw, fw_name, dev, data + ehdr_size, hash_size);
> > > +		kfree(fw_name);
> > > +
> > > +		if (ret) {
> > > +			kfree(data);
> > > +			return ERR_PTR(ret);
> > > +		}
> > > +
> > > +		release_firmware(seg_fw);
> > > +	} else {
> > > +		memcpy(data + ehdr_size, fw->data + phdrs[hash_index].p_offset, hash_size);
> > > +	}
> > >   	*data_len = ehdr_size + hash_size;
> > > @@ -191,7 +209,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
> > >   		return -ENOMEM;
> > >   	if (pas_init) {
> > > -		metadata = qcom_mdt_read_metadata(fw, &metadata_len);
> > > +		metadata = qcom_mdt_read_metadata(dev, fw, firmware, &metadata_len);
> > >   		if (IS_ERR(metadata)) {
> > >   			ret = PTR_ERR(metadata);
> > >   			goto out;
> > > diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> > > index e600bae..04ba5e8 100644
> > > --- a/include/linux/soc/qcom/mdt_loader.h
> > > +++ b/include/linux/soc/qcom/mdt_loader.h
> > > @@ -21,6 +21,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
> > >   			  const char *fw_name, int pas_id, void *mem_region,
> > >   			  phys_addr_t mem_phys, size_t mem_size,
> > >   			  phys_addr_t *reloc_base);
> > > -void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
> > > +void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
> > > +			     size_t *data_len);
> > >   #endif
> > > -- 
> > > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > > 
