Return-Path: <linux-arm-msm+bounces-94788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLsKH15FpWkg7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:07:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9371D4695
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4922301227A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526213093D3;
	Mon,  2 Mar 2026 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f265tYXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5C25CC74;
	Mon,  2 Mar 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772438872; cv=none; b=ZbqApqCzv6PpdMSI+5hVdg7ZpTFdJ0KcrWNNCkFpd9APrbbVn21ohsPj3PTm4Pbo6pqwY6Td5mqIvOUaCKF69hK8g+JBBMcR0fN4bM4QpwZ8yeFF2IWezPAsOWicfH/l0ButSDEPa08h/Smtb0VDINJWXWy4DG25QmR0xfBRqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772438872; c=relaxed/simple;
	bh=65OL+UbZCPewWQrLAd9t4ijSWo7rOXix30szLQxZzoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1Wzklv5qj0ErF+jsY5bys3l+AMopVmfBsg/w4rMFqQYsMMoF/YxUXjkOtGFPuftuYF0bpxZh9zeHZk68J3bE1Vz9LdpwmUVRaeoVliHZXaV7q5qQiCRnVEhE9rMwtMMBUJ+Yo/UIc5WuuBWd0E27qlahBqODut3Ckgpp/uG/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f265tYXK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1661C19423;
	Mon,  2 Mar 2026 08:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772438871;
	bh=65OL+UbZCPewWQrLAd9t4ijSWo7rOXix30szLQxZzoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f265tYXK2uhqW1tsBNJANRpZgw7EjVRFcLF84b1UZDYM2Dt2xvA5xS4JSCgz4o+xb
	 GeYS5tpjNI0845wu+qbpo9KU4dHkiRuUE6aYbPN+whhx5a9aRmr5vySqSDvl7G1k7P
	 dHPgLMn8m2N4c3eeR6MqrhBYpBsDIXkJjlooH3+ZzxM1Hv7YZGaHopj9TPAOc3COya
	 +5cKaD3OSGSIydmR+qqP47BGJeJ+FoGf1o6PFPScG9r8FlGv57Gez0VeFr4oVsQESl
	 w1lxxIpbAN1cHGUM2I0iS+mfD9WoTE/CG1SYCOEd4IICbLk/Q/Ws1XF3Y6lOik2CH9
	 jmszF3PeFUa8A==
Date: Mon, 2 Mar 2026 13:37:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Switch to async power up to
 avoid boot delays
Message-ID: <vnqrsrglpmzizk2vtee3aohuwop5wynd463bkq6kknq4ploiox@frv5z5yk3kha>
References: <20260122-mhi_async_probe-v1-1-b5cb2a3629d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122-mhi_async_probe-v1-1-b5cb2a3629d0@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94788-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD9371D4695
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:53:48AM -0800, Qiang Yu wrote:
> Some modem devices can take significant time (up to 20 secs for sdx75) to
> enter mission mode during initialization. Currently, mhi_sync_power_up()
> waits for this entire process to complete, blocking other driver probes
> and delaying system boot.
> 
> Switch to mhi_async_power_up() so probe can return immediately while MHI
> initialization continues in the background. This eliminates lengthy boot
> delays and allows other drivers to probe in parallel, improving overall
> system boot performance.
> 

This part is fine.

> Add pm_runtime_forbid() in remove path to prevent device suspend during
> driver reinstallation. This issue is specific to async power up: with
> sync power up, pm_runtime_put_noidle() is called after mission mode is
> reached because mhi_sync_power_up() waits for mission mode event. With
> async power up, pm_runtime_put_noidle() is called immediately while power
> up process continues in background, which can cause the device to
> suspend and mhi init fail if pm_runtime_allow() from a previous probe
> is still active.
> 

pm_runtime_forbid() should be called at the start of the remove() callback to
prevent the device from auto suspending during cleanup and to fix the issue you
described above.

So do in a separate patch and add a Fixes tag pointing to the commit that added
the Runtime PM support.

- Mani

> Fixes: 5571519009d0 ("bus: mhi: host: pci_generic: Add SDX75 based modem support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 0884a384b77fc3f56fa62a12351933132ffc9293..fc0952e46ae5e4854c7165ed60b850729843d458 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1393,7 +1393,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto err_unregister;
>  	}
>  
> -	err = mhi_sync_power_up(mhi_cntrl);
> +	err = mhi_async_power_up(mhi_cntrl);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to power up MHI controller\n");
>  		goto err_unprepare;
> @@ -1447,6 +1447,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  		mhi_soc_reset(mhi_cntrl);
>  
>  	mhi_unregister_controller(mhi_cntrl);
> +	pm_runtime_forbid(&pdev->dev);
>  }
>  
>  static void mhi_pci_shutdown(struct pci_dev *pdev)
> 
> ---
> base-commit: 91a0b0dce350766675961892ba4431363c4e29f7
> change-id: 20260113-mhi_async_probe-a7b0867b6e2e
> 
> Best regards,
> -- 
> Qiang Yu <qiang.yu@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

