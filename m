Return-Path: <linux-arm-msm+bounces-83613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F6EC8EC03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 15:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F30CA3AA74F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319B7332EA4;
	Thu, 27 Nov 2025 14:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nBkcTbUP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362A4224AF2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 14:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764253673; cv=none; b=mx31YdmPT3dLdFuWqZwjlojoC13dHkBtmJSAhA6iEZLsClXwUZv5otY1r/MDeKX2foFVe7UELqoDfmDiZlPm0CrxsL6DwoC6WGBspe2AlvQPv2drAQXV9ATSZRkYCP3TWfBZ9oPbiHx3YpjW/zA5jd6G1N+PxbJxglkAR1u3Bag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764253673; c=relaxed/simple;
	bh=VsxF4F1+V+wVbP+TVp2TXSyzJ/baeBpnP51twMV82pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgCel3IGfFHWnWeT2RsIlcuP1368r91eNHN8QIjvrSfeWQ+wgEt5FE6HTpNdlBmPgy+TAudJXTB2+GE0AW6yD0HjWpA3VQV1QFRT5tfS4SOjdjWD7LAjCsXLvv/RaoaRYayo/gABPTSg06yxJcK8gc31TP4reA256/GBXXOUlt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nBkcTbUP; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a4ab6aa55so315821fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764253669; x=1764858469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izu2FHuEoh3gQsex6rJEdJvdieWvoBfp7SLE5TF7nSY=;
        b=nBkcTbUP2ihqDxq4MvLepAdnt/JT0GCIn7YLHvJ/AW0uGqhshu+FT0OWnlxwkXQmGB
         afubwL1lwkjQ2CtJ3gid+B7Lf8sngQQfsWdAH9GNH9/8vVKYmCQHZoE6dHkXbdFXt1si
         pVrrMm0vrK6QaB21bzHGE/Pzji9y3yuLX3afOTzx+ZQ5HrShSG9LYolNzYzyOApfdb71
         y99iCZNYBP+qQCvl50mk+WMJBDmM2aG79Mw2y935/G5t2dOtzVk3bGZGpA8AmRel1f3y
         tD2ZR6K5rq1m0vsPjfNodeE/47Fka93spxNLlv33NCpN2r/4k7uq5GezqwvMc+t7yAvR
         X91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764253669; x=1764858469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Izu2FHuEoh3gQsex6rJEdJvdieWvoBfp7SLE5TF7nSY=;
        b=jX8h0QllGbsEGKaW/nNc1GCpnJa0fgYt78KHPrOXbodLDs/TZEAZsEv7atAJt7wEko
         lx2P1rb0zxj7uAo4Wesq+2/Lj2oGWhWrBSD8DfCiyb0v9jB5PpaTtpLOmhvx+vJC91+1
         VlLLDrblmZPmEkKFnMWJldtOUHc1mtxTfNf3a4mDefzeaPQPRSoVhmzdKnO0DR799fhd
         5Il9Bft31o77iClzeDnPQmfzKWLMo/CPsngeIPCzglvsogW9FpT9MfiMBwNteXB2I8cr
         7csVZFAOmmizU5MSMmaUC04aL9pNrM9stA5tZgGSMMsdLJ4lpatTQqtHvC2hEGUiObME
         hCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCicofSqUpVCCgw2H+5RWnDhjWSSDjGnvBKJii0h7zU16yJwSm7wH+BmYJpxzVRz08dVT/totj2RMTx+YQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwI3z3fT96L2YY7T1rxL8skJwj3ifhaDGPx1eq1L8JdN7Lb1lpG
	5Ipp5VjFTN/GobB+9jOKWaUDDEYqFAKVojnh+bfdnk9b789u54+lMMRyZmU3BWF2cw0=
