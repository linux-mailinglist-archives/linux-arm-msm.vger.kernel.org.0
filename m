Return-Path: <linux-arm-msm+bounces-81708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B08C59ED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CCEF3AF4DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E112021FF30;
	Thu, 13 Nov 2025 20:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMRbqKwi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAqMpwHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE527B348
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064939; cv=none; b=FhF4ZnDAjdngbH0CTlIF4IUIPw18ppjLvLE3UK4W4ZKnRZAyLWlzQG5Atr4lsWz3QBNrRMAx9u+3qsrjpdM7BXyKvN3w4thAbiLnRZkib7VPWup0iMAthGG7qZYMKeWjo8UTCK4pBOX3348bhQH+twpsVvIowxSQK5GXa8233XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064939; c=relaxed/simple;
	bh=2/Ubuvv4CRNzD5FkKlWviFf1YkbHNjdYEKg/lElsMpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wyn4i3o7PAMKK8i27KmKA/O6ChQxa8J+x8J5F1fKPxNxfnu2cxaLJRg+pe1mdqFUkHLk1uxpupf5GfwmMfUoO/wVc+C6fRlZjZRR7aSF3qT1U8BYuEirC+f34m/vylZ7etVX6ntcs5suQHFVEVWGWmLEjo5Dz5wj88wuBhA05Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMRbqKwi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAqMpwHG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADG8oog2993508
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILd9PUMGN2TDvVwIqXslZCpGKIvmjdh159cGGGmejh0=; b=fMRbqKwiuIH8ZEd7
	Gfs36gODraaybkk6C79RshPCRHamKWp6cqxOyCpTYWZHzbTz9OKt1d3aK6PCHePS
	EdUVcLzpVtvPxkw5R3VChZBh3b1vRNHZtGri1vcyw55kbvI32CrQZM0YDI4DsYu/
	SWnpw+xNg3/PPYHLgcgo6Nnk7s5RrbMqJPVoPk1MTO2wyF1Y9Wyfo63KDU9tY3Et
	yudxGYV3AqnQY88orvexm4+vgU9T9wGFBhyZ4qvMLVtN7u2tfAxXrNBtwEdPha6j
	L2+Z9hdZh0Io014C8qwVeDYXxqKU807JIAHaIgFZOsVklRyokbI1LBwRquLBNfrc
	rBDeRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jkpas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:15:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29b4864b7so412012785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763064936; x=1763669736; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILd9PUMGN2TDvVwIqXslZCpGKIvmjdh159cGGGmejh0=;
        b=gAqMpwHGemur94S4+6uKdK0rbxUnCsVLaxkNQrBQFjmVaKMkFqgZ97xlQKEpoBRPft
         CBkxiYutIQG0FP4AGyTSrnNV5REb+qXdM05/CwJJaxbZU/ux4WCmy2R6ju9ZDO5fKDLU
         XaEt5BMaRZkeYTYBYxBYrJzeO/bJDMUcJ9a3rHRRpQF6SpysFHnXW/0v2m7Q9VQs2n+c
         CGzPLaTa5bJH/Mvn9SREfQSg7iJx2dWXJHEgH3Tm9P8+f9sY99Ln5oemTMkvMqfXHkmG
         Y8Mfn20rKWw7aHl1jXwqOycls48FRr6vODzBzzU9njMW+zoBkNm8OTTHd6BIvmXMntNq
         aovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064936; x=1763669736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILd9PUMGN2TDvVwIqXslZCpGKIvmjdh159cGGGmejh0=;
        b=KdeEh7aN24gdOhuH5rKeuSsjFTwNVRT/uOeE+CFOd4T5lEDCAqsZWr8q491khB0fCQ
         idVSetsxn96K/0gEApjsuqANtxmpbh5AR4I67Vvi3S9l1i2WXg34B5fhrlH9yKi1q90/
         eEHokSYNOZgcAiTRgsCOpEtHjphBD0Ple3CQiyy30fVEctmJWZ7j2yrgaet1LVTuJQW8
         FMIzKaXB46S/SydgYVXb1rBWu2DvOcht6CX5T4ozisv7QZdYJCBjM89rQ6QqRal+1+nL
         rd3S2qWDSXZkxdKEplZah5jlE7pfTzrAshVzGlZ85JWFn7f1AcMCzFeogTHT02MUb+pY
         Vcgg==
