Return-Path: <linux-arm-msm+bounces-79561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF53C1E64F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1C24A34A989
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 05:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960E32F6932;
	Thu, 30 Oct 2025 05:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdfmGWB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4mR7mpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF4E1E834E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 05:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761801072; cv=none; b=rf+IrrI6D9xGmqxa1Eu/MBtVZgBZN27rXT/OR4j6C/K9x3RMf/YThDHJGCF9/yYzOQXzMfZ6MKqf75OkWp9FWv8e0iqnGCBLu3U8fqJQEs1P2pl25rBklBF+DaBROhyrwLkEN+THdW0l2bOqMGF5xNN3m9avrIASxBte0262zo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761801072; c=relaxed/simple;
	bh=1T9DzFH8TcRTBEq1NqL0NiluRosAlRgQuZJTG5kXqQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VArwF7L6z9/LzYYdHev6Y1WSJgOnxuZEAGNlAJBBKKQG5tsHTGWwE2++8HHE/Rik2DvTkENEodFJmnZZCBLYHtooIIzOl+G7pFFT2Eo3iGhYJL/vR33rCUa3OCEIKzTzpUNOexDhMEyUjE5s93vR4Jl4AXPf75HN0u8UpXaOWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdfmGWB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4mR7mpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TIrd0e1324776
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 05:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dz97qmPEtZlBnjSlEq+ub83q4pyVP1o5qZayu0WtJSM=; b=bdfmGWB68X0vZ1Hm
	gSTdRg1N0J2QRMizAxG9wul1LU+QSZ2v3Zj1lZFDfDhirDf6OBvQ9JioApyz9FBQ
	Cnb2KcoeGIMB0pdwfhdyK0k24wYKT8CSwcj0BmRWIMzm4CHwK+UWUzeGp+MFFGC7
	MyHaCEV/e4ZzDhV4Xvz8WLs8rjPmAyxfQGrw28tZd9IukUbvBv6rkijFE3qO1krc
	RpzZkSxCayD/Edrbwydooa7KEpd7G20hDCiJMWjHwM42U6OVFBYQEadDwcX/FZAg
	DQT0H5cVhMuAwHTZpOiCs1jPPks6/81s2AxkRB+3E3RXliJH0Z+5VagQzJ0kw7pa
	XoKDnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3rkush57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 05:11:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290da17197eso9647435ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 22:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761801069; x=1762405869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dz97qmPEtZlBnjSlEq+ub83q4pyVP1o5qZayu0WtJSM=;
        b=P4mR7mpQ6e2j+DKxQuyNhOtou37iqYDtimyvaYBn3CimcRbjgKJxshHIebfWvdnl37
         mQy7UxD2sAnXvdqO5Bsw24St620hJPDAI1WWBFpahn8rJwsdCSLlpDDk3DWXZQAmthIq
         9oGxJSm7NTkSIe6jNBfF6MqnwM1cDXzbPZBvwGqQ1x8RxMbXXOxMwpGKEwmWylMQZHhZ
         Gjdhcl0CmnuKe6gVxi6Wu+AO7fxjgz87XkXpbNqqXVVHi8INFPg+YTjhcqoOaK96gyPC
         6Rm2pceJ8kLgvGyETERenlsr4LAnrXWXKYtci2cU1wtAEicshPeCQgtzE8wSxHDFA4pD
         hO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761801069; x=1762405869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dz97qmPEtZlBnjSlEq+ub83q4pyVP1o5qZayu0WtJSM=;
        b=tc6b9KI6TMj2bTAAMAAvPDip87ZAQDRC0jS142p/xJWhhF1lTNLx/K8Ra4WhJXwdwD
         eQgbfvPtpZCa3FZfB1qd7m2nx0lMXIWghwoLBUSkQi/8N5S1Hrkyne8Q/RECUjB8aoJJ
         gDTuVbH35qQx6Mr4SJFEYTUx3FZpAwg9LHE02KQnkF1EPuSEx2/CgRQxeE7EUR+5J537
         zTuwFddktOMjAPtIW46EJdVJnYDeDzOfXVBPGKEEFz/fVysa5W8UYTemZvvIS2c8E9Xw
         K7L86PNs01MGJpIOCeA3eAw2132MglA5CUnvWzLvRLvyRwaF1RsyxYNOj4u4fTnab8qi
         N2qA==
