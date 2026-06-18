Return-Path: <linux-arm-msm+bounces-113715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1tTzIrq/M2r1FgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:51:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1269F00B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:51:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SckUFbyZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bGn9IMvx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113715-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113715-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1811C301A085
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7348C3E0C70;
	Thu, 18 Jun 2026 09:51:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C703BCD27
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:51:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776269; cv=none; b=iQRzUeJ+1FIRm3Rh/ngk6uYmakYIkNx0myHxxvoa6j024oe983ENl97tt+7dc16hqasWFPBTyR0PWYIXWwTVelIW43aRYi6q/ILpxjrQLWu+ASAODDSgbfAfqH+dO/tuzxK/VE59qhfO0aFYGhvLi+cDKCVYk1l0YeDVa7xO6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776269; c=relaxed/simple;
	bh=n7aFmX4/1s6Ei4IuOvpaWZG9MO8OsZDWkfEpJqW9tFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7710moWuzYzz880FmRM9vdmExHx8AMJZ/Y01U/998OSpWLUCjRCp+AZb0gfUw61PxOJ/yN3pT5KiMOR/eK3cQs62+ACvrBQi+9Oe/bJ6MCP53Ub1TfTtgDh3pY1xsqPFE4pTq/Up/TEyOISJbFAqeHckG8+C/C2VKOliRsb2J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SckUFbyZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGn9IMvx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FbYB1011364
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Et8K+Pj2aNhPpY3BZlq7Uqti3tCe7JP92yJOXp9p20=; b=SckUFbyZkW2RP6LC
	LLgvUtayBeS0pKwOxgz8WYdG1LDWVytl9iA3gqtDwkt907gEHMiiNQASaP9zqROb
	3cLW/YczFaQWOlC9KBYdafnaLXAEIQeVAqUv7ahb1HibgCOxdOwA/awJedrkkut7
	aFqTTxknRF5lQAtPswDn+WlVUj88O5e8/JKCzXdtrqd/JcPSfNFE2pyAJzbGzaIH
	siXhpfaVo7CSkBNU4P4RbeH40Y5PMIlaAlfxL2temYd4Ev0sGPt6n+FSaRECTbk9
	Rys9thL78hbTyK6trYwW6bA3FORif7d3bM09AY3pmdPhYySIUOokXaDir21zvXbq
	KaFXYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rttq0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:51:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so22317585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781776266; x=1782381066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Et8K+Pj2aNhPpY3BZlq7Uqti3tCe7JP92yJOXp9p20=;
        b=bGn9IMvxNMCQpbvXEl62ecwTfkYpIvf8gyIxl+U+GGpePNOCL/VUYk7gYWcpgAFBHj
         UDD6DjCh1xOHvidAZHm0Q0v0fk16hFlBoOSo0ZLwgQB0eO7QsJ33WQZR+V6TmGlI6n32
         +ieLpxIq8JBX+Rg2OZO9JemjhFq7qxzmdhdDLYOGY3canAfeQcy5t62CacetNH0NDUHf
         9PCbAnR1XVAgOc07ZwGuAynDupNIbgyi1OASomWF0nZ7k8aB0pfPVyTDWexNmr4FUszR
         rf0Fp4q6tsU7+n11HKHsP0ps0flwQNtqnA/0g95wCMWV5tOk7UU6imDAn8OzbNWqWXRD
         crAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781776266; x=1782381066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Et8K+Pj2aNhPpY3BZlq7Uqti3tCe7JP92yJOXp9p20=;
        b=tXtTV2DmarnsXWDPzzHio2DtkDpHKM4bI73z/HXQMiUV9PX8ntXUz55jefXWwAJL5s
         KcuJKM480QjuwI+T/B714lpH11cP0FU9dk+z49G0fW1Yfq/Ch58T69Ppo+yFc0aoZD5c
         xKsRM2Vx5VTZu3UOb/D+yjWq6gQ//hP/tn5Vf0Xoa2chaOO18DwbPoTEtfHW/fCqczE5
         eGJIMRUQKxnSntoWlCu7w5/hvblc/SUDpbtwEbrP5vVQh7LSp4+pruX9YPCs3Hpj5yoX
         m+G3XdfYGeYIfYgZ0wWHdI+3jpmCa7UwFuy88i9FPxYrX5PSzBg7hnNMKSxcnS1TFDfX
         NdmQ==
