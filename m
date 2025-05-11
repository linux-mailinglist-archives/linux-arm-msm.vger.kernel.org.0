Return-Path: <linux-arm-msm+bounces-57539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AF8AB2601
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 03:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C0F37A51BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 01:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6CE57C93;
	Sun, 11 May 2025 01:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+GiUOj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B454EB38
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 May 2025 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746925774; cv=none; b=Ay5BekBzjjDOmH0hlmWNNeHVVHo7uSwRQvQp1Y9qJh12z/rTZxGPyj87oKAnX+czqgi/StD/mWAw/hrd2XgzVPRsAxFDI7W859Pp4AaXW3HOD42Xgdw73vz/TwYYBzMQOvM26T784DVxcS1CdljQXyPeCHzPQAAQ4Gp2wW8apb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746925774; c=relaxed/simple;
	bh=4MedhLIAtxfBJ7juzuHcFhIJgej77smd5W6HDM2mc2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=uxeg2k7/okMH9BBEipMujiZaYtpdqZQmUUb9Ds0I6cb5OXF2xIVb1OQVkwAGZ3ptbAYde3Qbn5lSA4nIm/3F6bbqwZW1mAKPvtVlDn3AqfSUKnNgNB6pldBoSKI6xk+jlBcx5wjcgqi7dl7IByk3Ftwqig5CobrdatNGVdXNFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+GiUOj5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso1410380f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 May 2025 18:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746925771; x=1747530571; darn=vger.kernel.org;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aqCWxzc/LF4mwbSHgXAH1Y8wfV3w1TZlyAnsWm2HFII=;
        b=W+GiUOj5WfkRfGvWhtiN5eyPwE9TKhTFh65CZGrhDQQX8mzCJOjl1XhkQJztvCi2VK
         bzMDpCc9E9C4M4uewBbPBWBOg+xUi6ELlw0sprMjInIlnBXRX4tLzTZ0/n0TWKpdnRv+
         mg2H0lqMPXIGFPMpYR6Ww009bbnV6sBNV4uHvSciP1qrVToRNg2tYtlmwiczwXBMO+6J
         Iv7egWnGWBZu8kNtlEqoI0g8fHgmrF3t0B+TjWLa1xPorEfmmhojJsP8o5wMMp2Wz++d
         GDRzwISMLOOhSqmJhQPQTamUM3oUZg17ROAd0cOGP4oIaFfiQZmwNVvnY4H81LG+63sU
         JS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746925771; x=1747530571;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqCWxzc/LF4mwbSHgXAH1Y8wfV3w1TZlyAnsWm2HFII=;
        b=vX8ShsNzLMbkwweQCwM3syXCw8reoaJvEwkwOyjkdDkCJes2D6ays+tHdgdIoywcal
         LEFNrqDGjJ9ahf9KoP+RHghrqclPE4z3rwqDW/ARW96I+SRsaTKZkx83SfVupn010+it
         +8m7cNg867oNn8DeNGVnwU/Em5SkxPBitYuNHqRz6eRG+I37/SMr0FTHhenv+M2GWpFx
         N/c7drmK6pUhvexUCVnsr8iM1BGnadb4X0GBFoOt4faueBoSv1pvHlnDdG1GU6GDPhGA
         v+1vjWweotgcPXXPqd9nnFB6xl9jLlfitOWxbSZLcvsJj97FgnCz0kW3i4MT44Fd3gfo
         xlgw==
X-Forwarded-Encrypted: i=1; AJvYcCVeuc92/cdC40CS1+Jb71Bn1+D8RzonjRfcnDHXCz43xQpD1k3jIhCFtRl5kN085BLjAUeLSj+AAdZmGLeu@vger.kernel.org
X-Gm-Message-State: AOJu0YzX3jfvRJoJwteH7M0Pa0ZuxWgdxEeFPjhaPJwV2EJtcGw9P0Vc
	/aUM8coMcEQ/32NXN9G9wA3Q7DQbvxtkEJ/2GVtkcB+EW3He3n7zzhbUTv+D0S8=
X-Gm-Gg: ASbGncuUqEfX16cZso6D56CJg6NDx1N7uMRi4vjC//c3CwhrmKFG3fjhg4YZ7A9uNPG
	H/ViG3V1loHu3f4IDVN/dIjf07uJl5mM9eTzA/x/ICMdIrIPdKyzz6YE6xtxctItYd4LOML7QTH
	79A2eGukkZqL4cqGAc7/CB9jdO57kr7UVl5DB6lgNjQt0zx6GORuWR1YZNuuqPSBPlIupSV/sol
	DkJa+ezaQXDZ/dC8l87K4iCZ0d2dN1oOywHWzu7xssDdCy9dLLCGLYsQPPY+LzVMd4ALupaqK4l
	fk4o2aShp3csUJvN319ZhUOOhzxvefmNs28MwbYwvhlkPUSlViY=
