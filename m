Return-Path: <linux-arm-msm+bounces-75111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE13B9F6B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EFF14E5ADC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59A4214801;
	Thu, 25 Sep 2025 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeENdbTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361E20B81B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805620; cv=none; b=WmgDXGjvDEYShoA+/Zqv5iRZ+HHZo4E/CzioRh0iNAnpWBzP1vs0lBU5kbvyfomK1ORl3IV3uOYoTS5yUUIqemvvg7mq+xys+I6el6k4zCdOMUNT6W3CwDqnqJXdSZC/s8VbSfewdBAD2jbQuwyajck3RFoRsXDk3V3IuaGwb9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805620; c=relaxed/simple;
	bh=nAK6kdbUzHM4/UGUR3q8N5tZ1hG3tqOpnRJo+Jk09Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lV6+xsd0Mvso8Tjc1QkLVCgKDHntkBielpzbm0w71+rawVjkBWniuXN+QBPTVSZtkoCr766faCItl2EJF7JxroHG3bZ31xmEYSk1rSnIdqrpfQuCLtIBuvV6G5DnNHcYVqCJrLsIDxdDYdEj0W0I361uvbMnXzEstxfQukj6pf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeENdbTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9rwdU019952
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8bm1xNryD9JwqI5a8BhCBrryB0+T9GrgctFwTKY2P8=; b=ZeENdbTf3n3sWxBD
	wKPP911mmlSehUBaiz7KQa4aIW2HQD91P/iYpS5E1QzEtgNKb+VxfGMCG0DkqpJK
	KkXXBwwxO20Rv29LpKNW7A7zMXed64xdgE+myvN85o85ry17EtSxMeZ+yGCo48TP
	rYq77292y2djTCFT2BZUZ3gyo9ugoXTXhtmkSlB/qwyoYEpIY+wCFB6GDIlteLW8
	XRPvVAwWKcNGFdgCHrkOi/ZYhqlFHWFRPog13aIMg6OmvNlTeckYlpR0Bn7q8/8N
	pz0A6AG9q+EeMAVDAcM+/TcUJct+XGeTpdhdBg2sAR4KfNLpZu5+fs6sFhkMavwM
	DYmHDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe1cv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:06:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4c9764f3bc6so604321cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758805617; x=1759410417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8bm1xNryD9JwqI5a8BhCBrryB0+T9GrgctFwTKY2P8=;
        b=qWYOAgrd15gx5rEeqsc4PsV5oY6WqK1oDs8z3mXgP4ZyhOLgc7C1x4VOQDUoQPWfSY
         WJYOpvQOb1ip7iwqoiXOfh+tyT1Z2WrwYWPeBPZXxjV11cUcEpqm7x8scJgfAVoJhoYV
         5fEqne8Qwzwz0mmszbU63lNkIz2Tfo4FXOjglv3os595PE4sH/hAuqIz9TOAyUADzO4I
         QHIFWiZ1nuWIfecJKFs2SGGmKW3PsQlgPKS0Ru0XtdTEqueEZAMbItT37P6xwfhpcCBT
         vve9IT1YmGR9lDhgym4zt2EmhjAlB7xQc+Alv6xoBcdhrymFVG0gNVH3uV+aIithZDvz
         5N0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNiLCLM9xuqMx7sbZTpZkbSEar27l4Iw1/mKxmVnsdHQpLWscaISNhKQlHXEyJk7tcrr88qzotnpy/d5jp@vger.kernel.org
X-Gm-Message-State: AOJu0YzFaOF2YtO1poxPW0ZVQtjzanUc/B8mbBaizTi7U8KIV4x0CnR6
	ER2Wmw+A0QhjbrdWfr4aTImJggI3Yt4v2Ot2A6mrmVmvq8RnHQgx+sjLVzqXIUBVWWMxw6c7qvf
	7wnGprdqpugGrsxhejo1ioZGs11A6RucPNgWwzUDyxUviKtEde5mkIc683n4dP9vHvLLc
