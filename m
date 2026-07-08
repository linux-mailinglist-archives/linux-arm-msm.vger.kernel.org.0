Return-Path: <linux-arm-msm+bounces-117587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dJYrC1U2TmpmJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:36:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21746725EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:36:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E1sn3FI2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fuiDGpuk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117587-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117587-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8968309A0B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB19B441035;
	Wed,  8 Jul 2026 11:19:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A2E43F4B6
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:19:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509543; cv=none; b=C8vfQhcI/ttkjZtLxfq3vXmELrpHnuM16NOnZfJRfujqS9anzFHjaQ9MqCoHZEp+oJiAys1mRCKXTnVQ5fpDZ7UKHFl9UOtqVT1ZQRKr9h+IRbiSuA4GKUTKSB71O4TyMYn8GfIf1YEbMMMFYCLq9X2B7jZvOU6CFGE1h+lyLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509543; c=relaxed/simple;
	bh=/Vk+NQ46cUjFH2FZV8DlE41cVIvUvSkk9Lp8tzGqWRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGZryoXeljdsOC36BCa2iLc1ypfDrpbAZYCdE4e111AOfYyGy9nXyqQ9JHrctljiksK55cefAFCv9pUfreAfNrGnUUY9uRhIHlb23sqghkBo42mRz1pO1o1GHd3pW235Hwyjox+HOb2zXL1ac4XJO5p+bHjNYszqzCUbqfBDbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1sn3FI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuiDGpuk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889GDj2135680
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=; b=E1sn3FI2OQRb9Bnw
	/EJv8BM+WdswdvEwKwNBDEdq0+OvrLMBWe/nY67iCorvAt+3EFnpKOCw6e0e4z6O
	iLbcbRkWiMd+SMnllFZf89iCSGy28t0uRHrdH8L0ze1kUFlWkle2761Ztxf0GU0w
	ZrS4lTHCyZ1e+O3I9LbieDZsvDWnqPavD5ohEuYSegGSrtaGykyuKWlvHlJ1XT1m
	VVFCJzq+El8rRLgpzJE60kE4jf2HkghYtOXVWKopIJsbyZVSk5aVzor/AbeUwtCc
	LLzy02YUqJA16K8gYCgM8daWai9j16i8BQlzmo/6MD6TZ0IhsDUW0AAC9ci+D7/O
	9HySkQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgtw0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:19:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce02cb769so8287015ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509540; x=1784114340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=;
        b=fuiDGpuk609YlfU2CwUUG0YzM0p45AyQEJz8mLdCQUIrG7F46UO9ZykTv1doGuSKk7
         1MpZ3L0hKSQhaa+m9qLcs8BRHpgDXS3pGGejg0JW6CWGmOHrKuT61lQJF1kyRwd/HS2G
         VCDOOnbs033XrfuDpA3OIBeRdEL+6y9HpxQ3+RzoAYVruTmxHnSfA6WMcLl8QecGZRHo
         Tvfvten631W80H2klmjCTWUU5WxLbzqp40PqA2Vq0qby4ShRGO4ShsVcRDRywL5h3xZ+
         IELbog1nJIc6WYN0fCNE0DskLeP3hgTL/YruQuGVITTGUv1VVHo4JC9FHRExbqggSsMW
         Ng/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509540; x=1784114340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=;
        b=E1N/sgK2zX74CiPTAUkMrG8AO20NZp44wITI2y7ae5110E+eV+swqgDO67tKh6k9L2
         LoSORM51DZWCejTahSJ2GbLajM+ORVmo4MYoqxXccFIH0VKcvaS0lZvTPJR00Pxgn5Y9
         dzo4WPZXQ6EiRdtDM00Jc8nQW3bLIupmUsjYqNaTzEm2WaZNIquZ6awSJYD+jbl1aDbV
         aGxb896GcgJA82n4VFJx1v0ofpJOKJWVN0MXtDT/bDXfo2/xUHnPgeHl2HH+WUaaoPdU
         OwUUfw35fYNNwKmxyfD5qaCBLtCroVPH0sIfwlEQpc9Whr3J4zNuDxfBPtkzipHf+3GG
         9AUA==
