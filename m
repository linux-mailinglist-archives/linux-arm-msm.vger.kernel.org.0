Return-Path: <linux-arm-msm+bounces-42844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 287079F8611
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8BFB188EE6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EDC1A01B0;
	Thu, 19 Dec 2024 20:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMTAk0Ev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A543FD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640814; cv=none; b=gMu2vP/jIowbFnrLTqDG5EcOBUnFhWPkZaRtYqnCiiWmQKappHgXk6jNpOVh9nMdGO+I9M9bcwFfSHLaWDOIRYESKkfDNJKiO4tkNxt6kXQfxtz+DIh09rS9A7FReBA+fPciiMdvhtw4q5fLRPcO4DYwligeAQmXlTSb1dCXq+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640814; c=relaxed/simple;
	bh=oXoKgxgpqOwW1DspA9ni539p070dODkQb2hZMPHMNGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5kSBV0fC/+ITJqyXn2aVMaiClpmkTU542Poi280DSnxZbkrvJH6dFhceDzyw6M+7Wmco8o9AsTAqEN/BjHUCPB/W/65VLy93Z/H2wINKtm1PTxUxklDpcbRXfQRSw9mjtZM6/X1HfqkoO5MxlOK4jw4hwErgW98VkiBZj7ousg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMTAk0Ev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJBjlJ0016767
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5NWRIQfeR5uRYlt7SIJyR/Ac7CiT7vLsI21kdeQ2RI=; b=jMTAk0Evpjj7SyEp
	/C87zx1VbQaWog4Nj0O0+VQnHDC+mmIE2l0gsvs8vNxy2ClYTr7QeK5IiU6IVvU4
	9YPxlXfSW6ZHi7k2rjvxfiHHPcrEKb7CUbYUgGP/B+LHHbhi+11er5AwBGWyS6Wc
	5Gy0y3quv8jhxcrR/iivQ0df4qUNmRa1/0yrn2K+7+ZqVMgsYfGgxMKO7jDcACB/
	AikZ7UGW04bHfUwi/2SvTurfieFRgdsQZEvt/LpzaeJiI6dqNLHqQAhiv/OQUNDg
	X+0Ah9BZhwwV2EejH1UqUMEF/tWW8GYtgjzVW+G9Rj1vc0YtPZ9tB4oDiCfReTFF
	SHd11g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjw81c2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:40:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d88fe63f21so2785966d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734640811; x=1735245611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5NWRIQfeR5uRYlt7SIJyR/Ac7CiT7vLsI21kdeQ2RI=;
        b=L9q6Ugb6+p2vLlclThrJT2yv1mSOplDU9P/UMZG7GzKHG5MFOm/IbFphgTUrpMhXpV
         Hd3GDII+dl6qnaPe0gb6s8ARE4sY4qqXZiehApLnFxARMIZu8C/7Ev1HygMbFFn1y8Kt
         M2uKksxJzIiG313xj155ILctxObE1QPYBE2EVadAW4ZCN7beSVMivJ/ga9mRiI2K6E/b
         fXLSQCP0gSeAGdmKPl2o0L60NJVzvYexxBPNakkd2q+PId3lyvSc0lDOBSLSqPenot0+
         mYINzj3dr7fUimwORwYQ7yYH8KtFaknGPG3lNWOHRx0haRzFY9Ku+TE9exOStJvRTIvK
         40Kg==
X-Gm-Message-State: AOJu0Yw4dyCVH6k9zHbpa+vvuJhAbGAvRoUPFmXpLn7eAYozPf6QD1aq
	cDsdtlgqEuLh8OxUDE+LJtOUXY4U75d8GKR5cbrwN3wp1DRjaY/54H6EIS3dx7P5MbUYk/418Sm
	toKZFTv9YtzGAjvfkEFtXC2JAykjH/mCtnhRDq6+kaL0zAJqLGsDaNYi/sPlRhDEM
X-Gm-Gg: ASbGncufiMBtHiY2Xh2oPhW84dFw47LSGxPCKuVuk92JIBXjoDk3d3UCNHOB4Nfbawr
	FT9yCcwXxV+K5xRSB8h+JHgjLCpMxwyLv+1Hy5Y9iQBJCjoAMWD7LtEH1liYh+Ge1lQjtfch7xU
	m2M5yrnLpCrFJkrEvaKPMDzkVFjBRmb8HjkpOtRUtAimqg0Yyd2KNJlNErqf/fKR5hTSgsCMfm9
	EwjcVYINylm95bH1772FKwrG5sTSjHODrtFTzkUYqaC32GHWg2/+v1BWqz1ixs4056hYQ0g6E8b
	6HfWDMjfoE5r1D+qTUGOSvreR0XgsjRh/24=
X-Received: by 2002:a05:620a:2454:b0:7b6:c8a4:ba09 with SMTP id af79cd13be357-7b9ba7be496mr16113785a.9.1734640811299;
        Thu, 19 Dec 2024 12:40:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECbXaSdAF5+fSjgcoJAnwOWsONIWCmKaulWyJL9LxVnAm0NaXEpeGr3VOpWbCwFT0KYhm+Xg==
X-Received: by 2002:a05:620a:2454:b0:7b6:c8a4:ba09 with SMTP id af79cd13be357-7b9ba7be496mr16111285a.9.1734640810912;
        Thu, 19 Dec 2024 12:40:10 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894d8csm101230966b.53.2024.12.19.12.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 12:40:10 -0800 (PST)
Message-ID: <d3428aa0-c662-4e16-9675-18f53a7fbd73@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 21:40:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-hp-x14: dt for HP
 Omnibook X Laptop 14
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241202-hp-omnibook-x14-v3-0-0fcd96483723@oldschoolsolutions.biz>
 <20241202-hp-omnibook-x14-v3-3-0fcd96483723@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241202-hp-omnibook-x14-v3-3-0fcd96483723@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IkUl1x94IAySWwLFutu54AvsAbyqLYeb
X-Proofpoint-ORIG-GUID: IkUl1x94IAySWwLFutu54AvsAbyqLYeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=767
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190163

On 2.12.2024 8:41 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Introduce device tree for the HP Omnibook X Laptop 14-fe0750ng
> (hp-omnibook-x14). It is a Laptop based on the Qualcomm Snapdragon
> X Elite SoC. There seem to be other SKUs, some with Wifi-7 (WCN7850)
> instead of Wifi-6E (WCN6855). This dt explicitly supports WCN6855,
> I haven't found a good way yet to describe both.
> 
> PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140
> 
> Supported features:
> 
> - Keyboard (no function keys though)
> - Display
> - PWM brightness control (works via brightnessctl)
> - Touchpad
> - Touchscreen
> - PCIe ports (pcie4, pcie6a)
> - USB type-c, type-a
> - WCN6855 Wifi-6E
> - WCN6855 Bluetooth
> - ADSP and CDSP
> - X1 GPU
> - GPIO Keys (Lid switch)
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

