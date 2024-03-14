Return-Path: <linux-arm-msm+bounces-14194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8A887C4C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 22:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C174D283D04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 21:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813B076417;
	Thu, 14 Mar 2024 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIPTzrH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10057351E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710451873; cv=none; b=oBUuEXRgL1lC2Ueqo+t5BtzwvR4L1+cRD07FdvnpaETIoo6r9PF2p+I4YTomcK2oiAWnMHjzLZecQol4x37TjVDd9KFnI+Q17POIaAknsr2gwT+RnvBuGfHLUSOSG2mOXr7O6xklm6b1mrGWPI6K4LhqrethYA2KFnd6JxBMYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710451873; c=relaxed/simple;
	bh=lLq2z3acMBmKWSX0heeafT8NN4r2sNB2KCmYV7lgKbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FH8CAjq13MIFhrJ0Hk3Gu4rDZmOdaCSXY5js5UDr5NHlgXsfBh1NLxc6O+ZdTy9pme1MyjlK6nRSi88TqJ6+droI50ZAVqAqLjd+qHt6LNtL75PwB/xN8HwKwGWl3898vyO2ubJdXMfDVIY4wI3HmQ73xnRAJWZjVB4PEBiQDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIPTzrH0; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc236729a2bso1333364276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 14:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710451870; x=1711056670; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EOl/X/aPu0Coxr/5ANXN6j6HPnl02z9ugLIqCnakY0A=;
        b=hIPTzrH09l1SIygaYLEFcCje+H0BrRshHeH4+P+s73lZ0xPYUgVMVZBl+/Q/zy3eiV
         lyEhd9v162OMAOQMSVyQMC2hYG76VJUR2s+V0ZUlCnd0obO+MuzZFjX/yiXoc1vg68f3
         afU5HtHzth3z+B+uontxro2tY//nSdNFL4iiDIk6kwOUb+jePikpRum6zcvtWsXaqKUN
         sb2LUlY8gauC7eYnlmW5IkxC/Bk7RrhuVgxlVujYbcYKM7uWaJddJL/IR064nwXIZaDl
         9TFG1ieup+KPNfhGXuJNlZz8uk525H1SI30Gd+cK9lEeZQfhxU+g2xXaOcGgy8zFyM7a
         Fsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710451870; x=1711056670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOl/X/aPu0Coxr/5ANXN6j6HPnl02z9ugLIqCnakY0A=;
        b=NC7qOBN8JJ0DASWV69Ak7WZgZR/6VQsADCvFiVjo/ifZKGdXpp23AbFUNy1k6r2xms
         6+rzPXleX+i3jbeBUk35yHY39NT3dalKIYmXmyneeiWdH87hrF+dtJskNPEAFstnUbKr
         ttJwZ3NsTcBtEnS4VA+QUgiCJW7EAx8EczrAA+ZuOrWi70KMEtckl2E189LBKwYCdQLr
         PlELKDjasP3U1nv0MkYYSykxuKYIVKeoYP8b0MiTg24/b8brcxtvioksAgygVOEWvJqM
         MzN2Peyj6qeEOTyRUWHdf+tsnMJMhTMXdiRJiuebez+h6ZtfiQDvMsj71oFKNCgCKaSx
         IB8g==
X-Forwarded-Encrypted: i=1; AJvYcCVVOsjzsz3I3vq64j6BKn152zKfssN9mkVYV8OQWvktsrzNr5yDZ6K4AYd8v2NyarlQnvDXlR1YjNOhlZ4YnLuQohUx38sLEFq9n5NLPw==
X-Gm-Message-State: AOJu0Yy+E+nybFket1AJT8aev2I439pFQ78neZ0LsEx6o2G6IRFy6Jfv
	OHhGch5agh6KxaczMkhuThewVjrijaPS2N5NPvEnPn9p9AiivKdK5klYRp9Eezfk2X94Ninhfi/
	To7c9ubcPAp7zjpkFxcBX2N+HpkxWLalrweOGe8Atkb0E3yXF
