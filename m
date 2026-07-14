Return-Path: <linux-arm-msm+bounces-119049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vxyLH2k+Vmpz2AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:49:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B0A755577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:49:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ispras.ru header.s=default header.b=l8UnPiJm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119049-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119049-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ispras.ru;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 179ED30E69A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BCA477E33;
	Tue, 14 Jul 2026 13:47:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C346AF39;
	Tue, 14 Jul 2026 13:47:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036852; cv=none; b=NLjb2fS0YqFqC0S+7w1IAzWjmv1HIouaDzKQH5PaJIqcy2ERR3Ur4KdTTZ8KWtfvvfHYzh106HtFrqGpw129Imj4j0o+QFpYO3TtexG1I+TFaewJVNfudLDGf3iA+YSJLvD3737zqr3aNS4YVC3P2EiGNJxs+Zt+fQSneukZXE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036852; c=relaxed/simple;
	bh=v2o9z94asl5iQQQd3utUGGpD+9CMIxAw45QWSytUF3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxpiQ3DPc7fEYHEk1Pc7jDIz6WOqd1GbC9v6AIUYbplC7VFYSMHHRpfk8UGuSSfUM6igmOVnyQqU4hxmVWqBnYyggHlki1w2yUJSaTi1Ym5gBcec/jbAIBwemkTJB5xSj9UZClHpOnDcFl/omg5PsKyppn4BCuF395kdOtXKpxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=l8UnPiJm; arc=none smtp.client-ip=83.149.199.84
Received: from localhost (unknown [95.24.32.156])
	by mail.ispras.ru (Postfix) with ESMTPSA id A899C4077925;
	Tue, 14 Jul 2026 13:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru A899C4077925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1784036844;
	bh=EAzOUwTIZxPLoFmQvs7pqHvvpdS36xjaII/OElsZQJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8UnPiJm9VfrOQV7wfrQYwiEBmuR836LAvT11z4ZCE+IWhIhMHPbUFtbgqeYyfxiX
	 X11uwK8UEW99zwsvmOsgUsBDtM2axL/d3RM8bG7+r8tJbI4ErXg1L9a5EYFnQamxRP
	 vcRYGzrkWbNr/aCBVYMBEPrORdh3+wxN5hNHWfTM=
Date: Tue, 14 Jul 2026 16:47:24 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>, 
	Vasiliy Kovalev <kovalev@altlinux.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, lvc-project@linuxtesting.org, 
	Casey Connolly <casey.connolly@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
Message-ID: <alY7G3egPqw1iaPR@fedora>
References: <20260713182500.GB22956@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713182500.GB22956@altlinux.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ispras.ru,none];
	R_DKIM_ALLOW(-0.20)[ispras.ru:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gremlin@altlinux.org,m:kovalev@altlinux.org,m:bryan.odonoghue@linaro.org,m:heikki.krogerus@linux.intel.com,m:lvc-project@linuxtesting.org,m:casey.connolly@linaro.org,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux@roeck-us.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119049-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pchelkin@ispras.ru,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pchelkin@ispras.ru,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[ispras.ru:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[altlinux.org:email,altlinux.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ispras.ru:from_mime,ispras.ru:dkim,fedora:mid,linuxtesting.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2B0A755577

On Mon, 13. Jul 21:25, Alexey V. Vissarionov wrote:
> When regmap_read() fails, the execution goes to done: label, where
> currsrc is passed to rp_sel_to_name() and used as an index after a
> proper check. However, to make this situation easier to notice, an
> explicit initialization of currsrc with obviously impossible value
> is suggested. Alas, we can't simply use zero value here because it
> means TYPEC_SRC_RP_SEL_80UA.
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org) using SVACE.
> 
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6bea4..d7cb69cf6044841b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>  	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>  	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>  	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
> +	unsigned int mode, misc;
>  	unsigned long flags;
>  	int ret;

'mode' and 'misc' should be initialized as well.  Though this all was
already covered with the patch [1], which got the review two weeks ago.
Note that it did initialize currsrc with zero value instead of 0xFF.

It's confusing a bit.  Maybe [1] should be respinned now with
currsrc = 0xFF or whatever?

+Cc Vasiliy

[1]: https://lore.kernel.org/all/20260630120114.185169-1-kovalev@altlinux.org/

