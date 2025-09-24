Return-Path: <linux-arm-msm+bounces-74561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E67AAB98464
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 07:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2CEA4C2D08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 05:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2671F7910;
	Wed, 24 Sep 2025 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euPI5jds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753DC1A9FB4
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 05:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758691192; cv=none; b=j3NXDO/+71VQBHyvfHv9jwQPWE0Uj2EomqiLKZzgpHIwtyT7LUgnvVsUgGjxYWNKmGbmGYdMesQFBq8fVyVnJ+J4WaSNkMGIcDjOxe9vJV0o0EYiJrWE1408a57eH0PemDwWXiLw8VlbPUa7XfymobEPjPtu1PxHVk62rGm1XRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758691192; c=relaxed/simple;
	bh=gDMmbJDin8g4trp63KWsydkj4NL9SFdV1cVqYH2HTik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyGAihPI/mvmCyuWfUmCKiVTyr82F7rxqnR/ML/SAIRDyTLm9Wyj+CIdbnf9llJ7sd6OIk9X76V2X3mQKQqiT+Rh33+xOHWX9dakmgT1kyO4L1GOcoaWccSPtpqhQYV6pT3DOzPzfC2dgBdHRz7XfAtyNdnEgy2Z4JAhvzpLWlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euPI5jds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iD7M029565
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 05:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbgjHGvKyAAeJ5oZigyyvCPSQIleZStCFPhpqS2fX3Y=; b=euPI5jds/e2iBiDH
	G3h92CbH51mWz+y5okgR/lg4qA+jGFwCsYZRWpNL/yF8LipuD9Ly9cFwmPzIbCkb
	F1B1OJjaXHivRvf+Vpxiv6Q1KnzFoMUfhmMjllfVwP/yG7rAeycqiyP5P6QjazAE
	W2L2GbE0LtXkhM2VeNVT/X6Gmum/AxXW8euQ8IFKUU7oxSfWeVadbtqljv9RLB+D
	NgbAG06uGhxXtk72YDevENGFsDsjUWLL5ADS4T03h84EJBokKDXpIA/0auTvepD9
	cMRSZ8+lvRM8X+ecFicNaZ8zh/VmiAqnHe/ztSv+17u3E4qHt6dpLMdzuRIqBLaJ
	sOTPuQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fk0jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 05:19:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso1767968b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758691189; x=1759295989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbgjHGvKyAAeJ5oZigyyvCPSQIleZStCFPhpqS2fX3Y=;
        b=SAV6cIVBfqAvxXkHJBtrjaDQCzucvwb4YF0teDgKNdWi9gNeVEqvxjZfA2qfbELUue
         JgA9L+bkFC/eicU28OSqh9wVqYwZ4EcCyJEL3vnz+TtYpCmsmsMhijWH8/JYkW8W/B/0
         DjsGyWxepUhupdPru1SuUb9EiWW3YeIyCoMgNrqNS01ZBy0Ifs5rDOW0vZ3CyUxXy7uT
         Mf1vV5a7XtpsYjJ7NyVvC9K0d+tfb6Uk7XNx+OwoXTNPkoy5ayFU7j8TBHfbprlJDB4c
         aPWZMjphXYoNpakCAYxFFL8ZjFb/m0tYWC2IljBmeVZQWXYKXsMzmc0wnbuxC6rgnFFv
         OVJA==
X-Forwarded-Encrypted: i=1; AJvYcCUdB81b1AOEqQBlTIB+VuAYbvDMyy4V5GR1b7P3jKOBxro++dyXHi9FDnTVILuqhgGkfGSBtZqocoRlcd4y@vger.kernel.org
X-Gm-Message-State: AOJu0YycaCyT37bfWsNRtJIz0VpbYuEyelVpp+qOH1TyaquofXQR5yuR
	yeEPZ7r/B9zeugiHhBLK7dUDrZ3dG05PERNJVvaep1v2zKcjqVUDHxZk+3+AScmQCWDRlRQHdzi
	NmYRJZmMfVzAPQtCXGpfb7c1+M5BGcU88G5E7qd4J7e5Xqehh9mhNRX6AspQT2AqmSw2C
