Return-Path: <linux-arm-msm+bounces-94287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBniJy41oGkqgwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:57:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C391A56F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F19B630068CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67737376BFD;
	Thu, 26 Feb 2026 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nf2AFPcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4B33126C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 11:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107051; cv=pass; b=sqpGnDj40M7fduSET9G/rsqvfI99yVSbihAmHCcH1NmZ745PjLJE/kdwzNonuA59DynD0C6zK2lL7qA1w9oDawKeY75WR0gt0j1mhOHJ4TXTbewUXBwVfNege/rCm69XnD5S9u/e+SERCuZyod2OCXg8HvRr2DjdpItZwwmYg5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107051; c=relaxed/simple;
	bh=6FiGG24w4rWgq/anDPb6u/uv7fyPhukOB6jHky6buQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sg3ZP4b8Z1sV8T7niCUygCaEdWcMfmlWsz0ScIK6AQCCxash4c8/8fiR8Y56no52q0sQIkrj9enDqCeWpdNf8goJVMHivobv1TMgVJBf3xEH10ig8B/4FsTArcH/upmp9Cq6u/1iorwIvGBLz1HRWhQGyPFOY/LTF9pCbmo6hUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nf2AFPcM; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ff10630b18so189098137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772107049; cv=none;
        d=google.com; s=arc-20240605;
        b=LfSn3COoONlILoZlGit4AbHLJTqt1IKQlbIK8UM6umCDnxqC1WS5+6zVfbFn2rmS4A
         HAIfPSGizN0woX2Jn6NFul6BcxmoxCeX0n1HafdzakvR13HiqVqGF0x/XueWmB7Vz5Gm
         xgkiYO5uPZHMcMz2UM5YS9dP3YLxi6dpMzUkd7lgHZJtaVRa9t7/5fsjw4q6sVi8A2Yh
         nsdgXMy8d2azDtJMlZ4Hr0v8RKOGKdL91PbzxgxM5zR49R9R8kD1Oig5AEaeKDNXm2rW
         fN1rUFd4z5sxxpcG12YHQkTD6JOZ3JSunJvQn8eD+GBJtmET7v62PBTmZAEDgn/+MXhc
         bMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
        fh=gMA3zIEqMK/kZytXcgRMsR1Bp946M2m40/Zjc9PLIcA=;
        b=aTirsxw8dvbwZPYkvXV920teZf4YITyN7HNthr0M1Bsak2oT7fkynbNSdo0d4kzKKp
         CeVnfunjQy+bwTD+snERJz8Z/c9YI9w2yX0KeOdLrCiPWPae63nC9JAcHrEOc1B4+3Rk
         Osn+UOHIx8w9jc/FDa5s6+i9Hi32sa4fY0Kd4sjW09Fw9bAJSjNgOQ/hN5HrNRVM9z5r
         spqn/RXxvNQ0lZJznD86DyrKMXYQigCejhqaHJmP8yHjq4CZUNz8Z2D6DkLyRHT9/PQ+
         anPGg0JVlsHr1Bqc+OZm26C3cncPUHO8CaABfsNrR96panMJlEDplnIeEDcImFixGRsN
         fhhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772107049; x=1772711849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
        b=Nf2AFPcMAKf8kPBL4AqoVnwcipoSXaK+B3hiplH0fiY1C04dmLfVYM7xrFy7agh+EH
         q130aUNbWW8qrJNn//nn6uf7lc+iakq35YpIMkucpPY5eX7oHM4nHRN/U2QMxehgKDbJ
         M9biFEO9RVrmqDAvHHidw/PrMlI0Do/4CBdx3cnh/JZVHB3ZJCrluobcFKBFvRronMxf
         SBTY3CWumRkOR22Cfk/UhYGPfs++XoikFCHRwVRj7Go5T7Xok/hVxb7CigyomMz5hOzJ
         Qg1g7Xl0FSaCAGu9xj5uBPMWeE0wQboY0D6kaJuDKbnGsSft6YhcYtwvnPVcXjOmgQqp
         Scmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107049; x=1772711849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
        b=MUL/XAa/R7I6SPvFy4k8qoU3QyRRXgarZ9r+wQ3sSpnRolfLVgZyk2GNVO9E7omB72
         LlxUpSsKUc0s4iCZshQLNyMuzU1segzvkJGOTjxLXj8Oyzofo87yBoNp8JpdveCG6nkf
         7Tei0JqL/Wu4aoqBXvjXQhCQ+BmRHreajWrFT/gw859Qkjc3fKtPphdf2DtxZpRRk54F
         WSgye1R7zEaKWkUVpOKqWiR7oQDrx+OkTe9c7jQg0MS8bVazOWN6TsO00ZEnyeefmC/S
         xjn+9n2wCIYN526xsj2pfCp9Zuj1tq+gT59uRg544zHW4LsLfM0DPjs/ZDOWlgtIguYC
         UdwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/IllDXVo0p9ikb2rYFNjrfm2MbyA1kwAwrPke+q7V0L3hT9dOYt2wCSpHPJoSntzKAu1RUiwKqfBlcYBP@vger.kernel.org