X-Google-Smtp-Source: AGHT+IE7fca54CqrT9ej0Gh2NfwDmefTfPeTkgdJsVY6rfRdiQoWuCVZ53vuVxxMF2+mr/Fterc2I0euMEjOPT9ivRU=
X-Received: by 2002:a25:9182:0:b0:dcf:4663:ecd8 with SMTP id
 w2-20020a259182000000b00dcf4663ecd8mr3123365ybl.8.1710451870607; Thu, 14 Mar
 2024 14:31:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org> <714bb2ca-40ac-80a2-454f-021da3caa93d@quicinc.com>
In-Reply-To: <714bb2ca-40ac-80a2-454f-021da3caa93d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 23:30:59 +0200
Message-ID: <CAA8EJpokFA=s5uhrb-OxH=BigfAP7jZ_K5z1FXJ0p1h3h3_CLQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 21:44, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
>
> On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
> > +int qcom_pdm_add_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> > +{
> > +     int ret;
> > +     int i;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     if (qcom_pdm_server_added) {
> > +             ret = qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                                  SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +             if (ret)
> > +                     goto err_out;
> > +     }
> > +
> > +     for (i = 0; i < num_data; i++) {
> > +             ret = qcom_pdm_add_domain_locked(data[i]);
> > +             if (ret)
> > +                     goto err;
> > +     }
> > +
> > +     ret = qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                          SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +     if (ret) {
> > +             pr_err("PDM: error adding server %d\n", ret);
> > +             goto err;
> > +     }
> > +
> > +     qcom_pdm_server_added = true;
> > +
> > +     mutex_unlock(&qcom_pdm_mutex);
> > +
> > +     return 0;
> > +
> > +err:
> > +     while (--i >= 0)
> > +             qcom_pdm_del_domain_locked(data[i]);
> > +
> > +     qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                    SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +
> > +err_out:
> > +     mutex_unlock(&qcom_pdm_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pdm_add_domains);
> > +
> > +void qcom_pdm_del_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> > +{
> > +     int i;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     if (qcom_pdm_server_added) {
> > +             qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                            SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +     }
>
> I am confused as to why we need to reset the qmi handle anytime
> qcom_pdm_del_domains or qcom_pdm_add_domains is called. Is this to
> trigger some kind of re-broadcast type notification to clients because
> the service list has been updated?

Yes. Otherwise clients like pmic-glink will miss new domains.

>
> My concern would be that this causes some kind of unintended side-effect
> on the rprocs that are not restarting.

Well, an alternative is to match machine compatible strings and to
build a full list of domains right from the beginning.

>
> > +
> > +     for (i = 0; i < num_data; i++)
> > +             qcom_pdm_del_domain_locked(data[i]);
> > +
> > +     qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                    SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +     qcom_pdm_server_added = true;
> > +
> > +     mutex_unlock(&qcom_pdm_mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pdm_del_domains);
> > +
> > +static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
> > +                                  struct sockaddr_qrtr *sq,
> > +                                  struct qmi_txn *txn,
> > +                                  const void *decoded)
> > +{
> > +     const struct servreg_loc_get_domain_list_req *req = decoded;
> > +     struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
> > +     struct qcom_pdm_service *service;
> > +     u32 offset;
> > +     int ret;
> > +
> > +     offset = req->offset_valid ? req->offset : 0;
> > +
> > +     rsp->rsp.result = QMI_RESULT_SUCCESS_V01;
> > +     rsp->rsp.error = QMI_ERR_NONE_V01;
> > +
> > +     rsp->db_revision_valid = true;
> > +     rsp->db_revision = 1;
> > +
> > +     rsp->total_domains_valid = true;
> > +     rsp->total_domains = 0;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     service = qcom_pdm_find_locked(req->name);
> > +     if (service) {
> > +             struct qcom_pdm_domain *domain;
> > +
> > +             rsp->domain_list_valid = true;
> > +             rsp->domain_list_len = 0;
> > +
> > +             list_for_each_entry(domain, &service->domains, list) {
> > +                     u32 i = rsp->total_domains++;
> > +
> > +                     if (i >= offset && i < SERVREG_LOC_MAX_DOMAINS) {
> > +                             u32 j = rsp->domain_list_len++;
> > +
> > +                             strscpy(rsp->domain_list[j].name, domain->name,
> > +                                     sizeof(rsp->domain_list[i].name));
> > +                             rsp->domain_list[j].instance_id = domain->instance_id;
> > +
> > +                             pr_debug("PDM: found %s / %d\n", domain->name,
> > +                                      domain->instance_id);
> > +                     }
> > +             }
> > +
> > +     }
> > +
> > +     mutex_unlock(&qcom_pdm_mutex);
> > +
> > +     pr_debug("PDM: service '%s' offset %d returning %d domains (of %d)\n", req->name,
> > +              req->offset_valid ? req->offset : -1, rsp->domain_list_len, rsp->total_domains);
> > +
> > +     ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_GET_DOMAIN_LIST,
> > +                             2658,
> > +                             servreg_loc_get_domain_list_resp_ei, rsp);
>
> Other QMI clients like pdr_interface have macros for the message size.
> Can we considering adding one instead of using 2658 directly?


Ack

>
> > +     if (ret)
> > +             pr_err("Error sending servreg response: %d\n", ret);
> > +
> > +     kfree(rsp);
> > +}
> > +
> > +static void qcom_pdm_pfr(struct qmi_handle *qmi,
> > +                      struct sockaddr_qrtr *sq,
> > +                      struct qmi_txn *txn,
> > +                      const void *decoded)
> > +{
> > +     const struct servreg_loc_pfr_req *req = decoded;
> > +     struct servreg_loc_pfr_resp rsp = {};
> > +     int ret;
> > +
> > +     pr_warn_ratelimited("PDM: service '%s' crash: '%s'\n", req->service, req->reason);
> > +
> > +     rsp.rsp.result = QMI_RESULT_SUCCESS_V01;
> > +     rsp.rsp.error = QMI_ERR_NONE_V01;
> > +
> > +     ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_PFR,
> > +                             SERVREG_LOC_PFR_RESP_MSG_SIZE,
> > +                             servreg_loc_pfr_resp_ei, &rsp);
> > +     if (ret)
> > +             pr_err("Error sending servreg response: %d\n", ret);
> > +}
> > +
> > diff --git a/drivers/soc/qcom/qcom_pdm_msg.h b/drivers/soc/qcom/qcom_pdm_msg.h
> > new file mode 100644
> > index 000000000000..e576b87c67c0
> > --- /dev/null
> > +++ b/drivers/soc/qcom/qcom_pdm_msg.h
> > @@ -0,0 +1,66 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2018, Linaro Ltd.
> > + * Copyright (c) 2016, Bjorn Andersson
> > + */
> > +
> > +#ifndef __QMI_SERVREG_LOC_H__
> > +#define __QMI_SERVREG_LOC_H__
> > +
>
> Should we update the header guards to reflect the new file name?

