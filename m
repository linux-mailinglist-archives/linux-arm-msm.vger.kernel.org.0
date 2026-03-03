Return-Path: <linux-arm-msm+bounces-95091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ9hE16xpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:01:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E60C61EC39B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E36943033D65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8A432D0DE;
	Tue,  3 Mar 2026 10:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPYopv9f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTPxH5bm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90339020B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532044; cv=none; b=lVLdE2TcI8fE+uvysnmK8MR7PPMRPvjlR3hQCH2iNwwDxYzAZf5Pt1rq+NM7pcXVZ8q6auEnZb8vrutbfRBxCV0zmZ2f2dXTPhZd3q5IVH4R7lJySyjMSIQbmVsjfVjEqVeeuAv5TonaIo08wIyKxvwbrv+K2UL4Jaw0qlkQDcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532044; c=relaxed/simple;
	bh=CSkduMzLuQugSH9N3ayAJLUGQD0l8WB/uFUTJasCfW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuwyF+rK6bL4ZluEqcfpBdkbFvbhkAnGEh/tqIl6ff9xBSj8d9+r52zRx2EvRM0DYAh5uS0fKRfZg7l3kEb8Dz+yORws3gtgFH8dHam9lt9Nexc/5k4tunZM21TYITAbbuFJL4nAneW4teY2z0IOGUFjOyhVPckpoY2yA2b0/KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPYopv9f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTPxH5bm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mn003995397
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLoATG47bywi/hNAlW34tJO1zr4FLe9DLmHuoUKLdfg=; b=GPYopv9f42T+1sNW
	slg5F44glFw6KWg8dIjX2Qk+uVVDl/c0oXCoj+1ogS/MUl1KvK47PeFNomLUp+HE
	oRN1m+J2zeJvz7rDLPKk6lwIbf6d2csG/ba9Zg1/x8h2ZVZGsPBpRzRD+HPQR1en
	b6YR5wP9xhqUKEQcHMd5dU39wVYUNLlXzC35JmwuB+bCLb4m1NvKt/P+g/Yt0yFc
	5/c2mYpYyfszCZ/ZtGjhY9QEJcSC0hSeVcpirYIyFWWNTcRg7I0gIzEs3JfitarS
	5fr9HwaExFHtlwH+8Ni60I7Fezkjt924QBUGiJiWzqjPW4aagZ5zywZzQLrrv3cp
	iWdljg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fs0e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:00:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb5a76f13eso347505485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772532042; x=1773136842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLoATG47bywi/hNAlW34tJO1zr4FLe9DLmHuoUKLdfg=;
        b=HTPxH5bmBVB9UcYiGyWzR+bUJ/YNgNUCsjYbFGIx4cIj/TwZ/7f8Zvsd6b8sw/JhCl
         IOT+4G7KbrYT2vL7tId6DMW+jJjtu+VZL47Ep4BnkldF2t1yIGxzAjlhhQ3vTMFzC2a0
         oS9X3QKXNv4OB+NGe1PRMrD00WmYMKXrNdqblz77ZLIJxcLrT3FXs4E2szY4PxSC613j
         4a8afUdG+FkFvZBH/mtq2ZgVnaj0sZ8OmBjIGfuT+W12WgU5D+ZYsSGPyyTyC9/Iv9s8
         g37LpkjQYBUX/1ipGpbI30nYJlWt7jHhwRP+o97sfjWji8RjgCUfas7UU775dvqOyxJ7
         yh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532042; x=1773136842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLoATG47bywi/hNAlW34tJO1zr4FLe9DLmHuoUKLdfg=;
        b=WxkFPIGz794yESgKdqoTWm1/29v15B3az5yMJlC8sSU8GsX/9Oy8Z+Rk1sgXmM+DTq
         LwZp17QbKcU5GrUQzZDvl+15FL9NLc+hfeuHfqZ02DRZI/ehwegAAGUz8giTpp5FwFXS
         HImT/Giu+9QcQHorcHj9e9LtgvMYDlW8nXJwLsu0dumc0CdAki17zyQrH34zXrArGpc1
         P6upiPZsKBjnLJ7TQUUPnOzbpg6DAeMRNpcHB3+Qrvj4vmZy98JiNHJH2HKszho5RleY
         JL/Hp8oppPxnUCrToU7D3zCeQvEkwaTJ7Qs2Z4sojgOD0ZMoJn4lqKINSQbTqKy6bxbS
         +lQA==
