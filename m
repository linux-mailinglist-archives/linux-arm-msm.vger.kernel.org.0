Return-Path: <linux-arm-msm+bounces-7548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501C831865
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 12:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A03D284055
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 11:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC0A241E2;
	Thu, 18 Jan 2024 11:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UoGktWMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4A2375A
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576981; cv=none; b=o/ZW5sVNB0jLtmL+2DjUShFInRWbNuZFcqPHntkvnsHJCNTKAw/qNGS73PXCSrJXtx2V1lJxC7oREO5wL2bNA3MZhV8Gax+VHV74VTykANJVrsMa5uviWSqsVclWKAQsQzXvfUqw3Np/Axb1rWPYcaDWG5/LGvAUMgvsHpniM2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576981; c=relaxed/simple;
	bh=ZUg+nDALZ9iB5b7RkM0Lwfi2slnHg1sv/Y8A4iiza2c=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=uS8KcrqfLNG0sv7MAbx7vnC+uRooRx7ZXa3MBUkxUs+16g7linyTHPkdkltL1gkk9cPafXbMt8JnbAoi8DAEQQZT2/3QwvZWPBDa51V/UbFaBE45IcVSmjNhGNiBncgzda1YiY597DgGriBlDXnPdCwKYAFbpzRkTabbeg+EJ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UoGktWMS; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd8bd6ce1bso79622701fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705576978; x=1706181778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3NU9q8fuPwXlNnVUQFM2gOiciw/kI2Xh7FbvsGDomg=;
        b=UoGktWMS5INs6E1jctw9LdmIqVPJ0gHIHnp7ojVexFqBiaXv5UcX2tFvpCgRrSlyya
         HXznjE8yvnx1fQ1AzxM6u1EjXCSLenzOcnjDG7cihpTsqjs+slJDADrSRVNVa/QYgZNI
         mZFpGEBSWbRhr9nbD4WIXcsCEqQIWL0B4G9rPdxJ63hBURycPdnQ7J9nvrDCo9PisB5S
         Luv0vpJFRZOOwaN5FW7flILhM2jgL+sRvfrMN5tPf0BghfKPBrOQcinjUFOPYkTf1/fS
         81IPo5rIgL1lElc4kDo9N7ATuyhfdnTSMTTW9TJk6hFH/vstA1G4A5oJqK108R2uMLf+
         GTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576978; x=1706181778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3NU9q8fuPwXlNnVUQFM2gOiciw/kI2Xh7FbvsGDomg=;
        b=FjSQZzcTXWt2LKQhkKOkO+2EfnUkTi5Cj7LG/4Jj3/HqhjKG3XmFZvWXmj/Y6Om/43
         xN9rtF+o9GPCiBuLVfSo4NwODJ4V6QmJzstZKq/i6OcOAbXeliW+pt1C6GrSaR4jgSdF
         iZJRBGe5Vn3eHvAFLNMV/YGcqIaQ4Mu+fuiLu7O/tRtwNMbBL5++k/z29Hh1xW54LWXT
         P2hEMrZ4kywYp/vdAIqWo30VjoCXdsDEswLTZdTXIX4l0gPjPrrdlc+WlVtZV0jdvtKy
         ySLoy1aaCViLV7xD02VUciNnnaPWhsFxzA4rY4aAUm/iSYPfXo0lyzVLPaXN9utS7awJ
         jM4A==
X-Gm-Message-State: AOJu0YxJl7WUrOFWItxwBWf89Tuk4qvD/vQZ3xtWL2NMOXGkTysls6hV
	hG3zgO3Z9IeRcv5oyyfpnIGKheetrbtKLBXd0ppTz7trAF99qoB+bOUCdbgyr1Q=
X-Google-Smtp-Source: AGHT+IGpz7/Cd6gh50m4lJ3awX0TdDg6mSlWBJ8XYZR8tkLeiQeIbKJcfJiuZW/OCLnj5uYQg09fKA==
X-Received: by 2002:ac2:5045:0:b0:50e:79a5:5462 with SMTP id a5-20020ac25045000000b0050e79a55462mr294204lfm.199.1705576978267;
        Thu, 18 Jan 2024 03:22:58 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k26-20020ac2457a000000b0050f147c0244sm125917lfm.292.2024.01.18.03.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:22:57 -0800 (PST)
Message-ID: <cd792296-2510-4b45-a90e-a0bf3a8fda62@linaro.org>
Date: Thu, 18 Jan 2024 12:22:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sm6115: declare VLS CLAMP
 register for USB3 PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
 <20240117-usbc-phy-vls-clamp-v2-6-a950c223f10f@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-6-a950c223f10f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 15:04, Dmitry Baryshkov wrote:
> The USB3 PHY on the SM6115 platform doesn't have built-in
> PCS_MISC_CLAMP_ENABLE register. Instead clamping is handled separately
> via the register in the TCSR space. Declare corresponding register.
> 
> Fixes: 9dd5f6dba729 ("arm64: dts: qcom: sm6115: Add USB SS qmp phy node")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

