Return-Path: <linux-arm-msm+bounces-107777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCUHCHT6BmoKqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:50:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B434254DB2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FEDC3119627
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896243CF04E;
	Fri, 15 May 2026 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdG3Ib57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cx8TxuBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2763CEB87
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840615; cv=none; b=PMpVVF9BmAT0UYhLWsRjtlfTCruCsfQzohdpD40GF26jr8VbFV4mJnZH2la0QY8BuPGPe/n0aRq86o7vmf/o3yExHNN07YVbKryaSmyzQc6SZyRFC9+YxDOq22D2SGlMU1nKAMLgrqJoa7XqCGAER26Xtev/KQWZAno+F6VNbKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840615; c=relaxed/simple;
	bh=pZ76TbMX4N7htg2RAI4fS928/r/GRKeHeguffESCJu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j93fBRYskY69jgr42H2/iw5ZS1kJ3EgKwNTp5fyLDpGa9pw+ToPISYvdFtp466nwk+sB52fzy3qld9MAsKQvUp6KkTLqMbC4I26svVo0PE0uHt/x7YbtKZIurG8OZrNK+zXo+KZur3W9+A+dkVmB4M8XdShjWSDRFEcf4KUPaXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdG3Ib57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cx8TxuBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5UJEb3198008
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ETCVPXTODOoocMFiNlNMTzzZGmzPrE9yEP2xRP19K0=; b=FdG3Ib57PELZQWuj
	24d3LAte8Mj3SW/VG5/T8cv+eugkwkPvDNOsmdUgjMVls6OFC6e8m1eWViI8dOJ1
	/NqdGTBfb/gFD38m+8sdjBUIEUsuXfzbsbxxt5oBfw8K2xHxZgojW0fuhnW7ziU4
	u8WiWFcJoIN9kO6jLduqXRv2thvceQU704V5ExgVHYclPDypZfQnGDNcjjF5bsFO
	slMmo4OnZGvooDmLnLZlqy2L4Nbk9OM8rEnpaFEL8Vpw+b8ALwZ7g0/IwHPrhkkN
	a6yM09+D77rVm8ENjxux7OFzB7U2v7oywtHc0b6P6Lg/dSFKXqrvJyXW7EWMbb1m
	7r+NXg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qatjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:23:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f71af9dddso765747e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840611; x=1779445411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ETCVPXTODOoocMFiNlNMTzzZGmzPrE9yEP2xRP19K0=;
        b=Cx8TxuBFk/Ro5oZRnpRGkTpt4rJkrEVskDEo6ynd9YpTmrLTyyqsDjdDamUJte9GtF
         hAwHpacBDwFTgOX4JdHJdVKCen+wWCzFR0ppXKxzMB7/KUmEOfyVx04lUXYZsvc9hmI+
         QorQRolcao8v5c3frcYJ/BAV+D+AKiFu5+3X3rqcLWxY8j2jFBw18gM7SaENYcc2nuCd
         mxHW03+753bDiwdOQrBmh8C8AwzpwITrnXbtkt3ZB/GCaSK4OWZnld8z2Brznbw09pGV
         xRJo7OCT58udXujA3+cUbxSDItFdSWZd03B5bP8foAYrk8nnEEcK5oyd+M7R29aZtt6G
         /88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840611; x=1779445411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ETCVPXTODOoocMFiNlNMTzzZGmzPrE9yEP2xRP19K0=;
        b=Q6tGlUVrzdDdDjpx+wW7CMyQ1ufWyWcEr0bSm30nfULNg45ZdEdTlisGT4xAj43aEq
         9P4ddyYgLeQhA0uXrWNX2auub30SD8PsnjM5setQr3Q+vfbJg281zXuTdGebG2iIhszS
         /0f0VDFiGIcU1mU3dNlLVHTOux2+yHw5Zg4+SrzBrgpagXXyEVTCz0UmAHRiPtfZLxCn
         2JQRheeyMW9Ef1R/tNf0iWK36kyNWmrlx1ar4c9aMsgSMUsKq2kjP5Ko+y5NwfPH+OQj
         PPfAvsKB4S7ZO33OeTMIs7Hw4FkFthhg42/rBN9A2xl5ElZTNIZsYT1k8B8mvx9TDKJp
         xzRg==
