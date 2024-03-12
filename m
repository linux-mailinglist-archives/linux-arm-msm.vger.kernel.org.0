Return-Path: <linux-arm-msm+bounces-13909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD09879110
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 10:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFBE1C2118E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 09:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5910077F32;
	Tue, 12 Mar 2024 09:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HevcjAFE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B3AD53;
	Tue, 12 Mar 2024 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710236211; cv=none; b=p89k4xVbE14bI9CaoMjG+BklX3Uxqa8QR6zq3gRyGEzNvXj/Tos0hNsZgl+vdoWZslE3MGJa6Ji+V4beX0k9TlqXcYqi88r0grliizo2Gz9bWi3c2VAFgidJ83HxmRVpdYIUQGSGVX1kVAEHHKHxvkjdV36pW0hydCuR5UsmWGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710236211; c=relaxed/simple;
	bh=YM0BcplBKkMmSr5nfS5GO00ZNnZ1NNfv8isr9+AmYIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmnlDRVda8l9zQOfw7cgCr4aG3wAiC6+fqTuSWIAufY4L2ED6Um/4kXtisG2IUArRC3yc6pWHk/TvUD/5K45Jxq/e84ecfOfFDzBwIo/kUdRvcYyo4Zi2LORct15ZqtB2pD9nSGs3Ousb5aIbXStLKw7A0KCRGCGlJJUCdyEt+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HevcjAFE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6216C433C7;
	Tue, 12 Mar 2024 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710236210;
	bh=YM0BcplBKkMmSr5nfS5GO00ZNnZ1NNfv8isr9+AmYIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HevcjAFERAPwvhFlVaA3Fr1JYySnk0yE6YHwGG2ZIo8Upx/+miOCgOp+BTt8Z90Ez
	 4aq78l9O88H6cJUX5N/kuI4l4syxwO4Ab1Q9RBO0gFXj46dvvUGzezmf8PvSYgTiBK
	 4gn0RVBxc7Zh0ozYoCaZOhghB2W/UivOmSIu+r0wjXFnQV0eSNcQHx1S6ZzjIxhlXj
	 I0a5JbJcqSVr0vVvUYnjIfxSpijhEr1thdCNgg5VlUF8bVrIL49HU6HbFfLOY+1Yaz
	 sh6UTs2Q5BmZVEWhdsX8GAtxaMep4XEQsKsroBNOOASWRr0asNPhPguNx1iOR0n4RI
	 Al1en0Y014QlQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rjyZ6-000000007Qv-0KEZ;
	Tue, 12 Mar 2024 10:36:56 +0100
Date: Tue, 12 Mar 2024 10:36:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
Message-ID: <ZfAiOFccdV4SdytQ@hovoldconsulting.com>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>

On Mon, Mar 11, 2024 at 05:34:03PM +0200, Dmitry Baryshkov wrote:
> Existing userspace protection domain mapper implementation has several
> issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
> reread JSON files if firmware location is changed (or if firmware was
> not available at the time pd-mapper was started but the corresponding
> directory is mounted later), etc.
> 
> Provide in-kernel service implementing protection domain mapping
> required to work with several services, which are provided by the DSP
> firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Just a couple of drive-by comments below.

> +int qcom_pdm_add_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> +{
> +	int ret;
> +	int i;
> +
> +	mutex_lock(&qcom_pdm_mutex);
> +
> +	if (qcom_pdm_server_added) {
> +		ret = qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +				     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> +		if (ret)
> +			goto err_out;

Name error labels after what they do, that is, 'err_unlock' in this
case.

> +	}
> +
> +	for (i = 0; i < num_data; i++) {
> +		ret = qcom_pdm_add_domain_locked(data[i]);
> +		if (ret)
> +			goto err;

And err_del_domains here.

> +	}
> +
> +	ret = qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> +	if (ret) {
> +		pr_err("PDM: error adding server %d\n", ret);
> +		goto err;
> +	}
> +
> +	qcom_pdm_server_added = true;
> +
> +	mutex_unlock(&qcom_pdm_mutex);
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0)
> +		qcom_pdm_del_domain_locked(data[i]);
> +
> +	qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> +		       SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);

Should the server really be added unconditionally here? And if so,
shouldn't you update that flag?

> +
> +err_out:
> +	mutex_unlock(&qcom_pdm_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pdm_add_domains);

> +static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
> +				     struct sockaddr_qrtr *sq,
> +				     struct qmi_txn *txn,
> +				     const void *decoded)
> +{
> +	const struct servreg_loc_get_domain_list_req *req = decoded;
> +	struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
> +	struct qcom_pdm_service *service;
> +	u32 offset;
> +	int ret;
> +
> +	offset = req->offset_valid ? req->offset : 0;
> +
> +	rsp->rsp.result = QMI_RESULT_SUCCESS_V01;
> +	rsp->rsp.error = QMI_ERR_NONE_V01;
> +
> +	rsp->db_revision_valid = true;
> +	rsp->db_revision = 1;
> +
> +	rsp->total_domains_valid = true;
> +	rsp->total_domains = 0;
> +
> +	mutex_lock(&qcom_pdm_mutex);
> +
> +	service = qcom_pdm_find_locked(req->name);
> +	if (service) {
> +		struct qcom_pdm_domain *domain;
> +
> +		rsp->domain_list_valid = true;
> +		rsp->domain_list_len = 0;
> +
> +		list_for_each_entry(domain, &service->domains, list) {
> +			u32 i = rsp->total_domains++;
> +
> +			if (i >= offset && i < SERVREG_LOC_MAX_DOMAINS) {
> +				u32 j = rsp->domain_list_len++;
> +
> +				strscpy(rsp->domain_list[j].name, domain->name,
> +					sizeof(rsp->domain_list[i].name));
> +				rsp->domain_list[j].instance_id = domain->instance_id;
> +
> +				pr_debug("PDM: found %s / %d\n", domain->name,
> +					 domain->instance_id);
> +			}
> +		}
> +

Stray newline.

> +	}
> +
> +	mutex_unlock(&qcom_pdm_mutex);
> +
> +	pr_debug("PDM: service '%s' offset %d returning %d domains (of %d)\n", req->name,
> +		 req->offset_valid ? req->offset : -1, rsp->domain_list_len, rsp->total_domains);
> +
> +	ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_GET_DOMAIN_LIST,
> +				2658,
> +				servreg_loc_get_domain_list_resp_ei, rsp);
> +	if (ret)
> +		pr_err("Error sending servreg response: %d\n", ret);
> +
> +	kfree(rsp);
> +}

Johan

