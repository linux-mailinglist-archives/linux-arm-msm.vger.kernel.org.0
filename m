Return-Path: <linux-arm-msm+bounces-95086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCstJFyxpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:01:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1C1EC393
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3928030E993A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38C638756E;
	Tue,  3 Mar 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXDWwTpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFDC38F624
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531745; cv=none; b=m8UKpQyEXWv7CbvL2gyqlogVcglEnuA0GasGotCRJWVs2zP/4+QnG9ZvDR+Cx/kQ6WrwjRZvVhKNAmGsOoR+/GAUs7mE34rIT77OJp8igp31rdRIpVQrphK+C81DN4fPdJ5wlTsWXxdsvMxU1CD/u2K9i/CFiKiAmjyLjqBkzYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531745; c=relaxed/simple;
	bh=XfEQZg8O1NwywMbwrjVuCdoCa1sFQb9IBIllLzxCgYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6vQ6eJOMOudyuc1WXLXAeXLZlgtsGjeSwFFAZmnJwksDp2FHWJIa3cPBIvOwzKG+FVlLv4vprl3m0Vyv3J6DCjkFtsvWvGNg7UmoV0EWBw5XyxReXC78KPRgZKGrdNdFvZI6qyTyJ5mVyLg7mlbqFXFZpOrfliw3wLB2unz2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXDWwTpz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483a233819aso52593975e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531743; x=1773136543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8b78R18+qD2EcN3iJ6PBq/vdbXQerYBeT4QKKh24O4=;
        b=xXDWwTpzcfIpZk/BnlC2pRpX1mlJiEZcQsysfzAXgw9qfjHD/Wr1Jjxrz/NbCoEs9W
         h5ZC2mOOscdUKa5Qz/NVMt4FHZk6ipS0Himoa0ZUg2QQ3hcyECe0bSwmr1QYFDcDVOrG
         GK7LjZvoNsuA6b/RzqWJQ+fFJUgmnY0jsxu+84nE+N6IvXO5jHL7riHUa7NbMuCshUHE
         dM1UyOdi8M45wGC6nhl06ZcyXUbZMls+UqTGb4eo2rc7/1g3j3ZYWgFginoKfvQrTxL2
         c6YTuZ7IVAqKjWrGaLXE3FOYM/mh21bjTsUB6tsNiFfKjua6EprUTIK61zErAeMhNqcf
         13eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531743; x=1773136543;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8b78R18+qD2EcN3iJ6PBq/vdbXQerYBeT4QKKh24O4=;
        b=aHVmsk19Yw2RblEYhZTAmY3szNnlgaQfoT/sRIjtWyIs8I8wB9ZotxrARtHzV7i+Od
         UAtS1Pxn0df9skW+4fDbMC9HiG3LtZq/nFBeMgclAJ6/blFYbhW7GemxcEYtCZi6ZOPr
         m0SCZe9ceMJMswMxqfBOOS535FomgcJPMFP8tLldfPNwIVPvA5YjiTxPrAmRHe508Crr
         QkFXegQCiG1ZUxO/X+cn321nYX6ZhP1MdUwMIIPrmZg3rxsmLSAAJ8+zU+o8sIZR4qbf
         nY48U5NTG7w5fS5x1qLXrKdq1SjdcXJHLbIB+Ka1vxqgpbK11I37CnHzt2cWvTDTyjp/
         8D/w==
X-Forwarded-Encrypted: i=1; AJvYcCUL+NgOSIyQUA7tWKHBLIzh2btMkq08cYzd40YO2nJs2JVkw7phobhFtAB6nwvPqdgV1WNRxVrVDKRKl7jx@vger.kernel.org
X-Gm-Message-State: AOJu0YxQGDeJ5jfONtSRAqxbvPeTThNsyo36aW5/ng4vCr1PMd0S4qBb
	wJnNtO/72upgZLV8eTd/cL53wNO36ADVCcTn6EkjnB53vkKYIW3Uow4AmDAFVu1Z/WU=
X-Gm-Gg: ATEYQzwtUB0kCXN6V3G6lbHv7Anr+OYRs8wAUsSyf2dmiZV9qvNFv6y/sJJKW5fyk89
	2u33ABOMLazG/yJbxjF96FmobQwCJPU6HkhsklFuApXCZdVl3rLE272jMuWgaABZgGxk6wRZRA1
	8b/FKJswGyncMA5oycy3+ulaN80O2YjkrHfXRpU1RZbY51YheX8nzvF6k5knOMNOF9YjlbBI8Py
	w08YJjKHUzFzPzjk8VK3ZlzGJbE9lTrwtHGvFiQvq4H79u8dnVLqxE1V4p8nnPcBCzOeu5HEqCL
	ETegze0oTD4EPVGVuOpxczcg5LeglGBtb8jLMNW8mrmNQX9b4U3nnzuz4vc7ak28wMGFd484njC
	LgXgpRBK8RtNcnWXCZHUBTnq930vj9K4hbspwQgUPOuJ1NKsrRmgkQCGsSSeOn6hwLUoyN9SlqG
	/rTBVatmeWxXk3ICAWR++PlY8O6LVqrTcdtdy64alAuX2EVPJCLiPvF6sPFhUwZJtx
X-Received: by 2002:a05:600c:8106:b0:483:afbb:a064 with SMTP id 5b1f17b1804b1-483c9bb7b7emr255369825e9.1.1772531742805;
        Tue, 03 Mar 2026 01:55:42 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485125ba6bdsm14310115e9.0.2026.03.03.01.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:55:42 -0800 (PST)
Message-ID: <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
Date: Tue, 3 Mar 2026 09:55:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3DB1C1EC393
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95086-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[david.ixit.cz:query timed out];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> These values should improve C-PHY behaviour. Should match most recent
> Qualcomm code.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 5482fb5163e17..c612192ee727a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -225,9 +225,9 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>   /* 3 entries: 3 lanes (C-PHY) */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> -	{0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> @@ -245,9 +245,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>   	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>   
> -	{0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> @@ -265,9 +265,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>   	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>   
> -	{0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> 

Squash down and Co-developed-by

---
bod

