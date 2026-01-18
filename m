Return-Path: <linux-arm-msm+bounces-89542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB103D3992B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 19:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA3973009F5A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 18:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8644130100E;
	Sun, 18 Jan 2026 18:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGouaB3k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F225E3016E1
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 18:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768761433; cv=pass; b=EQg6fYJR75lC6iZZgWkk7Giq5h1aiU3LSn7sfBgH3ne6e33t8Ki3A60sf8FjvDD+g02sQM8Nc69Newq9JnN8HP7znOsdTB1zIChU50uKy992lGp1CnQNGO4rGCQ8pVmFSfasR43Hm1k6XJ3G0ZaJKHRSmtFJu8e/rLYClQkQiIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768761433; c=relaxed/simple;
	bh=FafNYUVdaGzrXDndD0nXOLhWN6HVNmsTnD8p1x+z+c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0u9SW/Tfz14vdoHHP4wk8UrDVEYIlyV6tYz2zbL0n9LS1dUusmMeUVDO7WflbRflegpD9f9SaXG8ueX41PkXpVfOfsJR0HBFgvZ8S6iB7nZ5OW8A3wa4k9tSrG4MGVtm+DeY/oBVk0pwtht0FTMDq30UGz0WQKqPti9lBy/qN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGouaB3k; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45c8e85deffso1235119b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 10:37:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768761431; cv=none;
        d=google.com; s=arc-20240605;
        b=BUj3AKsScw1sDI2dvLalpWMm0hRE1JwKpWFct5q7UlrChYTwrpvwwhpFtbD8H1gSCW
         DWCdOhV1mNqYcXY1WgGzrI+38+W2uydsNOt/rfL7FTULzbdqEACtHLrPWtw1hHtf7yGD
         eD+Uv8R5zF1NalBkrgDzZKhAMohlKw60zk7ldRjQgePVlTB3yIZjtX3B6y8uNfc4O9ve
         NLc19uFewXMHI/l1njSFkATVAw8a137IFfKAC+OJme67FAIgJj0rKw7/vT4RuzXct0G6
         E39imVjrToZyWZvblRT/mv7ei5nW3WYS8GCaWIZWylMZZ98qJs+iRvxM+Gfg6Rg5spbs
         XkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tSfCZRWiq+F2guXeIq82E8iOGM2R1T/WtMgXIZ3rrvo=;
        fh=YXkxh8VhABmRLGqi6eSHbHv1t/vP2kpsO6ib+So+IU4=;
        b=F6Wsb8vVAZJzknJNDpadsBesNJV81MMjpLqgX7fdFFHrXiQb6ieL819tvCMl6g2NBX
         avNIV4rBx4TH3mbMTCechX/Bf+UI1XhvBwT5K9NhPT1HiUlwOK7mUYTcrE3FhFCnN968
         0WZ2Ayr5RNc3uYHWlvkJN5L8Ht3Gqhd5zliWnTPf3yhmQvIiJ2qaUn3nAaLtMWXZju8L
         IeOjlsRpvvaHqswPBmUwO6lJwHnhTYGJ+KBUMhLAPxgulwyrV2joUAKxACVqJ4WjuX0M
         fthuykwgp2DKAhtA66qiGUcHVOiB4rbPdnkDJe59CYFY1Oh/QQfs2QQRf7KbOF7OFr2E
         uGoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768761431; x=1769366231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSfCZRWiq+F2guXeIq82E8iOGM2R1T/WtMgXIZ3rrvo=;
        b=DGouaB3kbJwOYEsQrPSLEc2J2gM0BwyBxfJoqk5zttGbLqCiTQxlpa9kK2n/XC3C8H
         8WWTFWQ2L47ZQUg5jlBavyAmKbToPNjyRbbaqmtoOpX+XbwlQZYCB9Dzr21ts2HKb5Ru
         gn8Keu8khvCvdd1HDAHmAGalQg6u94LKlJprTzWJmFuixwWWSQ4db2I/xBZq6sDbbigH
         hQKbpVA+04ScIbqm/jzsjzR9eEC7keSdyN5XnaLrzdH9RwIy06CINsfdayPDjjy9bJhA
         7r8m/8F77d+5/iM/tm+r6JvWHgPMgpQrnH+To5E46wXabfAMihM1KWgyjBYEMyIJdOaN
         6VCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768761431; x=1769366231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tSfCZRWiq+F2guXeIq82E8iOGM2R1T/WtMgXIZ3rrvo=;
        b=JfxtvfV0E3EUQVOgLxzrdIGBVrjP7KXIhCkH2Y3kAxstSoOe2S5roPwv4DdTmQkdRN
         iNB07LjXL296lihvazmTH96P9HiiLdZPrwX7trDJMTnaKRYO07gIJEfUJEsk8iXn7amT
         AdhQQEfOYJbYTHYZMuGAUzygAUO3aP8LGRvnNo6XgOImsTX3cg8C8e11ZUxS7B+qYf2z
         l5Esk9SVN8W+SSpGy3aDInmawbvy/032F+/PLjdGl8wj8/GbWmGSBvs94LxIfnydP9w0
         +Zy7ThQDXXodLnMMxSOqBxhjQznnOZ4xvppY+eVT+OcQVKzhjhgQj76Fnq2Z4miqC+QR
         U0TA==
