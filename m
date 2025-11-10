Return-Path: <linux-arm-msm+bounces-80948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E20C45B1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD4AF3B69F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5FC2EB846;
	Mon, 10 Nov 2025 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eXjTAfXV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B790193077
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762767810; cv=none; b=Ln96XYPjnvdFoqIXT0cgV6wzmlWpM6X4b/liVg96m+PsB1xY3bpxvcCLIZSZFg/UWXatCryRVcTugUJV+djE2X6Qgl2yw1nASm9sxUbqQLMtWdoG1tqptLdT8lvVauAmxOijfzdkRa3uL/f0bComFfshlhh9lcqjHvT8l2Y1p30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762767810; c=relaxed/simple;
	bh=VQ6/fZmPrvB7qA6vpno+guzDiFQYAH2t03L/Ew0dBIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BoM6q7d1OLjynVwoZHNyQnfdkYe8FPO+3F/55DBe9EXHbFccM1IIJAzN8BX0/csSAa7VXN1vmWQ9ooRpLzQA5NLEHqvzUk8ZM5cVZvuAwZ/enpWFkT030FawWX0ZRZKPlFExB232FnHWc8+Eniz9CAsBpwtjDj8cbJNOqIIhLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eXjTAfXV; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-36295d53a10so21736701fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 01:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762767807; x=1763372607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpfkUQML/MBOUs+dxtMBj7gJeTOySOYgrh9cTXWXGS8=;
        b=eXjTAfXVwZ/prQTUAcg0AN950gIC0w1tqjmWWy2X0z7ti294XrUXb4d3wbyXggSM6h
         pWk6SIYEpXf5bjoAPD9FMuTkc/F70WpzVMk8XzikJpxwr06hhlVbHG4R5YT/2Al97T/g
         acCHAmhvtB0tor96zeQCwfvBZDEKpd+YY3xKQJcjypnagYNMHMGz5P/BYgtRPisyU8d6
         Oad/rdkhJOjaC4DmqylB0O/cePI0CB8KiHiQdjWX708FHXInLoxA4FFB56JVp4pfg24e
         V99bX/X11NihIifdrgL3QWPh7z+SINKYeaHPLjGgbzWliEhWA67Szw1VixNibjDWhE0V
         b1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767807; x=1763372607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NpfkUQML/MBOUs+dxtMBj7gJeTOySOYgrh9cTXWXGS8=;
        b=GcTRZVt0VVDXyONfyHIowXzVKjpGcDTvHmubOseqDExcsW3eSCV/GmhY8Q2b29yB+r
         /EwAUvy3i/H/zv2LWPFfn+59mwM4F60PL+y+vEZD4QXdKPpJzdG4UmVL1bRAGc9toK+h
         RLNkW9cgpnfTEHQAl9+VGE9PQ4dLEMREiRGKGlmHbNC4b+XQGL2toSDxy/nJu18UTXe3
         Xm9gUcNeQBZSCVwWhjxkEbUjpx3cERqy0/DbeK/qhCXop9JYjV8MYjNFHrqLTX65m47x
         nrLWRcJ3/xp/Ja/JnqinWaBtMpRd+oEOZfMq6sRL+Y6YwKeE7Y//8HASKHAMCoif2uX0
         OSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnkdkhKDPn2qRtHpRBgPn/B3O16YhlcrAZ4hPw1nR61k8iOacsxQArjLNyN7w8kx4MvkQU7QkdA+2AtVUo@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEPUkLnXbZA53pDSQGxFOTXda+CdIr5LTrbb6+QaBuDkAyx2R
	5FVD46BfJpUmnbTW10YsuyW7B/f+J/5ctNKjCAWlUcDyIJQ6Xkoz5A0Q1e+myarv0MpEoWJ0+uW
	5uKRQO/laE94D2X/xdqlUULCD9c9oJ4rtVtksCNsOVw==
X-Gm-Gg: ASbGncsydQd1DCGSgjHa/pl2MADQBMG47LpglbcEvly9txt+3xOm6em3AP19vM1WhWz
	6LLPD7ibANHCScfB4jndRHTBY9v0feQRJed0/CZQKJIZ3RVFR68ppBB2kL/OzxsHBhApA7hWeX8
	Kk/yya9hYRgE+fKnrVpEbJV6C1vTlJtNNFgswxA44hkILk4K+LfwKkPebn6gdJci+zuPH1crw6d
	QG+mz5kGRbpvEE2S3kLo+h6Sx72dS0/aBjSoZVdtk/PxgDSAR0CHElP5vkal9e2n4H7MBMvTLMc
	8KNqzAKVjxsesL6eBdKZgjROPq95
X-Google-Smtp-Source: AGHT+IHgQciVPQpfcLaTr7J1ezPo0RXgw/svQahgRjh6TaxhfoSliPU4qSC9XOOY2ROeQugwrfeNkmq+pV7jc15hMK8=
X-Received: by 2002:a05:6512:23a6:b0:594:5206:c1e2 with SMTP id
 2adb3069b0e04-5945f1fcbedmr2111007e87.57.1762767806714; Mon, 10 Nov 2025
 01:43:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106162430.328701-1-marco.crivellari@suse.com> <176275881845.11063.4284661115624687.b4-ty@oss.qualcomm.com>
In-Reply-To: <176275881845.11063.4284661115624687.b4-ty@oss.qualcomm.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 10 Nov 2025 10:43:15 +0100
X-Gm-Features: AWmQ_bm3FNiy763e6HxI-D87P1o2nsjy8IiM1WAZisUGNsfLYyFUSc-C91tcc10
Message-ID: <CAAofZF4kvMqf-DfahwY3sSKZn-rHcB_Gf7mVqDB0fBptgOA=fw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 8:13=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> [...]
>
> Applied, thanks!
>
> [1/1] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
>       commit: 9e24bdfecdb071a3a42fb74be1ab503c958e2740
>

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

