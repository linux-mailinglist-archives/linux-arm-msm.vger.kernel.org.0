Return-Path: <linux-arm-msm+bounces-117114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xqSTIRSHTGpTlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:56:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9617174E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:56:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ezh0nooI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MqOfvGE+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117114-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117114-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 176FF301DDA8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 04:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D039A3783D8;
	Tue,  7 Jul 2026 04:56:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F161361650
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 04:56:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400210; cv=none; b=q0Va7vZLWlocP9sL/5XWL/gNODMYtzT1UywWTMqQ+YOltbFKd6sYnLwNoVh5w73m1kSIUPA3d7ogQhFsUsLa2LipJ1516iH2buhhw7jrqWQDy1sNBl8jOtEyJ2u5KN0jO/0IBCFsmJEJHC1T3haiqMzd0OdiIQ34s11XJ4Fe1IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400210; c=relaxed/simple;
	bh=vXz54n66/TEAdayCSDoHBwW3Q45l8xugwYa2FOxX2QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATpdzKiyroICq9AhtK2ioRubrT2zeWaqAETIax3qMgc1V9CDD2+bCodhY5tETeuHzMsEqJPova3nwOVj5t9VFbTkfx1D9ea6R1D+rbUHPXBkLnQwtm73oXpgUkiDDJ+seOPf/1jJv8M3dg19qBy2twYApqkXyWNkVomMJmDAZKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezh0nooI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqOfvGE+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748tHg2629813
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 04:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+d+gXhoD6C59d9ofbkaw9OT3pWH4Qy/IVK3mTBR0HI=; b=ezh0nooIK/ACSQ6L
	Tmsys7GiwEYTUB8Lvjr6c1O+HQAwy2xon+esbIBRn1No1wvzN7CuJJlgSjlNDyWn
	vVQS4ZxzIzoZwv7jlT+Z4QKfFzpgjh0eHiUxknXBOKf++3DcWHkj0skonrp56hB/
	RNKbqHfHEzJ0MEj/5OhypGysfJ2e664JN1Oi3+MVKxMzhmHwsMSjWTW8Utj5jfHw
	L5q0mVC4qSUbQVvKbhMq3UIiWaSrjgM+rM9X+2Kaq3DudgCUdLHevx9WqCgAmwh3
	yEYo4akDrvDtjziQv5kVOondJxciyEgWdD7ryfgaEYieY/AMoUpHsicthaYR3DmX
	t6yBrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h54j2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so35696195ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400207; x=1784005007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+d+gXhoD6C59d9ofbkaw9OT3pWH4Qy/IVK3mTBR0HI=;
        b=MqOfvGE+3z2POHOM5jlJTIXTt+BFgVkcs1K9YDTxiKZxRLEBs0iSym7/n+nAb6KM29
         HVXACncXx8wVg1IeNM8dWc5HTsyRWBKETaU81atFT+5WtPjKNIW6JqbSBS7blLo9lfwU
         70rTotxWZC0K7D3CRwuTH2DI/PQ7JuoiwFRtnF6sedMhU+itlAOEg4iBCUBsCNP9/uKz
         sw7Hc14+8nSgBNPHCtfIH36uf1Yb4fN2D0D2p++DOoZNHLguWPxkDB16pi0JS0w2F2JC
         K7BzfKK6mq7QbjS38i3cjRC4nlM/VdSXyYazVkDDeYOt8oesNyoP95viA9h3HdD8TeNu
         E6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400207; x=1784005007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+d+gXhoD6C59d9ofbkaw9OT3pWH4Qy/IVK3mTBR0HI=;
        b=R6rsdN01NRlDaSPrYUQ9t7WDQByCk7Eu6v6ij5NbBvP+kWhixq4RqpbWWUcY3xPHgV
         jkt8H4AaeUHedCItmGyK98/RTrpR5VilpnK9Qps0xQ+rsGg8pxyTWFwQWZowPCix3sbY
         gJj2wUuxoYDl6u47VNz3uqHq3buxDGF7f/ZPK15nKbMKZvtknc3Gtn76Eh10rz8/6ALv
         eA794xSD+am/gWh2CmP5khZjDgkoL1wOun+dOgI/aWc4JI/iuoR1GU0qyyEw00yuxf+v
         OjxVdRQpGH1jkWfO7XZACOC35TIFGVChQSw5aqtPKyD3vOa32Lwzofwp2ZTYHqXKey5l
         S0QA==