X-Google-Smtp-Source: AGHT+IFoTmZ/NIccZ5HMBwKYuooZHRaAIWQAsw3sw2JRyk4vYHIQVqEDgdSTxag0Au3HQzPQ4XRVLA==
X-Received: by 2002:a05:6000:2ce:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-3a1f6437880mr6788989f8f.16.1746925771223;
        Sat, 10 May 2025 18:09:31 -0700 (PDT)
Received: from localhost ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecaeasm7739674f8f.28.2025.05.10.18.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 18:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 May 2025 02:09:29 +0100
Message-Id: <D9SXI3F82EFT.7WY8FQ9P4RHL@linaro.org>
Cc: <peterz@infradead.org>, <neil.armstrong@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <andersson@kernel.org>, <mathieu.poirier@linaro.org>
Subject: [linux-next regression] remoteproc seems to be broken
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <tglx@linutronix.de>, <linux-next@vger.kernel.org>
X-Mailer: aerc 0.20.0

Hi,

we started to observe regression on linux-next starting with next-20250508.
Neil bisected it and it pointed to:
2ef2e13094c7510c40833951c2ec36cf8574331a
genirq/chip: Rework handle_nested_irq()
https://lore.kernel.org/all/20250429065420.744042890@linutronix.de

>No functional change.

Manually reverting that commit resolved the problem for me.

I suspect it may affect more than one Qcom board but I test it currently on=
 qrb4210 rb2.
Mostly failed remoteproc start up hence no adsp, cdsp, no wifi, etc.

[    8.937745] remoteproc remoteproc0: modem is available
[    8.963841] remoteproc remoteproc1: adsp is available
[    8.971927] remoteproc remoteproc2: cdsp is available
[    9.027266] remoteproc remoteproc2: powering up cdsp
[    9.037796] remoteproc remoteproc2: Booting fw image qcom/qrb4210/cdsp.m=
bn, size 3008020
[    9.153625] remoteproc remoteproc1: powering up adsp
[    9.158697] remoteproc remoteproc1: Booting fw image qcom/qrb4210/adsp.m=
bn, size 13196348
[   10.357702] remoteproc remoteproc0: powering up modem
[   10.442049] remoteproc remoteproc0: Booting fw image qcom/qrb4210/modem.=
mbn, size 8881672
	...
[   14.508388] qcom_q6v5_pas b300000.remoteproc: start timed out
[   14.508418] qcom_q6v5_pas a400000.remoteproc: start timed out
[   14.522733] remoteproc remoteproc2: can't start rproc cdsp: -110
[   14.532531] remoteproc remoteproc1: can't start rproc adsp: -110
[   16.043271] qcom_q6v5_pas 6080000.remoteproc: start timed out
[   16.058593] remoteproc remoteproc0: can't start rproc modem: -110
[   16.076600] remoteproc remoteproc0: Boot failed: -110
[   20.143356] platform sound: deferred probe pending: platform: wait for s=
upplier /soc@0/pinctrl@a7c0000/lpi-i2s2-active-state
[   20.154630] platform a7c0000.pinctrl: deferred probe pending: qcom-sm425=
0-lpass-lpi-pinctrl: Failed to get clk 'audio'
[   20.165381] platform a600000.codec: deferred probe pending: platform: su=
pplier a730000.codec not ready
[   20.174738] platform a620000.codec: deferred probe pending: platform: su=
pplier a730000.codec not ready
[   20.184089] platform a610000.soundwire: deferred probe pending: platform=
: wait for supplier /soc@0/pinctrl@a7c0000/lpass-rx-swr-active-state
[   20.196738] i2c 1-000f: deferred probe pending: i2c: supplier a7c0000.pi=
nctrl not ready
[   20.204793] platform a730000.codec: deferred probe pending: platform: wa=
it for supplier /soc@0/pinctrl@a7c0000/lpass-dmic01-active-state
[   20.217114] platform a740000.soundwire: deferred probe pending: platform=
: wait for supplier /soc@0/pinctrl@a7c0000/lpass-tx-swr-active-state

Thanks,
Alexey

