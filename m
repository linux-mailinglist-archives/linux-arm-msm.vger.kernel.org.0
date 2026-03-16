Return-Path: <linux-arm-msm+bounces-97993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOGAO+M7uGmpagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:20:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA3E29E0A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 991243157458
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B973D1CA2;
	Mon, 16 Mar 2026 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="FcStwyyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237DA3D16EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681212; cv=none; b=XWmfqVXGIsnNFataale8RIrtEqbyYZXy55CJ/iI143sgXRu/MxvfP1H6W8opvfdCxoaoIoqoPEtpE7rS/Rr/Cjy7wAuRgri2UR8rqoyLo7cE+FmkkYYstMvm3NJLFbXRQKvIfI4fzvWtT3cvev9RyzBzJV3Ic3pj3S22UkvwPCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681212; c=relaxed/simple;
	bh=b0j9oNMdJdMNOAdm/nemFGVAa/OM2F5Qihg0k+VobB4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fYbRL4qfpagre1Y5JKZsGwX8w33sr5aCMmyQ78JOGHl1k/aDJDnxmOYq2u4qQjVu+CI0lNN8PoebpSTCuyFIqrW2Om57OG3DyGEoROUvwuDG6ZxRea9NKTnsQQbNVFyW07BOAKYBEQBW5Xx3CLNaualBqm0dCU/wiiHvt9Xkz7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=FcStwyyZ; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89a07f66f4eso57283836d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1773681209; x=1774286009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KKNAuzsfMofCUgk72CAOSiu5PG9m6z3uwFl0PtKhug=;
        b=FcStwyyZ8gyclUrfQjU/lMyplpfjh3DO6tv0bzAzIuz5J52bmArgYiAjNJVJ8zGrxC
         hpFFOq+CQ5tPMhmXYG0I217C4VKSSK4z84+Km1n11moJPyTq/fORMwbo0bGuz4Z6r5zz
         WK6V9uiz5keZg+FtLfLyOuELIjQ1WiGZflW1JcoXKRXCEvnaAWjWaG9RMINThxjOZxbP
         sntcvUt2dlUvE1Iqit3wuShGnZWS30DbGF6O8mocLKrmVQyJUN5lQfsozIpTAdpmDi1C
         0sC3L0QnUvTGLZovq89e17WYx4/3huofjKteYhvSj3ApWiaduQWtqcKkMoVzuC7lSBmG
         0DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681209; x=1774286009;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KKNAuzsfMofCUgk72CAOSiu5PG9m6z3uwFl0PtKhug=;
        b=dAhal0Wm7CNd9Y3U0H/lHFOVeCY5TqutdWVxE2LOd8wIE6Don84EOUH7o8T1l3BJbT
         QrVp41kyx/PGxuC7jEhrliwp1LD8q1JQUf0zdGX/H5td2tvHrigGHm3vL36h2uSZ1pdb
         LqppLc42Iht1Y7C5N8BEc2InDR/6qIESlK9u2bctE5o4Wlib8omiTe38p/I7gd+4265l
         Py9Tf1Fv4pU0n3mKqIVEeQfD9rharUj1jzjCV4zr1ViCM/h63IWxLFmpuqO/KsRNGwbo
         H3i826xV0DQzpI4tLceFUL7GbrkJif2wo1NRQD4OxwHyBKE0gvIwu0dOO3yzw/StsqKt
         1Y4A==
X-Forwarded-Encrypted: i=1; AJvYcCXz3qLM55u/ZH5C3y24PKQXosOF1Ao/MelcluMG5HpEcWLzlb3nyDjaAGn9wBlFk9tufIdJgfmj7M1myoBs@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWJszv6t7XgtNfnrP/zdfdkJtNlDu6KHyjQsGhiUQWM9Oe+lH
	374uo/4IWhRcnPuJ3U9JH3mjCZrbdEprV6ZpL2mOZsZEmWMhAC2pP6PnvT7/WWPKvvE=
