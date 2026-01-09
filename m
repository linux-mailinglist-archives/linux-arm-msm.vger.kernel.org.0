Return-Path: <linux-arm-msm+bounces-88249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 245E7D08622
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 11:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43F043007CA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 10:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA3532FA3D;
	Fri,  9 Jan 2026 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oit/oFDi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LW3/uqs8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30803358CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952801; cv=none; b=hXkRH7y0TOWys8+5D71k6bMjkg0qMTcTsbgHriEWCQiFjopAeuoJLBkqRjzNHuQuZ4/NS+eviggVsWbVomFH3TM212kNVxU+I14zoK5rxAJueiNdQtnRyp3bEeDdZnhCFdHbeoD9IOkrZcIg6/biZGEzW+2OdWN6dIfOkDNWQhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952801; c=relaxed/simple;
	bh=9ndVCcF+R/wlVVVNOBbXwDmF5QARj0mKv0iuVxxmNgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+GaYoGx/ppcS6+1AQRy5LGjlPjzU/+fOR/rG6xLY8M8BWrfdv/k+OJIWLgSzHsPxVZqVfTpUWNb/vmnId3FTb+YgcKNS8b6SCZWjutJxfFtFJtttFY5zhC2nRj39rbnG8rieKCnbf4EHNBZREsWkYjb8Y7SzmjkTa9LsHHCvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oit/oFDi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LW3/uqs8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098XjsK823314
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2T21G5XUHap0r8N2FzWobWxQaP5Qp/eZH3++JzBooY=; b=Oit/oFDiqjZf8l32
	oVlxBWu+iDFpAfxe15m8vzAzeg/zFucKc1WSoVOxteFFUDfCLT6syUkhT8gUTNR5
	yyUFTRuA0b67eKLpXmEU+cWoTav6H4fgqWmIpaMhNifoSL/pxV4o40thqphiSM25
	2eEdiaeMC7YN8XscerNDVinUjLzu0GUacgjPvUm+8Kp/WSfK7YlHLax4VlPEDoVC
	Bbdo0Q+iBLi8HqK/Htrro4nroWC2lwlXj3ejOH5wC9FUS3TAaBS+j1M3D15kJOsF
	yRd8NdAa5qAG7yCgDPzKWFxOzqin1KFzthRdhiZRhLHmiBKjEyzwgeG3Kf5CLV1N
	Nkt8zg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94g9uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:59:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so17087331cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767952797; x=1768557597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2T21G5XUHap0r8N2FzWobWxQaP5Qp/eZH3++JzBooY=;
        b=LW3/uqs8V9AjtxbRP/WSZCqdNsGAoV/aioj8YQjbxw+tNNB2uvZAAdN3ikhlywk8Jt
         evstwEZa9glpAQ2zDydE1Cp5CjH0FOP8/tcl5alYTnZLu8NFkxR7ppz9mL9D5V9vf0sc
         wtUsN+MtsqtPP/P0R+uYcSgj5T//eOcA6RoCTL40e4qZgLUETYpxVVEQJlhkd78V1QQ2
         QH9ypSInyAJFA0R2VxQVtHZGtCFo+MvwpjMTdHN3FdyQvhdIr+nIe57WeNr9p4YAjpmu
         6ujUCpNDnEUsd5FSIj7HZ8h+M4sGPW1HkpqxHMs5c3fyEpArdldy6gBmKI5ILq2lrSnp
         yXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952797; x=1768557597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2T21G5XUHap0r8N2FzWobWxQaP5Qp/eZH3++JzBooY=;
        b=JK1Y6WQ48sKJhaUj7e28R82BcXWFXa1Pi728AeiGwBfgwXkCi87CvdA2iungWk5DNG
         mP6VecdGJyw72lsWDihpx7vP/bHVrsAY8OZS0+hcO0QJtbJMzIvcADpJVp7l0MBn5nOW
         b3NpCXjqslDstLilBDHhDSVl04vwA4cf7hI0bqnPZjw+tGiGO1fHrq+YJume5lyqy2zP
         J0z5MH8XHX/ZGeAXHwEwnzWqdMqFeWii1ilVYmOmF/wEedkhsLpal42sbyUKflvH92WL
         xWsvclMOqUE5XSM7diXux23+NaqfJV47zE9g5SkkVIcPEuWv2IpR9Wx1QYIXCaNp//Rz
         907w==
