Return-Path: <linux-arm-msm+bounces-81222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B26C4D36E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B3E434FC28F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BBE350A1B;
	Tue, 11 Nov 2025 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afUx8KGU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVIHF1mo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CF63502A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858132; cv=none; b=Ohuq++S2M3O5dO7uuOPIhu/ZBeBEbBDkd6cHsGYwFA3gXkk5/U8vDCJuDL6WsHEMk0DA/FAG5d3tzn3b/ACKZKiUQENX3kohhCMvODfzOzRbQj5mJB+fd44+32dLM9KOiqei2ssGsHdlr36KkNajREJpjdFYXwLoq90hh4Tz8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858132; c=relaxed/simple;
	bh=Hw7WEkYyfmolBo/cx/Bi+H8d4M4g/yfHEl5/k5dvLtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXb2QJcxKpvzimgbgmDhu89D4PAFTYdS9yrEhmXpiiht6fhBTZ0dML9uR0hzuCWrOQ1rBC6bkP5EuD5ueqCYiv4Do4mYWqA75ZMFdYEQgUwIJTragJExFB3IwSEvvypW0KME+ytlFs6vbs5a+1UmfNRlRhLNopoYbvf+D16IDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afUx8KGU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVIHF1mo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB5Ni5H1481249
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9EItJ5XOQftBUZ4p28CCb/my
	3CzvSqKQjhyPpFTkDrc=; b=afUx8KGU6kXYU5/rvvCLhu9WrLAUTQTH88aJ5JpZ
	eH8L4xr8lru7SjeZz+wvpJ48WZiqLElbeogEr3n74p4n4QU2MLK3Qg1cR+Rf8dmW
	bnQEwS7Cw4dIdqd7DzHJMoLw/5VYByIKjcPJBhOdf14EHrZIUjc9tCO3tjRi/KGA
	3bgzvfVKCVQ0vwbL2Ckedk2zX9UKtQnsb3rVs/1NqQGRyr733quGqd/LnE5pMlDM
	yG5P7m6CcSdrnRBluTrpGOevABMdON3Qzqncl+V8hrLdDhZEP+5t4Q2DaH0f0eaX
	gGomwojRaLAAAcepDPaWaj3DAIMEomERxn4puMN1/4iFog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxxu8wqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:48:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823fbb4990so84138906d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762858129; x=1763462929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9EItJ5XOQftBUZ4p28CCb/my3CzvSqKQjhyPpFTkDrc=;
        b=DVIHF1moRtJ5y0CIiFzGIYZSIQAmQ4nIRUbDEJLUN5DghRYsTPj6HI4fg2nSdQ2oZ1
         m2V3rkFRRdqZEFv5mmsSHCJ7Oblzf8rXm4Y6dFqKGqcxrwS0PGEirzMY9SWqCTLT3O9e
         kCu5uawIm7rdM5WtOmdREPLpIa2HfM/tD7tAjKNe7NyDds5h6r6nPdssib7nB1fRD8Dn
         lQCct0gS0GXzOOD8dt3lGLqN0KbNhEEqJJbRMY1xbLO7uGwDBqqn354bhL9by6vHct5w
         JXraEh9XPEDlv5jB6lc7xhcYPaoBukUdcyKLQCv/1bADOOD0ZKXqxutg91rb91lH3cxA
         1Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858129; x=1763462929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EItJ5XOQftBUZ4p28CCb/my3CzvSqKQjhyPpFTkDrc=;
        b=q7zjAlNgvPFIduRGRHsIv22viOfcMQCTYkaPxExrUByW8MkgoIbuI2CqM+cad00eDe
         af89CM5JRY4aE4mBnzxmFGDlLUzKjKAMSTks3sh10x+hGiy0X6VMtld5UHjy52lQbw8k
         z/FaLtBpzNGvdeuy0Gzu/FxtfAkUum4SYWne0NYL4y8Vlr24tqALbuH4As1ZNeRRJTlP
         3x1FSQK9QQ8ZfKGACG3lepqbQcF0wPkJLG93wJJ7GAmYPtIG++qlkIdvpbGfmNCBf25S
         UHwYawzOGK7s2HBjGSiEHojMYwn1q0ok3BHbDfw0wPQO58udMXyBZEsU4h195B7OZCBE
         qqfw==
X-Forwarded-Encrypted: i=1; AJvYcCWThcCy9lGPWV8uCJVWXeSpbDEL7sa0wXyMoCyWA40DHCT3Gsdu91gniHEA0q2AjLGmVYuboXyVOJg9Lu9Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xnIaPxU+sU5rWiNM//MdlISuhr9DhZzpm0QlP60OqaAIJrp9
	sm/Nmcgg7ZgWqigXrduk7e4UcAL6D4TnNSRK8iqJz80NMwMUET6mLezt7y7LKntW0XVwfBMhVIU
	XL9oYqs5p5SX5x5vnI/PKTqxC4vdMAEo6dKzaA/tGBzHH8fr0S1GAesk7z+v5hVE87tVr
