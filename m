Return-Path: <linux-arm-msm+bounces-75044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE10B9E5F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DE1D1BC782A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38642EC089;
	Thu, 25 Sep 2025 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbgDKJX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2127EC7C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792630; cv=none; b=KmXYZsvwAKRCGYZwT8z7Yr0HsWwTBWzgxhRkNiyYqFqeVCk5TFPCraqa5e8xsyHbJEMILubGgKE0BMKTalSslDCUmM4P5VG+QCAJihattujvzg23UtHeFw+jglDnhaTewxVMYADem5wcwyH7BQtG8gZZSZ4q4UwspGRvunkfnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792630; c=relaxed/simple;
	bh=8N6KmcZ3o0RKZfH/SDgkpHo3kvKOR9AZGJho3gtBrkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxSGxPNU8vTm7RuSY/4uIaZoi7vVfgJxo3DAw1ViR4ninhMdrTBMHOhcXEkOM3FOU56Jt/VDR7nW49t+qmz25FPw2Uv+qGAQmqoqdZrX5sY0390qp+4nrjo32aBoHK2Mlh6PDFE6R72XpT/1Aqr0R2zQrfaOCp7/gCcgsqP+cnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbgDKJX0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1T9bl029974
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iv8LC4BuQ4SAYhRCgkZysNJWxVrScti2b4sGHDBPz6U=; b=JbgDKJX0icycF9G5
	MdA83dtx0SE75ma8JY1SQ4hqHwzXjIS9ub6BM9mpP16w98poJhKFiz44Txh5YwFe
	dq18c8I9NZalxoDFiZ2Mpw5e5YdsK4sqrE6bx/h/UTskQ3vINlOwGgl+EUSjDQv/
	3TU+OKt2nYqhnGFzi5Y+EZjNaG/pp4CCp3obyjHf2KQpDsKNEWTlvPuFren4b9GW
	lCxpl2FX4iT3A8q9zLfS1QIjxcbMt9/Yn7IjncuI78ZyWKlelag0dhzpyd8MOn0u
	+ODT4VSpNfp/LfOtlzTIEPheAUK4pYH+lRItGI6CITlQSgI4DtFLwzZ9mS+Td5za
	B8Vssg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fqfa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:30:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-798447d6dd6so2247376d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792627; x=1759397427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv8LC4BuQ4SAYhRCgkZysNJWxVrScti2b4sGHDBPz6U=;
        b=cW4tUzU/ll1mnlweUNj0PhAW+30U1Xt/Edj3WdwgFmUsmBJtjCbeYrejLXApPpYrMt
         eMKRwDpa50mvnXdyDn3LYbZVd8mvy1V/3DGL3xnUgfKNmIod5d+7/W69o0F8iylcw3zo
         A3EjJk9y9Ht5Nr2ceGKMMsbl5AnR9ot8Jk8p3xhOOZXjelzgaSUKic+kA5AAqM/YBHbk
         38ATwGEB4YDmXEXLUkF57fzKNdb5kQMUkOfvH+R3qB05L4+LIPHywnQo1xZ5odnhugRT
         e7pXT7KUejBNosGqPFC4EhU4lHLCUa/prs9UDGl/BzoXfqbmP0B84vE/Nt62LkEb8tat
         NrMg==
X-Gm-Message-State: AOJu0YyC+psgSDbmhd4lTmclCDhqcUssivjXN68iTq/kkBvwJcgciV0T
	VL9nSEIWkIeXowGaeXnRheUEiGBiDGbQMvLf8AK4uJRXGIGSBkwj2WU4q10U/0tOeDmUIux4Vgt
	vfZJ0TrtmlXAqyoXUjiAe4NtjLNeHPifgm1BUww+NKMXDwDx36YY24dpIDXSVvMCM/wUI
X-Gm-Gg: ASbGncvm9SnNE5UtOWmlzP/bh5CZbwgt3/2sWse3JJ6ij/kBg8wermSFyFJjJjJ1AiD
	EYZx8NcNhwVRzejT2ttY2iEautPLArJiD4jiL5x4vFkyUk2HMfhe0saPhVZun2UDV0ENoAMtLyt
	HgVRkpXOUZvHhIMfxuf5hF1L/zVQVLHcOyIvVQATrRb8qNrx7JO/ch9Y8uBWaEJpm55OB6aocyU
	/uMcNncPfOqydYg/zBoi3DQRMm5kiFbFIN7gZeosp2IFFz5q/+9PvHWG4g1T1LfQ0wemVYcckTn
	6q+jrQ2rMnPn0lJlmOCV+hkSh4WadaOk4jHh1YZ0/wOkGIw5QlEz5CF6lDrRtnmKp25NBVp5uiI
	QZXw5SwZtorlbbbSVLs0f3A==
X-Received: by 2002:a05:622a:1905:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4da4b048343mr25294151cf.9.1758792626993;
        Thu, 25 Sep 2025 02:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF84Vn/lXM+1k1uOOSGaZwHXSDbKHURPqKNM2+JUtWDEXTRhKuuefGRswtdVWYy9+dsAxkAmQ==
X-Received: by 2002:a05:622a:1905:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4da4b048343mr25293891cf.9.1758792626509;
        Thu, 25 Sep 2025 02:30:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae3080sm934726a12.34.2025.09.25.02.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:30:26 -0700 (PDT)
Message-ID: <239bc397-c746-4ec8-969a-9e3f3c3dee3b@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] clk: qcom: clk-alpha-pll: Update the PLL support for
 cal_l
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-7-29b02b818782@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-7-29b02b818782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4pRtku08blasaUPZcoaZg7IoP2YuunZi
X-Proofpoint-GUID: 4pRtku08blasaUPZcoaZg7IoP2YuunZi
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d50bb4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QDpnt0wtCZc4EWvjjt8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX2O4Tkkc7M0a4
 ilWMeuSJ4ldsBCX8/A+0rn8L/Wk4fZgrzgcBMNGkMV2o7eQgBw8B3S1/ezuG6KrDgISX5io/gCz
 bpTnbuXFOGz36NfEHLNH6R3XcldeX1f921KIHW4AR7MT7YjQaTgvuk7TNfjbMqw+WRl9v30zaWX
 /TwOoI1JvZfzVMfGgqtQZhlW8TpeZ9UbLkAT1bwucHsavEA+B7pvMdAhVcBFk2JH8W5STNpq1lC
 I/7JxN28MkisK8YF0Q0palY4yyvf1gFNqPJ42FlmConHvWu6tWO4T1pz2OEJHzYLrDOQmgyCq/D
 du9menEQfgoTOgFNpQvp7dCK3fHJ77WVGuzZIQ+2mPykQsnEGFGFv87ds6HvZlVEBs26HFP+URm
 0R71XSbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/25/25 12:58 AM, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Recent QCOM PLLs require the CAL_L field to be programmed according to
> specific hardware recommendations, rather than using the legacy default
> value of 0x44. Hardcoding this value can lead to suboptimal or incorrect
> behavior on newer platforms.
> 
> To address this, introduce a `cal_l` field in the PLL configuration
> structure, allowing CAL_L to be set explicitly based on platform
> requirements. This improves flexibility and ensures correct PLL
> initialization across different hardware variants.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

