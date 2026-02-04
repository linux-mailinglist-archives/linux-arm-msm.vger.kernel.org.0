Return-Path: <linux-arm-msm+bounces-91846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEuiG6GNg2lWpAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 19:19:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD695EB8CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 19:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8CB03013A6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 18:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A914423176;
	Wed,  4 Feb 2026 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKJm3T+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03E6346AEF
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229151; cv=pass; b=hpTi7Zb/mBklq9he+ssNQEKjA7m8pEcJwtBkD5F6dA4mLDWD6AArVdmFxXrvdazdbf8atfhtwsgFgxJm7RbJVNvnZtqWotfGOMVMFAdrsZq0euKFSDSW8KAKTRtJ2jVVu/C5Fv6qOGA1roIlQvO/ov7FcfaGE42UHww0pxKimvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229151; c=relaxed/simple;
	bh=Z/cOiNjGPvAbcPc00fDfiJBUcwqB2BokXR+d5NtDgrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swv+3RIIfSLQbwCr3m1kz9qkIBkPTYruADCPefaYffnFyBKUsJc9ucx9btQNLyzLIsr2PNvbsXWSz+XmI3PHx+n4lEBCPOxQ+VxO1mk2wdwJN3aIyzsAs8xqPG90i8ph1ZQlsQ+nPAENcDuLzoerccthmloRxg8WPPlpM2ErZ88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKJm3T+4; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59de66fda55so183413e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 10:19:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770229149; cv=none;
        d=google.com; s=arc-20240605;
        b=WuYgl6Qe972LosT8oQSIpmpF6P89tdNQA7jwjGfIdVPuSm2l+yoQdfRkv8QuDbmHB1
         D8cJNjLBU0ZZ9ln9eXzmE0HPvDyJuj7Fq19IuaOIShbCCq/J+WLgNML5eB5SnxFcZmQ+
         MYxzNPytcyqeutzEaNe7w3zoPudf0EsiJfLwxTkiYLdUKWlU8oOkdtDaLjHVEySXPdJ2
         s70V6dX5ckNBuTDDZN5BYjO9j44y+qTbGXSrDQRsIqd5/pwPIJ0ZzCBWgKm26sG4BpVb
         lczSUEQG9YIVwPUo4aVAQC+QMnT6lNnzVo0w0/KCz6NxXcEIo86jfzaqX12IcDv3wufq
         OdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gvX/bDX4V3pRDB5JaiFipO8t3cejkqHxDr4fo0T4Pwo=;
        fh=H9GQhRovAa+joItjhUeqEnD/oGY4wjVz9Wh0ULA4m+k=;
        b=BC923+YrBt97k1rKB9fYYD+qa1AD4Q9aCDJqJtha5X9eo/p+7/gtQ2M6cb0mezwLJE
         4i3zOgni3PaVdYlN8mXxMih52OpNCjhPK3FUV+5NXcg8fqVF2LFVxRB5f7D0pnmrWiyj
         xHh+Yq61VJsh+oKEBV65ugZjWHHjZCCfXd9OZVW/qYOL2dco6rJnPiLGiG6aBnwktbOP
         kZApHglsh6vY3nKBM4mVXXY+w3K5FzvygrG9kjLdwgbOTTryAvhbvpHPEQ2ptgWaDyBQ
         GP4cFqMXEk7WYsCSlcPXH5MHL3X/xsEWJYZ4CdvDq7Y+3EWCFoJFrGBwn8zYEq57at1Y
         ualw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229149; x=1770833949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvX/bDX4V3pRDB5JaiFipO8t3cejkqHxDr4fo0T4Pwo=;
        b=TKJm3T+4o9sTZ/PBVr0dk7d8K9mh3pBZ0sjLulEjDsTTac4Q+WjEfmTRf6M+xtGYZi
         JiJFoEGLY5+KBAF4aQ4lAaZPK/yb+qBI4pB7BuAH8MPNSwD0B+M5VRZfscPfiXi8pD5T
         2bdjgMz/5uF5K2zwQZCWXRlA7kLe/hHnfQPNF0/IfIaOxhDC3xlHYPKDCDiy4a7BXITC
         MDPpCvvmUe0Ts9xr9Vpo/5R/8un37a7SzTvx1/1O+LqJR5cRFpJpIOH45Ng2pbSGvc18
         mtd2u6RZvClNAanRYRTGipQ6qxY0LeAZV3xbppjP+Fbe4JXcbEl4to+RjMG8+O0/nIvf
         tJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229149; x=1770833949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gvX/bDX4V3pRDB5JaiFipO8t3cejkqHxDr4fo0T4Pwo=;
        b=uoriCnZitFYh9I6dwAxhuP90AMCx6QzlH5lt6v7teOwhYziEXLH1sm64TzpaaOT74j
         Os49dB8HR5jP2URjm3kXMgZHAlIQpF77wnPICek1n6G5G7p7P7AL7jQy1rgMT8QIk3zb
         FDJQdLdUrMZ9zE+eQLCRQ4qmaFOVJD5cDEGLzfZNcqoyFdJR9WQurwFPnKm/2greOUwp
         1CsfoqV3DCnCBEypemUmLgbRPIB5ixYc/33V7kK7HIiYVAysyeiGwU2fBM+B5sPHKijD
         vlu98OnSEM5dMHS7rih6v4+8lbPfzMVynuGqtqJAzCpr5Ch9xEnQNYA/QDfmupwhQJPc
         ATlg==