X-Forwarded-Encrypted: i=1; AJvYcCX5AGpX9O4B6+Lbe5F3J9sh6cEOMLoALuCfh/wHT4vzgoaEFOnXiIOLRin+iWpSHb99Nj2fhGMhOt6eJInx@vger.kernel.org
X-Gm-Message-State: AOJu0YzSMM6LLluUKCUmE3tqWTZK6a7H3smiy6rnGooCReOGl5X5ACzV
	5ddUcn+1lfm/eSaZAa0bajDLGM2wnL1Sh39UlOsUgSja/LtZabs4ltJT+tUHBUAeAKZAd2udg+F
	muTUNpA8+qs+k83hJ1ISiYgwIBEn7KLowolotnl9TQj7cw1TzAasNse9MseJoekW0Fmpz
X-Gm-Gg: AY/fxX4/9xnOhttPUhkAGyhSwYN07tbuUL+uFQD8uL4EOsyX2H1SJ7lRCtpxjHYz6u8
	KY28q7Cwy8KgAKY/JBJ475taECwQIOVyauuA7nxRfPMPIlR4oXwjER5CWc+IkXW81d02w/qb00d
	BhVP/2PbSsPODaHlgwBpz7n4aoFJJQy6E8V6Nyd81jwwd3hiyhzWM4gOfPn1+U98Zb7F6Ed3/JS
	bPy3d1flH3R/P7la+hleDGOae8R3x6UrqQPgSctYDfMXzbs/jxisKHcuLQBI4aZ9/xjv3x9yxT5
	YKYP6OrfxllJVoyICE8ye71lkpXV7BaILfnK724Ul71rvTYD+aCjAQKYtIbN5noVUsqq1iB7ZZF
	fHR3pR9MpDMCp4tWJxNh7B9uill8ZcEVlGdg6P2HwfyCipP44O9gJwmMOrTWIMHglelY=
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr99137181cf.1.1767952797169;
        Fri, 09 Jan 2026 01:59:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVSl3eAYxmMFK+CvBkVAsLJXo7tQpHD1mL8mA3FW+oxBzEDsLkyp6Ip1sJneT92BgPtX4x3Q==
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr99137021cf.1.1767952796760;
        Fri, 09 Jan 2026 01:59:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm1080258466b.49.2026.01.09.01.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:59:56 -0800 (PST)
Message-ID: <ba7845ba-9f85-45f4-bfdf-cb1c6f6c2f7e@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:59:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] arm64: dts: qcom: qcs615-ride: Fix USB PHY label
 reference
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
 <20260109095221.2847067-4-tessolveupstream@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109095221.2847067-4-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=6960d19e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=ugNE4biRt3zQTriTjHEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0poq1uMcRhgLT6ymEAtkQlSAdeI4nbzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3MSBTYWx0ZWRfX0OJf5zyY63+O
 LeQUWR5Wws+YkS48TaGIJtkZDODkoJFMDLiNm28XaNq0lpdHuSFEIxLDTLRDRroBN+r7apB+KB5
 j9Ku90nml9YTFZ4ebQzR2DxlO92asA4JGfPYIjofPfWV7rSRGGjO5yu8nVcml1ilS52YUuWd2b9
 WC28VOeFNzikwCHXZDFrLnFVoRtM28Ds2TmXsHuZyYzyg2e9ae6s8TfnXyP4SKIFUAXnlW1ghxy
 OqeWP2qgEc7Sd9ShOl8qEqhTUbM8eJUmwDgkAIxmvR5QAEbK49Zt8u7OuuZWJFTuYGGarOPqt+k
 gDQGmgC80UhJVdC6DzP4TwRXE00eDeZ3bsAyC7PwEEYtp+blKHha2d9m+zHsFzK1/i9P47MjK4E
 G5UHLTopnFzN71RmhxJQDdUBwZEbHh5yLbodiwm1TFAGbXHAOKjvvVRyUO/dlnA2tD/S74szFDo
 h90vLzRvK0hEjHR9a4w==
X-Proofpoint-ORIG-GUID: 0poq1uMcRhgLT6ymEAtkQlSAdeI4nbzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090071

On 1/9/26 10:52 AM, Sudarshan Shetty wrote:
> Update the USB high-speed PHY label from 'usb_1_hsphy' to
> 'usb_hsphy_1' to maintain consistency with the naming
> convention used in talos.dtsi, where the second PHY is
> labeled 'usb_hsphy_2'.
> 
> No functional changes, only label renaming.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index be67eb173046..0ca6b50a6de1 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -609,7 +609,7 @@ bluetooth {
>  	};
>  };
>  
> -&usb_1_hsphy {
> +&usb_hsphy_1 {
>  	vdd-supply = <&vreg_l5a>;
>  	vdda-pll-supply = <&vreg_l12a>;
>  	vdda-phy-dpdm-supply = <&vreg_l13a>;

This must be squashed with patch 2, otherwise patch 2 is going to
cause a build failure which must not happen at any point in the
git history (to make bisecting possible)

Konrad

