Return-Path: <linux-arm-msm+bounces-80684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5103C3E433
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 03:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54764188A8C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 02:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664822E2F14;
	Fri,  7 Nov 2025 02:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXILmI2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtsE4UmZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED62D641D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 02:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762482961; cv=none; b=PX3vXHIMnUSdKb+G7xLJXdHXaaGR1RB+ln6e1W8ejUPa7kZSycHSA2vbH0SRLISeVm3MDMSbmxrDAysH0jy/TlIHDB0dyuG/diUtsMkcRm7gtAavvZLLzmen+Hbo/nO/98eSGVscsfsbSfy7UrXXV/i2rMPFu58hg7IuF4j7Gaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762482961; c=relaxed/simple;
	bh=hVUEwFUdTmrnOmPrh9hHeC9Lb8l/ziqOJLnnKvgo/KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctJGy0KCUu+1O5hBAZ2gXMfMY6qXP7evdSfrMn/EzpZhYVuZTYTX8xYsmW6sHHe9SBy7vDt3Wi2c4Ido+RQkoNgKT8rgbH2KTZW3plcMHuoT7eUCemRopfRm2PFdyp2G+6vaIHHJisYSDkcymqbRA6JQhSe9zFgMLabkGBzQ+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXILmI2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtsE4UmZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6HMW3d2326929
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 02:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpVjCnvayEUx7PEyaalgd7xuD7D1sS4+VgrdUxyRuIY=; b=nXILmI2KP4oKkNRc
	7IGAUlfZVDOs4ls148jeKxyufAh6cvzrVvm+kfmwwOWR8gjSGzUIrCvmy1kjp9HP
	NE0gXxDEIRZ5vk9EYl66YJtLuNxCnl+Sl7s080HSMvdS1BtCnGTw11Xy5pXoX+ey
	wUZ3GuEOs/EG1jvC3rlqHcSI5Hj85/Qp72llFZun9S/5gnoCJnDEb5Cx0L4R075l
	Kh3rUkmrCo989as6EanA3RN56cSvjD0OABy+ZuWasUUDKRJBBrpmGDyvNcy3jHyb
	tLAj0Eq80IhivAzmsh8Oh5k7Iod8AOLgZ9iFXwzhYB9qr9FZrgMRvSCAHZ/uz3+H
	huEV8g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h0v47s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:35:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b993eb2701bso298508a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 18:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762482958; x=1763087758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpVjCnvayEUx7PEyaalgd7xuD7D1sS4+VgrdUxyRuIY=;
        b=YtsE4UmZNEIkm0p2nWVpMofN5oOHj0s2AKK9hLs316o7JX5l6txp7LuxYzx6vfyC2n
         0Nj9qCipLwqQ9XagfFRtbhEPiR1YiZ0v44F6qFUTE6V6otQweDnw/MXORfWZ4PuYZ3JB
         rpKVTtYZ3wz0ZDnygxRAPTW2clygCC0CWFl/s/hJTALJfM5CS7GTVpYPBMBEXTWgb8jY
         bjsfaNeR/IqCke8lOox/btt6QMUF43zJhxjGmGFgUNt0qYBXa6rMI3DOo1fUAh+QehjH
         EbPq038+JTsF1arpA109WDTm4yhCZ5ZI7nWQAqzBc3PBgr9KRpft24zKUwKy09Fs7rFg
         7K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762482958; x=1763087758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpVjCnvayEUx7PEyaalgd7xuD7D1sS4+VgrdUxyRuIY=;
        b=TqlPn9u0ib3fYgi9cvImMGC5cf/wCEe2R4lO16q8Xzt647PSUyeP0dDLMIl6fNtn7u
         R01sNcvD3Xv4M60UFxXPqpqYnEU6lhP9mi0/cMnhqhlE7ZggwIX4StlhG1qKKpABcR/m
         e5XTxvcZXfEi0nZyyo3dPOnXJKN4BUMEOb/LGl/rDnTfXPO2U58TaWz7nZadcPYry5Vx
         suJBfoft5gJx6H0nCEzkhKeS+s1q0gf85mrqnwOsiyejuKWqFrQcDIvTF6adAisQYXa4
         /wedx1dY/M/wWQ0in8Dgd91L/hZywIegY2ZsOYlICDU3tYYi7K28Bop3F7mIY7JtlMDH
         tO9A==
X-Gm-Message-State: AOJu0Ywowz/JLXbBMfAuB52oaHqn4mneV+FSRiPJTY1kX9eMwHFcml7e
	M+PWhizX9kuX4xuMw5FTMT3W0pMGH0KcNblbQFs6+vXFIC+LegkNR5Qmp6ZWVuccjJdPZcP+yim
	pUlt98VdCErsZhvYvnY552jT3IF9i7B5stPP5i/XsR7GP5f1NIpGKgEZ7kPGAenpvA6fC
