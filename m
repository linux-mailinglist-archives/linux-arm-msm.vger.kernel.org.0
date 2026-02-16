Return-Path: <linux-arm-msm+bounces-92924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIgrE1P7kmlx0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:11:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FE4142B98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1907530011B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2039822B8A6;
	Mon, 16 Feb 2026 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsPiLX7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6ighCCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FEC2D4816
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240270; cv=none; b=Ohhq9NtiMk79NuEGdOh5Gr/4xUIjUBbqLAh+aQwzI7Doroxmp6KJtUHJRNF6HM1rO6ygGfbJ+4HB14RTkO9tNuK/lIiXceXEOmgp58fGloeNQB0KdBjK+t9oG3BZmmScuFu5KU04OpDV8l2SBIH6OoW2mnmOq/wW8QLzlCLdWDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240270; c=relaxed/simple;
	bh=J0DYmeJ24QNY8XrRGgU17CiiU81oLNvFjXYiWi7LUFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I44HkIhfS8dHqGB71vv1bCUCUViiNYHyjY43s/fwyLqH8CnPHbdSOYcf8J3VpOf/J62UpFFxoCv/WhvEhOSZM9MUMIYTJK6dyULgcwjxSo857NWvxFekNEr+G8tFle2QSfCUE20dO0kfRlQ8CNWo6DWs3sUnGxzInLxpiuRNp3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsPiLX7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6ighCCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G24cku2522870
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/q9oA4QaAQWaptHrf7SMRhEzRQ+f0+jdW8gtuVDdY2M=; b=YsPiLX7YPqrA9avN
	ngzi1sUCQsH3AMA0BVagNxcOXMm1AOEyYj+Dza58JROu49FU0FDwWqMXf9iiCtsv
	gSGix0V3IC3FHIvGumuXjCXl4SGdfZ43DVGYIy6CBoqeoam5gYCDkwckPbR0Fp4Q
	wjsWc4rQJajSg5vVnbt2b0hhw6hucKhvLIPEE94t/4lOwLO4ZFyJ+hFXinzMwqRh
	kM9JPSr0JYQIvcUZMaHrMYWuNX9e6ICWEgpo20+IgiW+2VUEbYikQR8tpw2m7Hoy
	OD/vaPmQNMQjeA33CJMFIYMkcrRJAV3p81Mp2clNkjSIZpHdoZTpHtZhB/J4Rawg
	9oJOEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujjy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:11:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506a3dde543so24661941cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240267; x=1771845067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/q9oA4QaAQWaptHrf7SMRhEzRQ+f0+jdW8gtuVDdY2M=;
        b=X6ighCCO4eZOJNN9sfOmIzEyuxMzggaPJzvxovi/Zm8EpXjOJZxfm5CTsQ4b2DAHNH
         j41wIM3FCGN89d/GdGhsm7WezZABj38OQCag2WBFRxKAN0JvTL30WobA3yaVhGZAbqzi
         qqruuFL6F9XooTaqdkjkHKzzGHitVoLqJVohBsdx9yw4GiScUuNfEfKMQPMMn5ojYuy5
         rEeXlQmwH3tnuJlVsy7gBa8w7Rgx6qZDS5dRl6E9NgfVngB2LtFGEAgYM9IXSY19KeLp
         lnLrDl4kBac4xIRi2AFbbgU6ClQS4Nahu9sP943BPRg5tq+ietkUQ5rPK7bfux8mckL4
         chEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240267; x=1771845067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/q9oA4QaAQWaptHrf7SMRhEzRQ+f0+jdW8gtuVDdY2M=;
        b=R36rr+ybhEb3fWTnohwPzXTrBXq3cxbW8UcpG4wo9lvzSmsnLuCx4qeoE9Dg2kgoWl
         WYPxLgmEaQZiyJHd8LKJH/gAV+fHZ42/7D9X4iZMq7IdgqR1Pk5F1FjpF8OwlG2ofb9F
         9Jcn4EXwM7qCanpt6mnXT4gGbt49BRBKhjBzeocYzU4g568sZPciTu5NqTbE05oWgqG3
         3sK7Ui9HrZU80kWu+O01HCw4Y3107tix7/0ybMjjY6o/TUApRmLB2Vp3GLRM6B3kbWNe
         HTGixu21xBUkUwgOMJJTZCSr2EtmmCR/y4nugZevEnHeqrCi9+p0kr2BIvaSuF1LCKUt
         pQ0A==
