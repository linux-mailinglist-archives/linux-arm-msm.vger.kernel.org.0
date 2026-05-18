Return-Path: <linux-arm-msm+bounces-108088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOCZNYmxCmpx5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:28:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 313D3566AE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E822130097C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 06:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA1E3DE436;
	Mon, 18 May 2026 06:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GM4wmrr5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlntIq+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990F93DE420
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085588; cv=none; b=I5Kv4R+wHUDv6bAGv+ykGrVnb4qy0SCk0xXZ8rH7BAGQnuGyC8CoFxtG1vKb/Vp0MV3vdmkzCu+wfDTuy8SZ8i3nBV75eB/V92hvu0pK4fGRTS9iXfNWX/4JF3dEtb9ViNj0LEf/i2Rp0Wc9XCrYrTrQUCP6Z0wk4hE5AQkRZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085588; c=relaxed/simple;
	bh=jjz3Y+pL9ioG4LyZO0SNtKu6JxBaKciVZAOTIOeDNJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaXQdZD5p5xDTl5nlEB5TE3vZmaaszY40bSUdfS8RuZ70MG1tT1Uc808XU9TZtwPasmSiPWaqO1+N70Fwv0+k/j4kIFtJzh6fr2HZzYWHIHDtGnOP4O74K9Z0wGiN0FMigiNqrLNub+GYG0ZzgISoM8SfdNT+QPdr/o5o20YYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GM4wmrr5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlntIq+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5enkW1255259
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJx5ROeCjQxor4dcHhUL14+iMhM743IgRkZgfrNQ0Zw=; b=GM4wmrr5/358OIyZ
	pBVTNkpy1Uqs1SIjv/+EsoaIwhurKA4f+YJNGOLjji/yc+WGYKzeZud3VJGIwVnJ
	3pkc3GbxCOx+SWrL14+UTCEdxtZYBGlHbKOmZU0BVqb7M6tQ44Xhf1rV1HgpgR7h
	YgBTDjR74qmG9x4bNBsepObGY/d/S4RNwhyenXGr9KvwL4lvp6gc4i5WK0mw2CZZ
	Af3ZE5++MS6cwikoj2Y5UYUHj6X70Z6RhIjIATRQ38RLYPRwShqbfvcEOlDCrL9h
	1CevsaXGoNtginyJ8yp2wAiGhGZ3yoJohnJw62SJp8IpmfRD4a8AAA6N3OU61+g+
	UyxA4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvckt32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:26:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc6899bfb1so19766415ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779085584; x=1779690384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJx5ROeCjQxor4dcHhUL14+iMhM743IgRkZgfrNQ0Zw=;
        b=TlntIq+vFZnZwhLic5QYi0/dN2n5KoIgQaPBlBJIol7troxW5BRJJZoD/efwVFLTtG
         YzogtLb+WbM1UsYegPQ6HsNoq+KYmWd9fj2Q4oyJK1m2Q1WK/elsJZzv3Y90gpavA9CN
         DSwZ3fxEVbk2T4I3d/dKlcy2BChp/PCuPYTPbG9xDSVZiB35JxIgEKKWSEjcOg71OF2f
         Bt499hFI/PtKq7cFjyWVONxXCE+TO+WuHBgqUcXp+3gqhUKvX+opPex0GWghb7okWKd5
         w+83FEKn42G/FQFVGeCHYJ6hXaQENdQW4I/HTJdt4aCeooQ2tsdBYTxR6ahLekNY5tTa
         NxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779085584; x=1779690384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJx5ROeCjQxor4dcHhUL14+iMhM743IgRkZgfrNQ0Zw=;
        b=SVpevevcZ5k4pYKXVYX0jXacOCDRL1XDvAmsjL1wC3BB9AoJQkrPwgQqzXlQKm0fny
         zbvmYeMBHee1GDqGzpijNv4i3ORtZbHBlPXMwjTSN30x9hRMSHSnRM0+2owksGYX1B1/
         CZddBdHChnDb6DKJaYzBnf3Ssk5NRqIo5pe5Jz2s6WkMnPi/Bf5ELMTJxN9slBGPWKWd
         Y7Ir91k9L7o6fG7h8+zf7JSbREFGMRaQ1oA4BTbL9VQku0q5lNVl8OG6p7KE0yMaDJMC
         qRjWYZFybK8pYwOak/v2NQWQH6kYEzKGmE4BuvF0WXlzJ8lGJRbanRdMC+Td01v86aQE
         Flzg==
X-Forwarded-Encrypted: i=1; AFNElJ+0ljZ1W9RYiBTD1xCtqHk/f7Esw4fVUvNIJOIUn0NMX7q851pprNo+6/xglR4zHK6k1TApWXayRGB6KZlo@vger.kernel.org
X-Gm-Message-State: AOJu0YxU05SMAW5nqojYNgVKZICaNpAvQTmvGOYwwskq2rN/88TNQBfh
	tA1MbCetureoOhNs/C3JwUtbO5LTBzkWTEl0C2It+y50Ldf7GwU6iCFlQ5jhPZ6hbBjYHRsGWaT
	ndqSPX2kpjucVQx8K1PqFzhnK0+EeWfulFsQICuK3A6YkTgKZign6HT9rXho614IMTbZN
