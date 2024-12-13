Return-Path: <linux-arm-msm+bounces-42014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F039F0CB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD6DE282076
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF2F1CF7A2;
	Fri, 13 Dec 2024 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQtqTGcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54975B640;
	Fri, 13 Dec 2024 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094284; cv=none; b=iR7Fh1BZXOKO5eXMYn94q7JI90QEZwRKNikL+vF6C1GIqlTxRRgL/KFX54aF7PwdZIskNMwaiVW3ymQwQx63e8FO1HmYIRjfZwc20776JNcjHUro7z9FURIArVD5DLmyLwyWwjQ2jAZ0a1SXmqrYz0mNVjaPxkEwEJXbyJDlMOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094284; c=relaxed/simple;
	bh=3V9ABdvI0bfcKg5a3Ad87E4CyB4Od8SEoeUYSWGcq60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilAwGjc2EajjophH39GvHk3WslU4jqCFU90x6vADRZrPNMDBskwGqHBqQSNgVwRA/xUVlhfNcaCjebs4U+IhoG3HXYKncMFwG83BM/5dFZrP9asapsnyPykglc+g5OVvehAJmDjwQM6FnLf1WleswBJjLyLSz4HBz3JX8+VkvhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQtqTGcp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163dc5155fso15560785ad.0;
        Fri, 13 Dec 2024 04:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734094282; x=1734699082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ8WdfzaP0Vy0T0G316Gt2INKKOfyJAEbZBdkG+9fNg=;
        b=XQtqTGcpLqwZk7kQESlv1fWxgndXNbdCt7E9YG1QwHRBULlk05DpEAGhnO3RY0fVfA
         0qRlm/GQYJJhbpNYp/vLd5hI+rA6BM/cLJQvepwJxzwY+7KJ8gH5o3OrYSLRbiBlfjcG
         P4noXNRSZwImSqEER/FC097Z4D473lhFETAAqCehteqNW8qeR6tgGdQuzjo1L9mX1y2U
         feR2RTWbhBryjaVHg01jlhBwuLViJMw388/leZV76C3OFBXkaL9+xRckcpH84VA/lXv5
         cNOcy55kLA6Rf5/oq+QeFlVvw3bBUdIsGGTZjfaMkfBjnEDdn+n4hJe3PzU8JFzHb8An
         wPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734094282; x=1734699082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ8WdfzaP0Vy0T0G316Gt2INKKOfyJAEbZBdkG+9fNg=;
        b=noJmoec4luBzQqRqLMVbD8ycu+oDbHaGUt0R0DQwbAGR1GBv/jmbnPJOEqx0FvFTKv
         wGTlcLdVUzM/VM7FXR5n77YWnUssLB8j4SCIg1BW93g/voxgfAcmRpEq7ME9pxtVs/aG
         6M2mq/WHauIwuliIm+41YjN4NjC/7WaAdaPc2UNnI408B8pOaKKPkb+qz+UngI1SQC4o
         5PsfjskFlL5VgA/L1vJdKathqkqICyTtorJBxfsD3d3CP+B1YoWdTDlSVy0VqLr3IAkx
         eZh9WfX26TRhqWSybFk10peIE887VWU4cf9ihG+5CsrevmaW6/uzqEEyCugHTjOYVpU5
         AvjA==
X-Forwarded-Encrypted: i=1; AJvYcCUFxU+eHeLTf+jTkBr95Dk5sQ0YleFTt0P8MeAH/zzU6eaQzRrgP7WYDwPPKP1mQwOP/L0Cti51t1NY@vger.kernel.org, AJvYcCV5JzSVBwR81e9F6twWnTKWDeYTj81tb4fThV4vjkODmTRy58cbjOxPe5868z/zVsBXz4iBb+UfXvn+Tqlqhw==@vger.kernel.org, AJvYcCVM/IIiXdhZy+iCdjctwqeBcD9vc7kOtUJxofoltBD/nBVJwhxR0MHkj9bqLTtsI3tquRtpwCGlHiZBJSjj@vger.kernel.org
X-Gm-Message-State: AOJu0YysAqpOh4Q4bEuTnv7PB8C99iVYU/jcEhLuzqkWfS/cSnzEynfw
	sahlAJ+EXTzrvcYxZIsr6FyPXFp6klJW1LNH/qz/AvZWbEKWBtATS5ZrpgHJMK+Htg==
X-Gm-Gg: ASbGncv18t3m3GpPwm0OXAHrqng/VwnoN5dryfHFULcXzaOvN1Yp2RQByb8/UMTgMhQ
	PTJ0CxxxNxIbUWGtrCDa6qqPXAq6vQwNzAPm1bTncatHTFLI28TDxHNV+wiuamxPVSOwQ9CQTJJ
	3ck6YR3WhkLPDFgzSgLdWm7RzYntdVqoVTR0KJCTZIvguaBQNhVyuHhs2x9OxYgAGE8s/VFqmZc
	du/8ieDlxZ28agN/00OrQP2fU5+6R1jFrTTL7SxIibGhoY8nEziaKM=
X-Google-Smtp-Source: AGHT+IHApkoDBrsjmtctoT+lmrgHH2LN56oXUEBlhQZphlA/qyXEDZtEOVg3RHSFC98XgPReo4RIcw==
X-Received: by 2002:a17:903:234f:b0:216:4a06:e87a with SMTP id d9443c01a7336-21892a41d4dmr37484455ad.40.1734094282590;
        Fri, 13 Dec 2024 04:51:22 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216688a6dffsm71028715ad.113.2024.12.13.04.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 04:51:22 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Fri, 13 Dec 2024 20:50:08 +0800
Message-ID: <20241213125008.597166-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <3dfdf882-eb1d-498e-96b9-90c6cdcaa44c@oss.qualcomm.com>
References: <3dfdf882-eb1d-498e-96b9-90c6cdcaa44c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

should I attach the all?
# dmesg | grep -i 'adsp '
[    0.000000] OF: reserved mem: 0x0000000086c00000..0x0000000088bfffff (32768 KiB) nomap non-reusable adsp-region@86c00000
[    2.249916] remoteproc remoteproc1: Booting fw image qcom/sc8280xp/HUAWEI/gaokun3/qcadsp8280.mbn, size 12950508
[    2.556517] PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
[    2.556546] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
[    2.556594] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2

> [...]
> 
>>>>>> +     chosen {
>>>>>> +             #address-cells =3D <2>;
>>>>>> +             #size-cells =3D <2>;
>>>>>> +             ranges;
>>>>>> +
>>>>>> +             framebuffer0: framebuffer@c6200000 {
>>>>>> +                     compatible =3D "simple-framebuffer";
>>>>>> +                     reg =3D <0x0 0xC6200000 0x0 0x02400000>;
>>>>>> +                     width =3D <1600>;
>>>>>> +                     height =3D <2560>;
>>>>>> +                     stride =3D <(1600 * 4)>;
>>>>>> +                     format =3D "a8r8g8b8";
>>>>>> +             };
>>>>>> +     };
>>>>>
>>>>> This should be redundant, as you should have efifb
>>>>>
>>>>
>>>> I think no, it won't boot up without it(stuck at EFI stub: Booting Linux
>>>> Kernel)
>>>
>>> Do you have CONFIG_EFI and CONFIG_FB_EFI enabled?
> 
> 
> Very very weird. Are you booting with clk_ignore_unused pd_ignore_unused
> in kernel cmdline?

yes, as Johan said this (see [1])

> 
> Konrad
> 

Pengyu

[1] https://github.com/jhovold/linux/wiki/X13s#kernel-command-line

