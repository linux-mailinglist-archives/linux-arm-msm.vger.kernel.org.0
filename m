Return-Path: <linux-arm-msm+bounces-52791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A459BA74E9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 17:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315BD188D0CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 16:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9172819992C;
	Fri, 28 Mar 2025 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A4UAWOYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457017CA12
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743179980; cv=none; b=sDx11+irrEFnX3VE/eLgCbNIeF44AHXfYoN7fvHHeR3Rt9FTz3fdOPKGqcs7JoDqd/YfsIdmAD8pbh0+szQdsOYihHsnaS4Pe6fZ4xNXzTbXn0YDocSt03dB/n6sQUZFVo6KuQBglEliYceXGvA3nBA9S843hR+UT7XRw3241Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743179980; c=relaxed/simple;
	bh=YdVHPUjP3h5SyzwWfd97qASBG10VxKeoU6DT59be9XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ulFuqbjMvgoQSlzdfCeIjWxl3dv1SWaeRTscY2yHF55HInLJZOeFARhxAmDrldGeMklk3265c79bhhTUjA6HinWToZmxp5AhahcEL4eTV3gBvza5H8bx3heH+aiDa+eTBkPTKKYrShKH43c8MuO5wmpH3vSBiB11LA4sKCt437c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A4UAWOYh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so586153f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 09:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743179976; x=1743784776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hOXTmExdfC88ujIBURdRUnCcYxWTOg4zUW1tQN4nmg=;
        b=A4UAWOYhJGEqAxpSJ+XuNa1wUy36qWKuSHNqKzyNQ7wa1squZIabn18wO1b9np0I5V
         HrLTw60ao5N9I3Db8ORtljGDP/owKqnVXUMkK3PINUqYXtHI6ygJW6sa92ZJC2Dne82L
         ObwAP6nsnD4zedxgvivXv2z2HS0pUhM2vOjXGOALMFaZlLJD3YaJ4ETiEl/b2vJZ8kGR
         oOutVc1LM4UgyHmooZH2FlN1dADBN9/gX4PabmvpSKrsZ6+vHN3yAO1N0e/650aruHL6
         mx6ofc+wqtrWX9wZX+eIm/rK7C9uMJMc2Ts1+agPaH8OEsLIFlI9SSK2hOmf35s67v5X
         dqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743179976; x=1743784776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hOXTmExdfC88ujIBURdRUnCcYxWTOg4zUW1tQN4nmg=;
        b=LiNBDFvHp8pOjZouxHkwPzDAIDTCfPNyFh3aDCGD/MoGRTSFVKPtwXOYV7jODb/hEi
         E+xVKKgE+8OFUUbwrEeZVPZUpHrYHkHsjaWVslJ/Bgl5heK7Lz5cEUd4NgQTdi38zpq4
         TiPKp8nFDHjxKk58vAF5jE4kQtewL3mS0lU2kaj2He0XFQcDDlb7rakqV72wMQn1sB/x
         Eik0qDCh5LpwxK+098x1hh6ChCJPz1fbKbWLmDp5K7Mhw/CMQEs8StLuhm2EdgNmD7gf
         EPsaQpxlaXHRWuE21CBSPl2qDONrhn7P9m669nz9umLbIjNDxnMVkZei1fWU98ydBitv
         UFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhesJgnZD8b8kuKjTJRvyOfwM4doOPz1VI6dVBB0Hnifzgois/r0Bmi8gRxXk1hB4VAwwAMImdA3DtWgl6@vger.kernel.org
X-Gm-Message-State: AOJu0YwUDLaHRFo7LBnz8jYv36RkCmgy9bh3UWax+NRjTOE3Ft2xCp9o
	/Jr77rk40i54Lrw+ZEPFffsrYTBkQPV7JMQweVMcJWM3ags4TtYkiVDNQ8cqjasINQxDQVn3sZd
	QZQA=