X-Gm-Gg: ASbGncuWII/2APNYOq4OLMaHuB17aeVtT1dHzei8kygCho/q2p2KAUviodwhKYlh1fm
	nx6LQ/qFJwpflF0T1lOMct1uNEMPzDHqV0iV5qfLR+C7XpNsmXyG6SjQb9c92bf+Xq8N+OOmlCQ
	DyWxZsolyZGcO2uV+cHJcHKyZt5ZZYtx/cUXvsG6DCVmxSR0aYKenBcUizoLZJ/MzGRWGpuXohj
	sABkJ4AJnmOXDimj4ieQ/2Rnabx04mj+48hKVXzDAmIQSvFjgmKN1teaOF8AiPvxjrhYMo+N0Yg
	4cxgCRsPAiHWt0DAqJrbh0KFM2OR7vg/U0uUXZ+x5zXVhZJU2N/JU9IU/nPEWZmPt1KY5lrTHdO
	zx8puMrkC3tLTzeTzzRr3ulrHANxD+I1AAMcobG65h+mT6C87FoMdLiHIp8LUHAfq0XldiXmqzq
	JcwPt0bNeRmtiyTp0ncIHTiL60bPvMP9vfkgWlGQmSQ3TMgDtcyXENMXsRmeYN+YIhhw7HFHSsz
	627
X-Google-Smtp-Source: AGHT+IFt6vU27xKv/0kuU+d2Qo4LF76uFAOV+qiVtW1RJs/5m+HZGfbtFg/MAFAH3yfFrmgDtBZ9LQ==
X-Received: by 2002:a05:651c:3244:b0:37b:926d:5c06 with SMTP id 38308e7fff4ca-37cdc46f662mr32899781fa.8.1764253669119;
        Thu, 27 Nov 2025 06:27:49 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236e5ec1sm4034821fa.16.2025.11.27.06.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 06:27:48 -0800 (PST)
Message-ID: <d3cccdf4-8c50-4b6c-a29b-5b1388ce2249@linaro.org>
Date: Thu, 27 Nov 2025 16:27:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <20251126012043.3764567-3-vladimir.zapolskiy@linaro.org>
 <b07b88ed-83a3-46d6-8b97-e8661e2cfaa3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <b07b88ed-83a3-46d6-8b97-e8661e2cfaa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad.

On 11/27/25 15:40, Konrad Dybcio wrote:
> On 11/26/25 2:20 AM, Vladimir Zapolskiy wrote:
>> The restriction on UHS-I speed modes was added to all SM8550 platforms
>> by copying it from SM8450 dtsi file, and due to the overclocking of SD
>> cards it was an actually reproducible problem. Since the latter issue
>> has been fixed, UHS-I speed modes are working fine on SM8550 boards,
>> below is the test performed on SM8550-HDK:
>>
>> SDR50 speed mode:
>>
>>      mmc0: new UHS-I speed SDR50 SDHC card at address 0001
>>      mmcblk0: mmc0:0001 00000 14.6 GiB
>>       mmcblk0: p1
>>
>>      % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>>      1024+0 records in
>>      1024+0 records out
>>      1073741824 bytes (1.1 GB, 1.0 GiB) copied, 23.5468 s, 45.6 MB/s
>>
>> SDR104 speed mode:
>>
>>      mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
>>      mmcblk0: mmc0:59b4 USDU1 28.3 GiB
>>       mmcblk0: p1
>>
>>      % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>>      1024+0 records in
>>      1024+0 records out
>>      1073741824 bytes (1.1 GB, 1.0 GiB) copied, 11.9819 s, 89.6 MB/s
>>
>> Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
>> file, there is no indication that the SDHC controller is broken.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
> 
> 8550 has additional limitations. One was addressed recently with
> max-sd-hs-hz (HS mode can only run at 37.5 MHz), but when in SDR104,
> the frequency must also be capped to 148 MHz. I don't know whether
> the driver respects that today.
> 

This frequency cap tuning for SDR104 speed mode is not done. If I
remember the story properly, the frequency cap for HS speed mode was
implemented in dts instead of being a pure Qualcomm SDHC specific
quirk, because it's possible to workaround the limitation by slightly
changing a board PCB layout. Then should this new SDR104 quirk be
considered due to a property in the dtb as well?

FWIW, comparing register dumps SD host controllers on SM8550 and SM8650
SoCs are identical, should HS and SDR104 quirks be ported to SM8650 also?

Thank you a lot for reviews and hints!

-- 
Best wishes,
Vladimir

