Return-Path: <linux-arm-msm+bounces-50713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94282A57BEC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 17:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8592A3AEA95
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BDF1E5217;
	Sat,  8 Mar 2025 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArfQomQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0321E51F0
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741451220; cv=none; b=CjLRdXNTFramXLrC2YRtS14L199TN7YT++ipdt25WJ0339YLB1sXfQ3sx5Mz3d+xc5zTT5AtRli8tSBsVXPc8zeMe6kPnm6OiF3SeTwsgBEZCBjGt2siCX9q4BG2yC9AmzXPlNmQHnt348bWkiqYSfHviR9/pcMfbPVLx904w9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741451220; c=relaxed/simple;
	bh=+yeAi6o63XZJNcGLjqaeE8KAaksS4jx3rCm4s7/i3n8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7CE4CoxJSdPny5ersZQ3DRXezNBfK3QR7YQGC7JtDx8GQp/zTXDdrPjapu4c2EQ3+F41AhxVR7b8XcQCX+PGOQZ3KDeKzj5vzquoc8UR970ztApi0Vwuch0jMZAEZdpctKBf5TvtaCpvlqA4iZ3Y+I5Y32Amu7G9Fe8F/TTGtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArfQomQJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528EHXx8021627
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 16:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYF+00qdv9WUI0wGaGNAnqHDXSMxquIebpmxvyOuOV4=; b=ArfQomQJKYD5e4jG
	QgJuqgK9lzg5kS0kaBo9xezwzMEWi+kb+4dMC3nbX7aYPU0jv1HIRIx5QOxm7BI5
	jyjrsk7kro+4hxr7wJPGVRrQ20HUsYplfGwA6fIyesUNKFih57OWVM83YmepPGlJ
	rscVX02oOMp1FWtb4Ye7l/zU4/4ar2r7sKm6l+9SSSoSg0vwdPLC4uqTsYpGiPTd
	rsTFCcDtjSSUFdHmQMgs11evOft3h9LV5y6kjQG1J7O5pV+P9L9gotaBveZTzUHO
	72zAbjOz6oqASQp9PD6JICFk6Ic13M8nxmXaoY3KVdgOkpd939yzT4G3JC23m6OK
	H3vXyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rtt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 16:26:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476783cbdb8so618541cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 08:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741451216; x=1742056016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYF+00qdv9WUI0wGaGNAnqHDXSMxquIebpmxvyOuOV4=;
        b=fHMyLIC+NsM3p5KBjjT0pyXA6TR5rXhl9dllU/TnQ67xtJqee34TXqr7xj62wirK8T
         UsZ+ELRwhASRf85wIH6lSSkUW55DmbWv0bidMIkbhUTGVfwORXP7ooFVOBaAN1coPwAQ
         kTwiVCkUOhpDecDGstAMD975aZqv1W27+xSzdppoo9FZjg6oRNMzHOMaVx4Sd2im3jEe
         IudAYRKAP5EHQSiTkHZRsTkhf8a1x893/o8c8Bi8CS7GxnTGrNaKeDb280AnkZpFbigA
         kuLL6WOlZZ7Quh0twCkN6KejAl67ApDHRB06UL8vmQbOi2YKoqj4Q8UWLpzZ8tBbX8yo
         MZXA==
X-Forwarded-Encrypted: i=1; AJvYcCVHg5pV6hE6pm/wgnD4M0GGFrGc5CCFarsBfbbIeIfUeJkhRwzv+rNLmunOMUNsuGLaJySyrSgnWn7SxKtu@vger.kernel.org
X-Gm-Message-State: AOJu0YyqrVkjchTEysdpF+8mvVTdMXNJeyaBVTOrka8S2LaK+YW8X+To
	PEpbjyX4jVmyUYEFnCFK7pL2x0bQqRYzmaYbJ3WJu3sM3Fy1s6m2qT6LTGeQZeSDdKY306OWYSx
	HMsauTDeR8caIKgjEVtrKWiYlpbDESyBCKdAU6F3F6fyrwYBSdoKHTeKkFwOxEkHd
X-Gm-Gg: ASbGncv3/hlglVJ0SIGExRn2bu4R8oEhiTWaB/XZkLrwxfuWFFxAzs6Exn8avXZJaAM
	gGS+4TmRNWDyh60blY/fdJDvHn2gvDhRKbr/yAYcQCLMjVTw4mqIXDrmusuyZUJEXeqJGg3AOjC
	G8U/ak+aT0Qh+kYRMp8pT4BrdiF9fzIuhDLuzNIp2KlIHMUicm1gejfKKN0LKCkPAUlM5YsVL85
	ZiyPU9BUrzhFux7QqDSx9+gty9nga+e4A6hitVWEbvmHFiDc5yygfkKQBoJJpH127LqAySPLhad
	v5/0ZWUyBelxaRVXMnfjrF9bbLahH51z0W8LUVqLj0ueduUhzL0Ke+oXx8kJncbgwA2YQg==
X-Received: by 2002:a05:6214:5289:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6e908dc1841mr16900926d6.8.1741451216512;
        Sat, 08 Mar 2025 08:26:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZUnjdtmN4WApyPfmK9L8Dh6PaLf1jZkg4hkpD/S0iWGJt7PYVvTxd9gHzPjPtmCTD02+yrw==
X-Received: by 2002:a05:6214:5289:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6e908dc1841mr16900766d6.8.1741451216217;
        Sat, 08 Mar 2025 08:26:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac28847a0a8sm12558566b.119.2025.03.08.08.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 08:26:55 -0800 (PST)
Message-ID: <05c85f64-caf9-434a-93ce-08e1689ac980@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 17:26:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: add gpio-keys label
 for lid switch
To: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250307171222.7470-1-johan+linaro@kernel.org>
 <20250307171222.7470-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250307171222.7470-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc6fd1 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oWCs7g1MS80FOPW87D8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: so7mWLSosQm_GSraJIx8Rov8g2IXOlRP
X-Proofpoint-ORIG-GUID: so7mWLSosQm_GSraJIx8Rov8g2IXOlRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_06,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=997 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080124

On 7.03.2025 6:12 PM, Johan Hovold wrote:
> Add a gpio-keys label for the lid-switch for consistency and to separate
> it from the volume-up key (e.g. in /proc/interrupts).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