X-Forwarded-Encrypted: i=1; AJvYcCW1XBw37V0HfR8QCHiO6NX5Vq8quFXW4qeY6B0/HmfcWgnCgrpGp4Y86hU1q3y+xpKvUyMunyNovZboK2Bo@vger.kernel.org
X-Gm-Message-State: AOJu0YziCw+W+QvjMMbnMZ5MMLfWmm3nNPVfz5VZQUcsYg/MJ/zbK9/Q
	NvVSJKJG3w29KX0/8JQpGcXjat6kplFhk4//6LLotqaBUfRoQ5m2ESBNl3/1HzkWE9W7HcTlpGX
	kEOei7iBvuATwj0b5gnDnLrA+tqJvxnk=
X-Gm-Gg: AY/fxX7N2KkpB6RpX96wIJFJRw9tmO5n9pdDMt9L0L9+1RkiW5bqdCffk9uW3GK4+9k
	MU/jgEIMybR6MWgGM2m7jRKkXu7qdr6K3mbESfVY2gcS5ut2w0c2eCMuimj5qOcvV/pTvoEeE11
	1ObjGvIRMiTQQYDRtrkgaOUupIRCX81AQvMUrDYEzSd4+mhHaORcmgyneLH4TqRgrpi2A6xyWbw
	IJ3thtRk6h8zIYTwPXcxTU7B8k6ReQb9NbxJjXdyF0LpY50pRiv6DqxnmPd9krDPmaeqSw6
X-Received: by 2002:a05:6808:1803:b0:450:d056:e0f0 with SMTP id
 5614622812f47-45c9d6fbd2dmr3104899b6e.2.1768761430702; Sun, 18 Jan 2026
 10:37:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
 <20251031-knp-ipcc-v3-1-62ffb4168dff@oss.qualcomm.com> <20260116162057.GA1681736-robh@kernel.org>
 <af235d3c-cbf0-4cb9-af3b-37c1600d421c@kernel.org> <CAL_JsqJyRa-U03XvPNchpoyYNmSJQacrYs30yd=a_s-6PnppSw@mail.gmail.com>
In-Reply-To: <CAL_JsqJyRa-U03XvPNchpoyYNmSJQacrYs30yd=a_s-6PnppSw@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 12:36:59 -0600
X-Gm-Features: AZwV_Qj5G-F3L-j94OKUIlg3HGOuNjgJrkJ24hCuEmpYd9lziCqxW1g0Pts9gpo
Message-ID: <CABb+yY3BczzocDR_Z49UO92iF9KLjq94EJZ10qy_aga1GrSBvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali and Glymur Platforms
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 11:13=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Fri, Jan 16, 2026 at 10:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >
> > On 16/01/2026 17:20, Rob Herring wrote:
> > > On Fri, Oct 31, 2025 at 12:41:44AM -0700, Jingyi Wang wrote:
> > >> Document the Inter-Processor Communication Controller on the Qualcom=
m
> > >> Kaanapali and Glymur Platforms, which will be used to route interrup=
ts
> > >> across various subsystems found on the SoC.
> > >>
> > >> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > >> ---
> > >>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >
> > > I guess no one is going to apply this, so I did.
> > >
> > > If your patches don't get applied, please chase the maintainers (Jass=
i)
> > > to apply them.
> >
> >
> > This or it is an effect of known problem with mailbox and interconnect
> > subsystems - maintainers never send notifications of applied patches
> > (neither publicly nor privately like Greg does), so you will never know
> > if anything gets applied.
> >
> > This as well could be in the next silently (wasn't in 15th Jan, though)=
.
>
> Further investigation finds Jassi did apply this and 3 other patches.
> Stephen reported a conflict on 1/6 with another Qcom patch
> (conflicting with Bjorn's tree). No reply to Stephen, but *all* the
> mbox binding patches were dropped.
>
> Here's what was dropped:
>
> f8f632c18c32 dt-bindings: mbox: add pic64gx mailbox compatibility to
> mpfs mailbox
> 945dc11a38a0 dt-bindings: mailbox: qcom: Add CPUCP mailbox controller
> bindings for Kaanapali
> 66b6e5daa915 dt-bindings: mailbox: qcom: Add IPCC support for
> Kaanapali and Glymur Platforms
> 9a92e22740e6 dt-bindings: mailbox: mediatek,mt8196-vcp-mbox: add mtk
> vcp-mbox document
>
Yes, I had to reconstruct the mailbox for-next branch because some
patch had an issue and the pr was not merged after a very late fix.
Sorry I didn't realize people not receiving pick-confirmations was so
problematic. I will make sure I reply to every patch that I pick.
Thanks.