X-Gm-Gg: Acq92OFodMaLwUNgxtTQ4IF6hlxKMHyjN6khPgicACEH25fRumwyr8+yXPIDo0sg5XO
	TIah+S1ekY3R8sMBK6+5BE5qK2RNn2jxus5l9r83frD3c1OtB9FImYDNstDhESn2nE8IUpfiZIO
	8WVybeBjlhKDrzfBDgB916NIR8W9JJnze4/4pJiK/Qou0MSpfHlCmdqxX5doylgL0Om20hwnfsT
	vars2K4CSOPOufUl6h95X8RDu02cULUKz3tq1O4dlyy01SAQEmjCyRvMoPE2/5z7wFZqyWxqx/f
	EEzJwIeKVrKe8deWAre4Q0+qtxVN9npaiobl4a5s2BUkIMHvosVYBoH5QNTS316QMizdX0W5Cn1
	XwrN459tKMejmp9rxyrYCdWqswZhqUq7w/6TW6hpbpAHzTm2zAcU=
X-Received: by 2002:a17:903:2b03:b0:2bd:9da9:a29b with SMTP id d9443c01a7336-2bd9da9a3a9mr100296885ad.5.1779085584218;
        Sun, 17 May 2026 23:26:24 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2bd:9da9:a29b with SMTP id d9443c01a7336-2bd9da9a3a9mr100296565ad.5.1779085583727;
        Sun, 17 May 2026 23:26:23 -0700 (PDT)
Received: from [10.218.19.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fbc05sm134371195ad.57.2026.05.17.23.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 23:26:23 -0700 (PDT)
Message-ID: <d68ea0df-f275-4b9f-9fc2-154d76517135@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:56:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: qcom,bam-dma: Document BAM
 v2.0.0 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
 <20260514-knp_qce-v2-1-890e3372eef8@oss.qualcomm.com>
 <20260515-prompt-determined-ape-943cdb@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260515-prompt-determined-ape-943cdb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5pDRnUIJZbi9LncvNXfSk_HAkbhRY4HL
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0ab110 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P5E9getwEY79pbPPo3QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5pDRnUIJZbi9LncvNXfSk_HAkbhRY4HL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2MCBTYWx0ZWRfX7ilWPTyDH9qP
 gOfkOo7AA3BnMtutIFCecoEUbSbvqJjHzPx3hCMJmEzsflTi81XHnl6y22dFZegV0GztEaWWZxw
 5jrx+EyJlUSXv5zmSqF4IGaTl0YNEZaHUMrtq8HCIy0s4pL3ryeBvwG/CBrYoMTdR/11AwifgyN
 TZqugjpqLpFbad9vH/PoL/oi6nLkHRFrjpPF8mVfA/cm+R9H7dG02s7479vnTYIdltADfQMASU/
 GdxjPVFOIO2nCRA77FiAc5c+pucuCjFRshkNr6bczzUKyDPIybyCDxVd5UUe4O4qYwS3DLCO0C/
 AiJQRZ8++jTp+Wd0sUoWMAZCJhLir+963NVpry0eJLlvitBBUQ/+t7S6+q8iHI8WDKKUS7r4WqB
 R1e2TANg5+HSxR/yw/yTJK55ao84GUF9WbYSZhPaqOPOsMeYCsCd4I0jTbmm0xSOOQ3ILjz2Ykg
 3Nzj/J/hXbv+Va7OIpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180060
X-Rspamd-Queue-Id: 313D3566AE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108088-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 15-05-2026 12:23, Krzysztof Kozlowski wrote:
> On Thu, May 14, 2026 at 12:22:20AM +0530, Kuldeep Singh wrote:
>> Document compatible string for bam v2.0.0 version found on kaanapali.
>> BAM v2.0.0 differs from the earlier v1.7.X revision in terms of register
>> layout and offsets, requiring a distinct compatible for correct hardware
>> description.
>>
>> Also add a new example for BAM v2.0.0 to illustrate a more complete
>> configuration than the existing v1.4 example. The new example covers
>> 64-bit address and size cells, IOMMU bindings and execution
>> environment–related properties required on newer platforms.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> I am not going to repeat my comments.

Hi Krzysztof,
As per last discussion,
https://lore.kernel.org/linux-arm-msm/2d79d1b6-be1f-45ad-b673-c8b3b57f1e15@kernel.org/

Intention was to improve commit message on showcasing v2.0.0 diff with
existing v1.7.X versions and also what extra the new example is
covering. I hope i mentioned it clearly in v2 commit message.

May i know what extra information you are looking?
This helps in aligning ourself and incorporate all relevant feedback.
-- 
Regards
Kuldeep


