Return-Path: <linux-arm-msm+bounces-99300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YExtDjdWwWmBSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:03:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D322F5AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A1113020A68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285D01FC101;
	Mon, 23 Mar 2026 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cFtVLiHJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2iRQz2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1341A680D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275915; cv=none; b=OKxOvfBANN676sbyKo5zTN6n9LbUFrcZiyB7s8rvf38mDIEMBoIpZdzs1spNOFC8dlMlQkAiurqtAC4evJulh1gBP58Ia90uEKQZBZBsyahC3tbCh4bYiQQOGwWKzFF1cf0SGqjWGHEZuf+drnKxLmhzfIPeqV0E5+llJarpMdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275915; c=relaxed/simple;
	bh=A4S0Obn50bo8Fl9QUE4Gbh7lE5KgYdMRk3kjmHc2cK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/Ogl9PYnQw6zmCZb5lobYBsbW8wU7komvmQKbsryvBkW+lOAPy+vyrzW0Qb5j7bBW+OBzZSqlHHP+hlL2Z5Rh60tAZ70CphErrkyN7jyprmuvcCc3JK/zamK0UfhsWBBs9VT1E99OW60U7HDfi48ENv3D02ur2axr4UgrI2rcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cFtVLiHJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2iRQz2C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDYt2J1627158
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDPM+iygguEo6RsgHUPPflP1DE/XL/8HGaRlTwa3/d4=; b=cFtVLiHJ404HcVG5
	6NWuRBP8NMHwrTu1X426qgKFOB6/OYBqugspSSaWeK9vaNavhkTHvj+vghMapQbO
	d0nKtC/TDJhxvsLVTRcFjJfKG5JMk7Nj+h255tU+k8e1C+iOIrPwrrzecDX/uh3p
	oKEBkDJgkLUh4BSOcl7fpie1p1D0c+4UqsoLSPBX3oVlkCDLWWcANEF3NCBo0ChT
	AS/ANV9ZvPU3q5X+2wG1sTr/qRi8pNU7gytneNgnsgGvdCRp95YZQ22WaaqPlCdR
	LSY7km0ajzXBL90CfVuT2heJBd2HuVW8WHgzvcsDoVFopp/Jkp70xiAaeXq++Ope
	x6CPVg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc1cyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:25:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecbb78e44so206407685ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275913; x=1774880713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDPM+iygguEo6RsgHUPPflP1DE/XL/8HGaRlTwa3/d4=;
        b=X2iRQz2CF9Ie1LIq3ECasRYcsuCx0RY5pr126VSwQzrVCkWR9RSE8RTEIQ8mbyR/Qa
         Ht+hatDwBnw6SOe4vmL3yxZc4h6MdrvgVnE/WEiv+GU7bVS3PD0Ho4RLePkh2mvyx9cg
         FnPxBgdmnpsrxOqdY8le9V6/WB0NFt3EhRVkFUxKDdFcJ5FhOMa81njMiRb/6yC6AGlE
         7df2sRvhxIETNdI6Il+pqXUyT2ocRMnZy/1rT6mGn/62zM7yPftcH6p23odpe91jGcks
         whRdrxFyXTpniU3iQSvEy+dwQosgRb+XHaMgQxrJ4YYkRKu9Rmg5cVi6S9vSP9u7oryp
         DtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275913; x=1774880713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDPM+iygguEo6RsgHUPPflP1DE/XL/8HGaRlTwa3/d4=;
        b=jfdLZnx7wKQIuUIeptlG1V9bE2IQEDnz4faqldAnNSBeS9ZciLe4KUqHVAG+yC7jEQ
         HVWblPnRCV3/rCEIAEPQIXsWEGGV+PwI45nAR3wxUPrZkIuXCkWd06h8R0PirZZDjO6t
         83Jii2eyZ36vHsMiz7bR0R1hf6UuYUEoxYXLPKPkeQ5htNhm8BkcEGnQqHWXqmNZPKEt
         aGIlPaQHKWIvfD+4pssV0CEJ7icKPNvqchDPWmyEqxg7giYrAjwvpiyauFOA9hJnoKyt
         W/P0EvssjvLOX3IdV68V/XdpArS7+hGwXSBDz52gJGBGPjldPbw4/md25KuYFwgY8Bvm
         TANw==
X-Forwarded-Encrypted: i=1; AJvYcCWEKE6IfiZpipipR1Q9G/xGSP8DnVxnycT8g/yGHDCqy3cgmB6uMcR/0NRRKPoAQOU4lePP/JwtQAwkwqa+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88Ur66NUxm0c9l0Bw9ecx+Z0WZDS1HOta9kPUYL6as5pSDtS9
	J3EF5a/VmG6Pmmu9VHMxfs5oRaZesDHUoC+Ey8tNbby87HLNUfF/+w6iLlU5BW2LA4zFR6wty8K
	gDmvIiDLHjvG++2fqWNhmehNnJQ8bjQbhGjg2deJd/+o59Pv+62gTkulCYwaOijlheFxw