X-Gm-Message-State: AOJu0YwWCq0pM6PS3j7ZnnUJ64KD/k3TO1+Osq+keqvR7BvfKhXARhPS
	rk7aatitetKOzEcmRSayyDu6yfRZvYKRVu/iVvL/KKGV06+s0z4A1zD7baE0V1yCZw6cN2InT/v
	w4NA8rAsVGfA6QbhOE76DAikYN1vx7b+DTdsiTye6Bmf3jgS+FBtzp8M6ZRaS86HR8nQq
X-Gm-Gg: ASbGncvF83cz7Ptf58V/1m4fQxHxK51TJp07TJVjeINNzJKmfo5y4TeOQ57igmTRmoL
	FXwmBl1fHs+rF9e+VKLLGAfzMeCpDN08zG0wkj52NXvvsUKD0/UHwcWGLsyCoBizIuMNBWIK/Ph
	koWF+AO+icanQf1ZBwWCrvjLTV02M/0tP7KwOREMIwJT0SaXXZvelVXdOcKLpWVrKPRg1K6Dih4
	bSR7wXRsXurcUXXBn1Q/eXWqIsVNogIflJnAVOqxsZjcz6pRNd3eo2l3UcEvsDAdAr78qc/DyAo
	VC0zr6Xymx1COz/tBi3OrA332fC2ddE8lXAhLizJbX2fYqC+wUnvO76PKHwQ76iw5lizxLp3QO2
	m2CuwoQh97Co/saU1dEiaa7HIJA==
X-Received: by 2002:a17:902:c402:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-294dedf47c0mr64600975ad.19.1761801068581;
        Wed, 29 Oct 2025 22:11:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWf+LYmioEmyCION9Ee0tDIT3Yf6FXfD3nRGRS3qxj6ckA+rt8QYQXeU/X3EEPUqAgx84PLg==
X-Received: by 2002:a17:902:c402:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-294dedf47c0mr64600705ad.19.1761801067708;
        Wed, 29 Oct 2025 22:11:07 -0700 (PDT)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e495e8sm169603175ad.110.2025.10.29.22.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 22:11:07 -0700 (PDT)
Message-ID: <a6e66c58-6148-431a-afef-b8839929f9f6@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:40:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: gcc-qcs615: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20251029-sdcc_rcg2_shared_ops-v3-1-ecf47d9601d1@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251029-sdcc_rcg2_shared_ops-v3-1-ecf47d9601d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -fQMwz7ljGlFlvJxHbjsGKY35EBh1TOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAzOSBTYWx0ZWRfXz88262ld3oCf
 Mdii11PocS1c18ayjuWdnyAs9C9CcxkrtGn5m5xt2kxQbRbTy6vzB0Rdl9dHTGj+lTdR6MRX3iT
 MrM7dkDH0y2Iva/3IAtAe50CHFg0vF6i6c0iubUwKAkMjlgcvatgWwRFA1Wlt4ocljvoK687IQg
 F+vR6pNSTzbw3yNN9fVgC1XsVkomiingrXw9mKLccZGOjD2mWSCgvv5qXTggXIbrvW5ULz3nAMk
 0sfHOkLvR2bPvSCprXVN0va/2hKKtg532UV3XSsskCXs3lBV1B583CF5k4OgaghnCmncqD/5r/b
 CkmHPzh/+anTwz4jPtivBgfgxyJ9c9wBp+Wn54O21MM4YpM7kgtbVcqu1b4TnQgOUeXWHn6xnTJ
 HxF/RhLyyHpfeW29YquBmpwuCeSW8Q==
X-Proofpoint-GUID: -fQMwz7ljGlFlvJxHbjsGKY35EBh1TOb
X-Authority-Analysis: v=2.4 cv=adZsXBot c=1 sm=1 tr=0 ts=6902f36d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=vXefXszyV5ShXWUBbugA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300039



On 10/29/2025 3:07 PM, Taniya Das wrote:
> Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
> boot. This happens due to the floor_ops tries to update the rcg
> configuration even if the clock is not enabled.
> The shared_floor_ops ensures that the RCG is safely parked and the new
> parent configuration is cached in the parked_cfg when the clock is off.
> 
> Ensure to use the ops for the other SDCC clock instances as well.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Changes in v3:
> - Update commit subject gcc->gcc-qcs615 [Konrad]
> - Add RB-by from [Abel]
> - Link to v2: https://lore.kernel.org/r/20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com
> 
> Changes in v2:
> - Update the commit message as per comment [Dmitry, Konrad]
> - Link to v1: https://lore.kernel.org/r/20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com
> ---
>  drivers/clk/qcom/gcc-qcs615.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

