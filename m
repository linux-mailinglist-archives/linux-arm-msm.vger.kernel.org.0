Return-Path: <linux-arm-msm+bounces-108924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BJ7D2yeDmq5AgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2359F420
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B2123052714
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F8B3911D6;
	Thu, 21 May 2026 05:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckzqee7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZEpjkxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88E936E48C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342954; cv=none; b=oZtHQ2dqlOTc0I9NITQPAdGKJcJtc9JYJxTDr/pc4Ke34aXsHj3A9/BByxTtpytQwxF3/nIHdMYMhNoFM7XZk8R1Y7O2orB72JSrqvfk8yeVDai8Sx2mqoYupoZUvkcqyb4hbT6FTrXVIuLMSdbyoixI9LfLxKNWWg51megUej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342954; c=relaxed/simple;
	bh=F7VqFNmZGbADQDE8OiZtq4IHfudgK7KwtlqE4HaJ6zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIfhmUhrInEiA3ycXAgRaUHHOe75V1UMykH3U4FoZCPh5e8DBWXNcm2qyW0tznzRBD89vACzc7Xw2PFhfovlaMbIrleh7ebKaOBhmsKDPWDObQWTwAiuiBa7XJZQ257q4hq4R+FwPKAZWgTUWYc8itNKjzfGTAcjzLXpokp+Iic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckzqee7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZEpjkxt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KMFu1v1798416
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bB29QB4y1Hf+TL1lvG+ncW8LElTa5mItRg7WxbcXeLY=; b=ckzqee7/9qSCrBMj
	keOMfh7G7p2KguQL7LMcbKM3GSnqP1uRbmfzSNQIkTvOv1xjgYrpNq84XSPkrYW9
	JXf17cN1ReHWSiGED8opxx6oStfDaNU/JnB47odu8D2buBV2H/lYD30cE/eVz8wP
	VOP68A/7doxJxIGlACVv26Wll9iF881Tnc1o6+cLNpJRKHicmWblC8cwsiusMTy2
	wKldKMBkjE64LLf2MdEqpz9hCKPcMKZ1+S8TtAj54NE+z5GLiKbCf5bjapA/fyAS
	/9ljXFyxIFH2q/3FuWtxMvWErqrETwAbU1LKvFqWiMSyY0lwTdj7ck20NdQgT4q4
	gvdBHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu3ch9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:55:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so133650705ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342951; x=1779947751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bB29QB4y1Hf+TL1lvG+ncW8LElTa5mItRg7WxbcXeLY=;
        b=aZEpjkxtW3VJlmiu2mlaKxXycoU6OfLpNCjqfqpRM2JznktNzUC0wbKUI32OMgm//H
         zWU7A741K2pINgNNT9NmvYkTEM4R7EjQji8McKPq7sWTQqhZEah73bKFZBPtyH8D2ooc
         JmBsDHKr6hMACpPAx5RgayebwNEGQ10kMaTkIpnDJY9ql1CdaYGSEbo1Qan1HcVHWkRT
         WJXjfJarT7alyDuuRODeCRenAivgKJ8EtzgOE5/2YsB1866CTRZdbi8uwifD77RAxjzv
         JHaMY4FhDItNG+X5NHDzb151tUuCAPnXZSgjjEpoGssoMWJ7CT8eEjxIoUoNN2gobrIK
         lLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342951; x=1779947751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB29QB4y1Hf+TL1lvG+ncW8LElTa5mItRg7WxbcXeLY=;
        b=rCUBGdQHlLm7X/70EZC1u8TJYOxX+xLV5FvPAjGYETx7c2+GpL4VKQdGLweVkmaSBv
         r9cpeKNTUmGf1BTiXLGKdMSCnq95G2Xu3NnjXcnlPV/NrLXWqmjESkeHD62ICDt0CqfX
         e0EA2Nzg6vetTZ3ixTz/tAXhWK3XLtX048ovzJ8L68h8A61w5VvAQ8KPETMjkuk6Be8s
         NemxwzGGci3BVp+EFNo4LjPXMio3Fms+qrakVgbSm7RvbWMiSFseEe1I0HqQnGg15fHh
         cqD1ZNRzFuYdU54UsSAwZ2dR4f9uejLXDCvtWY44oIaV/5OxeHJD4xZj2GwWXJP5YmZ2
         tyOg==
