Return-Path: <linux-arm-msm+bounces-97922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEOuIyrlt2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:10:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E75CD29883C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF64E3022957
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B6326ED41;
	Mon, 16 Mar 2026 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TmZDZCCd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tAHROEEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6FB1DF723
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659143; cv=none; b=dQtzlo+tknJxR4r3x+08IDY7kJynJvZZ+yp+lrUcQcOkBE1zqlCPLm+aBXX1Z27XLIlDOd6yk0J6ZQ2N8tljTxomVydwnoiepYJNaf9vDU6PHCyvCij+jletMrpGT19ah21KG/Qau7Ut6vetxYl0udm1q1KrOJVVyBQIgduzMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659143; c=relaxed/simple;
	bh=Ad453GyO/zo6v2miyh1zTsFX+JblatB8NS4t5mLlf4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bprtbvX7yLXBA7a2nBtIp5dvMU1KuKBS4LdIi5VGv4Qyd/TOXyPcpPKVwW3bJ+ysDtTLbhn9MPg7DRfOG6lN19SveK4Yu5a09m0FjOWPof5o1yjvTeC1xzTRRJ+eQSOjduI2qO+LIti38aVi02Q3uR/jLL1FtDsOX9Puhq5cz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TmZDZCCd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tAHROEEh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773659141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=35G1xZGf0uqjk0dykU1nJVs0B6K9SxHlDxmUBHf6ahQ=;
	b=TmZDZCCdc8je/3bwcYCe/YVWToPHsGLE7f4eAwtXfFCIsF86b9czFzfT3eBkBOGpO2lFQq
	L0arwpVkqGjJz73P/WEtCVUGEjykDXqNYNgrkPAutn/qAWOS0zqqzx8qgFYNFyP4N6Aemd
	hIYVv+RdDFSTvgCyUx/0aRcMb9D4LjY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-vI3rvWqMPvieWjmzkch2PA-1; Mon, 16 Mar 2026 07:05:39 -0400
X-MC-Unique: vI3rvWqMPvieWjmzkch2PA-1
X-Mimecast-MFC-AGG-ID: vI3rvWqMPvieWjmzkch2PA_1773659139
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso14014591cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773659139; x=1774263939; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35G1xZGf0uqjk0dykU1nJVs0B6K9SxHlDxmUBHf6ahQ=;
        b=tAHROEEhgHw50qcYusB2vUaMI4r4cQqp4MeLY0lOe/xUNRMLm32tkAQK1EHx5JMFIR
         KMj8mtq5LOQ0LiCmrjT4D+ZZ4gULeZAJe1l/uBYGU9zGLkFF3aa9OawW9h3z0fDnkYvw
         LUBteXZn+o/9L8nqskWFgZWoFe2ZOCYpjaKImZN2c9F16uusQjjMHzqsL20vN4T7g2aD
         l/GrI23le39zTdfU0AK+feM9Xke9LPKU2RvbxJwIj9okKF2tlvs5Ka16yB14TFUkapmY
         LLd8uQ5SnjHMAurSEkIwnY/GKJWWLNwQm10eCVggOhnmBZRnGLjOVQBaX3RTOdDw6WHB
         TXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659139; x=1774263939;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=35G1xZGf0uqjk0dykU1nJVs0B6K9SxHlDxmUBHf6ahQ=;
        b=lc8MmCtJJA6M4NHw4wsxi3KV3O4OsUE8FaWQY3i3c5lQ11gIKUEoGKIE/QoKTBBP/X
         cLXP8k52DCbQC4+BiwZNPh5GYwRIMGlrk+7Zgta1TsBkWOVRPXmWh6BSKbqht3kIf1Pc
         y5jWHbWSVmptbmvnBlDgmzq6XR/Hs+EjoFDzIepgaH2tswpIllM5W80Eko/pJYiYcj64
         B/r49Ey9F9DPprYSqwMtxuEvtf15+S8skdqujxkaljEqZokNDjmZ075mHdcuOzm5SgOa
         GzLXmwyudn+VDcbhCG2GGLURXDWwpxrq8kmck48L+vtQnCpOvsjzh1jxv+KaTr1VNPZ/
         Y59A==
