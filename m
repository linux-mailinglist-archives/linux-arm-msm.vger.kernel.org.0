Return-Path: <linux-arm-msm+bounces-42226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BA9F1E84
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 13:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 028931889DD8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 12:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA101917EB;
	Sat, 14 Dec 2024 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCXjNixj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A94170A13;
	Sat, 14 Dec 2024 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734179060; cv=none; b=LWckE4pMPB0axrSRk/ufY66zmpAT/+Yw45XZSwAMPlnEfJ5Owur9zZyEVsHvoC+C1gmLDZHQOIh6O350UPDLVwD1ERjsQeFse+jt80Iyyygh5QmLAuSlv68EXwXYdv8BEu2c2Vm4jXqS2Oe5IA8tUNQlencFWhQaHZBIudYQvQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734179060; c=relaxed/simple;
	bh=dBcGXqNBlY9iQ9lZ/OgdfSdPcuxS/3vEiMPaHVTsVts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVDlsg519gkCTZHe1gskoR11+0Nvh5Y9NEs8FvuuIQVKSPaEH0KzVx4JHxqhdtIXNlHjcY8Ncyodd4qJKIRKczLts/bjCxnpMr5FuferJtacJJcHDLxA4yehu2aC+HrtrEdLMBgTBSw/d8vb0zznjqQd8a5Z8QyUIaW7OqC8AxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCXjNixj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-728e729562fso2149294b3a.0;
        Sat, 14 Dec 2024 04:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734179058; x=1734783858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Prp41H60OqHd9hN4QHlGSpjT8TyrfeZeXDfnp+LIFc=;
        b=HCXjNixjMDRqN4LEQUXoM/V7ltdBIZyJP8Ekgy93csuROf0GDWEifPRdB6KqT7gmYU
         TUdX8HXlKNwfk4hhzud+jnrYs0UbiW/UWQ6lyOsNP6VyOZMYQU3l/1k82CG+a/rwg7zO
         aj7Wg1BtRN4FYEXs814nOwpd3fhQtJbSHTse5p2TQNprRas/0fSziALe+TPa2RRDr+8Z
         qZrQZr3b+FpE4NGu+z7xXKkpMrCSzElJrVL7dj3UDFPC27AWnrhXFEIksqHCOtwc8crS
         mvddqhD4bX1/xID/WBWgcpp6n7/CNJ3vkUx0tA12Vxtyhn/rM5J+DJ6Xwk8qtqTSomGw
         OTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734179058; x=1734783858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Prp41H60OqHd9hN4QHlGSpjT8TyrfeZeXDfnp+LIFc=;
        b=cxNidds2t6qmYgCkdijym0yVk5SHWKtjJrvyoVMYZ0audbW0lBy5Aj1YqHMtn1PFZt
         Tqo6+xMJ2lqXtB+PFUlk8gEdP3QkP1rBsudEZVGRkFL1ErrlHV5McMzYU0/zr1ZKG3u5
         2bULXC/obaVda4K1Qi9h9t1xXEEB24gg8otMbrTgFVDBqXB+zJ42pxU73L8IN/S+IrcR
         o96ET1/IIr5ailwJ7C2+EbNRtIECoEq+Xf+wp6jqasA5A/1KhKBbx+pXSbUSnzQjxUBr
         yrH8MqHvYtmQKsIRS3ytcVfpM3ls/3U/yCMUtkzTfGgctmW7FR4WcCt6VJtQwytsKV9v
         1u4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxm+4GP5wJn0hzSgwpusI2XK8XeGLKIQYyp2Yt0ygYVTwlOYgDpd6MXLmaY30pV0Zf13mlo0lHHbeq3gnS@vger.kernel.org, AJvYcCWivYeCnXLBPOWyjgTrT00BHbsLDucbDaPmpsoOKmw5xCVr/GmszygrJJcKO3JbkB5yZr4ar1clnjzbg7CauQ==@vger.kernel.org, AJvYcCXmgkLiXnS7SjjXFVSEMlkNsPc/Amk2cZT1kS+BdVfX2/mnrcukyC2o0doclZCimbXm9ND4yCjB9rpA@vger.kernel.org
X-Gm-Message-State: AOJu0YylaBNPZfvcPhWzilb/sipVmPopgZXrkxe7IKcnQVD6SpRPHTwF
	hWNIZ9KnL2AiXmR3TKEFUKFRsuzIJp+E9LqXFahc6SOee0eRliXRVxSSkEWWBCA=
X-Gm-Gg: ASbGncsk7Ru1VjMalhLaC1sq0yRa5wRoJNIl8Qi/W/j/YMgM1OlcWBbU1FJq/KVE0US
	RwWQeQEv+FAI5fmG5Jh+iFzVjQ1HzvjlDd5GKchF4RDLqgeSNgYLxLZwtm1J+uo/lGlXpDP7Qkk
	ht53G7YIrgcdh/zlIoTsOXa97K63248Mj0/uQQ7TN5CSyZ039NinmvWmD+lk6ZPq6V1LEq+E6uX
	NXygTlmrYomZHa6McDrauom/sa97TUyF5D4YybhpeJ3H6mAp4KPLbE=
X-Google-Smtp-Source: AGHT+IFdOqidZhv/GlpzUcTzE60l3KDDrUuzpXKksuL3zjIzR6cuR/af//6gGgNABl5BMzkpGlPR0w==
X-Received: by 2002:a05:6a21:33a0:b0:1e0:c50c:9838 with SMTP id adf61e73a8af0-1e1dfd1c944mr8767144637.6.1734179058345;
        Sat, 14 Dec 2024 04:24:18 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ac5258sm1375622b3a.20.2024.12.14.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 04:24:17 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: mitltlatltl@gmail.com
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Sat, 14 Dec 2024 20:23:00 +0800
Message-ID: <20241214122303.653935-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213085100.564547-1-mitltlatltl@gmail.com>
References: <20241213085100.564547-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Dec 13, 2024 at 1:13 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

[...]

>> +
>> +		/* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
>> +		 * there is no calibrate data for huawei,
>> +		 * but they have the same subsystem-device id
>> +		 */
>> +		qcom,ath11k-calibration-variant = "LE_X13S";
> 
> Oh, this can be taken care of! See [2], [3].

[...]

Hi, Konrad

I want to distrub you again.

Finally, I found something, after I enabled ath11k boot dbg, I got my
id_string='bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255`

With qca-swiss-army-knife (see [1])

$ ./ath11k-bdencoder -e board-2.bin | grep -i "$id_string"
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255.bin created size: 60048

It have already been here. So that means I don't need to extract from
Windows. I just extract it from linux-firmware then give it a variant
name and send patches to ath11k, right?

Pengyu

[1] https://github.com/qca/qca-swiss-army-knife

