Return-Path: <linux-arm-msm+bounces-110740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLqcNvuMHmr0kgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:57:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E14629FE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01632304002A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9553B6BE6;
	Tue,  2 Jun 2026 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dyapn0O2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2648D372060
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386843; cv=none; b=XEZ2xlpMP430mOWWvDH0wFuMt22dVXY3zBXcFpqBA2fcTpvp3F6v1fw5D8dJkpCEIm9tE169s1FCMjxXrEUx8UT4TNh++/veK4IpUtIFOFcTjgs19HCY1DtmkQRGcZXWhe6i1WbSnGZIhCxZO1NvjcmNjvUt4nGzi7Ucw3mZdQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386843; c=relaxed/simple;
	bh=/ChsxAwgsClBDNPIth6BezLESO98dSLBlGagkpxSxxU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgBMrPpAMSTfN6EEtS5a32enFa/mKhO9yurl+jF2uDGVz7YbSkasCZ7Rkbah6EZEvuf0aSb1rp5PHLGR9i3EMp1pQrc1kkDWZk36i3hks/AaG1Bv7b7bWMEnUgYa7dLjlls2f5k3xaMLXL8A/mabFVuJytCj+7b0+O+NGJ2z9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dyapn0O2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5CE1F00A03
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780386842;
	bh=/ChsxAwgsClBDNPIth6BezLESO98dSLBlGagkpxSxxU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Dyapn0O2OMqBtsJd749GXG4Itso3bVEJ0UuLAldfzitg6E5KD6l9KkkbMLIyHoR82
	 9BIujm/PBxQGIkRHKW5gq6R0NeHN5nZhaLFpA0TFUzkZQzxbllUZlSqGF/x3BwIvsa
	 0phFrr8of4eJBR0RO2t4AiJdV6uLdpaWPmfe7MSDMzQjGRxpFv4PJd5c0VsVlwYSU7
	 fGVZgx5dlIURn4oOaTuoP+oOMpzuQA4vk8Tuo6VDvZABed63FZic13OY88iwMqwNfg
	 g+S+Ir/SmIGIqdsQgbJQRq5Stet4ehoNuv8+ajC8sfuu+SGXNphB3noGs5O88DWykg
	 CkjgU25L30zuA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39666ac91a2so25176231fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:54:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YyIBSyAVrN9GluCFxnt6pIGzKGi8sogMkzW8bqYdpMNQN7lucR3
	kLmFzgeCajAsxH9Sts0Bl7op78k5GX8qUJ/3+BnQemaVko0c/ngMRWt3CsLYxmdVmGMJC5JQ3VR
	M7iHekRD2JTlV8h3yTrXKuk/n/Fe04lnPUlb9qt52Xw==
X-Received: by 2002:a05:651c:2357:20b0:38e:94c6:b706 with SMTP id
 38308e7fff4ca-3969b958f28mr5892121fa.7.1780386840351; Tue, 02 Jun 2026
 00:54:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:53:58 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:53:58 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 07:53:58 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdmjW60qnyaFMYjGHVLaxxqVH2ZyRUV3YObOVXSw6V3Dw@mail.gmail.com>
X-Gm-Features: AVHnY4L1ltQa8oqTnx4DLvt4170BIuS_6mAm3-M2qQKtchkaVsjqTQPH2N9Sz0g
Message-ID: <CAMRc=MdmjW60qnyaFMYjGHVLaxxqVH2ZyRUV3YObOVXSw6V3Dw@mail.gmail.com>
Subject: Re: [PATCH 2/7] wifi: ath11k: enable support for WCN6851
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110740-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,bgdev.pl,kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97E14629FE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 1 Jun 2026 11:46:50 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> The WCN6851, found e.g. on SM8350 platforms, is an earlier version of
> WCN6855 platform. It identifies itself as hw1.1. Copy WCN6855 hw 2.0
> configuration to support hw1.1 version.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