X-Forwarded-Encrypted: i=1; AJvYcCWw/spx9uRB9SFbnJuIV0c6KmWCQG77byeX7LulsVB3pOjDhQic01UbfUJdEXgZ5mtUaj77yhKDN5hMLhLU@vger.kernel.org
X-Gm-Message-State: AOJu0YznUXmFggKbqeAKCiHbPL4BWmIVOToE0+TekJ96o7yJudQcYvi/
	rdfQ6Z+vfHI4Lafg9Uk/wFdiiPUoA3E165C9lD85CKN3ge6OtDhn8appuh0xHipa5rVlnOqPwAF
	BNwW9mIc++fNweCWdf5LW/PMWdpwr2+XEBUZ7nlolNdxifvrpMVSEC3VgycD4471XMzA=
X-Gm-Gg: ATEYQzz1CbIPBvzGB71rHwMwL5/CbCglMewEOqnEZTBqiNUvz77M7dVL+1mmcRCcWhN
	69CHBj2doLMZpY6fIKKmw+iNsOtwPA+RMS9OfxiFibXsAsNR7W+g/EFFSElmRXpb5Lb3y9yjwtk
	iN2uytuPUTlQQBPmhqXBhTUa6D+Kh40Q5WcvWjsCid+AFlA/wFNhG5NJq/XuBSm2KJBrB2+qjzw
	TC1mm7TRCgg3gllLlq0V11UiXtf1y+5Kg0+uyB+jJNt1YFoGeC0lzPLTd3Wl4br79d+WP9OP3y4
	EoqZKCjdo6z+WocGzNuwkSgvQ8/Pk9vCLGIosRYMhrWjK9y8v+3HASyJ8gfIGfrt35B8cgKjMxZ
	DKtLmpkgKx8Z88ajBHLFrw96S1vJvlmFgq4bvmmeqrQ/L4lATnXq4R9Yq
X-Received: by 2002:ac8:5914:0:b0:509:350e:743e with SMTP id d75a77b69052e-50957cf28eemr172911451cf.22.1773659139219;
        Mon, 16 Mar 2026 04:05:39 -0700 (PDT)
X-Received: by 2002:ac8:5914:0:b0:509:350e:743e with SMTP id d75a77b69052e-50957cf28eemr172911031cf.22.1773659138822;
        Mon, 16 Mar 2026 04:05:38 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a14d7a6sm113916121cf.33.2026.03.16.04.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:05:38 -0700 (PDT)
Date: Mon, 16 Mar 2026 07:05:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: mani@kernel.org, jassisinghbrar@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mpapini@redhat.com, dnita@qti.qualcomm.com,
	rballati@qti.qualcomm.com, bijothom@qti.qualcomm.com,
	wchadwic@redhat.com
Subject: Re: [PATCH 2/2] mailbox: qcom-ipcc: amend qcom_ipcc_irq_fn() to
 report errors
Message-ID: <abfkAFIheKCuLRKk@redhat.com>
References: <20260316102618.7953-1-gpaoloni@redhat.com>
 <20260316102618.7953-3-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316102618.7953-3-gpaoloni@redhat.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,redhat.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97922-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E75CD29883C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:26:18AM +0100, Gabriele Paoloni wrote:
> check the virq value returned by irq_find_mapping(), also
> check the return value of generic_handle_irq(); return IRQ_NONE
> if either of the checks fails.
> 
> Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index c23efaaa64a1..0795184591f0 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -75,7 +75,7 @@ static irqreturn_t qcom_ipcc_irq_fn(int irq, void *data)
>  {
>  	struct qcom_ipcc *ipcc = data;
>  	u32 hwirq;
> -	int virq;
> +	int virq, ret;

Put variables in reverse Christmas tree order.

Brian


>  
>  	for (;;) {
>  		hwirq = readl(ipcc->base + IPCC_REG_RECV_ID);
> @@ -83,8 +83,14 @@ static irqreturn_t qcom_ipcc_irq_fn(int irq, void *data)
>  			break;
>  
>  		virq = irq_find_mapping(ipcc->irq_domain, hwirq);
> +		if (unlikely(!virq))
> +			return IRQ_NONE;
> +
>  		writel(hwirq, ipcc->base + IPCC_REG_RECV_SIGNAL_CLEAR);
> -		generic_handle_irq(virq);
> +
> +		ret = generic_handle_irq(virq);
> +		if (unlikely(ret))
> +			return IRQ_NONE;
>  	}
>  
>  	return IRQ_HANDLED;
> -- 
> 2.48.1
> 