X-Forwarded-Encrypted: i=1; AFNElJ8AklljwTWFEPym1MwjXwDG88LdBiLD59958H8dgQ5Qc+syGkWI6iloEJ3OWn8O3uLS8Fn18rc32lKT6+Wb@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKsqq9a3JQguopdYneE64hwlhNoe+5LxXMJqATybskiMS3UKa
	8vVzAr/m5hpbe4kJ1nMpk3PswJN/6fD9wSOSZTIsNYhaU/8wBAmTzdUwN4gH/3bLr1QQ3IV/8qt
	ldklheiplE058h/Uh1Go4/Z6OaNLJzli+91aCiSLjyE31qQnmr1iwO7SnrBbvizoU/GSS
X-Gm-Gg: Acq92OEDtq0CQWUpuetDRUT0+5wqEMSi+6pMlp/0KQJMfvW87T705Aq3KaBKLMeooti
	bj2bcHsQv2k1OM4ZizqgOu2dwIQ8zbd34PNfhZxQkDYiYZOscWRM/HuKkKrxTOz7xGBlbXyqVbZ
	71ditMh7DbaVWNYezybfX+xJgQoIECGjcnj+0zCQEh176LUkb0bDaNXvUp87OfK2kiXMfyLLcXz
	+sZho5a4V5mJo2lZoBxnPJR8rr/0bQVw46QxCIEdRbzwg8Zz+u2SQxfjNH8kIzbyn3quQJ8T2h6
	T2KXWLl7uxBmLHIwquwzFlU5vld9t+TzboeVUcLzBj7UFGrtT31mXZJGTZewvTOTNclHM86SODY
	B/sgM6wdA5JB/wP2lpTcv5L8pPmvXVvPC9DI3aHH5GXmMGn00h3NqqvQJ/J4W
X-Received: by 2002:a17:903:98c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bea33315admr15185865ad.18.1779342951435;
        Wed, 20 May 2026 22:55:51 -0700 (PDT)
X-Received: by 2002:a17:903:98c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bea33315admr15185015ad.18.1779342950241;
        Wed, 20 May 2026 22:55:50 -0700 (PDT)
Received: from [10.92.215.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2cesm244847525ad.14.2026.05.20.22.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:55:49 -0700 (PDT)
Message-ID: <1de2e8a8-08ff-439a-a0a2-fc1387a7efd0@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:25:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
 <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
 <fmqsbwm6is5qzflvyt53ax3ls5vnxabb2fbl4bttbcxjnhnwwu@x2jso7rr743y>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <fmqsbwm6is5qzflvyt53ax3ls5vnxabb2fbl4bttbcxjnhnwwu@x2jso7rr743y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1NCBTYWx0ZWRfX4Ya2FnSeAfME
 4b1ETHKEq6Ng6WLc8eyhVkwu2BL0Nzu+rSeX+Gug6AE9qt1KtmsiK0o2HBS8Pl1z0VuIJPzEvff
 A1QLjCxMudUlDa/LYKxAOpBA6Vf2G3jW0GOh+EU+TklWmK3xkTUoU6RVjjQtQnLCMYGo+QL9Dmt
 esJNNqp9N2XPGwma2WENjevWYq5y295rHpeMkMRD0IV94Z2UB6MOlx398oHUtLh11WlI9jJKAG3
 cmg4DUrTu4ZQ334geEeUMEP9rLbXrvOQXUAgONQBB8KbXTS4alD7OLHJJTpoy/LQcaqRKVSXMSw
 pd9peTpfhtTounz7YtafRp5WeERdg5gDH+kUTFa6gk01gxWyFaHRW8ZJaja2krF/px1R6h4Llsa
 iGduBiOVmN7INe6s5jcYdJkqcZWDBljs1SlM3mwAqXSgX5Ny6I/w9VC41KVUx9xt+hGfBuXsJlr
 FIypmTwf0tdHIbUcrRw==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0e9e68 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Flm-1UoPJwoPlLdpieMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9KG41vwksh6H_g29voeuOkw2i3A1GEvo
X-Proofpoint-ORIG-GUID: 9KG41vwksh6H_g29voeuOkw2i3A1GEvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-108924-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2E2359F420
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20-05-2026 06:11 pm, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 10:58:04PM +0530, Imran Shaik wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Hence,
>> add shikra_epss_soc_data that reuses EPSS configuration with appropriate
>> LUT entries limit.
> 
> What is the drawback of not using the exact limit for the LUT table?
> 

Without the exact limit check, when all 12 entries are populated, the 
existing repetitive-entry check may read beyond valid entries and expose 
incorrect frequencies.

I will update these details in the commit text in the next series.

Thanks,
Imran

