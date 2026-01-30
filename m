Return-Path: <linux-arm-msm+bounces-91327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJMPHVfnfGlTPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 18:16:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E0BCEE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 18:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCC423033B6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 17:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E908534679C;
	Fri, 30 Jan 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dV0C+1NR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544EB3587D7
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769793236; cv=pass; b=W35NinvSYGgKIUFRBtR4qud1DXpz9JRLCBOJyeX8OnHfzcXdut4Sj9v0IGapabX4GKDoi2y82eL9ya8j442qdOjuUb7iMrgSWycMnmtHmNG4BduJ4NcxIicAETC/F7fSVZH6kgBOQxBlQ7ZILRnEjXb6piHYDWcvDiDIKrpFXo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769793236; c=relaxed/simple;
	bh=k3jdSkIdRKAgi3sIAoseRd1b7w0r6ERqCAu/spFs36g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSlqZIwKBBKD7UHMmisQUrsAiZKKYzFZGvQpv+p+PWrvaiktFBaGrk8SmJoi2GCR5modpq1MW9V05qfGSN5W6LfJVM4vXWD7vcuVNihmF3PgP4DEgo/9928pNRyYbjyjJ/fm5K9CoMTcK8XK7ZsLrLBYm90cKCN8Lpo5ncW8ZDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dV0C+1NR; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dd490be5fso2994944e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769793233; cv=none;
        d=google.com; s=arc-20240605;
        b=ZnGiovtagq4kG9kfO6D1IazQ4ysGr0klN7jgmVb8KKrmIJyrJuiFQ1zbDYGKT++1Q0
         738s2A8sjnaSY7EiwJklj7TPG3ePGtCI1e7oXP7dPD5KwWGhwK+5eAtuSBaaDshaa5zG
         bymLm8kbY4hCFdIuJuJ+Bym7z8ByrK+ykGEi7Azvr3FaPnHBWF+ZXxTZ+WTAZnvPUcSz
         I9xKjc8RCcGGNHUgtSq7w7ZNrf/iGsElWkArOhv0bigjsCfX8C0wh0DIPlXCCknNea8Z
         6Wtmt5MO97AVfthGQqcrhnRr//lTyMhi7l6ExgpEE3kSmrNPCBT0OwhlqBsUUS9R/jty
         87Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k3jdSkIdRKAgi3sIAoseRd1b7w0r6ERqCAu/spFs36g=;
        fh=tQWoptCR9ukBybEjs4K/EujaVZmF1DL7tpfWgXafXlA=;
        b=OvjohN11LZfXCcnEUHtb01owskswkTHxZ/rxR8zM7SSglyuxJRUX8arLbrYUKIaLG1
         jEfUSIINv3Y3kS7GOLAp49ejkYCikZTYoey/7ShunYIIBPcLz/0U8CEVsQTLfJifCGlN
         iZmb9jN9PBqIlDUb1Y0s7/qO0Tl2/L2BYAWo8765F0FD1UMWMe+79yklVnPaiq/z5e7Z
         5bMzjAesX8oE8prcE0gSGpMa5LOsS6fYS4zJZ6y9EvMcRnWRcg4DjMZO3pq2psaY0YGN
         zOnkGq0LXHJCRrGn2xF1MDxCOUI493JrXjXvQMn8cRGMeZs6WZbjQ24xRaRR/fj97S7F
         Ka7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769793233; x=1770398033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3jdSkIdRKAgi3sIAoseRd1b7w0r6ERqCAu/spFs36g=;
        b=dV0C+1NR3nfm7a/sq1msaXpzDrQx0ILJU36uPKnhZnEuBuX4IhGwPFpdaHrs0mzkE1
         /PSz3aBCFY0x3T5AeulhY1gSPKsNVP9BOgZGh/11VimOVNLpVWDnIZULkDLF1XesgIum
         dSMI9u/MSGzTpsipZePDldQkGKcIhh+WAtv3CFM+bbtz/o1GjiDwUL1OBWQafdjxy8JA
         oZXV57gbQ+/9PjeMzliCrLd0WjnGbTEd2g9HaqiuQMUsUZ+HgPxOLnLhEn7gxRgowLSb
         CqrUOUZNhSc6uGWG3465CHkaE8qk40aMVrniByVcjfDMafpoi1P5RVH1fpYOkzLTsqc0
         6Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769793233; x=1770398033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3jdSkIdRKAgi3sIAoseRd1b7w0r6ERqCAu/spFs36g=;
        b=UI0/HjUUUEn80kcdiLYz70QkecZT7+kmGRtsY6L7dhlUnZK4duR89wtkbnDpU+JvIp
         21d1zM2GxmthfLoss831xeqp1xnOPJzp8Cn+uAnsr/rBfptiCx1uAt2ShjeJTkNIKysr
         dWsbAKSFISjOOau0cslfmzGOI/Ini/emmqx3lzbyfo2goU85AHFX9u2fSpuqBCHNE10W
         /eylfp0sutg1vzwd/eZPWa7/UBHeu2beXr/4JQDSkKMkLJ7AyU3y6yJ/iU14rymPk+AI
         28yePyIx+ClaYCJIoZBWxd8DXOifwLv4l28kXWxGVOjUaHhI7SxjbP83LOzsP9BPFT5P
         mdqA==
