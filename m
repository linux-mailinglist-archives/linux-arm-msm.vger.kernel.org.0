Return-Path: <linux-arm-msm+bounces-51676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 386EEA66B0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48359175EEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B4C1DFD89;
	Tue, 18 Mar 2025 07:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bc7ovjbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9718D1B85D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742281521; cv=none; b=V0knASpeVfyGrWCxMUjsjjENDyCDefbkCebId20WLeLC8uybMdOLl2C8gBQriKZk8BvdG0MNQuhqzt84R9h3W0DPay1Obq7o32oHxJf/R3diMGT3Od/Z53J0m/i9bwbfI/IfdICZ8WJU+uBvE47DhnA4YG6UKbtPnA8uPMPB48c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742281521; c=relaxed/simple;
	bh=qCITQPsy2GwiPIzdSarHb8VqhI6wNrVYai8jeIXLBy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvLcKSmcQFk7x7NAp8ZKTJA0XuQ7iKuzKxFqvxyrANXzxfQrKlIAWZLfPO6Id25YDJvt0Psj53eFEgNMvmk1q8hsmPbgHPIJbVg39VoYzFHd//Lh6rW6yCeJgmc2z33QLDdERwukUwgQytQxT7OmqPEa6kbPKuG2kEk+jjx+e2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bc7ovjbU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2255003f4c6so90988575ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 00:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742281519; x=1742886319; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QXrW4KZykPW/TaRaUNi4OeOrIqggNnusl7chmQ738FU=;
        b=bc7ovjbULADqDVRybCDAqUjiTgCs3RSyvnUpbOt6AAUfPy1fV8kBtpTuMr2iYl05Kc
         HxAcs8F1lI7kbpQSjv2QjkrLr+116wIveG5gmOQ1toQp49aVAQJ2Fce6noFDyrFSO1hg
         5PAUteT0F8bHwTBNUuExQWcvs4EhLbN6GG99KPfWxZNlMwTV1gMLte3VJ7l8fMyyHgzV
         842kkvY864eY24Ymu1Q7F8VwS/annjMHfeSdrdMDbcX97LjmR5Zm3KdZsVjZHIwg5nB1
         Bul3vQpiyjfLAnCFMz7m4jJBbTfaPEVBK/XyY+GA7+rudEl71jebrkc1prJcI1wLRo1a
         Umbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742281519; x=1742886319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXrW4KZykPW/TaRaUNi4OeOrIqggNnusl7chmQ738FU=;
        b=ZRSPO5DpB05+0acc1B+g5mFaPTvsEyUFAdt6y4Fy1p+eX3D+nmbDuh4YzNx+x52ihL
         swJvghV2b106HAbj90bC9mex1oTnc0gjrAE9ltgalgfIceVeir274/ISyacIm9CSbW1/
         9E6h8TmVtsK+vD108t9LNEtX9sdzrkDbWGbX3TtjjMG7ubfXKOOf2Q0ecVSQ7i1e+OyI
         VCYmrZoMoafd3vC2HKEVisDAbKBKdBcGNKUcmvS5AnkzMjvRWjx89iU/uvkNJOePBtWG
         caSi9U8FL2YOjDJ90Cf4HAerxtTWWil3kyJI5eTctf1WgI/Cv4PwwYR4vuayZJsMsj2f
         j6bg==
X-Forwarded-Encrypted: i=1; AJvYcCVWspqg+PRlJkIr4cM/vhJSrFQ/XDwtAqMa2x44jQa0cg06GbbVmcGRT/OgMJiJgB3/5CUOT91VAlkz0k0r@vger.kernel.org
X-Gm-Message-State: AOJu0YwqV63eYxQTf57L/8J+8vTVe/EaVXgvbeENMDq9HDRfLQSt8WJh
	CpzIlk+bOa4HBlpIRVbfTxJPiB0vs/NCj/6+2WeydqKP0KXjCLLe3Dzl6UFiAw==
X-Gm-Gg: ASbGncu2EnehBZFJMer5Te1e7V64fhq9nuCamPlXD3RsWraiSh+KcHaiysHZ++m0uL+
	CwvzN46znDOsadgOgK5DL5GmyQ9qHb00LYc/VQjk1Ah74t2xsb9ZRg8rxijRewhCIPPaYUVDiq8
	Gs3lBor89A/DyH8HJfMUaR8lUNN2U62FQ28AxHL4ejDpwFjz57qHHDaUctS/VB3CII3jrK6r7Fa
	xzEM5f4VR2mex0V7RFlmuRaR5S+/1bGXt4qdp0m6/ZxaikKXjwC10Da1pWugLt8L+ETkqX0gXzM
	vWQSy+VmhIh+cB9r4zq/yYd5CSo5UFPsjMsPR8NRPcNsWaRQdaPOL2/l5/f4FnTXjn8=
