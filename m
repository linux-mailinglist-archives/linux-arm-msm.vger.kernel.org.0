Return-Path: <linux-arm-msm+bounces-69305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD4B2770A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 05:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BC005E30B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 03:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA00C1E7C34;
	Fri, 15 Aug 2025 03:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/HRbjD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C4274B59
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 03:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755229454; cv=none; b=nc/M4aLqY6H1sQq4RF574weOqxIGcZo+4FaBfmUKGPoKnAbV+wEHY3XLLDG+MqUy/hYRV4A+ml4swEadZPjYBP994tMV4Jrz479VQaKoEjrnwaikEHGOZzqf9GXm5jwJ0wFIuA0YLpy9lyX8iYOUuw/G11aEA3sjf8YvlF7eeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755229454; c=relaxed/simple;
	bh=CbV50UlUgsDMAydMhI9fr0dDw1OdFhDvioJbc7w73qE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=FkgsAi78/LzVxAfcb8cpM7/Uvre6Z8t6TEPJ6pRMm2eEHOVd78ANwjIwhnRYhQjnqt84FF/fk2c17q1mNRITolPOBHZ4D/vxwpqHsKLCLo6q8cLVKLUfmnU4ni2J+N+TmTRBu/5nnSVEf6Z+ARgQoc3/i7bpVBDydDJGBLWCwjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/HRbjD7; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e8706764d2so208457885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 20:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755229452; x=1755834252; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbV50UlUgsDMAydMhI9fr0dDw1OdFhDvioJbc7w73qE=;
        b=f/HRbjD7oWlVIa7ABhAV4dtxKDaoEAI7+FuPvAW1x4JAIXKo8k6I2jXzI0wiri4Piu
         V4Yyu4J+ZBWQLOIYZTUOxhOBS1rk8sxvkbYUss4hE0fSadFG9ECWqKiXsJD+XEnl/T54
         G6L2fBSLUSWu/Nd5Gx+N4seUynwOp2bOqIHnaXk4ajJK4/6Yz438MY01PXnBD044VaVv
         YM17OVdmMaPkIH/EysvGQocrPhbaNYVG48V8YITJukGeTBPObpC7McZv1TYclw57fRxg
         3g61hn/SzGtTQWnB3IxYfqDFRzFqDaJTMM4WlDRor3yl+yXdsBgav4eVNw4cnSXPRwvU
         timA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229452; x=1755834252;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CbV50UlUgsDMAydMhI9fr0dDw1OdFhDvioJbc7w73qE=;
        b=vCWpPMFpaAgmTXGlB7sQU3B+bK2wNe8XP5MCQWCBX5XtFfFP3n0tg17onyzhtNt684
         a3PwheeRWjhIckIViXv3stRB7WsCPIb7lSGNRCsbYgTjjT7dUO4lUZH6xN8laf3kw+h9
         5IqX+h7qvqOxu7y2fLQFRRlN2oftokw8UhzNjX3v8DfkyXxLsEnyqoTxAPJ7Tfk3o8zy
         xUKYq5oJfk1IZuslywFguBj+hc2H3msPxVRmmxyBSMbLDytlTDbQmbi3d/e5+OCz9DM7
         EbK1QAa8ajnkOdHuUb5w4KoyP1YRdVPLT0zNBkNspw1iYqhHJkCNN5d+CQY0VHSooXn0
         FpLA==
X-Gm-Message-State: AOJu0YxgRXZpfGJwlcVXWrgU0JxaVDbirq/img2C87NC5TVUA6PtEXh6
	ZsXi26h0fSe81bgpInetpvVx4Ded4xkwZIOBOuGKHACMSrZNbE+0xFZfmTkwqEMrxpI=
X-Gm-Gg: ASbGncub/I4CwtOD8FRNmiW80qnSSyCpXQvJUxaUeVax6NlOlne4bviPofWs4gMmW3o
	JsJLcwwzr3uFoQK7t/1bV06A9pqVLFmuej5Klc+1jaEgLvGXh9N1vVVCKAm4z39Qu3zhTr65iH3
	mhfwlO/mnabnWd0iCIPBVmGvfu3n0Tqm7plrvbCLth+fuclgnFijfYQm35dzIkMYCEiF7xoKpSj
	IQ3/1nGiYlJ0wM+gU9damT17K8CFmpYt/TP26JXXzNsOLNNz5D09IqytlUxdArhzfHIWdUyVbtT
	E8lYaxonjh3K1WQSnqQ+CWoGN0NSBOy41kbE/TdHEzrz+4tvauvfM4Dz0Oo3SrejyTi81FwJNou
	/7qnaHCep4PjIUH06hzZ5Z3PULwIzr/xJNSHDY12ioLaY3fcZhHJEx8HG6aGPK9jL
X-Google-Smtp-Source: AGHT+IGIGnDL5nu1a/uGIVA0/0RYDDU2j1ihE4igtwRQmfr93oe7iQrgSnBxskK5UThAEoo6WS7kew==
X-Received: by 2002:a05:620a:4001:b0:7e8:5aaf:700 with SMTP id af79cd13be357-7e87e023fe4mr63156185a.21.1755229452174;
        Thu, 14 Aug 2025 20:44:12 -0700 (PDT)
Received: from [192.168.1.105] (c-73-176-204-61.hsd1.il.comcast.net. [73.176.204.61])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1c9b91sm35794685a.66.2025.08.14.20.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 20:44:11 -0700 (PDT)
Message-ID: <2c238b60-39b3-4dbb-84f6-747769bd67a3@gmail.com>
Date: Thu, 14 Aug 2025 22:44:10 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
From: Eric Salem <ericsalem@gmail.com>
Subject: Converting logging dev_* functions to drm_*
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

The TODO list[1] for the DRM subsystem has a task for converting the dev_*
functions to their drm_* equivalents. It mentions contacting the relevant
maintainers before starting to ensure your changes will be merged.

I want to update the drivers under drivers/gpu/drm/msm/adreno. There are
seven files that need updating:

a2xx_gpu.c
a5xx_gpu.c
a6xx_gmu.c
a6xx_gpu.c
a6xx_preempt.c
adreno_device.c
adreno_gpu.c

Is there any opposition to this?

Thanks,

Eric

[1] https://www.kernel.org/doc/html/latest/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

