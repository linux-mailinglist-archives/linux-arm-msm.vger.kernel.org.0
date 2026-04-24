Return-Path: <linux-arm-msm+bounces-104437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPtvCqRP62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:10:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D220645D841
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF2313014695
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF423A1A44;
	Fri, 24 Apr 2026 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hv44QqOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSNNMIx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36873A3E6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028953; cv=none; b=BT5EYYT+AxtWGdRFVrJgkSs5l8PxZii9+kJvezfuZp3hLeP01kuCFQL4LiNsZZGRJrEgCZetsb38eTcVieDdTW9gIkJ7hkfG/xuyNEoluFcsvjOTDNjUNzVufWGZ2XHE50SyozQG4tpEa1tSkgmLxvm9769EhYMDM5ei0JZ/8/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028953; c=relaxed/simple;
	bh=LaFSKdn3fcuxshjr7YM6z36LvDcB10Ec1GAh1mim+e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZbLgngHTOK/3SZCfCy3Zx46cu7p+teviXojmkV+u/aLj/e2PADttr5RkHiK+AI5Ja+RADz0lMIRUxZCTXexqUnCeuYA1+1k5mfXLcR407iF42HWzvXLiWEZDG9aCB+yvb7QM86//iKU60udjRB96PZN9ifDrboJHrVIlpiV3Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hv44QqOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSNNMIx0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8DP1B4012128
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsNC8a3XtqDbUnvN0mfJ7jfUPjgjexIOw63gLaAHn08=; b=hv44QqOFlq7cPa2c
	tbY/CLH3gu6N1Gbt91XSS9NzKJ9+9Ifwf/adkDnelUlzqJ8uQuHMgK3oV3uZX9nV
	kKpVznRLjqjkUmPsuIk68RJflsmY1fGl3PQnS0WdLrtGZQlgjwO6SzH4ap7LmDtq
	OqEcV7h7Ji8ATHtzuUYLOOCOxy7V9J+YdAahaBVmMWchUY5nU0qdGmss2ZKf/xGK
	CSh1oR/G7lyS048kTp2FMEujrg3Awcf1aaRnEYIAyGRMwwzB4AFGhhwtQttAje5P
	5IFIsALazp9kDtpsen46kG7JLoj1nKrkINVJPzw6cjxa7E3SUAT4/VaJpUa4T+c8
	qkSu4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9v20a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:09:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e576143baso13549531cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777028948; x=1777633748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsNC8a3XtqDbUnvN0mfJ7jfUPjgjexIOw63gLaAHn08=;
        b=WSNNMIx097wX0kzNdzpQx9sgLk+yr/4SIhcG9mr3R5n/BKg5n2cM8o59IgtXvjtatp
         Z/9cOEINQqMutmVZR8ko9dht7KoOS3AJkccBWX92OH2KJfqjc1TB+StlRYgGb71IdoK6
         vnzsRwET7/jHrMucxsSG844IghTOOEYf987xUkc5qqBErIr7JlefWClWa+vP7WXKsmaq
         oVl35MRQkJiv0l4miFgJmObj7fkqoJcfExucgSa1AdKMPMV/epSenzk1pHdJzA/2pdcs
         ZXQOqOBWFkCvKJnC6j1Ij481qjcaVxyNDhlKRKpctMYpwg6bIkI/SZ6ph0yAr1FJc4yV
         VIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777028948; x=1777633748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsNC8a3XtqDbUnvN0mfJ7jfUPjgjexIOw63gLaAHn08=;
        b=tLsLWzCkiHUBMQ69LSqq3D2SJBGQQAXiH9s+aZ2T5KnFZt5dF8j0fA8Yk0sLjv0+v9
         BU2mBm8xF9Xq75gk4CyUYBmzmNDhh48UgxsIrsgm3IHUUn9pS3kxYucvGV1aplZfBKz4
         At5LWx94EGnpym8q3VkgrtkcPxyv/xxeV85rYBSIbhpegHnAX3VphbKrySM99CnpnaU2
         4i8y0Nkj5x7osPlQfCzwkhBX3gYlMg1DNnt2R1p0nMlUbXLScxGN08fs2HQfNG9CZQqa
         gdNVRUdjUN61mhLGHn7ofzf4ohPGc5drg7P6ITsOL0tsrcotRRqpBwja/uT5U+SqYI+U
         N9Qg==
X-Forwarded-Encrypted: i=1; AFNElJ/JRrbcIJrYDCW75TjYDm1Zg9Nq6SiRD8fqYUdu4V5pTszml4MSkY0rrKYg144GcHB2n0tGaAz+NmnR20Im@vger.kernel.org
X-Gm-Message-State: AOJu0YxEkGHoKQp7S5gxYtxBP1O7q3sKu3oHMjLkWWoTE3Br2DapIyo8
	s2yGSAmVGJGPqkVjfaIIInDfRgvZk2foa2aMyvNJ8dJtgV6kLOPUG1ShK+aq/5YyIVfRNFbB+PS
	HLquuELKjuOiFFzGq/nwAEAEaDdhqO41AquvirRpZM6pHaXEq6fDSOn4HLuknCyh2tEy1mxm+Hx
	I3
