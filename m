Return-Path: <linux-arm-msm+bounces-91845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOiCEoCGg2niowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:48:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3ECEB290
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3574F300B87D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B953A1D01;
	Wed,  4 Feb 2026 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqootmT5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyD6Djpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5F34CFCB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227322; cv=none; b=Jp9OvPCMiTdGXlCa+ZuBjfxUwmpfxd/+DM9Z+AWCI02RuWhTj8SrwwRpFpDCVIs6FvvebLjxQuMdIkQAyqxWDd2wW7nhuOHmNg8RCgxKilTbc/y1chaEM/rVjmk3E2vwLD5sSaX1cLDeETezX0g10zJRrA6+DZ0xdmYGQzHx+x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227322; c=relaxed/simple;
	bh=FY5KOFwV2EFk53S9AZ3IAoLzrRowA5qsX+UJsphMmGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDYkcxBRf+so7sZxLPbIY0X7Du18b6bzPoGIdxglRrhpDeP4+UZ+WyX3beDcgAktiUCS17ShiFUIXfybigDrk3mFiSmG+cMiuK4BFu2bwo1jnZQQeyHLF7cg68SThbUBfCyRFEKiR/a/SrLPXpl6jnzGzEIK/3J1kgX+ldyKX5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqootmT5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyD6Djpq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIf36899472
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 17:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teCTZ2u4pLkxbNo7nhxx4Z5y7v1VUqnsATNaJkSMoa4=; b=LqootmT5y0JQ3I44
	LczW4Qitg0GR05D4cQCa9USib4K5ODFH8j0gHa0GvGhGrfPl44kDeA01y3yiV7aS
	jXjmASeQQwWzCzv0P/z18CBVg0jBXrBmDNcA6nzR9N3z+eyqxfNblXqT9WtxEl+4
	B+KuxCmDI/bRJSD1nyot5ToBtFqgJvcYoNeJW57X0grm8jC/WlT1E4CCwsdjEE91
	4ySI7WMPNS+QftIcOuE//9XAp/Vva71DjxTf/gcFgnTFwp9M0ot1KuM0NmfNdojv
	2VhMZTux1H1LqbHj4GrpNZbKmSE9bFYUW3ywLc8kgjSuVKTdNwCWzkNFPbaRG4ep
	7kVVjA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c445whdrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 17:48:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f5381d17dso65849b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227320; x=1770832120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teCTZ2u4pLkxbNo7nhxx4Z5y7v1VUqnsATNaJkSMoa4=;
        b=eyD6DjpqlPUcYiCQ8Pk9QdpTIZLCNfxxObEdp4iGc5ZiZyLBk6rNhLKag7E2OAYxoE
         UtrW8ZL2lGyhGoedTFz+n6I+BQH62u7pioFCsltHyIclzjpQ3ZpAqjhTYIP1h2DxQysR
         y8oZuaEBhhxil4RxbStAta0EYsjwPtThylRk8//1tCsBxfCyPhqTH4GmGr1yPpT/+6b6
         qD80yfiRnhHduh5Uxm4mF6kBJVI61PDXyu2YLPIki3CEMGRPss1fcU7Uq6gVeWSdMVUo
         PvdZ1CupW126rNCVlNwc+v1msy1OsXaZLkqa/jcQTqGzpXzYyHgne+SDdsvlhKNUhbQ1
         eeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227320; x=1770832120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teCTZ2u4pLkxbNo7nhxx4Z5y7v1VUqnsATNaJkSMoa4=;
        b=bMadvBvHbGvQsTEPQ17LZ2qE30vrZO6HrlPGeYyWMO4Wl7meJa4NkmBj0U2s+DFEbS
         8DOsfT3BbxiFZx2hpNiDBERX9hRfrRWb65RExqOykmM42OPtua9RB1ZgibrB363s/L4V
         AS6NehhfKs3TYsGri8OmdIlXZmtcT7FIoIm3T1feqkmMWbOMkl26MvCAA9nKQjxHSfJR
         NTokCF1VKCrIH3B0Q8omcw9T96Um141r0OjWWJAjrjQ+AbVKzI2INh2IjI58xqwDKqvL
         n+Q/TaYQ1WwG0/SJjXWLqelocf77EoHKZ877I2dDT8QQHxIR6bvOJo6MTRj2yreormRO
         gfKw==
X-Forwarded-Encrypted: i=1; AJvYcCX6QV9l2QcweZLYTnTjjL63kloahHNSEBmaMRLG63yTtTxIe6T/mwLL507iiQMBkSKLMMCbb1jGUEVm3PbH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0M0V3Z32pokv+06MGJedvIscagQyGjnmMVYP7r0zt1911gBeS
	kwmsZcJIKaMv8QMavIGCAmn6e2/CziyrArz1UavVzJaNWqfqbwnnwrZVBQYpVcmpS1dRAb3w7/y
	jvV0FThBWmhF7+8KV2RBHv2Lq+NgdOrr4Je69S9XubGTXR4lNXQ1NmLP8sI8UErxi3Zwd
