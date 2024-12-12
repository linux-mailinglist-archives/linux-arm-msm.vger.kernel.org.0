Return-Path: <linux-arm-msm+bounces-41836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FC19EFBCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD1DE28CE4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F441DEFC8;
	Thu, 12 Dec 2024 18:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkTjskcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC205193402
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029646; cv=none; b=JnKiCyJH4SHVuux757pI/APePG6Z3AaYd7jTVYnNiUllGCkAqbnLzaD/wKOyi3sCew/braJ78X34niAyjdLVmfninFp0irG2zdrm6toDov2wjez740DGsnZBwOFmzh3M60vIfRuq5QiTpTSn0iZY9CgqPKTQgl4/gaDfQr5BrCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029646; c=relaxed/simple;
	bh=YqD8X8dTSLW0UhsiLYoa26fBkK7MqXLrmruLEfDm07s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWiolpcgqqcc7/+EiZjr7tfMuUlTkZDDIKVGAMMl23K98StLTL/smiG2X8NM3um31aacdXJ2MNgk3Y+7zWmxFsCsC/c5VTB9ULGqTCK7NmzQAiHFLb8xxlEpCMnor0q+S57lXVRkahH2JeA8OXpEm4SiGoUlZjlawnfmTOM0as4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkTjskcd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC9kmTC031133
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTamirzBNQlHmG4r0cKpNNbWBIJC1+oLjE1ff9gQBis=; b=VkTjskcdMf07zzCD
	wEBzCOrMP5vjivpTQlZIAPePl6g2+qlqAa9nk27KYcNYSf4Rl/FauKSraIi8h3Pr
	XLHxfR+lxehVixkGfg0WClblp4F2PWF9wA8rejil1lybbf29x/XPnzeO8YgUmE2p
	OGeBjfEJE0sqv+QGuthdoaCCXD5HiIvLs0Lkg8vb4qUNLjwJyXKF+PkWtYE8qIQK
	cfuVTqgAfePZmlnkGGqs0CCoKFM3q+X44YjV28VkJoiiKpkMALLTR2of5qlw/3LR
	n3pRRsjd1VaWFeoySlTFqwDgztbbK3frBnzjj+4O+a+79zI8mOLi7ikg76hbaI/z
	ZypvQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgehf8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:54:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4678aa83043so2357021cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029643; x=1734634443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTamirzBNQlHmG4r0cKpNNbWBIJC1+oLjE1ff9gQBis=;
        b=X/Nj0dGc2bTriJLaxxieVkDVcVz/efhg7XXXIZdLCs+S6IRelnl0lLdnP3ROMmsuSw
         bIEjP+LTOOogkH6D3wU2ezJYleUDU2d+ZNVzni0l+s8KgN6bqmqL0czXzftzWNG4/lMz
         BcvhMnx9kJQyjSKgggWyZ21jG6K5VOoRJcnePHw47jBOxDMoNcLpz51G17b++rsiXzJ2
         JBNIOjVIGt+Br3Rh2HYXxOgmtd7ICVMrQLbTv8UkLH7dqjFOMdz5Q7A6mHdvNoYp3dOD
         QFo3vb6NkPsgArQhLEv2FtPI5ec38qYqzcfwrPsmW5512dysxMs6dFWkMSojdKkzDyBw
         HvOQ==
X-Gm-Message-State: AOJu0YwB/0lL6AiJKHZ9xioyF/4quLXp07KlMTZJcz6YvqgmNKOY8E8n
	UbkkjEgWmXHUEP8FJGyJo0fmt96rXBMS+iq53wiTExzqEDm5BY5Xe+RSMTaFCRtfoDj7wt9h7WP
	BzIN6YxT61QA0OwXUk+oNQ/FG0l3xxK5EoWTotyKZxm3XXY/26ntufDMmIHmDb7qG
X-Gm-Gg: ASbGncvuED6FuD7yBUod1iwuj/5vgU6+9E5NOszwgRDj6JF7TIYPGmellv5V/IFPGQt
	8qizPzvAubV/w4lF4eAsRmxmntxJvxQEqWv/FDottqw12Uzav1H+AeYbX8+dHuIKDrHsaNC4sKb
	gd7ARDVmoiZ6QvM4VfabgGt1p2GyAKrKKh3242dxHed5yyFbaSWVStntVjl3EjWtOdgEkX0orPi
	HREpk+NZXRrD4YinUCvFgGYSkmYRDb6Xw+KNZ0+vBka4PdGW4xexMIhbAc8fobsaNt9MxTdTF4L
	2Zr5vtj29rbK9sSIc+ZORAD6ZAb+F/Le/GtHzQ==
X-Received: by 2002:a05:622a:134c:b0:467:85f9:2a72 with SMTP id d75a77b69052e-467a13be41amr9729691cf.0.1734029642927;
        Thu, 12 Dec 2024 10:54:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA91CN7gmMtUSOi3v4xB4Yyybhvn12hPNspB5otAKXeqmK0F+T36aH5EtifJ1tYpQMb5Oneg==
X-Received: by 2002:a05:622a:134c:b0:467:85f9:2a72 with SMTP id d75a77b69052e-467a13be41amr9729421cf.0.1734029642562;
        Thu, 12 Dec 2024 10:54:02 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3bf50397csm9448387a12.79.2024.12.12.10.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:54:02 -0800 (PST)
Message-ID: <82fe86d7-b22e-4c69-9a37-e25185d9ba00@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:53:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 12/19] arm64: dts: qcom: sm8650: Fix MPSS memory
 length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-12-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-12-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V2OXmMxeSWZg1d4XMBWd9b2n2u3W39mV
X-Proofpoint-ORIG-GUID: V2OXmMxeSWZg1d4XMBWd9b2n2u3W39mV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120136

On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
> copied from older DTS, but it grew since then.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

