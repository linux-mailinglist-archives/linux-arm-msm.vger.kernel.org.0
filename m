Return-Path: <linux-arm-msm+bounces-106847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP2TK1B/AWqkbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:03:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DD508CF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBC91300101A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8A530DED0;
	Mon, 11 May 2026 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="UL1gcOLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ABB30274D
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483022; cv=pass; b=SH47jKll4LC2MqSp082jhq/diOvptQ1RiBT7b+8dLqoqb0mQKwC5EjvXPw3sFgwau6AYlt7Z1HwRkZQkbL/FZiK2ZvOBxvX+vhyQUS7eZXvnNOQ1yytnKpQVBHZlFbcUEQ3Q8yYYRx7oNAd2VfZZqtdGCXbLMYQv37kw7gy+Q7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483022; c=relaxed/simple;
	bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWAE3xICdEYPhHZrXCZ4A5TlRMkZubgfucpbHJ54LCpen7imi8fk1/mvdTf1v2rsWynlmoj7ZV7xHXGtdu0ihsJtW/qsQESiM2/+aYhwKEmd0hyX/2FVOoAUjzkic7Mm/xIuxBUG4HUZM0UMX4XwNWF8/hzyzaVVeCKcvzCFyH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=UL1gcOLS; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a858881ad2so4094883e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 00:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778483019; cv=none;
        d=google.com; s=arc-20240605;
        b=iHzL7cX/4Kiv7tiN/NHmmxo0m7Z4qmqmngr0aXG5/wkiygfw/Vyb1mUtljhr0fKMOS
         XtPd6NVn/jE/oeNb3riNr7+J2mig1f42AsAUBzUXCbmA7ZwJaNk66Ab0w/KtXcyAV+6B
         GgdT+abpPO7DFU/CIuXUDj9oqD4h8KGnOZsH9WM8rsw1dnGuTXyS6Dc/YexcFPRm4xwM
         VGCQ/fdU7Y6RM5ElD3fCor8QcMQVluSH7j0Jnd/vkmJmJCkJUc8Zv1JZIPawYHPhL/Vj
         77Cgi2QcLsaMFhR5KBHv+fwW0SbNX+uRMzIT1+pbH72IbmDqjYWA6ZnirNPYf1rLluCu
         R9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        fh=usiEou+dCSsJxc/pLw0NC5SuOQEHhPIC78EwUa+mDTs=;
        b=Wf6iSLUVEMfcAQlnSxN5jLKtVFZ1o9Ra/gLCHbrv+bwQSmUzDXah8v4wiVB+awgswv
         mmRFdFcsoWgjiymJTZTzAx95W9+jJtzHlQ4LJU2/icE/gja0HCx27swRBMusc5HpiTA/
         3hDep4hF0xT0+2tf/26wJU38oUL/+Qxftx+0dcpBMAy170axBeMziOIuJpDanhB2raAl
         qYRkePLMe3TTSy6YiCH3KwSCz+5JUn/AS9S2LfuhdItpX05DEPKm3Q0AJbv0iUhtiXyg
         FuXQcBhyHmLmCY7qrLm7AzFuqDtC6Z+dtSF2pHiIuJdNeZ3zi2sDVnC5OQsAKploebJg
         IBdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1778483019; x=1779087819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        b=UL1gcOLS1hhcAv+mgvf9TjKKR/64ATXPBTwjh34QOxfrp7Xs9sx1Mlr/Hdr51nX33O
         pMJpA+Azd9D0XByAoaQ2LqYBCvBgZtBDa0cAZPM9a+14RpqxqXt79QHKNGxbocnFJk+y
         5iD3e+5xGFu+WBamEANuyvi8nm9RPkWkxDbcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778483019; x=1779087819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        b=WcQRyf83dyR1yiHdU347hVcRFoInuoL3PPyhncZY92Nkia6TgAWDDQTuPAiYxGIbzj
         dKlPIyjnL/YrlnE3UaZv3JnBVQoWl09B5Z6rAMF0Ku/MT9dubsxMjhU3BCzIZzssCjKP
         Co4ihyQEDi3lcUUfaZyhLI+alLT50g2r2rUfKIzFdQ+eRrvPvVY2ZyJc4qOr2MB/RMO0
         +va8Z+yc1eqhAonegd2nK/Qyp+lJwADZBr8lascoDE4xCCt1Aq09tBXb5I/en+RiH8NU
         8ZkF0DtiGLXlAl6IFx33ueUL9TN1ddDzmwqiIcUITRjUJ9nkLT86vurOm/zxw71BETnl
         XPxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+E8AkhXiVWf7bAPaLzMTCaKvoP0CR80KsMx+jVkBIEXYVI75LmwzVVjXORGNnK7rpo+RQuciOpDZ+yZLVH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69wUWOdY/2km8OQ8uwzxeQDOrvsIsaZspsfaDTcHmGpBvBNgn
	3LCfIPxWIJVREqG6qxwZqWKSc3JHfyMKdheGUqlRoGvjD6nB32T2irHrAeVOU+q/AyIXCFnzzWu
	PQijQxfjvJtalz6zvij42XIkZkk/JCcLlcRUmFR/USg==