X-Gm-Gg: ASbGncuTlHRbCEXghLyOTkwcILAQvh2DrOingsfsOHcSlaIVJSmz0wGeGmby793po84
	vtCCxssfcy8kgMkgU0PRzDTNjOP7qR5FM10qWQqTR4a6CyYL9VBo9su6G2qlVXuHF9zWH6bh5uy
	OaoAsU6zf+H0W5St2TE0SVUUA00QZmZ9bUMtLDvyFCg6xw8qR+CYMFTVO9+h6rjMntjUu+XLMG0
	uLEzEDfOyOaxdj7RW5zieGDtxhO+FuQFRVUdTwtbsgqpk8WKjAfYM2Nam/RHP5CVGELYjkR207F
	varXkRsJMfqdS3tGTVPX5lLi1As1LKjnMX1nvlhT6CEr+EOcw1ThXxwvShWUMVKwbhtWwB/3pWJ
	ZTejeswQqmBW2HkeWOKKGAA==
X-Received: by 2002:ac8:44c6:0:b0:4dc:24d3:c70e with SMTP id d75a77b69052e-4dc24d3ce69mr5366561cf.13.1758805617012;
        Thu, 25 Sep 2025 06:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwnD/+DBSz4FfSNFmFPTiH1GEY8oMCJCmsKgUxzjNXAh2WUGJd1eXwBf2amv5cSWlKmUN4vw==
X-Received: by 2002:ac8:44c6:0:b0:4dc:24d3:c70e with SMTP id d75a77b69052e-4dc24d3ce69mr5366211cf.13.1758805616340;
        Thu, 25 Sep 2025 06:06:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa4c35sm163751566b.26.2025.09.25.06.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:06:55 -0700 (PDT)
Message-ID: <53b1a622-3afc-4fd9-98b1-3c166f563ad0@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:06:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: r0q: enable max77705 PMIC
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-4-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250920014637.38175-4-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RN90DUpS_FxCY5pqzzVzBol3mwy2EB9_
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d53e72 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=VyAeMZAD-TxZKk8BDF8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: RN90DUpS_FxCY5pqzzVzBol3mwy2EB9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX2yoE9pNUBUYJ
 xGLklgOjJMYMEyoLIobb5nkamZKiy0TnurucszPhFxKHZGk8KKWDE24/9qyB0nFAJpLGl4qaO2h
 gC7y4ZZdVNUxDOw6Sx6V1/K0riHb25VUhXOVml5TYePPnxJmAxNLBBiCM2OCk2g/EkVPhZnSgdM
 I8gmIeYaSkO6Qscpq+a5/nvl4nrWYWW3i/g8HDhio6PvM5v/BqNjrzlFq4v06MIf32EwJbE0Q47
 JY5A6/4AsolVfPIWdr3vVrCDI0TAZbRFNXwq+3+eYKYwGobjFSkv0SQKVqeUJwE8naYilbQv8Lq
 LTU3Lx+sVkFdpcynCs9b9EpURNdaXM1bZkOBUCPI7jAF89J01U0xlN8ViA5GoDyLD4Egc1Eb64H
 iF2QBTai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On 9/20/25 3:46 AM, Eric Gonçalves wrote:
> The Samsung Galaxy S22 uses max77705 as its charger, fuelgauge and haptic
> PMIC, enable the fuelgauge and charger for now.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---

[...]

> +&i2c5 {
> +	status = "okay";
> +
> +	max77705_charger: charger@69 {
> +	    compatible = "maxim,max77705-charger";
> +	    reg = <0x69>;

Please use tabs consistently

> +	    monitored-battery = <&battery>;
> +	    interrupt-parent = <&tlmm>;
> +	    interrupts = <5 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 5 IRQ...>, here and below

> +	};
> +
> +	fuel-gauge@36 {
> +		reg = <0x36>;

sorting by unit address is welcome

> +		compatible = "maxim,max77705-battery";
> +		power-supplies = <&max77705_charger>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
> +	};

These nodes should be children of "maxim,max77705"
(see drivers/mfd/max77705.c)

Konrad

