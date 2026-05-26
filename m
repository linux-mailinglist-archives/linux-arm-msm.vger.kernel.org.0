Return-Path: <linux-arm-msm+bounces-109801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO7JNPKGFWpXWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:41:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBA05D5085
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF390300C3B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245623E7BC4;
	Tue, 26 May 2026 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lus2Hg6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCmOX6VS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DB83E5A26
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795644; cv=none; b=U1k/tjcnE3iIjAhONmd4gJTWgxIi4HCc/F7FNzREYmURVxXEebKYAJeZgK90lXgGx+LGt+O4LQHIzWthes4k7qWQdFdsRCTgBim8zix/NcviFuqfMRTJ7iN2FiyCzUVWR0KrRV9Rr+Np3c4PffosJwl93+yeO6c4wxyFPcIr3Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795644; c=relaxed/simple;
	bh=JBFoJ4hT1uCX+xbcr1U5qvxYhhuwb/y8yealtvnKI+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeyGtt5B8laeoaKp2CWkUaQ3lFk5dVEUpEdrTivfb8F/EpM0pp5Keid+YQIcea0v8c42a24xiOiDyff2Gj986EHCrdA5gY1++2B4U2nAxU0mA9bRTNNZ/YeQcDMUbteL+RmAOhbJQdr2IHFEepyg+DjNx8Qz3KjXUQd3qCjoIVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lus2Hg6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCmOX6VS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q71ZTg1580322
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=; b=lus2Hg6hWVD/Lvw0
	a/WSuZPrzBJ1wdgjRoztvLzLVSbxIO0b5jdcKAQ3qMz0pKfwnKazFXX+NAv5Uh1J
	GO9Kb+AS1ZSwJglJxzx8xs7SGKmuU2Er9bBh2OrrOTkOT5vZoKzPTGooa87Z7F/E
	Drg2lW5jZdbOkPoeeXTChzTpQrYlsyAwQ+DbBNBLlfNM8f/rFiPJ39n38PJpHh8v
	Ot2p5LuZlmdMov5yDtAu+nI0zGC4xAxL4SpJGRQTxEIXxSlYMArsWioiUFAOLS5O
	J03td3n++mRkTQaYB9Jd5+rpaa1fJtL38M7g4epaQZT51I9uUWe1HPJ5CLSGqzXh
	JilIwg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmachcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:40:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so5084426a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795630; x=1780400430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
        b=XCmOX6VS9Sl7APGJ+zwA27mJcKkSTF8g2qf88JED/ycgdkeitjfe0KqR94CcX7KqRd
         Y0fL8TksQ5ceM3X2ekdJ3VQWrxT2rACDvY9z3t/corBKpg+tu2Da2eZ8BJtJvqhPD+gD
         ATulZRu0GyiEx7pluyW4N4XbkHjeB+Vf9Vp55aqe6eGj2wus1gSlsCo6QRjmG7j6wDpr
         id3zUlbiflyzq7mHy5yWKTj4c0bLiGVAcbgtA845//FQwJQOXwe5AueQznRHEOCtRJjG
         MrxmRCWAN0IIDYubB5Sy12C4pujAzzu7ZNZafYxRIzLBLIYC4bct/qefuX8LOHFkAqWA
         yZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795630; x=1780400430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
        b=FrvImHNn84VkEHhgBpxNwhJW8m617NfR/82lriJqe9AQbhaAJFOLKzOXb7XpMYAbHB
         QDai0inbV1QMetp8c1vXJ7zWILJgaYOp0PW0Bx7JDcJAcfpgMnygdMcl0W8koTh8dn+H
         6Mb02BzHr1QGs5FjaAjwbBR3YdWBRemTpYbeyTka2taHTMcdnJLhyfLtWje+eoB2C+Bf
         ABoNmeS+CDRRX1c1BkjyCbIFVrp4JiPJ9JOIsa3W67O3zNRNlT0I+IkwHYemeORWMJBB
         uzUdGQc754dCepfQFDdu7y/wgdtvTXdghjX/YzCLROsK06K8NL7H1bx1wf17l4dq6GOA
         IecQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZPR6salNHHH77OFN2HLxvffAmRIxvm+XeXZZcxIFwyBVFRUQiunZZq/Z645ppYnllEhEJR9avulkHGmBT@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVIiFn/tutJVkP4p+eo5I+QMOGu1OEj4JP2bebFFGHcQTrVMB
	wYKDqDFmVY3JW7ob3WAeP8OupFxcsjtk7R7S5FlodUTJeYxJ/i/CpzVS/w9wIzno3+0TSlgrW9H
	ZA5FvSKfQfjmNtgc0NqcRgPMPYhW++0mYVgZgTtglMzQ4ydBfZZRwUUeonE0STxD0kBsi
