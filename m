Return-Path: <linux-arm-msm+bounces-99727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOuZDYruwmkdnQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:05:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CA31C170
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47D813067738
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEFB2C11D9;
	Tue, 24 Mar 2026 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn+fVF0f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F79E2D877D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382515; cv=pass; b=Xcoe2xSHo4AlOoMWmAts/xK7asxvTdrl2d/B16FmtUwlk9F2hW80dTavORQ70tQaGbc4gi5JVTNHJ9OPV6dkTpc+EDu0eET7HTNSJitRW5CBPuC4CPXHK/gv/A/+BsbHS0XDo/bcaF0ay5kNyI5N4yzaWYlEruVK0hLF2dTl0qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382515; c=relaxed/simple;
	bh=3JinU9QWdjNKRGVl4u2wkJq2V/mu2RPYfuIoKkH3R7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTakrFxCBoA4fXMTH5dfLHTo2+kADbyYDhOx/gXS1c7ydeSCx8GThUy3uHHwOBvsQBUwQOk+o3G8yzxC6xKXTK7ZtgsHfjiirHOApH2J5VvPZIskqC/R8NjAeb+XOeMxCmm9UMz8iRp7G5UBMjG7bwLzW7kYeaS6ZdwJfHZXkmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tn+fVF0f; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c31ca77b4so7184713d50.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774382512; cv=none;
        d=google.com; s=arc-20240605;
        b=JTvcOG06TcwNSJ/75QOlA+elr+CPW8x6D1r44JqEUHSugRgbH73bRGNjB+8vehiFz5
         /r7DNoGsZshWG/oAzL/WHXmwSicp2aAZxHfM22zREZNLRECq/iHsvJJ/oSLK44+OaqqG
         rlckVI8ZCl8idnKIvCdy73knv/8S0uWoIFhl8/ezj3IJsffdbkUPUPw087OFq/QHczrv
         A5RaEXxkQmJLvA+pmGg5k1y+cUvm+nAWC9NmHK7yW/Igy7NsXgWSv4XB/22GhhbzmxIk
         geLfPgKMK3N+QRNI0R/zqs4jEnJL6cGIjheWACnVt1VcSw9/C7PDvwPMjMa9uCDd/vR9
         CemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3JinU9QWdjNKRGVl4u2wkJq2V/mu2RPYfuIoKkH3R7k=;
        fh=2O6OQq7liCi0nWT6jIHqJLjzkFWrIYS7TaC67C8d29o=;
        b=k9eGA7GS0PBV2pjsrT/0VsLTibfTPsFfcDg8HtmCbvLMYTVgNREq4ffZAdA/Yewwcv
         6ZA8QqG3MvFhH01GfXg/a9jg09esHF7IoIdFrhgAdEJisW1grTQZFZMEtqACPkga+e1G
         s62GSlBJrokAzB2bY8k6YDWo+vWwMTg+vY66N88ZxeHMSGrHFdoenJ7+PopwR8LwrDzr
         zQp6bh9kgo/yHgDFGmiZ5j6rsfEfJGVIYqDteJTDbTuJWAsOk/H37QMiHZXhLq12zC12
         UP4A2nSyppVdOfzBvE79eEFHleq1a9816n1R6mENTGQbul2m9hKjAZCwF3emD0BLHdJ3
         C4kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774382512; x=1774987312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JinU9QWdjNKRGVl4u2wkJq2V/mu2RPYfuIoKkH3R7k=;
        b=Tn+fVF0fjTgazMuxVZq6qL/swU+Iwqw5CD5KzV/evry2xLMPljSVrgLnCXJYn6kGsF
         T8FOtc9Lxr9aXBSsasOXo3tK/FOy9cnz2ex2z/RbdYni18CB9jHiKfUZhr3w8PTUUB11
         +DFjVXqMG9i3wA1JnG726Ed4ec0aZCv1mv8bKzPLFpC8zHItv0aSOW1iVjlSUYNqkZAt
         NpMiDphKXeLBjackdnxjejqlHFxNT9zW43zIZhArnB9achMzk8QUSqS5lCarjkBxTKzZ
         apn0QtX1BsJ1DR3bASe5hkFQotmcF7SAdw/l9NSJ9wfCqrsHmy85jMXq5Ogp8G8MCKaY
         bRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382512; x=1774987312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3JinU9QWdjNKRGVl4u2wkJq2V/mu2RPYfuIoKkH3R7k=;
        b=FyOvPXyNXtBk+Ikr0FLLJx3a3DzeZ9tiLqJ2wllHKBYe8DGGYNsMPtreP41XNjQ5ys
         K+i5Uu+Rt0E83k55IS758D04Oh8TuLna6l9GAGRRDUaw5LygKfZAObkEjZxIe3/wRGN2
         HCGpLnYNVAKNwHQ9gGzZs/ux07gV/WTFolMdJQvGU9XNavbybfRWaCWQoCczJp//bHjk
         Te9CXwuSM4aPJAhIpiqq82IjDOQA86AYTOXrbzAj3BdbxE0prVGDn/1U9ZzdiLqiYIUZ
         zEXvkEZwGcTkXhOtTCi3pLLp2gV+yyCRrgGbyF71S9vuXKk3kw2O1YNIW64hhyw+kOO3
         /iJg==