X-Gm-Gg: ASbGncu4AdKIHSxnkqNOklADz9MZy714CNxgEeAOD26E8wl92xs/rBBqVn+V2aY+S1y
	3pmGhY0vAFmkjnoqslB9CScEHuA33E8lqp0O0F6Q4uIyMfBt+wzJeeSFZuVEw+C13+Bl8JNtRh2
	hgm3KQK1k7i/noDYt/ebKEpQCQIkOGZL9IjVZ+6AQUSSPRfg8mocU/mOtGdZMom2vsBVrE7DuL+
	8H8bS1IUazFXTVQa4LengCYeygnBDQXQnGXyK2TqFIsxjXQGJLoJxwidQHkG2MvywwjeXlWbZWf
	LxvUgRyNpduBgmwnKQ4T+evPe50KF+wFfsK4AOLBjo1/R1M7ZFQVGBbXmZO1+FNwWTvwJgWjv2b
	rKs0OMlBhSDk1YmwGL1jJ8c84TG/5XGe4jZcfpNH4Kxqe0VcbatEz0RWYxwISN2DDgsmyJ4Q=
X-Received: by 2002:a17:90b:4ec7:b0:341:8ad7:5f7a with SMTP id 98e67ed59e1d1-3434c56eb97mr1520813a91.18.1762482957800;
        Thu, 06 Nov 2025 18:35:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkAB9G9VGMbR0AqlVK2RCHMNZSlrYP5lqcm+ufNtzCJ6HxBTjM3ZlbyYk/P372znle6bKa+g==
X-Received: by 2002:a17:90b:4ec7:b0:341:8ad7:5f7a with SMTP id 98e67ed59e1d1-3434c56eb97mr1520778a91.18.1762482957201;
        Thu, 06 Nov 2025 18:35:57 -0800 (PST)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c30b96dsm885866a91.5.2025.11.06.18.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 18:35:56 -0800 (PST)
Message-ID: <09160a81-0a2d-4e9c-8710-3c172e07284a@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:35:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add backlight support
 for eDP panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com>
 <29ef2def-4073-4a77-8437-41cdfac2fa9d@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <29ef2def-4073-4a77-8437-41cdfac2fa9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iw5uwwhcw-p62hkwz59rK83Rez9bfASn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAxOSBTYWx0ZWRfX9A9nVAmIuuza
 JRaIAJwVtqLt6xbgm8YGBI5MrVFkJsj+evmErDZFTy5hmd40mRerzTfihjHj3OjzpO+adjmxter
 LHqXSEF2LGN8eiTEi96qEqM5LRWDw7HcnWKnW6YXaI1PamGQkllRxczJ33G0Mr1lwZcS8yIbrFQ
 91SvsNOi420UoUOmiLUzaY8yQUVYyl9Q9xlCFcnbGVCC9gqYZUcAZBZ7XIb6TYyTMvMHFgHCZa9
 CdbGASosVCavJZVFSoHGGDB6CIo9jOTVkS77r4O1jpvZI4x/+RJ2gNKvztY/iSrXYNfGqj1qmr6
 mpFjxrfIvojHfF6u053OssZRZBmrO7YfIhrqwWu13gq8JszdZge/ywZLu8glbTC/tTqdUUHPjiO
 72eO6H5A3SHfCxgbxY5BSPRbFbH03Q==
X-Proofpoint-GUID: iw5uwwhcw-p62hkwz59rK83Rez9bfASn
X-Authority-Analysis: v=2.4 cv=PoyergM3 c=1 sm=1 tr=0 ts=690d5b0e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kwwcOb5VwNRYn0aRTlAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070019



On 11/6/2025 6:15 PM, Konrad Dybcio wrote:
> On 11/6/25 8:12 AM, Yongxing Mou wrote:
>> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
>> control node in kernel DTS due to some meta may not enable the backlight.
> 
> Adding the hardware description to the DT with the reason that some prior
> boot stage might not have taken care of it is not great
> 
> How about:
> 
> The backlight on the Hamoa IoT EVK is controlled through a PWM signal.
> Aligned with other x1e80100-based platforms: the PWM signal is controlled
> by PMK8550, and the backlight enable signal is handled by PMC8380.
> 
> Describe the backlight device and connect it to the eDP panel to allow
> for brightness control
> 
> Konrad
> 
That's great. Thanks for your comments and suggestions. Will update the 
commit message next version.

