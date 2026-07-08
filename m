Return-Path: <linux-arm-msm+bounces-117586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gp1PA0Q0Tmr4HAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD1724F86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:28:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Oa6LuAmU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b2YitDI7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117586-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117586-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3CA73053FD3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C5243B6CE;
	Wed,  8 Jul 2026 11:18:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBFA437873
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:18:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509485; cv=none; b=aCSk5GygdGIM1ftt3e9skKmqJsoDZNcqNCH2TSdq1tjAnNEDBwjASICbLT5f1EmgiI6N0lFH2sDV61MocCmSJ00/sX01PTRggiWvT2nfx3SGewx+41iNrSSC2iJYGjfPjdO+hZxY6mx6HFOHdfkiNwwaiY4tjg94//BzJf4XRCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509485; c=relaxed/simple;
	bh=VSqoLTkrdsdlpLEX58B2cgHXvT+EULR7iyBVMlx56JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQlkEKalfSlLqN/EhkMvNOM/Dh1iadLzqKQ6Ix5BLflQVdZrHoKwyg1nwHj4/5dUnxkG+egzqMs9wu1qgMc1sqFdGGq/6KIs2xR3d1h0MI5pqra8kTRTDhaL/F1m8YYqXDiQjD97DwC9voYw7rmr80YgSJceMGwAfsbfNKQh9LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oa6LuAmU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2YitDI7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668896Ji2258477
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=; b=Oa6LuAmUQsC6WFEB
	RfLonfZyVZFtWtHoQE0KeS6ThFp5BpyhHzpQ366ygWM8wHC3zymwH82hGApdMvxs
	RK4nbPkgiy3Qy8o7qKp+fkG3bn5ZfRzRPfl/27moFOc3Sg0hoRY42A1YEBcbOdMV
	QDzYvsithFGWXhYZ0CV3Xlh/9bYR6qnAu/Nt0rrnwUV9XFS7PLPupqnqSVG/bhtC
	xNktRxkdyWSPsMyQIMQFCvrJ0IZf9j89NFWX+TkjVo0tfO0S4MAawlpq1I0tCkP4
	8FKuKNNbrdcEUIt8s9shnfElyrV55lN6eBuSVnWd9hybqE4MLHWPEEOAHHR9Sv5U
	cMvVzw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cswa462-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:18:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso1131957a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509480; x=1784114280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=;
        b=b2YitDI7eJhpqOQOZc9b+XqPJU7pksi5UowOXyGaxeaAKIOqz1eiZBj+ykf/DxPJNj
         fJPc9cdanapA+/yVVAezNy0kh+G0tEoq1x7If8vz+oIYVcecoHJs6vJ/X7XsE+/vIZL5
         mI/7wClgbH+4wqi4DqpCxLwWoZgWuvLJJrOdsRxsqvxPrns7Yj/C3C8+VGHKsyY4BsYU
         1PV1+Vo7lwE2oWeoVcurtmIAyaNnllSudU9beTCZdyiZlUpv6mPKbbQYgmyO+FyRr/We
         9yinmLfkIHqRg5HJlzHdn1nQE9TdeVUR5oZrcZlC80T93R3INcsSeA/68wifduXnFxrb
         EfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509480; x=1784114280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=;
        b=eEHshy3E2V9BDzcG26v/USryJCIhROzzsovDifnE8bFzqdkZDDyfxBTg6OuYSTJ1n8
         /NS9xttq/ARMztvmiQ2GslmYrNYbb0FzgDgMkvUx+H7Gd76bGHAt0MmLQzYETPM3drYh
         XzL2W+gwH+X99Dkew7Jv8knhSTSyAuWMDiOLhik0Gv+fESgVBJ8gpkthqsxDo5LFNgxf
         mAOvkN9JoUt1EPAPytjj7SezPKwDpy4K2SLV0J7oUz8/YaQ4dc4cqoqie0Mp/mYW5ECT
         ky/UTzHQZD6A7TYyldKBzaZBffKzyMIi7/xgY7WTwYMvqdKRZ7hsYnzmOGjUhviSNsBK
         YDbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq187fhiWItcsdYZi3+LUVhMJoc7x2IwCAmTZiPWL29eU3ekkZzP2pNoMQyn3PTzTY7KLPKvhyqDnMtvG1Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxAzYEe3EIo26mBW3VklaxBxFlLoaykWZzywyGsC74MZoRYoUnx
	FbuJ9x752nQCYNGmDdbPFhfbluP8rakmbeqCPbMpkweTXjiGTCMeNqtjEVTD8MHblmgspaM67EG
	rhjrbB22GXPc/HumEKxYFNwXdbTAI8D8p/RV3ErRwR1TWFhaj99rSQixT4CHS0ArwQ9Je