X-Forwarded-Encrypted: i=1; AJvYcCU78RzqzvjKKbDvBSNkqnR+dB++UxzNl7KjpZeMogkq+HjTWUxWUzqJQBZZPRiv/NCdzeUh6ZWik7KFam4y@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4JEh1zRTZXuXwn/MM8E2oWClVY+bwJOJKgW6QupfD2duQ83C
	mBO4qkYifzuVn+5lnr2GuXWscxYw4pWjDkbyYfCA25Q3ahO6tsqXH5eNlNkZ6g+28KIZLGXltxa
	WD2liAl+/WJ3AVX96qRYBr1M5Yb3SHJE=
X-Gm-Gg: AZuq6aJNJe9lOEjU/ADbmAkXLP6m42e7VDqctTygVYaXjso5Sn836j187RCif9K+PiE
	g5w4+9AMqugxpdBuKHcc38MX2mTl8ZAh7ag8OWw40MZH60+Hy4WoqLlH450fwqlrAjy0dEfXRVa
	kepl1h/8T4ebMoQ1LrxUitEa1v4J+iYC7/PhfN7sbjcQ4nHdOqeJfyz2BdCw+EOOQb4QZUUlNIE
	KXPnmewnNAEM4ruBvrNsfmIkkLbZWpCpEeJCbmf3FbKDiQ0XuDjHsfbZLqNsr+i9DcjqWhHWF21
	LFi58knzBbCx3M6qy3HRKjIgaAvREzLC4FQ0R2wfznDC186tOFIbPn2p
X-Received: by 2002:ac2:5688:0:b0:59e:1b0e:ad93 with SMTP id
 2adb3069b0e04-59e38c4e12cmr1600974e87.51.1770229148546; Wed, 04 Feb 2026
 10:19:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com> <60c970dc-141c-4a2e-aaee-719786371eee@oss.qualcomm.com>
 <CALHNRZ-3nr+EF_m3UpLHRfv3bpOdzzxSZfnnk99xH87MM8WiSg@mail.gmail.com>
 <f4420072-4540-4e90-a22d-02b79784c3cb@oss.qualcomm.com> <CALHNRZ_k6ePOC0AuJR_-RUF-bts=pkWpcrB=L8=HZbQQTFnqmA@mail.gmail.com>
 <469148c7-c7b4-4266-a07c-4a5195ed986d@oss.qualcomm.com>
In-Reply-To: <469148c7-c7b4-4266-a07c-4a5195ed986d@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 4 Feb 2026 12:18:57 -0600
X-Gm-Features: AZwV_Qh_uGxcPCFNnHdIYS0uIZ7i76orI1gPs6z17TNYDztkd_wSfZ6ViklyYMY
Message-ID: <CALHNRZ8=Lvkm4apR_fHKNO6bWhZz3TyG873aq4wJDi801qXaEg@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-91846-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: DD695EB8CC
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 10:53=E2=80=AFAM Taniya Das <taniya.das@oss.qualcomm=
.com> wrote:
>
>
>
> On 2/4/2026 4:51 AM, Aaron Kling wrote:
> >> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_DONT_HOLD=
_STATE,
> >>                         .ops =3D &clk_branch2_ops,
> >>                 },
> >>         },
> >> @@ -415,7 +415,7 @@ static struct clk_branch gpu_cc_hub_cx_int_clk =3D=
 {
> >>                                 &gpu_cc_hub_clk_src.clkr.hw,
> >>                         },
> >>                         .num_parents =3D 1,
> >> -                       .flags =3D CLK_SET_RATE_PARENT,
> >> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_DONT_HOLD=
_STATE,
> >>                         .ops =3D &clk_branch2_aon_ops,
> >>                 },
> >>         },
> > Both reverting the clock sync state support and setting the
> > CLK_DONT_HOLD_STATE flag on the affected clocks do independently cause
> > the warnings to stop.
> >
>
> Thanks for confirming that Aaron.
>
> > So this is an ACK issue and not related to mainline at all. Sorry for
> > the hassle. But while the topic is here, is this something that should
> > be sent to the aosp gerrit? I'd be willing to spearhead that if no one
> > else is planning to. But I don't know much about the underlying issues
> > at play there, so if anyone that does know more about that is willing
> > to, it'd be more efficient for them to do so.
>
> On the AOSP, we should be having another code altogether which would
> include all the required support. Is there any reason we want to use the
> upstreamed version of the driver?

There are several reasons I wish to use mainline drivers. The primary
ones include:

* Using as close to fully open source software as possible. Using the
mainline drivers with mesa, drm_hwcomposer, etc. The qcom downstream
kernel is only compatible with the downstream userspace, to my
knowledge, much of which is closed source. And those closed source
components by definition are not freely available for open source
projects to use.

* Flexibility. The downstream qcom kernel is designed to work only
within the qcom android build system. It is difficult to use that
anywhere else. By contrast, a mainline based target can take a pure
google kernel-platform working tree, do a small set of build files,
and build.

* Longevity. The downstream qcom sm8550 support uses kernel 5.15,
which is already aging. I am currently targeting ACK 6.18 using
mainline drivers. And when 7.x hits lts and google forks it, I will
upgrade to that. Using properly mainlined support makes that simple.
And such support should be able to continue until the hardware is no
longer powerful enough to run the newer AOSP releases. A much longer
runway than being locked into the downstream kernel and closed source
userspace.

Aaron