X-Gm-Gg: ASbGncvi9V97bub24VuoGWGKnCrtRuqqVUlRRDZwmH4yUcICdP4vwoucQ7tAwU/KNrB
	GB8ep+/M12BTnnt/PpnMQm/r4wFbI3ua3nj84j/J5sA/SuG4dx7P7cJXXRsRjrC0KkRcXMxTfI+
	HerbnWQgmrafG7qvq/bxFEu2fftTt2hx25w8kaPK3l5R4H1cme6Zl1T+BlR1nVY54IQee5X9hiP
	gIoHGXXqLvD5KG4vfmBxaj+pLEGIqtUqBocl3VkDqigZHp4FOiuQTqU6uWyqItixe2lCKwUHhDP
	BonHqkjDJLKLQoSKsgxxscHMfMFJtNs0ksYVF4LOVdMUFGNjEZlJtJgofZ58RcT5pNg5SKyUnng
	wjWaSgdIZuQ==
X-Google-Smtp-Source: AGHT+IHA3r1oZli2t5XDbjRwJh4S/4m8wCAROQweWFJl6NB7iP2fyGR3UzI9BtWNYWzZmpx/8AxZdA==
X-Received: by 2002:a05:6000:2102:b0:39c:dcc:fa29 with SMTP id ffacd0b85a97d-39c0dccfc48mr1713795f8f.17.1743179976093;
        Fri, 28 Mar 2025 09:39:36 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm3133448f8f.39.2025.03.28.09.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 09:39:35 -0700 (PDT)
Message-ID: <6ae076fc-e30a-431e-b75e-7f9b9d7bff08@linaro.org>
Date: Fri, 28 Mar 2025 16:39:34 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Venus probe issues on SM6350 SoC
To: Luca Weiss <luca.weiss@fairphone.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <6P5iXJOUxv3jsPGI11XbeZOagg2ht2Ws-WbN2HjXSFC_xeFgWyGM3a9T6y30gmys3KSxJF9Tv3f7jAehZ6AlOQ==@protonmail.internalid>
 <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/03/2025 15:22, Luca Weiss wrote:
> Hi all, and Vikash and Dikshita,
> 
> Konrad Dybcio was suggesting I write an email here, maybe someone has a
> good idea what I can try.
> 
> I've been working on bringup for SM6350/SM7225 ("lagoon") for the
> Fairphone 4 smartphone but have been stuck on getting Venus working for
> a long time (~January 2022). Essentially, whatever I try probe fails
> with the following error:
> 
> [   41.939451] qcom-venus aa00000.video-codec: non legacy binding
> [   42.162105] qcom-venus aa00000.video-codec: wait for cpu and video core idle fail (-110)
> [   42.167037] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -110
> 
> I've double checked the videocc driver against downstream, the videocc
> GDSCs and their flags, compared dts bits, checked basic driver bits but
> I couldn't find anything to get further than this.
> 
> For driver / compatible, it doesn't seem to matter if I use sm8250 or
> sc7280 compatible or actually the struct I created for sm6350.
> 
> I'll attach the log with some extra debug prints below.
> 
> My git branch for reference: https://github.com/z3ntu/linux/commits/sm6350-6.14.y-wip-venus/
> 
> I didn't try the new Iris driver yet, mostly because as far as I can
> tell, VPU_VERSION_IRIS2_1 is not yet supported there, just IRIS2
> (sm8250) and IRIS3 (sm8550). But I'm also happy to try something there.
> 
> Regards
> Luca
> 
> 
> [   56.572306] qcom-venus aa00000.video-codec: non legacy binding
> [   56.573348] venus_hfi_create:1708
> [   56.573990] venus_probe:450
> [   56.573993] venus_probe:453
> [   56.574000] venus_runtime_resume:649
> [   56.574150] venus_probe:464
> [   56.575453] venus_probe:469
> [   56.575458] venus_probe:474
> [   56.609600] qcom-venus aa00000.video-codec: loaded video firmware! qcom/sm7225/fairphone4/venus.mbn size=5242880, phys=2258632704
> [   56.621821] qcom-venus aa00000.video-codec: venus_boot ok
> [   56.621837] venus_probe:479
> [   56.621935] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.622961] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.623979] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.625002] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.626026] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.627035] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.628045] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.629054] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.630062] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.631070] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.632080] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.633088] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.634096] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.635094] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.636374] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.637532] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.638642] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.639683] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.640723] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.641757] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=40000001
> [   56.642789] qcom-venus aa00000.video-codec: VenusLow : venus hw version 6.40.0
> [   56.642801] venus_probe:484
> [   56.643008] venus_probe:489
> [   56.643011] qcom-venus aa00000.video-codec: VenusLow : F/W version: 14:VIDEO.VPU.1.2-00043-PROD-1, major 1, minor 2, revision 43
> [   56.643013] venus_probe:494
> [   57.667128] venus_probe:502
> [   57.667177] venus_runtime_suspend:590
> [   57.718537] venus_runtime_suspend:592
> [   57.718573] qcom-venus aa00000.video-codec: venus_suspend_3xx:1574 DBG
> [   57.718588] qcom-venus aa00000.video-codec: venus_suspend_3xx:1581 DBG
> [   57.718603] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.719144] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.720705] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.722262] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.723117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.724668] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.726237] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.727129] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.728685] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.730245] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.731157] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.732717] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.734271] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.735163] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.736713] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.738260] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.739130] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.743158] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.744729] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.746293] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.747148] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.753709] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.755146] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.759147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.760747] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.762338] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.763271] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.767142] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.768722] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.773201] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.774780] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.779133] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.780721] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.782285] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.783163] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.787151] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.788715] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.790282] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.791130] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.796389] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.797973] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.800924] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.802489] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.803128] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.808778] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.810356] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.811134] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.812694] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.814246] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.815188] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.816762] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.818334] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.819151] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.820692] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.822242] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.823110] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.824675] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.826248] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.827117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.828704] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.830334] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.831149] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.832798] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.834389] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.835171] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.836729] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.838272] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.839147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.840703] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.842284] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.843147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.844784] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.846427] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.847117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.848668] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.850239] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.851131] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.852694] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.854249] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.855178] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.856731] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.858286] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.859211] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.860792] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.862382] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.863310] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.864863] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.866408] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.867122] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.868663] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.868683] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.868690] qcom-venus aa00000.video-codec: wait for cpu and video core idle fail (-110)
> [   57.868699] venus_probe:505 ret=-110
> [   57.873495] venus_hfi_destroy:1690
> [   57.873519] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -110
> 
> 

