Return-Path: <linux-arm-msm+bounces-91565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPr7FM4tgWl6EgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 00:05:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6741D2956
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 00:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B9103034E0C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 23:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F3A356A1C;
	Mon,  2 Feb 2026 23:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NazoVc5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D36E356A05
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770073322; cv=pass; b=LedkAvGKVzp/UFApTrFxVZhUmjin35ODX2lcQexSSUumm8+V4Do+X+RrBiq38v4W/9DAKewglwFDJ4LZ2M5OaG6WEhDlsu16uZFhQ+s++M0FhJfKyTux2ZftruwI/ZcnOB+2RxnpUAbPEBs3s1wHaxT27H3hg+zEU5Y6x3DjZso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770073322; c=relaxed/simple;
	bh=SKB8oWjqJfFAI8bfC5dL2ESIISfQnDLAv+r+2eGm2yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXPS4OWiteZKqbgGtxPfJTstgyYhtED8UYJMNp6qCOndn6mTk78wHAcgXvUxWb445i4ZnkbVFtKggwQk/m17z82x3t2GeQ96W/VKOA1vUIZc3ribGeM8367Ug8FWyN9hm9I8dooSOsEECVKddv5q2N5MMLv4YN4LY3Lm6HpEAWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NazoVc5T; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38316d0c26eso43187651fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770073319; cv=none;
        d=google.com; s=arc-20240605;
        b=lC08N3uGJqjb3+2SHaWS4XC9sPLb/yRa4UKZT8Xn9XKrCFnf8uh6VPTA8HsuTelzGA
         ZChUa3/sMziIk2l7KUZ+XIaqnKQIh1T2rp4urg6AoUIXLU9y3DX/lSGvsfs+sTCHVwLS
         5tHZzkgtTKXG4x4bcrqpMthE1K4El0JUGYmTpHgxZN3Z0slgxAvlyGpgvVDNv7XZoWIj
         X3rrQ7SSnTZa+iOM95PcOFEi5vjMYvq9DubqvLrqRPq0mKX9z89A85GUbASQICoaxIRe
         HgBMACcaJQzJrx2J/JvUgArhZWydxOSYc+KKaBlmwHveyNSAFyDUbJmR2fJ1QpM8yuJG
         Kwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJPBcJ8xv/CxieWFi2UuxUC3EW/+mkG5Q7oI9rGduLA=;
        fh=ByMmSdj3ub1wxOaa98KfixMdwZYvicbP7QmjxZOgMYs=;
        b=A4QKjJltke8o5ntHe+zY+PnBFiy+XMueEVUtJCJiL2tOECTpN/UWoqpN/9/gbB+BPc
         77ivrYuiRnYkBsXn9+OHB1AbnWYQEWiBTz6nHrg7l0SAhrme4mwkTsi0LrFw0YcPRCyX
         EyB92jB3OOqdJXGuXyKgcn41eVMkfDhOwVzI9pMih2IqErIlXgGhXrV0ejMVzdaeE06e
         qM29fbsC05JBbE5JzKx5SL7d6UZopnn+HIjlr5vPFrrJNTxbMzm260efqZ5qdNklggP5
         eGnW/o4BEP0NWW5qvPUM5tMqtHvN831Ymjp+2g/P/B+ggub5DMlND1FlvLPWz39+J7BF
         k3ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770073319; x=1770678119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJPBcJ8xv/CxieWFi2UuxUC3EW/+mkG5Q7oI9rGduLA=;
        b=NazoVc5T2fn3Pp2gyOxCY0a3D/0Q7iyAgqskUPTclD7oeOMYpSYydYH2qT+B/Pd2jN
         72bzGTYhnZQHcdMXUWZ07Cy4922HWliD4okWyPVKjFXTKJk3fxkiP8MlLLRXsycPFMOE
         4xjMpv1ZQvUe5N8UhUyJD2I8VQzcVsMcLm7COcc+O8TDAOU5Q7jPRxh5exSJ9n0cep+H
         aV5YVSrcPhXZ6WAcv5eXdFqMMFQfipAzLfMo5Wg2f+Vk17AmlIZDcUau02d6HvPGODzQ
         oN2rp9d7o5atgwBdbPhwvgi0CR5SdnsM6jwFL7mX9ak03jr5M0/pkTnY/3vlbPwdvbji
         pf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770073319; x=1770678119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJPBcJ8xv/CxieWFi2UuxUC3EW/+mkG5Q7oI9rGduLA=;
        b=mfMMhIaYwUmCh5XvVyiLZhzR0O8SoWMdi3aMVSZymjTayk3wbDJ4bdSqu2oacNJGi6
         O7Vfl4iriKk3glMB9O97z87Qe1IyWgtYpAMintO3ejkgzniBEEIBhj4y+LWipDRjnniv
         RsQuHe1iXNLglFVb6vkEmCpoySZi/ZlXXRa6++j1z4nf3STGFmewXlWF1k9+z37Yu5AA
         X9AJZD0dUY8Ie6KRu9u1NlP80iMrVyqIrTOxJ3BLcrMLN4C2peR+wxHGETWIbS2Chlmq
         UUUzal31vjmbhSoKDSua3pCTppynq1VqnPRwSCZ4yRbnhf+53eN0ybDQmPVjXFyo+H+4
         KulA==