X-Forwarded-Encrypted: i=1; AJvYcCUOlL7hCjmDNRKNs3nOrzToz/67iY8FZUKjS0N8BZAE4/tyTp2kDMNDB/PlKX3N5dVnqLabtfSZ/plwIiNv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92tphedDPT5d0AECZjk91tfsX8B72mdALNPFXeFaUoG79+6mo
	t4JkNRXPMhBXnG92T9qp9hFchoDmAnoCbUrkAwHWVfEHpO6d5T5edYryEBloL9c+m9ZkqCF0XhJ
	lbv6ljMLalUnAEFnwlWNl4B7bLohQVizvb148bmQksC7LXhwfVMVJmKMuBQd/bjSD/mt6
X-Gm-Gg: ASbGncv3LoJM4HkXeSfvEps2AIFYH+hbB8ZIZQl90ycqIJY1QGvQ19WAGVFqTFTl+Yu
	95QC2vTWPSY7je+M5ptT4r3UUfZZUBIhfYxqZGbr24v5Jmqq+uLdU8DUTh37vYrJP1EJ2bLRqWz
	iSKOJA81iSqO3ogKqXvyJjqL5Kx29YOvfIvQ9T9WqkWqdJZ+Swjh1zcK2dboneVUJKF5U+MLW/X
	bLVL2543nokfO9APiRddtvwgcly6s9paE3WP9qfSUxEOhImqeIPOz3RTr9sCny3CBQuliaC7xzY
	PENTd7NkYn/9pQEtdOPSqXxPPS1806lNi3GdM4Rp2al/Xj6oTo4N9Lk1VEqagB2P+EP3TKkDhow
	za3jP3TTsEXyfB7BnNvzgoxCsaSElEKXL+aLmqseJXXmvh8PVozMlFNLtuU7A2IVs8/uoC8A0dk
	a0yFedSSsfQrzx
X-Received: by 2002:a05:620a:4110:b0:82f:10ac:450b with SMTP id af79cd13be357-8b2c31c7699mr92098585a.65.1763064936396;
        Thu, 13 Nov 2025 12:15:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnqy2FoCmPRnlyXOKKZi4eMTrZOtfMsOc1+d2vmlJDOz7xyFgnjO1/YYJpqsIHOPAX691hHQ==
X-Received: by 2002:a05:620a:4110:b0:82f:10ac:450b with SMTP id af79cd13be357-8b2c31c7699mr92093485a.65.1763064935832;
        Thu, 13 Nov 2025 12:15:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080e4sm6015221fa.2.2025.11.13.12.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:15:34 -0800 (PST)
Date: Thu, 13 Nov 2025 22:15:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        quic_shuaz@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable Bluetooth support
Message-ID: <feaaqnezljrvqyxd5hvkmcjgezl2cqnjw6gmmu43a3h6chs3vc@cx56pcgckwoz>
References: <20251113130519.2647081-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113130519.2647081-1-wei.deng@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1OCBTYWx0ZWRfX+mRw+hLRxVx/
 R8kbRL2Dc6LI0piEAFM9RVkCa5JYNlJMmG4/V+TYTg7XTgGs+VHKys6IG2hzYf0Lotp0rqIsxSz
 uy7MtMOmt0Bsjti88Gkh/dTKOha9/8wonlXvEcZXG7b0jjSfZbrsY7FxD0YjyR0WYiNfgragGd0
 OXl9qmAT7WlMKHL2X9Ue+bP2ZiTB1IDVTwH+AArOdFzBmfnc+dxM2oY8jvLzKn9qGeBkV23DkvK
 mA9VS6+EKEC1oVgFa3rgi/r5eDEDnrftpPmd+bfCrfPIEFSgi46fXC6O4OWNcbl++fwfupttc7n
 PckjnBhcI4WazMbzLE0dvrBLgLQjCIQ+RBegFvC9FRsF8pz01pD+P/gLJQA8pTaC4WfCv4MUa1a
 Yx7R4MOKHc1fDwe+J6yUbf7CvjQLHA==
X-Proofpoint-GUID: H3KUMDTnLX9F7zFwBmuq0JF0--ZN3d_3
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=69163c69 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vuKYHiuAbYjNwaP7v-kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: H3KUMDTnLX9F7zFwBmuq0JF0--ZN3d_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130158

On Thu, Nov 13, 2025 at 06:35:19PM +0530, Wei Deng wrote:
> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
> Bluetooth work, we need to define the necessary device tree nodes,
> including UART configuration and power supplies.
> 
> Since there is no standard M.2 binding in the device tree at present,
> the PMU is described using dedicated PMU nodes to represent the
> internal regulators required by the module.
> 
> The module provides a 3.3V supply, which originates from the
> main board’s 12V rail. To represent this power hierarchy in the device
> tree, add a fixed 12V regulator node as the DC-IN source and link it
> to the 3.3V regulator node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 99 +++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

