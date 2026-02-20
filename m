Return-Path: <linux-arm-msm+bounces-93439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGlPAz3Ol2kk8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 04:00:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2DE164534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 04:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8C143013264
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 03:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5FF2D839E;
	Fri, 20 Feb 2026 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVuzS3A/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3087A2D838A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771556409; cv=pass; b=V5FiFz1H10lsBKAabiouMEthylO59A0emhsqKgLjBADBTBMNen1lPlJZ7dmIA+rcV8blTbAxn8m5kqDaw7JlXE9bF8b/8cThfTej2PwqTy3MyanWdpq++gvdAMedu1XDrQ0qHxR74EeRoxE8coeUxMYv64/leD5kRVNQYXudOXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771556409; c=relaxed/simple;
	bh=jL5V55t1rEBj27+VWKWTlqwdAuocpvOVvYTKQbJZVCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CaSWizQkMqKPUZCr0R0MOEc8Oobamlih5oGgOPi53eH2hSHW4EnVAxUuRRvQsWVMBxCfxfUmvA5IkgnMcpQvhPs4ZlPnBYKNoDBfQCZjmQmOoGDwmOH+9iHd4UPEZxN0PDPFRNwkpY79aoBTfCYt8XCC31/RL2wW7FJ1shQFJFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVuzS3A/; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3870cbd6c40so14755291fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771556406; cv=none;
        d=google.com; s=arc-20240605;
        b=gVLSX0/7x0aEzHunmr+6KYA68tVXHKNvGUGVGF/kYFv3rBT4Ehhpp2KV/VYLnjlj1o
         GentPh7Lf0254bCszMYwWou1TKuvWeRe8G8FNowCrRkeCeooOsU8XiX2oWAe9cZzrNIR
         9oWrlvZG+E9L4VYpHcIvYgWOhQueE1fhW8rTUqiMXjW6F8Odl+1PN6k6cr83Tf4rf1te
         G0giLD+ZE7MXoVhpbRFtzQJvnzsRhVQIdAedWyNzfOMQhB4NkzKCC4lGIiCh2fQJIy0k
         X4QfEQyhMGAld5ddyIujxSf6e0Wifybl9VRhMeBcmB122MO+s7/tGT5/T+hnNlbxjQgn
         ewBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hKJq4SbZvV5Qnlwxk5U0/GVmtjJHH6p7BfIFLrvgzoY=;
        fh=giCpI0gU39w4y6AOI/vUp65hKRQV+m5dalksSwCdP1Q=;
        b=c69YQmEaEHcMszuQbi3RPTwEjoFuYtmPw0WE601903WWpF8g9aQQ3hIvT+iXqdU9oO
         PeoxxNAidJbcVuGYY75Eau4BSfFv3IziXi+SrDs4HDZh2uF9g0i7PJ/fRFYGhjHwaHhC
         ajAIMBmcfteMRB/3w2BGuO5aMBmAvO+5l1T8xQA+ePdlO9kyWhW2jGNzWtiYay5GlRIc
         tn9CqNn959FqGnHPkYrevga3KkYwQ7dUbz4TQPJNNRw9HfcWIJu+w54KzDn4EX57NLGP
         KVPR/isL7Q1EUv+k202ukJVHXqRKsYzlY262D2mP23gWWrIrPSKD5Z4EMli7San4vjZW
         8/XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771556406; x=1772161206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKJq4SbZvV5Qnlwxk5U0/GVmtjJHH6p7BfIFLrvgzoY=;
        b=DVuzS3A/taTGcwIrGFQp4IvIGh54AP88eAYOeQQib5mI0EigAvW9D1roeyn0ChNFC6
         EbCzZNwRhDhIsoeJHZh22bNg5WC9a3JDhz54Dl0ad0Ki2QPoYSarbbU/9KRSB3uiJzPF
         ffnqWE7WdbIJvGJSud3eUga85j9fNXg0a4BJ127AuhJLM9YOK2OhuO/lwLubvufSyZI0
         csGqfPfzTWeGpPE8JahLe7XvgvlG42qw441GE/XoTCPNVnRzvuFCgAMO5nO51aMeXKDX
         8mXaOG2fjp3T0JVzY8oyVtkRW98EC+nFtQ/XU9/YXIzLT171POcGZOTjZf8wjQr9L2An
         Gb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771556406; x=1772161206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKJq4SbZvV5Qnlwxk5U0/GVmtjJHH6p7BfIFLrvgzoY=;
        b=oil17XIVAFQx1BwwMz61MMDlJ+ClQPBGzOTe3Uowl/dnwCCru2RO0guwzkwvJ5XJpw
         O1nCOM5OZo4yBeaCsiKxto/iSpmJvBt8P/lChZEWa+7LecyqWbH5FhdxmXldWzHv22VT
         KTF/gMMofe08ntA06ylavjzM0yFMr+OXEuj9HKwKvQvPO0hN1ITfPmhQc6xCrwKMUqwu
         aevKJ+X0mnRmIgBfgmyCZnGx9cPMcy0DfIxRvncAXVx3Z35u3RV5ZxauA9ru5C5yrGXK
         9X0npvZIXYHvwSKSPXBoTUc/s3scc9ZLfhRamv4JN1Q768ZGW/lhjGnzyN9Ff98IklYA
         ZJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt+pafkB90zNfVvGfg2YXvDpXYLnR/NWXook8MthEBVMjp9e/vryBt/pAQz7zO1wNUlTrkr01dKX2MQ8AX@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcq5RKVejWuEYA07RagVj3hudqpPpid5IyGwmhQgIY4u+Gws9
	MjBvl3NY1UQuCOvTEsV7H8tksfbMcaWochv0r7bm0WxSlHGGqftcM4jB908jxRK7HN1OOtk1+Wa
	Ytu9JdUjGH/WzNzQQUoQtQgWIXQT7oSQ=
