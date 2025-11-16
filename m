Return-Path: <linux-arm-msm+bounces-81972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD41CC6139A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 12:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9614C3B7E56
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 11:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C73122756A;
	Sun, 16 Nov 2025 11:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MorxaGdu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hp3OBCRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7755923FC5A
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 11:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763293137; cv=none; b=lGn7j4DXSqPNMF8stTn5yX3PbgYyymo2A5O7bKmQdAPCSmdHnX6MIlPty4/ZxnPD+jjx4SlXkMOfxUaUCFupTFmCbMHOPXv6MBODbDz9NNHmHko2CqBMG6xqsbzLqF7hBMUifUq5Jx4MrS8zc+qbX7X4NznmILlje8sg2/WgB/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763293137; c=relaxed/simple;
	bh=UZkZxW6oDJLp+w4C8bfan78Ipn16wj0YBwH8H8f1BLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlwJgjcb/Gh6vprzE+V9169tSrRzVVoBNCqAGX25+dVINBbHgcRTwDgBR2E+byPgmWIjdd4Mnifa6s5RyToGeQnRBIJZiNKy9wN7SedC5VQKbkGsQl9W2Il8peGVQUFIqXVF+ywxtkvnonAmn2buH4rAOvKwPedAKyow6H2YrdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MorxaGdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hp3OBCRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AG5ZJCK071384
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 11:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gpMNilTiqKZvFerSznNOMiBk
	SRtg39dU1DzYkv9O/M8=; b=MorxaGduOY0TCy9sMgYn8YWDPVfCfyM3zsQnT0cX
	0h3hgtsxLQv0r0zLfLPOlWKSqvsoh+9u523i+0GWKT47EjggrN7c13PKq42cnS41
	c2I1HXJHXa+gQOOSE1oh6tiB3jOCpa2fxMW/VFCM0+ZSH1lpN67GMDBmZgbCrsvM
	jVie0+7KSYAQUdfBDN/1MDrrrf0q52w00htKo3fx8JKJfFp7wKhHdFI127oomGMs
	jtzv66WCzI2MIViOXVNrQYZatxOZskQY2LuYr3KBQrlRjNZftN/dwkX4Lcw9mtVd
	Eo1Hsn+jtSHL3GLgwRiy54AvJZX/KIKXIqel66pGDeqmeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0a1fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 11:38:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee205eb70aso352061cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763293134; x=1763897934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpMNilTiqKZvFerSznNOMiBkSRtg39dU1DzYkv9O/M8=;
        b=Hp3OBCRELAUHCrC9f4cz3tTN61kmyxBdHmn7uDM7NbFY2f5cMZJ6s28PqmPRghmmkL
         4SAHShIn2/QSSbvtAJPPWGxIWj5rYIx7DhAazXme1cymuy4GIDgKPSsZHcd83FakrGVp
         t7J3JRvvPjG/OPPFp3TfAAs7zSOg+jSJqcimpSxREQlpGgc3L8vRURRIX72wLI96qGb8
         vnS3SvG3YP3p/jsXaLKWTE9IDOX0jaE+8EB5mdpUQwUWRvUma1oz1TfF0nHK6YKcPtOq
         UnX6HP5lnWfCeSFio9L3WR1gVUd30CWwVbyAmT1zEDOrVVRKGLKKTRuMruIlhh+UdZWB
         3nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763293134; x=1763897934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpMNilTiqKZvFerSznNOMiBkSRtg39dU1DzYkv9O/M8=;
        b=NhCpEMPtP010lkNvmYnymJDBEP7/AFlR5HNj5vCSawONJ6vAfsrYJ1pp3qyBCanXQq
         mYYE34UzMv3bPYNJtfTQQWP46fQwNp3n2JK2U0cH28dvyB8Xi/b7Mg8tSXx+1gkAqmsb
         wOSbMxT6ZTcMzvpHj/Io2gppEONKy/McdW/xiHPR6kx7v/EziSMQkvQzjEBsKh2kRrua
         QNJKLKR4cXLh7kb7ypLruWmsdKjOphfhtH2e3d2ecMh9FRpDwJg5WHvpnUY5ryWlG/7j
         8AklX/m2hjKLHRZUhHKmvbha3rQ+FblwC55hBnqOIkIxO8UTX86QMxF4CFvDkGlXny6y
         faCw==
