Return-Path: <linux-arm-msm+bounces-31146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA31096FA1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 19:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D5751F2429F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 17:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D1F1D6183;
	Fri,  6 Sep 2024 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S9ik7q7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3091D45FA
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725645020; cv=none; b=YFYxLrD94sk7rrYqg1QlfheS9XK4W7tJQBT5Jiz3hYXoosd+cRrh95DS7STS+CIHqviM2hyMoeH6BcYpLY9r9xro7k2v1Py4EjWrdc/55AO215nIxez/ckOjnJWvp8Ept+z86h5McfmEyvh5cpo9sjdZgvXI+e7CZh/yVpcbvto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725645020; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pR4WN90zUOyWynSU46C8SnKRjxwMLPUbDbuhcspBHxcJBFN7YXPEda0A2yYH9iv28J0MJcMcvNDIpUOFEEYWclOxmqKMgirlfkvcQ5Y2w40v1TnhPSFKwni2Mx8KeviVw0p0hoxBR9ejS1uDTXDu0fTC7QjqEUtIAYSVNkrvTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S9ik7q7/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42ca2d075a3so145e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725645017; x=1726249817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=S9ik7q7/k29xUOpJQRD3mc+GL+x/r+ZRglHfWZzWlrqbw9wvYyEa3qbzbhI4x2tddn
         cKifEPDSUS4v05RMEUmTunZTWmf3/zpnBjEY4AR+L0lkCG3gh0ZL7ldCLQKfA1XEr1C7
         d07flH4+TqPVFOINEth9POE+r+B75eoX9b3YUvfyU7NXzmy2NqM5yHCRr772Ph3t+Zpn
         fL0WSKhWTEt9Vyrfec3UHtt84n7UcgaqCr6kORf30glzaM0jiHdNc5WO+R+Dgz3BuTc5
         v6e7X8cE0tpM0zfGoVgVjmHMAJxs/c48JMlCNrgSC9FTdLUOejAL3ocPYWiDITAHerbC
         I7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645017; x=1726249817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=CJS3s0ih72GBRLH4nD7515k94/e3rx+gqecrCvQ2jEAnSvNgmJEyW4HVOE5H1jcwla
         b/alNU4AmYEzPCiENdB1l0/UuGgBvpBntA1kjTUstQX9NAlqBAJyZl5n6HhuPL/Kg0pc
         nc9K7lQdY/2urRA0YSY9/jlXMovNO+t0CStbSD209xmKoSWDdNo25UzLgRrXqnjVCQjJ
         9KFhtyS83OjfuQjqeYF9AsKQaldHfwZqKMjtrxDwpZgiKMJxueFzDCPDCC6vyk7bI/q6
         2hpHNM72d3KAqd7bOpsksysqMZTBuOOFlWD2uhyNSliCK1C+LCp9I3xZWHFD12lFq5QL
         X7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWuFNVg+ExZ40YXDDB3P/xnkQugTn8KcZWTmt7BOeUqRZeybBxh1hnSihRxqwiWplx7Q1JzThFczKwYprHs@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNxBM57ouWLrGoiKeV4ZFP2gYoKQxEzKNaBEafVuHvGvMNwbi
	VF1X8MRJzOCJ0YhG0s8xqMFbkU3PgOyaYv0yq2BfgZOrZ1ixXXlncyd/uRgmr9KOuGxSf6KjQMu
	sv2MqCzPZvf/7QPw7Sx4uWfJN8efSRdp4JwU=
X-Gm-Gg: ASbGnctJ6recJ146c27TVO5BguQl4p5dDxQAFb6OHxCYMtIbWULc2KDhZKBZFZU0ITx
	2wKJEPCkJMdew8z3xqomP2yWg1dOK3BLJm0pSqq2/X47b6yKKVLy10lwmuQ==
X-Google-Smtp-Source: AGHT+IHOlcv7vqlkgAnGOoFg/Cdu9KrQD+OEz5m6AJTBmUsgUHU751o/ZDkQMZfiOBrlPwGBZScRBDsy3iuUbw5u8dk=
X-Received: by 2002:a05:600c:254:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42cacd3ab7cmr25915e9.2.1725645016574; Fri, 06 Sep 2024 10:50:16
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
In-Reply-To: <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Fri, 6 Sep 2024 13:49:39 -0400
Message-ID: <CAFs7P=jfzE6V4EMdVZ73ShdWLavv41kU_NdK-=CO+Cv8dfGBGw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"



