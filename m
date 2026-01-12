Return-Path: <linux-arm-msm+bounces-88501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E7D117EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABD38303434B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EF3347FF4;
	Mon, 12 Jan 2026 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNVl5X1G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWTvjALM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2B13469F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209965; cv=none; b=mvSlZPNUG6hJHFosI3Uc0RO/YTdlj1jGaXIt74SLM3zeyS7/XgogSYBv5k32h4NFUakD1pL/eSrY8HQhV4tZ22WtPzNYIzXV3eeID68pQzcWhpwi4752fyHSQa3WdcUJ4EHICxC3cPC32qgTbueifYXCrenty9LkMxeCMS304Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209965; c=relaxed/simple;
	bh=HXngWrEzDVPMxE7GhOQ/4/1MlXniO/M4NmrljMiPjt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6ETsN7/xw8WVdxJzz9WwVChpSgOT6/nxGcuvjuKCyx8DfF6amoyMDgdp17mEopx5UdRAYZKK9HICPDi7pt36mp0EgHa93cq7xxxESKvhnvvI24xNhxYWT9uK4Dry2ehuqlGw1hU1hoV+GE+F+ZwpjxCLtf1jYhonZytWfg3ygk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNVl5X1G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWTvjALM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9F2gm1092197
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Adek4ZbZXtqJMRXQzKdnewMwSvLDcDg3vBsFEZpsDFk=; b=RNVl5X1GAw5WyxEq
	9Bw+vVL6ka6hshBWhdqnnKHDwckZhZkE6JzBquyMVJp16sSrC7Ky+dSiL8vFvR3D
	CNzMtHMAGzmDKjzIiNsSIgjsSPptN3cN6qCcqpFfa4QCfDZ43ZAgzb2t1JrEBQvX
	xdTREYkuGpcqAJVFOOXgmkh4iXdV6noP/CpmoDl1aV/JYuBgFf0nvvR5nSWNSFBd
	fw9pgyHWF/XoJlf1qu7as3vRC+nyia7LFLyz8bPWlMnCYvWn5tYw5gSv6r9pGZjD
	iIYX5o2xJknmfg57pMVSUWy3LcsrEh0z0IWmGITfpql9eu2GaJsSfBJN6oxuJyJn
	xuZXjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmx5mg1a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:26:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9f3eaae4bso160066285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768209962; x=1768814762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Adek4ZbZXtqJMRXQzKdnewMwSvLDcDg3vBsFEZpsDFk=;
        b=kWTvjALM+K8u/eB9H7LNauu9/Ss1VbTLyCfLDo1amSSGthPWllJJKCwocqeQYLVb0V
         woCcmxrfaIv4wGTOEsFtFpu1hfTKqpdKw54OWyX6cNfOObcpHolvohCWjU0RMU+d54aL
         cBd/IEIWSfDhsNI0hsw1MYR2ozdnqv3ps33xIALBaIi9k23fqdeFt/2yKo1zVfF4LCvo
         QIB9DWl16v8vCxlMtlDPANoj6pkYuFmF7a1Oh8LQJO0amibZKlmgF+uICnCxpV6Qnwj5
         MB3BG23mXV50z7JJc6EjM3KvZ7NBCfAaTH9rSkpLjU82MEgHna2L/zLCc/irhC0YCdqm
         lOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209962; x=1768814762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Adek4ZbZXtqJMRXQzKdnewMwSvLDcDg3vBsFEZpsDFk=;
        b=I+i2pbBl8sBqKTPT6QG/Dm6ifwdKUFMGgOWyS7+ukZ40odMuMB1jVC0GMPpCvCeBD7
         285HMjh5iJod+wqDl9nmSMUmqY9dGqXfmO98Us6NoDSL8JeSd/i+up/M4dtWYGlqIwRT
         OToTnPC9boyjSoU/jhYiZdY3Icl7zTjRBGOz1EKsk2Xx64EbHPnWU+tm6i5P35UDHVB/
         KoKAWRqTtW64ZpL5Udsxp/os7TWOHkhtos79bq0TrVHSCnZij2uKUi5wzM1XDF54lbcm
         ZTNNVLIpDjoOtfMLVXBt+gWzJY0aR8yLHmSjmmgQYucpFWH7q5bHSJm45hnzQuN393h3
         8jrw==
