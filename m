Return-Path: <linux-arm-msm+bounces-104399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGh7J08y62lfJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:05:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252F45BD9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DFDF3012C83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AEB3783C7;
	Fri, 24 Apr 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeMksnO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdeC5f0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C5367F54
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021510; cv=none; b=SxloTjbL5eKcpjFH9gesONWCNmip/BbZiOfMurLHXpsF13Ig5tZJ8g1V5OHDRQHAOW4E/pjiZ8vUF/4s2snEmLrDYw+Iw/3nYSBjdaBPb96wh96fCbeyhnvz8975nbtaf8ZZQYoyQuhK1K5SjnKj2P3ZjqCOR3xwrExtFEjLqxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021510; c=relaxed/simple;
	bh=uul3wRiEmOsR00PyiUibdnoLoMPLoMMy8WVr0lwTQzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhsoZEVSRcFubmniUHHcI0oq/u+JqJbv38zWLTGE8euyEv7e+ngWm3NON16DvTmbqFD9xUvAx7gQis8BnL8HNOMOgoYLnZMRCABLmY/ji7YGKNVLeRgdtes4oZwIqo4oOqkwbjLuhLYPNU5edT11CT5ev21GLfUUOb8Z3yC/y7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeMksnO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdeC5f0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5kUPr1959422
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01nAsS5A/2O79FKPHOY8FeK/BGeqy20Vd6X3Fcjfps4=; b=JeMksnO79EeE3YYg
	7JmZ1piWnXfV1Acs2UWl0fggmcrRG/WHZHc1bXKsZS1wOqvzYra6u7hyL4OmOIoe
	ViSoHbFD8DGmj/o/CXP8cNb4eWnHCkCP62zXJGRg9Et5aEghxs7c5/IB9hZ6IQtr
	TXRSBDi7NphBL+3+1jd8MPAiC6XlfXvDyEurlFbPDJgnBbzh498Sgk3JRyVPrme/
	icpCBvFVjJ9OCFOQJnXG6R5dkqp6TDuyrBRoZLmbp4ZQbZ4KL7mTbWnc4AMgV6Na
	q4KW5rm5ifq8RC3M0ECmMxuAf9j2fzoeGSNZ5VoLBZOXoTwQbab6YlfXoLwdfDT/
	EhQwxw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrgv4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:05:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca4966fe6so22383416d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777021507; x=1777626307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01nAsS5A/2O79FKPHOY8FeK/BGeqy20Vd6X3Fcjfps4=;
        b=OdeC5f0tMNyg8gmAQ9pcqwE68yLftTBrx63ua/j+p0e+t3jE0w9me5Jr+ayoLTlWub
         E4eCERxr1NQF2F/wcVNwdcMieHfF0fn+BOHOvZZWmO5zMrOpWfGhTVDFQJu9VwL5ycMe
         Tr8/W4gXmCK9eYa1vx1E+ZvvG3wKSSqQgL2pQ1QRbmQbRyul2nKFUNHPP+XiHyS2KVwP
         2lH4je99rUTkUgnZ4bnCQfvOZvfNfPteJamVQ0+cx+4GdHN2sQsvfzHmrFkPWwIJIWi/
         Mde3r9Phye7GECE2uVe3X5APKLOmc0uoBj3TNKz0DyAZw2MQ5+nAIJQnnY//nGRafd70
         WDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021507; x=1777626307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01nAsS5A/2O79FKPHOY8FeK/BGeqy20Vd6X3Fcjfps4=;
        b=KZw12P3jTNK2q9pgr73hrQSQjs0XMJSVR39ayq6IyyXuG9DOzaKd2kmExYjh4o0Z9i
         mxK9B7Yn8I9UE5gXdfCjtz45OMuXglo1gh8ZHnqXCtH+wMftNbaFiF7JMXPWsDqDRvHk
         Fu0l+4MqUYucS1iTJOZX5dBoN/2hJGlxvyy9mqCPCry0rV1hQW3GkSqaNqQvM3DA0474
         CoHLMmtMQDCleIzIBarfCKApU5Uww2x12LkuAf5J2F2gQTUOFS8wLqHlugtQ8M/F4Z6b
         Rr/SJuSyco6CsvKNIGNDJ0noBKmGCmCqbrZ5GNA7iiwKfNAQtu43VBTBxQdKcK75gwpz
         fnnw==
