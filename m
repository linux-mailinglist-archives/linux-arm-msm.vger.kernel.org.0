Return-Path: <linux-arm-msm+bounces-47464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1709FA2F666
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B424D164599
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEC91F4623;
	Mon, 10 Feb 2025 18:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZ8VZDR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1C25B661
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210779; cv=none; b=u28jzAzs3da7SQ3dc4DnlSHg1tAVL4rMyUcYmOKwBYSg8Xy67hBoljlmumuJQqBi+uv4QUlMBO1EQ1EyaM440Y4Yx0lvV98gu4qcCkUM0/9S4+v8r6IEhQWbvy3V4Z6S06jhbh15Zadz36dFCK2TF98BwvcxEZXo9YVNWlKi7OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210779; c=relaxed/simple;
	bh=fg3n0HiE40DlQQ7rUeZK0tnBLDTUz7qtNfDNbLXd14o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moU1CFl5RGOwxk4xDOqJKv+p+fhBSI20l5hFFW/vp1Mqq47pEM9TmnKa1L07C5p30F7dbIfmK33KVk5TBwYZw1Npmuhfce14gACAEsluchoW5BL6IoDPYgN04NWsCBpq3CvF1VkXqUFii+wUzGLfVCpPSOFIu/zI6Fh+ArRERlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZ8VZDR0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9HmGR001454
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vsjL/2KQY+Tev80gGOdQzFfbqYML6F7kNzyKYY9Wvfw=; b=IZ8VZDR0CIuH+dBG
	IW5QDMs0sSSLlyg3ckN1hgm5l19f7ipfAdDgFGD34EfKqyleqLXH7dGl3bZSXw0U
	Ll/CbvSVZQEPJq1ALTj4ylk58ww3uIikws0fxnubaZb982CIdJmipo5HEMXYkH3Z
	h2aUOoH/kMBQ8hpFhB/XdqPDVDd9hm//2P6qrISnyRHGyzk3G2tp2FAuwDsmV5mA
	cF4C/1JE5phAS8Iyle+c/HIOGb0GRd1SM0God3vmH3nOE2MBhvmDfVCWXAo4pPzw
	v2UHe701mDGamnq5vVYNDCdQkBFVGytBOSP9Smi0ryares2PWKd1+qSaAuBtVqej
	vG/QXg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxhddy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:06:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e422f1ceadso8590776d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 10:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210776; x=1739815576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsjL/2KQY+Tev80gGOdQzFfbqYML6F7kNzyKYY9Wvfw=;
        b=HRdIay5qHWM6zdt72PqLOS/l0QsNpervhaISV9zA8p20EXFvW2fJXrezw10IeOFuEm
         1/wOVr244gxEnCHjQSU5fvg6CydmBJy/jW3ZOD4F5nfynBHRZhZ+kHE+YcV+UJrXc9Go
         DF5bU4SwQvSjfXx5JWYvuxMg8UEy6ukVAbjEN82qyX/s7Lx40jMZJY7qMG9Rl/4YATTv
         2VT3SAUWt0mQjBK/L1aEuw3TS42sHuoDrLzsI2gAMR9AFTRWtpHSIPBrRX/6dJ1X8E3d
         DoaBHYRoHQZoH5+P/c/P+d9YmXm1upou2iv/4XC7bieoH2j2tcwqzdNsoWrzvCHO9yg5
         sAow==
X-Gm-Message-State: AOJu0YxukL14TDqV3rpzeIxuHks8zjdEgPETD6lgVHi1XpKcDVxF3aSc
	1Gt3WLxYbZz/7SqCwGwXHhWJ9E/qipVdMZNH0Sx2XGDMyO5U8hxoxwNy90csJgMQkuRYYed8P21
	wTxB8oF7hBYYcufJQSNvJ9sN3oGNucqitkHmYRPHMGBfCaxWl0l9J1FoqSoF4Awx/
X-Gm-Gg: ASbGncvQxTECndk8vN5QxIVPZmD670KaWSRTKEhU0DXhkEwDPR+iJyXz2qsBin4DBue
	P/4gluN4itDqUw7BLH66dkgILhS7wrTyZd6M41QX4ns4V6tbRzcWqR+VU2FMHnA/b4F+YXO8fMs
	jfp8G5c8WKeG+7EEMC0VbO0n6jNgtYIYbopqDQzr1CI9kfVkxhfHqszc/U+kvOi/X69OfDLlZDX
	Y6giBvjDKBu97jVpJebJYl+K5aPp0BEwQIROfEjB5LaUQuLHNYAzx1zvki6nGaYnjjz5IhK8fqR
	mxvOfs6PhrELZnuYQCDQQwF/poJkO721Nk6vwNgNehvLYr557cUvUIuayr4=
X-Received: by 2002:a05:622a:58cd:b0:471:8bb2:ed1c with SMTP id d75a77b69052e-4718bb2ee8dmr38878531cf.1.1739210776175;
        Mon, 10 Feb 2025 10:06:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQImmhmYCSQ+3nx9vW9Eev/sQYH6OwLcUExc6r6y7vYhFCtuQNRA2EBYx0mjRH4bAXUukGjA==
X-Received: by 2002:a05:622a:58cd:b0:471:8bb2:ed1c with SMTP id d75a77b69052e-4718bb2ee8dmr38878371cf.1.1739210775838;
        Mon, 10 Feb 2025 10:06:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d7f0a47dsm35109166b.31.2025.02.10.10.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:06:15 -0800 (PST)
Message-ID: <c21d1ea2-9116-4e7d-a1d6-2717d0e772bf@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:06:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/16] ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD
 GPIO
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wwFTjHuI9SzfEc8j2ZiVqzzlHPaP6sBk
X-Proofpoint-ORIG-GUID: wwFTjHuI9SzfEc8j2ZiVqzzlHPaP6sBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=678 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100147

On 9.02.2025 6:05 AM, Dmitry Baryshkov wrote:
> There is no need to specify separate HPD gpio for the HDMI block. Use
> built-in HPD in order to detect if the monitor is plugged or not.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

