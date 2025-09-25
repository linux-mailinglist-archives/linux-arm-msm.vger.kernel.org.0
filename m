Return-Path: <linux-arm-msm+bounces-75004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A3B9DFE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F8374254F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8379027281C;
	Thu, 25 Sep 2025 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pke8rIOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E76A26A1B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787899; cv=none; b=dw6M0wUgQf8wQXVO5M1HHttIkpTf7NetQJDXNGuc9Jz7LdXwfOc2jdD9YOjIl2mSnJbYClNnAOEZLQDnfY2VqqfrHbCu6Pq3fQB1Au2nv+MSlXC/Ob6V9mSbSmvWDDCGNCDSScfYAz5SYOgR7FWAU5jWSHOle4AdeOqK+b+syos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787899; c=relaxed/simple;
	bh=W+/kYER1IRsUkeiH4ntqE2QIk9MqKE9QrbIkOiHM9pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ReaGtD5sXP603zCW65BaxoLODHZNJ1FKMunuM1TpknNUrTcPFYKx296uRRtbF1vSZffp3+j1q2I8EWAdgC4kMBoAnMBTK2jvbu+ZvLvflVVaa1QxwOuKZ18YdVvKGn2TGOy7Pw6MmOBDEG+ktv6Syn1nq2NVEVbErd8IPGl2gao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pke8rIOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00328C113D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758787899;
	bh=W+/kYER1IRsUkeiH4ntqE2QIk9MqKE9QrbIkOiHM9pU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pke8rIOnVQ85T8hNd7eOMHh8U/9t1Gb5YtZiNU1C6ACfGPIVtpmr1ywABMkP1Ro6j
	 ftp4F4XJWJD8qHKMXtq3cA/iVjGdeXU+Y/vftInjntPjHnNzzf0QXw2TUBBoZ3IQJH
	 231ClmBhS5XfRtolVhF86jV3rzeZmnEdTKT0KG0aIanuEQS66rOwF0L+GPCAA6go8e
	 IDe7eggzQZPbv51l2zQjKot+v+BGMYx0Q5b41fql4/dTAFkW+Om8jNQlCZJ12ZqBLY
	 MJye6n9dPPPT6VJ+bMWyAlI0KUjucPFGmho2SKVjwTU9TFJt5nGYajhkv1ko1dDlJu
	 eAvBu+i/zLyag==
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-244580523a0so7968205ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:11:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0PkFqUZ2MM6ORpx+x3yeoJYBy/Ua7H5K7JbQ10FcYpleeZVAhOTmaKeWamhm225UtlHHQLUAeb9OfbVP9@vger.kernel.org
X-Gm-Message-State: AOJu0YzmVrkRXwhgS1IvEjawf35XNdBZVP3ODLHRc/oUSLK4AVf4Hewj
	QnmXV8MkJDMiF+EFjL6rAIImxQ0cytRYFxHe3MTioKcDjNLOP2eAn+YUUwWkSRRukarWohcbHXv
	hJc8CRdETLjYdfrLtCeq7EJi6VRlE9as=
X-Google-Smtp-Source: AGHT+IGbAuiORF+9BpkdHB59p6v5duKgO1hL+I+jyHlyPv5rCn3Ajr7ZmBxOh4yryNpVg+ltd2zyQZmrTmXPOtEwVvM=
X-Received: by 2002:a17:903:32c3:b0:267:e3af:ae67 with SMTP id
 d9443c01a7336-27ed49d2f64mr28786405ad.14.1758787898559; Thu, 25 Sep 2025
 01:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 17:11:25 +0900
X-Gmail-Original-Message-ID: <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
X-Gm-Features: AS18NWAQhv0JimMxhQgDVloVP7TUvcNlC0ny1abNsGZo2zbXF8_sU8fSOEst0VA
Message-ID: <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
Subject: Re: [PATCH 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe failure
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>
> On Glymur boards, the RTC alarm interrupts are routed to SOCCP
> subsystems and are not available to APPS. This can cause the
> RTC probe failure as the RTC IRQ registration will fail in
> probe.
>
> Fix this issue by adding `no-alarm` property in the RTC DT
> node. This will skip the RTC alarm irq registration and
> the RTC probe will return success.


This is ridiculous. You just added glymur CRD and you claim now that
it's broken and you need to fix it. So just fix that commit!

This is gross misinterpretation of splitting patchset, some twisted
LWN stats work.

NAK

