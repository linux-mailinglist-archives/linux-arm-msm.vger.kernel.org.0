Return-Path: <linux-arm-msm+bounces-90647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM3SLtZXeGkNpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:14:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69938904DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8574A303DD69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 06:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525FD329C5F;
	Tue, 27 Jan 2026 06:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJXgeYff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZEUJPyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1699D32A3C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769494257; cv=none; b=RtwSvys/xDxYS7fApmRj9eI3en9K0OnlM9CdYsw89c6ZgTCfc1ZLYB8JVklDTtwR4gIKI1b8YG2/BJM4KWVR6JywSHyx0inBq7VMXKzZSkT3g2PhbQcJ17T/kRYBRtUWoEZU4AmHeT+G+wzbssLTQkT8yOyzENBWlRDs9IR8p2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769494257; c=relaxed/simple;
	bh=bYxB/Q5s5jMstJtbLmkZ3aOBTD8StTx0sKfJ7KdfYf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbRcd9v1uXWqfL4S8UiCIYbBKMsoqr4mdpr2zeBILN4W65NxszzAvjXZs0PavCLSPeLGJMEY2UVY6wxmnB767TeH0gMte/P5fehFqYI1OYsSvFcFl5mgj0bt3uhiPcTVpk2Eblj9UhgYUqSHPC72s8AtyMqaBufKvSPvYRwY7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJXgeYff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZEUJPyx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UJuj700207
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EG+LTvaFYz5tDIHZuLPqCOwZqB2vgKH3Jn22xQ26IIw=; b=GJXgeYffDf+rKo2q
	KlE/eddSXMulhqi6auZng3AqrWp2CJswVQt/bSQgtKCZK3oHPQMThI8l18j5pDtQ
	tL3iDE8uXDr8rAdg83N7Y5lgai35awXyJi2ChMkHn0JjV5c3TUGmpq4nRJQJ3U8z
	b86J2PugcsqQZYADgm8oJbhT5Km7nYgSejLB+hEdQAm8FjlpdBNkt5Nw78zAB58d
	l2/L23gNDcz/io2VPnfxzkzvClvwGp4VVS/16B+V11hRXAEM1umsMBQj/mfkcYdm
	FRKuX9i3eV1EjwnlrV4CxtYAXYTjaa+czQWlKf/3CXZStiv2rwZwOzM5rlS2b6eq
	2QmQ/g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3sg7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:10:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso4744706a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 22:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769494253; x=1770099053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EG+LTvaFYz5tDIHZuLPqCOwZqB2vgKH3Jn22xQ26IIw=;
        b=PZEUJPyxS9A63yB8zC6M9o4YU0PE6FukDaQLN8yVdzKXA30rxZKMpBPCDjLTZkRZAI
         n9s/35pCYViTaUmHDMlNykNxY4KArzZY5Ymo6bNNKEZYktapRrQBdklayKYpHIFoOQsY
         OX0mk4RWeCLk415jdNn1uZwsbaOoGzKCeywmmJUmRIvqeKDXlU5gCZOfUFojIm299B7T
         +Zl1ifAxiREG0SxPeGCUxaO+Fw75uvof8pcZggwC6r7NZJ3O8AuWU5S+QZY2kjbzh1WU
         Klso+s34ELEfndIhnlpT2SdKQGMe5YTVAIhH6jQMIkRlnoPV/nhNlgkIUabFvEjPTpSe
         z1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769494253; x=1770099053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG+LTvaFYz5tDIHZuLPqCOwZqB2vgKH3Jn22xQ26IIw=;
        b=FZ/sH+YOh0TrJfZRWyXoADtRTIXkv7P7BdYNNBmcgl1oDNvwIDEx/Nygm7pZ7hNhiI
         1/JLPDTZLkmdp+s2scczKnKcumH9wP05bDvkzMQcSgYcML0R5DDAemnQvl3v488HPtbU
         L0bvRORZiNCDHCBgyrACvvLPC2W5J4g0OiNro/jLnO6zkSD18YqO4BrVgfT14qDa2QNq
         IfDDopK5twjaDbI/KA1Kgrnoa89D/MtENV/6bbkRBl6ZGagN94J0wq84UmUnbhFLYtG8
         qPgsE17oe0C53A6z2Ud22iVyuXnYwoet5GCOEewKrA1Y1LORjX5VOASK9NQER+RbeFFz
         DuGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNbQLg2lOZ/JPjlq325a9tjDe0Q21B45MOGXnaOEqWWjKbnniayAfcMruN2MDbM3kGwXiC6qFVFUoeEl27@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZCgyL9wgQpmeRUfff6V0jKQuMbqbRPMGxiq72X6YGGvwBBeN
	kp/7ZrxWI0wzN8ZlLv25y5nUKBb7n9idI5yXQpq1Oih4nrwrlDBdf7+sezwPsTfv6H670S4CM8a
	LEbG8in1OdF2WmxJ6X6dIGt2xZTmox9JtUK2Blfjo9t2PvrLUuSMRUud8uJvQ84o7smZv
