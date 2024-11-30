Return-Path: <linux-arm-msm+bounces-39735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF49DF217
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 17:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A52162AED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 16:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351881922F1;
	Sat, 30 Nov 2024 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="DagGykFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569431586C8
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 16:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732985715; cv=none; b=Vy0pyaDg6CVkZLblMbC3/7JnlwEQU3Pz2N5YRuKF2nbj959N6WUL/VgRdRMB0y5FRubLyYYzwZK9Ra53WUZ5KACUkNdduY11VwbP+VmnDATkm668Bl1/V+mrZjs3ZOZv5thJM3ENoFJv4w3fzbG72Wwz10aWGgj5Dh4EOAprQIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732985715; c=relaxed/simple;
	bh=6b8dwwzoDtPzKi5hwA2f/Ha1FNt8Kzg6K7AtuxiLD8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GO/ex2qu+aT8NA6pdVVxXhT2ht/BDDr3hpHv04kHGUHGxiJJ/ViDkk8ianTPCcueUPlpkHBJX7+AlGY8Yk7DFUkXRNwlHHaa3gd0vndUvVidfIBRBJNWaZQBzCzKX5DGX7OFkNYJUY4wdunomYVsYbnYyozDp9QsOATXPTbyBGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=DagGykFe; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1E0CB240027
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 17:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1732985344; bh=6b8dwwzoDtPzKi5hwA2f/Ha1FNt8Kzg6K7AtuxiLD8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:Autocrypt:OpenPGP:From;
	b=DagGykFe7NIOYeFu7cdfRfKQyiXxANwwVy4P4zi3XbW4K04APqPISk1slbiE75XGE
	 HF9EjcboEz0oXkx9Jz/PxGyzGjuLP4NsPpw94hiyMkbd3dC+xBaga7tAioN2wbVhg8
	 9tXFFtJ+QcwZ5gIy+ochoy8ggMxPCKyS9DtuDovVQxcIfzwnuWrBgEo/mjybo/11bP
	 xzNDaadatLtnGEfVf+pKxndgvNOALfXmrB0KlqMHPBRfdW5PvV4makXmE1IwqOQHoM
	 RSRyF0EN/TAyxXAH8NQMrpnm38EiWaxiDBB44TUJew/dt42OXwq+Xx4T5w8b7zZ0a0
	 EoEBh7/k62i1g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Y0wxC1Rbjz9rxG;
	Sat, 30 Nov 2024 17:49:02 +0100 (CET)
From: Alexander Reimelt <alexander.reimelt@posteo.de>
To: linux-arm-msm@vger.kernel.org, Petr Vorel <petr.vorel@gmail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994-angler: Enable power key,
 volume up/down
Date: Sat, 30 Nov 2024 16:49:02 +0000
Message-ID: <4943360.OV4Wx5bFTl@stinkpad>
In-Reply-To: <20241123221708.862901-1-petr.vorel@gmail.com>
References: <20241123221708.862901-1-petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Autocrypt: addr=alexander.reimelt@posteo.de;
  keydata=xjMEZg0fSRYJKwYBBAHaRw8BAQdAIcaNTdj3NWDe5HQPCUs6oYyQygAJWP9LCzhr+C7RwMrNG2Fs
  ZXhhbmRlci5yZWltZWx0QHBvc3Rlby5kZcKZBBMWCgBBFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIF
  AmYNH0kCGwMFCQWjo9cFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQHqi3OKk8uRJ8ogD9
  EVg4zgfmC2SqXCgms6LETAzVX4CrAS8yMhyd7Md921cA/R8lhm9B96RYgA7MvFPFJb1T6JFY75Jg
  QLXrtIE5llwHzjgEZg0fSRIKKwYBBAGXVQEFAQEHQBGDuxZLOTvppxyM4G18fSR6xzT0xkkPOia7
  Bh6L1vAAAwEIB8J+BBgWCgAmFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIFAmYNH0kCGwwFCQWjo9cA
  CgkQHqi3OKk8uRIa1wD8CZDdCAKXstgXY96eeSSP7MecEF5TBdmWOiVgjlEIpoEA/RnGuDaj06B1
  F51wyGAjYXSmn5qFoNHu3yXyLUkFz1ME
OpenPGP: url=https://posteo.de/keys/alexander.reimelt@posteo.de.asc

Hello Peter,

The changes are very similar to the H815.
Looks good to me.

Best regards
Alex