Have you matched the GDSC flags ?

sm6350:

static struct gdsc mvsc_gdsc = {
         .gdscr = 0x2004,
         .en_rest_wait_val = 0x2,
         .en_few_wait_val = 0x2,
         .clk_dis_wait_val = 0x6,
         .pd = {
                 .name = "mvsc_gdsc",
         },
         .pwrsts = PWRSTS_OFF_ON,
};

static struct gdsc mvs0_gdsc = {
         .gdscr = 0x3004,
         .en_rest_wait_val = 0x2,
         .en_few_wait_val = 0x2,
         .clk_dis_wait_val = 0x6,
         .pd = {
                 .name = "mvs0_gdsc",
         },
         .pwrsts = PWRSTS_OFF_ON,
         .flags = HW_CTRL_TRIGGER,
};

sc7280:
static struct gdsc mvsc_gdsc = {
         .gdscr = 0x2004,
         .en_rest_wait_val = 0x2,
         .en_few_wait_val = 0x2,
         .clk_dis_wait_val = 0x6,
         .pd = {
                 .name = "mvsc_gdsc",
         },
         .flags = RETAIN_FF_ENABLE,
         .pwrsts = PWRSTS_OFF_ON,
};

static struct gdsc mvs0_gdsc = {
         .gdscr = 0x3004,
         .en_rest_wait_val = 0x2,
         .en_few_wait_val = 0x2,
         .clk_dis_wait_val = 0x6,
         .pd = {
                 .name = "mvs0_gdsc",
         },
         .pwrsts = PWRSTS_OFF_ON,
         .flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
};

Also why not turn those apss_smmu entires you have commented out back on ?

https://github.com/z3ntu/linux/commit/281d07ae965ce0101bdb528e98bf8c00c94f86ec#diff-ea117dfbd122406c02e5b143ee0969a3de21416b6c192e3b5ad024571f6e4bffR2016

---
bod