X-Gm-Message-State: AOJu0Yx5nOVFQ+jmMgTQMhIJqydK3kTT7xyJdqlMEuKurHhxPleC/5Gu
	gAfyyppaLYci1cWSbfcRDzhvb3K+KVtgXGb79fGSs2K+e8hesbS+5RwuhD2ifDDD6DYXQGxSfhO
	Mvt2INDmcQ5yj+HhkEdhklUxw/8w+ApnpD5mMZ/fCjEZPDJ+Tl75WrG8sCmP8ZbZMNnuzxLC6sk
	GP
X-Gm-Gg: AeBDieuvNjAyNS02owa1JHi6nb8vdcC2FC8VO4KHrogbjzPNW8UClZy/E+xdLkBcVIu
	H1maehsB3/Mf3LOc5h6whvSqO+JwHPcCklZtBJlM95t8ZY4EaqgypgnW10qm77ikuzV66JWC/7C
	rlIDiITeUzy8nS/NWgUkLXWEiSR2Wxx4T1pWevYnMi9UJiI4Xdpi3zOfcZCdaQ4v65BAOSzd+lb
	qeOu+Rz1EymsX/bf6mQNydMtm5c1BYwioH4OMoVnl5rPXCQb3uoOXcxggDhh1x6fVWxtL5kdZde
	/bHXYs0Fc/iRG+69HAzBjAdznlSzpz5m3FjhrI1cF0nW4DgCLGfOg/Ic3mKFRMUTJXxyqeCUTS2
	ki0i3Cm16YdEIH2VoCtHP5QtyWPwO2ywIrD72/BwcyNuqPRn4o5jfnpSOgK4w+R2t1KfloAbTLW
	GrV8CjAxXHEC6xsg==
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr340259936d6.7.1777021506969;
        Fri, 24 Apr 2026 02:05:06 -0700 (PDT)
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr340259646d6.7.1777021506586;
        Fri, 24 Apr 2026 02:05:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba44e5749d9sm766040566b.0.2026.04.24.02.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:05:05 -0700 (PDT)
Message-ID: <d1234f98-95c7-473a-b9ff-aca4a9f9a9ff@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:05:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add TRNG node
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NCBTYWx0ZWRfX3QPwxFyehW9Y
 vn/D/udpcZVJFliwb9NkUCMg6bS54WyQS4bPc6b+oOp3KirQjqJwusqG8BggxMwtfZAQ4pTfRBb
 ju1RwTJrOSj4vQVpLdvNr3AOPSxc/1CpZLVibzmNpi35obBoPl/PnSiLDGmcWENM8dvce9Nt9JO
 1k1wPaFvrfeCygebmE1LhO3drbuquQVA8JCaJzOutVIodrngyM0it60wvBbGa6VXDURPTv7R4Bw
 PeLPt2wzFNNVlMRhSQzMrvb2ILTb2aYxe66WuDV5R+9SLQO4gEe8WcskImMwKbjalouzP7jYP8r
 t14LLSFZQSiT78qA/epA/R+PJi1Ph2vA2wyHN0CUVTzCvKSt4Udn8YvHXhwzVP8rPndMXjTXFMa
 fFeogDpjezRLWbpwg88iNnKIreFGh5k5ttYJwcFMPBB1cRbiOVKrG9FWLtc+dxpRJzfeVYQDDBw
 VLDVyB5T3aP/tmrTzzw==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb3244 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VQnp4Hrt9dpzAY_ZiikA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: G4pYKNk4Ig4xyyVEitay6mlHEce-K_rf
X-Proofpoint-GUID: G4pYKNk4Ig4xyyVEitay6mlHEce-K_rf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240084
X-Rspamd-Queue-Id: 2252F45BD9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104399-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 3:25 PM, Kuldeep Singh wrote:
> Add the kaanpali nodes for the True Random Number Generator (TRNG).
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

