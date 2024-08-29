Return-Path: <linux-arm-msm+bounces-30064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF4964C96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE8C1F239E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 17:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFD21B5ED1;
	Thu, 29 Aug 2024 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ROhFhDPO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE11B5EBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724951122; cv=none; b=KjrqDcvd4ZqgZK1XH9Inu6lgUqbATkAvSx7uuXP+pRXY3SQdbkrRAykHUJtvNJHU6Q47+kpreH8d9w4fmQEyS7fwJZLyQRvaTg+6mO98qv223mvDwKoAM3gAeHHR3uj56lhEsOsK/AEzuHujMLcd+EnHChaNpABRd/otcZrtLMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724951122; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3NiquS4MsSyhCCLb41w6gCrs9DGnxd/OI4iaYFVyjpDDVBMQr0eaYVqhMcQ7HBSYU8+CMmnTGCvZ/g7JwfWsjoEMRXiSPG251L+KAnrqOeY6jds/degQjYYFnGBAgzbMXlq7GH2yxStOiL1aB6TPqR4FrK/kav2z3cx0CXN9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ROhFhDPO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bb6d93325so165e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724951119; x=1725555919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=ROhFhDPO9Ll9pWySk8+1RNzrFAIkqvOHeAt76Sekt/2Nq2RgyGnHOrg06nVAwJTbbx
         zAi0uJwwJP0jqEYMfTHLkWaLJ2gekVim0k8G/dT0p2KPEwnnDBxr8vGAEIAbWGgwydbJ
         27gRXfuhbdNIvrexgxiNmeLdRC7iD8eL/W8DICUJu+ZkoPpVwFJIzZtULYynfRQ7WJSf
         hf3JckSyM3mS9++wZHTI426vRojfg3E4bT5gEo9V8aflq0OYneGz+LtgkdyczysS1TMQ
         xYqLj5Joab5nUxH9a9uJl41/gt6GcyBRtoMAcugUPwyUekYoCs3c/38EOqb5F/7yf3PF
         4aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724951119; x=1725555919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=QD3QpZOmYM5irIh8FVTC3Suq5FlTdhFi49v85m96T2HAtriAjGIb31mn8ZmudFtfhe
         LhfR/b0cYpGDKzSI3eE15J/AjkgQphrsG8NTDA+r/2TS1awwrhVZRN0vmSZYo9Cn6CCT
         ZkzvD6vT40FLsjQgmXQkYGB+Zx0L+Ka+lvb3ETdnTFLGMQ6ReUohbcRyEwL4iaQGZzLg
         8D8fWjoiJozXy2EUXQsawyGcgeE4EcvjguVloIMfQyKam0CWnDENfe9gaawGkW1sLrzJ
         9phm+/+LgjdcfZ1fqBVEa49db4Z2J9D4eNFMGL/6mi1LGKodpikjqBYE9Vl8BJuwDCaf
         t57g==
X-Forwarded-Encrypted: i=1; AJvYcCX8NmlbXhkabsRzF46KUYEjBncaZMCgFik1dVY4tf62Y55AuDA4phi8ajeJZFx/qrFBO4aI+eoqu+eFSsJV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/wgNy2sNeA5arVrv50pCvwtdehAY/qpNDM6hUGjOKEnjekY7
	6Zq49sgNsd1RgHe0HzPC4tOSt4l4bmp80auN54WBdlrwP8+wO2AN91Ha8bT5SE84rFvaamJrcFF
	H0R+cCB2W3pso/49HbZTP4HVinUhT9pZyEDk=
X-Gm-Gg: AV9I1ZQid3BSdtQkMgXkDgiYy/o+Mk9g+UoJ+fLhLQmEh0g+NladPj5Vznq2SNEQxAm
	X+n5gieZU3UlCIydJOqCLJOPuEGUHRmR1IYHDVqRlKBdSr5H1AQXW6kHZwaA=
X-Google-Smtp-Source: AGHT+IF8ncbv3hPX6txBwjD+mljfVJFZjCz8WD9pS5r0ChWeEb3HcbLEeUEQAMuL4Kr+bb+8RiZA/+ov4ZUA9UxFSLs=
X-Received: by 2002:a05:600c:6d12:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42bba2d4b89mr12755e9.2.1724951118768; Thu, 29 Aug 2024 10:05:18
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
In-Reply-To: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Thu, 29 Aug 2024 13:04:40 -0400
Message-ID: <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"



