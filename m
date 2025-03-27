Return-Path: <linux-arm-msm+bounces-52655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 880DAA733E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1516A17411E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7592163A4;
	Thu, 27 Mar 2025 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LB7FkJMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0517A2F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084370; cv=none; b=Nj0nmDCZzh950LMfTCDmm9pABzApTcTfOlitMb0y+2w9SGQ07hwrLODGx53YY4VGEbCX5mthA9sI47/VOs9dQgEFdPopJqS0Du7aMBEmYdH6QJYzwe+9sBRZb5n3l9bKm+oquDCIGEAVY1WGgKvJAgzXHJdNCzSIlx5C4SBmmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084370; c=relaxed/simple;
	bh=afvCO3GqTkYmUbMmMPc9YHgnK5xxbjvJVFV7ZeJ+Lsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfZLDN53FPo85RVqiIR9zI48Fk+wIREGKV6DUztz9u0L8Ye9DKdFv9v/T2VRqIFmEHYY3XqDp1y1K/5RerROgGDNLU0kX0V2vPwlKoadhbNqF1Tcv/tOjAaTqBBz+QAfiZWbaRLCCZQ/VqRkE7InGhkzQEQ5FR3cJjwzvmZi+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LB7FkJMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jH3h022987
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Z3KvQEYwkY1/2lhJB022eBJFJ7oF2A08hRma9OdFRg=; b=LB7FkJMGasCGJkip
	Q7A7dbQ6r9RxeV5jIMlSsgL8mVRhWVYdDYIJhRBl1AWGBFfn9UCpUDx7fwgUWvTw
	Q6xHrJFlcyvuur0REohlN6aIEqg6v/C6UJ+FYWLIYoTZfQeuttUoDnVw7xjmefU+
	hv7dQhSW0vuOsVhT64S7ic9rulR5OfEMlq+Q36aUNp1HtRY2jnxA/1QTtSNN/Ct8
	PT18n5Z/7OT21H0sKNIFhp1zNfPsR4YmlBFniLBgKaxVMDr/THoeogKY3Z3etS+0
	77IpJAJYEuqHwBCygupwOZ19JFlOlzo+jzwsyCGCDmZ/3PFaVpYlnRiSQa+QUx9r
	L7e0Yg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mw0gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:06:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso25289685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 07:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084366; x=1743689166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z3KvQEYwkY1/2lhJB022eBJFJ7oF2A08hRma9OdFRg=;
        b=KUfu1jt7MuXg0Ideg2DieT3xZROS/BXtQ+xakUUD3bUOpEQ66DCmUst8+KP8/qncG4
         tRSSxQpvW521qIM1qoa69NwA1VEnXVumaAtr9zcjG4RMUmNEeOwLTn8D3sj9in/bTMGz
         Qt6yXMQmZotKRlUPLTOX08OGguF7SWfBEVef8CFEWNZ97I1RxI4XtT46zUCrh+ZO1A4H
         O1DrQ9viMAoLBncDNdkE8MqB19jNUpVgUlJAiu23Z6m0AZC4j5vIU//aJ8ZBIGmGzj0C
         h6KGyUmQQNg2oLqqq/lpNG3pWJKl24s6V7Zz1FxcGFS6qtsEnncp7REChUN3ey9p32pN
         ED3A==
X-Forwarded-Encrypted: i=1; AJvYcCWSVTjUYo2f+O0kd/R8n4kkBGHwT2uphTXu5m16sfRVFETrX8EZKndr22f2NUldpQc8exZeSHoKDO/XZKQx@vger.kernel.org
X-Gm-Message-State: AOJu0YxHQ9zlRF9BBLTectjk/XEUXLt9yN6QvCys4VPfJ3L3eDkGOTVb
	83Iz5yAtcH1Iwp97s4hYyuqXBLXtRu5aG5xmrsq2M542LsL4egUkpukElae+RVnlbkIAAcPpGmb
	gtyDsDFDpUSokM3V6RCRt8WLEH+6S1+SP5ahE9RzAF/49BP93khnM6Fedi/mVH9oB
X-Gm-Gg: ASbGncslobPXRTiHIAEdhuKPkNozGvP/GJfjuhcWAoKyp1vczfd8W14d0eCnU68LGFJ
	fR6c1sd2LY6i4VZ9H1qn5arA3leBvSD24KNR883F/DYn79j3xhiwgViP1RzFvO4Zb1rO1ZkaFE6
	kX3pzFKzsqfZGfT+oyvHd224clHa/u27EazbnyjHcP2OKXb5cL7/cpgG5rM1SWanGF4Yr7Neacc
	mX0CnevORnsQqC6+xM7d0hoJRM6VXeWlpM4riGiXIJWsyvOodrH8/GrbmFkE7bDfsXghv6vsrY0
	mzRuuW2wd3HAz5rAmqpO31zvN7FFnHAX4OKanHdesr16I42ErBP/yLM9mdoa6fxq1ubibw==
X-Received: by 2002:a05:620a:444d:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7c5ed9e0e27mr214865185a.2.1743084366494;
        Thu, 27 Mar 2025 07:06:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9U/NvKfe+2u2COADpA0a5xEZZ0BxZtOhr2Vb8gi40zJ1NKZ6CZ8U/c1x/1bIsmt3ifaanzA==
X-Received: by 2002:a05:620a:444d:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7c5ed9e0e27mr214862885a.2.1743084365910;
        Thu, 27 Mar 2025 07:06:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e5128sm1235201466b.59.2025.03.27.07.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 07:06:05 -0700 (PDT)
Message-ID: <f2e1090e-d4b7-4984-b852-5d7cb54bae6f@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 15:06:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sa8775p: Clean up the PSCI PDs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Sayali Lokhande <quic_sayalil@quicinc.com>,
        Xin Liu <quic_liuxin@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-11-b763d958545f@oss.qualcomm.com>
 <dr2wkctvk2glk5agdxpijmz2wifvj5f3dwyh2pjlzesravutwx@xa4zcsuyur5p>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dr2wkctvk2glk5agdxpijmz2wifvj5f3dwyh2pjlzesravutwx@xa4zcsuyur5p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e55b4f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=sGqUSZP9eBR_ybGCrCcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fJEM1gCT8xY59SRBiP9hnLwo2xWzpH-f
X-Proofpoint-ORIG-GUID: fJEM1gCT8xY59SRBiP9hnLwo2xWzpH-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=864 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On 3/27/25 3:00 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 27, 2025 at 02:47:13AM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Because SA8775P comes with two disjoint CPU clusters, we have to follow
>> a similar topology description like the one in sm8750.dtsi, so:
>>
>> system_pd
>> 	cluster0_pd
>> 		cpu_pd0
>> 		...
>> 	cluster1_pd
>> 		cpu_pd4
>> 		...
>>
>> Do that & wire it up to APPS RSC to make the bindings checker happy.
> 
> Should these two be separate commits? One being pure cosmetics and
> another one being a fix (probably with a Fixes tag).

potayto-potahto, both are needed to achieve a non-cosmetic bugfix

Konrad

