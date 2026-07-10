Return-Path: <linux-arm-msm+bounces-118216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9rLdAC/AUGoi4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:49:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C27393F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:49:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lucaweiss.eu header.s=s1 header.b=YqN5FLKc;
	dmarc=pass (policy=reject) header.from=lucaweiss.eu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118216-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118216-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAA0A300B45D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F303F9268;
	Fri, 10 Jul 2026 09:45:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774343BFE5B;
	Fri, 10 Jul 2026 09:45:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676750; cv=none; b=aVBTsstffRzFA5ylr9TD7xTD2VkU00GAt9S5UfL/Y+BEBGZ6/6BtMvm3X1od9w1/fmQ9E6H74Bfvju3tYQReSu3UsjQcooGoLDukjNgPE6g+IokPtCbjhGUwDRUUbrXPT7oFJujun3bzwWTrdKCFW3gVFiLtmD6K2TJ+pIrO2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676750; c=relaxed/simple;
	bh=NAm4LlfByIXXQH9ExlzovVqLorloy/qQmxpgOiHsEYc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XVG6xH5bXsc9L2S175SuEmowgp4EpJKctKGs4b4UU+Dsaam89fodaiJs8hoQ4Aq6myQwFzhoQtGwqCFBG2daOsF5MtWJPo0Jn2tehCk6BA0zP8XlYlb/B84DH0E+uPkLPPCEAwpec7zy5Gt2BJSPzAWmRezgGW/b75muGTtFVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=YqN5FLKc; arc=none smtp.client-ip=128.199.32.197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1783676433; bh=NAm4LlfByIXXQH9ExlzovVqLorloy/qQmxpgOiHsEYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YqN5FLKc+K8IONv9KFKhPQIq4rWrTMuNj0x0vDMmwlz/upKnh/OCBgs4f202APgc3
	 EEaPaoQPxuZcIHTYLOOiM42L1mcSoA2ADZNLM0nMhBoNBkug5cZZWv/b+z0gNNNYSR
	 OEfVzjAux9HeLZASyUCPGEsZEALxvbf2jKhMhSW0=
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 11:40:33 +0200
From: Luca Weiss <luca@lucaweiss.eu>
To: federico@izzo.pro
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: fix ngd register base address
In-Reply-To: <20260709-qcom-ngd-register-base-fix-v1-1-5f7ab48f9209@izzo.pro>
References: <20260709-qcom-ngd-register-base-fix-v1-1-5f7ab48f9209@izzo.pro>
Message-ID: <35a7f6d4da307dbd1eb2fffc255e0206@lucaweiss.eu>
X-Sender: luca@lucaweiss.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lucaweiss.eu,reject];
	R_DKIM_ALLOW(-0.20)[lucaweiss.eu:s=s1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:federico@izzo.pro,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luca@lucaweiss.eu,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lucaweiss.eu:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca@lucaweiss.eu,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 425C27393F5

Hi Federico,

On 2026-07-09 19:00, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> The slimbus controller register base was calculated using the
> controller ID and the register size, producing wrong results for ID > 
> 1.
> 
> The expression reduces to ngd->base = ctrl->base for controller with ID 
> = 1;
> but for ID > 1 the other factors produce a wrong base address.
> This bug caused a crash while trying to bring-up the secondary
> slimbus controller (ID = 3) on oneplus-enchilada with sdm845.
> 
> In practice, the correct base address for each slimbus controller can 
> be
> obtained from the device-tree, so there is no need for further
> calculations.
> 
> This was validated by reading the version register from the WCN3990 
> slim
> interface on oneplus-enchilada.
> 
> ---

Please remove the ---, otherwise your S-o-b will be dropped when 
applying the patch.

Also Fixes: ?

> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c 
> b/drivers/slimbus/qcom-ngd-ctrl.c
> index 80877e951849..91932f8d021b 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1547,8 +1547,7 @@ static int of_qcom_slim_ngd_register(struct 
> device *parent,
>  			kfree(ngd);
>  			return ret;
>  		}
> -		ngd->base = ctrl->base + ngd->id * data->offset +
> -					(ngd->id - 1) * data->size;
> +		ngd->base = ctrl->base + data->offset;
> 
>  		return 0;
>  	}
> 
> ---
> base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
> change-id: 20260709-qcom-ngd-register-base-fix-a59713a184b8
> 
> Best regards,
> --
> Federico Amedeo Izzo <federico@izzo.pro>

