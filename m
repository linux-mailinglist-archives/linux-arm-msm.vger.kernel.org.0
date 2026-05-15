Return-Path: <linux-arm-msm+bounces-107825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENGtFjIEB2okqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA31154E816
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA15230C8153
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FD73C4B9B;
	Fri, 15 May 2026 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpnwlsBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dISYFOna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546C386C28
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842884; cv=none; b=V9ZdJ6U01iCyDzcnyRpg8SAUr06XnHywxsheHQkdHicsJ4weO7FIgpswfjn/AYSoDa3NcIvO3LNMDqPmhdl6/O5p2xPATrqj7jQhV2iSx8sJDb3Ch1p76bBQ220tY5v2jwqFP00W3Rx6SMa/VTRvc6o+RtXQiffVzGZRCMi/WVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842884; c=relaxed/simple;
	bh=8LNM8bxfvLzgNukQvPUbSNf5aqd9048QCCXgSYVLbks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsl01bBOWC7vJJ3oyFOYeInSVrqmjfcPTqIOpHLCMWQPR/h7K41UqtYzR6MV5gpBpvMVJY6uKYMqLP+CKTsShrHX0WOU0EpkTga1juinc9GOZ1bndt9oexDSArXlcBCxIJ7VAXQT9L13WmVu+qnHf9wyh8a/ikYp3dDKGNzNDSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpnwlsBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dISYFOna; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5TMQD3200288
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXp7bDYjaL9ZxRokeUkbYdn60HhVaLGWRSrmxm4jD1A=; b=gpnwlsBZK6D7r06n
	coWh0zTuEFlOhB68uBoTydxkZkU1i69N28nqlg1IlKzbHAgaIZLOj6t93x0D7e54
	YwZ5kYGGqhRsR8vbMedO4K1xMG6TFhNEwZ2JxxBTJPe7XjwgKXEezkDowsIf/MDQ
	TyujVfEjUuaeZrB+Wd2FveWFs13xgtRR3JvlWK/TthJ5sShoESBlZDkg9Fd2vdpS
	EuRsgzoeC0+CQWXfrHb/SiO8i6Y8x4pPxgJM8+wfj3QHebyK1ksZpoo7ZYQOT6TX
	rLmMhKrVLxX7Blr3SVhgxSbx/HCCPFBE+HVFMgb9GDHNpOcAvyEWb3CnyhM2Ybe5
	bt8W4g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtw8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:01:22 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e06cbc08d6so23726814a34.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842881; x=1779447681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXp7bDYjaL9ZxRokeUkbYdn60HhVaLGWRSrmxm4jD1A=;
        b=dISYFOnaKgM7TfB/X14gtjlVRq4jvdrcuhV6fsjxRcbfZJwFgg+U5WHU0mdJh8fQ9H
         4Ko6VQL6Zmwy4O95XnwJ9/N5NXge1yeL+wQRNteQBoQwvv3x9EVEg2YswGU+D/8ObRLb
         5+wFGjelDhX7gS7+ojlRDSwLl0cXfEX4ei40LjYini2m5FQdSXhtBC9O6idZ44bYilfd
         IePL7fAJCoVqHylwW39+dX15h/Ss5+AaUkCiNuXqRFrSVbqnqHpz+kcVfKVno8+zSUbk
         z4xnu22OiRflmxABGodRsFHFmzath6jQOYvAazBP0kNXSSVULDfcDSUP++I3D77lnpGN
         F48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842881; x=1779447681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXp7bDYjaL9ZxRokeUkbYdn60HhVaLGWRSrmxm4jD1A=;
        b=JOEDjLGEIwC6qbs+O7gMhZhBQPw6lbq/fGf8gftDXLdYcEkZuoaSyKzfd2AjU3znBt
         Xm08HH8qazhHwNKoPTfMWFgSnG2/pm/YqppwJFta0Ft1fOD+kumczYHHUZQ/UfAMOUDK
         ZdrkEdQcdZN+hUzTVXl9w1tLdCz3l7IlTQTnB4+5cC7cMw9yqh1GL6A1Lr2vT/diZB1t
         3Dx6MxSXxXRUEBrllNOzIIsCmKquyDpzsEy9L1p9yyBbIZ/TOpNNa90hzLHSvZ0LuNHy
         yHhmyc5usR45w3DtfasanRDC6WtHGGJWnni0yPslZK08IMi2b73o4jqc0yyLE0MOJBoG
         SYyA==