X-Gm-Message-State: AOJu0YwOXLjbHoXtagZQh4ATL9KSVlf07REk3GxRq2zVI6zboCB2deZ/
	mu9oRopc6Vnf96/4kbkBe/umcQA9VtcZ8420BZo++2E1Ly393J5W8gXvIjyEos4phaTwtMv6OQN
	5ssrRuOQVirQj9Td47O5GTsI3ARAjnDw=
X-Gm-Gg: ATEYQzwueYB0GNs8HsB01kRfoy0I0KJYzlhrQ5k45Daut0yZto68Sd6Afo4MvM1zgKV
	rINMgqOP4Jwv3LnHizecbGrf7GIm9M/PNemUX4t7dLaeepLTsLOxRgEboCfJbvbXVb5Esdd96ls
	eRHbFZaof4wkdjn2zkO5jniA/d4XQsoWWEehuA31VqWbnYpGgUZB8TCXtyiAjhaQG5B7XNZQ+G7
	lFy8fpsvHwVui4bcZPX2mAOFtScJpZOnCK5hfUwyXuRgXvHEHIIlSgWMZcwmbq49+ndj//19Rjc
	Pp9VTHI=
X-Received: by 2002:a05:6102:c8f:b0:5f5:3c38:c4bc with SMTP id
 ada2fe7eead31-5ff140aac98mr1601764137.23.1772107048800; Thu, 26 Feb 2026
 03:57:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225054525.6803-1-mitltlatltl@gmail.com> <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll> <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
 <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com> <rwsaypiovv3xtw5pfxw5rksmqetv4mogu4yy7yrm7gfknezmuw@bh6v5q2zeuiy>
In-Reply-To: <rwsaypiovv3xtw5pfxw5rksmqetv4mogu4yy7yrm7gfknezmuw@bh6v5q2zeuiy>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 26 Feb 2026 19:57:12 +0800
X-Gm-Features: AaiRm50VYYJa11U6YREQitoe6H7Afdc4A9v2yu5-PwbhgzvuP2StWI1hICwfKV4
Message-ID: <CAH2e8h6HCBpMfuzE-e2sOvE0SF9w2bgci68mxENP9J7cExp1yA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
	White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94287-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 19C391A56F4
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 6:56=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Feb 26, 2026 at 06:44:02PM +0800, Pengyu Luo wrote:
> > On Wed, Feb 25, 2026 at 7:02=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> > > > On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
> > > >> Document DSI PHY on SC8280XP Platform.
> > > >>
> > > >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > >> ---
> > > >>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | =
1 +
> > > >>  1 file changed, 1 insertion(+)
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy=
-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > > >> index 9a9a6c4ab..9223af1f4 100644
> > > >> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.ya=
ml
> > > >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.ya=
ml
> > > >> @@ -23,6 +23,7 @@ properties:
> > > >>                - qcom,sa8775p-dsi-phy-5nm
> > > >>                - qcom,sar2130p-dsi-phy-5nm
> > > >>                - qcom,sc7280-dsi-phy-7nm
> > > >> +              - qcom,sc8280xp-dsi-phy-5nm
> > > >
> > > > Your other commit claims it is compatible with sa8775p, just like s=
ome
> > > > other devices here.
> > >
> > > If that helps, they do have the same values for the REVISION_ID regis=
ters
> > >
> >
> > Thanks for confirming this,I will add this to the commit message and
> > fallback to sa8775 then.
> >
> > I am curious, do the PHY QUIRKs in dsi_phy_7nm.c reflect PHY revision?
>
> Yes
>
> > I notice
> >             REG_DSI_7nm_PHY_CMN_REVISION_ID0       QUIRK
> > SM8250:     0x00000014                               4.1
> > SM8650:     0x00000025                               5.2
> > SC8280XP:   0x00000024                               4.2
> > SM8750:     0x00000027                               7.0(*)
> >
> > (*) SM8750 is 7.2 in the downstream.
>
> Please change SM8750 to 7.2 (and SM8150 to 4.0 FWIW).
>

ACK.

It is exactly 4.0.
https://github.com/OnePlusOSS/android_kernel_oneplus_sm8150/blob/oneplus/SM=
8150_P_9.0/arch/arm64/boot/dts/qcom/sm8150-sde.dtsi#L518

Best wishes,
Pengyu

