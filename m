Return-Path: <linux-arm-msm+bounces-105872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC18G4mw+Wld/AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 10:55:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFB4C8F6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 10:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24E3A3057490
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 08:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A698531716A;
	Tue,  5 May 2026 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjhwu0Wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsoVRuo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB3531A053
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971064; cv=none; b=pD1Z2ERkrTiUq/vsyLDNywSH2nAG9FpZClxMvAPWd+9svfy96/hHGaGrLbVe/Dkw9wuJj3KsaQNajXkleSiZ59X0riOvgNNSduLCII8pChX51KaK6iFJSLcd1Hq4sLy6BNn6r2mxSjCIONa8knjC0UYbta8ZGRb4LJsbr6FqTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971064; c=relaxed/simple;
	bh=0MY4VkCsVdTlbUk4kGmQi8tRo8dtw1l6rdIz9Yb8ER8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeZx2uJae/tsBG9la660IcL6NbKHrV+lh1YuNWbsUARYYk8mcWG1NOTMSDpK6bSHhTot9OZFZZHKI05Po3AWy1aoSwjxjRPgV+mq6rsQdBBjx45yY/wCl1MfarxcqaHJ/NnhJ4fNIAv1kyYzNbmd/AByOmxAYwhVJeqKFBeMRGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjhwu0Wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsoVRuo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457DJOU366722
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 08:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxIH95d1A5WcBtuNvKRyFf+Q5m+ChBTJGIFLAPmJO7s=; b=mjhwu0WcN2RYztsO
	92ZG+QhFa1kZeCBXD+ekfPen+2fNGxJL8VJ3AMIJyCNd6K6EWIebQw8Dk+4640o9
	h/ctGAyWMV5ZDBqx/fG5l3ddAel8Ixl1Ac9jZN1/KpYUHytdodrjrc2RTM4Zq1Ea
	DtOscmgZfa/UnNhe/wMjV8pgeFOGQ3Y5RPe0y23IyR/cjR7+TPBqPH8Y4RNZevky
	kyyj6zF9nlQkVIqAPZHEebCLTxZX7jFC7qScLNdZaMGuT7mbceZQ87wcKzFw/5X0
	ohg5O0wXHIrOMjJWgt1ZnUYXrPgG81ERpxi5xSzCbW0EchbrzvGKMZcd3p3/EV1S
	OUM7lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6ujvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:51:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36531a0f95bso2222170a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971061; x=1778575861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LxIH95d1A5WcBtuNvKRyFf+Q5m+ChBTJGIFLAPmJO7s=;
        b=OsoVRuo/d5avbrWn/S7OT7BJ+cJj1hEz6rNI9gB4lwsiv9Zm6hdRmZFKKTFCHQNpvj
         RimVQZ9ZUTlrT028PVPSp00qjufsX9SZK27NLvdRwThwnFmGSrKl01b0PInUMmBhqyzV
         2yKjInu63KaJyUNbSMC8PGyFrm322MJXkfc0aJ8WzRo1jJ/FHpfcn1KgUq8m9RdYkdLv
         8VNcE0QqPL3JYHc4jsugO64sUjBe3RYTFRzBsv6Gd/UB/w36AchN//MpC1QVpXxB8EGC
         YUlQfJ71ih3BAHkfWGNa6xNL1HPcAEkB8j9NSVYK4chuZZzLcJp7BsVbskZ8RClluzog
         ciwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971061; x=1778575861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxIH95d1A5WcBtuNvKRyFf+Q5m+ChBTJGIFLAPmJO7s=;
        b=itEUWZSzGoAvAbpMg10+Vnrr8nd7T6uC5w33RzCvTmwrt1ZG4P3rFpDfaXc8fVZ2cX
         Az4kSa6Q8KNYhl8RI1+JpVhMskwQUhqQ8AhB/FPc64lk3La9F37AnhpDdyiWJtRG48IJ
         jIv44/XpVfzlfVQFJjk6z/iEtZJrvTtcZ1PgVmq+gaGZ3POY/Z1TNC1t1TWKPA7qaZol
         //gN2qlzTmQgq0dgZuRqF7rtGuwf3mADJ/+/fJB3cy5JvLGoX+KfW5E6WTlQH5VGXJ4s
         cFMpMP72K0rJGmwykdkKK6uHTvcrVClqA7zrX99iOIqGPmqB2C+zNobIpl9wsoMMexYf
         UdBA==
X-Forwarded-Encrypted: i=1; AFNElJ9Hu+lUeKIptr1LcOOclcAQ1aB2UbeQNzXRDeSpo4AfxiqnwuBZK5v8hCLoiHIoP6iu3mvz4HATnCtfak+d@vger.kernel.org
X-Gm-Message-State: AOJu0YwncJ5Ysro2+7/kgUgSCfB5yZ/IzC9WZNGx7hYLNvMsKpMCYSZR
	OTniJXw+t45xzuUjP83ITjfcvJcg6LnL9av8r/b5IlN2AwX3aNSAEE58vFWBwixVUuovE9pFc36
	Au0MCFL21J2QCNLqjx5MnEoiBS5zHggzzGgIBEgrz8VJh0cC4AqVSl2sn4MmwSX1poZnE
