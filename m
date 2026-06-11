Return-Path: <linux-arm-msm+bounces-112638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NL7+KT1vKmoipQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:18:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128366FC58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LVhjJJW0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A+KFq1kS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112638-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112638-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5015B305045F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F175A2D5412;
	Thu, 11 Jun 2026 08:16:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED7372B32
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:16:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165796; cv=none; b=TwqOk8qWHOtEWxaNdUVprAY51NHxk0xU2+UfZtM0ePi4X32i7rN39yfTW5zimPp6Cs2NmvJ2O26qTG/bQzwCc0V2+eP8YM3lpkWjob5Lc29TMei/UUcSdGXZORcs8Is5hYphjjaDoEmdipXGlo0aPs0Sm0/TH0mUuij5jv/LS84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165796; c=relaxed/simple;
	bh=l4FiHCpPsfoQnm+7s3ixfK4Agn6c35MKJ9w4PZwkHR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phqls4DZi7mTZtjgIjY0uoZ2Sky7nagquCQ1gP+vNDU/RliHWujyj8O2Ym5B8sDlpxbMvt3uDpeJ0w3d+LuiQy+O6TDVg2uTyhGik0myT39xQI8yj50AsFWdI1OBYLGRCZncTi4vrmff00xTG7Q+bvFk+bf0UXo2zzbquoiUEz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVhjJJW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+KFq1kS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GQ6r3835154
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmVRebGlcvPJSWCU4070GFPfnGQnX9+1PkM8+LYFJ00=; b=LVhjJJW0g2x9YpFV
	rhbW0NZbDk/RLc9Y3CtEzTEq1h7LXb7SVved16kboiRZFKoKFAjVOmp6oL7F9ZOd
	wq3DcPIglsw9fRTSAhSxApQ3YvMui6ZG2emo7IUKYv7DIvE+dig907dSOg6YRrXe
	EJzLayWt1e+dnyUpq+0vOxTobpULPydh0ePzxuFBlfCD3+Pf9LPFm5Dr7STS9Iyf
	YM93UgGCStL1WwmOT/c6Pf1N22E/9LMa63tLNJ9bqvcbCGIx8lFxfmx2BesXHJLT
	M6uGXqpDeSn85eTa+ys5sM4Wt8jxiJXkwkBUNw6AnnwF0rU1PAp1SypDwhgL7Ywn
	wWr/LA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tje7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:16:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccef0be668so15931956d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165794; x=1781770594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmVRebGlcvPJSWCU4070GFPfnGQnX9+1PkM8+LYFJ00=;
        b=A+KFq1kSLY31W8bf6evFQ611SJ2lqiaomYBMvBJfMCw9DW2qphdmBa4o0+BsLzF//7
         mca9F2xB7H4h5Xsm4CUu+dTbIlAUwW/7HaiXx6cc5TBH0xeCdv5o4VAX+SYUROUDnbhd
         PVtUGpTHlpLw/Yb2xYFondaR3qNMKBp/KL9JAl1UaKituZa9kmwCU0WYlenl4gzC5pDi
         FIccwtkCDT2UoxR/rCYYedhygR1xPbRh6UQpdCFMphSRGHYPw0COzgrAXf8t38gnrHw4
         LKGXElKL7w45kI0VESkLpAJsOTgH1XJy1iv3aAb2BbMUs/NE9dfArEzOzXZDoTFag12y
         9oYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165794; x=1781770594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmVRebGlcvPJSWCU4070GFPfnGQnX9+1PkM8+LYFJ00=;
        b=bUOg/n5ymBDcwZEAz8Ynn4GBn6ZqeajEv9ZnpgJ8kn2Ks7A17zc3dK400a3isz5HFE
         juFE4fY5nvyKmyjW9cVpI7yYJsJR9U3rkyU7E9A756xvirMuhX/NvJRBiE4JAvFzZlz3
         ZkuJjHp9QNQw/N4HgPHy4yrXd4kJBriUXgCqIafD/t7yA3zU/uvvp8up4wMWYqKyHPyV
         eSCIU4ayQPUW3095iUQwZ+zvbO5NITxV3Er0KDkmjtDOJMmQcVz5tlDfbbZgwiFI4NXa
         B1nv0D8fzCCiHkD4C6X6kjHJOsmPLa06UNQrDWQkcNUwlfLLEXOt8MbxzG//jLnI1Ml0
         kUFg==