Ack

>
> > +#include <linux/types.h>
> > +#include <linux/soc/qcom/qmi.h>
> > +
> > +#define SERVREG_QMI_SERVICE 64
> > +#define SERVREG_QMI_VERSION 257
> > +#define SERVREG_QMI_INSTANCE 0
> > +#define QMI_RESULT_SUCCESS 0
> > +#define QMI_RESULT_FAILURE 1
> > +#define QMI_ERR_NONE 0
> > +#define QMI_ERR_INTERNAL 1
> > +#define QMI_ERR_MALFORMED_MSG 2
>
> I think these common QMI macro definitions are wrong. They should match
> what is defined in <soc/qcom/qmi.h>. This is a bug in the userspace
> pd-mapper header as well.

Ack

>
> > +#endif
> > diff --git a/include/linux/soc/qcom/pd_mapper.h b/include/linux/soc/qcom/pd_mapper.h
> > new file mode 100644
> > index 000000000000..86438b7ca6fe
> > --- /dev/null
> > +++ b/include/linux/soc/qcom/pd_mapper.h
> > @@ -0,0 +1,39 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Qualcomm Protection Domain mapper
> > + *
> > + * Copyright (c) 2023 Linaro Ltd.
> > + */
> > +#ifndef __QCOM_PD_MAPPER__
> > +#define __QCOM_PD_MAPPER__
> > +
> > +struct qcom_pdm_domain_data {
> > +     const char *domain;
> > +     u32 instance_id;
> > +     /* NULL-terminated array */
> > +     const char * services[];
>
> s/char * services[]/char *services[]/



-- 
With best wishes
Dmitry

