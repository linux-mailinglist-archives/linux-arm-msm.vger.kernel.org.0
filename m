Return-Path: <linux-arm-msm+bounces-75667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E695BAFE81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94C461941894
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284972D9EEC;
	Wed,  1 Oct 2025 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr1g3ir5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB32882D0
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759311832; cv=none; b=nRQ7S/uoZx+0a4BEHJOnTf/GTvIFNirA8Eb7WO9Z8WSmmOoOP9fF4LjUDL6m1IQce1zY+qP0cefB98yGyWJDPmmCxikh3BKsFhWw6oTVl7GU/HzfJ5mFci0ZHKBH01CVqQa4vS7JUT9YN8RRiDYbM1Og6FPwsdhW58U522Yf71Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759311832; c=relaxed/simple;
	bh=tHn3o3WJq/LqaWYy+jXpfPTAUaaZDDHkkIq1jK99V5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TA/s0DlGYGBf3Rqo4KQ12l76men36F3YdxQNcrO/IB0DqMag+NLBV+w6OGTywsg7u17TPGOOD+Q+bajOkcZH4B4TlWRw7GYNtTk38+DLT5bnEdPsNlmWx1263L1J2txwpX25ziNU7EWgLpEk7QBjSqVqGASJGpqXAoGnxWdfZWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cr1g3ir5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919CcoS024104
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=; b=cr1g3ir5UkiwEBvm
	MF19xEjjZNFLpWiia40lSVhQJTEc/LnUBzjVmNmES0Org2hH21Pcot5oQIn6Z9mQ
	RuNTu13ANd3FIpC2NErDG1DK+9d9ibnw7f0Bl8ZWKLUSk283Iz/GNwl29XmC/Xd3
	wPBG5gr7LbO9RTs/8SsFC2oDoH/nCu/Z6X2JgH3LVnAiHe195pbrv7VG34rC1Q3s
	iY53lsuoBS7eNdx8HgMUZOlAXd3NoIYOi1+vQSdAX0YORyd3RaluYOTBye6Z1hCh
	QDcFDYCttVQERidFCO/7vyP/rwp9yghkSyLmxDUs/mgBy0iWRsn46dwQYc8TxzZr
	xX+HPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n4f3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:43:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8703ba5a635so50072485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311829; x=1759916629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=;
        b=lz3NavC1Ubrr90XEn1hdDlZ6aFFxenS8J8U3PZ1n/8MdNX98GpfDmgg5uuwSvkCAQ2
         tTFGoeoJzqJLD0ASDdIErP+/unMsLQy4HW4eo5Gas5wcRiqysxyN4tP3DZn0Ev947f5u
         c2dop1Ddi1Ebc9tvO21QIC71h0xj1DA3A4rGshVS8Eiac6JAh1Tn8DNBE4/sx2ii6tBr
         eC00yZrOwHoejCg188i0IMYmuwfiEQ2Ngv4CXfSZY/s2CZaLgFleN+02jijE+89zkkyS
         EsNkjq6bJ+DN5yP3JfvnFX52G/+hZgt9tfmQhXYXPS5qwlOOwlotenjihZITcq7A5h+x
         gIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXneavYUsytAfa05foNlrSrmSITU8uV1aYpEl8uMHYRGSYO4B4Bx6trjuApVmIxvwvG0bnAgCOZeRwhSQGK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyibm8m9S6GhT1CTJe6svjxw2SiZcQPZfkh2pRwgt3j93CRScHz
	e2Uuth8U8adnLqDmWp/Jy/Vr5VuVObu8mkGxpmdJ0LgKpECPBasFtBj3VvYLwd2s945nAMvtRb8
	HC8HHYlHsxocMcVm++ocMbeDhctbaCII7Zaf1TGc2Vvky2+3MQsUMzOYo/2zZvJgka4LJ
X-Gm-Gg: ASbGncuTkjiYr4LL3EqSGWh/OjgAifc9cwA2ElLFj02zM5rVKIcE4YGpAW3tcCPr9bX
	EGxq+isH6HDY5u4OaY6C4HEdwRFQzmrpMqNYCYriF+tD2mINfn23Z3w/LQZ/8KK8DdxsaUUNesm
	iVPfW3YEcXpKFGY7/38H11NC6h/7pZ4DrEoI44JSBQ5bMl0jh5rHl/vcJZWiXVCP32FmlPbMYgu
	pSHZSqNDwb2ALCI04QJXhXbrVsK3DxlGkLTZCbvhkvg7VbsiSm/TlFiCTDwLZOLA/e3mdq6FuLT
	hEKV8LZYy0CKJQOLjFVHNYlAnUb8ybIVyM7o8G9Tr2o77WTuVCbF4uI2zbuRXleezJQQlpuH2PQ
	mkKpA7iOvPUL0w5T1OQ0HmNZD8EU=
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id af79cd13be357-873765c02d2mr274223185a.13.1759311828611;
        Wed, 01 Oct 2025 02:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQhu+9IequlFgOauptmEqJZoeziWIrkfkjGafmFpxFA4oL+2QREZWtpjKdLAbnfpl7vBk6qQ==
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id af79cd13be357-873765c02d2mr274218385a.13.1759311827918;
        Wed, 01 Oct 2025 02:43:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3e60de51c5sm648473466b.15.2025.10.01.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:43:47 -0700 (PDT)
Message-ID: <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:43:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -d9OdMH-_zXHHapsSIMQgYG7orPcCuuI
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dcf7d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=ANimo7j06tBtS7Sznz4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -d9OdMH-_zXHHapsSIMQgYG7orPcCuuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX1TxGiVWSyTQi
 T+X8a5ujdZCQvBwjJ5Gv70vToX8ga+ZAkFy0LWgnzCf1M4/UkcBTcv+Cq2q3kKf4wqE14xdJ3wW
 QxDqX3zL4AXY2iIJYMgOA7DRV5KB3pAVddm/QKPtN+NFLyGJB5vXa0dodRaxmubr3I41e9GLkjG
 qABdLTctCmSN6iGoe0MhmYHkUd2qEwmpynKl91TbXiw7dldNZ9N+PJuOZMKXcMnChiIhBLegmOG
 hHqVkHW/ySonK4DjavNYxbP2bdY6nEy5y6aHoxzhB+awdZHVluiYoV6Q4B3ON8zfjiX18a5Pg4i
 mDV/524QPHd6eSRb42GGWbUjmTvgNJ6/vinj2p1qpSYv7jTB9CJxOhZOW+w+Q+5EPsd81P//bYJ
 873sRWkTt6XJr4Q7PcIzYFWDrhanjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> This change enables display1 clock controller.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> index c69aa2f41ce2..d4436bc473ba 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>>  	};
>>  };
>>  
>> +&dispcc1 {
>> +	status = "okay";
> 
> I think this one should be enabled by default. Unless Konrad or Bjorn
> disagrees, please fix lemans.dtsi.

Of course there is no reason for clock controllers to be disabled

Konrad

