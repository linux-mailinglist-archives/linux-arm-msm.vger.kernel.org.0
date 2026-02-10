Return-Path: <linux-arm-msm+bounces-92471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BZ4MlgEi2kMPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:11:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B7F11978C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3466D3062FBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B689340260;
	Tue, 10 Feb 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hrD+eCg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E6342534
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717970; cv=none; b=OwoaKB5fsT/j2UpswtpUd5StO+cVU/bnUCBS4jvygxPB13Qt5Si2AVb3LYDoRi2twtNyR9PSvtV91OVH++8PsbRLe8XfXiSLa+HYtoqwff3AWT1BUCarloxbH/cR7kejVLuzrMbDZCnNXznWALQpeVY5fmp0eIl3DxmGdFTE4q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717970; c=relaxed/simple;
	bh=iSptxz8p4g6PdPf6HENwaDd6LV2JWc2F7IUKzPBclHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=bo17h9VD9uyn655b3WPlHPP5P15nyABn3n+dL6t5aVel5udGv83GYv3mbZfVw1UaN5B7QlOCBpA/N9+sM6oGMh2vaL6bZGFNF78jRwCeQ74iOeW8Gk1RkMyzkAxf/G20j2S2QADkp/DJG57Vgh6p8bA6WvtpnBMy7fr6HgPdwbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hrD+eCg/; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260210100600euoutp01ef3c34a0b0bb9c9ca2e5797bbe93e868~S2ppjycA40998909989euoutp01C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:06:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260210100600euoutp01ef3c34a0b0bb9c9ca2e5797bbe93e868~S2ppjycA40998909989euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770717960;
	bh=iqv5yu3rZHAdomhHqmBxnT8iNOSK+QFPJ3nRHhxnESE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hrD+eCg/x3K0GV2CXmRRwRD+jvUUYhvNtM57pZhyE9lLEtIn93hh2AJlgzXDCRapV
	 lwFjEEkBhpf0mKXEj7YZPu7crdfPQoHhbRCsnQAkK3vvYLaQGn5EDP2IgBFuI6MTXZ
	 IRA/OSUMD3hlbIXiIDuuNcF1fTiCS39qQvnk8jhI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260210100559eucas1p27d8d05bbeb0789cc784c731e60cbfd68~S2ppNelee1483214832eucas1p2V;
	Tue, 10 Feb 2026 10:05:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260210100559eusmtip29f0f19592053e074a3c00f4215774666~S2pog4J0N0437504375eusmtip2X;
	Tue, 10 Feb 2026 10:05:58 +0000 (GMT)
Message-ID: <871063b3-6293-4b62-b9a0-e637fac5dd27@samsung.com>
Date: Tue, 10 Feb 2026 11:05:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix reserved region mapping
 failure
To: "Rob Herring (Arm)" <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260128220243.3018526-1-robh@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260210100559eucas1p27d8d05bbeb0789cc784c731e60cbfd68
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260128220305eucas1p23e47ba043c0314765ce41478b4b8a0d6
X-EPHeader: CA
X-CMS-RootMailID: 20260128220305eucas1p23e47ba043c0314765ce41478b4b8a0d6
References: <CGME20260128220305eucas1p23e47ba043c0314765ce41478b4b8a0d6@eucas1p2.samsung.com>
	<20260128220243.3018526-1-robh@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92471-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[samsung.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apitzsch.eu:email,samsung.com:mid,samsung.com:dkim,samsung.com:email]
X-Rspamd-Queue-Id: 57B7F11978C
X-Rspamd-Action: no action

On 28.01.2026 23:02, Rob Herring (Arm) wrote:
> Commit c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_*
> functions for "memory-region"") switched from devm_ioremap_wc() to
> devm_ioremap_resource_wc(). The difference is devm_ioremap_resource_wc()
> also requests the resource which fails. Testing of both fixed and
> dynamic reserved regions indicates that requesting the resource should
> work, so I'm not sure why it doesn't work in this case. Fix the issue by
> reverting back to devm_ioremap_wc().
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reported-by: André Apitzsch <git@apitzsch.eu>
> Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> I created some dummy regions matching the flags used here and did
> request_mem_region() on them successfully, so I'm not sure why it
> doesn't work for this driver. Something else is requesting the region?
>
> Perhaps there's a deferred probe and somehow request_mem_region() is not
> getting undone correctly?

I didn't manage to track what is the root cause of the 
request_mem_region() failure, but this is definitely not related to 
deferred probe. This function is called only once from the qcom_wcnss 
driver and fails, because the region is already assigned to 'reserved' 
owner.

> ---
>   drivers/remoteproc/qcom_wcnss.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index ee18bf2e8054..4add9037dbd5 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -537,7 +537,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
>   
>   	wcnss->mem_phys = wcnss->mem_reloc = res.start;
>   	wcnss->mem_size = resource_size(&res);
> -	wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);
> +	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
>   	if (IS_ERR(wcnss->mem_region)) {
>   		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
>   		return PTR_ERR(wcnss->mem_region);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


