Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A67251449A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 03:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgAVCCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 21:02:38 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37433 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgAVCCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 21:02:38 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so2500278pfn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 18:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RNbLgYCC7xEpZRvuzQgdidtXruGY+CqXI8AlCvarpGs=;
        b=PaNSy6lVfNp4bzrjkFmT75AsWJgYUTvjCBTF1FVPFdOKVZE6GbHOFX/zv8X2IhWA+u
         jNz/lf6KR6yiBM6FNggbSnJUU5WaxP6QlNIDSvOj9tX8mpgWbSEuAI6Fy4CkvfAiMCoj
         JMh2AKnM6uS3BZ/Yp8zeyU4o2PRBcqwpwcC1vlnvN29UhBoVgbxmo55+Uci6b1edG53g
         fLUf0fKOuIMdQNW7NhwiAaPNGnrZtd3A27TiuKjGBZb05mNpFb1asQH+0RuIdbsaCTTK
         C+XgQfBQFiYN8QdqYKcFtxtsBu63lmumn4MaiKBnuIKp1IODSmG79Ztj7+XnHNISZ0GV
         97cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RNbLgYCC7xEpZRvuzQgdidtXruGY+CqXI8AlCvarpGs=;
        b=a8B2RLJJFRqvHw7omNC6QzEZkoJ5Z2P4Ke1+Eik/j1PPPuEo/yYBLwxkDp+bQTeZBn
         Mu7nZvk/5sH4CEWkxbY1CoOg2VpBN/ta9tPiz1552abvMEVcZrgt7UTufuL0s6Aei8Qr
         gsEeUwffR0rk9tfJzcBhdH+zL2jRgOQrfYDOBq/u0DW/ALNnizIkobYE7frG40VA2o/2
         yuMxajIzsZYtHdLEEuq4mEU1+TYJo0fkC02w2GKKZuu0EElalXxRJZvMiGyO98Ty/y2I
         oX3cGPSCve3MasflKtD26dI/Ln7CTr4zyLoIpkG0VNH/JUvcm8891ZnQ6aTKdfI2GozL
         AEtg==
X-Gm-Message-State: APjAAAXUxLVcxLc3FnW4+AKBSnhBoC8CUi9z+8CD1/y1O+h5dadnilhJ
        yntTj2gfbSV8sXbuXfcjXNnRKw==
X-Google-Smtp-Source: APXvYqzR9npjI/ee4Nc5nySUhKi5BqX+9N3Vqpy8VXNMKCXoLixaHproTp9kibCEoCspqOIcjx2BJA==
X-Received: by 2002:a63:6602:: with SMTP id a2mr8176588pgc.403.1579658557430;
        Tue, 21 Jan 2020 18:02:37 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d23sm43547803pfo.176.2020.01.21.18.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 18:02:36 -0800 (PST)
Date:   Tue, 21 Jan 2020 18:02:34 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200122020234.GT1511@yoga>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org>
 <20200110211846.GA11555@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110211846.GA11555@xps15>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 10 Jan 13:18 PST 2020, Mathieu Poirier wrote:
> On Thu, Dec 26, 2019 at 09:32:09PM -0800, Bjorn Andersson wrote:
[..]
> > diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
> > new file mode 100644
> > index 000000000000..b0897ae9eae5
> > --- /dev/null
> > +++ b/drivers/remoteproc/qcom_pil_info.c
> > @@ -0,0 +1,150 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2019 Linaro Ltd.
> > + */
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mutex.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/slab.h>
> 
> These should be in alphabetical order if there is no depencencies
> between them, something checkpatch complains about.
> 

Of course.