X-Forwarded-Encrypted: i=1; AFNElJ9rcQhNDM/zNFSknIMSXFy2j5evehmiX3CBf130xqn4rc9kEITSCfUvvl3Sh5RMaZ5J79F4219YO5c8EXdr@vger.kernel.org
X-Gm-Message-State: AOJu0YwpsQX6Nmegcz/kWztdwr2BuO7iD3COXib0r3YAatLlNnNycy06
	jYAjImSF9Fp9OZzT3nxIDhCg1j/wOpRUB9wZ7+dXsvIvbSNSd3Q/SZzUQhvC/qtYszEJlf0UppY
	73GkaK87dbTSIkIJ7I0SmHW7xZ2Q8CEIEMGMiFbPS3jAWRaVKdF5QoZOMhHR0ex9vSNao
X-Gm-Gg: Acq92OGimJKwPCmMzjF0l93ThIsWYFdRKDz64/sJX7PoNUYciNauaUFuZ2RYuAdPiXU
	A+X3jXJ/vKQUBZbB7P7M4eFapsDCI85R1OTgbXmNYpK8EFiipC0qYXpV4E/ausM6yMx4FEWrurU
	g46rBN7zL1Ba+cqghr3EdaJO9EdI0SSIRxDejlJ8Hs0VKUpIC2o9BiXJjgSpGbexWbih6KCDhQS
	pHJgEYBkDUJEehAtzRnGPgF/VIx0reFnLkDGRJZEYCwpkzMuadlPyL0meqMr8DM8V5j7zYuBoRy
	Vl9dBZcLj37g5UO85y/c5YM9LrWow3oNjtm+XIGLbNmynyr42p7a8YULRB2Njx+lx87cC6aYRp7
	302OMok5jwSA/yFLNWQLpiYMirX6yTyaIIyrrYAsz2urWIUZvQQKFijnJmsWKVAQ7H9EkcpmvoQ
	XymjWY7xrC4TxhP2RaQNlkoCc1Zqbi6+PKRUDW6J4fojERYcg2xZuj5boyosSvBLC50QARu6uQ2
	nw=
X-Received: by 2002:a05:6830:6f48:b0:7dc:e0d4:70c5 with SMTP id 46e09a7af769-7e4fa063f50mr2440042a34.25.1778842881534;
        Fri, 15 May 2026 04:01:21 -0700 (PDT)
X-Received: by 2002:a05:6830:6f48:b0:7dc:e0d4:70c5 with SMTP id 46e09a7af769-7e4fa063f50mr2439996a34.25.1778842881103;
        Fri, 15 May 2026 04:01:21 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c6:df5c:d8ed:c370:3eee:b864? (2001-14bb-c6-df5c-d8ed-c370-3eee-b864.rev.dnainternet.fi. [2001:14bb:c6:df5c:d8ed:c370:3eee:b864])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc4cdsm1268857e87.54.2026.05.15.04.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:01:19 -0700 (PDT)
Message-ID: <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:01:18 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06fd02 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0TwNQlvJbkE4K8wFdpQA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: YNr-_yu8wpAuCOjIvQiGvrgK56o0ZKD_
X-Proofpoint-ORIG-GUID: YNr-_yu8wpAuCOjIvQiGvrgK56o0ZKD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMSBTYWx0ZWRfX5ZLABkR0r3d2
 xpv8ive/GoACxv/XapfkcXwo8G4CN4k4iz9vwTh7nU4lKoQkZmu+t00B4/vdu5l2uNENlo3h5B4
 d08FijST0dmFpT4c5Im9ksqmgv70I1b/7aSeizCYkT86mh85znpSR1Bc/NhR4J/L0f5ZTs7mtZd
 3jfWyDWoVfHLRXuo6YZ7buJCFlOGBLPxGLyHUGXj3qiIUQ2uHd/GKPI+KaGh4pl3N6rFvrEYme6
 D0K+EvEE2pP0W+iggfBXTlb8EUnHyBrFyBjvw+brugTnJtezOw/GWras9S9JHxX7tZDhCPH6bU9
 ZeJHEBqwbFVWs/EWWHn2dNpH4OcM0TZTzNogU9K2JUdJR+TOu2Bd5pPDx0AWne5Grt2MQ4Hrpq8
 BWSomwMcTHx4v9grY6l6HGOmfifmocwE8cNqVUAjKeFylMCcAKuZqSZt5+F5J7T8kkXLWhX5hqO
 eV7furiSICR972a+wnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150111
X-Rspamd-Queue-Id: CA31154E816
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107825-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 15/05/2026 14:00, Konrad Dybcio wrote:
> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>> C630 isn't stable enough. For example it might reset if display device
>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>> value to make C630 work in stable way.
>>
>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>> index e41200839dbe..e6c67016552a 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>   	status = "okay";
>>   };
>>   
>> +&cluster_sleep_0 {
>> +	arm,psci-suspend-param = <0x41003244>;
>> +};
> 
> Is it better if you do hack in a
> 
> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");

Any clarification? Then I can try hacking it in.

> 
> somewhere?
> 
> Konrad
> 
> 
> 


-- 
With best wishes
Dmitry

