Return-Path: <linux-arm-msm+bounces-52778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5034A74DA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 16:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8007F3ADDB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 15:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A314DDC5;
	Fri, 28 Mar 2025 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mZxoWo/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5EE3C0C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175364; cv=none; b=l5fXii99TtT6ovnKLdNyWZiWwL5LKtBbDcOyLp7yTyyiguE9nZ8xI18hkCAw5NGabtK9iPvR1G3zm1oeWgjhpfESsOw8j18QzG1eTu4VcPLVNe3SH1u7Of6BttKAWbN0vjztF2KY8rXvJncvAox3kKBOFCy8bH8oV50NLMwbscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175364; c=relaxed/simple;
	bh=Gi34vieMXSRVS+Iqe7plNA+Z/GwWw17RO6Fqh0sTklw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=t9Da+R2RwlhksGIx/PQrhDh+Nh8ICmflJ9lz1Me5Jghmut2uGqiiqZwmgzAWUIpkiaGQxYDOAIgvZoH6+v2FeNS3AFvLm9pII6n1DojHLC3WDwdV/dcZeuQ/6eHzfP06uqlBo828wgMsJNdgUV12fW9OQsP6Eu8TAuXHZ8heev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mZxoWo/H; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaecf50578eso389676066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743175360; x=1743780160; darn=vger.kernel.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jDosYwgJO0p8ryK/p/FbZtQdh1dImCHEzbIBk2gNw3U=;
        b=mZxoWo/HJ9sKdQvGnsuFJyS999/MOYW8DCUnJqRpTBrf4ifnOQsic7CEX9VHgGxS6H
         Ht87ZiZHTcYwdjAk9X3TNg20XU6oPnE9YYKczwGytyWioAAEV3qbOoofg27Arw7A4MoA
         Otyyoz87DNEvp2GfcOPi112QihCi5aZuamouA3qo0j+/fZtjA8uX54k6YMc/8etZyDcS
         BJ+Nh+AozpCQKtD0WUIhKT1cW1lEk6D4gkXt6o4OKNUwCBbZ/zn7QEWhqTxxZelZ6v29
         bhGYTM8J7A33ZNb+SXiVNYf7bp54MrJ7ZN3c31U9Gbq4GvWI5xYGB97VmfZMk1ejmqjZ
         p4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175360; x=1743780160;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDosYwgJO0p8ryK/p/FbZtQdh1dImCHEzbIBk2gNw3U=;
        b=TZXAdm0uT+g+CKzT/WWoPKz84MmFIRkmTxEoRbV3Zg7GUljcnOxcvoqxWQ0IbiVT3g
         zjX1f4M34o/2CnFbQedRCeOCsmKroPVzpaN1UWRgQO/F4xVJioHgYGJjpXJ0lOPVLuYs
         PUkSEzRGL8RA7cSbwSb2oUsZUag15S+irlRza4R5wcZzL85k/0NUV8o1ePQy/sonjFAn
         40Jou4Ps6Dm08/umVE0eh1oalvMlK6412zlVUR+jIYJ+loep3HZA3hLwyoGW3z9bPMdy
         Jt6nrt5SO25QJ3HOKfLpMadI1xGJFOdWLALcFv3J8Dbvt+s5JG1WUr+cmFpvYLIzKySb
         LQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhibyyVOLrBZ3SZX4HbYlYLQdmBYQOBq3TXK8xNMhoY6wfsfsuEYkndN4ZYBxSH7e73T/lmqdm4F1mAn4N@vger.kernel.org
X-Gm-Message-State: AOJu0YzlC5LmiIBBHdl9r/1XENvhzC7ezuqs/DXsnaQKIou5919cSc7o
	yx1ACpNPlEUDxLTpokEzFj3VkPtiqxAEp+aDO/SsRkJuxPGIuU//BynT2dITnKo=
X-Gm-Gg: ASbGnctwnLDbIcmM/D3zNCcJKvVmQxqSBqjg13cjRlNSts1tCbfGqtRTuOpHWhccKjE
	Hz0WghPIBtlgLd6nlkjinRjfODEiMLNlsYr2jfuU1HqmZKbW/DsYs47ykUQuhH5Kxx5FC8criTb
	/hhWjfGfLM2qHaTor/prpGdpGCpuPp5JYl7hYHEwYT24BMnCfq8NM+NrxzoLAquGBahhLFlDcdo
	6K6QaSUK0LkmyexciDfJIBD1T8/Z0PCdn6yxqgw5uP3rcBHdUvu2SRgBR803ZDA8AXNxYZlAYqo
	essZ9jKPkbPi1zS5Pu4qhTrFmOjbqQ1MsZ0jDLLN2UJTNSI1GaHxhfZ4LEoGW+Roe1XAOat0w4h
	vWJjROwC8aUcMm8JgvbdwVclAckwa0Ay/61FIsPjkywYbB/lhvzEJ2X5W