> > +
> > +struct pil_reloc_entry {
> > +	char name[8];
> 
> Please add a #define for the name length and reuse it in qcom_pil_info_store()
> 

Ok

[..]
> > +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
> > +{
> > +	struct pil_reloc_entry *entry;
> > +	int idx = -1;
> > +	int i;
> > +
> > +	mutex_lock(&reloc_mutex);
> > +	if (!_reloc)
> 
> Since it is available, I would use function qcom_pil_info_available().  Also
> checkpatch complains about indentation problems related to the 'if' condition
> but I can't see what makes it angry.
> 

Sure thing, and I'll double check the indentation.

> > +		goto unlock;
> > +
> > +	for (i = 0; i < PIL_INFO_ENTRIES; i++) {
> > +		if (!_reloc->entries[i].name[0]) {
> > +			if (idx == -1)
> > +				idx = i;
> > +			continue;
> > +		}
> > +
> > +		if (!strncmp(_reloc->entries[i].name, image, 8)) {
> > +			idx = i;
> > +			goto found;
> > +		}
> > +	}
> > +
> > +	if (idx == -1) {
> > +		dev_warn(_reloc->dev, "insufficient PIL info slots\n");
> > +		goto unlock;
> 
> Given how this function is used in the next patch I think an error should be
> reported to the caller.
> 

Just to clarify, certain global errors will cause the entire device to
be reset and allow memory contents to be extracted for analysis in post
mortem tools. This patch ensures that this information contains
(structured) information about where each remote processor is loaded.
Afaict the purpose of propagating errors from this function would be for
the caller to abort the launching of a remote processor.

I think it's better to take the risk of having insufficient data for the
post mortem tools than to fail booting a remote processor for a reason
that won't affect normal operation.

> > +	}
> > +
> > +found:
> > +	entry = &_reloc->entries[idx];
> > +	stracpy(entry->name, image);
> 
> Function stracpy() isn't around in mainline.
> 

Good catch, I'll spin this with a strscpy() to avoid build errors until
stracpy lands.

> > +	entry->base = base;
> > +	entry->size = size;
> > +
> > +	regmap_bulk_write(_reloc->map, _reloc->offset + idx * sizeof(*entry),
> > +			  entry, sizeof(*entry) / _reloc->val_bytes);
> 
> Same here - the error code should be handled and reported to the caller.  
> 

Will undo the "allocation" of _reloc->entries[idx] on failure, let me
know what you think about my reasoning above regarding propagating this
error (or in particular acting upon the propagated value).

> > +
> > +unlock:
> > +	mutex_unlock(&reloc_mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pil_info_store);
[..]
> > +static int pil_reloc_probe(struct platform_device *pdev)
> > +{
> > +	struct pil_reloc *reloc;
> > +
> > +	reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
> > +	if (!reloc)
> > +		return -ENOMEM;
> > +
> > +	reloc->dev = &pdev->dev;
> > +	reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
> > +	if (IS_ERR(reloc->map))
> > +		return PTR_ERR(reloc->map);
> > +
> > +	if (of_property_read_u32(pdev->dev.of_node, "offset", &reloc->offset))
> > +		return -EINVAL;
> > +
> > +	reloc->val_bytes = regmap_get_val_bytes(reloc->map);
> > +	if (reloc->val_bytes < 0)
> > +		return -EINVAL;
> > +
> > +	regmap_bulk_write(reloc->map, reloc->offset, reloc->entries,
> > +			  sizeof(reloc->entries) / reloc->val_bytes);
> 
> Error code handling.
> 

Yes, that makes sense.

Thanks for the review Mathieu!

Regards,
Bjorn

> Thanks,
> Mathieu
> 
> > +
> > +	mutex_lock(&reloc_mutex);
> > +	_reloc = reloc;
> > +	mutex_unlock(&reloc_mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pil_reloc_remove(struct platform_device *pdev)
> > +{
> > +	mutex_lock(&reloc_mutex);
> > +	_reloc = NULL;
> > +	mutex_unlock(&reloc_mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id pil_reloc_of_match[] = {
> > +	{ .compatible = "qcom,pil-reloc-info" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, pil_reloc_of_match);
> > +
> > +static struct platform_driver pil_reloc_driver = {
> > +	.probe = pil_reloc_probe,
> > +	.remove = pil_reloc_remove,
> > +	.driver = {
> > +		.name = "qcom-pil-reloc-info",
> > +		.of_match_table = pil_reloc_of_match,
> > +	},
> > +};
> > +module_platform_driver(pil_reloc_driver);
> > +
> > +MODULE_DESCRIPTION("Qualcomm PIL relocation info");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/remoteproc/qcom_pil_info.h b/drivers/remoteproc/qcom_pil_info.h
> > new file mode 100644
> > index 000000000000..0372602fae1d
> > --- /dev/null
> > +++ b/drivers/remoteproc/qcom_pil_info.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __QCOM_PIL_INFO_H__
> > +#define __QCOM_PIL_INFO_H__
> > +
> > +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size);
> > +bool qcom_pil_info_available(void);
> > +
> > +#endif
> > -- 
> > 2.24.0
> > 
