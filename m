Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E054517307C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 06:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgB1Fe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 00:34:27 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35360 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgB1Fe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 00:34:26 -0500
Received: by mail-pj1-f68.google.com with SMTP id q39so823902pjc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 21:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ABqkN8aqbIHHq6CJCYzSzg/UYqF9PzEXTXmM8ircYdE=;
        b=iXGNUb/uZGGZqE9qRVAQdGFZFVitoGfbTVoTeXp/0CB2r/Z0qwh/bwxklZ8Q7cYuYu
         2RvKwC+gehTtiwjrX9jbCYozOL3ChBhd1Kk3XsFae6+/t1mv1cuKZaxn0SHr35igPDM0
         iD5x2VXAOPlIZRmR7UOjDeRw2xcQ08RE5Yxos0yuMbCP3QTNw13nVM5uGGN6Xfd1lah3
         0/zD5Ld7dZHKAMnYLF1TTkaiei2a+VS3yzeHB5RQBu+io9m5rPvEqKUk1XoMAhTvvpvG
         skvYMD5yyrwEzGpvtm9J/S1H/8xBe7TmBoTUK4kDL95kYI2r0OhDV676MwAPh+B+ptvn
         Svbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ABqkN8aqbIHHq6CJCYzSzg/UYqF9PzEXTXmM8ircYdE=;
        b=IsIYfD6kaHkoylBHub4lV5Ed0AX0H6mxuuMNYNt/4N5wbfdytGL/Uzn0c88QbeiQwe
         vgXqFq+N9QDmfrRrKfgR6mYeEx1rtBFgw+G+OmXKO/6C037jB1X61rK0LX4in4iiw0Kt
         5LCTpi3/u/nwxdCMSMwG0rO3xvoktK6aw/Dl0kbMqN9M0+fU1qnDE9Q9OBCNHeeuAacf
         Zd1XFmnY0O0GWxnbHhGLFGUGxdQbIn+k6+L6IWUijwtnJ+6uMFE3dsYs3uFKjoO0U4q1
         D6RChQSYnN3FGnAsJxvSLcwVRncwbxZTSr0LYdAR1O/8PqSgQWRR/u7/i/0sGa2a53VN
         Xp+Q==
X-Gm-Message-State: APjAAAWWErSNNN3xDCNe6snkcUS786fHvYIb/DH+ok8DjNhCpp+q9jxO
        kb5ugkm19/jdgz8mI5mEfNhXwQ==
X-Google-Smtp-Source: APXvYqwCds92WSgOcATJjPe5GOxHNR3RIEXkjbscjsxcH0l7rplY2Ca6nLAzVaRD/jXZ+Ny7BqZg2w==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr2408012pla.17.1582868064152;
        Thu, 27 Feb 2020 21:34:24 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q13sm8659550pgh.30.2020.02.27.21.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 21:34:23 -0800 (PST)
Date:   Thu, 27 Feb 2020 21:34:20 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsoni@codeaurora.org, vnkgutta@codeaurora.org
Subject: Re: [PATCH v4 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
Message-ID: <20200228053420.GC210720@yoga>
References: <20200226170001.24234-1-sibis@codeaurora.org>
 <20200226170001.24234-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226170001.24234-2-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 Feb 08:59 PST 2020, Sibi Sankar wrote:
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
[..]
> +config QCOM_PDR_HELPERS
> +	tristate
> +	depends on ARCH_QCOM || COMPILE_TEST

As discussed on one of you other patches, please omit the depends on for
Kconfig entries that are not user selectable. Presumably anyone
selecting this option will have ARCH_QCOM met already.

> +	select QCOM_QMI_HELPERS
[..]
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
[..]
> +static void pdr_locator_work(struct work_struct *work)
> +{
> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> +					      locator_work);
> +	struct pdr_service *pds;
> +	int ret = 0;
> +
> +	/* Bail out early if the SERVREG LOCATOR QMI service is not up */
> +	mutex_lock(&pdr->lock);
> +	if (!pdr->locator_init_complete) {
> +		mutex_unlock(&pdr->lock);
> +		pr_debug("PDR: SERVICE LOCATOR service not available\n");
> +		return;
> +	}
> +	mutex_unlock(&pdr->lock);
> +
> +	mutex_lock(&pdr->list_lock);
> +	list_for_each_entry(pds, &pdr->lookups, node) {
> +		if (!pds->need_locator_lookup)
> +			continue;
> +
> +		pds->need_locator_lookup = false;
> +		mutex_unlock(&pdr->list_lock);
> +
> +		ret = pdr_locate_service(pdr, pds);
> +		if (ret < 0)
> +			goto exit;
> +
> +		/* Initialize notifier QMI handle */
> +		mutex_lock(&pdr->lock);
> +		if (!pdr->notifier_init_complete) {
> +			ret = qmi_handle_init(&pdr->notifier_hdl,
> +					      SERVREG_STATE_UPDATED_IND_MAX_LEN,
> +					      &pdr_notifier_ops,
> +					      qmi_indication_handler);
> +			if (ret < 0) {
> +				mutex_unlock(&pdr->lock);
> +				goto exit;
> +			}
> +			pdr->notifier_init_complete = true;
> +		}
> +		mutex_unlock(&pdr->lock);
> +
> +		ret = qmi_add_lookup(&pdr->notifier_hdl, pds->service, 1,
> +				     pds->instance);
> +		if (ret < 0)
> +			goto exit;
> +
> +		return;

If the caller calls pdr_add_lookup() multiple times in quick succession
wouldn't it be possile to get the worker scheduled with multiple entries
in &pdr->lookups with need_locator_lookup set?

If so I think it makes sense to break the content of this loop, and the
error handling under exit out into a separate function.

And even if this would not be the case, breaking this out in a separate
function would allow you to change the loop to:

	list_for_each_entry() {
		if (pdr->need_locator_lookup) {
			do_the_lookup();
			break;
		}
	}

Which I think is easier to reason about than the loop with a return at
the end.

> +	}
> +	mutex_unlock(&pdr->list_lock);
> +exit:
> +	if (ret < 0) {
> +		/* Notify lookup failed */
> +		mutex_lock(&pdr->list_lock);
> +		list_del(&pds->node);
> +		mutex_unlock(&pdr->list_lock);
> +
> +		if (ret == -ENXIO)
> +			pds->state = SERVREG_LOCATOR_UNKNOWN_SERVICE;
> +		else
> +			pds->state = SERVREG_LOCATOR_ERR;
> +
> +		pr_err("PDR: service lookup for %s failed: %d\n",
> +		       pds->service_name, ret);
> +
> +		mutex_lock(&pdr->status_lock);
> +		pdr->status(pds->state, pds->service_path, pdr->priv);
> +		mutex_unlock(&pdr->status_lock);
> +		kfree(pds);
> +	}
> +}
[..]
> +struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
> +						   char *service_path,
> +						   void *priv), void *priv)
> +{
> +	struct pdr_handle *pdr;
> +	int ret;
> +
> +	if (!status)
> +		return ERR_PTR(-EINVAL);
> +
> +	pdr = kzalloc(sizeof(*pdr), GFP_KERNEL);
> +	if (!pdr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pdr->status = *status;

Please omit the * here.

Regards,
Bjorn
