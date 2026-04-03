Return-Path: <linux-arm-msm+bounces-101612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEifL/V4z2mvwgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:23:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE33920BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A15403029FE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 08:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3D7371D14;
	Fri,  3 Apr 2026 08:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="x281Uxd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770B285406
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204595; cv=none; b=NyHwqiLDZj5lFMzxmfBOC3QwpYkasbt+cEpIdpDzfRcYobNQLZAZ8ZdzG+1M0qiUePfl5rWvU6GrwbAFFu1TMbXCA1NoBwf0Z8ApumX/OrNfAgfohtb+Eccrrl58QmAJsMXE0SL/Kr3zRRxXGYTrq+rQ/1k4AWPXwcEnYrTsoHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204595; c=relaxed/simple;
	bh=23lg71SS1ypLE/10It2aQYW4KhKP+2cYmx1DGLGdzjA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P5BJtvg/+WiYh5+T/Y7nX8As8cPe20wVn4rdX8LafaqNA8CMEXJljmjQ1L4QsX9LXKF9Zo6+gC/2GNLEZExOJ67ElcpG9mY0ckRYnnb3Vrv/EdnvnsPPb8uDVrP2MkvjLRAXwn69IvxW2gNmSW2b0/9+SkvflJ3Al0ocPUOkVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=x281Uxd+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c11eba219so212100666b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 01:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775204593; x=1775809393; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23lg71SS1ypLE/10It2aQYW4KhKP+2cYmx1DGLGdzjA=;
        b=x281Uxd+O1epRbfuICmVyPJkXA5SYdzMCZSDDYsaDeMWFjMZydJgqdSsBiP4QkdMTH
         wdwKFSAQ7txNW6HyUljdoUrfpaGIzbIL8Bd4WlM1ry+xIUjOlpPr48DdUXY9Lvu58rTc
         O74XJFcQG7oAytQiloE4qjmhbU1siHb+95qe+uXBaLqAfpLPhAJpLeUhqAWeKprmhtia
         zHIe2TK9cg/K07gEjcgtRR/e3fjO2HTYc5OZbziBYtWFctlonKUrc6ZD1JZNY0PIa3eO
         M4/wUPjbs5zxDjzf3g25tDZhbg0hUrf2dAOMw/W+2yXnG7EMOd1EGrOJR4v2pLWagNS0
         ujKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204593; x=1775809393;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23lg71SS1ypLE/10It2aQYW4KhKP+2cYmx1DGLGdzjA=;
        b=eu2bnnv0bpEoELH3k3mFoo40O4t2FhW9+2DT8Uu77PpVsK4rRrnxwM4Ccw8a569PCh
         GjGGswt/mqNZF7gY3R18LNyhp3SJBssQ4RUmS/tNS/Ftrwf8cF+EoUlPY3Kcr+WPF7sp
         Cx8XoY5TzPLMqYMlS7qJdr1wjCSLFTUTXD6SIKc2kAe3J7RT3SOqFGi2W8AKdCzG+zZg
         sDtpshO8dBgDqQksJxqCocq05H4/Yxrl8Ua3W90qV06ZKM3WlfgV3aoRj05AHpUv08iY
         eZe+3P3iM2YPJgqewURgRC6XMGAfsGPOkujCf6hd0t31fFNDZNsRCZSmvZNVhGPhmDqd
         ZGSw==
X-Forwarded-Encrypted: i=1; AJvYcCUP5Ne0xVSXiaCo2IkhP79pQkONhd2HSpParBExiu+cq7XF+u1YvdjMq9SdRZsjFeDDBNp11yUKBZp2krgi@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjL1mDvtepuQqAXSpSvjtTAh18FYd7DFnF80xHwisC2Erw5uP
	KP6m6clm79+YUfer9zi/36pSo1NVePu5rbKiRG42IxvQZuZsfQf4aPB4FQIaQBQHr8g=
X-Gm-Gg: ATEYQzxF1iteQkFPCkVD4cpJtzBz9saFNJqjsC7CxYbsyGSVZNXsvAdNOAhK5M43yUa
	TcTWnbZTEVLeDbdm+BRic0wkpiHioTevJH+8/YyJ1R2jb620r1UmgaaJYAbZDRxqAgabodfU6PR
	6H3DtwagkzPhb9K4O9d2PPR5WbmDvw9v6K88UeLRCxuc3iOrkHhr7AiNL70EHix5jy7gVXUb8De
	DAjEKDE9aIY6ij9tQbTDsl5LN8CsNsKGEcAloXeLe8rsPGXM5SImJAFxYZfAY7hzofzhgEryMeA
	oVopvu2GL7qUWctCm0gdxM4luilzE7NYMICPLt3xSfUUC5SvPRFqfoRfM4EsljhJNVDLG8RRqXM
	0BP2JPvGG1Smwhh3Vp/a0EJxrevOWWojuYgVHr7Q7O/pbH+PIGilP1QYDk8ZWEktO5KvA/evVPY
	ssZWLrSVTVBvHP+et1OVx/R6G3UUwqbatlaMZMNDIrKZYohXZG15S7Ib0ZhUsZtYD0oockUaBKY
	jiz4L2m/2Bumw9YNBMy0+c3J5gX3b23l/NI
X-Received: by 2002:a17:906:b391:b0:b96:e593:fd32 with SMTP id a640c23a62f3a-b9c67308377mr71993466b.12.1775204592537;
        Fri, 03 Apr 2026 01:23:12 -0700 (PDT)
Received: from localhost (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034d60desm1398832a12.31.2026.04.03.01.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 10:23:11 +0200
Message-Id: <DHJDIAVJ89XO.2OH312F9UMLXN@fairphone.com>
Cc: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, <linux-input@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] Input: aw86938 - add driver for Awinic AW86938
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
 <20260302-aw86938-driver-v4-3-92c865df9cca@fairphone.com>
 <aae7fRYaoDHMptyu@google.com> <DHHWDE7QEOTO.1AQ85UBLO8IQG@fairphone.com>
 <ac1DclNOl3ZA5bUg@google.com>
In-Reply-To: <ac1DclNOl3ZA5bUg@google.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101612-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86FE33920BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 6:11 PM CEST, Dmitry Torokhov wrote:
> On Wed, Apr 01, 2026 at 04:44:47PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Wed Mar 4, 2026 at 5:56 AM CET, Dmitry Torokhov wrote:
>> > On Mon, Mar 02, 2026 at 11:50:27AM +0100, Griffin Kroah-Hartman wrote:
>> >> Add support for the I2C-connected Awinic AW86938 LRA haptic driver.
>> >>=20
>> >> The AW86938 has a similar but slightly different register layout. In
>> >> particular, the boost mode register values.
>> >> The AW86938 also has some extra features that aren't implemented
>> >> in this driver yet.
>> >>=20
>> >> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>> >
>> > Applied, thank you.
>>=20
>> I'm curious, where did you apply these patches? linux-next doesn't have
>> it and I don't see it in your kernel.org repo either.
>> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/
>>=20
>> Did this slip through the cracks or will these patches still appear
>> there?
>
> My bad, I think there was a conflict with Dan Carpenter's patch and as a
> result the series got stuck in my internal queue. My apologies.
>
> Should be out in 'next' branch now.
>
> Thanks.

Thanks, appreciate it!

Regards
Luca

