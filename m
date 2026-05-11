Return-Path: <linux-arm-msm+bounces-106908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC0BCZK/AWrKjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:37:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B250CE35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9125B3073D2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EA9372B4B;
	Mon, 11 May 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHm5gWAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F861370D69
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499258; cv=none; b=UPubb/fsGsjgqE/XDxsxSq0QH88KNaJq0TpuY6KIipTH0ex8sIxe1hSpBrmzdTYRkrut3suMbmVLJvEAZ2nu5O3g+RW4KE7slscUKHL9NK7N7ukE8Qs0zaXGyb1xbC6UJp4XViBMizi4hkFeg4uOCXASknQ3sUqp37Uf+u742KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499258; c=relaxed/simple;
	bh=h1T+iTpfKYzeu/41wI2x47MVUVgmS5QYj1N27EmVJ2M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOyS1wZBAz3pG45t/jtwe5cO3/s7QEcsqCGXDmE2Mo0AhUffHY2U96v2YEHGAVBLYOjWLDzgn6qn4qVaeg/iFEQgDkhsmlt7VY5HLWh+uBzE7JXimNPWyAAN0orrMMDulGoIs1gZ5mGH8N5QqkoZrXKqXiYUSP5JBpln4ecZuxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHm5gWAV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F76DC4AF0C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499258;
	bh=h1T+iTpfKYzeu/41wI2x47MVUVgmS5QYj1N27EmVJ2M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=WHm5gWAVCpHW95+kfauTw8F8Mxkdne+4wgo/o8Z74m8hRsjiDQIxoIA9RGJ5AJcy4
	 BAb6bDk4VDWqsqfyNHqdey4RFBmF3lOUgh0aTWCgZXlR9p27rPDSYEJbGfrz/kBmB8
	 DIw/7sTyr7YpvgBUPAWqSvcjXzfuyu1j/58Mjc/mPf4lygRn1aXr/20HWuoCpIqTJo
	 DtEYS89TB+9X2Q05EiWQNBUCF7fjvZokb/Ul0Lc06KCwWBVI1NIIlALl4fTl6ltO5K
	 UR8g0AknRp9XI7LeEwPgtgAyGvwEI5bng7u9rOqkjgBsiFCnBIWj3O1NhEWySe6v4U
	 +MhS1+erpriig==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-393d6025f99so36243561fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:34:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8lzMdEr5HMaiS7GH7CGRjkKesZt2MjOgghJqz1InizPK6cXKwAeUXzN56eEhyg13Dm/2qVMh5eokbYMnDx@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwrEJK8QlEMq4xsBzbBb1OzGRyDaD1Sx5WTq2bZ5LEu/VQks1
	16gSSIsJVt+XyUGkjgEwD13jnAAqHjlptcO+7mQLONiExelrBzY4GLSuFeqqeAznOzXJLufjBSm
	RCSD8C/+nYDoa9WaVYc1suIxJiFV5j+o0YQ9zi+W8GQ==
X-Received: by 2002:a05:651c:881:b0:38a:2a56:9546 with SMTP id
 38308e7fff4ca-393db0ec0e7mr51883851fa.13.1778499256816; Mon, 11 May 2026
 04:34:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:34:14 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:34:14 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507-pwrseq-m2-bt-v2-8-1740bd478539@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com> <20260507-pwrseq-m2-bt-v2-8-1740bd478539@oss.qualcomm.com>
Date: Mon, 11 May 2026 04:34:14 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me=Vc7-fH60k37X=CmZF0p9pq1=LuPB8guYAG2bE5+nJA@mail.gmail.com>
X-Gm-Features: AVHnY4KvDZonEFsAY3V4FXK5oGMr-0fSg8j1UEekWmAJz-f9zkiDXym_hc0bJAY
Message-ID: <CAMRc=Me=Vc7-fH60k37X=CmZF0p9pq1=LuPB8guYAG2bE5+nJA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] power: sequencing: Add an API to return the pwrseq
 device's 'dev' pointer
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Shuai Zhang <quic_shuaz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 994B250CE35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106908-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,intel.com,holtmann.org,gmail.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 7 May 2026 18:06:16 +0200, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> The consumer drivers can make use of the pwrseq device's 'dev' pointer to
> query the pwrseq provider's DT node to check for existence of specific
> properties.
>
> Hence, add an API to return the pwrseq device's 'dev' pointer to consumers.
>
> Note that since pwrseq_get() would've increased the pwrseq refcount, there
> is no need to increase the refcount in this API again.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Thanks, I like this approach much more.

Bart