X-Gm-Message-State: AOJu0YyjGCBhp/BWSYZ46pC9h2+u34gsbZ9tyEzHDA4YFnEY/Z6WYico
	1j7n/uypqrafDZnD/uwlsTrX7sCt8bbun8fRUk+GwYl5HYSbVa9xVQrCzZ5+BYmNN/HF3UvqTc8
	lzCFHrSlgFGvGotKwhu3c94f5DgxsUmZWS4rTnw/v/X3zxy0hqIxmi/U5KYpnJCi+4l7Y
X-Gm-Gg: ATEYQzzIjPRqtsJLi0sA5V6/ccX9V/0BKYQnzMdTlp4+2rrMghrlQi39PgITKTbNWai
	oh+eNjtG8CxhFFhwmx3C+CZjCpzlKaI7eljojVHBjCMhjcRnjXLPnyfOslEo3TE7YPyqDP18N64
	u5fBUTklpsiPOeTOVOPWnyXKGBIAbth6QvZi26lAZS4NFL4cnphtzY1IxawUkGKEb+dyJyjvdAs
	lf78gKTuG57sX9TyahGSaYuv+yJ5RrDPmOd6hmsx/c1g9cA1GHoC7ZFhzNt9m9I+G0noyDUbnj6
	PfFX65hSWyCTwAV8PRdkkMH8CGM+IDzOkknaNNHNn8Va0wjaJOvMoPYhPNVociHGvrz4SCHVA5U
	BF1cWdmUYKo4yNNZxjBlgMwLan3sBlqX7TqZMW8wJYS1ljtRQwthpP3gu1ipu0qo86qyW5tNpTl
	kOGas=
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1428418485a.9.1772532041659;
        Tue, 03 Mar 2026 02:00:41 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1428409585a.9.1772532040630;
        Tue, 03 Mar 2026 02:00:40 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13564sm576042566b.9.2026.03.03.02.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:00:40 -0800 (PST)
Message-ID: <d88170a3-61ed-4fe6-90ff-16b2229eb004@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:00:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Enable the secondary
 USB controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
 <20260303082157.523847-4-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303082157.523847-4-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6b14a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XZm8HR36WHMZfT71Yw8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Q8nrxaNMrFCCN_lzB5ht6MZPokJpMIcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NiBTYWx0ZWRfX99dMmed98F8k
 ulib4EtqgnTYsU+J46mBtIxc24cG8nQIQWfUvuN9LIyt2VXR4OT+W/se6bfZy4mLjUnvseu90gQ
 +JfqNTm6CW7qUe+WQEAqC9soLnqmhY3p1FpZLmppyHigG7TbXG379dNz3Z+cb1MkdVNUHHPKIGl
 partVhuSdrRViivNh3WE3EO4XjvmS+J8u/W/uTznsLehyLWlXGHTDwkaCQ0PL7r7bpkj3sQ9D68
 oBt/DABAgtVj3zT/D1YYHq5K7PwKp1TJyiBq5rPHDMGzWq4A8Kc55bl3AThsAU4N9rVwTCx+k9A
 rbfnbRw3YugnIfr8rIWkGAyrbN6oqpZZ+mu14S6LeeQjcuzdO0buwDeON5o4R0hHR7ntEf5uygk
 Wpq3SusPCZcF1gN5+72XmaUp/70GN1ESVvmegN2u27OR4k4fUAjxgKEIK3kJgw47Msxk4HT9HJr
 ItKGfYctxY50gURh8rQ==
X-Proofpoint-GUID: Q8nrxaNMrFCCN_lzB5ht6MZPokJpMIcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030076
X-Rspamd-Queue-Id: E60C61EC39B
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95091-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 9:21 AM, Swati Agarwal wrote:
> Enable the secondary USB controller connected to micro usb port in OTG mode
> on Monaco EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


