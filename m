Return-Path: <linux-arm-msm+bounces-103741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBAIJ8oK5mmmqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:15:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04458429D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7C503028033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7420F38BF78;
	Mon, 20 Apr 2026 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IBn20ZWW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732432E6BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776683668; cv=none; b=RXFvlguYGPKGkJ3T/MKmgBHZldWy2Sx8g4ZN2fPis4ikcVcEmAC6KaV18+CrA8C1KjFbsQFjPzqj0W9DB8/TGxtokLJibHGTKKzGw2W0nqKEyrbUlBTGC4VqYKGPOJ7iqyKwBFJt+xnZKPrR6OOl5W+5kZ09UVYdLIGAUdSMlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776683668; c=relaxed/simple;
	bh=oo6sD9eeKJmgF8y+Mv9/ziuyg8LqE/RcnPFXODHSQBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=mm+/8xxmNiXhGyWTnAPyQvw1+XXvU34SZsV+AryttGgWfi5ueI2DL7WSqU+DWhk37L+A/gTbiGac1lpnMGYGo+SfM2wX9ZyWL3mGc1Dpspx+8oZe5iitKo7YIRcHM8y4KRyesrqHiRods7/WScuIjKGRwaBCNhxLwukxwjzL7iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IBn20ZWW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891f625344so7046505e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776683664; x=1777288464; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dympeeiEyneZdFEwmKLL4dnrMWqI+ctP12odqcxsjA4=;
        b=IBn20ZWWmHujVbwaKsnlG6/fA6O6Z2q5Etxdiy0Rpua1Flfio5iuvHphA6Htwq45Ru
         s3mMLDbJzJitCNYGwhR3cCaaAbvB/WQVHdTXYCLx9Ml+1bXMjxqtxGNQ5GUGgh2cPEOt
         xWbSHmOvSqUrozSX3EIfXn1/Kjql5WN+xOBy+pyku4K/+NQjwg1Q+P5EfcFZYHDnpRgP
         093Q9FGcg5Ieo1vfOMYe13KsQZ+l+748XCsqGjAh7oX71k0klpCXcJNDTRHAcj6xVpKo
         JSTzSSLYe5WGW3+LEp0U6l0aG7rirexfpwixmMKCzWA4FtFNnMJOFXXYXH4foGTAh1DV
         JKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776683664; x=1777288464;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dympeeiEyneZdFEwmKLL4dnrMWqI+ctP12odqcxsjA4=;
        b=c9PMheiXXE6a5azA3K+bytZBxOkByMwpDO/mM2F4UX7mRoFEa3PmsusGaDV1f4CDPe
         8jilBRkH1/QntCWCCu4w96hNZtrVlWzlLk3Ff0j1HC+AaCKN35PQKKtnhS7bWuo2hPRB
         V6t1XaXUQIX15CAWMRs3EjAeo1E6BcGG1Cr0YZ4exTEO6TeaGARI2S8oATbQid79ry0U
         6YC8NSackmRn10pmCViqsRKPmzLZcrIUReEUhGrmXKcbqqcyqD9EozEHqlFHx/QhkBBU
         iHmXSu7rsBQMkdAXFZCJu0Om5TB3rmp2AXYtHTqNR04B5QgLImfoIREDHaSyxbQxK1JM
         EQmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ze4Jb5DyxG82d+43z8cF4Wtd1abqJb75+TzuPDtSkbuOViwNuXSq2kkT2xMSTpOfujoHze6Wz9aWvAJH1@vger.kernel.org
X-Gm-Message-State: AOJu0Yywu23TFBwNoqfHpORTxCTo1S63W7zfYGvweUKPNqSD2mvr366r
	zAqaEiqpE4ZfpBmHMwDN1Ce8iaPuJ1WGoulwB0eSr0gxWrP03Qt+uMQ1NxyfNgQAOuE=
X-Gm-Gg: AeBDies/DH+iOa4PXil32Ey6k2/ov5iqZOE4M/uM2P2K1ZjhpAl8dAMN7SxJ0TxaVqq
	c6ag/Q1LObYa9qfVJi1+PGy9gy+V1hjm0nLNYHpmElfQemxcHhs8x/86zE3PMwY3I4Hs+oXXjmb
	YtiV10NVJzLvoHrXvjNpiD/MLfza53oRPnzy9uKfw35JeegwFo2Kq/0vufvF6kqLFNd7nm7y+5E
	vu83TnNNLdXIcj+dPbXhHZGlbGbEXqORNOMdReKSiplJiyecpABhJZT1rafKmgaZf+e8uZ2nZvk
	spkESWJZlP6yUQwfsN73TAnIvutIcHp2Bi7zO287s+mV6xYp5iv4uPyaEOA2mJNaOlhJFr18yRT
	6LyILB0ZHtfTWp7T54bTo0Ty1RtC4cUou3SPsAV2LiOjpzwofy/WgD2k4K6vvg1XbKgwNB4THTk
	tseNirVtjfQ2zp11hSkzPId5dD+BHNp0si0e2h3LfXv7dLL2x6bEWhobimqp8UlG6ftfwIJxGtC
	IE4fQPPETuKztc0HVc=
X-Received: by 2002:a05:600c:34ca:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a07615b87mr18212465e9.8.1776683663648;
        Mon, 20 Apr 2026 04:14:23 -0700 (PDT)
Received: from localhost (84-115-213-130.cable.dynamic.surfer.at. [84.115.213.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489393ddd69sm10775525e9.10.2026.04.20.04.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 04:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 13:14:01 +0200
Message-Id: <DHXXSDE9V52E.33D6CI1LWMHFP@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Marcel Holtmann"
 <marcel@holtmann.org>, "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
 "Jeff Johnson" <jjohnson@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Balakrishna Godavarthi" <quic_bgodavar@quicinc.com>, "Matthias Kaehlcke"
 <mka@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the
 device via pwrseq
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
 <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
 <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>
In-Reply-To: <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103741-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,holtmann.org,quicinc.com,chromium.org,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04458429D3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat Apr 18, 2026 at 9:38 PM CEST, Dmitry Baryshkov wrote:
> On Thu, Apr 16, 2026 at 12:06:09PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Mon Jan 19, 2026 at 6:07 PM CET, Dmitry Baryshkov wrote:
>> > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreadi=
ng
>> > voltages over internal rails. Implement support for using powersequenc=
er
>> > for this family of ATH10k devices in addition to using regulators.
>> >
>> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> > ---
>> >  drivers/net/wireless/ath/ath10k/snoc.c | 53 +++++++++++++++++++++++++=
+++++++--
>> >  drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
>> >  2 files changed, 53 insertions(+), 3 deletions(-)
>> >
>> > +	ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
>> > +	if (IS_ERR(ar_snoc->pwrseq)) {
>> > +		ret =3D PTR_ERR(ar_snoc->pwrseq);
>> > +		ar_snoc->pwrseq =3D NULL;
>> > +		if (ret !=3D -EPROBE_DEFER)
>> > +			goto err_free_irq;
>>=20
>> I'm fairly sure this is now broken with CONFIG_POWER_SEQUENCING=3Dn sinc=
e
>> then pwrseq_get() is returning ERR_PTR(-ENOSYS) which is not handled
>> here.
>>=20
>> I'm observing my ath10k_snoc is now failing to probe "with error -38"
>> which definitely seems to be related, but I haven't debugged it further
>> yet.
>
> Posted https://patch.msgid.link/20260418-ath10k-snoc-pwrseq-v1-1-832594ba=
3294@oss.qualcomm.com

Thanks Dmitry!

