Return-Path: <linux-arm-msm+bounces-85477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E30CC7527
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2521A3053FD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AAF341645;
	Wed, 17 Dec 2025 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HrcMJqsM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZtm35lw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232F33F8D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969985; cv=none; b=IqziTqcmSv9Ai8RAGliI70/X+fvxuLPoyMIMSZZHZIpdCgQXSyjILV3ZlZgGCkyhdrKxhPbmKvy6Xx8VtS/Ck3I+CSi2aa4xtIo+xBEiRGtp9XEa+NU36gC0LTHc2kVOjQpfyGiL9bi+75/miy1Y2/EZ9UKGa97M+v2JtUzus3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969985; c=relaxed/simple;
	bh=jBOMNeoZSGFfnDvdceHpj90yKVBrUkvgfUO9dxv1qn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQpkGfhAOS5xNOpGMHl5vjm/SC4aV1DbbA9T5PvJk3BvVuD8M78jf7JAvdGgrzbtwSkY2KPIdHO+AAPkJbiUy372Ob9OjSUMG36/m498nluQgHP+jmY5qLRZtICBDX47v9sBgSfowfQ6Fqq5kTMwC7RLo6BmtosHLX3hym/WFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrcMJqsM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZtm35lw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAQxVD1215411
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=; b=HrcMJqsMrwrO9KL1
	YBJgJBQWnXdifnAdSKhpQVp1GKtb1CoyIhK2+gMsDXz7EWV+KtoaRgWjF9ZSvcev
	TVBOHwxn/FV3SqEV2pFNuJE1sZLFSOZs7I6NDZENxL0WE0M9TjUQXXrpDA1hI2ma
	7axN9i2Z1/0KIUj9DHQcoMyGfM66fwA27Cx12ML3zggHCljoDdc/rRJ87QTGPswX
	udDqWuxbIBHfbv8mLsIoa1r5Rt1akb1B+7964LkY9AUnCOA/Ej43X/mF0KYBIJAe
	r1hDK7ka+QyweH3liPTBuyv692pDdDDRZ0Y+WpuUkRUKAopIeMGSHunX9vqLYC7a
	8wsJxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g31am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:13:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f3564e2321so346661cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765969982; x=1766574782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=;
        b=WZtm35lwN0NXEGfcV3F6Nes4jgrNHuBqjH/rXBqLt/jbYSwFwK11Js10QVdbdnJwy1
         pMtgmXFxj2wYvMUAfi1/CCt2GdS/6UAizhshhBtuSwVIP2gacVqNcIPzCMIukGowK+sd
         8MtQIjP+DMnvHxg7jHmc8wYP/CQhfbZo3Essz/u+4rrUD7e2gMx+Lu8E52WPm36x15QU
         24Z6L7Cm7ZC7nwh55ICFF2RGPLzQw3LJ7Ldd+/GsHpqmuOG4gdNiNW9oClQt3EKko2i5
         rs0W0rnWEudDUpZRAcv1qaXmzd8OHtzxTWYVn1B6EOIofI7nMlrc20NASbECxlVQw21m
         eEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969982; x=1766574782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=;
        b=rRSznmJvy274qQNNsPQlwTNzmh/lZMpBuHonzizxGoBf3JbccandqNFlqbBaSkup9Z
         RFKRXZhNu/7/ONxBdQGIlhAptAd9hiFa8QQM+jt4Ld4BN23LU2Vq82353Y5LBvFBVBzp
         O2bqPFfTHIoazVshvtVtMMIZUsYvcR9BnyPjSy44QGmoH9EvJC17HhHxNlVBwA+ikM1Q
         Cpa1504r3tVSbZkqw1/gA/yWPQBG8z61+Na/53QC9wgL+z+EpkCnQxK9Obop7jerHUqz
         XDf2TQuGT/YJiIAmZTGmcHbpY2F9APiF79gxMPZEWQfXAJ7iO3ouPnyHJMC0ISn7cwtR
         cehg==
