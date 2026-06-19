Return-Path: <linux-arm-msm+bounces-113820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iFL2NZrlNGpDjgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 08:45:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B846A42A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 08:45:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bm+po5Xh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y9o1lrT9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113820-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113820-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F6673046065
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 06:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C8531E850;
	Fri, 19 Jun 2026 06:45:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A622C21D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:45:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781851518; cv=none; b=buWm5J7DFn/6GrVRVUU2cXtxBDZUKNwpEHl78zyneFjXkHXfwK4xAWr77seLeSK3vyAVnRf9smFK/+mn1WrT8PIGmL+ZJtqlLLFSEZ9BZ1g2CTQAKrpYf99hOBC/5CfwJfO0plzih3KLZ5GLVxaZdGlhvhxWNNYmCDoxCapXlcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781851518; c=relaxed/simple;
	bh=VvdYi542VVA8C+Q8HCRrmxb9lDjEJqxG11S2VZLN9Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BctRc3TnF+3e2oUja+VqM4CK7oYF75utbpY+eg2rDu8rJVgXAG9koEn+oylJ/d11yHqN2htyizfQzFbDH6HsbSONSUyDDx0K3MGZ8NrfV6xtpCY1/LKfkN+SdAIa2hzvjhm00P7GYitRq3OajcGEzOJFH/R2UJdMXTykH288FC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bm+po5Xh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9o1lrT9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2sgWD3155516
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lkZ7tEMewe+zT45oVBiLxcf7tLC6xWFQ+vqhyQwRkM=; b=Bm+po5Xhdr02gEr1
	0utyOZxyYcnCqf+zuae/FNkqputt/d4Qy8PTlQe1hE9Idm79RVMUxtiZJytUVYhR
	ZQGkK61ciehoSYLl2KLw1OexB62DIZA1JsEvo/ltHxkclM6nBq78ZCw5qImVjt0A
	rtV0Sw1iKz6/Oill820DYDKU6VVOr7PncQVYi3cs5sQH74Xm8UADleoxhhwH+lNT
	ACbtD06ey1rrChFzOBKl1Oc1oYDlUR6KiMH6CsXjy9gTYy/PJDIywCkxxDWhwxDF
	K1cf8JbDX1nJYF9Wx4u69+/OjtfxFaGFi0xR8wQUccWpJrLESNJx8A0HZT7aEA4C
	/8RgSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm26astt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:45:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8ab01bc3d3so371498a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 23:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781851516; x=1782456316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lkZ7tEMewe+zT45oVBiLxcf7tLC6xWFQ+vqhyQwRkM=;
        b=Y9o1lrT9zI9oXj06DAy9463vTj8ZqVDz5zsHHOyTnnTy0Dz9VdpCDb8K74TanhM/Uy
         Jb2X61nL+6frF5RUojjsppZtl7bs+38mAkKQ3tZih/OKK+u/dlAcyERVuIeTvZz8rQlQ
         8yd9Wz/7/MDZ3i33nM/oTy4xlUbNnq5NlsTlcto0t0r5u6tLJCcHxdAoWPUuFRyLvjQG
         J9bAa8brur4M9v1rBC5z9hw4a2ilU9/lgTh5e/c9E/hV+ffgiB1Y/jU0tRxL+24R52yR
         Qjn+h8g4I9CNuO9g7kPh0bXuU4+Uk+Otu4YRouQTzeNwVra3Nsh6OtzBJUA3Yhxq/eT9
         fiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781851516; x=1782456316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lkZ7tEMewe+zT45oVBiLxcf7tLC6xWFQ+vqhyQwRkM=;
        b=e+xrtXQ9epwGirGxkd42BjrMTjN0eOA9WMGEG7h7TUQBtHdyj9ZOpPJiqDIQKR822n
         iVfwjI7+q/GuFZY+m4502miQSsjdRK8sMhqrQ6+XGMYfOBU+yDCNI/kEDOn8NE8m2APN
         A8JbjplnVcWcqI06ln7hOFfy8D613oCKfuxiCU8oMfqs8E6hI/8FEj57HHdfewi2p05J
         qnC/wNWYPaesFFWthCnFxQPtoW8bbauu3wzaYkpWtLfzVdH77QEZTXsfYWAX/94Rhhg1
         jSUPp6c9jqqPTktCS2Tw9xOOqo2BK+gdkebf7n2ejzE72bSzGWyL1kTfQ2w9dQu+FQh2
         mJ8w==
