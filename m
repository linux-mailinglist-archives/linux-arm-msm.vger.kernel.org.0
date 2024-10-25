Return-Path: <linux-arm-msm+bounces-35937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 274299B0CA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D93728356C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735C1209F57;
	Fri, 25 Oct 2024 18:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtIQ1Ntt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85D20D50B;
	Fri, 25 Oct 2024 18:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879652; cv=none; b=gd585jjzpHnrM5/wfD1wCm3QSq9y7v8F1UnLn1Fw9qAdRc9Q63Mqevw691aj/Vl5Xpyl2qJHl8Yog26i69ZUVODMm4IlK3yaz6lvi/Ahp0IDaEALvew3dCkXZo9C1fRILcANEX/DJpRsz5pYuK2jN5+dzZ8nrjDsFBsLbQ8mqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879652; c=relaxed/simple;
	bh=k0qdDjhJRxvnvPuOAehR/si0C6eyh1YiVDPoprljYow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKtlF3W7FcyD+aV7zLH1FXIxTQ6nOTlPglFwgm14EuT5QhAroZFKLRV+QgitcpQe6Yla9gEgSzN2Aptg3pr59/paTmLN/a5tiv89OPnWUxcsiWOHrRft7vGp0YXo6r2Ko8j6alJKavhfg4QP1KAi7T9actyK5kYY39bU+Cb8p0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtIQ1Ntt; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso33102671fa.2;
        Fri, 25 Oct 2024 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729879648; x=1730484448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MOmFcx6s4R8oMFmEJ0TUjUOkYLGUyuKkU5a1K4rwlXQ=;
        b=NtIQ1NttXNJ/82aNaVy5CDzQu8tiO9j02hcwhbVuKf1VOEzMITtNfTSiIisvy97l/r
         F66+dcFdwhwQTd3/1Sg3IL9fJA1kl3xG0Hojk6yU/HaqbVRWWL0dR4MpZlny1ssNstc5
         NugrD4PDC0q2+PhadNcMKfiuWwnj18vPIrt+jiUSV1KJD87DDk9Yzte+psSDu5qodEg/
         lgdKfnxiYoZA371H/S8/aPauU38Kj7ViqjLN/tQmQk7MuGNdcF2Um4dPEI9TTXPDVjPc
         CzIDh70JnCb+rcA4V5dwZKIkQx+SFsu/9VPzfW7OM1q5+JwPMzVzPHSIt7NHvJ6Ci7ax
         ahkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879648; x=1730484448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOmFcx6s4R8oMFmEJ0TUjUOkYLGUyuKkU5a1K4rwlXQ=;
        b=tGdmH2Hok+sdR3SeHxCPcaO+jKDzApHLzuDluzfq9hzbQ/EyLxzWDAK/5gXf6+/Q9q
         1Iw6I32AALINOwuIgGdYvk1edIxjVFeBS7DQqIEsBEGmcR5kCXZhDiNnxtt2OIexcSal
         AiDPQ0xg7nkTbxBHxf/68nCSi7QAB1X00qLjsZjCGDHPMqTgnc/UqOOXVw6dEfXkTOvM
         ZaE90z8HYanuLgVbpBndVmQr5eyA8kdguxw0yzgNflSRtL1T6d9m5BrLhyPlsOTJ2cUa
         TsH4EUbLSDIa8gJLz/E1aKiyH8e3SFINpTiL8hWARVdPq7w/YVOs8snwUSJyBjZjzpGZ
         jwgA==
X-Forwarded-Encrypted: i=1; AJvYcCUj/+bL4w34DJpCrntjvaYdA8vp3zEtGbOz+Qm2u1iuYJf/6pzap034LTom++OBDC4oc/Wsss4K2f9xU7zR6w==@vger.kernel.org, AJvYcCUvNnT6Ct42QoapYAM933a144vsbaVi/X/xKHPFeXw+qTjhxvbfeblZ3VnPFMkHAvHuNK0aJ0M4CNMERA3u@vger.kernel.org, AJvYcCW+4BZ1QhoyiVbHcRbThDnCMER9dP3JD4IuWoW6OguCXaq7HpoLSIVU/34r2fRsZfQxqEDT+S0ETx8y@vger.kernel.org
X-Gm-Message-State: AOJu0YwwR5pYcc9ilAjd30AOx0beNbPHY+uoJRHHP7GbHJlZp2k5+pvM
	NY+8jJ7GID90YNEks+qkF/+rAWnP0IX8Nt6PewCrP6NtkIuUu8vhu3knYg==
X-Google-Smtp-Source: AGHT+IGy/qX+6xY7tn/2+qbyCjKNnOwvI7Q2YYyhowKIrsDdb21IngBHGw8laPLFPerNMVDsS+daTg==
X-Received: by 2002:a05:651c:507:b0:2f7:6653:8053 with SMTP id 38308e7fff4ca-2fcbdfc5394mr1659631fa.18.1729879647846;
        Fri, 25 Oct 2024 11:07:27 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029564sm94893766b.51.2024.10.25.11.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:07:26 -0700 (PDT)
Message-ID: <53a97585-7a69-49fd-95b6-1265b378e85d@gmail.com>
Date: Fri, 25 Oct 2024 20:07:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add
 cma heap for libcamera softisp support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
 <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-5-cdff2f1a5792@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-5-cdff2f1a5792@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.10.2024 5:43 PM, Bryan O'Donoghue wrote:
> libcamera softisp requires a linux,cma heap export in order to support
> user-space debayering, 3a and export to other system components such as
> pipewire, Firefox/Chromium - Hangouts, Zoom etc.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Probably could use an inline comment

In any case

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

