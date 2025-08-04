Return-Path: <linux-arm-msm+bounces-67689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF266B1A30F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1563C1630D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBD7264614;
	Mon,  4 Aug 2025 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFFm/K5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B2A1ACECE
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313404; cv=none; b=EZLuj5J/xMKlIN6CnJ+mRzmSdVK2ygYfqwjQuA/8v9nOR6VQ2OPhPzdS+5KO2zCbmEB4Rp6eyp+bbM61W3/rNmo1m+lKc7rW6SOYBA+/HfyavSqS83m9MA7wTj9Qlw5oNHhZA/7NSgsCOIFIrtBMisgdLMdZWRuRlltTDiH6dao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313404; c=relaxed/simple;
	bh=LGF57M35rgadv8iq9N20lyYQI6dPzqa4pdKZimyhlbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ici5cftbICnB6G81slYVejDcU2Tr3eVMv/0t0YI1IeGkJdWCfoTIZf0dFFCDCai3wP3Tk05CeRIQgygmg5xJGgOYj35IVKVLD26BSkRMVoE4gXQged/9uu2R7DHa+S/axIjoBBaluyBK4XZb6ugXjebDvHWlPQu+xZiYgP5oeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFFm/K5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748bAlq026764
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 13:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=; b=bFFm/K5lguhDneyS
	WrB0qC9uZnJMCyoyyTzA6D60uGTmBFWV6+ajaDsBYc1M+qeI0hVynRSaVyh8d0HP
	vwUnwNppc377sTEXgSpfUHt03B8qogqY6JbmEouNYZ7fHWrEBd0/gfNw8xSD/prH
	fWYh3kkIGXJxh4p0najhgLrQ/FqojwQwsRctULet+Dj22D296Hxn2OC3IurXQxWr
	yJL/48cqWZoEUdKxG93HmQv9sUkTj8/LIA9wJqBtIHt6TYLpEiZYUT1oNkGz8Zgq
	5IiC9Po82NlTrbgZdOvfdi1ahcQYSoQC0njdkx/BQgF3u/mzPzx22uEuXmiJYxSq
	pgMJMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rnb94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 13:16:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b07b805068so602221cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313399; x=1754918199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=;
        b=kDc7QEOLmy4OPrhyUpVvXlMGR9iMlTZUFMkTy6PSCfKKQ9VBJeq0ZHLz0G5qfDX5AZ
         rZHue6gxYOtz3kv41iakd65hwU69N5ybemPN0H7jdbntL9ETAm3h2TEGtFLgsb+iZrff
         PpluxG5MxxWy7Zr/HUKAKRWkCDEGz+rn+BHX2slLtylTD+F0g9Duy0Xt0x3ylcw5alr5
         zb/n7MUMr3vfxs68nyil44znTQEpHQ5T4GWFYzTYswAEaEPEpEG71Cpuxybyawan2Am9
         BLuKlbn2Z4azn5qt2qWFmLL4KeRFrteaOnxCt8fxmowQjMR39XRo0ReSVfC87NVfjGeg
         JoAA==
X-Gm-Message-State: AOJu0YychjPSBucfMv1xScIpB/tRfmvKH2LlX7hkjMRbMc92nXV3t3W4
	KmCGBRmpRLH6HdHD1GkcvbYBoO2ntY37m0XCKk9GiNlpjRBcLdlR4VlKOQGEBCoJkwDdtKw6V6T
	it7eyAycrx/OyWmWE5G61QO7UyOuZVl2gCwwq5FiS5rbR4j4Lp96Dd8xD9CfrP94Mu+dx
X-Gm-Gg: ASbGnct812x7UgbG/pPAc8143xawa8+zRt35F6cjysyvI50ALzYT6ClbLvrTtIdZw5m
	YO3r9KOOpj7irKLBX96582J8qAIlMXIjC/QUkdLwBwGnqusgupQ6bw40eoiD89ihmqazMjz8KNk
	DNiaFGN5VXzXBsWChNRY+EBdRWUKyPZgFXtnGAh1AGuzle3Z4eO3b3o32+OucSrTrbU80gkrvvB
	Rh3youyPfeajAR9gNoyQg6ihd8iUmzxyA0IUPSeH5MzeeRoXoN0Rf3KZ1tHzkjlf4ixi9vCU67j
	BmjWL0m/aOVc72wGwX677NAWdkSqWLRTbn8Jh42TpVrx/Ot66Xu9ce6/gfbAnWPqyGi3OGUkMkj
	VMhXkL2SansxWqzmLRg==
X-Received: by 2002:a05:622a:1211:b0:475:1c59:1748 with SMTP id d75a77b69052e-4af10aa56d2mr63735551cf.11.1754313399527;
        Mon, 04 Aug 2025 06:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf7yZ8n4Kn22sR5Uevb5Blz+Ts3PocLhzk4Ya+jFjCOhrB42Tx4xCPXD1tnN8w3MczWz9xng==
X-Received: by 2002:a05:622a:1211:b0:475:1c59:1748 with SMTP id d75a77b69052e-4af10aa56d2mr63734971cf.11.1754313398788;
        Mon, 04 Aug 2025 06:16:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe82a7sm6859797a12.30.2025.08.04.06.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:16:38 -0700 (PDT)
Message-ID: <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 15:16:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BOKw5Hru4QfJg-Gy69XKs_dv6lAUTKcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MiBTYWx0ZWRfX5LFRwZcbqz3n
 SbbwWRYgQ/OXYrqclO/ce2acIuFfnKf1lgxKRYkEsYXy00o2DNBkSF5Gf4Fv3HvJnCj323RMXvk
 Rwthz+88tEgb3/mIrlkdiQh3CJpLi5YwODcMWmQVGPOZdZVdYxFn55cHsMGZV56/vY1Cchld98A
 FV7fD7wWdq8a7NODir2F8mNz4GQvnkTp+9O5YKk04ltb8TQ8wn8uSP8Z4FZcAl058Xioxfen3iJ
 fMNCfxpywrpGB8pKd6xTmia2vUhE9YZ31mmJSa5y4Wp/njUkRwL9QUsR79n2nGMuhTByoz+3zLs
 r4FfrYi/2ZpQh9stDABWNiDBqNaYHJvZH4v7+oRDyuLXNNC8hpWYwGz6s60olBRTGN9oiNmQEL3
 +FLHXc6vNPP6Cbw7ku5mnPwFkv3M0a+8mZTpkWzHmN8g7bB6SJq9YuS/6h+pQWSjG15k1EpV
X-Proofpoint-GUID: BOKw5Hru4QfJg-Gy69XKs_dv6lAUTKcU
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=6890b2b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040072

On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> -static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
> +static bool qcom_mdt_bins_are_split(const struct firmware *fw)

This seems unrelated (or at least unmentioned)

Konrad

