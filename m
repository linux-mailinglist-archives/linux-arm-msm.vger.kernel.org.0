Return-Path: <linux-arm-msm+bounces-115171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QY1VAmOGQmqI9AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5CB6DC4B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NS95HeDZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ygz/Ex3y";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115171-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115171-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4727531057A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7B040D590;
	Mon, 29 Jun 2026 14:39:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC641931B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:39:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743942; cv=none; b=HQi8O078jHnBvWxpzyjjfCFQg7v+91hZhNTLrLTjj8PkoGviTr/wuA4StSPFi8Llm0oZwQkYcoxAAVHkm1GT1iKBTH19hT23koKTrfb2BYrWLMk0F/AEi3omxFkdbKN6MSRx8mQ1wSPz01yniKINDsPSRoRKVng8AAPNIM8o3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743942; c=relaxed/simple;
	bh=dJ2JTp6OFiB0mDOUeLX87yYQ+VnXucP5xQ/OK7M2m44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhfZwtnTdnm8M/Pwfe4H8tab5ZkAAG+v/IYiXDxbQeYJcb4zFrrP8EW1HKDqbzqm7gNpUoV9CHHXLWDcIEqkdTygBrALW4WqlO0ZeA+NNhBoo6szYt1IDLumI6w9B8c71yKH09sDhvw9w6nGBL2VLPykFFM1s9TexnBw+OfqdXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NS95HeDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ygz/Ex3y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATRcx2592825
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9F0ZQvdgCZ175pSXQOqitXo6ftMA07Jyq3N/MCBR0A=; b=NS95HeDZbikRVR2L
	CDbdAEuKNbD4Bc/z8M8aR3CAtyBF/pWucf/5uTVV0RFapYgsHjzPYc4FQLV1+t88
	/rIEWdm8GIkJ2Q/EXFtwmym8tJ+hGgo48rfkq4W1YDciQn3HpmwsHP5FRQ4O22Ey
	v9JQJARm571mVhShSfQ0RJhYLw2XEUzSsGXd7lSqDm6QPJh02Vm4sXN99yuSTZf8
	JPTIY2eC5ASHR+FcCF9jq5zv7lkIA3/FVqLyqLj8Cx2U6eBtKCxUCTs7H4LFV+Td
	y3Q54UfP040JuLQM0li7HYENa1p1qNVT6gOKNvgi0iZ171F88OJR1awSjGJDR1R4
	McZEKA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vj5jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:38:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso43247137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743939; x=1783348739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9F0ZQvdgCZ175pSXQOqitXo6ftMA07Jyq3N/MCBR0A=;
        b=Ygz/Ex3yySJCXWmnYA4yiIVVdGT7nZDFwQRJeYDzNFR1hM93TtfBimbbn1khwNBGEj
         ML6M5L/W9lG1OiXrkI77CIpNCxmxTzq7u0x2lvkpnRuZRU+181I6O2KYPvXRKOA9x2g8
         EREgT0S4rVBqGEQ0I7B0kFKtkTvo/v8lL9PykOFrvmX0cL/7YaLlZ001otz0dyOeWeV1
         aU4Y6ui2gOSaBotrvBCWnMLWZnOgNlRIdAiFAduSYaCdnVnnys+rGSqva9nTMQ9/2czL
         gax+4c8dCWlx2+k3f62GxXw5bj3qnArxq7PPlp4cg303ohumvCwcMcI0sEB9CtRd0/Ox
         z/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743939; x=1783348739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9F0ZQvdgCZ175pSXQOqitXo6ftMA07Jyq3N/MCBR0A=;
        b=hH79ViWMrxfC4LDK3XRfTpteK5KLTUGIPaRkeg4IEh2HYuxZPDT9MkvSBijRiiHzbJ
         JK65Zu5SVGruPb2knofKMm4hTv8fN4Z9EQxH1iGmb7EDFeoiB37gQYjhNEgKJ5LV/02f
         UtvdvqG/PZ7tuR0jh5L8XPmf9ncltffKKJ1RyqUqvib/1kT6+vumuPRqMbWDYOHgwm63
         plDlyjjNwf30cFYNKibkfBZszM5FdCwKhdahqt+1xeslJOTjmpWXpWU5LJNnqjum9baN
         OtgO8E2yzhJ80o1N8opXnVlpoK76tMQpnEMb8idWc+JSePhxr+El1gmN7NCYHPzBk+3q
         sjeA==