X-Gm-Gg: AeBDievkrTEEuQELV8N6YRivREtLw9klOGjCLiCoPI+XG5N24l3O6brg6OxWfD0rsLa
	BjHDsD0PogddI73Ew1ehdzpZYxKl2Vg8Y5fMkDkvLGD605KXLJ0jUzO5LuE5A3iML2NQoMjfqmN
	ELuuoSRW5Jd0Izr6/4mfBpVs6hwEs++17Al7UQxf1KxtLYijqmI0BUQrDwrfEXsnZZA+HBvBolS
	2VNh+q2vp1oZqAWt6deoyR0r8lvinCuS0rQ3kBfQWNcS86lDfb139BJ0XmsKJ6phFn0MsVG2eR/
	M7d4JWb0EJxWQUd8T4BT4VH2GYhYYAzHn/EyV/CC0n9Lf1I3cJuUadbJKWb1BA+0WNUsjpcCxeK
	yvvlJUA/pheJf3iY11Du9TZhMc9VWql0IEPPUfb4hNfaCrN3BphaTjHQH06rP
X-Received: by 2002:a17:90b:4ccb:b0:35f:bbc0:e570 with SMTP id 98e67ed59e1d1-3650cb0af61mr13330948a91.0.1777971061153;
        Tue, 05 May 2026 01:51:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccb:b0:35f:bbc0:e570 with SMTP id 98e67ed59e1d1-3650cb0af61mr13330920a91.0.1777971060662;
        Tue, 05 May 2026 01:51:00 -0700 (PDT)
Received: from [10.92.198.125] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebf2affdsm17983212a91.8.2026.05.05.01.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:51:00 -0700 (PDT)
Message-ID: <8101e2c8-0593-4325-a701-84f776dd4b0a@oss.qualcomm.com>
Date: Tue, 5 May 2026 14:20:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
 <20260501-shikra-cpufreq-scaling-v1-1-c78b95f53b91@oss.qualcomm.com>
 <20260504-fuzzy-wapiti-of-ampleness-d8bc13@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260504-fuzzy-wapiti-of-ampleness-d8bc13@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g1sIw2H-ffkXOfXN2rI1sSZ5wc1ZCmm4
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f9af76 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=4FMMPcsxIOz9NaBSvE8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: g1sIw2H-ffkXOfXN2rI1sSZ5wc1ZCmm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MiBTYWx0ZWRfX4y83tlROiSY9
 YHBP7O8azCRkyihbuNnelLzJ3/0TDqziQwjtM5+owVk53G2D3ftkuZ89t3jxbxFujSD4TWoOfZW
 rQAOKpSDZHrRw0JZO6FxeG+oKNvMqHW3MLqa++cd/IgI7KyPhiv7qi9mGqRCV8b1EVHkuz9Bc+8
 /1qtNMviNv8HWUvfVvrtUVPrlymK3W84vZke6uCpK+/g/twrOpDlDqgZxsCqdQYM3fP+KiozQ55
 /Z/4anm96AMsMH5xyQ835oMKrwSIKoveBZIHTNjVhLRAcXrin38PB9zDJg8VzU3V7yWBQY1gp8I
 Uab4EOzJBVNHppz7LCV8v1o7qZ78HWZx8l/rhvFumTodUskQ0oAOJftDlj/fGtPEBIAUMNo4oph
 iw22ajey5nkPyiInefpufvtqCg3+r7subqRut8UQRPe8qZRgc9DLjNHTlFKFgeUgPqim31csZQB
 32I8KyjcayaxhyhLaSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050082
X-Rspamd-Queue-Id: E5BFB4C8F6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-105872-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 04-05-2026 03:53 pm, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 12:45:44PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>> qcom,cpufreq-epss-lite to represent this constrained EPSS variant.
> 
> The entire point of having a generic compatible is that it MUST match
> all devices. If it does not, then it is pointless to push that generic
> compatible.
> 
> I am speaking about qcom,cpufreq-epss.
> 
> That's nothing new, I was arguing about it already, but now you have
> confirmation of the mess introduced by generic compatibles. Solution is
> not to add more generic compatibles, because what will be next?
> qcom,cpufreq-epss-lighter?
> qcom,cpufreq-epss-more-lite?
> qcom,cpufreq-epss-high?
> 
> Same was here:
> https://lore.kernel.org/all/20240828203721.2751904-17-quic_nkela@quicinc.com/
> 
> So that's second time I object and do object for every new instance. No
> to generic compatibles, they are proven to be wrong at least for
> Qualcomm.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

There is no functional change to the latest EPSS hardware 
(qcom,cpufreq-epss) in this case. The Shikra platform uses the CPU 
frequency scaling block, which is a predecessor of EPSS and is referred 
to as EPSS‑lite. The only difference between EPSS‑lite and EPSS is the 
maximum number of frequency look up table (LUT) entries.

This constrained EPSS block is not specific to Shikra and can be reused 
by other SoCs that implement the same hardware. Hence, we have added a 
separate epss-lite compatible and reused the existing bindings, as all 
other aspects of the hardware behavior and interface remain identical.

Thanks,
Imran


