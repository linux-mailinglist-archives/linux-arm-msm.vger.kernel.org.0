Return-Path: <linux-arm-msm+bounces-114687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 68vqCKWQPmpkIAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:45:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A066CE124
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:45:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BVD8uPN3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114687-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114687-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADD6230062E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2223F8715;
	Fri, 26 Jun 2026 14:44:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE83F928E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 14:44:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485079; cv=none; b=MCsVAfQEmLgr4bkwnxBDX/ytJxVoT4suF7ExZTVzsSjJzCKcAS2XoWu/zFoy/Q4E+h9AD6RYkEXouU/YOSBgEJADSh2bdbTfhDZd+7kOMdZdTBH80WXf/wd9Vy84P9MJnk4iCbCQbNmAHE2lsedmOEuUnnScmUDi+yUwg3YJOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485079; c=relaxed/simple;
	bh=wo7pqiPSksjfBjenX/Wxro0deCHdEvK5J0TuZLF/5UY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9+jdOmLp6ZVwyE3poSPyLcVLP4QuZCh1u7S4FkJG6zJ4yvVN3BpAmMWmUJENDG6RrWLB5QxYYxW5xiG+nZB0UN60tm4VvobTWfXuc5piuY60WQqa7tItJGIc8w7glLVs56hUXBEIuAQFabYn8s/9sMyOWnIxN125oNGak7pVqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVD8uPN3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E141F00ACA
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782485078;
	bh=wo7pqiPSksjfBjenX/Wxro0deCHdEvK5J0TuZLF/5UY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BVD8uPN3vhmt0tTw0rj494F8jx124fRzJEOPzknnpt+UojIS+RA447uyv4AR1801l
	 EJKnXcXWotk8q0TVzCl3xTH2SGjMWRZhmYyVq3zgj4Pp8ltjXOenXA9FjQobCEjyVE
	 N6IVR+t6Pe2eAOiHBKkQahrPf7G8jkR3e19/aLlzm6uyp5QYQ/ZaOLPw7sr3KiNJg0
	 +t7JBrUXF2i4RjfX3AWgH/bSQz/5dJFOQMRh1wOC63qi7kflaSWud9i8t4Qdr6J4F0
	 nzm2Huw3SqXGDEy8cXLIihvlvaO4lGshb97ke4DoaH/UOKgQSbn1cGG7wHX4E+bFFo
	 DdqY4O/i5UtKQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ad54546171so715607e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 07:44:38 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywwh3BsTzCaHngyHYcd9JG5y7Q11tS+/Uagrux20j1gM3OqRZCl
	z+mG/sOdHv6E4TB29xo/5RxbBTW88kuxvEyPC7ag9LzgWlw8EXxSQHKo3SvVwztwmwHW0d7t06q
	ilvdq8E3KjM+Ygxe8ixAzizEtmZbAQ6/9c6zM+rXbUQ==
X-Received: by 2002:a05:6512:1325:b0:5a8:8db6:b3d with SMTP id
 2adb3069b0e04-5aea1f4b9aamr2215524e87.24.1782485077659; Fri, 26 Jun 2026
 07:44:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 07:44:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 07:44:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
 <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com> <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Date: Fri, 26 Jun 2026 07:44:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+ZBSMaOYGRUKonA=dbNkHY3Ovag0J4E8rr8oESSkGdA@mail.gmail.com>
X-Gm-Features: AVVi8CdivKvRCew0jR-PMn3z_xAGV9V8TCmmlzMbwwdMXjc2U3bvSB-7dauR6_Q
Message-ID: <CAMRc=Me+ZBSMaOYGRUKonA=dbNkHY3Ovag0J4E8rr8oESSkGdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114687-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:fenglin.wu@oss.qualcomm.com,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88A066CE124

On Fri, 26 Jun 2026 15:00:36 +0200, Linus Walleij <linusw@kernel.org> said:
> On Wed, Jun 10, 2026 at 9:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualco=
mm.com> wrote:
>
>
>> Add PMG1110 GPIO support with its compatible string and match data.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>
> Acked-by: Linus Walleij <linusw@kernel.org>
>
> Bartosz will queue the patch, I think.
>
> Yours,
> Linus Walleij
>

I will go through the pending patches next week. Thanks.

Bart

