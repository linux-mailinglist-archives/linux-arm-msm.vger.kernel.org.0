Return-Path: <linux-arm-msm+bounces-90817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Kt/IGzpeGmHtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:35:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A91B297D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBF9330D9E3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705D5347BD9;
	Tue, 27 Jan 2026 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diMHNReV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01998307AE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528893; cv=pass; b=L21jneiq9oodvgFyt7h8JDTRkOMeX5SbLKHgVHs9Z27Jq+4lW7SgCtcDmkpKtdOIHQCoAEjdP9fLWahL3jumvStZpF+TGZ+tvZcnyTHnN3XNcFHJ0mi1Ow3MM4SkbYjMATCGulT/+epEkJ/UknNtpM3nq9DiwAJH3kZ+OTTrg2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528893; c=relaxed/simple;
	bh=nVt2gpgOgR3RCi0POinUFabXj+xMkIeCmSXkJ3L0QYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOPUwpM5xhMWwe8m994HJ2mIwBfR87rm6H+y2hSuij2vayrzJF5ELe+82qw8rWk20cLkl9rBU1dpPEXD0Ehj+/STFNc6A8zS0tr1pa82YLRretpgo4qAFNffbM4EGlofkq7JD1lJV2NMT3QmV8mte9yo+dCcPLpYxmifBufEI+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diMHNReV; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79456d5dda4so26939537b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769528891; cv=none;
        d=google.com; s=arc-20240605;
        b=LbIe7IdbY56oAsMMw/h0lnJz/S4MlYByF/pGmp7bsULkdn8+cP139NoxHvnEFtqZ1g
         eJCesW+wMoyL8KqwYRRmkr1ADuU3QUV1v1ix6opjGckdLVIW4oggry6IhwsKbS7IOVhR
         8VCXo9hMIbzEpI7wcuyaVI8NZNeYCRspukuIJ9BQSauS+viCUR2ICHozX4o6laTx+Ymy
         Z3Ek6bUxMu8AxgCqCYb5VQtrELmHJ7fs2uEeTwWv9JHfJnkIyG2RZ4J7pIkGeUmHa7TB
         YHKb++JLJmAdvQdI3kLvMTDIEJDsgCmy0uMh5y3bW3+VzgGt/ZuDga2oyPJ57bytibIg
         Au7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VDiCGgmRF+wYc1VBBOMRuOPdjAE6txRYcyUQ+FEe7Lk=;
        fh=uzpiKl6PRmesfusH05wg7yAUguG/75gDAQ3yguQEemk=;
        b=Bq1LHGYIQ3CaUfUFpq+fdha8DsdUHnQDrWfU/tNQtQjJEJzpiyG29moS1AZGLnfg9d
         h8NXVbreifBRMGsUfLmSASRN8oiw/IlKfI2ofWTGZZWscK+bGVAhWEhJWc/9p7btzDtm
         0GfO2vQgYs8KhyCSr70ZeJkxULqAI1cDL1eLu2MYoJHWSqGE/kVQjUr29hGS3P/9kS9S
         DZRU889KrI/OV+PBcEgcUKYdDhjZnpNKI4/BSyJcW0POyMy7StD6gooT1BjWeX3638pw
         //o0DrWuP7D3Ly+JrIq1eOYzg5oiTkoDwCvVv/6GnXlSIuPwLCYRd/Bni6NpyppPbky+
         IHJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769528891; x=1770133691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDiCGgmRF+wYc1VBBOMRuOPdjAE6txRYcyUQ+FEe7Lk=;
        b=diMHNReVa/VWBkFOQ3MWuH5CoC1rA5FjsWpRdLsAXIzJXgU27Tp1KoWA/gK3bFYYDK
         u7l2mIva13/PHTtN3ClqYuDLMX/ZuwkDP+UMlq7Mnnp/+J6sXsPpjsSyotf06fgL4D5c
         KasjVY/IsoiAGZluz9KDDXbmP8r6VYCOscJ2W4/walSQRzYzZk4Ep+P981VW6yJ97vK3
         7akdnoq+7tN7X2mWAns8A18zrmt6NWiEN7u/LD3LsrFanyxNc8QnTLf6oADh0Qu6eE/i
         gNha9vtx9y7wejCVnsp6Yl1xEcJVcqRd+6hxwyyc2FbGD8PJc3jvGofVphvEl3nx0CR5
         4/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528891; x=1770133691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VDiCGgmRF+wYc1VBBOMRuOPdjAE6txRYcyUQ+FEe7Lk=;
        b=bOoXhrYnf/XK/67COFUtsu0FfmxE7Ix0711UuVo3gyTqfmzIv/pGBOM6p7y99Yy+wK
         UWsJyp1XxWs5lUN0U9mjikbbzwXKOdQbzVSyAgEgOX96q1qasUuaezHT9XS2VFuc3J2S
         ghAFT3nTmuvmxsB5PyfHApM++awTlG04ULhRMivFkDPACaE3GGDR3o/sGTMsrHjxlrr+
         Tde3IaLSwo7LfprBLVoGBOSuxZPHCNHf1jFTkpN3HwL8yp/w6NnBbBt0GeJC5cUM57md
         oOIVH7PMjVFdQZ25d4gMrpNPUbsLwBkjjAYJWtd22HnEE3NNzVFAsZPcuTHhRiH9Qq8M
         GN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbkg3CHQE31MQSgjBxmbK3iFsKJkTucVzn9cNWwnweAbtioGvSOsnysbkzs7kTDuz3ZJqjsVmaDcFnQnXK@vger.kernel.org