X-Gm-Message-State: AOJu0YwAk2ymInmvkyLiEZRBqOIB5goDiLclohdTVLv/acU29n6RnRnh
	OR77PFH+mZ6NmzScNJDH75yGnpZoEMLIa3vZ6r5dkTgFpW0VWR6ezoxtBVXTugCAl9mfQMg9TH9
	5W06+UpSqkfFwr+QkpwDS7KVXdGmgtjLopmX48Q/uk0wg9tLKo7Ff691pA8pqnSJq6p8+
X-Gm-Gg: AfdE7ck6KqDmSTPI7QToYFkzeKAT3sOa4qNoT23nvL8/PU3LINQ3AQsc1n37E7O+fD+
	iWtMPNgvqxZGMDK3H5Pivgcf9c9c5xFmq1vXioZR9VyZnnhfmlnpiVaa2fTE+WyuVpKcPcILEjC
	JvkyXuTGIXdfgx/3nCHO0XndZF6ONNWZFa/7AEhSZ4yIEWOOcrC1UNNHYByPgn9i2Dp9FmW+zVG
	PaMP1UXDMwGBxl32YjtvM2asqVVf3h4C5NS7GUVdE0QAHVp248ZH2FjVWyHPktgGgAk2UvOt6Ju
	/SivPKEUo9bvC29syzaWjaTxxGMBw5gZcMtTVFNT4MBJ4b8NcG+ok7PxPSnmx8v/kOCnut4U1Ue
	muOUjEnE+c5ObddgSVdt6y3o5rmEOVAyqmsM0fxl4
X-Received: by 2002:a05:6a21:9092:b0:3a2:e089:ae4c with SMTP id adf61e73a8af0-3bb3364fe14mr2290185637.5.1781851515964;
        Thu, 18 Jun 2026 23:45:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:9092:b0:3a2:e089:ae4c with SMTP id adf61e73a8af0-3bb3364fe14mr2290138637.5.1781851515412;
        Thu, 18 Jun 2026 23:45:15 -0700 (PDT)