X-Gm-Gg: AZuq6aKEKra2pylxesPixwumj0i6KvByL0Jonzr3wCTFNI/kzgbGseLMAW7aT8WxY1P
	elMLVCsIYgN0K9V5r+Qq3eAaUtHj4qjVVQOuI02VFxeSvuzWxzRCTgku7b/2j2gRxhtB2NVcqf4
	3XT9zlY7nfgiucrMfW7hVJL2esUrZuiRWSYLIkx7UDAQSF1VElS/Vw17WJ2kFaPMxRgWcmJOfdZ
	6wqsgM6sciwf9s7HBOBKHIk7WX98nYa5p9/DiDquax3WpfMbWdcsXa4V3f68/RIvPUdH1rLPO9e
	njoO7z6XQCaabUiZ66q5V0PgE8CzmgzD6q2Ogcl+49bdhh4dM/r0qPA9cu9DCk2fF/0VG4HJihd
	wdMEMdZERk9QVItsIM8j+aOMoYopj+vBejVrQuVB4+PQQ
X-Received: by 2002:a05:6a00:3e01:b0:81a:74e5:a4cf with SMTP id d2e1a72fcca58-8241c19e37dmr3356512b3a.11.1770227320393;
        Wed, 04 Feb 2026 09:48:40 -0800 (PST)
X-Received: by 2002:a05:6a00:3e01:b0:81a:74e5:a4cf with SMTP id d2e1a72fcca58-8241c19e37dmr3356489b3a.11.1770227319922;
        Wed, 04 Feb 2026 09:48:39 -0800 (PST)
Received: from [192.168.0.103] ([124.123.178.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4b8c8dsm2974606b3a.69.2026.02.04.09.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:48:39 -0800 (PST)
Message-ID: <838b9868-dd6f-4264-8947-d56f5a781946@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 23:18:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
 <82c6750d-8fa7-4837-b537-8fc6df9841a2@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <82c6750d-8fa7-4837-b537-8fc6df9841a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX3P7xq5RVhhYZ
 ARtsFyjKo6piVEDut1cAVRVXXv1BjWc1pTEBFU0twaJQh0rYX9Uig5OHv66dmmUkY7J4ZtMbuiY
 fKAX1dAw4bo7mtWQIOpukaPlAqlT20E+DBFgEYjY5F/5AqJrZcDmpterrvvRVIg2BRkBsGxmjLA
 w3NNDaY2kRg5/6ti5S5NsbTEatCMsJ9aDKwhnRtUAMe+IqIiqJbTK5WFnEj/mZi3YrT5LXRRWUJ
 DwuuduhMJeUVk8Oi+rKLJkgS6YUB5dXkpa86XxGcHKyNtPEawUGVrUAFrM20bsfpFUAOcZnBWMg
 YgRkcXsvdwlc5FFte4RT4TXs/YLBMSnVgLSD1uOY1/xklBHb4c1AC1lgmDSGi2FStydbwlN3DAo
 Gjn4cNe3OLv223NHSQ2v73L1la2SmFDBAxYS1uphi/AZYevpvixFoxUGe/xZnW10FVapGGOTznJ
 aGyNpU4bigUQPlbgmXg==
X-Proofpoint-ORIG-GUID: TzPgmsPHKVbxHODsUFHMUPhqJV7159kN
X-Authority-Analysis: v=2.4 cv=GvhPO01C c=1 sm=1 tr=0 ts=69838679 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=2H5/5ZkxJs/wMzWGxXwROQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BjO1pcXgz56rAAoD9qIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: TzPgmsPHKVbxHODsUFHMUPhqJV7159kN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91845-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB3ECEB290
X-Rspamd-Action: no action



On 1/28/2026 3:38 PM, Konrad Dybcio wrote:
> On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
>> X1P42100 video clock controller has most clocks same as SM8650,
>> but it also has few additional clocks and resets. Add device
>> tree bindings for the video clock controller on Qualcomm
>> X1P42100 platform by defining these additional clocks and resets
>> on top of SM8650.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +#include "qcom,sm8650-videocc.h"
>> +
>> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */
>> +
>> +/* VIDEO_CC clocks */
>> +#define VIDEO_CC_MVS0_BSE_CLK					17
>> +#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
>> +#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
> 
> I checked a number of platforms and the _BSE clocks are only present on
> Purwa, without any explanation in the corresponding docs.
> 
> What are they used for?
> 

These clocks are used to drive Bin stream engine, which is a sub-block of
video codec HW, which seems to be present only on Purwa.

Thanks,
Jagadeesh