X-Gm-Gg: AZuq6aJc0kdbnp0ZlAYggAGEH42CCo2WfsjvKKJJh6Qh6lNtbQgF/Tk2J65s+/tcFnR
	LcX4O0bKCWR4Z3edVUT1J97fX9dgl3S6KFGhTxxo2O3iH/pUdcoGs800OhdVeim/SMc8NhHyDL4
	oqYVjV6RuSQLOMlBVuXxo235KiCWESWK113oyRNxqyR/eT+MZ1Km2IGL6p2dJLx9ODL/i8D9nwx
	vOJuAnCPvrrH+/yHsebsnQ5w5oGd0bWjVUr/2P7JUYHElJpxtlWmS8m679wG0fzNhRNT+9psKea
	Pvz6bNRPUNaLQLhxwHJgdMrxgavVIUtNE68Fgl2n0/2jgobuyM9t2STq6ZQP6E4WKIzL
X-Received: by 2002:a2e:bc02:0:b0:387:14c6:53df with SMTP id
 38308e7fff4ca-3881b997fc2mr53665881fa.42.1771556406012; Thu, 19 Feb 2026
 19:00:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-sm8550-ddr-bw-scaling-v2-0-43a2b6d47e70@gmail.com>
 <20260218-sm8550-ddr-bw-scaling-v2-1-43a2b6d47e70@gmail.com> <20260219-cordial-robin-of-performance-5fb88c@quoll>
In-Reply-To: <20260219-cordial-robin-of-performance-5fb88c@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 19 Feb 2026 20:59:54 -0600
X-Gm-Features: AaiRm50qTrqt8BSzzi0gs_vnlSMTOnmf8SWXzlWyfspsagrgKunuBjfwtusY52U
Message-ID: <CALHNRZ8qEJc8OSsrvCQC76_LjxA7KunrOonvSfq8bsFdYnKE+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: interconnect: OSM L3: Document sm8550
 OSM L3 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93439-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 5F2DE164534
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 1:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Feb 18, 2026 at 12:16:18PM -0600, Aaron Kling wrote:
> > Document the OSM L3 found in the Qualcomm SM8550 platform.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Your changelog does not mention this patch, so I assume it is just a new
> one?

Yes, I forgot about this when making the changelog. I had used the
wrong compatible in v1 and setting the correct one required adding
this to bindings.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>

