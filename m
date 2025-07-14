Return-Path: <linux-arm-msm+bounces-64875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A2B048C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 22:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EA2D189E366
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 20:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C68238C06;
	Mon, 14 Jul 2025 20:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hdx5CKLj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6792376FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752525588; cv=none; b=JqWA2LdG26fSozWzSmjdOa2SUuZW/enEsGwk+WIn4vJjuJaCnSiIKShk/7GztKUMmi8bpfKXxcpVpHgp7fef+oB2ogf71MFkNZXnTKBpd0uhiORjY5Jn5mcbxHs+MXA5ahDMIeEFHhEUGFhP+yEU6FWbaDS+VHHTBR3C1OeU//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752525588; c=relaxed/simple;
	bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJRf5j7GAc1JwNTfi8VPVVFEyNFrVkzZTe+Vxg/krHdY9tOO2jX7OzxaOnU4jIbRRVNKoqNvGqFSeDDqlHsJnm++xddvncchjLMhS9k2SeFuMnlJ1hFJuaxmY+MQqUTUGrz99MwQciPZx9cfhKZPPlhZNtb3GDy6PEsihtQqfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hdx5CKLj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752525585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
	b=hdx5CKLjjObDkhxfqqEyk+jHihqqe1FXkiYcBMON9SEMFMKDUdcwpPr6+nasye1xoN82d7
	8WO6JzeO5tRFzhETQx7NXyw7JJgZWrZ2/Gwmm/gYuP/np6lBHfcVJIOpRoiU6DELXY7Zrn
	8FSrEovlQ3GxdHmXFowCAcF4e52TtUI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-SADK5_HFO4ezt5OF6XvrAQ-1; Mon, 14 Jul 2025 16:39:44 -0400
X-MC-Unique: SADK5_HFO4ezt5OF6XvrAQ-1
X-Mimecast-MFC-AGG-ID: SADK5_HFO4ezt5OF6XvrAQ_1752525583
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ae6d6b8eacbso351991166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752525583; x=1753130383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
        b=TA7f35mAbNeXfT1GoF+3hSttjlHnDtdsTPsUwM+N3xjpAYDbJR3jywACNdOs8WtP0A
         zTrH4W3jwtLiiYTeGQJzFddd++iWksGpHvzWrIRAmewXaDqzDTMiriy/3ieOJvrTWTif
         eYq58he1aEC1r46FzWinDJX2dY5TcZ5oFsN7WBw4jnkAzOaHBmbc3FoPcXYwNMsuUuMx
         84Qw9u4bYpQMQ1nsOYrp0Mciv1ziErV3/fnBLKMT9Ln/kenK4LpA3N6V1QvGYz+QVeal
         qj86zWK82GLR6p+lYrAjk3IxDqITCbpd/WL2ovg1a+Ybvp/pvRHPmCNp2Qduc86fXpum
         Xo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCrWOxyD4Ryt/PT2oTB4Wa+UT2qYnfxLl4HiZluFz77Le7yJVBQtpz1wcHic0ydhVK+iRv3Z/bhebpibe8@vger.kernel.org
X-Gm-Message-State: AOJu0YyrECd7pVDKGLJq4bHRJLrJ/wM7o06UK4USg1BAvDz3uan8Cujx
	AeSb/Seb3F69N92tFXBZFgzaYuQIoQGrKmJW5Yem9I3pXekD2hJMtXIrIIviRP0yURBOHFhM3pP
	v5S/sPl9j+b0TWcZQ9W5OIOuzItbRfGv9zQJbkKyHk1LdrnDh3h9rZHx8DURu96rPhC75+lWrQS
	npcXu/sirGxR8IZ5ceyMfMprR2ZzYYxejpNaGts8hwwg==
X-Gm-Gg: ASbGncsdCypwqOyhI/v7W8ZYxtq7Ljzf7vx1cuJ7XNIRa1imhSGjgQQAq2ZJayRJMVA
	HsoUQUvKFtOoNEp7tZu3oasN/94BsHYTq5ty3U0RerCGE86bEQYpPykapA3Fj7RZ873cN3tRETH
	UMfasSjMiFtx7z8BvA/iYr
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id a640c23a62f3a-ae6fc6aa6dcmr1561811966b.2.1752525582626;
        Mon, 14 Jul 2025 13:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtOtCIDm5iIRXUzH93pKL+mJg2YxukWxSYyuAjAlCNSpCWGK9PKhS/khXgGAJEgay188lilBak/nz6CZiqGvQ=
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id
 a640c23a62f3a-ae6fc6aa6dcmr1561809066b.2.1752525582243; Mon, 14 Jul 2025
 13:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com> <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
In-Reply-To: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 14 Jul 2025 16:39:31 -0400
X-Gm-Features: Ac12FXxNfqVieUoHNPgnW-EodFqKMjypw83pf906bEoCpdOuQyrxKsmWcymmig0
Message-ID: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Thu, Jul 10, 2025 at 12:09=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 7/10/25 5:51 PM, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> come to think of it, there are a lot of drivers that can not
> do any rate rounding - perhaps we could introduce a NOP implementation
> in the clk core that we could reference, instead of copypasting
> int foo(...) { "return 0" }?

I'll look at that for a second round of cleanup once all of the
round_rates have been removed from the tree. From what I recall about
the ~200 or so round_rate implementations in the kernel tree, there
were maybe only 5 or so that cover this noop case. QC seemed to have
the most from what I recall.

It wouldn't be hard to make a Coccinelle script to look for the noop
determine_rate() implementations.

Brian


