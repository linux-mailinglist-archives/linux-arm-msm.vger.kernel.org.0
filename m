Return-Path: <linux-arm-msm+bounces-107809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JhbEy8DB2okqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:27:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE9B54E6CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08C2B3097988
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE2C46AF3E;
	Fri, 15 May 2026 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDJzjE7P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmStTIWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579247279E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842535; cv=none; b=PY4sdpwX3NZg+Ij55oG78gIy5ZQDnj8jvgEIQCKTqzycJ98vz83n3FKG/vLr14528j0ljFEyZLViWCDWxAJE0OgyjHlcxLfiiRk3xASuW8/5EXJXFGuHbjwH+HiSPqPcpXhg1dIMDbWWcBcVYB5oxjH18YqHKnTGZm/vVSrIBpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842535; c=relaxed/simple;
	bh=/7oiJ2nGzu37EW0OozAn7fioRo5rnaTnUXq1bfx3uFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDgH4qWE3x2R2iGbXLS/VAM/pCLqhRQClg5NY84f7HLeDaVpz7ZVkjNjHKm70P1sYGq6fXypvXcYPj2P/pEBsqVTaq+76hD2+i1dOw0IyT1Ufk93rYMvcvtVkXGa4B2DQG/nSBs5yGwqUTaJzPhO+qc0ue9vKaFxxbHlnHl5Jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDJzjE7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmStTIWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5UsWf3197968
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=; b=pDJzjE7PGOkOd6Uw
	pHXCf21d22OILA4f9bJZjdN26y8HpDgQzi/fZV2pjS3mdcibOqoBJzrsrClR2+DD
	ngnnxK7Q00qRd3AQjQnpwUFTykjO137LI1gVdGISkWzQKjoDcnwCFPw4BDifxDPi
	hX10YaoQpjoVoUkJKGG7T+YuwTyRwB0Ko0vBQxlwZ/HcdpAumrISuc+dqazRXN+h
	lJmVn6raDFgq9mNpjv9SAaChLPqCiBrRVMyJ0zMZi1qLTDeoMWyqbWXPUL3fUL5D
	Ud3MyRbmzA4+T1oc88iJtkB7H+kPkAAfqG4KjXs5cjrQtREJ4GzIKGHR6fvRCYLP
	5UyqAQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qax3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:55:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-576113f8e3bso7016e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842532; x=1779447332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=;
        b=UmStTIWfOhI4cWVlbIXLzUz1LKiT3fK8S5EQBRpqNCsglaeYnc4fkFaIbXbzgWCQpP
         lzaRr9CwenDgucK/QBlsdT50PbhwBmUunXuhstIV8CXAnqA3y/zgpn+2mlPbyfB+tF/P
         6NrgV0Zq3zEzGujetdPEG/LsJDrzQUurfd+ku+OdRb1P1fpqbQ2JA9WdxwkMN9uDbzTg
         AfDIFipRHbuXNmQLTLIsuBhn24AQzkeeReO+wE+QaUEe28KMNKeecPT91uWCgUMrtGi0
         oMIwp4e94zkcRIa8mMaUiEPnVzywXjWvSa7ReI5/MTXkxYSBBBRW4yet3pefcWC1bVRP
         c4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842532; x=1779447332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=;
        b=EScEehR6F60P8X2c/EUBS2l96Vne29UpY9XM3vnjfDa9rAUkPtMIALu0A8g/MJCHLO
         ol47gzBYclQrXoFisldwkNRAD89Pg+H94U9HDQMFkDr2Id8qv+JXDhnMKcOpwl0L5YYv
         YXNr1gtfn2nLaboei7Y6bsP/TgtlkTmeml3dO8+x3qeWGy/gy0dmwJWqsdMJAz3Q/fBP
         tpVXfJI76Rw2a0cxCLCUgBOQW1lzQG4p9ODsvVGkXJM28LEsf0+CyI5ntbYeffmJh0z4
         sepeCGz6J0xmOMvShw0GG9sQP2qEp0UD5yQTIhTcG8W2AxHDeR/mQKEBPp8akI2s7WS8
         IzlA==
