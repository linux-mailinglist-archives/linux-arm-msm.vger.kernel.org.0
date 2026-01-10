Return-Path: <linux-arm-msm+bounces-88329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE1D0CACA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 02:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52471300AC91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 01:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1981B81D3;
	Sat, 10 Jan 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1zGE/ap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C619CD0A
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 01:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768006967; cv=none; b=evLxhSnKyMe8JvbGmirMUcyIGrfUB621OMhOXKrGskuyb2/rfvy+BaG+wp7v9llV4eL8ZbEo74Gdk7KSMZySpY5nvNv0UPk2QBLpkauTf8uCPJmImTRRgfJc08u9C/lf/EHkgXjzp1B5lLR9BQaLaua9SbyCXuz4sfqEoudiRm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768006967; c=relaxed/simple;
	bh=ixJdBpkE90qTHpaWpqSYWXgG2UnXLGOifDLwOvD7fYo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJNTUtmkpZAr7NsnV1PROyATnek+SE/IaiTRBq/58Gc4L8YflemqoPFEh3ErxJX/UEBXa0+sBg1nn9JHNPNcanMhVMkCy6/t2myopShi7H1gAfeY9xnMBTtcFj5W3+nO7OAgVs9BDi7Uq+OoyORpBMaxJ5QJ+N4qMxBZlJcvzic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1zGE/ap; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2d7c38352so367576585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 17:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768006965; x=1768611765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D46mdQMDj5+zG9XaeLULmbTRXkuU68sa+3jgTbNzvHI=;
        b=f1zGE/apwKIZ9XuSlDBjitRepgmRXnjNFx5hCiGOdhcTpvuOTZxFe5NLzZCAScDzIB
         30KGjdOB49YmdDjm6fVMeYgXK30nwVDADY1cuB6ifSihuMwpe9aEASlYcfRIuT4+JVeE
         NqwyqTl5IBcjr+owxzZ8n19KlPU3sUeI0AGBYC5MtDUOIfiVr1tsboEhLNW6Vi7eSzq8
         FRKwZ0k5Ve39d6sD0mrG06ZhXSEkfqT6jpjI5daIjEnmfHqpqPeoP/hGWVYFX4jVXr80
         F47Ncx0/+T7g9MlN0h2JzRxRCaEZDrj0kcFtKaQVW984hkZdvUbcKsDAbGqkFBPMlx4/
         CwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768006965; x=1768611765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D46mdQMDj5+zG9XaeLULmbTRXkuU68sa+3jgTbNzvHI=;
        b=DJeOZGxNchowYb9EKzAP79t80F9bNksVvphpPBdcM4BpKu9htgi+9iiyp16EuM05zD
         kx0HucK7tUpmG8R0W86PtKd5Y4v17V9IQeszzldHhoouknhPnxo5JY66oOnGKr7nDlJO
         ENUS85ZTd+eBHETlKpdDCcsqnrazqjAWALZWhDjGnCvmBhbUVks9J0fHen2OhUNMgQmM
         11WtygW6a4a8Iw4Aby/bTU7Sf7PS1jFaJBS6b3pAnidvXFO4UkPvBPP+d5AelfXNseWM
         X4jMg5CUhIVGLR3fDGQUjIdywpZTLHTVosnn4us/+ZL7LQgoqljg0xerpRblXoE3AdWo
         bWjw==
X-Forwarded-Encrypted: i=1; AJvYcCUDEkJjERtA5EBpJCmG2bAPtbgNWe2WVylNB5RJnmdgCok4CiaVF6pAqJIOS313o1b+nGp56HzkrRABmFYf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+lj40OOA4VXhCqsXhvxj/U9K39wJAkdLKwbTlqkmQpnat5pe
	RA4IQNvoi9fTjRQgwEZ5G4urPC0DIpEbTlA4yE9PFgCHVE8rBMcwUEVU
X-Gm-Gg: AY/fxX5ThUN7Ic7UGyKcxzWSgw6rIsHOnhEzxW+RRdv8lOUeAuZcuSvEJm/upBNC9Xt
	QMd+SW2SRZiGoksXPm7N1GLOlP+Nr1si3QV5I118q2TEiz51uQkUx55rUMOS+XmlzzFdrDaFWfp
	mNWzEXjUms7E5oTwo9GvXUhARG0E4168PKHBwT4amHPFSyJPl1y8ZjqWIn7qMyi+4e850No0TC1
	kK+Q057jCSu0cWYGALKd4zTsQDUdtdJHuNKM7itx8Iwcb/Fb8/ytrunO7KSro7CMMJVu5jqDHxu
	8N3VBOXM6xpbTlggE48MLWpXtRMKgsTHhr96FrB9ogmuxTSbdUgwD2yhw73rto/icp14DtWfyLE
	f6I2yzQzeP0jypXhHhVGscQOk41rMRT1EFke/PWQ97UTRXT5Piz36kmf5DNELn+emZX1mffsLqS
	jj6lap5xD1HlUC1Q==
X-Google-Smtp-Source: AGHT+IHBDzRmIpO26TQmtd7BhHH/NO3lWFMVLoQAqkeDRXpg/uMd9p6q/2JbD1+tj8TUF+imdXBEMQ==
X-Received: by 2002:a05:620a:4805:b0:8c1:aadb:5313 with SMTP id af79cd13be357-8c388bd8ef1mr1683928485a.25.1768006964911;
        Fri, 09 Jan 2026 17:02:44 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51ceb5sm996870685a.35.2026.01.09.17.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 17:02:44 -0800 (PST)
Date: Fri, 9 Jan 2026 20:03:03 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
Message-ID: <aWGlR31aNYbogtrg@rdacayan>
References: <20251230022759.9449-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>

On Mon, Dec 29, 2025 at 09:27:56PM -0500, Richard Acayan wrote:
> This series adds support for empty endpoint nodes. It is currently RFC
> because it continues an ongoing discussion on how to selectively connect
> some CAMSS ports to cameras and leave others disconnected.
> 
> The SDM670 patches are for a full example. If agreed on, this should
> expand to SoCs that have CAMSS.

This series is abandoned now that it seems fine to add port labels. No
need for me to revisit this unless someone has an issue with the
proposed port labels in SDM670[1].

[1] https://lore.kernel.org/all/20260107043044.92485-4-mailingradian@gmail.com/