X-Forwarded-Encrypted: i=1; AJvYcCVLudTtB5Ob/qwBi77kk4kh9zKGXlcik3wbNfytdlH7p4+xHsZRk5NHg/e/kktM6M56dT7j9sd6To668wjY@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxHbuOBnvQBjP0X2KtbmeNMrhpZcKysycRXXoTmy20UX9hTuI
	VwkLuBB4/miRPYwNzrjYRktaNDrv2emFRtFgyLJugx24JrmbMCzguwYb5x40IAWQcx9Ccn8KJyj
	B7CAqGkjboNvOVqIeakF5W7x07GaQRBbAc+nNHFIn/xf/+idt89VagrckS5LVvs8thC4Q
X-Gm-Gg: ASbGncu/v5O9ErZZicTNcohSSJKxIXiHQRePTbaumWdS3+GZyhx3xlyJQhTq2+1jfhx
	YqVNcVMc1ImD29z9KXoexBb3Mrrry1GwnmV1wHcVkIlLDi9Jwq+zhPyLWgape7Wavr9rwJF80jr
	BC0hD9/9qHdmsgfWeH112H9nHPrs4ohwYsTTaQEp+haGqazZUlvUMC5Vn0TjGm880K9tM7gSyIU
	IdrFor2ehwcageR1ZYdXI63a5MIUuKv33SX/+mjPaj7n4QLIoNylzLCMh+q84eauZrZFL5YgPdU
	B17oD2LP1CeIS2TUZ16XZu90S5AiZIRJiZMSe8o9XvL9oek67Z2GMNn99hy4/YZOUXayFOZJEnw
	6SRTHSaAPT7rjiepoA1lpL+iC5414Zt5EGoL+uH4O8WApxER2QTnNzbZBoTVix42oK4+sf2lKR0
	UcEduj9wvU6KSu
X-Received: by 2002:ac8:5c90:0:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4ee1365bf2emr37920331cf.9.1763293133619;
        Sun, 16 Nov 2025 03:38:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0+9gZPhHgtYyt7zLD6HaVCVgBxPCKeg233JhdH4Sb2vjhtKBMn9il8vin0Sn3yAQM/ExGHA==
X-Received: by 2002:ac8:5c90:0:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4ee1365bf2emr37920121cf.9.1763293133096;
        Sun, 16 Nov 2025 03:38:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804057b0sm2301873e87.85.2025.11.16.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 03:38:51 -0800 (PST)
Date: Sun, 16 Nov 2025 13:38:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/3] clk: qcom: mmcc-sdm660: Add missing MDSS reset
Message-ID: <iqljxclxt63ncwllj4n34inffb2bn7qidlj3tlupfeqo3ltbob@mfaf6nbtvevr>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
 <20251116-sdm660-mdss-reset-v2-2-6219bec0a97f@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116-sdm660-mdss-reset-v2-2-6219bec0a97f@postmarketos.org>
X-Proofpoint-ORIG-GUID: MZ-ejv4-XFINaOfxVqxAFWBARxyoVP8K
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=6919b7ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=10pTUH41BiadPyba3gEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: MZ-ejv4-XFINaOfxVqxAFWBARxyoVP8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDA5NyBTYWx0ZWRfXwTeish3fNt8E
 JypQovcifw03LuGtKcfs8ZESmt4ipK7SyWcSBvYXCnMqGvbyw4cHtXN/RbcypRkOgJoJxSfIOTM
 uRrBaRb8/284Lkw0++DzOKb6btQ4mOrjBfcM6lFXG2d5jfgByL8QUW/uZfYq2o8xPCLIhWansCj
 QN+1J7UQO/teQTcdbKw60cPDEQAxd1JFkzmcSkqV6U8x0agZV0cPL/ls5CChCHthxSqpXMeQr6J
 APKmjC7EKyVGVoUVUrk399h7zULUz2VAr6RbycLpIQ/pWA7iAZLU7uo2THJeSWEbDwmTZ4s8IVB
 pANcp7ARcyuLqbhiht1JaqhX09/Cc9XMQXtv8cZcrxbqhUy62Vtao25uq7ZqNAInJgWQfdAE4TX
 qxITkTKVfRj3ugeKko8EvVXq6vf5SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160097

On Sun, Nov 16, 2025 at 04:12:34AM +0300, Alexey Minnekhanov wrote:
> Add offset for display subsystem reset in multimedia clock controller
> block, which is necessary to reset display when there is some
> configuration in display controller left by previous stock (Android)
> bootloader to provide continuous splash functionaluty.
> 
> Before 6.17 power domains were turned off for long enough to clear
> registers, now this is not the case and a proper reset is needed to
> have functioning display.
> 
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Cc: <stable@vger.kernel.org> # 6.17
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

