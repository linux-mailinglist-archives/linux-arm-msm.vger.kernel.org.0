Return-Path: <linux-arm-msm+bounces-112093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vbOZGMTiJ2oq4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:54:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B020E65E930
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:54:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mtgAWlmg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112093-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112093-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4078301A720
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E14C3B14CC;
	Tue,  9 Jun 2026 09:39:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166AB37E2E5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:39:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997981; cv=none; b=FP2jGd3WJWJfC7lXKtZckVeMiOqMXSc0YXE2iEV7qmV4/kOhOB3XCmXfsMNFB+Bpr3IjuquTxzYx1vFf0lQUhkxiEhU838mub9VwlL0y3E5hkeGf0z09LfTzj0iuID8qRImh+2S9NyLUwjwLfflGoL6kWz+kv5R+Y9u6mG240n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997981; c=relaxed/simple;
	bh=kdz9D3H7e3YdUaV/C+RsLrjdqWIeMQvB7ZDx7+iPsUY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+Y76JWUHKgzhaGTB+uA2IFlEEXpB2s7I+p7kSXr0Ehg227hIcXMdoDOmMkz97K5JwLR0Z/eyJBBDL6D3wOrI/+Da2JBDtbEgt9HnVrLv1XxM8RSktHZdbsnfDqImAwJl2tAUSxvIkCqvwwft/kYpl4fyZ5+6NG7F4v1KV7bmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtgAWlmg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44F31F0089F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780997979;
	bh=rATEdl6LiQR60SP/nV4ENkMWz6HgzyeezathKrPkQ1s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mtgAWlmgPDZcpdDtD4lieFSsG4btlrbSaVZh70DFUHsg2URdIZ2UbGzG7ihnlqQRv
	 rVN+KihVq5Rw46+fP6/cyhnIbTfh16IRHQ+MPEQnsPM41+UTKk8MIbwN1FE+iAYgEm
	 XP0Kve6dvFjIMlLG+IuQSNcjHZpwSGj7csc7H43Eb0aMUM+VlKpgaeY+VFJk5S8ZS9
	 YtnHI8Y+xXAbjq55iwc+Dq0J2utnCIWxyqrK1D/4ZPBecFShzCUSpXI8/4y7C7W+4z
	 D7VW02nOUGk7OhEKbAtMHgJaSh6XiFEfI23ibe6myXQTkNtmZDnzS6GI9FK2Tmk658
	 TsrCRZ+YtCWew==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so4923307e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:39:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/M+CbgTS5vTdyiIeuqIUgCIJQQwC+XucX4KQwYZ2LmRudeL0D/ND+51nbir1aKvnjiA8nPaSWB9CM27F3e@vger.kernel.org
X-Gm-Message-State: AOJu0YxHx/JYqMXuF8YMXBOibPDrb228OFHyrFZ5wW/GmnxyF8a2mZp2
	f5FRmg0Dv8Jf4R+CCfKCW2a0pMsJfiR0YHckQBccfvIIZBW6PZb0t3n1F2dAdVanZMZfHD24QLF
	2JdiJKQuEW2TaejdIC9r8ucBj6+IbdEPuhFp5bqqDYQ==
X-Received: by 2002:ac2:51d3:0:b0:5aa:6db6:530 with SMTP id
 2adb3069b0e04-5aa87b91e94mr5254399e87.39.1780997978417; Tue, 09 Jun 2026
 02:39:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 05:39:37 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 05:39:37 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 05:39:37 -0400
X-Gmail-Original-Message-ID: <CAMRc=Met_U-1gDmGFM9hSWFc5vvs4SuRQOa3hZcfUo190rh59w@mail.gmail.com>
X-Gm-Features: AVVi8CdoucG7gnwn5riE2gVBy_jdERgKCr_gvLA0oc9UySp4KG6r88TvBMADcr8
Message-ID: <CAMRc=Met_U-1gDmGFM9hSWFc5vvs4SuRQOa3hZcfUo190rh59w@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: qca: Add BT FW build version log
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112093-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xiuzhuo.shang@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B020E65E930

On Tue, 9 Jun 2026 09:54:17 +0200, Xiuzhuo Shang
<xiuzhuo.shang@oss.qualcomm.com> said:
> Printf BT FW build version log after BT FW downloaded.
>
> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index dda76365726f..04ebe290bc78 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -143,6 +143,8 @@ static int qca_read_fw_build_info(struct hci_dev *hdev)
>
>  	hci_set_fw_info(hdev, "%s", build_label);
>
> +	bt_dev_info(hdev, "QCA FW build version: %s", build_label);
> +
>  	kfree(build_label);
>  out:
>  	kfree_skb(skb);
> --
> 2.43.0
>
>

This string can be read from debugfs, do we need an additional message in the
kernel log?

Bart