X-Gm-Gg: ATEYQzwWnnDwtMnF3qK6gTAl4+EAdpn041hyMOuCf/CXLnNwvoAfEAXUaMJdZL0mVPi
	iydGaTAdBdNVa4AQXUWPA3Pf6O+taD5lcG61xq6pMOC5bF5r7XqUsB1JfQU+t2XbDGxL4LIYHlK
	wUB6ybGJDXac5ijMrJY2O6QTOhWcLZMJs6e33sLaARDfgJ3nn71myIX7DrEZHu2+fX2ue/r3jg1
	duLrX8yFSY76lFBxbTMPcmUJdke7rHJHDLzOCZDNYvpzyN3CB1zlsfznVMKEh4HcLLIBBQa8s2Y
	POsTIWVmMhtsuoSJupnWnP3PDRHpmFobEKUOoe1TkT6jS3GnwRpbQDRDqvhYwIOcjqGAU3XHOqH
	SUq6sWG/Xrqfb+TkxLAofhGoVsbVouZcCP4Pi9+f1Lvv9XJ5waXHoYN59reWOPopVlTzSEUNvzT
	1cHYM4+BtlA+d/kXKN+K8p5Qzv97ZbdGWfx+TwGkfmyco7jjMeP6qeW2RQ5RZ7M1lvkipT2fRt5
	IqLxEPw
X-Received: by 2002:a05:6214:2aa4:b0:89c:505e:a96d with SMTP id 6a1803df08f44-89c505ec595mr73090966d6.3.1773681209073;
        Mon, 16 Mar 2026 10:13:29 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c440d4594sm48468046d6.5.2026.03.16.10.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 10:13:28 -0700 (PDT)
Subject: Re: [PATCH v1] spi: geni-qcom: Fix CPHA and CPOL mode change
 detection
To: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 bjorande@quicinc.com, mukesh.savaliya@oss.qualcomm.com,
 praveen.talari@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <4a7d89ef-0f63-a7c3-e996-ff9fc476a04e@marek.ca>
Date: Mon, 16 Mar 2026 13:13:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[marek.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97993-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[marek.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[marek.ca:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan@marek.ca,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marek.ca:dkim,marek.ca:email,marek.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5BA3E29E0A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reviewed-by: Jonathan Marek <jonathan@marek.ca>

at least it doesn't look like this stupid mistake breaks anything 
upstream (no spi-cpha/spi-cpol in any qcom dts)

On 3/16/26 9:23 AM, Maramaina Naresh wrote:
> setup_fifo_params computes mode_changed from spi->mode flags but tests
> it against SE_SPI_CPHA and SE_SPI_CPOL, which are register offsets,
> not SPI mode bits. This causes CPHA and CPOL updates to be skipped
> on mode switches, leaving the controller with stale clock phase
> and polarity settings.
> 
> Fix this by using SPI_CPHA and SPI_CPOL to detect mode changes before
> updating the corresponding registers.
> 
> Fixes: 781c3e71c94c ("spi: spi-geni-qcom: rework setup_fifo_params")
> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
> ---
> This patch fixes SPI mode change detection in the spi-geni-qcom driver.
> 
> setup_fifo_params compared spi->mode against SE_SPI_CPHA/SE_SPI_CPOL,
> which are register offsets instead of SPI_CPHA/SPI_CPOL mode bits.
> This could skip CPHA/CPOL updates on mode switches and leave stale
> clock configuration.
> 
> This is a single-patch series.
> ---
>   drivers/spi/spi-geni-qcom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 43ce47f2454c..772b7148ba5f 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -359,9 +359,9 @@ static int setup_fifo_params(struct spi_device *spi_slv,
>   		writel((spi_slv->mode & SPI_LOOP) ? LOOPBACK_ENABLE : 0, se->base + SE_SPI_LOOPBACK);
>   	if (cs_changed)
>   		writel(chipselect, se->base + SE_SPI_DEMUX_SEL);
> -	if (mode_changed & SE_SPI_CPHA)
> +	if (mode_changed & SPI_CPHA)
>   		writel((spi_slv->mode & SPI_CPHA) ? CPHA : 0, se->base + SE_SPI_CPHA);
> -	if (mode_changed & SE_SPI_CPOL)
> +	if (mode_changed & SPI_CPOL)
>   		writel((spi_slv->mode & SPI_CPOL) ? CPOL : 0, se->base + SE_SPI_CPOL);
>   	if ((mode_changed & SPI_CS_HIGH) || (cs_changed && (spi_slv->mode & SPI_CS_HIGH)))
>   		writel((spi_slv->mode & SPI_CS_HIGH) ? BIT(chipselect) : 0, se->base + SE_SPI_DEMUX_OUTPUT_INV);
> 
> ---
> base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
> change-id: 20260316-spi-geni-cpha-cpol-fix-89126ed55325
> 
> Best regards,
> 