X-Gm-Message-State: AOJu0YzMnNA8FcXOodZMZtz6Xr2bguFBDne6K9f3mepMR8uDyTCvF0/4
	MN4EZXOcXOCPSr3SS9wb1TaVdqabZUCW34u7dnwdHKsPKcpFioNF6pJXdQDW/3djXi8TD+NykbQ
	xM7OScKhyUTPAB+DZhDejGAILhC1RCmZvGCIHPv118Dt8R1EdTF7uWN1gDNEAeAAQJGp+
X-Gm-Gg: Acq92OEQLD0ZcQUDJ2hyCEk08V+x188mRlH6Zjf4yIiNquMwzT+U38T1BG1R2sMxvBi
	pgrZZDydV0AXRR2NsjJHcz5F+XBhyhKtgB7cQ/xK4XGsMW44Dzu5i8RKfr/W9qFoDp/IE/TNykC
	BjDxaXy3UxoAgHZ9BHeU2Ufx9qdvje1buJ4TUUdBT6CFE/PylaF8/drl3Kz+W1dRNzK2P82zGgM
	8shN4TxKJ+zTuPqY3bm0ROQkjMtSrrgbR5GYVophEiJLd1FZ1ZyU/CIyJzIP7oH6Nz1Ew27fJr4
	GJ5YZvfywFiWkNkpGqvKmcxIKqhk3d2EpIpkimKIf/QZMlhyNlVW8lyYS0J4XUOyWRNADwn6Lan
	IJojxZotVTHRJaxSNrHFfFmeg+WIdQjAQd+sasFZs5C+qEqG4o5QOBXM9
X-Received: by 2002:a05:622a:4089:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-517ee1d5c09mr16696971cf.4.1781165794141;
        Thu, 11 Jun 2026 01:16:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4089:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-517ee1d5c09mr16696731cf.4.1781165793685;
        Thu, 11 Jun 2026 01:16:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcadd198a8sm28512466b.0.2026.06.11.01.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:16:32 -0700 (PDT)
Message-ID: <0e19fe82-7bd2-40c5-854f-052f6a987240@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4MCBTYWx0ZWRfX+nULC9WWOlfR
 xd++gEwm1H9wi+5PcK69kcqDKQvCgK3HBsbWoqpcODQFjb87/T1MmC9fohyk3YqXLnEMmP7zJWb
 Ol8EVOBuAjfre1HYG335p/FKWLget0jCmPF2X0LV28Z2yd83xeuX5Aary+wMDgYRjXoBzxXP+vT
 6b1HEfEB/75F5XZKb04ZANOPdAF7wfOn6ot0IOomWjzGjxojg8Fm9b6WcCnkHGsd3nklUJTXgdI
 R9GRfCny/OZdRVzR33yyd0sA+6+tozh8DVRcE0VCSp3o2MeEpVchfKZCLORiL0PgAkrNjOlw5Dg
 8hCHDO0viTl2oJbo0axUoOAmjtFdRQBArhvPTM2jk9cOX1oUGyp2e5gm5L0kwvR9CzcJMEnEMM2
 kSghYZoWB/Hb12Kjo63QFff+7M1rWcs4Gdvue7abg5hSKgRCXrWw+Zx6de9tFJtCo8QryfpY3cM
 oZiZs4em+M+G6yBzOFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4MCBTYWx0ZWRfX73MyzJDwclVY
 keTRIotUTAzYXXMPe7Hv8Id3N40Xnwk+8OAxnnGQaCm8THKCJ5V1Voo1jVwYMPJzglsZ+4y1sIr
 QsAd4KgrWFjo56IlEUaJa5L12TqUcPk=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a6ee3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TUoNoqIjxyoQ0TlcC58A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: OFo4tiVSUcyyZ16IBoDnRa7oV-fvSsHi
X-Proofpoint-GUID: OFo4tiVSUcyyZ16IBoDnRa7oV-fvSsHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112638-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0128366FC58

On 6/10/26 6:58 PM, Kathiravan Thirumoorthy wrote:
> IPQ9574 also has the dedicated 'global' IRQ line for each PCIe controller.
> Add the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