X-Google-Smtp-Source: AGHT+IFELZZGoPfT6STXRlYgerVWlkmXVkLlEhm+ubQe4itMsy4v3K90wtNq7bLioIFZ/Q1rMqJxyw==
X-Received: by 2002:a17:902:f686:b0:221:7eae:163b with SMTP id d9443c01a7336-225e0b09706mr189606415ad.46.1742281518851;
        Tue, 18 Mar 2025 00:05:18 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301536320e1sm7394697a91.36.2025.03.18.00.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:05:18 -0700 (PDT)
Date: Tue, 18 Mar 2025 12:35:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3 3/3] scsi: ufs-qcom: Add support for testbus registers
Message-ID: <20250318070513.rhl5lfwdu7mo7xv6@thinkpad>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
 <20250313051635.22073-4-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313051635.22073-4-quic_mapa@quicinc.com>

On Thu, Mar 13, 2025 at 10:46:35AM +0530, Manish Pandey wrote:
> This patch introduces support for dumping testbus registers,
> enhancing the debugging capabilities for UFS-QCOM drivers.
> 

Same comment as patch 1.

> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> ---
> Changes in v3:
> - Annotated the 'testbus' declaration with __free.
> - Converted the switch-statements into an array lookup.
> - Introduced struct testbus_info{} for handling testbus switch-statements to an array lookup.
> Changes in v2:
> - Rebased patchsets.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/
> 
> ---
>  drivers/ufs/host/ufs-qcom.c | 53 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index fb9da04c0d35..c32b1268d299 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -17,6 +17,7 @@
>  #include <linux/time.h>
>  #include <linux/unaligned.h>
>  #include <linux/units.h>
> +#include <linux/cleanup.h>

Sort includes alphabetically.

>  
>  #include <soc/qcom/ice.h>
>  
> @@ -98,6 +99,24 @@ static const struct __ufs_qcom_bw_table {
>  	[MODE_MAX][0][0]		    = { 7643136,	819200 },
>  };
>  
> +static const struct {
> +	int nminor;
> +	char *prefix;
> +} testbus_info[TSTBUS_MAX] = {
> +	[TSTBUS_UAWM]     = {32, "TSTBUS_UAWM "},
> +	[TSTBUS_UARM]     = {32, "TSTBUS_UARM "},
> +	[TSTBUS_TXUC]     = {32, "TSTBUS_TXUC "},
> +	[TSTBUS_RXUC]     = {32, "TSTBUS_RXUC "},
> +	[TSTBUS_DFC]      = {32, "TSTBUS_DFC "},
> +	[TSTBUS_TRLUT]    = {32, "TSTBUS_TRLUT "},
> +	[TSTBUS_TMRLUT]   = {32, "TSTBUS_TMRLUT "},
> +	[TSTBUS_OCSC]     = {32, "TSTBUS_OCSC "},
> +	[TSTBUS_UTP_HCI]  = {32, "TSTBUS_UTP_HCI "},
> +	[TSTBUS_COMBINED] = {32, "TSTBUS_COMBINED "},
> +	[TSTBUS_WRAPPER]  = {32, "TSTBUS_WRAPPER "},
> +	[TSTBUS_UNIPRO]   = {256, "TSTBUS_UNIPRO "}
> +};
> +
>  static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
>  static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
>  
> @@ -1566,6 +1585,33 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>  	return 0;
>  }
>  
> +static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	int i, j, nminor = 0, testbus_len = 0;
> +	u32 *testbus __free(kfree) = NULL;
> +	char *prefix;
> +
> +	testbus = kmalloc(256 * sizeof(u32), GFP_KERNEL);

Use kmalloc_array().

> +	if (!testbus)
> +		return;
> +
> +	for (j = 0; j < TSTBUS_MAX; j++) {
> +		nminor = testbus_info[j].nminor;
> +		prefix = testbus_info[j].prefix;
> +		host->testbus.select_major = j;
> +		testbus_len = nminor * sizeof(u32);
> +		for (i = 0; i < nminor; i++) {
> +			host->testbus.select_minor = i;
> +			ufs_qcom_testbus_config(host);
> +			testbus[i] = ufshcd_readl(hba, UFS_TEST_BUS);
> +			usleep_range(100, 200);

Why this delay is required?

> +		}
> +		print_hex_dump(KERN_ERR, prefix, DUMP_PREFIX_OFFSET,
> +				16, 4, testbus, testbus_len, false);
> +	}
> +}
> +
>  static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
>  {
>  	/* sleep intermittently to prevent CPU hog during data dumps. */
> @@ -1680,9 +1726,14 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>  
>  	/* ensure below dumps occur only in task context due to blocking calls. */
>  	if (in_task()) {
> -		/* Dump MCQ Host Vendor Specific Registers */
> +		/* dump MCQ Host Vendor Specific Registers */

Spurious change.

>  		if (hba->mcq_enabled)
>  			ufs_qcom_dump_mcq_hci_regs(hba);
> +
> +		/* sleep a bit intermittently as we are dumping too much data */
> +		ufshcd_dump_regs(hba, UFS_TEST_BUS, 4, "UFS_TEST_BUS ");
> +		usleep_range(1000, 1100);

Same comment as previous patch. Use cond_resched().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