X-Gm-Gg: AZuq6aKeWMhHWIYbgIzs2NXYiep6vBo3JT+OtUxtppJo0QbuwmCOKcI+PJ/bIbbG2vg
	5pDabaqOWEZ5Mk1w0RKUfxX466GPzWv+txZYSOwSfnets5aAe7rvkYlCmzJCC/DxQGyZixCm53Y
	MpeqRA31tokN6OAT9uudUD+S7dV62wd7OHrxrEBb76LAM+uYE9Xx+LMiUVtlo37SqZWomiDnEcj
	9AylmWpQeJ1H35fnOgflHnwYG0B0yOCQMQJUBiObGjjAWkEp1P95DUvoh4bdn6ZW6GV1uJ6iM0W
	FWXmDlr5O29Jf59/TJwcXPp+SQsgGtWuCCwxmnfxagZpyXTTue/f1TJOKdyknqde66sh292TAAa
	V67KDhPpzyP/l1Q+QPstVmRB+nw61Fu9rzpybpw==
X-Received: by 2002:a17:90b:2dcc:b0:352:ece8:1f6c with SMTP id 98e67ed59e1d1-353ff8f1955mr532692a91.8.1769494253529;
        Mon, 26 Jan 2026 22:10:53 -0800 (PST)
X-Received: by 2002:a17:90b:2dcc:b0:352:ece8:1f6c with SMTP id 98e67ed59e1d1-353ff8f1955mr532679a91.8.1769494253014;
        Mon, 26 Jan 2026 22:10:53 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f616f897sm1268060a91.17.2026.01.26.22.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 22:10:52 -0800 (PST)
Message-ID: <cb3a3788-e8ab-4c2c-811c-b2bc4d9281ef@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:40:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add video clock controller
 on Glymur SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
 <20260124-glymur_videocc-v1-1-668f8b9c63be@oss.qualcomm.com>
 <gxbzaayts6esoje4kwak3iey2pj7wu4focdgd3vmu7qr2qqrld@wlaf5kclbvmv>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <gxbzaayts6esoje4kwak3iey2pj7wu4focdgd3vmu7qr2qqrld@wlaf5kclbvmv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xzjp9EDZveFRXE4-xZzJGQaH9zLpCIT7
X-Proofpoint-GUID: Xzjp9EDZveFRXE4-xZzJGQaH9zLpCIT7
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=697856ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Tx_EphR7kuRjRygJVO8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0OCBTYWx0ZWRfXz2RtHaWDy+9+
 d7MUmHpom7KUkqCl1Ta4OUitA8PBVZmxTpQBzD6VPvSRHuLk9TJlN3RKMqVpiaAqQtPsTJS1Fxf
 GhmeTK7E1WA8eYRPJlPiiwT3HV4AbAU9VbgbwFc1+4cRvFAGlVw8RJe7uJ3lVHSD1E8rAIT8pNZ
 dGKwiMsStMzVdiuecTi+IdZLl1YyZ6ElU9jRH3kk5Y54n8gh5uAyhQrKpz63Jz0nNbZn6XKOndN
 ugo0mbHrPmtuQfk1PszCwefPZ0MNuqsbmtYscKdIgGYSiExZF4TIePYiIcX9erDr/4S9uuQl6q7
 xWCvvWejN55SsKYnxz+QJJeO2Tb52ROVii38sAk0C7zgOw+0nAcRQEWngbxo55VFja9G559+OkO
 pR0jHiyxQaaQbvkJKXigMVEmiVptQcJP1C1v4///9rDjjt2rWvqxwRoNZo/efQ9O69ur3tHQqXg
 vUoQ5PmZz/DEAjab/XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90647-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69938904DD
X-Rspamd-Action: no action



On 1/25/2026 1:50 AM, Dmitry Baryshkov wrote:
> On Sat, Jan 24, 2026 at 11:05:02PM +0530, Taniya Das wrote:
>> Add compatible string for Glymur video clock controller and the bindings
>> for Glymur Qualcomm SoC. Add the clock resets required from the GCC
>> clock controller for Video.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>>  include/dt-bindings/clock/qcom,glymur-gcc.h        |  1 +
>>  include/dt-bindings/clock/qcom,glymur-videocc.h    | 45 ++++++++++++++++++++++
>>  3 files changed, 49 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
>> index 10c12b8c51c34c5931c34b4437be03aea098ba53..6907653c79927f0ff32c98c75d830b719ce14d51 100644
>> --- a/include/dt-bindings/clock/qcom,glymur-gcc.h
>> +++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
>> @@ -574,5 +574,6 @@
>>  #define GCC_VIDEO_AXI0_CLK_ARES					89
>>  #define GCC_VIDEO_AXI1_CLK_ARES					90
>>  #define GCC_VIDEO_BCR						91
>> +#define GCC_VIDEO_AXI0C_CLK_ARES				92
> 
> I think this one should be split to a separate patch and paired with the
> corresponding driver change.
> 

Sure, will split it up.

>>  
>>  #endif
> 

-- 
Thanks,
Taniya Das