X-Gm-Message-State: AOJu0Yxf3TGzcL8u9czHs7FUbwxeNT4xyTTqyY6fnxTbSCTTLRcOQb0N
	mdD5eCULIEbVqPfpE1aERVb+zvH87bw5uUjF02tNAIKuLwAPb699QiIbecxPY+p1Ph+2nNpuyG7
	32yr1okubzKtMFRUiaartCNBvbfpFPqiLGUC1fseNNnm68ATHFmc0MFZQCCikSSeMs8Zw
X-Gm-Gg: AfdE7clH0EpNSO41cgCkm7zkbVwTp7+Dzx9G5XCrUEexAZ/ONqJlrlMjz0Ds8x2Hf97
	rhTHuWarl6yzvGWDNH++K62lR1sQude8p4HoanNs7I19trAC7BLfEuN9EyBS0QtihkDiQTBaxr/
	MOSgaq7X9T5nyAdc/NLsczNk3mfxVW5ZImrycrrrAFzFt74iWjy3OaUiLnanyiuyXsdMfajSUNG
	QJJ7+yXqIYshQXjZPHffNWbzkzl+mfibCYYYHn4lEHD6ih/BTANKcpx40LbwrpvCCibkzVnBTDC
	Pb4FDLnX3x9s7dVAujBgpg1YB8XCVMfc6oFllsBsR3E74weBhn+jyWLCyJRyweG1suZiohub5N9
	LcLgi0pPR/9BwizFo/woE3yk7AgVaZIgTBoo=
X-Received: by 2002:a05:6102:1607:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-739b6bfbe2bmr297193137.3.1782743939036;
        Mon, 29 Jun 2026 07:38:59 -0700 (PDT)
X-Received: by 2002:a05:6102:1607:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-739b6bfbe2bmr297178137.3.1782743938563;
        Mon, 29 Jun 2026 07:38:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69870eac1f5sm1099403a12.2.2026.06.29.07.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:38:57 -0700 (PDT)
Message-ID: <a0a96e9a-2df0-4576-86a1-95683dcef4f4@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:38:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-7-2114300594a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-7-2114300594a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _9E7jZ1ZwJrn5y8e_BS0KBKtyHs0Ro9q
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a428383 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l7gszL_yuYPfzADJGiwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX/sCzwuy4iRq/
 Ek5r1m6pKQ/hyV9e7S8JWJtr0o+U9dSTGf3O6P6yuDrn8Gtr6s5+TopK1L/4KVrwHF/ZHLxaaS2
 6zz/K/ewwxP0xOkxaQDeSwK9mda4Eb8=
X-Proofpoint-ORIG-GUID: _9E7jZ1ZwJrn5y8e_BS0KBKtyHs0Ro9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX146p/dLL04Nj
 dy8N5/c+5YM+bMteVAsfZB+adsC7UjDqcAn9SdKyCLy3WeuVAc5UH4rAHTckIT8XR2KKFDXqvDq
 kpSCNzEp9NV1aXVt7aYGWDJUaeAcf531VyaYtkOjpKnkGXgpkdspNNEnvI3cLmzPQK6LEFdVWcJ
 fx8PuXFpCVWQUxnWuVENMhwZQsX2Vy2gHFw+auE3FP5ZSaMcRl2+UZa5AymJtIsAbpIteOxbBrz
 G9k4kmrfJuUNpWbN1QXssnW0nP4GuCk6Qbv+ayqySKdj12GHRb05S0VBDCwK6x9slm84WHESfrU
 nUibMrSGbDJpHvptBnzn+wCzPtChSKLZZj4km7jr4t2r2p9OIA703lAcTwFNwHyp+M+hNn4Fq7+
 Wt9T/t1iri0m78A0iig6YJMpq5AR9KvD+TdG722QiD0/qrQtaQ13Ygv5D2zVipKZ6xQ8HKwefmh
 X+nIW4MhNtuj4AG2apw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115171-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E5CB6DC4B5

On 6/8/26 3:10 PM, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 219c904fba29..445dd8bb7269 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1798,6 +1798,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		remoteproc_mpss: remoteproc@6080000 {
> +			compatible = "qcom,shikra-mpss-pas";
> +			reg = <0x0 0x06080000 0x0 0x100>;

0x10_000

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