X-Forwarded-Encrypted: i=1; AJvYcCUTNmuKWNWU4+4F2R+ffPnBWDBvUihheuYXfB5/B1I69gyDar+7LURmaFg8B1neKt04O20zBhI4pskCcXwO@vger.kernel.org
X-Gm-Message-State: AOJu0YyFM76Qx2RDk/GqYJtiuko7K0naya56jijkSrhVr4RGvvf+y7e7
	wEIACZcI9ps3C9671t2FF6vwbNSGqLJPj7F+N7xQwiSzBRCk1Te2si1ci1W/OFJ7egjCMKIRw6P
	SvoYMRQdraCgR0VY6rBeR0Oi2pGhBwuA+pGuSu9OZGbHIpFx9dt1iagBmEe7WBCjNu3vJ
X-Gm-Gg: AZuq6aJx3s9nrwgD5fOheTL6BCHM5ClTR0kKNVo+VH1iZyFpYTGiqhuIjwggjLb8v9X
	DRfdcMCG/XWyyhSaVF3vohgevGfoDz32qxpeBaPl51pHkYdFiv+tmZf3Z53uYHvhmr01ClLKKQg
	gjZGajp2Qn8TpZ0LVWUrOoqTN1w0Fl+V76Mfl/VeVZ7uOhivO8wsZwZ6/hLwxO1vFw55NnQzL+3
	JdKGMuSYvwynyt2gLoZqLgaY/znm/a43/tqvXQgsWNj9XZc3XooUw3zCyxB4R1us2yN2Q4HfDkN
	IiOD9WvjtLCxL7nW2USXI9HywM0EQHfxl+WS7B6Yyf/YiQlduyrERwtx807Y2BVCy/JEPnL0QVY
	HJZLkQe74CW3wdk51lZ5wvX3aqHKwIi2vjPTyKCyeLQvJg99vvKCyLl6E/lCkNeUDPoYKGd+MEe
	xwnLs=
X-Received: by 2002:ac8:574b:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-506a6a604damr109372661cf.6.1771240267450;
        Mon, 16 Feb 2026 03:11:07 -0800 (PST)
X-Received: by 2002:ac8:574b:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-506a6a604damr109372281cf.6.1771240266816;
        Mon, 16 Feb 2026 03:11:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad4faca4sm1842768a12.33.2026.02.16.03.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:11:06 -0800 (PST)
Message-ID: <f18d6c73-c701-4ca2-b017-7020559d547c@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:11:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware: qcom: uefisecapp: Annotate acquiring
 locks for context tracking
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216091525.107935-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216091525.107935-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hLrAYOf6dcaAl5g3o4nz1F8ONz3gyAtt
X-Proofpoint-ORIG-GUID: hLrAYOf6dcaAl5g3o4nz1F8ONz3gyAtt
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6992fb4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=crJP5yZ9KTMbeZK12yIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NSBTYWx0ZWRfX/TLHB0Iemi+8
 752KNO5pEx7CK5x+7LB3gs758vg0Bp900c5DLbfhR8MmVjIFMw3i7BO012p1j+cPTA4h8Bx3pZ2
 WCdO9gRLAu3htnRGeXzjLPnZ5Z/H4insYEzGf7BC1P6yTUeww4adGcumvO+JcLahzNJNppRdznn
 taOHAAw4jmpCDtFfi2LrRYJWml7IKdXJ6FehMLZjFpk81Kb7KRs5v1WSRljGMyO3LKeTG/LaHG1
 3vmdMuUqmYvNlOT8P5VOjI/+BsKWszcaINV8rodtiIxAeHSFoii2DvB82HfMECWvhoE0miY4b/o
 9NZFuxWPxIyECujbpLZvZVFBgLxN1yGYe5k+VFdbrvKO3kF3D9g4bS669m8Ym6kzzvVY5PLk9vc
 xghpozMl93v6uFKZBdKLBqkJonuKmFzpflX6ZUZwUripcdbPSk/t8BnGTqskVb8qC78v8IsQgXq
 eoZoHKBT31MFaRbKPwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-92924-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76FE4142B98
X-Rspamd-Action: no action

On 2/16/26 10:15 AM, Krzysztof Kozlowski wrote:
> qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
> respectively, so annotate them so the lock usage will be tracked by
> context tracking tools.
> 
> Note that mutex is tracked since commit 370f0a345a70 ("locking/mutex:
> Support Clang's context analysis").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