X-Gm-Gg: AeBDiesskrtyNxULswtTgTgnnHZzhJZ3jsfT+5F82IjIEKrA5jX3rfFKr1SL1kObEVT
	gz1kK+NOGr1feankTVJ1pO0aO1+T33Bqu/SDSls8Cly3G+l16HMpET3GlNj/P01KBMfsqimdNnA
	NW247D2LztVx+0uH/u/tusPslHHGWtSQmEaFOspyeKAEad7KKuA21yalKAOEBo4IgVSFkMuDSje
	MKQq/JMLi4cmPmr2p+n4EM9RZBqOir0pR2l1+ZwoG/uwxiEMgamdWxDnwy4tEA9CBDDai6rxqNZ
	lq723o05xGdZf3FDk5QHU23xxS+VY8kGDRX7Xoxux8fT0IIbuQXIyJPndnqxEP4ykr47hFj5+xI
	5pFkmCFteqxJdGomTPnUxWGDgd3zDAfUV87dPOA285ixJZVJ6KJpqdMGoYZKHk7QlXooOBX+M3Q
	HS/GDoRWNmucjchg==
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr290921881cf.2.1777028948451;
        Fri, 24 Apr 2026 04:09:08 -0700 (PDT)
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr290921581cf.2.1777028948047;
        Fri, 24 Apr 2026 04:09:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ef3d4sm760703966b.17.2026.04.24.04.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:09:07 -0700 (PDT)
Message-ID: <0710caaf-ec73-4c4c-b6cb-7fe716724f4b@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:09:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
 <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
 <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwNSBTYWx0ZWRfXwlbERT808OO0
 N3pSAY2dUGUcCNHTcslttW26xkH/DZ1sYvSBphzuujqLnLbsRL1wuPdo1WLChWAIuYe/D6cZQBm
 LuKIyaRcX2xBIBmKf6P97egzi9UllN9ZCKUAFWLXqHCg6wo5CtLsTaRpuYfxbnzpR6DcmbWyWeF
 CiZaOhJGVizGSQkcO2kC5BSNKUxe0HrPUydCiJObRQhTddY2HMTK18TQQR29vf/vVC9+eQeB0jc
 VPrv5uO6w4NnwxfKSLoQ6XO1OBVE8KvEMJf5OavNvIGut4hss37WCGGV1MfS8wQjrYIN0L5tAuW
 D3zDa+bBEDFs8As/SVD2pRUe3RjOA9dnfW9FS8/yuk97skr7ql1zqRByQ0QN3cLpxo7PQVAqGOl
 XFkIHeCAS8ZEGWkVqIdDlo7SlPQd14rUigJunFc1I36x35cA20og53d3hvAWS1hfvPVvcFXaiee
 HbdVKovt6qb0DaqgL4g==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb4f55 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sAdhiuySH5Di72lTHokA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: e5tC2bgxedTc1u8IhrXzcQacR1SXvT3K
X-Proofpoint-ORIG-GUID: e5tC2bgxedTc1u8IhrXzcQacR1SXvT3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240105
X-Rspamd-Queue-Id: D220645D841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104437-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 9:16 AM, Krzysztof Kozlowski wrote:
> On 22/04/2026 22:08, Dmitry Baryshkov wrote:
>> On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
>>> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
>>>> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>>>>> According to user manual / programming guide there is no separate PCIe
>>>>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>>>>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>>>>> is marked as the main block with additional sub blocks for each 4-lane
>>>>> phys.
>>>>>
>>>>> Describing the sub phys without the rest is not correct from hardware
>>>>> description, even if it works.
>>>>
>>>> Is this the case for the other bifurcated PHYs?
>>>>
>>>
>>> There's more? Oh damn...
>>
>> In the previous generations. I think Hamoa had one.

Any PHY with a name ending in -A or -B. That means:

$ rg 'PCIE_.[AB]_' drivers/clk/qcom/ -l
drivers/clk/qcom/gcc-x1e80100.c
drivers/clk/qcom/gcc-glymur.c
drivers/clk/qcom/gcc-sc8280xp.c


And, quite predictably, some PHYs may not only bifurcate, but also
tri- or quadfurcate (on Nord).

> Ah, I did not check the others and there is little we can do there -
> it's released DTS. This cannot be easily changed while keeping DTS
> compatible with users, because probably two PHY nodes will be replaced
> by one with different compatible.

I think no one utilized the non-reference configuration of those PHYs
in practice. Should a device like that come around though, we'll think
about what to do then..

Konrad