X-Google-Smtp-Source: AGHT+IGizFyzpYKVf71NOo5mNUlSLUCfdG3AzDfytpaiEuXZCrcMZptrDBhJuJB0+mj+GKSQcMhFQg==
X-Received: by 2002:a17:907:7da5:b0:ac3:45c1:34be with SMTP id a640c23a62f3a-ac6fae48ademr702195866b.9.1743175359800;
        Fri, 28 Mar 2025 08:22:39 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16ef8c7sm1560219a12.39.2025.03.28.08.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 08:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 16:22:38 +0100
Message-Id: <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
Subject: Venus probe issues on SM6350 SoC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikash Garodia" <quic_vgarodia@quicinc.com>, "Dikshita Agarwal"
 <quic_dikshita@quicinc.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a

Hi all, and Vikash and Dikshita,

Konrad Dybcio was suggesting I write an email here, maybe someone has a
good idea what I can try.

I've been working on bringup for SM6350/SM7225 ("lagoon") for the
Fairphone 4 smartphone but have been stuck on getting Venus working for
a long time (~January 2022). Essentially, whatever I try probe fails
with the following error:

[   41.939451] qcom-venus aa00000.video-codec: non legacy binding
[   42.162105] qcom-venus aa00000.video-codec: wait for cpu and video core =
idle fail (-110)
[   42.167037] qcom-venus aa00000.video-codec: probe with driver qcom-venus=
 failed with error -110

I've double checked the videocc driver against downstream, the videocc
GDSCs and their flags, compared dts bits, checked basic driver bits but
I couldn't find anything to get further than this.

For driver / compatible, it doesn't seem to matter if I use sm8250 or
sc7280 compatible or actually the struct I created for sm6350.

I'll attach the log with some extra debug prints below.

My git branch for reference: https://github.com/z3ntu/linux/commits/sm6350-=
6.14.y-wip-venus/

I didn't try the new Iris driver yet, mostly because as far as I can
tell, VPU_VERSION_IRIS2_1 is not yet supported there, just IRIS2
(sm8250) and IRIS3 (sm8550). But I'm also happy to try something there.

Regards
Luca


[   56.572306] qcom-venus aa00000.video-codec: non legacy binding
[   56.573348] venus_hfi_create:1708
[   56.573990] venus_probe:450
[   56.573993] venus_probe:453
[   56.574000] venus_runtime_resume:649
[   56.574150] venus_probe:464
[   56.575453] venus_probe:469
[   56.575458] venus_probe:474
[   56.609600] qcom-venus aa00000.video-codec: loaded video firmware! qcom/=
sm7225/fairphone4/venus.mbn size=3D5242880, phys=3D2258632704
[   56.621821] qcom-venus aa00000.video-codec: venus_boot ok
[   56.621837] venus_probe:479
[   56.621935] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.622961] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.623979] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.625002] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.626026] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.627035] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.628045] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.629054] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.630062] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.631070] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.632080] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.633088] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.634096] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.635094] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.636374] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.637532] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.638642] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.639683] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.640723] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D0
[   56.641757] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_sta=
tus=3D40000001
[   56.642789] qcom-venus aa00000.video-codec: VenusLow : venus hw version =
6.40.0
[   56.642801] venus_probe:484
[   56.643008] venus_probe:489
[   56.643011] qcom-venus aa00000.video-codec: VenusLow : F/W version: 14:V=
IDEO.VPU.1.2-00043-PROD-1, major 1, minor 2, revision 43
[   56.643013] venus_probe:494
[   57.667128] venus_probe:502
[   57.667177] venus_runtime_suspend:590
[   57.718537] venus_runtime_suspend:592
[   57.718573] qcom-venus aa00000.video-codec: venus_suspend_3xx:1574 DBG
[   57.718588] qcom-venus aa00000.video-codec: venus_suspend_3xx:1581 DBG
[   57.718603] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.719144] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.720705] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.722262] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.723117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.724668] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.726237] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.727129] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.728685] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.730245] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.731157] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.732717] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.734271] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.735163] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.736713] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.738260] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.739130] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.743158] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.744729] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.746293] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.747148] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.753709] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.755146] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.759147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.760747] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.762338] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.763271] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.767142] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.768722] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.773201] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.774780] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.779133] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.780721] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.782285] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.783163] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.787151] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.788715] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.790282] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.791130] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.796389] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.797973] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.800924] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.802489] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.803128] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.808778] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.810356] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.811134] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.812694] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.814246] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.815188] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.816762] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.818334] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.819151] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.820692] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.822242] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.823110] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.824675] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.826248] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.827117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.828704] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.830334] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.831149] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.832798] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.834389] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.835171] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.836729] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.838272] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.839147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.840703] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.842284] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.843147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.844784] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.846427] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.847117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.848668] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.850239] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.851131] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.852694] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.854249] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.855178] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.856731] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.858286] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.859211] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.860792] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.862382] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.863310] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.864863] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.866408] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.867122] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.868663] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.868683] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   57.868690] qcom-venus aa00000.video-codec: wait for cpu and video core =
idle fail (-110)
[   57.868699] venus_probe:505 ret=3D-110
[   57.873495] venus_hfi_destroy:1690
[   57.873519] qcom-venus aa00000.video-codec: probe with driver qcom-venus=
 failed with error -110


