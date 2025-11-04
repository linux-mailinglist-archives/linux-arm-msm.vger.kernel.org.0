Return-Path: <linux-arm-msm+bounces-80270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BEDC3038F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 10:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2D654F9855
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 09:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9B0325497;
	Tue,  4 Nov 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzSJAZLl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848023B61B
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247578; cv=none; b=BaKxcp8FPVn5Zk1bqJs0kc8tzdXVJBuXbT+1TVMJmI+kRBFA1C5XdX9a7uX7FTPCwXhViBow8lpowx1lF8YhuW+VDQSX1zNEvajnnL09Fs+Faot9ErJ0FnkgVUMWG53++dlHeCu1JwEKdl9zHI2lx/GOX6YKWt+IyKjJDa/f4A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247578; c=relaxed/simple;
	bh=LVUCOpp3kgbdkbFoCGBVeo/WTOIJWYE+4SUhoMULWNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcav1XDIIiTElTFtQVIab2kkWZ3NTOR71Rcwlc0Vc1x8+8d9tE3419zRIxgVO44RLF+WcN3hv45Lo07R/OyDViWLW1ooDVAiDZ7RtUBsZsFtqX5QlEvJoDPO/eekSyVpYLAe0S+Nf6sf9jOg0acH/M4Z1BS06uqFZWCXJJ3HCTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzSJAZLl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429c7869704so3302287f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762247575; x=1762852375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IclWx1Vbfu2B/23R8qVI8UP1mJRseEjCpbGNldPgb8g=;
        b=AzSJAZLlMqgJWxfj6A/9WCAapDGNkzMuX1EkFCvwousWKQMmr8nQVioLrLEm/FfS4v
         W7DBTcHz+LgAvw18JYc4+MPvvhIe09r/dMQtwBUcrhucHCWYzz+wwecNSto3TPRxxZUY
         l4snKHYFdPJ3BbsFHYnUSOnbkEetzulrBnuAkg1V3kaei7JrasdGOn3jEhXmirqgOmPo
         7BkzaTJ1dqhSH003szx9KMZIptpVAPJRnF2gWBPU5JENUkYYY+SUsLWePHhL2gMVTEQ4
         MltGqAw13OOE8KjOnPG1vxm78USkpdmnF8i8U5RKh0RK2SRWs3YWmTo1dwCvyL8NUCNS
         NrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247575; x=1762852375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IclWx1Vbfu2B/23R8qVI8UP1mJRseEjCpbGNldPgb8g=;
        b=eqPQYwnVWputLI94YjHbwsxqzcgr20K8TGOmi8LeLGbcL6rfCx6VBkLApLu1JldAa9
         tz5hCbBnTLUyDCR8DEE7VC1GevW30avRDTFfcA+0YvffT5qNrtfsVTKDJ1X0QYRDy4Oe
         xfgXoj+HU1oH5Jd+M93YrNes2VfZrFFkVRlpbTxMtmUjA7bGlAlj7PeAVwIN55oo/3PV
         PmLXMARS138uf/u/DkkSYos8OdCU+J32A+vQM3NYiz07WvAAQbEgpLZygdqL/75v7UX9
         vG/a0Vrv7CbLq1wv46NEihBVlh4jRxtuXK/xcGPtBB2Fxlf+4qohQGBorkEeh77QWbSj
         PdAA==
X-Forwarded-Encrypted: i=1; AJvYcCW1j4l1C+CjqALM1pRNDKFmGcdmmjHzjZaa0Sjyadw12KqOtHACGF79F+uxyWOORprcOgQZgsheMlOb/jm6@vger.kernel.org
X-Gm-Message-State: AOJu0YzD0EQQvEft3LruOmNjOqaqoE/BHbcXPeOD1PB9ss90eUnGC9x2
	UWYFIGZD+v0KLyZ8RJUcr1EvQ70uC1T1L8KA7SgxUNVCEbZfXs/L3i6Qiqf3sLL/TkU=
X-Gm-Gg: ASbGncvk8UQN8R4CfhF6AuhMpNfbSEbpJEnMTI3gi1wdBJH91qMgdmvMc/tk0fgpT5E
	gbw5+vBbtRE2aHqcAY6+G62FHmjZIwWeLBh2MnIPV80DeynbbhZ6UP4P37zyDzTL3OKxlNh1FnX
	3siGpOuhYhNcmjxRSwFTf44Qbw+osRjQli2LKC5Tw3uDLcMQZrgz6+k3yQvXS+nekrFmQwh+k23
	/fnAu8dcbH75fM45BKGp9lPwH8aptoOn96i8YnVy0G4FzFB4hMFDA4mlq0PmyH5yIMjs2ZStkMZ
	Sdnoqi5lFGWU7VUfKeQHHvYv6YXwhFi/5lgXgKMMbQRvDKVmJFlP0uWGRYVbHwweQGlz6b8+82+
	vbryRsniGaantWM1dILZP9VPCa8lTHW3NIqjwzX/6RtHeGb4rzMDbcuDFlqBRl3pZC3oFGDA9
X-Google-Smtp-Source: AGHT+IF/Pp9gxH4+zOc8gIHpFU6GNskkEvWlylLIg3b30tnX3gqQy97OiEWbEr2mO0tiZsgRD9TuYA==
X-Received: by 2002:a05:6000:2088:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-429bd6aa226mr13535138f8f.29.1762247574378;
        Tue, 04 Nov 2025 01:12:54 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc193e27sm3519235f8f.18.2025.11.04.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 01:12:53 -0800 (PST)
Date: Tue, 4 Nov 2025 11:12:51 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Rename vph-pwr
 regulator node
Message-ID: <3hecqgngqv5rc2642h46rericsypiyjo4yj5bu4jb5prrxta3u@aax3dipbshzm>
References: <20251102-rb3gen2-regulator-sort-v1-1-908879d240be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102-rb3gen2-regulator-sort-v1-1-908879d240be@oss.qualcomm.com>

On 25-11-02 11:22:20, Bjorn Andersson wrote:
> When fixed regulators are not named with "regulator-" prefix, they can
> not be neatly grouped and sorted together.
> 
> Rename the vph-pwr-regulator, to facilitate the incoming addition of
> additional fixed regulators.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

