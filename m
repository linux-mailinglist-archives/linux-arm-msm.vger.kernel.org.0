Return-Path: <linux-arm-msm+bounces-45315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23DA1424A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 20:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 651D616B52F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 19:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65795232440;
	Thu, 16 Jan 2025 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXJQZwt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F21DE894
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737055867; cv=none; b=A8Tt+UvLKkwprLUaK+AeUE7whBdvxkAegCZjjPDODxj/PKlzXEQqRRewxruyf1H4xo9F28ztN/DJ8BO4hydm9JdfBZ8mescKLepPqnvJ6l9LRIl+aocAyvK8s9ECUCp/TyKFUS0DCH3+ICfMhuWQoZxlqpcdXQJAMLzFY7PS7ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737055867; c=relaxed/simple;
	bh=1+rgxPKUqRlTG+Y9zg1A7XN5a4oLNbilwuPXG8NmHJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otWX6/4kEP4EXP72RLufR2m7chFajBgc3f/LiXFFq8xEV/ALri5hIVID75YeXo5OyovCfcCEyIgUupenQuq0/qncSH2AQo6He8NDmuxj197UUlTvNm6Psty95RGQsj10p1E6/BUX5hYIn2FgUk5MOto+vGpYL415J+CjU7+ZBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXJQZwt5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GDrs9M032210
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 19:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2oCQTDyFtzOd9uDuk0k/6IADn8jCTnEtRWIODY/B3s=; b=MXJQZwt5zFu72kpv
	RCn27+pG1vgqfm1+XSm4qU6C1/n2lf0zo8jeOY2xQ8jHveJ83l4BqhAgMkXFr+nF
	e/9CAjpd9GGjd5cXO/TLxq+pr9WRn007Pwq17aFm8yCyiHKGeuceKZdeDjyPstkC
	o2ne3SEcT/X1Jfdp6mVbpiawhx0UJtFA7a4fUHgsT0mWmp//uHPYl1AOn5szZF37
	oq6Fxka8W4IL7KhkDuNd1Vmx96slz9T8ASJBl3uU3SArVYIq4lBZf5Hjc1exmBSX
	/3aO33DY+ZEL9VaLwl1J4xpt0FKi2WDa1v+/fLPpbSfc/1/c0lw51N2Li6l4oAsK
	FKKnSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473d7gu8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 19:31:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8e7016630so3144236d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 11:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737055863; x=1737660663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2oCQTDyFtzOd9uDuk0k/6IADn8jCTnEtRWIODY/B3s=;
        b=eW/pmQ0MpR2/8cCbzKj/NzG7iTBaSUTBAtnVSsw7ESUp/vw7vtuGakoyYU9tCsINiv
         OpLPZikGK+oQOB4CncZJYttK2mkW4Vud5tU5ZSTQ9qlb42MkIGMXuuGNkV3thrvj1hpT
         2qeJilEbrmIYXtHlsp4KB/w1oVsCatRUc/H7g8PkYGjY0vRXrAMnRZRhIVZC0ozsrL+t
         yniDU1Aj8tCihwfSAgcqUy8OSQ5Rp5Vmh6hq8WgJukdmcz8CCa1wvjdw4g9RMaasfCPP
         nEDXaRejqBiLMA9BokGDAi4hbBQJtmITVZKV3V/UbqTTtdgJZ5uHLGzrEZhDFXSkdIH1
         eynw==
X-Gm-Message-State: AOJu0YzZhc3ZRZ6odEEHDg1EfmkHwkbQ/ptDmId5F2AIm7gE425T9kGh
	RRsPz3eKK1aHZbNZTZxHCjH1mFMXOIXsmhpnfoDw/FLD7UiO3SmjwPf67PCpjQ4YoHl9Ptebu3S
	JfJjV7EBqLp0jYCyRo+avPxpOlDeGLMWasnp5IkXyJsQYzuyN9erOTdF2aBRte23r
X-Gm-Gg: ASbGncvTNSMguIh7q9JXLzqibE8JSSW6llS+PI9G1XebzXqEeEma/myxo4IIfEh6YHo
	AEEI/6Z7u8e8IslMVh3Ad2Nhah1S2YGkh3PqojdK8duNnYOx7b1XoAWm05SZnIqLhhIxX6EWrQ9
	C3jPU4eKbpFsLFBgCR4IbTMjx9SY5dhScKA1jQvAZObv3ikYbZFB9/HLPF1WHq6KdSKT7iS3dw0
	8ABD4EFLyB/uF7y2Mt7BEITqsj3eOohrIYENv3S1mM3frayxiH8gp/JKswisX1tUEosM/hEXN8t
	oudjUUfFNEPUdNGH84A7ma3e4nKtbsA3e2M=
X-Received: by 2002:a05:6214:3016:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6e1b21f207cmr237146d6.8.1737055863099;
        Thu, 16 Jan 2025 11:31:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoEvs3dPfn98G/nJY/KiQsPoGomSjcKF4fvgXzqrXcQPhHh0k0bJ4l0NVlAcPX0Z3NeGEoWQ==
X-Received: by 2002:a05:6214:3016:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6e1b21f207cmr237046d6.8.1737055862745;
        Thu, 16 Jan 2025 11:31:02 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86265sm37902466b.130.2025.01.16.11.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 11:31:01 -0800 (PST)
Message-ID: <e08535c5-33e4-4f9e-a234-deae4f179371@oss.qualcomm.com>
Date: Thu, 16 Jan 2025 20:30:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7d8nam34RbRC2MW43IFrkPBgn548Gnnr
X-Proofpoint-GUID: 7d8nam34RbRC2MW43IFrkPBgn548Gnnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_08,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=711 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160144

On 13.01.2025 10:52 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> binding definition for the PHY driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]


BCR>;
> +
> +        #phy-cells = <0>;
> +
> +        vdd-supply = <&vreg_l2d_0p88>;
> +        vdda12-supply = <&vreg_l3g_1p2>;
> +

stray newline

Konrad

> +    };
> 