X-Forwarded-Encrypted: i=1; AHgh+RoUipOFkrqhe+YbzR6JtfcOK+dXrNhMhOpDHeyJPRHdU0Hmdsg2G2MA4t2qrzd70fJ3/k8wztz9PxQJuU+/@vger.kernel.org
X-Gm-Message-State: AOJu0YypsrbeJ1ZRfli7yk6owI45M6rHEHSPN1Krl+fqIMffxuSCQvBC
	5V2suFlY1PoNWIF6e205ziK52Z6NrCNoeD/aE1POuTK3Oo3RvKAJizFbkrkgVMT7V3r3MmKel97
	X0T8iZXw8wMgcvmL8GDp66PrwC3IXrP4iCcR19NYqcfUYdwUoohl4WjhgqJTp9T4LeBjE
X-Gm-Gg: AfdE7cnLxu5TGf2AEnzAK0hxHg4QC7o6JuothX3VVm1iJtiekyytJdtc/B2hXWtbBbu
	JLvJLd9swX27qsgSC4mrOyiS0O+DqBtJ9PXFqdQiehUxNwVqi4MyYuKqtydxyWPMwV4nZELjVQS
	FUEiwjvRV2w0mi9e/gOr8DnhljihOWrh0QESCeBs+QbX01huKYjSA7VfRhA5LChEJU2dtz44qVs
	Ra2O7I1ZK46fr5cDToqnW7olzUe+EDMj+YhwhpdAvb6I5+nIfH2cW2zKjAvwWOLzSJ91SprnmJ7
	3NadFTlntgUqKJytMt9W8mkZpjEZ5LPHYy6A47JRmHQ32MyYD8nypsVDy03XD9ix1crrolyMA4P
	dNIJHBaTukUIFSSb4MV7bClzE0MP5coEl8txLV/k=
X-Received: by 2002:a17:902:ebcd:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cced5724e1mr17400745ad.32.1783509539794;
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
X-Received: by 2002:a17:902:ebcd:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cced5724e1mr17400115ad.32.1783509539361;
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccf797ebc4sm318125ad.83.2026.07.08.04.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
Message-ID: <a99edc48-d429-4523-a446-5908ce24b307@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:48:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
 <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: arO7BD3wo4ImpkjO2itCOvmzaJHhs8eF
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e3224 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dgSI8aGl1U6gYZos47QA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: arO7BD3wo4ImpkjO2itCOvmzaJHhs8eF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX79uM1+i4Svfj
 TSVmSqOD5mHpIgpk6K4dth61lMILXwQMb/tz/Wuwhc7pAdkpQYdB0HMLYene+aNE3taQhTer19L
 rmIOyDMBhDf1O3Iax1t3KuM/hH3u5Xc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX4KR0HTOLUnym
 VZOJmlG+O4rGMi+i39ir9sANYVU/1/U6T32OFTKTlnYM6x7D9hgFYnwTzizS7XgUUx4q71WijwB
 tqL29HpKRwZ8rDAt0JnUKh0ji2zHGYSjBIBQwWHvzSsA+etxCPCd75C2eoH79GXX1yaL7DmAdGI
 n+PkRIU1nQJ2OS9Yf7DGTGIH9oKQwc5L9foMHtXpk4tZ1ybNGfvnlqR0E9JwkmDUbHBHuJku0TA
 IwBy/a9oj+g7WYaOBZ9DnsHkX+uEQ5YkaWqNjeoD+VAFODuKHhUn1M3WEAGKktuHOYsvCKTJtMM
 2TNuvV2Ghvqq/75GXS5HN/1WnbaR9xBT8qb79hTPFcIzJwPO/fF2UDFeWpwxeKuvytpjAApG6GU
 W8bztHPQHnlZB6jLCFlcyPv9tTOs3eSJMrkZ40U4Yp3cnm00n9GYQRmubL9JPwE69PG6ZRxv3Va
 GTYN0F/s6/Rd7uQjG2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117587-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21746725EA3



On 03-07-2026 12:45 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Update the QCM2290 DISPCC driver to use the DT index based parent clock
>> lookup to align with the latest convention. While updating the parent data,
>> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
>> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
>> frequency tables, but should be corrected to match the hardware clock plan.
> 
> That change is invalid according to the agatti clock docs -
> DISP_CC_MDSS_MDP_CLK_SRC RCG leg 4 takes GPLL0_OUT_MAIN as
> an input
> 

The HW clock plan naming convention is slightly misleading. Though the 
DISPCC HW clock plan specifies the GPLL0_OUT_MAIN, it is actually 
sourced from external gcc_disp_gpll0_div_clk_src(300MHz) clock.

The above mapping is correctly handled for the mdss_ahb_clk_src already. 
But it is incorrect for the mdss_mdp_clk_src, hence fixing it now.

I will split this fix to a separate patch as Dmitry suggested in the 
other thread.

Thanks,
Imran


