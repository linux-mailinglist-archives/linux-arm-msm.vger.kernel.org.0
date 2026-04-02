Return-Path: <linux-arm-msm+bounces-101508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHgDOhg7zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:47:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ABF387273
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C53CC3019CB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831993DD520;
	Thu,  2 Apr 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE26Iqor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQlIhVFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEC3A4528
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122906; cv=none; b=T2OuwZgTTf2+C2yiX9aIYeJYhRPzSGcosYEN14KGzGkAq6aBThndkTTrZ7Z/bx8sxDUxEMAnL/EafxQf1B4NHq0nYxLQPpB386GmheP+fqod8AqkrPRv2Q31eDlHd1VVIqPLvWWJNIiDhcKEY5H7eVCLSsQOdOABWIfc25rPAQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122906; c=relaxed/simple;
	bh=wqef/i8CLgqpwa1HZjZxRT8qtyeeU5odGIOCDmUuYas=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=dhzEhmgqQQA+RZwcQtzxq7MI8DQvaPA60a+gqzGxYy2rjob30DvWhKAOlWv+rqQ5ECLYRMmxGjQoBNq+88Km5PetI06tx7dXHS+RZjj/TE3MktjUkDvW352QGqIg6sa4HnHn8NtOnW8zWGlgQfiQx/Db0XkpDmEC83zgiTGiD1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CE26Iqor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQlIhVFA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327HGVd3044207
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owvrumwMjhMv7jodBlueriw46OQ1H7TaSQot+pwnzS0=; b=CE26IqorYCBNImxV
	b3izoa6DMmw/DRpubTdORsyHXM9bFv2x3kgdtdo1a246Nk8+SroTiM3zYWwiswo+
	J9/+Ym2w6+O4bfhb8Y+mMw5iWl7gH2o0R41juF0RqKlKQbxLDWHZmQOs/NNM3b6v
	n2VyEwCzQNLtBISo7WKexvK+Gw6TAGXKx45e0IkhNWbTfErmAX0rZPFyEe1GaDD6
	3wfxoyVXL3G+J6LfsE0ruZafK0QkI63ueBZiQ5jfbckuA724KLaRLoBLBqTizOS1
	SixMka/IRZq1WREc95u6pao8yoWYXKQq0leA4xCP1rW0Al3sU+rPWgU00YHpvEzm
	tXIAKA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v7db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:41:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b23af7d7e8so20128525ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122897; x=1775727697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owvrumwMjhMv7jodBlueriw46OQ1H7TaSQot+pwnzS0=;
        b=iQlIhVFAWhA6gi14iOhi44c6uW2evTKHLYxmQElAtLkUFx+a7Oyo8YonSmkKeNQudq
         AN5BKUQp+RcpwY9Hq5XwrLjPUciOohlQlJU9Bzg10hYW65nJJ78AF0lYp7Dpx1Xv+kSy
         lUR2kJfIhHswwok5f372vyrFvWXzt0EQt0bxnMoXYDAWiqLfuGCuEMOx+ySeNXzkyocd
         nXBpOqvlABchoJep73e78wEdRC2z+OHviEAs5IkSf63KXU1yTiB0/Zrmi4G3FR68otfj
         dAxLIhlyinX+vGDdzB2AWpwNeuKI62MIHk5UQbs+H9uLXB5ylfrjwRTQ99kr31Ter5Bb
         YPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122897; x=1775727697;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owvrumwMjhMv7jodBlueriw46OQ1H7TaSQot+pwnzS0=;
        b=qpIRA6hMaOTP9S2F8JHYbhuZchYxAkAOyw+p03YyQ+0+DGsHCQYAydmrSaWZZj+/eX
         UnML4jUCtvTq01PcivoefFxgzhwUHoy3PlMOoN0ehdr1qLnBft3J6+hzH4ZZ+CudpVl/
         UjpW5PKzKUG7V2vHR1rusyNrHPkXYeTc8z4tpwn/ORWET15hb/BxL1JrcUjMChO7tq8l
         MDK4WL6jLjLiTZ7hI9Dp9rBi8WN0fImLLXJ7EtU1rHTyMs3bVBDPaSU8ko4UoCw+TTEK
         /nOZ+6ihKdtVF9BW3KyLQiEXjH2dGt136/8z2eEg30YBnS29EoGdVNMQSrCRm5ykXfcM
         7bKw==
X-Forwarded-Encrypted: i=1; AJvYcCXYjtTnAXs/D6yRv0hf5G7BntKCwgzhJWQ5Nd0QayklU3jdZ5WVC9ZcUfx9sJ0nivie99/sP+B/07bz40eM@vger.kernel.org
X-Gm-Message-State: AOJu0YyncQl/GkMdmHjsKBudyvz4MfEbIUTF74bntfMtloVtOEL73EYd
	yjlqOoZNJs3r9JqRjHPcIXn/UawDOroA7RkcM7iSTB7d2Hh3NSsf/raNfuquydU4GnZpwav1iHc
	C7aroUXGRMAZTjcSFTpA6g78vhiVlG9WYCEFToPoU69slb9Y76I48d1v552tDr9SEoPO1
