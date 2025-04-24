Return-Path: <linux-arm-msm+bounces-55471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D159FA9B4D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 18:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D16EC1BA658E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7907428DEE8;
	Thu, 24 Apr 2025 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5eG3B0W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461628BAA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513910; cv=none; b=Kfra43NmSf1WOSKT4r9Oik5hce2hG+ljnYzHDydGh/R/fYHiQEAbGLTmFxVhp2eakmhXzUa7Ms1mdER2AV9wmRC/mwndEFFkOCxBbSZz7hFVPZKXvKkx4eAZSDY1Ih0khDRgNSim9o8uODD0KUmqJDBjgormRkj81JfbNfQEJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513910; c=relaxed/simple;
	bh=lwIVb6Nui00ZfZD89j30bpJzTmw1n5wUZd7dfBimA3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JC6MdjKz1mpEUvrtPFPsb1DejXWH61SzKlCBv0Gj87oP1HP5siwqi7C/i+4y8Uw8mHW5za01AB3oCXZGZg4oZJGu8QOzZmPvY49mkhUG5BY+ITZLz1+I6ufaAu8ptQQzhiMUbuIdweHLvmyHe6jzGY1Zqq/iCKBbhdZPWbH0YwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5eG3B0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3Ess011681
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9+kJX3qmRmZ2snfGBmR0Ap3enazyk3U0iCrZ9pj2O0=; b=D5eG3B0W7PYD0ivr
	qKb2yY8BsGuY3MHBXVwGb2Z0wEw47W/X1Y+34no5gp71saWSt3Pe0LUVaQT8oDQL
	UbGeSxee79uaV5oJ4nRnSuU4BO8BKQMCPn/iAtKRHZIPrUibT4UsWyOmQ2/eWPWI
	X8zohplUMo76IddWA6rs6ZTnRe5xBCvt4dPi6s9MEGA+/A/pmyoMFFjPQNafZ07Z
	iAs+d4xko576QraV8Ibsa4sIS6uUYLT6jFgIqEizKJyMLsQ2dxE3YdjUM8M8yidF
	W3PwBq6y3/5KhsjszBknN/H58VKxVVvoBMiOekD2np54JMTfuPgfSmkm1q7qei5u
	9CVxEQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1pcb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:58:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-306b51e30ffso1142073a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513906; x=1746118706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9+kJX3qmRmZ2snfGBmR0Ap3enazyk3U0iCrZ9pj2O0=;
        b=HC+DFJtnLr2FrUcowoqky0ieoX2YQENYKfAYCSaQbNGB7qos36ZSIrWuo4Q2CsJOzt
         f/MKnkTfWcpXHrgpLtunoUGJrB7wwI0OX+DLBJr3+Jh5xvZAe+Iff1pFmlUCUsmOz+8c
         r2uum2PX+928j4T/5UP6VYMNHGu4/WhpGEKBm6HfwliVsH1fXeCayTo0guyCojairVzI
         gejxiebRHk+TDko4UTMs66aMqSkew3ZcKOxWuNzCXukUHmIK6OqFF8HkYw4AVVFbFAWq
         7NLNR/6DRZyerd9sGXkvqqF3NED9wBsZTf6Bwu1U80W2wbNDORbmF9hArIf3sOpD1DQy
         XyQQ==
X-Gm-Message-State: AOJu0Yy65ZRCWn0qS4O+wSUNggXK6u3gqVujIakANGso6MiiKxZS2OlF
	Fn9F+McUhvlu8OvPHGPBZ8egn/X59s0n7CeqQT7nx+M8zRVSqbUVtInT5JirP0uPx85ZMCeRvH8
	S0eM8bKhqwL+XJrbX6BIko6nHXM1TiuLollEisqP6MixboDcFESPaEMiFE2z9pPgv
X-Gm-Gg: ASbGncui9PtYzhBlVaxfToFL8NSIuBiV5PPvRGnwcBc63oW2X2ZhF1RL7em2nZEwfE/
	/eVMeu8v9YefGLftubo69sACGXEp9KkbjgPpkHt6DktZIHQZSNGaY5VL7bCxGuhbvyquBM0Co1J
	liHjZLBJKdnHs/9YZsZF3/E4dTVVex00G+6IvlZ7s7VNgvrxi3kwgBvIAnHPQLWtiCLgEj/osed
	yyxi/d7hm5AY5Ek9sEJJ1aTD4dFRrhCApNFaHpGVAJmvNIFhgDyMK+OVOpiWsgzRSvSsIyf+RAJ
	KhnthJqXml5+HbCMZrFIfL2B/+sdMNGkhXynbQymcvaWg62QlMJvvCi7o1PeGZCVDbY=
X-Received: by 2002:a17:90b:2d0e:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-309f56d8124mr558472a91.35.1745513905708;
        Thu, 24 Apr 2025 09:58:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh1h0ZlmpzYkSjNOUZGfK3vhdOgJu5HDMU6J41zqG3DYFF1qB5+gZ+Sugq+6qPpgpDKZSMxw==
X-Received: by 2002:a17:90b:2d0e:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-309f56d8124mr558444a91.35.1745513905372;
        Thu, 24 Apr 2025 09:58:25 -0700 (PDT)
Received: from [10.71.109.146] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef09689fsm1644276a91.22.2025.04.24.09.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:58:24 -0700 (PDT)
Message-ID: <3d583880-5e94-4f12-aa50-96d133276e4e@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 09:58:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EHPm_jvSFtcIlGc3FC4ky8F-bThbniqh
X-Proofpoint-ORIG-GUID: EHPm_jvSFtcIlGc3FC4ky8F-bThbniqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExNiBTYWx0ZWRfXzU6dfKZYEh4n f091jTMYldslJlLvOB6aio95UEXY3l9XrReYuBOWMt5+c3a3fJdDcEvlE27anRWxadWNL6Y3eBM jSL/wmdYH244eXUsrugFRAVZOhW1BTH/v5OqY8h5XrrrCfnh9jEBOacvoKNvVsrWnFkW+wJA3C2
 Y/T1c+Mzjgnr8gA6Vw+BGCA1EIpPOKw36AAOd0E7+kkrHuklOvDuaFaND0Qnvw4hJZeXIewPCVg KsmPRE7IILkpYpILle/LOWsKZCHuCnywWX5OHVDLvhcUmvAa7C9uKJbZ62rHkoVc4mK8lHd+28/ ty4wrqpnAlarzPlzTfXcDpwroX6iOkgXP2YUpP5XTzShr76jFVlNcAi5vIvvHj3ANiBsM5DiP2Q
 Fwi4BWR01IcB8b1C9/fbZpeABA8zO63oLIGsvQ4G6OwDVQjr81hYBQgZaeuLVjUvAR7o0mJC
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680a6db2 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=8B2AFzsc9gyHPfch_-wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=654 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240116



On 4/23/2025 9:47 PM, Maulik Shah wrote:
> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
>
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
>
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

