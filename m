Return-Path: <linux-arm-msm+bounces-27025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF93893C03A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 12:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3B851C21856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 10:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160351991D4;
	Thu, 25 Jul 2024 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CkBCq/DK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B4198E69
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904105; cv=none; b=dOSKAnnuSKUEBHR0pxnXl7bPyp9kclNtfar/4SuDx6v1yBbGlnSy/5lghSJaPKgzatYDzB4oPKryA41E9ESPBwrWfG1mMx9OgjVkN3pW8VGpuo4vQ9TqZIAe7xEyGQRfOAGLX3yGPjcSbPK9VufMFiK/ybNcJIhUlX+BXIbatT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904105; c=relaxed/simple;
	bh=FSwQ0wkvzxTWHcw6h+wBcTwPcBci8zA2o8+fRiyVn1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzOF36Y6oTbX0e91EaDeyAhW79hqOPMMR/JCgdPNUnhrl6Oqn2wRs8JrtSBypLRAqVkQ4UKMQGO525EW/75jiQ++lKDAKPY/gBevYwexchvwkYU8EJrxoFuf4D/bqeec10pUPskZc48kZW/bp4uYKJbaMgpTsO5wNI97xTQbBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CkBCq/DK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a81bd549eso34633466b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721904102; x=1722508902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vFtglIWJthoynwbfLw8PxYyGxtoLyAotI7f+V4bt/oY=;
        b=CkBCq/DKJud2D9jfF6/OxVoyuVYX7OCmBfg3GelB7UAcq8Tr8JzrYp/cLzECRWrMz4
         dlZEGGvhDoiUxOysRTGwciiqymcUOsFyQTnJs2Ho/uqDj16A1hXViexe+16EhODWR7T9
         e9UHC95Z4dzhJ/5Gl/ILGGD9GZZygHFFkslFEohjEH3r4AZGkR/0+3ZEoF1vWYDyIVfk
         vo6klXPolInfaB3oA8MzPcTO7KF5TR8vTFrZWlkBZjuAcbhqfnzPchcuT3reOcSb/08d
         0qg6nD2IiDAJnuLHdEf3GuBWbFRrp0aiYiAciIrPmP8OduZZcmY/jbxnATdoXOHKx6pG
         Fglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904102; x=1722508902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFtglIWJthoynwbfLw8PxYyGxtoLyAotI7f+V4bt/oY=;
        b=fQOfFbiAJVD7ZJ9ddtrpHtS6eD8OIzWWMJAeuDTLf4zjH/40s5uiHXMzHqi0oQqDBC
         1BrX7HkuCBympu8gYk2QKK7G74glxOV4cIZHYlr9ez5nL46X/PhpMKYGmasFrwq7edGm
         KkjQ8g1fgsIFev46mBlVlmYSSSkKFgm24G8OpX6MBg3+CZm08DKOkIf7HVPrRvgH1GvI
         DErGS0pgoDGPNOk3WuB4DgVxmEdogfxnVtqBM1J5/ngvKKI7/2DInGiOeX7LJfx+eTdC
         H2/DfYnyg2FNC2ShXFG9pHsySzFHgyksCExHdBS0hJT90GmQSnL0B2GOUCYuh4Z8eRNR
         c+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXkt7PzVvPthdH6oCatU9xiKHApW4iJTj1KX/C6IthkxMG5la5zP9CRW5s1fy3R1EAYcw5RxXGAewg74MFZAT/wp7FkhSMOFzgxwtHrHQ==
X-Gm-Message-State: AOJu0YwhvF7lbcKYWLhvh3ub29DsWWs0/1L+BrNzQlLCsRlk3573sdbp
	75vxbDqqMz1BKIcIQsjxmyL+DUdOORMsVtkzXWFePNRkwHtctimLzgoOld7/6yc=
X-Google-Smtp-Source: AGHT+IHVvxlnfI9Ukx+jT1YweIaLcPDCHDq1H4IxeI7Mgyx27l1uhNoieLy7E64mr/e13aJH6h5AiQ==
X-Received: by 2002:a17:906:7952:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a7ac4f18839mr190070066b.22.1721904101586;
        Thu, 25 Jul 2024 03:41:41 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acada25a8sm58650166b.175.2024.07.25.03.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 03:41:40 -0700 (PDT)
Message-ID: <1a2095f9-b46f-4299-b07c-2fb628153ed1@linaro.org>
Date: Thu, 25 Jul 2024 12:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] arm64: dts: qcom: sm6115-pro1x: Enable ATH10K
 WLAN
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
 <20240725-qx1050-feature-expansion-v2-11-5fac4bbd946f@riseup.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240725-qx1050-feature-expansion-v2-11-5fac4bbd946f@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2024 3:42 AM, Dang Huynh wrote:
> Enable onboard Wi-Fi on the F(x)tec Pro1X.
> 
> For reference, HW/SW identifies as:
> qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
> qmi fw_version 0x324103d6 fw_build_timestamp 2021-12-02 08:20
> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.4-00982-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

