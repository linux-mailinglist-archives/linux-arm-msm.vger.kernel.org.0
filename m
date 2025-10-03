Return-Path: <linux-arm-msm+bounces-75883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E8BB68F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 13:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 123334E6458
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 11:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5F427A127;
	Fri,  3 Oct 2025 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SccaffRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E63F221714
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759492075; cv=none; b=J/LHpRu29lMwJIPozGjugVbIm2Wbvy3fZS4MNlYtweExhL/HwVctHVCslXiYLHePnEbW4wH/y0BvqugnjINmlPenMJrtCrw9rJpL6ekIvx8DvcHXgfHUK8Mmw0rQb6OLVkiIlx+UavXUbFg3Tr0yMuSjcOgIuflnY7mPw+tJ1Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759492075; c=relaxed/simple;
	bh=2svmnL5W9fHAh7OCwYJI52rMygM4RGmMIOyvOwXoAD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bN/eSv9Gzb13qSL8EhsXjaouIAtXlC5vkYOMtODNQM+saXo4ew+Utks3h+NLqjMQnqt+OQZ+nCqR9hUFksxH7ldPT12AEmWuPm4HJAOzAdJ6VR64e/soi+HXV+Ral/RFejfK0J+0wx6cHtXAZEy3FAwdtw7DxBuREz4ThHjzosk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SccaffRP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3fa528f127fso1625453f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759492071; x=1760096871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/KgDb2EOtzAaHCJpvVmhuRV/FvIwMswDF2oXvMiSp0=;
        b=SccaffRPX6u+8az5OI6Jr1K+dDajMZ2CMEfUOIAZQXZnsf9ls82dEMfE72427SncY5
         hxUZ/Rek+tnC73/oo+mvAt3h+cDOl0BNbpB+1CG3V6eXZKWA31Gvl3Zr9U+RbTB9YY/S
         DsuPGu0o3EgGS9ApXAwff1d+RGnejieQ1QAgF3LmH5/NYDwb+kMl9XLZDKAw02NVQnl0
         FOHjouBLd75p4Y2MP8xqI223KKwHQOTQe5ypB9YyEdYHBnbRz5m1Zi8UMCfgMAkuI5Ye
         3AEulRw7H/j6pfMKVSYiBx4ET2IPm2hphymsC5sOHHm00d7SCddRHaVyB60xMxSZfVWl
         z+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759492071; x=1760096871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/KgDb2EOtzAaHCJpvVmhuRV/FvIwMswDF2oXvMiSp0=;
        b=YAdsMta8eJu7at8JBbHCRKsVhwXuVI0i4IsWNWv6SerJTpPG3T4DyRsn/u33Cq8Rxe
         6tQLyj+oNLSwkQXupEazv+Ah3ARL/j5iH3iXC/IUIkwsa8pmjQPqPpNAxtSuqC/TaqE4
         PvLMuxsJTdLTRj//sz54D1ubGm3Lx6ZEMV3CqAYLWIP/F3aZPz5L28UqIaTDKouJEX2e
         fLjdZt1RuGU6BUynKEdBQPh+loUEO0q+Ke6UfO41sEkM1kIc3tXUsotSKX/JcGBRpXnA
         fX+NgZbRgmfSWFfn3f/5GEFxHGQqgmfKPtlWOPVpHCHOu8uIK+qPl3VfUUYtQDPfBCb4
         CIcg==
X-Gm-Message-State: AOJu0YyKODm+Irbe/wN4ttye/+O4x75LMKz0om5zZ1NgrrmTnUmzUjAc
	pry3BQwlRS8ZerQhRTh7FPFWnzL36kFt4yBxUn3ImsrRWFH4wfoN/cCJLgd0A0Nfou8=
X-Gm-Gg: ASbGncvQf98gvOoB+3lwXoSFavBEt9HCZFcqydNbkIL57CODWgztKQHl+DDCSA5d6q5
	JINszm4A1fZTLs4ipXV3J6TthGUIr4u8Vy5DgIDyyemOdZmeC8BqKQIxCoKE41raAxOjkRXED97
	kI/TSNJjVeQ3AvwwfcJgG+coTCDtUGJwZKQ+QHdJ5/iWjR6Uue/nhIkRGQktI8PUGgxXhVrYyLY
	wQSfcZT4u0B+wjycIC8NwGzD1Nd4J2rA2klHBIUBz0E7P18t0t+4dhWV/qPHwS6dhFkf+ozViYy
	W0IjN3u6lsSI1NZDINgp2pUUMPjFozi/d/yAv9cLCmij3NB4nx160DTVghTWTubLLusP1kYCLK9
	Ek3dlG4yY8sOSsDhddum6smaeJ9UHWEcLURe/VDP5gXTRjm/hg6sQBiMalQ==
X-Google-Smtp-Source: AGHT+IESJDSc6mQQMKMQyR49ZqsDALXur77A+f6oIUGvguZQzEFSN2zR7wxxCAC6D4vSJcZ/1VddfQ==
X-Received: by 2002:a05:6000:2303:b0:401:ae97:a1ab with SMTP id ffacd0b85a97d-42566c0cb9fmr2236560f8f.10.1759492071508;
        Fri, 03 Oct 2025 04:47:51 -0700 (PDT)
Received: from [192.168.0.25] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe9bsm7694982f8f.22.2025.10.03.04.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 04:47:51 -0700 (PDT)
Message-ID: <56579459-4e33-426c-a6bb-cc56fcc2ffa4@linaro.org>
Date: Fri, 3 Oct 2025 14:47:49 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom,aoss-qmp: Document the
 Kaanapali AOSS channel
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com>
 <20250924-knp-soc-binding-v1-2-93a072e174f9@oss.qualcomm.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250924-knp-soc-binding-v1-2-93a072e174f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/25 02:31, Jingyi Wang wrote:
> Document the Always-On Subsystem side channel on the Qualcomm Kaanapali
> platform for communication with client found on the SoC such as
> remoteprocs.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