X-Gm-Message-State: AOJu0YyL1aK7jC717fla/CR5u922DCe2fcKqL0dLN69k2AybNXByEzF1
	jCco/XEitYfD3JcqGzXO1qdIb90n2W8XTArs0myVng0q9QN9AdbnVLJlGx4fOhFh9kGWtIsH6Y6
	5xT/b66Fbe/DSS4VKCVlKD4CFCVrHWiLGkIJhWTWRMyZQrk1W8VeoTvWZCMqvZWig9YVo
X-Gm-Gg: Acq92OGHjqlDAEYWpoIk03Rn9w/g1SzDTloYghGn4Ze64grCsP/Pv2s5b8XRYuOQ0q4
	fOZDYjIj+WaVercowpFjU5lLDumoo2OalUOMfsZUHtebrZe/P75onLSpXc/8ntP3H6AFevIPqGm
	UA/3NJms20q75Q9Z8/byschfimBUwE0sc9g9Plxe6V++25ERsxiI1wWGz6QCMAGA31i5+JJ8wqY
	jNWgaObcfZh7eQOUoBo6SMlnuaTheFT4vOnIr/QD4G+Y05lPHnwCOBfI60I0IO8Xkp1ldYYH6ro
	rLzChxIxnGtJXfnLXQjCQbWwX+hKJNP7xcfDf7AnK/Ne2iGefk/vBZhriTAbB9kkYy9bYmVHPF4
	lBPpAPHg+xxr6ssjTQMPFAuPezOPtod28cagqzmDzeSOMuaJVhFq4IdjHPIlXtw9ZAARQtXjc1m
	x/G6o=
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr592162e0c.1.1778842532229;
        Fri, 15 May 2026 03:55:32 -0700 (PDT)
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr592149e0c.1.1778842531734;
        Fri, 15 May 2026 03:55:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e60a76sm206187666b.53.2026.05.15.03.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:55:31 -0700 (PDT)
Message-ID: <ea0c60b3-df79-48fc-b9c6-d749cdce2c05@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:55:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Correct IPA FW
 path
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Robert Eckelmann <longnoserob@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Joel Selvaraj <foss@joelselvaraj.com>
References: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ziNqEACo8RYZTWTTLjzz7cVydrJshenT
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06fba4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8 a=ab5invG6YRD6NB1u6q4A:9 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=hhpmQAJR8DioWGSBphRh:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX+tXDfSg7dAZP
 PwcszRrxyMmie/qy1CxKsYgSu427dcnxBczS2oiq5wjaIUT75wheXOfkUegb2TTPgnIKYCdCIF7
 Nn59lr3NnK9RgXxkObiRMpEo4NYA18/Zm1cGG610gSvEqb+9VEI7UYKoeejt7j1hPAZEXAl09Yt
 KlVWiSsznBPRO7QoAxfb+vZBtvoW5YA1PhY1GY+QRMXeViY1ETmXp6FkIjy6bbuitciPlgkMU7i
 1KPeeyLfxK/QCkBzimOPKMCyJGPBUjT8zzojNQKkmSsW+tvfBWZCGUBEqzC4w042aQb1KvYgSzP
 eS44rISFefHC/GdNL6iA34izgSNdRjzfxPuc1mVVND9MyyC6gJHfpOWb0ZxThb6pxFxaDmBnwyV
 9/OC8D2UXLV4zE7UdWHr+WdphE2UAp8I48sa3Z3/eHTkjEL4EkpS7Mwn01sb4lb0SrfxFEfs+ZP
 vvK2cgGIjLtKYRl1jRg==
X-Proofpoint-ORIG-GUID: ziNqEACo8RYZTWTTLjzz7cVydrJshenT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: 5CE9B54E6CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107809-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,joelselvaraj.com:email];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/29/26 3:16 PM, David Heidelberg via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> The path was accidentally reverted back to old while refactoring of the
> device-tree.
> 
> Fixes: 5bde31dc7b17 ("arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort")
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

