Return-Path: <linux-arm-msm+bounces-97639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GojkMxuLtGlCpgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 23:09:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF028A447
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 23:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC43D301F38D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 22:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C9E382F00;
	Fri, 13 Mar 2026 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="EiiSUDgg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B943845C7;
	Fri, 13 Mar 2026 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773439767; cv=none; b=rujoa4GRwoQZw7tn/Iwb8mVK0t9cy1ELUwDGdWp/hkja5Poqc4KEYlmBGA0oasvD7dTcVCks+B2cj+k1mtKHibxextcwix3nK2ENS0HYeNxm0wG3ZYK08UNs0ni3AV5YPmsKN/R4jUuh1YPY0ea1F5wBsHewqRhmB7aA6UhOlzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773439767; c=relaxed/simple;
	bh=2RFzESXteaG9PRkf92qALY+qWP+Yr1pLeEnxN88IEf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaQHS+3UQNCrbNaZ9ZrrpDa0s6MNaxixtWc6Je4IWS1WAfMQgoM2uViKHwi45J/LGMyOb+NiB7U81J+vwEXdUhBUg9/zZZny4aiy1YmBJSPMNjxOm2dyBWO5iPY97Wi/8lbJ4d3gSCU9954OPFBQF6XEuqFwa1jps3sR+8trE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=EiiSUDgg; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fXdtr3Yg6zlfgfG;
	Fri, 13 Mar 2026 22:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773439748; x=1776031749; bh=wG4Mk7n9a3KJbym01Ex6ddbG
	HyReReOxJaeGp+QfjVw=; b=EiiSUDggAbDN741zNUtPvkEmiBs/8fU8NAHvA866
	Ekt0EPS3Ao28nSSTI2CDvN9+h3oEgjXkCk+o27IN/DLDgr9yCo5AviQzOuMB91Jg
	otE1KqyTy9cT2OTbOZFlpT2rBkBjf9A/1lehnN+9N+OgI9PXTQkJ8S2GJVUpTwYh
	5FGccKmzXkV2Cypig5nfBEmliM4OMX1xv+a+PJcQ3A34A4LGJkSYQF+p69yKL7ra
	5m1Lnded5H/dE+vXk3yTXi/yKgnyXB/TrTZa1MCBoV3pnqSuXSwLvLIQCeRxiPaz
	wkKKsbdVqf9WElcmlwydUzcTCGZIeox4j51vE4sY4meYbA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id rvzoD7aQMck2; Fri, 13 Mar 2026 22:09:08 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fXdtQ5jBczlfl7l;
	Fri, 13 Mar 2026 22:09:02 +0000 (UTC)
Message-ID: <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Date: Fri, 13 Mar 2026 15:09:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Ajay Neeli <ajay.neeli@amd.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Stanley Jhu <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Archana Patni <archana.patni@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
 <20260308151409.3779137-2-can.guo@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260308151409.3779137-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97639-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[acm.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acm.org:dkim,acm.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69CF028A447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/8/26 8:13 AM, Can Guo wrote:
> +static int exynos_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
> +					 const struct ufs_pa_layer_attr *dev_max_params,
> +					 struct ufs_pa_layer_attr *dev_req_params)
> +{
> +	struct ufs_host_params host_params;
> +	int ret;
> +
> +	if (!dev_req_params) {
> +		pr_err("%s: incoming dev_req_params is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ufshcd_init_host_params(&host_params);
> +
> +	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
> +	host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
> +	host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
> +
> +	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
> +	if (ret)
> +		pr_err("%s: failed to determine capabilities\n", __func__);
> +
> +	return ret;
> +}

The dev_req_params test is not necessary since the UFS core never passes 
a NULL pointer as third argument, isn't it? I propose to remove the
dev_req_params test.

> +static int ufs_hisi_negotiate_pwr_mode(struct ufs_hba *hba,
> +				       const struct ufs_pa_layer_attr *dev_max_params,
> +				       struct ufs_pa_layer_attr *dev_req_params)
> +{
> +	struct ufs_host_params host_params;
> +	int ret;
> +
> +	if (!dev_req_params) {
> +		dev_err(hba->dev, "%s: incoming dev_req_params is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ufs_hisi_set_dev_cap(&host_params);
> +	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
> +	if (ret)
> +		dev_err(hba->dev, "%s: failed to determine capabilities\n", __func__);
> +
> +	return ret;
> +}

Same comment here - please remove the dev_req_params test.

> +static int ufs_qcom_negotiate_pwr_mode(struct ufs_hba *hba,
> +				       const struct ufs_pa_layer_attr *dev_max_params,
> +				       struct ufs_pa_layer_attr *dev_req_params)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>   	struct ufs_host_params *host_params = &host->host_params;
> +	int ret;
> +
> +	if (!dev_req_params) {
> +		pr_err("%s: incoming dev_req_params is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, dev_req_params);
> +	if (ret)
> +		dev_err(hba->dev, "%s: failed to determine capabilities\n", __func__);
> +
> +	return ret;
> +}

Also here, please remove the dev_req_params test.

Additionally, I see that identical "if (ret) dev_err(...)" code occurs
in the three callbacks shown above. Shouldn't that code be moved into
the only caller of these functions in the UFS core?

Thanks,

Bart.