X-Forwarded-Encrypted: i=1; AHgh+RrwJwoXdcs22iCl29qKZlVZtMfO8uEsz18s+QEXD1lOCHsnoSQICLWsJWcEbo3aSgGuM1GInd1w3Mqh9x3G@vger.kernel.org
X-Gm-Message-State: AOJu0YwhykIhZOoyCAHFEBCKc++FGLlMyfEdFWlqsgAKfKNgRMamRPxo
	YY/xUjvhUYD9zHfwfPR+OQjCajBxZ21ZqxZboFjLEM2jkPgblGXIK+ODS8v8d6fpLnPI1gzFY+R
	qquiQVJ2hvvkNCZNBkyI/fXg6C8lbDDnY18rXrj/EOdlKOwaaE0EF0bxWwG6milRd2A6y
X-Gm-Gg: AfdE7ckmIzZ5psKZl2YHulnGzFWcv80I6k7nX645PG0tPQSKliS5aK4JA5TxPMHVtSL
	LCz4+Mf8ukJPsnD9y9473tprjPNSaAyGFw6u0ZULlUdUO6l4fBJzucZtb/dKqDdBw3As4GAIOrO
	ulWb/Q5mpCk0u5EB2y7osBeTzW+ONwZ/cAgTwjmqnAe0EFs3f6rd+MW45ztF+NNBOWzLByH1Ww5
	+16OCzSWbLl6WOV8KW2mbqQYvWr3569VTBSs33Y8QC55ImQaiaQpZ4IpuKBtfZHmKz3eyyU6+W0
	BRlCdyy/jIaiDXieYyaPy4MWN5sXxjjIjqOcApfZtHoHGl3fPndy1fEdOkcjnrFWyWllkruorsp
	4mt70pl+WMJw8uxhTF0guix+T9aKAkXvnU6NOFaI=
X-Received: by 2002:a17:903:388d:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2ccbf041c76mr36039835ad.22.1783400207528;
        Mon, 06 Jul 2026 21:56:47 -0700 (PDT)
X-Received: by 2002:a17:903:388d:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2ccbf041c76mr36039655ad.22.1783400207101;
        Mon, 06 Jul 2026 21:56:47 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm4515115ad.77.2026.07.06.21.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:56:46 -0700 (PDT)
Message-ID: <47c19ac0-888a-4488-af82-70668fc78041@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:26:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: Document Nord display clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-3-860c84539804@oss.qualcomm.com>
 <20260624-logical-walrus-of-enthusiasm-adfeb6@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260624-logical-walrus-of-enthusiasm-adfeb6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: adc2S2Z_FuqYS8IO6wGAz8ncyswvLY04
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX6z4+MBxcoi+J
 Fxb2wE4s1cTeGwHrOHWqZT9t1Eqq2uvzxyF/uK3hRsyw+M3hCIkyi9+1v7aoIR+zDlqacaVII21
 vQBXqg9L3TtfHovDyOf/LyGuyQQadSM=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c8710 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=-EAjTSGrLCXS6oqRX1UA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX+u+wwKMRJdUF
 FLcmfJmEniteNxer5kkNs3kQGNRlsro8rNF5nROrxZF75CnTK+GUrVGbLZdIbTuR2VHckqw1iWT
 eQ/jZX53irfsOQAV96CgGs+Yz9wwYJORuJT4Y7lc2IdnhkUfGK1L0Un8Z2TiClF6B+YZeNGo1ih
 YLkZpx4hfbP5kpcd1cbHX0ASYR8netwaGb/8FsckBw5L8WYQ9iXs85vaETxOQG+YqzbZLyNR7Xc
 ZCDgJSWWSKCaYD/2NAUR8exmU75fbf3A9LK5VIMFPBnm1SBLrYENSI2H+oC8/Z7aur/2rQX7u6N
 Ow/vpde1L/IjKqzhTvBCC8IQu1dhbl4FlhIkylB1KwtuQicd/UKx6miKJ+AatJ8wfeWCGyjyIfz
 Sm7v/8i/1I6gLcMmkthJw1EB81QZBwQGqyem0bXXhxEeF0NyPTLbyrjTZp5YQjVcxTlXs9abe34
 rBIKqY3EEdDlocmJ+sw==
X-Proofpoint-ORIG-GUID: adc2S2Z_FuqYS8IO6wGAz8ncyswvLY04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117114-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F9617174E6



On 6/24/2026 1:23 PM, Krzysztof Kozlowski wrote:
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
>> +#define _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
>> +
>> +/* DISP_CC_0 clocks */
> Where are clocks/resets/power domains for DISP_CC_1?

Both have the same resets, will update the comment to capture both
DISP_CC0/1.

-- 
Thanks,
Taniya Das