X-Gm-Gg: AeBDietm11xli2tJZYc8s/tF5R6NVjFR3yAaRcfNb7/UmHNGnVkSMETz4W+1y39oc2I
	XP0dHXpMon/MueSuq9Hj0FU91nfJoCnwcPWJ1kjmI2jSA0vQF8lK9p8XPehH6yo/kb9gtq2P8gl
	8/AXcDT1Z93HS76A0vk3zBLy8MapOh2F9x4SnzhZW2NYZkWhb4/m5933FTeeyIHCaYulArWpZGs
	q/MZqZ2VkirQTH6q/DKB7Su4BKvHA6MX+pYHZcpW3WyErUuJNn2ZkDmq6GF3ZHk37vXOuQ6U7jx
	mO2DWPHnEhOEMcBcLZWInkLhoz6M3xEZanX8rj7nKmtM9lu52u39CvVb/+O3Pch3D2NmPdGbxBq
	zWEIlIAiXlRz/ZMG7FoQ3zNyoiogpMOkRFSLPaVGcv2S49gwyYug1Q7FCcJIfD+vh4JGuWolejj
	iog38Y0FbkF9tF2Eg=
X-Received: by 2002:a17:902:cccd:b0:2b2:67cd:9963 with SMTP id d9443c01a7336-2b275d7c6e0mr27390245ad.38.1775122896803;
        Thu, 02 Apr 2026 02:41:36 -0700 (PDT)
X-Received: by 2002:a17:902:cccd:b0:2b2:67cd:9963 with SMTP id d9443c01a7336-2b275d7c6e0mr27389975ad.38.1775122896351;
        Thu, 02 Apr 2026 02:41:36 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm24051245ad.53.2026.04.02.02.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:41:35 -0700 (PDT)
Message-ID: <f47a910d-874a-4594-a40d-f27a7166c6fb@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 17:41:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb
 session slots
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
 <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
Content-Language: en-US
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce39d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CY3x0PKZXqireWAYPuEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NiBTYWx0ZWRfX3nmpU5ZczcI9
 GlRVjt15KO/oXnb0dvJT3e3CMa6EUJqOIG6SypEbUbZ+k2Ghrb0nrIS//T8xQHs3pyDvRSdeQwn
 YzP9a6XwhqTNiXFXwwapcfPmNUrYd3fbFopTK6/e4tdJ7SaYBaci805b8TnZ5jwIg7hOC/ds8w+
 97ivq6BdHQEd9UeSNJajPDbpTMAZpqeTKQ+dQM+cvR2GR+/4SyTGsupJtS6Vs5W+9mutjiOwCYa
 6zLxNgm7nJQKKyEMbdxlvPA8I6aBBeDGtOje2VAW+dx8NxAZiFAX378aNSgZTmVbn51VlVy+Oxp
 xwxBK5GL8qead+D/PLMeWtdR1c0bFeJ/FZOMyT7HTCvAnyJ1xfWrfI4xY/6OyV80dqfXQ/cOryW
 Z1eCGtjqYe9TZYNGEerQP1QFcRGPmV8gvloDQJY/yFWbLny/BkfFNkChXLKlVr08T+HrIuf2aRe
 M5XpQoy0enSoI7fxarw==
X-Proofpoint-ORIG-GUID: 26hz6NXvowdoI-ARh0dqyPJBXw2RqUn1
X-Proofpoint-GUID: 26hz6NXvowdoI-ARh0dqyPJBXw2RqUn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.5:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101508-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63ABF387273
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/1/2026 7:33 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 03:33:45PM +0800, Jianping Li wrote:
>> Some workloads on Kodiak can exhaust FastRPC sessions when multiple
>> compute clients open contexts concurrently, leading to -EBUSY failures.
>>
>> Describe the compute context bank with qcom,nsessions = <5> so the
>> driver can provision enough session slots for the compute-cb instance.
> This is a software property, so it probably should not have been added
> to the DT in the first place. Can we replace it with the driver code,
> allocating more sessions to the last CB?

Thank you for your suggestion. I will check the methods you mentioned.

Thanks,
Jianping.

>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 6079e67ea829..5bd20909f9db 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -4465,6 +4465,7 @@ compute-cb@5 {
>>   						compatible = "qcom,fastrpc-compute-cb";
>>   						reg = <5>;
>>   						iommus = <&apps_smmu 0x1805 0x0>;
>> +						qcom,nsessions = <5>;
>>   						dma-coherent;
>>   					};
>>   				};
>> -- 
>> 2.43.0
>>