X-Gm-Gg: Acq92OG4dckx76s/kvUeZ6KeCmGzgD4qpoaNxULcBKLs3Q3UBsgxaAJMyrqes4Tkl3r
	pCVy/xYNyME5xUTg7futzqlqpr08wdnNOakSm9gMXlS5y/iDv9gVs4AUd/5Spz1lsfVglbbTb8c
	cLZdGlsCTnljen33IegIBy+kmZwLMQQg9W5kmIzCf0YqYrXzen2bD/NW6/e+qvWXwPWRwtkog3T
	BVbtxQGl6xfwG/NcR7+lKOQCZwcBuBnJKLvvr9YtePFPhtP2pFi8AWumTkdiSj8hEs+Q7wr0T8F
	IlHmaHXXf3Yli1E=
X-Received: by 2002:a05:6512:4008:b0:5a8:80ce:ba55 with SMTP id
 2adb3069b0e04-5a887ae1e90mr7551438e87.11.1778483019285; Mon, 11 May 2026
 00:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc> <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
 <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
In-Reply-To: <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Mon, 11 May 2026 09:03:27 +0200
X-Gm-Features: AVHnY4KqvZ7gjq-ivtySQtnC8vX7jHJ3zr9wVqg3mRzKVkPEw_LUG_hW37iSbSA
Message-ID: <CAKA1JhZHDPWbJVSuu3X4PH3T6Ko-uzZ6ktA0i+-w919ffuvEuw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, broonie@kernel.org, linux@roeck-us.net, 
	Jonathan.Cameron@huawei.com, wenswang@yeah.net, naresh.solanki@9elements.com, 
	michal.simek@amd.com, nuno.sa@analog.com, chou.cosmo@gmail.com, 
	grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 561DD508CF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106847-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[arduino.cc:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 1:19=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/5/26 5:44 PM, Loic Poulain wrote:
> > On Thu, Apr 30, 2026 at 3:21=E2=80=AFPM Riccardo Mereu
> > <r.mereu.kernel@arduino.cc> wrote:
> >>
> >> From: Riccardo Mereu <r.mereu@arduino.cc>
> >>
> >> This is done in order to support different video output over DSI.
> >> Since audio part is linked to Analogix USB-C controller it is moved to
> >> the same DTSO.
> >
> > I'm a bit skeptical about having a separate DT overlay for this. Is
> > that really the right approach? The Analogix block is part of the main
> > board,
>
> Oh I skipped over this!
>
> So, does the media board require that a switch is flipped or something
> like that, to route the lanes away from the analogix chip?

No, DSI is shared without any switches in a "Y" connection.
I agree with Loic that not splitting that part but modifying it would be be=
tter.
My goal in doing that was to write as little as possible to allow a
bigger audience to play or repurpose DTSOs.
Since V2 has no panel I'll avoid splitting them anyway.

Riccardo