X-Forwarded-Encrypted: i=1; AJvYcCXmgrZvNimYvWn2VyVHTKUx+Nl7bn13SyyUqZidU4pc+NbkIMBh3NZMgbGM1nygA48vQznxzwrGBUWAnCcB@vger.kernel.org
X-Gm-Message-State: AOJu0YzWj3+L3MQk1y1TPSr+fAb87wEe5J0/D36xlncWyEF81QpOZrly
	IxsBHz3q3BeTwD1zzLAzqgHEyFcykq++h3txi99BiWcOjIRRpMqhi0z3v5mf04r2BogpdgDAFA7
	CB66SWmiVUQwugXVeovZy41IRHK6mg00IW/yG1PfjeOclrpB9yed6L1a7isTQcMAFqkxZ
X-Gm-Gg: AY/fxX6TcbWn0WEm/v74HjcYLP+hYt5v3TSkahjLDuai664cJrq/z6g8m7f/ggofSfY
	rx3/B4L9mnICcdt1If915GFjmbKnZ0qkcUexmtNYHX9F54h0dbcmSyybq6j+6w4dXT1paNUTTnF
	y3YlIcKiw0D+mmOkoiCMSoDdYa6Xj4d66Ib4M/4uAaJ2Y7CSpvIXhbIM0g/DQB26HM//gSz2Dom
	XCtn5KtJW83urWI47tIQNUN/I0Rj85bb4yXLScJ2PhaKog+tWyJ0V8LkcNE+mt7y+V1nBw1wDIf
	zHuxG+HmxJVeOFrs+ERA5ARoNBRPYLx0lCcW7jPh1Eo88xxvFh2z54+QbzOIRP0dV49h75tbm7h
	I0r50al7eb7WBCf22mA7XA1gfsUAwK09vp0RGaW2pP1hDlBcOJeXK7z+wpW48iOF/kw==
X-Received: by 2002:a05:622a:44f:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f1d0586436mr189091031cf.4.1765969981889;
        Wed, 17 Dec 2025 03:13:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHde3INckVEyAtJpPA4moTPTi1MTG9MaZWu64iJa9nrCbGOgdnmQ7Q8sGmBSfSB/n8j8rYYUg==
X-Received: by 2002:a05:622a:44f:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f1d0586436mr189090811cf.4.1765969981412;
        Wed, 17 Dec 2025 03:13:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b44620bb8sm1151802a12.14.2025.12.17.03.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:13:00 -0800 (PST)
Message-ID: <417d7e80-e098-4993-85ae-59ebfe50934e@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:12:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yDs-Xx-GLrF-t6olNnuCAFcKKZJdO1rR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX7WSx21O+GODR
 DhVtig+ck3zHBdLawCAP+WsnQ735oSDUa5cMc9UxHkX7Xmrlvz1h0c08DLcf51vTZ38jJzHtThG
 V9UPz6ZX9HXegX7MUq9IjrKaRdqwBeoE2U5Wy404kkV3bnXgdD/pOW7GP6Vky+qG60dlL+wV0m8
 UQaF3I+P3zcNfitUGeTisWlWTyGqcVQDbZoYnN1CjzftDQeGAccdyruPyXCMF5CT6sItXYg2XFe
 wEfam8Dd59/ZueMHk5vYmx7Xy3kmyNb1E7vLuRdTplRttkVMVgzFmPfbayyenFp+cgqgv08kfWA
 sShxmt0xnpwMnVDv5u+0h4VKcKKDS5ftdNxpxESIobFw6dJ5o/4Z1Q29URUouJ9guivIIuW+zwV
 Zl8MkcA8EROoXz5XtnjjxsnMcw9wIg==
X-Proofpoint-GUID: yDs-Xx-GLrF-t6olNnuCAFcKKZJdO1rR
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=6942903e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VLFlip5mi2fxP60pxFoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170089

On 12/16/25 7:22 AM, Nihal Kumar Gupta wrote:
> Define pinctrl definitions to enable camera master clocks on Monaco.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

