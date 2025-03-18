Return-Path: <linux-arm-msm+bounces-51744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4B3A67693
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C791189CB3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDE020DD7B;
	Tue, 18 Mar 2025 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EanalfZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3942720E6E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308662; cv=none; b=Anf4M9cFfbYOTM8JQR1pjA3OCOhUeoPB+Y4qxAwfkzJEdQYYYWQb4k7XaGeKLuEIn0Y11PTacW/T9kNXStiUF9YnvQjoaLa3lhNGohCR1NozU9ociWVhGnvurqPlz4cEt7YAtIn1wtZ7bdeyDI4YyeVxe58uMO4lip/6s8P5cJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308662; c=relaxed/simple;
	bh=f3Kb0SD/j7LqGiB2vTof45eXZq5wClA3mytGUkUMKiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHCPaSw8il0U+v/dBMGTnF1hipkKkprRLantafF3ZMsSCnx5dGBaThR3brj57sXDo5Z2tvrOhX4f84Yxs3YDiD82fdCjRGuWBoJX/xJf+r3djMqFmWofmtYIU91YqteGYvlRVrFZVJ1zfG73np0rrbBHWNYlUCWH5yXp96skqEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EanalfZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IB2geK011301
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCKrDwqSKjmhyeKOOoVxGn0RwDBU8qLuV9+cCH02kvY=; b=EanalfZEWaMlnULA
	X8r69MwvC9mgLnXuhFIFkf4iM/aiYcUUwNzpWLcGrX//s+p+Z0Flxkm5qxf7711Q
	wMVe5Oh1j3toGMyCZtQeCTnv18Wc+cEbGSNg3w6nsOf3vMVef4UOPJPxqUlE+R+c
	RcpXLTo1GitpFF6ia9HNv+yxGd+okp5OL6zP2oYBSEA67X3m1F4rMIf3iMW2XFbM
	PbNPFqYuuN53AslI+4bPbaXr4thslRD/1lAJ4Oxm5PwyhoOuOuHoHvBYx363ZdqE
	HOIw2G71NnEFwyNybVMzewUP4Oq+iJY+pMpPP6Ls8Hq/H6jrsHW82GVjl439bqhn
	FylJ3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx326xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:37:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4766654b0c3so9615171cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308655; x=1742913455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCKrDwqSKjmhyeKOOoVxGn0RwDBU8qLuV9+cCH02kvY=;
        b=FJoxIHgfXsuL00yT0vcWAHhzZ3R0tSV2lNngCvYW2pMpyDlQcurJfp/rv8nQ170pJF
         ehEtnYFSySCXQ214GfLtPI8XsoCQi2KNO3HJN3ptHS0DJS6BMoGY2lPvO5w4isnrvKLu
         x2UFRhwI+y6/8977c/tAtsX+RhAdYoFGsD6jYiLnpr+tdd1xJITG8+JoTSjm3zZcvUHI
         S98KZ+K/7naxheL2W/gmnhLky05eJthkv+KtORsl9shqjlRA6Go8+MxjLg8+rW1hrBQ5
         WYiyxfNcuzg8KEJImASJZotewUcbzsGhExZ2R3aC31jQIvytI1VvvgdSAIpRKBPeW1/O
         7ODw==
X-Gm-Message-State: AOJu0Yw2AwjTxgGMXxINmnYWyAN/Hx+bPT9Ouzrgb9z175f2yln1+zqV
	Clfk7TZ/RP5RCO7eJexyk684nt4wKwyTmr9WYq4u9Kjn59cSb5t7oLTMBl3BgeLYCBU0lNvNs2q
	BjWsX3YV7mMpwHwjqUGO1vDrKvg1mdCa8eacsk0Qxrb2SMaommwR+YuxYYOT/Gt64
X-Gm-Gg: ASbGnct997AAXRH6bTdhhqKFJZf1ol68+c0pTWdK0ZoicPXEawR0qtXQ2PNgp2Ek0XM
	W6//XCcjW+KLEQU8Hi4V53xir/yB6sVfOgfG7YRNxOhEga4YyMOMg936G4em3ZOm6+1FmaN1tnC
	oLGdJyN0z76J8REQdBsjWDyMAPA98HtvitxwjKlxzPF34YH6fiRUx/r4k2QWE7AcoQLtKlSnKVL
	1P+p3NjswfkBEeyJEm/NAybhIufSj2czi086ZGGOduJ6ixbH2omDchxVHEyZ83ji8iguh6ytjtj
	Gr+UbPrAGp41xL1YvBibxr1mLxAMS9TE+HXZ4Q8ces3kekat/TSqr8MF57nx1WWIy5ifgw==
X-Received: by 2002:ac8:5a4d:0:b0:474:ee9d:43db with SMTP id d75a77b69052e-476c8195536mr91629631cf.11.1742308655036;
        Tue, 18 Mar 2025 07:37:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9XlW3vxIbChrkNlEMFD1fJVPzEE60tzANRziluVDqnNCVbhsb/A1XFOWf+p/vkEK/1xCqJw==
X-Received: by 2002:ac8:5a4d:0:b0:474:ee9d:43db with SMTP id d75a77b69052e-476c8195536mr91629481cf.11.1742308654623;
        Tue, 18 Mar 2025 07:37:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeb2fsm876771466b.15.2025.03.18.07.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:37:34 -0700 (PDT)
Message-ID: <61ed7f53-e7af-43ab-bd92-15317b94b617@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:37:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-7-bcedd1406790@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-7-bcedd1406790@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d98530 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=RnBFEU2T-AcrtaIZjsEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: cjDDrl0V85uVMVu7STD6f9wIGT7CE-M4
X-Proofpoint-GUID: cjDDrl0V85uVMVu7STD6f9wIGT7CE-M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=624 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180108

On 3/18/25 2:22 PM, Dmitry Baryshkov wrote:
> Follow up the expected way of describing the SFPB hwspinlock and merge
> hwspinlock node into corresponding syscon node, fixing several dt-schema
> warnings.
> 
> Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