X-Forwarded-Encrypted: i=1; AJvYcCU36894wlQye8yDJrH8pN+dIlXQkKtlrMW9T+KfiMRqPD3WlblbVufEJbbf+qQK+MOiqWOd09GZzwa/VdfG@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHQxIn7yRfECupWiF5YhJfdwc3OYcqmb48aw93iAYNI4zIDr2
	s40Sa3L5JpzS0wDLSpuTZ4qbCeJsLtP0+3IIMmZHw4Z0x0WOayKaZfT0eflNzDftDZDivUbNHjW
	Tq0sjV8+aq2WJd8kkSyYntSrgjMB4cFY=
X-Gm-Gg: AZuq6aIXIEvhi3E35Y9yMxh12nlcJ8IVYiFQehh5im9JNRJz4eHniIVD6Pd6OKUnm8D
	EkR5nY4wVpLVz9g7v2LrbHe5gf8/+T7HAk+eoCN8HxgF31PSh94ApYpHoLSEgaP4q1C29TDjuzF
	/7y8J/0epTbtTvSKWZCYKlvfjq0zO4hRGfWAkuQqAGue1so/CqiswgRh9mGGQzUcS/26YgXXmXo
	oMShVg/bCQ24Sj8Y1wEKW7hgGD86wqOepxrIUibvh7mqYzJkzpUV40FP0HkFJBzU2XUlg4/sZsI
	eq49lTXowYAP7l9bOayWpDQASq7LDwxEHhVKeKagVDWIXOYqtccH3vhe
X-Received: by 2002:a05:651c:110e:b0:385:d0fd:df80 with SMTP id
 38308e7fff4ca-3864669b7e8mr37950041fa.28.1770073319059; Mon, 02 Feb 2026
 15:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com> <60c970dc-141c-4a2e-aaee-719786371eee@oss.qualcomm.com>
In-Reply-To: <60c970dc-141c-4a2e-aaee-719786371eee@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 2 Feb 2026 17:01:47 -0600
X-Gm-Features: AZwV_QjvoVj4W_zCMAOCYofb7nzQO7ye1jdRulx_xvxH1v343vgfntcm34wwQhE
Message-ID: <CALHNRZ-3nr+EF_m3UpLHRfv3bpOdzzxSZfnnk99xH87MM8WiSg@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91565-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A6741D2956
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 3:35=E2=80=AFAM Taniya Das <taniya.das@oss.qualcomm.=
com> wrote:
>
>
>
> On 1/28/2026 7:33 PM, Konrad Dybcio wrote:
> > On 1/27/26 11:48 PM, Aaron Kling wrote:
> >> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> >> for Android, using mainline kernel drivers. I have come across some
> >> missing functionality and failures that I would like to inquire about.
> >
> > [...]
> >
> >> * Some gpu related clocks complain about being stuck off during boot,
> >> causing stack traces, but the gpu does work. I tried to do some
> >> research into this, but quickly got lost in the weeds and I have no
> >> idea where to even look.
> >> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> >> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> >> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> >> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> >
>
> Aaron, if you could share the boot up logs or stack traces it would be
> helpful to see what is leading to stuck at 'off'.

Sure. Here [0] is a kernel boot log booting to Android launcher.

Aaron

[0]  http://0x0.st/PbLh.txt