X-Gm-Gg: Acq92OHUODRKoQ8ccFDVw74QwFx7zZcF6/8bcaTzOEzgxWko/+V83Dyggsgeu2lJxY/
	seEupKQME3gZtxvNbZWuXkDdM02ROTWjgTQlSHBxkcc8M1SBGwDpXGCO0w3h8zm68wJt6EqKImx
	eu78ck/yGvOs6tCYg9JeJpqHswDm75XtWIC0Xy3o6cWro2r8S313DLs4GAHC4JadWYs9gt1rlQS
	5A7B319BHBLjI09CU2neaz/LJnxFOH/lK7GpHpyyJ+R5yMo06CXZlwsYvjG6B0kN13uTyHmq8oc
	aRNb++HkPbEO5Rh01yHHgEACoWPoE/bUqsbmSupEvnv8J/hzlB8HBO0f8QvFXRHHG92bfjpmkrA
	2+NY2ggOEeuCZFW9NmpKx39OthvthV/TGan3vIDfHFV3DnDtE
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8415f0f02cbmr16834760b3a.10.1779795630306;
        Tue, 26 May 2026 04:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8415f0f02cbmr16834735b3a.10.1779795629827;
        Tue, 26 May 2026 04:40:29 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1b3d2sm13869414b3a.26.2026.05.26.04.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:40:29 -0700 (PDT)
Message-ID: <59167c7f-c758-4939-b760-b6de78c22359@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:10:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a1586af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SSzA4h9mN1o_gDQ-MaQA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: YvkRJBggF9dOjbqr5jhe8BmjsQj3Afwl
X-Proofpoint-GUID: YvkRJBggF9dOjbqr5jhe8BmjsQj3Afwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX2EoPevM082cw
 YQ4o5MXHukBLd6I1qkdHJyFAF+6Gm6Q1oCwcK+aqcyAWykWi3e7qEL1N9IAxxPSw3+/tPGGg324
 WVHEc2kbhpQEPmWS4mDZcOzzY+w8Kz7AMa5iJyRn4lV4BShPyVxno29xvDcjZTJnsbrjxIDQQIj
 haPx0Yi51voCadoTyBp00uqVOs05xQ5yi4/xTahDcS0Pb7o/87mLlUEVq2oY2SogsurnojHA+oX
 qNxtRiZ6rloda3uTgOuZz6RTEVHh3b2LVSNmH8ZAzHSFJOOpPBDW0xMoZ5qVLp6Gri7mRuvgAYf
 Kx8KR5+uFa3bI3i4xrwDDvzCj8NzOE5tXH+eW4IYGiOdHl05I9w7KdbuWR8holznCXcx1bB4GY/
 jl+wtXoSYGFjlK0lNkIN9VYixbbG9eKHXjdHRJAIhU/92TzAJtuEou1vIxbqrxNTIHrJF/l7nbk
 zYzdREeeEVbXmtW+Zgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109801-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDBA05D5085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 4:43 PM, Dmitry Baryshkov wrote:
>> The patches have been tested on Qualcomm Eliza MTP board.
>>
>> Changes in v5:
>> - Taken care of comments from v3, v4.
> Which comments? Please be more specific in changelogics.

Sorry, my bad, it was the 'sashiko-bot' comments.

-- 
Thanks,
Taniya Das