X-Gm-Message-State: AOJu0YynK8tutUc8iaSV3TgHomt56gHFXb+qQbiFIv0oAI18xQOmXddj
	J7HxyzlJX8XkyTjbduVQNy8CNc1NrgRyvEXfNiq4J5C6fXwMuEdD3qjfHu466q+o3rvNuy9BX4H
	Jsx16D5bHp8S7MEWTDeZlOQNGp0yiJi0=
X-Gm-Gg: AZuq6aLiMoBzOYrqM4VzSE555gJTDk/sX1nPUaBySrH1HrUrr2S2c5rCayrW1lxbdnz
	NTWH06JIkgE6ozH+TLzvR5v+rPu48CWDmN+FJLZN9HbKEzFIiENUWEZTmzQnZqjnLBphZN4nWpA
	qohjgCPaBDc1dE5YZjJQWaH93Hjyb6KUBCKMKHAT02f0onavP2vAmfxFo38AYsT7UnVymMhzeTb
	7H5Q0I/KjiceUL2WeiyM/PbDYONuSEOxVQtyBIAdMw8Ej+8vr3TQTz2obuwElWSY1skBKKWB/j2
	WZ7e/67oO+y5qNqC7s4A63RNo0jLf9N6FKudSzLezTb9L4V49doApPVHnUL6OdNZNw==
X-Received: by 2002:a05:690c:8a46:b0:794:7131:3dc2 with SMTP id
 00721157ae682-7947ac02fbcmr26583017b3.36.1769528890973; Tue, 27 Jan 2026
 07:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com> <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
 <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com> <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
In-Reply-To: <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 27 Jan 2026 10:47:59 -0500
X-Gm-Features: AZwV_QguijB4i8whAVQxuCkNKrCCN6j01DXElsjD4VsotRtlUe-77VXI2_Mz2lI
Message-ID: <CABBYNZL-J3-kcrN-B_1yXci+nw8zjgiiD_YFH0i4xeRNvY_Jrw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mengshi Wu <mengshi.wu@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuai.zhang@oss.qualcomm.com, cheng.jiang@oss.qualcomm.com, 
	chezhou@qti.qualcomm.com, wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90817-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A91B297D5C
X-Rspamd-Action: no action

Hi,

On Tue, Jan 27, 2026 at 10:06=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jan 27, 2026 at 10:32:58AM +0800, Mengshi Wu wrote:
> >
> >
> > On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
> > > On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
> > >> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
> > >> data structures to enable Hands-Free Profile (HFP) hardware
> > >> offload support on these Qualcomm Bluetooth chipsets.
> > >>
> > >> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> > >> ---
> > >>  drivers/bluetooth/hci_qca.c | 3 ++-
> > >>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>
> > >
> > > Any other chips which would benefit from this flag? If you are settin=
g
> > > it for WCN6855, I'd assume that it also applies to WCN7850. Should it=
 be
> > > set for WCN6750?
> > >
> >
> > Thanks for the reminder. This should also apply to WCN7850. WCN6750 is =
not
> > considered at this time.
>
> What does it mean? It either supports HFP ofload, or not. Does it?

Or does that mean offload is considered the default over HCI, and in
that case does it actually work with the likes of Linux
distros/Pipewire or it is Android only? The fact that it is mentioning
HFP rather than SCO is already concerning to me, the kernel driver
shouldn't be involved with profile layers other than core.


>
> --
> With best wishes
> Dmitry



--=20
Luiz Augusto von Dentz