X-Forwarded-Encrypted: i=1; AJvYcCXjXsaE5sT8Gdt8lpquJn6QWJGmOHm4/mXGJJqwLB0AEwytDshPUEo+wF6P7Q/SNLl8oEy7R4o8/l6YAN1C@vger.kernel.org
X-Gm-Message-State: AOJu0Yycr6p0KtqR2lOOqEzIXuvUJOO3qt34cezQvlCOjLn5f94XM5N+
	s0SHd9/ETPt1FCYnvA9kWWtG7QmLmmQVSAHJzhP0JIjz4cDXVp39QyskECKdzCCF71hxZsK6kp2
	KJtl9lPrWR+I1KFajGAFxbFztvXoVspg=
X-Gm-Gg: ATEYQzwKQQnxtcC3s6P2sMAFY1FP5kquniMeMNIpsGiJq5bA1rqECioAbaXbaCkA+qj
	mjohATl5QXtvCVGBTNetFsxaqeoPsR6TLl4hT3D48NtltIpKCOf1KwW7UHZMnhH900dKSSN1GSw
	EZUC7zaTvCNFb7iCvgh+7dBfL/cRo7PGf8LZtRkeogT4YM6Xt6ial1G2Y6A29p6h1O3IeDcvNQN
	bzeX6eYJwPUmD21q5oBxenxjypqk+2eXnXIbsySXvZ3Y2JxsFxsGuYhXgJmwtgFEY/nwxeP+cFS
	WapRn9fML+SHD0TICr5AFL1n5+HRZoiCSgfKCHANh0uQKeiNtFVMNpT2PU5mx2HxpF8Cig==
X-Received: by 2002:a05:690c:46c4:b0:799:3a3:2f25 with SMTP id
 00721157ae682-79acf67c2cfmr12621797b3.38.1774382511723; Tue, 24 Mar 2026
 13:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com> <CAMRc=Mf4gVhwUZ8t1jQ_ohX9dfGcAX7ay3WGZP+LmsTM87xL8w@mail.gmail.com>
In-Reply-To: <CAMRc=Mf4gVhwUZ8t1jQ_ohX9dfGcAX7ay3WGZP+LmsTM87xL8w@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 24 Mar 2026 16:01:40 -0400
X-Gm-Features: AaiRm53yjaS3XqrluSz7mPGhKsBUwhRbocFl2autndacf2K5TbU3vzsowbQ_exc
Message-ID: <CABBYNZJciviNAL_n4ce+Ncn-bHn1utcBj4VVJGFhpYMRZxrH5g@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shuai Zhang <shuai.zhang@oss.qualcomm.com>, Marcel Holtmann <marcel@holtmann.org>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-99727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: A28CA31C170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shuai,

On Tue, Mar 24, 2026 at 6:33=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, Mar 24, 2026 at 3:30=E2=80=AFAM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
> >
> > On platforms using an M.2 slot with both UART and USB support, bt_en is
> > pulled high by hardware. In this case, software-based power control
> > should be disabled. The current platforms are Lemans-EVK and Monaco-EVK=
.
> >
> > Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
> > cleared when bt_en is not software-controlled (or absent), aligning its
> > behavior with WCN6750 and WCN6855
> >
> > Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> > ---
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Let's check if the following is true before I push it:

https://sashiko.dev/#/patchset/20260324023016.3889062-1-shuai.zhang%40oss.q=
ualcomm.com

--=20
Luiz Augusto von Dentz