X-Gm-Gg: ASbGncstye8yMqhcn6pyYaCFNad1/+hrOIsxD2LGWpesCDCQBmCgiphsEYIvZNcPrCV
	2EBEw2hZVs1/K9aYE3vbHFZd4MdT4YznDAm8z2fv14/2j1PEOA0lR1g0mpAkpAzRBfChSHYRUEi
	hZVmqDPFXXkJ3lX3dIdkaONNWyBi9iLhx8ca6uGcQWRuh7eg6RIDIXtHK1UO+vk5DEkpT+Ui9cL
	JJGVsUN+BbRlwTH2rkkNzdMqTKK87hfYdRUTW8WwAPZDDJtCHl23QW6bNmqsL1/YCngjodFes7Z
	CdniN61XLTb9+iGW/fcmF0r8kXZiJ3LnhKS2IfNzIE4N+X+KnLCTTy3W2cY7sjzZgmXoKr5nVjD
	prWr586kg7z5edlAl1KC/J1K6ZmniVCfB/f97nkqymFMhQe5dY2f3yxm8PWmrIlnxY9iNvpleKB
	6ApLwquZZRqRbM
X-Received: by 2002:a05:6214:1d0d:b0:882:4f53:ed3d with SMTP id 6a1803df08f44-8824f545e1emr99089236d6.36.1762858128909;
        Tue, 11 Nov 2025 02:48:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6DZK5HRkqdWLPvPXUjGlUQbBYjLyUgma8QBrsQcOxkXJuIWMYFM67iw5rk0NIzOjJScMNWw==
X-Received: by 2002:a05:6214:1d0d:b0:882:4f53:ed3d with SMTP id 6a1803df08f44-8824f545e1emr99088906d6.36.1762858128460;
        Tue, 11 Nov 2025 02:48:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dd32csm45345661fa.35.2025.11.11.02.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:48:47 -0800 (PST)
Date: Tue, 11 Nov 2025 12:48:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add support for Global clock
 controller on Kaanapali
Message-ID: <vomgxeiqctbnezwunxovwznbepmhxbmixkcpi7qkmic4xhhm3t@fwc3rp7r7ylm>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NSBTYWx0ZWRfX2BIMuVtWMctu
 ++Gqui+4IAZqvg2b3FWCfxGyMz2TIAa44GJsHLydptKdJe98ro/G8sztAHLKOT0oW8BiBI8ivPq
 ZEvAfkSPkGDO0MeYKjsrYs4I74AHxA8Ne90NfN5VsE/QwE7bz5AzEfDe0FzSYTUxUs1FlCrhAId
 rZr7ivdDzuq9VeohH2khTT830RX16Ev2I+TxiQKd5EIkvcW74PE/+5j31H/pwgXAYs45TXmxNds
 fugZSOMDSSYxNNrlQC2alUWVcLG83UD+1UiWSFehkH6Mg2LMdoqS7D6oq6PZg7d5xYgoJHXUeMq
 b5pykMQvKA9W1587dizt9hFopJCDtKs3lSJ2nQ8I2CxM59Qaof4cB5QzT4DhYqjbpb1YowCm+zZ
 i2Y/iAlZN5Wnrfkp9xGlOo+yZNj0xg==
X-Proofpoint-GUID: HgdNPmOJ1-GHGisU5Zqm0ACb5LiZnN37
X-Proofpoint-ORIG-GUID: HgdNPmOJ1-GHGisU5Zqm0ACb5LiZnN37
X-Authority-Analysis: v=2.4 cv=TfObdBQh c=1 sm=1 tr=0 ts=69131491 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NTLD1hAujTJExawGBKAA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110085

On Thu, Oct 30, 2025 at 04:39:09PM +0530, Taniya Das wrote:
> Add support for Global clock controller for Kaanapali Qualcomm SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |    9 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/gcc-kaanapali.c | 3541 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3551 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 8ec1803af76cb87da59ca3ef28127c06f3e26d2b..5289a3f07379f3cea6f6192bcb0d73117fe51a5b 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,15 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_KAANAPALI_GCC
> +	tristate "KAANAPALI Global Clock Controller"

Kaanapali?

> +
> +MODULE_DESCRIPTION("QTI GCC KAANAPALI Driver");

Kaanapali?

Is there a reason for keeping it in CAPITAL LETTERS?

> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