X-Gm-Gg: AfdE7cnac/WgBw36LNfoxxJhUugXAdhXo1MNIYZ6HAojHV81ZwNMnghkJpfchYrPe9l
	ywTnhN+jWmokyIzL8qjRwvGsG5rTm9vkQGXEtEaqqNiT8/lpzEDRxR5zxV1yE9SXRLm4Z6W9cyk
	1thaIu/BPblWvV31AwGendRt5tuMzyUKjy6CjROBSmcXkQBnzYq9Rpwtdw+oW/M3RAq2ys36tUP
	/8rd8EhLx4ya8VCfExddEAM3jEAb4IYLpbkAc1pTwP/5NZx/AiCVx07LutSWADvqUDYoU9E/V1h
	mTALsXicppvHj/JRygDNgYZpaT4x1S+3QMBr0s12bxztjvGZlLU6B5WvpHSgjjcRQFcjLLk+k1p
	4HYbX9SEHv8U+3dX1sjb0pGc1av9VLV3iPm58TKI=
X-Received: by 2002:a17:90b:3e46:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-3894279a828mr2030941a91.40.1783509480469;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3e46:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-3894279a828mr2030902a91.40.1783509480045;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d12fccb2sm2576438a91.4.2026.07.08.04.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:17:59 -0700 (PDT)
Message-ID: <07cb0617-efcc-4828-a590-407e4d3702bf@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:47:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
 <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Po7V8rhrYJDQZ6J9i7qRp6yKlrW4WBt-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXwY7Gw9/uHgqS
 Vgu8Nw2p82+s6WKzk+Tbccanh948bfHLCCdYvTuzCjtFKBVvVFngIR8Mw+NeCwoEGx3VPaG5xt2
 2JfxrBcPft52q+QPxpSSG5f3lxIlrDs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX1Mn5oWoOFB/T
 PFShrEo4AoQO9X/iq0J7VU11JiybuRv7sKaQo1LpsUr1MNIrVJ23kCdDiY/OEbkAtWfIapiE3X7
 57AV36PZ5axzOlEYd4SO+h4vqdQZu3mxSiN4BTJA008sa7fohjI5RYFl/xWo3lTwWn0KPBV3Xmg
 oYZdLuqwwYuZcB2j5tYLlYTq8xpRffvxhAcPL3ZnoiVCjLxcVypXlEbyFU2vHSNl6XH69Qo8Fuj
 M15G99yqKeLd6NXtPHd2MKCIMj6HdI9AVGr6/+Ve3rSjX2+byFHEntuva465UjPTwd6qGGx5D2A
 lpWlQc4YWYdr0s1YCR8Gtf+EdbdcFZUzYRL7HkoMUn1MSfGTRxJ6Uzi8fIYGCt1JZ7cg1/TecQY
 JjekjxqyFChm5nKBWUn4wVsU9VfjHQ+8XwuvRV5vs9Ab9ARRRPnXwMZlBELIBPEK3p7Ky9IVFCO
 AhRSrc/6DfVexQsXIyg==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e31e9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hnoEmpZtci1S8sv95UQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Po7V8rhrYJDQZ6J9i7qRp6yKlrW4WBt-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117586-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFDD1724F86



On 03-07-2026 12:43 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
>> the critical clocks handling and PLL configurations from probe to the
>> driver_data to align with the latest convention.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>>   	.config = &disp_cc_qcm2290_regmap_config,
>>   	.clks = disp_cc_qcm2290_clocks,
>> @@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>>   	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
>>   	.resets = disp_cc_qcm2290_resets,
>>   	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
>> +	.driver_data = &disp_cc_qcm2290_driver_data,
>>   };
> 
> Now that this clock controller takes a power domain, this needs use_rpm
> = true, or there will be a permanent 'enable' vote
> 

Sure, will add use_rpm = true as a separate patch in next series.

Thanks,
Imran