X-Forwarded-Encrypted: i=1; AJvYcCXqFTAmg9rQ/xUdZpZ4IfmKPRl2D1eyzBTstPvTDAnMl4JNZuedXoOQIRKyzUWIQPFnSb6yiAAZ35klyWDw@vger.kernel.org
X-Gm-Message-State: AOJu0YyUGUTrPtgepEGPkoqGHMhA1elaMUpAgEF6E31WeM72teokBQBA
	tnRNXKKp1yM8QwX30vVj0fwCidXZRoe+OAdStT4P3hVMGd/OOJ4H353vTE34k/Y1feTbLJYa4xZ
	5G10fkFAs9usXtTzxIpbi51lu1bVPXgMjZI48W+phRrgGqs6bADzGYk7NYSSesadxX80Aplfr/O
	p9
X-Gm-Gg: AY/fxX6iMtSvV0iztLuWpg9UAoBnZKq5ckZL4GOxGe1NGk56CpvvEu1j0lkGbCY02Xa
	gxtgJwG+mQ/oawcMeh2PAiC3yLqE6gorpdBRZHrDu4EJD6r76xFEHtBTWGgbio79SVQ7NogVfyE
	bpQOIIRYF2tOxFp/YOQGsKpfAV7VDaw1iay5w2XzebdpIbubxP6ug8nUtRzNo+nD1c1FZe4HicY
	CM0lcbMBg8Om5AshFjUsZlbQFEABIVSNeq/ci9gYKH2CFPLwVxE3xh6t1lzO/frgHHZfDNxxG3Y
	97zGdcyqWBHYFRKhw2Xo0b5uVK173gld3pPR4tewLYbjImzbjgQ3CtNvuEeT7Tpkq98UDnuOgGv
	Mr9LV5h0MnJTwiUxAjfJ3L1C4uY2DQAItWxjM2RQOhqbcuG+fr+6JZ0++OyXiCTpkihA=
X-Received: by 2002:a05:620a:370a:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8c3893e7e43mr1786300985a.6.1768209961812;
        Mon, 12 Jan 2026 01:26:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfupqTRxY8QV85vvnHKSvYdncZ+1eCe8EbZMZs3pmrGvmHpxMorDP+NAwXs2sxddYq1zN7mQ==
X-Received: by 2002:a05:620a:370a:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8c3893e7e43mr1786299285a.6.1768209961303;
        Mon, 12 Jan 2026 01:26:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65ca0sm16788595a12.24.2026.01.12.01.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:26:00 -0800 (PST)
Message-ID: <763a5a4d-e543-4799-bb9a-44c6d154c929@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 10:25:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: edp: Fix NULL pointer dereference for phy
 v6 (x1e80100)
To: Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260111083317.604754-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260111083317.604754-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3NCBTYWx0ZWRfXxhH6+UtchCrZ
 /Uxw3fi1WeQOmaZ5zj+ZkOmUM3DHn7OADU2VaGPmZRldP8AOLceGjMSZevDeSbbi/Rq1Ggfgmno
 VvYBhU1c/NpevtPwsE9PNvt/RBZtfqOgf2GISZAFFzeA+yCq6ZNVPiueXlUJBIphUZz81waqj0i
 AAKw+HF80M5X9PkjaKVICkkvFma6PJSAc4LtJp43/4esiLZG+DGGWZZCFctiSZcTDOtw5CFmbl6
 v6/gR87Us3pAY7U4mz2KA19MDcZzB+Qvq3VJyrao7P1eNISDZV3zq+ai/2Cpsl2kLtmYmbRPi9E
 bPhwFKXjXxaFd8xv5VuHTndXlxvfF5QQW1CTPLn7sV6EznlDCQqBIAAzFJ4Aw4D+kI6V222cOP5
 OOSGCp6ffXMHS5HpQmEfrsnB1yXaTxxBop0tEhKUwVJv1fUmP/xZOziC2kOV1c9xBdzxWNXodJJ
 ekb0q/9W1DFyAEjok8Q==
X-Proofpoint-ORIG-GUID: YvwYt5cF1tueGe4ttx88er0GP3_5B0MN
X-Proofpoint-GUID: YvwYt5cF1tueGe4ttx88er0GP3_5B0MN
X-Authority-Analysis: v=2.4 cv=Q8zfIo2a c=1 sm=1 tr=0 ts=6964be2a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JlKCqTmyOVKnn9NiQ40A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120074

On 1/11/26 9:25 AM, Val Packett wrote:
> For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
> stub implementation was added for the v4 of the hardware. However it
> was omitted for the v6, causing a NULL pointer dereference oops on
> Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.
> 
> Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


