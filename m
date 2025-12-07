Return-Path: <linux-arm-msm+bounces-84608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D5CABAB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 00:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 230D4300B93C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Dec 2025 23:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7E92D0C9B;
	Sun,  7 Dec 2025 23:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdP1IOPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A46019DF62
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Dec 2025 23:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765149357; cv=none; b=YAoYdPEzxqzd6WWfSBjlxJi3WmIwry/wPlz6WGsoMNXloAARFspdWUw4f7DGbfIU3VjsMXSLb6Z6yx7KeZ6okWUaNGoiby1YO/AGyzy6bDdTkiVYy5EbsTyd5zqV65gbwRDr2JownVVMFR7FK4+c54dhq6GttDUtoVuof+agDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765149357; c=relaxed/simple;
	bh=JrawoIvD5t0mSOtoyYriDOG37dzck5mS9GT3TPZS81w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ByalMl3mKATOsb/mDBRDVwXA7wFh4RyNKMxDug1kXrp7ayusMGVknwoEx8NGLD1MxZs1vSRS2QjnTnmQwfhER2P6pzKP2EoHJhMyESw2k7RtW6sfayvv8z0rMAsHE76kVjAKohpisVjdCM24Ze5H/M4a1oR227cjy2UVW0hQtjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdP1IOPS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so26787325e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 15:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765149354; x=1765754154; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrawoIvD5t0mSOtoyYriDOG37dzck5mS9GT3TPZS81w=;
        b=pdP1IOPSL8KY3IxDXkN4DeLPaWDErmLm++ZI+K2V3F+iMdk+9svTMBxzeqVufMDb4c
         VqS0L7/Isr8sWDqpKcmaZJ7jqmS1XHlXUnKWDTVHd2TyLKYqz2PCy83D4GPHMZV/52Df
         HjF3Hv1rTIWM3HSXELgBZWu/XQgNv95rW/QizddCHo9oxvDXmrX+KDc4I4CeH9tdnwSC
         SMZErt8fRPdW5UsPGNwjLL5Npe+jLhhhnz45DcBDgS8StOECkK4HH9n8EliAj7JApJwq
         N/ukRV+Lm/XWSRpWGFBGggtyd7zPcECJ7eQHAhruKBpMZD0NvHoT+wk/yLkWZkMj9e4r
         y5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765149354; x=1765754154;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrawoIvD5t0mSOtoyYriDOG37dzck5mS9GT3TPZS81w=;
        b=M8WDGg+IfmBn63vnQQFhcgJ8/qjD5cRfUOwDr74pKw7zN0f1Sp/R+ySlTl0cNqLYKU
         9jQYh4pYHMubMHiSzm47CR6RzCxFeWaSIj6dG0jOn4dkTiFJdPFbH5xFKkQ1yO1idH+5
         ADn1a6WNZPLZ8B4MYedoaE+QF81WQelwvM5uS+HFzebj7T1j2RUj0y0tQNZ2h4GTv5B4
         tgkvzla3XaTN8ufJHOSbsB7rPM/ImBgyodO59vGg5m2JEKqZAdbTEcjWnl/Jl8q4K1sc
         1yb9WW00dAIhm+9mrSaZebcQEKEFcxq7WJ6lOqRzdc7c4KU6DXvG9daAg9S7MR7Au01F
         ArGA==
X-Forwarded-Encrypted: i=1; AJvYcCWpqFIQDZp7FVoZRqMImvHJurJm7//J15hyKQPh13lUHBKYkSGgYbU55GMB5S19ZDepyVln3rcgrysqndB9@vger.kernel.org
X-Gm-Message-State: AOJu0YyzKQRAL/nVXK67prfBPl0esWBzeRfHQs1ykjO+skjm3LXFOVpN
	bntpoVqb9IyYsNqp4WJLvfZ7W/oSu9TB9FNbDRqD3eH4Rklk15oWroIkcQW/w9SvMT4=
X-Gm-Gg: ASbGncu93AXJBEXtbOpm+MDw+iZP+k+6LjI3USWvifTdcIyY4UT7+MCj4EDanVlDLwI
	sT4/GnFP+j785/TYFMdtwKzpBh2JMPrOhxboSN1QiYnxPJw5KnEmVUXiTldL5zqbURIZRed3X99
	LkWng6kUbVjeqC1s2xwRJ5AkwgSMSKKJdXxyG55VjV8oE2yFblZlkOQoE8GxkpWzB4ZydhOvONm
	RncwC3HdK/DOKDvL33Q/whIiOobiETa9MK+oCI2ydme5jLgJdVl6yIJl+LMOif/UGJpPMpxx3fV
	mvlXk8feiOEON36KHz6NPNYb2fi2j77liGWWW4MwxM+wZ4OBsf/tAkTK0m5cpbXMhZK6IS5DkCZ
	0G+cQQycbfObj4AFupFWDsaprQRg1xRQhNvS+rEkqRhEq5MqQ2HAMJr7Qmp6LFrNhDmYCIP2cPc
	JQcP4aUvbrEjXPSIAy
X-Google-Smtp-Source: AGHT+IG265bGsuH8yFF78i9r8fah0BbcyblFqGg1lC2v8CBn3ElR0sMxydVKkkvoEWSpFSE0ekKljA==
X-Received: by 2002:a05:6000:1a85:b0:42b:40b5:e64c with SMTP id ffacd0b85a97d-42f89f6340dmr5988631f8f.30.1765149353630;
        Sun, 07 Dec 2025 15:15:53 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:da07:24c6:f91a:9817])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222478sm21783666f8f.20.2025.12.07.15.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 15:15:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Dec 2025 23:15:51 +0000
Message-Id: <DESD81PA9NI9.NKA6IOV0ROX9@linaro.org>
Subject: Re: [linux-next] potential deadlock in ufshcd?
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bart Van Assche" <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
 <mani@kernel.org>, <linux-arm-msm@vger.kernel.org>
Cc: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
 <linux-next@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <DERQ2FF2WO70.3I04I9XAG5V6D@linaro.org>
 <46cf2cb9-76f4-4d73-be3d-88fcbe7055f4@acm.org>
In-Reply-To: <46cf2cb9-76f4-4d73-be3d-88fcbe7055f4@acm.org>

On Sun Dec 7, 2025 at 3:18 PM GMT, Bart Van Assche wrote:
> On 12/6/25 7:07 PM, Alexey Klimov wrote:
>> Is it a known problem? I can test potential changes to resolve this
>> or try to collect more debug data if needed.
>
> Please help with testing these two kernel patches:
> * "[PATCH] ufs: core: Fix a deadlock in the frequency scaling code"
> (https://lore.kernel.org/linux-scsi/20251204181548.1006696-1-bvanassche@a=
cm.org/).

Thanks! This looks like that one about fixing deadlock does
the job. I provided tested-by tag there.

> * "[PATCH] ufs: core: Fix an error handler crash"
> (https://lore.kernel.org/linux-scsi/20251204170457.994851-1-bvanassche@ac=
m.org/).

I didn't test this one yet though.

Best regards,
Alexey