Received: from [10.92.184.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a890ad726sm1286070a12.28.2026.06.18.23.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 23:45:15 -0700 (PDT)
Message-ID: <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 12:15:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA2MCBTYWx0ZWRfXzlyv0OmDonU+
 b1GMOWUSZhD6ODSrfXSv160IiDCjdzncay+Ws0n66tjrvvmJkml0bOcaF6i2dW3j0aGo+JfeRwM
 GZIPWuoVoPY18cVKaJKrAjgU8V2QXgE=
X-Proofpoint-ORIG-GUID: Ut1cXMVI8Z9IJ69itK7oD8j-o6gJo9Ij
X-Authority-Analysis: v=2.4 cv=dL2WXuZb c=1 sm=1 tr=0 ts=6a34e57c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=bQejZYuZTa88olzWoIwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ut1cXMVI8Z9IJ69itK7oD8j-o6gJo9Ij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA2MCBTYWx0ZWRfX8sH6QuJkWd6s
 6mRJc6WhSbJHT2HpccyNP+RHxpCzewTraKqscxfSThwKHzSRNQvtFFyxVH73ETaA9QZ73YB76HW
 klYv793ZIj/XR1Yv3aiqpe7NiDEI+HGoNNMXrGl39mvxqQ2MhSYhxt+fHkJB1DTYnJkB9t+vn73
 suPCSryXzL9DoCrY31PbNOnSzLYv30nkDxG1lcXNkA4gIU/8WVAfBHu8ahfuRtSFygiIHVD9fhx
 BrcmawDosXDZtlRVqksp+nhsBBKIMxPtlGR1kKtjEmBSaMr88iTDliaaYIhDM7rYnUASYuCPDjU
 CUEICMKuQDAUw4NQgN7exmkrZVdvY/kLAWYi/chCH+V10h/u3jf7+kFn0FQ6pvuuUt2haX8XSZh
 0RJXED6qwmCldVWq8kSQLKh5xdqtsCtR2imveF0kEI90ECiMTNqnjQK0q5JLFMg6o3UhYrT/a2p
 tZNv52Ld1OLDZARH3fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113820-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,intel.com,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78B846A42A9



On 6/16/2026 3:40 PM, Konrad Dybcio wrote:
> On 6/1/26 1:01 PM, Sachin Gupta wrote:
>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>
>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>> the die temperature, and when there is a level 1 upper threshold
>> violation, it receives an interrupt over spmi. The driver reads
>> the fault status register and notifies thermal accordingly.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct mbg_map_table map_table[] = {
>> +	/* minT	vtemp0	tc */
> 
> The struct is defined 2 lines above, the reader can tell the names
> of the fields

I will remove this in the next patch series.

>> +	{ -60000, 4337, 1967 },
>> +	{ -40000, 4731, 1964 },
>> +	{ -20000, 5124, 1957 },
>> +	{ 0,      5515, 1949 },
>> +	{ 20000,  5905, 1940 },
>> +	{ 40000,  6293, 1930 },
>> +	{ 60000,  6679, 1921 },
>> +	{ 80000,  7064, 1910 },
>> +	{ 100000, 7446, 1896 },
>> +	{ 120000, 7825, 1878 },
>> +	{ 140000, 8201, 1859 },
>> +};
> 
> Please add a comment stating this map is not PMIC-specific
> 

This table is PMIC-specific and applies only to the PM8775 MBG block.
MBG is used only on PM8775 PMIC.

> [...]
> 
>> +	/* The HW has a limitation that the trip set must be above 25C */
>> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
>> +		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
>> +				      MON2_UP_THRESH_EN);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
>> +				   temp_to_vtemp_mv(temp));
>> +		if (ret < 0)
>> +			return ret;
>> +	} else {
>> +		dev_dbg(chip->dev, "Set trip b/w 25C and 160C\n");
> 
> Should this be an error print, returning an error condition?
> 

Yes, this should be treated as an error path. For out-of-range trip 
requests, I will return -ERANGE and update the log to an error-level 
message in the next patch series.

>> +		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
>> +					MON2_UP_THRESH_EN);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Configure the last_temp one degree higher, to ensure the
>> +	 * violated temp is returned to thermal framework when it reads
>> +	 * temperature for the first time after the violation happens.
>> +	 * This is needed to account for the inaccuracy in the conversion
>> +	 * formula used which leads to the thermal framework setting back
>> +	 * the same thresholds in case the temperature it reads does not
>> +	 * show violation.
>> +	 */
>> +	chip->last_temp = temp + MBG_TEMP_CONSTANT;
> 
> Will this work fine if the user tries to set the max temp supported
> by the hardware (i.e. is there headroom for max+1)?
> 

In the current implementation, temp == MBG_MAX_SUPPORTED_TEMP is not 
accepted (temp < MBG_MAX_SUPPORTED_TEMP), so the last_temp = temp + 
MBG_TEMP_CONSTANT path is never taken at absolute max. For accepted 
trips (strictly below max), there is headroom for the +1C adjustment.

>> +
>> +	return ret;
>> +}
>> +
>> +static const struct thermal_zone_device_ops mbg_tm_ops = {
>> +	.get_temp = mbg_tm_get_temp,
>> +	.set_trips = mbg_tm_set_trip_temp,
>> +};
>> +
>> +static irqreturn_t mbg_tm_isr(int irq, void *data)
>> +{
>> +	struct mbg_tm_chip *chip = data;
>> +	int ret, val;
>> +
>> +	scoped_guard(mutex, &chip->lock) {
>> +		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
>> +		if (ret < 0)
>> +			return IRQ_HANDLED;
>> +	}
>> +
>> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) & MON_FAULT_LVL1_UPR) {
>> +		chip->last_thres_crossed = true;
>> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
>> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
> 
> Should the assignment and this call also be guarded by the mutex?
> 
> Konrad

Yes, agreed. I will update this locking in the next patch series.

Thanks,
Sachin