X-Gm-Message-State: AOJu0YwRxgC2SKcXgH3+V+f0Ks+actySWSnQhbeobMXMUTXfmjmKA8Mq
	8w/yIGpUft4H/YQvLsSseqV+2+nrxsXZoGBkWL0R+8Qjc7wIRMlhLEHqgaDLumqyhvRagZolDyZ
	gPeXjorUe973EpTg1DWlxRo7zejKagixzzjLkRMA9q+k7GAcVR6Uf09GL7MtslKAQOcnB
X-Gm-Gg: Acq92OGhc6o4/tEx9JzffPJ6GwPHeWhwEdfE1rCelQNN9nJrVaq7uD35C3pnMriB0ha
	TMYI1ijclICFP5I2uUzXYYo5hF9CtwMjuvvOxoECo+zZtgJCgrR+WMftK9VKfY6JdwyUMVGkC7e
	7urmP39ljHB6K/Tacm17olEO/zr+76KesaPumsHFbhZSN6yrNPbvyRYfrlJZugbN2Sl/nYC0tJK
	5i4Pnp1G2TZG13yLiFcMja9+/ZNT5tG0YTpMMjwdI0kkUEoTWEIbOzUzty0gR573o7WzUzfbrWE
	HmQFnHu5RbLvK9ZTGZiqhJY7MSR5zu6tqf/EovqyyxguRran8AwsndL6KuMPzj/hWStgvojg1YW
	fY6fkgLW+Tq9HifMoCJbDrgI1lOpSE1NKWPo=
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr281932985a.0.1781776266463;
        Thu, 18 Jun 2026 02:51:06 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr281931285a.0.1781776266089;
        Thu, 18 Jun 2026 02:51:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01ee8286c9sm630453166b.5.2026.06.18.02.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:51:05 -0700 (PDT)
Message-ID: <9ab808a1-9db6-4294-b7f5-365d71cbaa34@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:51:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add passive polling-delay for
 gpu-thermal zone
To: haritha.k@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a33bf8b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5C3irSmljBUfJ0kUePkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX5JEoriF1Fl/n
 lwgGrrB1am92mtZ8B5AG6wApc10cGy/6RhNLf6UpVNq7/GRYWw0pWQ/RJ5MeSGzeAqeXnrkLTFz
 T/v0tn2TjZJYQ7GzvkkrYZYjJqgw7hOibOkE2CiIa/B6dLugEkQKdPDsqAvUQo6iu3GzXePkHlJ
 UHrljo+E5WGkV7uKKzUgrJdvmXkRsHHEYhfBH/H8/38Sb14UxP6LNVtzg4bJ3bcOIh4pNPRIPyi
 7xdp39aA9Ut1hdKb47aVI6yiCGFm4zfqj/gjJ8Ohd775Y0TpU+ymMvZUy+UcI/VCJx6I5BicKVs
 KznV7Nz7WyrYhzTCNJ/e/azO4f9OOOD9u+mEIr/NIDmexVPCuxURunne4NM7nnsSIXPm7BVkZR2
 IfI28gosaXyUbLOXdnZ8IYwNcuiWceFB+p+9vlnlXsulldmRobzKKqVyou/spMP3282dU+jI7JU
 4y45ciibBbiCS3yKRXQ==
X-Proofpoint-ORIG-GUID: gEXfvJUBrW45ksiE6KjCzjxIsN3fo0Pr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX6fu+IUt7iwzu
 oMl3JATdu28TKWytCfWbFkHnw9AYWMmSnuM5ZGNQ9V+SBF+g6uwEfn3dATdckUP15MgEDy0ZY4S
 6Q8i0J5Ux7zdbgH7RDxT6vO6fZAdVNI=
X-Proofpoint-GUID: gEXfvJUBrW45ksiE6KjCzjxIsN3fo0Pr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113715-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:haritha.k@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DE1269F00B

On 5/5/26 1:26 PM, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Introduce a passive polling delay to ensure more than one
> "passive" thermal point is considered when throttling the GPU
> thermal zone.
> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

