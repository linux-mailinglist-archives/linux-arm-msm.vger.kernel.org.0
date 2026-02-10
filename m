Return-Path: <linux-arm-msm+bounces-92363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHPnNjN+imnVLAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 01:39:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EB115B09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 01:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA898301AB95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 00:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FA123E350;
	Tue, 10 Feb 2026 00:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCSuMGfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF9823EA9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683952; cv=pass; b=NZknhlOu00zq9ML15/tHm6cdwoEaFH/2Fhhv/ctmFQuFrYEHbrK/AzsikKPmuOYhu2iCdLLKIHqB8fBqZNs/FPtmUuSXYiCVPAtpt6PNhzKlJk3XuNAUpGOLhviARwHSZiCO0l4ZjAVSj9yeDWUeq35bZigWIVnyRciUee17vXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683952; c=relaxed/simple;
	bh=CRHDCY+aNL8cCuJ5x1LKl4BcDxts38ZAFNhckqdTfRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fg8SOYv9Q1TjOTUynb/3FYBagk+IzG8IrcJh4PeZamNg2FMnhYKjJvB0sO2Ia/+ErDT3I0DcOYJ/VEXA7zNxjSVqqu8w8xwNwBPZKqKk1bvjxumLElsJJuHPpzNit+ABipRP6VGZkA9KXIcSZkMgbBiOAkMii1RVKMcbZJbsk9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCSuMGfE; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-662f5c5507cso3331166eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 16:39:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770683949; cv=none;
        d=google.com; s=arc-20240605;
        b=YSBKdydiS7PJalaqol0HPKKGNxmwWSqQfSw+3inKmmVP65vQstP8HZBgdudgSsj+ks
         KNeWn4PV5Wto/3ducfPtXFitGErBHWPudDudWH8P/99qNL5zLnegKZHZAIqgTmD3hYQd
         YHJ6IsJG/ZXRYUPDqGSUDrxQx92ye4aVUK2krOJ4S0bVd++azsrGrSSZ0/FJyQoeCCIE
         nmhZjgKKQWYQLBvkpgiKZbiZ+i5df4jGIPv0epnd3oDJEP5YEUyL6ZIUNv6OHJB7h/Wq
         e/cChIi1wtDSWH1JOQ9cLnL9q2i4oldloCZDbHfM9LWVMSLWVYGq6Hzy8RNP+9oDpxmp
         ZPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        fh=/x0GT8wGRKlAIPC3LZzYb7qg2AonI4GMDJ1Snr7JMUc=;
        b=iGfR+kSTP9gQ4EOiM+ZmkFmRuBPiABtfs/Y77ykxhD6xYeRHO8oUYEFAPAxMWKkE+w
         KzqjGVsnSmDXsiXtPAAcjU8sAJrqJE+4+iZii+HZ1200JHVDm3bckn5W7/P4zjmbVEPv
         wzfAsOT1Xq7Br7EHEg+mz8tn3DwzKzwISO0GKemTqRMngmpS14PLmfI9adGLd1RoyBX0
         rt0PZ6zBIBpJbKYS1OmYA3ElSbQggzQtQOQcxi10VeNDWB86Gitdp8ntwj9zXpe3yPbG
         nPEPNJZZuy2qdVQ/UH5KnMCYRbGQdDN0Qvn7+rLGj41bnSDTf02gSrDHe+HnKDIBU9+l
         VMbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770683949; x=1771288749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=GCSuMGfEPfzMl3he42tzkuKrehHOEwSPbWg9z90dF81Afyi3sPX6nHguyl9DXmTk4e
         6I4gIyihsEb7ZViL/AxrsB3qEzoyeA18VCG/n5Dy7EsyjJHpAxbKkbv5kouxorw9CtSY
         ErTcKZAIcy3Ck62Eg3V5O21E360Cg5+rXaqKmHKe3Ecv1aNdGvtcCfyNZzVJEEddoNDv
         JRtyUaMb9DMW2gKJjKDCu2T3OnxM4xcAEhRlVGVsVu+/IUJ3+AUuriZmgpVGoIg8stGp
         PfG5iXK6qZQFyuDRY7Qx0LItXki1cH4fE3AjOoiegYwEYQywG2RTCdmaOzOAFkzmXgzb
         Zlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683949; x=1771288749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=XjLpKyApEs+fqagmOygPFGRwfsrLsiAST3aEbzce4nriSFAsvdrfxX/Vv17PHbXES+
         oilfwmKb1B39bNdCwg9s30h+olwjCNp5t0mK1RX6myUWt1PF4xhog3XeBT2R17E2R+3m
         tEMqo1RU0eADcVrw7eCZXCriIllwnj/nt69mHX6mzvEOZLbzb9ko331uV/X4m/uM6uoC
         5TPrOOxKrhuF1UaH2W1ObUT5dLZfFW3WF9jZ/2sQbch4Z/T7lnL9xZsaOCy4Blzl+OuC
         msO99tjERgIQUCbMcGSmow1CGvbIZ2zZijhi8YEtrqJSvPO20aSzcB0nsCZ+xjG/OFwP
         a04g==
X-Forwarded-Encrypted: i=1; AJvYcCWqAAoOn8iEk3mwvUgDT3W8N/VsaYArxKaSfUCdEeF5PFpzU7gs/m++BWQ0RVPGpZM/myCY5aDLOZRLxTUN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyga7hGGp5e8tgfqeA1o/um8QeLlxSXglGowvtpXRaMNKJKPZV+
	fYFzBLzwLUhEbxvLXo0IpNAasAUjuY3PlNcMZ37+1nMVUF+ydMTyIlu+68IhzQxHpeTaSp5I8Ax
	1df3tb8/8QusMrUnjFC5n75urit/Snlk=
X-Gm-Gg: AZuq6aL7rDwbY/6pW8s7r5b63VTML0HRXdRj8jJ5GYF5dwxpvtKFKQgFuRLzM8Cm1lm
	nlS3z/u8X1FERkkz+7HYp6dqxmZUcavFJjuXFWUhcYk98n7RSAX9zCAofP7S9x4M5//bIHjTy3T
	1HMZ5HyMsDo9phTxoWuy6V+xn3BYyihByA9QnWCOVe+smZSoeYbzIIcKTet9sn+/Hb1o3DD4Yp0
	kIPmQ4xboIqKoSNFoKSNqohdZJKN1NqlzlZKflCGykOfMcwaA1vOXjj7jCE8giVpZV85/BpIm/O
	E8BHtb8B
X-Received: by 2002:a4a:e908:0:b0:65b:257b:a898 with SMTP id
 006d021491bc7-66d32fdac10mr3465078eaf.29.1770683949518; Mon, 09 Feb 2026
 16:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208040240.1971442-1-dianders@chromium.org> <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Feb 2026 18:38:58 -0600
X-Gm-Features: AZwV_QhZe5s2jbJJnfFS4JALRsv_5-7Jio6ijB129QGrcufx887IYcSq_3ToyAU
Message-ID: <CABb+yY2GbPcuPiVsE_-HCS8MbpBqvjgjDkoVLNSBDZq1bnfpEw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Frank.Li@nxp.com, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92363-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,vger.kernel.org,arm.com,gmail.com,lists.linux.dev,amd.com,nvidia.com,pengutronix.de,lists.infradead.org,linaro.org,ti.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 4A7EB115B09
X-Rspamd-Action: no action

Hi Douglas,

On Sat, Feb 7, 2026 at 10:04=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mailbox messages are deprecated\n");
>
Nit: maybe  "NULL mailbox messages are deprecated, use
mbox_ring_doorbell instead" ?

Thanks,
Jassi

