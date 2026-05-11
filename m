Return-Path: <linux-arm-msm+bounces-106909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKr/GmbAAWrKjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:41:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B913D50CF4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5E4C305A5E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBA8374178;
	Mon, 11 May 2026 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6xxq2N0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41A372B4B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499285; cv=none; b=eISytCHZ/nElSOWkTUie0bIhMd2k4R4nTadJwG/E8VIMgr5qwG19KoRAhzU/3P21p4rdiusbvqra2DSNWIO8+TWBtEdQ4CEndQC9gOFBLOqhK6l02VRTZ4+x9mK11RCwb9O57SJmeu4H8RCHH9N9NsCps83t/9GcN5IUKQchZR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499285; c=relaxed/simple;
	bh=u/rO97GV6xIVvGPFxWf9uNLpL6SfF9y57ZKNbS3WREw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMRcgLbc/UGVNG8rLG5wgXb/wnocqmFa0X7+I/YkcGRiAJHZVUQB1+GaZLgw30vylafuIjDMBSgjRivjJTCF7xA8xtbcaINuptn5FCoFmHppnvrjm+kjWNldHKj0c4bsywqxC1LlcWIgiQhuKdVrjEqMG8aV4E87rMLmVLa38iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6xxq2N0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F697C4AF0B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499285;
	bh=u/rO97GV6xIVvGPFxWf9uNLpL6SfF9y57ZKNbS3WREw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=P6xxq2N0GnxCNtkGfWuYp230OmxpZmt7XAGGhj4uZW7P7rvyk98AFcw87AYqJ49KI
	 X3zD1PuIEPrEuKmbXetuRoKiz5AwcgvB2NiMmCz9oAuPvmvwuKpa3TcaMq4qpUFCLh
	 7iZ3rsb0YmlC4HQKKNKzWfZC1V+UdfVMkSV2doH3nDdLCvjSlBDuPRkKj4YWz5INDc
	 PNevJbqrtF04ZIJeBlCYGw3wlFhxDXzKdngF4wtOe+Tgh4H3iCCa8LO5NHTjUwUp3d
	 t7HiLRLJnuHqfyM2UXOaNF24HDbVBRsHS17JnL5ghN5nlxs1FfDK/zH/40dD0dhtBh
	 aCzyccJ1BMLBQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a884815606so4130788e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9gp0Opvv93BcperOUdWmFz5dlxtIeTFlvrN/nj97uHJBjvSL6KSqybWsxjMDf/nBurqdQ+8Vg+ieNe+q3i@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+thi85QmTyxiGfnN+7gTFLm+8XYhTJcsC4kG8UoqiK9QSGYdf
	BZNY49hlmlyE17wSRbjS00KRno7aI+eoVOukmpxR3ut4U1XyRV8v+g/BK6wvBj7s11AP8CP+scI
	aJkFaI44czziL7q75nGqRVRhbLdQ/zeem1ylFBPYkag==
X-Received: by 2002:a05:6512:1595:b0:5a8:9988:f1cf with SMTP id
 2adb3069b0e04-5a89988f332mr7709402e87.31.1778499284173; Mon, 11 May 2026
 04:34:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:34:42 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:34:42 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507-pwrseq-m2-bt-v2-7-1740bd478539@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com> <20260507-pwrseq-m2-bt-v2-7-1740bd478539@oss.qualcomm.com>
Date: Mon, 11 May 2026 04:34:42 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me7=Mf4U1macJUzhDAwUcXjqSu6K3joACTECnpEoVFNjg@mail.gmail.com>
X-Gm-Features: AVHnY4KQwXOFJbCj0Fv2Swf6-OmzR6j41Xy0gf4jeamGfJl8dk0MuxJXia1DERg
Message-ID: <CAMRc=Me7=Mf4U1macJUzhDAwUcXjqSu6K3joACTECnpEoVFNjg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Shuai Zhang <quic_shuaz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: B913D50CF4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106909-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,intel.com,holtmann.org,gmail.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,manivannan.sadhasivam.oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 7 May 2026 18:06:15 +0200, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> 'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
> GPIO in devicetree. But the naming causes confusion with the new pwrctrl
> framework.
>
> So rename it to 'bt_en_available' to make it clear and explicit.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