X-Gm-Gg: ATEYQzyeIGjd9ae/A9b70cms+N7uKCyZpFS+ETW8q00CP3rirSN3sFp39DWvbCMe30Q
	041tuM96X10mW1twr04fq+SrrRoCBtScpa/DrdJdXOyvIxAaon7ekAejyJtp7G0KgDzT/zEVR/C
	NpZKHf/wsxwX9wF5gBxVxJhjLar2HX74MV9gVyXM9+RB2tssNkvaspGBvpbC9gm5LM+k01OSqmv
	FqHFFn7MrsaVk6Bx3VVeSp1cmPrcmyJDoxJIc+8Av1cHCzbkyTay4TJrQsf1PD1QW2ZLTxmviGL
	0KAF1HC5ZiIyKUNnvgSeqgOA9CYiJg4ecIuVdGFGvOQjdvFHNZ0UDjZYV6g0ZiYiTVCszsG0bk9
	v/tYxrNcl8BmHcnbeMhTW8BeU0gZAeviW1PuejkNpffrhUAu1rV+k
X-Received: by 2002:a17:902:ce81:b0:2b0:6999:ee5d with SMTP id d9443c01a7336-2b0827d19bemr121140995ad.42.1774275912834;
        Mon, 23 Mar 2026 07:25:12 -0700 (PDT)
X-Received: by 2002:a17:902:ce81:b0:2b0:6999:ee5d with SMTP id d9443c01a7336-2b0827d19bemr121140615ad.42.1774275912312;
        Mon, 23 Mar 2026 07:25:12 -0700 (PDT)
Received: from [192.168.1.19] ([106.222.229.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3370sm112429015ad.78.2026.03.23.07.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:25:11 -0700 (PDT)
Message-ID: <c6c716f7-fa49-4eac-b177-b88ac07c83a5@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 19:55:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
 <20260128-whispering-caracal-of-respect-a26638@quoll>
 <36706481-2549-4716-8e6d-0e4db42591a2@oss.qualcomm.com>
 <546faeda-d896-403c-a449-5c9b0cd7159e@kernel.org>
 <17474333-bb82-49d7-bc04-45ab21095c38@oss.qualcomm.com>
 <ae4c1f7e-8f4c-4ce0-a6b8-bab29984e693@kernel.org>
 <c6136314-5bdf-466b-b19e-43062fb11150@oss.qualcomm.com>
 <e6679f94-2648-4d35-80cf-d3f823f9dad3@kernel.org>
 <4f815a0f-a815-4b77-a4cf-a4b18e776eab@oss.qualcomm.com>
 <95142608-b5b1-43a4-b8b6-38e658275f30@kernel.org>
 <abhgxF1RcAJD-cK9@mai.linaro.org>
 <3922012f-25e6-4b75-9183-f9277ef5d040@oss.qualcomm.com>
 <74f59ef0-ead7-483f-a80e-a3da2f6ebcdb@oss.qualcomm.com>
 <909009ab-53fe-4b20-ad2c-bc8eac9e8bc1@oss.qualcomm.com>
 <7e50100a-514f-4f73-a976-9858ce5cc0e1@oss.qualcomm.com>
 <2d1d6fd3-b34b-4eea-a4b7-0085a6a7342e@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <2d1d6fd3-b34b-4eea-a4b7-0085a6a7342e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c14d49 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EBd7WcfsMYPMwvoCMWz0vA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=PqOKcQRRktM5gqkVpSwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1LczkglLqRsJzeaLVn-0OIgQHXEuglb_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMSBTYWx0ZWRfX38xYEaiZlLwc
 Lfh3EZ/65idY2oSIPvWrSViMye2TWW3fn8dBqj78f3L3Sa4ykVsUqvCbutLG4ypOrM/79YiTFJB
 6JSHcAFkOPKhQ4MJeV76eqwWgBkjGOwGSoL8xmu9owxE44nOCzEQxaMNQ0MbtErC9Eh2lNTUVZp
 KIp1qM/k4bmWPkRXNmF2SuF8nPq0L4ohXzf32OhoUT1aKiGFw3+8ClzXcVgJq/Ja3VdBI5lus9u
 3H44u9mg5uqB9Stb8UTwVsKyYLjChqRoQSX+SKoPg/bO9Sn1Av2CWiKOLA8bJHwjg+pz/fr+ff+
 qj7bQZeXH0EdBfNAe0INbRIJ+0eNbmpSVxQn7vFpUFTC7Cm9AKO8i6aoH6dYSa/Yu84JOJHlr7Y
 q2800wWWlK4IKX5z/bkY4xvFW5VziHLi3bZ9kEFPQphz7fGDnhwVgHeAg1+femY5cgP7kxEdJg4
 r/dFWiBQz9PDfapZk6w==
X-Proofpoint-ORIG-GUID: 1LczkglLqRsJzeaLVn-0OIgQHXEuglb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99300-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88D322F5AC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 7:49 PM, Daniel Lezcano wrote:
> On 3/23/26 13:29, Konrad Dybcio wrote:
>> On 3/21/26 10:00 AM, Daniel Lezcano wrote:
>>>
>>> Hi Konrad,
> 
> [ ... ]
> 
>> My specific suggestion is to _not_ spawn an additional node, since
>> all of this logic relates to the behavior of the (e.g.) CDSP, which
>> already has its own node
> 
> Got it thanks !
> 
> +1

thanks for the review & guidance for the design.
working on it, will come back with a new version.