X-Gm-Message-State: AOJu0YxwyWbw7JZ3FZo+cPZKv1cfO1q3oLSGrpvCzGtqGWOTGW181GaH
	wljacttE0cA9GdNbW/rzWUfyIb2FykV4wbRORNUp05+CM9iasJvfcxeUAihQ9CeVQuCAOCeIQDM
	Uvm5U2FCHV+r52oRi/TR7utjtwL9cEpS2ow==
X-Gm-Gg: AZuq6aJAWiVBnEq/htj/Bx83VNSW8yldYyDJwYfF6SVfpp0A+MdzFGNUquWRL/iRQn7
	eC2OOEGTW/ZSjkzDbqM0ZEdvJNAepLj047f48H9Qb5fMwZz4Y11obOrtFWi5UiO3YKhH7gP0Iin
	MmlfZAdM9r8Nd5vs7IxgyOo1VewqDeCDcFwKAcSE3sGLODZZbd80PSjo6bNTCO/oAPP417LR4uK
	aFtuVxcs6OU4gbVKaGHobPQaryUCgox1Yh6Kd1fj7NKPn2vAuoDZHB3RPowEbfQuEBsVCpdRfKM
	XFJ9Xr/ZMz2wnUB20KvdxaBYnfvpJN2lzQFCi5hMcaPCcsBekhZr3Qr0/UXn2iPSHgyz5wd+ysS
	WFn2Pb5nvcbX+
X-Received: by 2002:a05:6512:4003:b0:59b:7291:9cc2 with SMTP id
 2adb3069b0e04-59e1642ba2dmr1337361e87.37.1769793233049; Fri, 30 Jan 2026
 09:13:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <aa90c5ca-72d7-48fb-b3b6-4be8a51dc0cc@oss.qualcomm.com>
In-Reply-To: <aa90c5ca-72d7-48fb-b3b6-4be8a51dc0cc@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 30 Jan 2026 11:13:41 -0600
X-Gm-Features: AZwV_QiLOwqJGJik5PB39IZ3_cRWjHSOIkmsBQYJNuGexkz3UTOs0ZEwx7Ut9Kc
Message-ID: <CALHNRZ_SjzLVoZ5qf1tzDFqRtnZWRaBWyytyrjA=dbyHWekAQA@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91327-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 211E0BCEE5
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 5:01=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/27/26 11:48 PM, Aaron Kling wrote:
> > I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> > for Android, using mainline kernel drivers. I have come across some
> > missing functionality and failures that I would like to inquire about.
> >
> > * ABL fails to load a dtbo using a baseline dtb unmodified from
> > mainline. Using changes described in the gunyah watchdog thread [0], a
> > dtbo loads and the devices boot as expected. If any of the changes in
> > that post don't exist in the base dtb, abl will fail to load the dtbo
> > and go to the bootloader menu. This appears to be an issue in the
> > baseline abl code, affecting all devices of that generation. Would it
> > be allowable to merge a change adding those changes to the sm8550
> > dtsi, allowing an unmodified mainline dtb to work with overlays?
>
> ABL is.. picky.. to say the least
>
> Could you please try to check if what once worked for me on a
> 8550-based Sony phone would happen to work for you too?
>
> 39c596304e44 ("arm64: dts: qcom: Add SM8550 Xperia 1 V")

Is the question if the devices boots without dtbo? Yes, that works.
And fastboot erase even works too, though that may be because I'm not
using appended dtb, I'm using dtb in vendor_boot. The setup I'm trying
to use is a base dtb that has all the common nodes for the AYN qcs8550
devices, then a device specific dtbo for the diverging parts of the
four devices.

Aaron