X-Forwarded-Encrypted: i=1; AFNElJ89BgFGVPWJuljST75gzBiEi/N8REDbw0mvBIwPz7p0VfGiWVPZZdjS4vcZiw5sasMGHpgB8L5ovIDEVWld@vger.kernel.org
X-Gm-Message-State: AOJu0YyM5llol9431l2+Ngu9fl6mda/oeIW+wzgRUq/gqASuM1rYqzOg
	lXZEm7f0E1YB7V0Q1TiVBVHZmvH5OKGEdn9hzb5zE//LFhg0Iiato/C1KHYGt93rZNYsmfh3bYv
	52432Ok2heJekvesMLRIGuoOyzxkzcCI23LHU+nQTyb2rBWlWcpKsmw73tPYNSF/L0vVSYqrSw2
	NQ
X-Gm-Gg: Acq92OFHWHBVgpp1KASd+LmrlNH4CVCCl6nP8Dgjo7ORpex5gaV99OoUG6TxWg8/iGU
	d8vr1yNfrfvp9iZaAnSiP/ESzynppMGOHHPTbtNknIcXmi1Ew78D8CG0lNM+Xp5/aUQrhonqhMJ
	+iWLuBJ7eZ4vFRDKmLGN9aHEYT3PstDFPurZIC6fO2gChXSi2TWjgiSugjyDGWiiUItH5uBp63P
	sf0no6ioquwq5MakD6TXLgdvWzu5qp6bakn6DU1SNw4ZS8N8SsWPVIsjKK0EIY8t+fO6JVEw1ur
	DfNkJs4+lZSnAzdB28gPOco5ZYbZk7TZB3Xw8XY6SFhxO8XAqfhSQDZRXkP74bexKKVZcf+rXnb
	0GX8Aza78aiirJBrN+OyUsPtsAMU4DkhPH6xTO1FBvuXvtBFy+WpoFZyvexnvHrIEh3GFYSejWt
	asA+Q=
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr579439e0c.1.1778840611225;
        Fri, 15 May 2026 03:23:31 -0700 (PDT)
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr579428e0c.1.1778840610839;
        Fri, 15 May 2026 03:23:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm204718566b.1.2026.05.15.03.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:23:30 -0700 (PDT)
Message-ID: <5ef3ccbf-c6f2-4d34-8500-b2de3ecc7de8@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:23:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dmaengine: qcom: bam_dma: Add support for BAM
 v2.0.0
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
 <20260514-knp_qce-v2-2-890e3372eef8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v2-2-890e3372eef8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: chXIAzAajN8XsqNRnIP218k8hDktMdcp
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06f423 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0SJdTa_k44cpE2_h3jUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX6bPxjQeqpYkf
 74paxKACAjF+tjeNXrkqeKWUoF5x24mpDX1V+FotNIOOmWAD7I7rtlPJU8wTTymWf30q0Zb8uo7
 61V2qO+kgh6Uyy3hfq4KsiwSGeLWopPFm0tMhhrhFKxlUhjXV7i7SnTavf+/EMK1tQUywVu/OES
 Z6fzy4GHEQpEq1xqQJkmv6vrgRUc7/bqa4FhghF64J/Ptg5cvRualUtlKzyu7uRot83ERA6vzFr
 2FCoQj5xDdJHRkvvwXJkaolyRZjE9OPC/td2flfU+peM4GZtYs0y7UUOtbCNu36DR087tfBaJOa
 9kIDJ8juWvJwwpVzN/2/o81Q9/06GcGfTfdawBCxsbRTPWrKtWpeAEBWcHm72m2v+c8fbwPenw8
 dBNmtSExTjnfLPaOjeyg59ehvlKAvBCZ0CiAf2s2p2JATeXsY76PcjuN34I5gshX2gO3qDHoHSc
 ru1bU0P7xW++qlJ4l6w==
X-Proofpoint-ORIG-GUID: chXIAzAajN8XsqNRnIP218k8hDktMdcp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104
X-Rspamd-Queue-Id: B434254DB2E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 8:52 PM, Kuldeep Singh wrote:
> Add register offset table entry for bam v2.0.0 version found on
> kaanapali.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