X-Gm-Gg: ASbGnct4Qr4dsnbKAR8/OfWU1OXmJHbp1Mb+lKtmoF2moGmXi5l7YcfQG1j8W1Lm4oO
	oMg8hGnVIJz01vyKuUJI2F+7BXD29QkdAIujVh4yjOI0x74D/FgOLN3eeq0OXqeARnWctt/DPnD
	c/wUfGyeSVWPFlCnbjx522feYV6ly9hWvLjkcduomqVSJO3WhYZHH54E70pm63+lzdfL20a3tlz
	3dYNYR2LR+zV7antwQwRIJ+Mn4SK4hA7vW8bCyw0v1Goz3b06qDib5KbwropzKFHaujBf6kyaYx
	NXSrXpOq7k4GKJRzS3dbB3MSgY1tkzkuBiFUKkqJ/f8p0smV2Xl09XvOD5eBHLwHpQQ=
X-Received: by 2002:a05:6a21:3290:b0:24a:d857:fcab with SMTP id adf61e73a8af0-2cfdaf0bcdemr6339899637.23.1758691189310;
        Tue, 23 Sep 2025 22:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKWR4642Yw5maqKFG82ykSWIdzBhL17R+UP3C4cLfdONnTKmSW6HpeHdooGU/0F96sm7uhPA==
X-Received: by 2002:a05:6a21:3290:b0:24a:d857:fcab with SMTP id adf61e73a8af0-2cfdaf0bcdemr6339872637.23.1758691188899;
        Tue, 23 Sep 2025 22:19:48 -0700 (PDT)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec3dadbsm17384435b3a.68.2025.09.23.22.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 22:19:48 -0700 (PDT)
Message-ID: <a0a83512-9eeb-444e-ae75-cdb877076a45@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 10:49:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm8750: Add a new frequency for sdcc2
 clock
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924-sm8750_gcc_sdcc2_frequency-v1-1-541fd321125f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250924-sm8750_gcc_sdcc2_frequency-v1-1-541fd321125f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gQwAs1ad4vwmgq9VMdy8IR0CHlsns5xV
X-Proofpoint-GUID: gQwAs1ad4vwmgq9VMdy8IR0CHlsns5xV
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d37f76 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=aG0I0WmwaBOL6KmX638A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX92yzJ041AwRF
 u5dwm7ZWaT8/pk7ULuYlNnP8ijcvKc2dhsEoHOnTxPNLQUD1CGI7NI6Kc6WKSi7T8T0WiJsZgS6
 D/1wnbZMiLovPeV8HiibkxPTBphmsrCdDbLyYP8tVcWeL6EoPGABpU3bQkLh9l7Qj2LytCz1O0C
 8hyvDY8zo5xDX9OMmllRayfU4i9gY00BJS3yZm/yVEY7xJTWIRW00SnbOM7Vz5y8pRZOOXST78c
 Cz6BBvw2pzjgjLbxEDRj60nrWRFg5cM8Kf+wuTgaP7NHBTVKzCNObVRN5T3sTEbpQla4U0EJf1X
 eETmkO+Q4yQArxRw1TkHjhYKqE6aAxflD4icOEG/Qjha+Ttw/7Syh2kz9J8SibJ4rit+P03W4uj
 Uc6/tTmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037



On 9/24/2025 12:08 AM, Taniya Das wrote:
> The SD card support requires a 37.5MHz clock; add it to the frequency
> list for the storage SW driver to be able to request for the frequency.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8750.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
> index 8092dd6b37b56f4fd786e33d4f0e8aabcd6ecdfe..def86b71a3da534f07844f01ecb73b424db3bddc 100644
> --- a/drivers/clk/qcom/gcc-sm8750.c
> +++ b/drivers/clk/qcom/gcc-sm8750.c
> @@ -1012,6 +1012,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {
>  static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
>  	F(400000, P_BI_TCXO, 12, 1, 4),
>  	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +	F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
>  	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
>  	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
>  	F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
> 
> ---
> base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
> change-id: 20250923-sm8750_gcc_sdcc2_frequency-debfdbbab8b3
> 
> Best regards,

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran


