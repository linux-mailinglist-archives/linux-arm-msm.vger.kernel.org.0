Return-Path: <linux-arm-msm+bounces-62208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C12CDAE64FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 14:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626B24A1174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D526F2980BF;
	Tue, 24 Jun 2025 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe3zE9vM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC8294A12
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768231; cv=none; b=Y6Wk6ZhTGQeAZdn38/Z+sJmkBxiKsxInjlNhPchaB9V8yiFR2r4pOqzz18TBIT+9CPq96cNCeulZ0OFZAN6SJdxTKoJf77xSj1kRaiD3la0sVs4bGybmsr/KAHezcOWbn0lpdR3vQig8c4nmkr4Kly7WXcd58yhYqBwiO+Kmhy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768231; c=relaxed/simple;
	bh=p3Vh7ppCkQ3RhWt9SYYMNRFLOMQlUdGhaIX1EKs0T8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnXVY3HcwGpUxkJvjZX/ZkHEaKrb9KATT2H5GHMRHibvtPyt3FsEafDi5b8Ht5zWRhyJdu8SFd4bCw/Q5+ItaptEJfSZs9TJWH3fKX15YoizNdxQsT2FwcAc+nmaKCUtIOfCb6koEorVd8QWmNYsdepTPHKx6BaOg4zoP6nFDhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pe3zE9vM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCGaVX004334
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o36MmkVKK8n8t/NEFQfn2PX3WeZ8yojvxiHzllPypds=; b=Pe3zE9vMJbgJ8yex
	1RR071wmOaPsVPWxsBATSJL46okgYVo1aeK6Jy50gMzwGYejmMqVBK0WsxG6X8c4
	pFPvl2HqH/UEbev8lECbev0J4OEnJf/V2Itq1P53Qwp3WdwoF4OJIO99cljvk89Q
	A//Cbo3GgsURIt8BwK9/6l65C4e7kBetgFnVnAmWtSe8wGLkCW5+hveFcBupQXYh
	ey3dFKUiq+Ami+Yi608HZ8vwFkwcT2uJv/g9LiCVnCLUmaEePMRlQANbVMUbxE0+
	snLIA/SG7CJV8wT48cWPmJtja8TXEwe0os4yKcFLMgHE3laGGvAETSrlb3OFfwds
	u1N1sg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3uy1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:30:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d21080c26fso142136785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 05:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768227; x=1751373027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o36MmkVKK8n8t/NEFQfn2PX3WeZ8yojvxiHzllPypds=;
        b=JY8y3oS2iBA+eY3OU4Khe8bbs/htjt3kmwUWgil5yFhnyWosW7OkDm7OqoVVS7W672
         /v++nvkzmx1lvOB/4FSfrpsHx13zzShdXQzHw1lTe8S6ReV/tWtUaNWI37cQ/L90RpP3
         4S31n+DqrRmiJlxUR0mXVID7OF1o3mernI7I4hYu/Y05cJj1CCz95QZPeB8kU509Ov1e
         MJ2SjoV46y71NhVPZnVGJgIzVm5MF3J39Cy5r7PCwdx4oM/pKKk24+9mwHF2IaO+b9ui
         zrsfbx1AjyZG0J0qEOjWxFLKgW5QRYU7bLYCf5m6maELzQXAj0sQJXerXEuk0pPdd3cd
         dPrw==
X-Gm-Message-State: AOJu0Yxqfj0xTTLHGb2l6I7WAV3bugPEQUF93aq3HQRs1M1RCaVf0A+X
	xS8YyihUvxoNAvx9IhLi/NSEeiR1t3LucniOIg2ctQj/AOnmw3ak+pi4OCbfT2vgDP4qY2RgwcF
	459RUTxdwvTpGav2QUTvDwe/k1nkT/3C7Ebg0QY3FHEiRZ3UhMhzQvgb4BgBYqclCexj4
X-Gm-Gg: ASbGnctprWmXExKRuPIf7j26lWitju+DIOLXrLMdIjpyLQQBrztpP2zdd4qjB0++eec
	XAvhSgbzEkqG5Uc5FgbcGmw273uxcJCvyNgIVzPaeJhNAfrYIreZfZtMamgzKFKkZwV3Gm+QNMJ
	7h8SIDYLpR7XxZJHku6Mpa44QRe371DPA6CZB4WbjbxcCNwBwbiQZSphShjjWgbFxdvQ2bmcj1Y
	MnYgOyjyzimmyZukfGFT+FLiluTb+Hda48XyBuF42aMgOquIGdkn9uuPjTb+xwNxcovY9YlZt00
	2KjmJ3iQXaDNZB/RVHDLnnVbuwccbSTNF0VdBbNb5bvxgx7udeD+sXaWVoBq7OGFmWh3H0+yfdw
	OeoU=
X-Received: by 2002:a05:620a:2903:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3f98234f9mr843647385a.0.1750768227448;
        Tue, 24 Jun 2025 05:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJpYE0/DUFqd1ePpeiVHIpeqkBy3Rf7f7lqO4eXnZNh5L7fNWwe1Er9MbGPKljDCw7XvPFOg==
X-Received: by 2002:a05:620a:2903:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3f98234f9mr843644185a.0.1750768226844;
        Tue, 24 Jun 2025 05:30:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b719fsm862758866b.128.2025.06.24.05.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:30:26 -0700 (PDT)
Message-ID: <4f026872-f600-4940-a6a0-ccb0b677be5b@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:30:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Anthony Ruhier <aruhier@mailbox.org>
References: <20250624-slim7x-bt-v3-1-7ada18058419@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-slim7x-bt-v3-1-7ada18058419@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfXyl+AVExnawW+
 UHtEjuvUIi6tU16iEZC3T4p1nJbN0e9vBDqaAz2lXy6LcvAEJH1ufCiOar/tsok4z1VYYpy61uJ
 xm6QlmyDzAz6DYiU7MDhTksycs4oepJZvqdwTDBEjJvEWtWVBcrHGCpleSFdGRvE/44TdUKRC/Z
 vZQC0DmudEz8APggcCjfA4DPH5uQmxbZFlFmzYIw5a8awhiIlcYRcHUD3b+nbb+9FBRMwJwEVEe
 7GvBpxPANbKf2b4BbvBo0uzMvi94P91mKYktrGVmjasuNNkDvrpSLZYUNB/zgfnlVnO2qmvhZ56
 kytubHwudd5ZS/4s9Kgz/6UM72VziLo37W1YpUCQy9h1kz5KdEYEwb3rc7k/yvmglmOMt8S749H
 gF4XYMoRos7kIYdSfu6LohX6nSWFLIRXfbZEMW8UeHX/5eUmFlrfQwEEVFaRb3SVqUBZDchc
X-Proofpoint-ORIG-GUID: 6EYMj8Nzxws3PdwY5W3vNTDuMM8Zcbmc
X-Proofpoint-GUID: 6EYMj8Nzxws3PdwY5W3vNTDuMM8Zcbmc
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685a9a64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=b3CbU_ItAAAA:8
 a=EUspDBNiAAAA:8 a=XJvFTVVEtqmPlk0kGFkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=922 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240105

On 6/24/25 8:46 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> To enable Bluetooth pwrseq appears to be required for the WCN7850.
> Add the nodes from QCP, add the TODO hint for vreg_wcn_0p95 and
> vreg_wcn_1p9
> Add uart14 for the BT interface.
> 
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

