Return-Path: <linux-arm-msm+bounces-70870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A95CB3592E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B61831796B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5CF31AF21;
	Tue, 26 Aug 2025 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIYOhQPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268C319879
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756201040; cv=none; b=SIPfurAORzRDHQbTEh1btu/TzpND6tVQ/Qmt7H3ekXqRTkM9jTsBq6l0lMI/MQ1gu3E403xrEJ+LR0kb5ysYIi2b6carrbxbQQbLq3wiBMEfJ3V2mGKu4mjhz+VGqPL7erntQrrbJ9e8jGu8a1FqfwFkoiJBOKZEs+b50+V7wEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756201040; c=relaxed/simple;
	bh=hL0Hr6jYqYEbDXRMZ0OdI59nC7QIyOL8hWqNW+Mahq4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=QSIk6t6zum75wenEh1UEpmlAvfjsV2W4AwF7XNon4Vr7/ZnrVn133CB33vCAEgLi1TmpFu6Wji1BKIauo08oNvxT2S/xfktiKjfCA7yiWTGpRXZRR/sm5iUG14ztsSBvCAL0pQrQZiYU/8F9xTIVVd7YtgZ4s6PSmhPzIRG0++0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIYOhQPi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c7ba0f6983so1270881f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756201037; x=1756805837; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL0Hr6jYqYEbDXRMZ0OdI59nC7QIyOL8hWqNW+Mahq4=;
        b=bIYOhQPifDe4lZ6bNSOChpS8vN9lXRcdVu/rZiMZHCPuj0MrQCnUNjkdRkTN7gjc8v
         /ssbfpiRPi1MENMVfbfoRa/QbH83Q2gkvDvPmY9DMFfw5L9ToPyi8ucXcOvGkLkK48iD
         NR6Ol4KRWo0RgsYpbdt45+gjxcx0ZEpzVkCsiXyP2Z76ry+H0+Qdw1JQSWvtfbeLRaVU
         QVZSK7h4evDIo5kuB1v/JOtzKXv8kQ7XM+QWlGZ4vSUQ1ivtdOzQ8u6ccfL8rnvbatrE
         8NlcsiNk0yDM+UHUZbTgyN+tLVyDzTWk/PPHWmZCcgOicJiDbiRSH07S6wEjiIabquaV
         KNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756201037; x=1756805837;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hL0Hr6jYqYEbDXRMZ0OdI59nC7QIyOL8hWqNW+Mahq4=;
        b=wm9C/DjuTIyNaOPN2I8wYgUHrJ9PyXUdUCsN85rUt0MTHKo4/O+IuCroxZMQzfXvmc
         2Egrkf7ky+V/KaUlLmcpx91DJ5cjX3p7qqMgLJhKFMwnRGfQKfoVbMXXiPSKBLoGYfSD
         KablMhuXwx6GVViRPM8sxl9xkoDC6PKrN2oF3yZcUbH8HdMPJeTp4aoLrQqW2LpBkgN2
         NCO/Nl6RDApuwUIBSChJXN1m2E2C/y793UVDOFJDtDtIfdZv6FQCjf00kHaQxZoY0vLX
         qpZc2LAqaC5snwzV28Ot5M1evnIwqQmuu2PVoj9VKixEM4HcBSjzTfA8XYaei+Zzl5oq
         iIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgXFKc3tTmMjqo4fM8X6zr7mpgnerZZ6Tc16wuhKLbKaSO2HGs4izrJdHxDt48hUvQu/uViqJOEROvFs6U@vger.kernel.org
X-Gm-Message-State: AOJu0YzywNwLHahSLDKx2Jk7XJcS6XUJG1txh49ghzmA8EtL0irtwADL
	U3Ktbhu/zY3truaM2v+WV+//DMWcM9Bvn6ovwTeKsu6ez8VzygJz90ud5wFhO+Ro6is=
X-Gm-Gg: ASbGncuPc6qCbG5jXNaimx6Zd6mx/etUYNPKpXkEp5BAowz0Bto87Vix17NYURTIQC/
	XucgQpWTFct+Zrt4F1VAGLv9JNgvTsKSy1yLFAKe/v2qPT0luoFksA5x+AH/tAcA/TNB9kAy5hD
	hJh9oM1JUbLRoBEPft4D78AVyY4kH/arD+lMwCNV30EdUCWpR41NC/5IcTLMGuVt6SZQcAEqBjw
	YWOpErP+A9ijBPmfxbfSYIH3kXxKfz7VgiJvs191v6XDvKiFBIu644J4rODARYOBRUqvSIVIXQQ
	6674ySs3b7baLxbkO35ZskNMkjDcpWDlNJfvNRj/QVJtE5hkcNi22LxeDpfXl1lG4RH0BSFhEza
	LMzrKcv+NPxLEcrH1WiI5jbzyp3k=
X-Google-Smtp-Source: AGHT+IGrDK+quNOm+R+59A34XZn3umLuzfZj+sWAvq95GJr+cP+OmXy85+fBFYFu/LRVhA4av2Y1tA==
X-Received: by 2002:a05:6000:4006:b0:3ca:2116:c38c with SMTP id ffacd0b85a97d-3cbb15ca336mr851001f8f.2.1756201036785;
        Tue, 26 Aug 2025 02:37:16 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:e633:2c7e:2d3c:f5ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711f89a11sm15275246f8f.64.2025.08.26.02.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 Aug 2025 10:37:14 +0100
Message-Id: <DCC9B5C7SSU2.GRI1UY0VUDHF@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Praveen Talari" <quic_ptalari@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-serial@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
 <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
 <quic_cchiluve@quicinc.com>, <quic_shazhuss@quicinc.com>, "Jiri Slaby"
 <jirislaby@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <bryan.odonoghue@linaro.org>,
 <neil.armstrong@linaro.org>, <srini@kernel.org>
Subject: Re: [PATCH v7 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
X-Mailer: aerc 0.20.0
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-8-quic_ptalari@quicinc.com>
 <DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org>
 <577d05d4-789b-4556-a2d2-d0ad15b2c213@quicinc.com>
 <dcad137d-8ac9-4a0b-9b64-de799536fd32@kernel.org>
 <DCC8WLEKNS8W.9GAJHQGYPZIY@linaro.org>
 <8689a8b4-75cb-4f01-ad6c-0a8367851257@kernel.org>
In-Reply-To: <8689a8b4-75cb-4f01-ad6c-0a8367851257@kernel.org>

On Tue Aug 26, 2025 at 10:21 AM BST, Krzysztof Kozlowski wrote:
> On 26/08/2025 11:18, Alexey Klimov wrote:
>>>> May i know what is testcase which you are running on target?
>>>
>>> Boot the board?
>>>
>>>> what is target?
>>>
>>> It is written in original report. Did you even read it?
>>>
>>>> Which usecase is this issue occurring in?
>>>
>>> Boot?
>>=20
>> FWIW, what said above by Krzysztof is correct, there is no usecase, just=
 booting the board.
>>=20
> 12 days and nothing improved, right? if this was not dropped now,
> Alexey, can you send a revert? Author clearly approches stability with a
> very relaxed way and is just happy that patch was thrown over the wall
> and job is done.
>
>
> If you do not want to send revert, let me know, I will do it.

I am okay with sending revert, just trying to see if there is any interest
in fixing this.

Thanks,
Alexey


