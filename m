Return-Path: <linux-arm-msm+bounces-104057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEIHAcWW6GnVNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:37:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 907DF444109
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5803302538C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF473C345B;
	Wed, 22 Apr 2026 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPdlqKbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdDKlmCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD35F3C198A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850622; cv=none; b=BLiUzW9CB/ZZRr7O6wpCu3IRnEn+FOp/PpmgTW9z1aod5vYW5t98tUAZqxub6ygfBq1j+vU+K1KFoA0Bc3fMhGaU2XiDeBxT7ybe22OOic8f78HIAF04PStNPJ1CnIrNHbW6IqK23VcEVOdVgNsNDSiPpAJjO6bWxoth7zqiiUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850622; c=relaxed/simple;
	bh=UbBhHaJO6heGVNOk8TuHjs23y+8tZ1bBbmcd1rAsPkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLuLcODNxt0s4UU7SWJ4BVDEJEUMMUHpEWq0hI01WV57rhpAtmhh47SsgmiN4B4thvZ0kcgGEaPrXm25wKj2mB3DRZT8kpjcijf914lrDDRrAzfMI1d7k7pevO4ELkQ+9NC+5fCXicr1HHq309FZcakCA2owylhWKq4zQXgtLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPdlqKbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdDKlmCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5KLhd2000979
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejxmbc3pCj/J84KsedCUn+567n5vQQYG8MwogqE8brM=; b=nPdlqKbJ/fOSPDAr
	DIn0NMDa1GFZW77RzzK954tsTqcVQqWHteMGbMHN+dSjB6OgowoVEE91k+m4WMrt
	4Kf8buR+w8JtKpGDj5jKKJtra+hIsS1y731ktQYAL8yso18Jwj4Nup0iO41DFrAC
	cI7VM8Z3sjeNWFnYZ3R5TDl0tQlzMZpNByR7NDOAF9JMM5PtYpIYiJIIwym7ao3t
	y4nwZnQZ+8KJX8OKbv5aMW03KGtDSjt3f2CKJX8vuTimfwMRVdTVVDY1UmQ4/pxa
	SNC3u9T/tdp/phhtS2/lReGAuRe0sNQe+OB8affq/wKMSYKeOhICE/Wvi2LUntSf
	TcfEXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfauq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:37:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb8e3294easo42304185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850619; x=1777455419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejxmbc3pCj/J84KsedCUn+567n5vQQYG8MwogqE8brM=;
        b=KdDKlmCC+FQjXMrxPEsVrENl2RFWQLT0fuRCAmHXvCi4l5SC7USPVSTwcBJk0wuzOE
         duMpeTXGSfIf08w+A+UM3jRLQtzMeatQmKw0yZkjWNKcg7+W+zW8lwqBJnb50yVnkCHv
         djpVo/HQWtIVZzV76KAxyT8CAmLCToqprSgcS/pMj/llUQW0DpVZP+RSLHEr9nT2lT9F
         Gib8HLhbn8vO8SnCugLzdnVCN7lOJN0YlPWkXM9ZvqpaCbfC0HLPKnXIGwEjLGCouSUy
         rzW1Pp6UW0O4hMjFLkqdlXzndJSczjclz6lHRIUs00EQFwff5y5j7lL/kerATNmhjLBA
         MnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850619; x=1777455419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejxmbc3pCj/J84KsedCUn+567n5vQQYG8MwogqE8brM=;
        b=qFLBCroBFSEQcIR92WtFUPwMvFO9IxLaCuQZqWO8EleB7dFmKuqH14s8mDBqFjs8Ny
         X7HweIB/H6F5jg4hM7kueDdBRSgdZWwJhJjmzEYfsZdyYju7cAiCtthKyeAKkNirHmH4
         GF1kIluMqSQ786zj+solLsjnt04sLRbpuo5RQB9d3/u5/I4U2M4cbGbmCuZYlCn7K47r
         LoHu9SZqqpIZG5azAb43QEfg53rS4iVdtnS+2jXRLEq+/y+D+61n5c0GVHJtJYnqhvdb
         QMduZO0KI9bLgRz3lnK9+wDiTmPLlp8H6FwCvOqXmcLgmMrS6hSXpcSqcu5tDVBOYfkj
         00dg==
X-Gm-Message-State: AOJu0Yyixu33Ct7DvOlDZt/GnXXC8OFF7vttEMTr8/6Pn+y0cRBVGpDe
	x0Peooo9miI7CX0HXkwiJ43NuIEdMJh8EJebTkRstHzDkWQSBjS9QBjSBOXjNOfsnvCsvJBC41n
	+J5qhXx2hCVQwIFW4BLC19qumzX7P6pT4+Ttv1A2X5vLOFX/gktpeItCxIDQ9iH3rQJ9t
X-Gm-Gg: AeBDievFTCWeYT0KoIBjNTWvfCgWwNpJpN02HYfgd2I4PUowef0pg5PIobzP40fGiE7
	MBikAr90khthhEnhVHYkCjYoQNu9tueXbsbsULtqSszDkXxJX7yBWRGyGe6P/EZ17OPjDpxTXcH
	ZJBh2uciSS5JO3hyc7dyn3d5W0TQn+UwrRPOmgtflxzSz8LuOQqqefKZu4aDLNpkazG/TDW9Pz6
	9a6t07flwI3eSBzVq6NVOMLeswihtEnkmkfk7QiSwTDEHnhEPpaU7ApjGWEX2HiRr5WulPx2uTG
	/hcZI3bwHKA0EmvwYiwoEPaYSd/cYdomoiOB6zAdQkrJh3ExdrxKPQqeRkpAKqZbWlGnwy0WNgz
	zjJ2xAPkXx3e1ZUfPsDDQOSuLdFLeBWTLeikBQQGCu+GfiKs1GKYU2Ip7ityzf2Cj6OmmYyEm4m
	5s+QMjrxE13yqyyQ==
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr844035885a.7.1776850619099;
        Wed, 22 Apr 2026 02:36:59 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr844033685a.7.1776850618562;
        Wed, 22 Apr 2026 02:36:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5de13sm3245083a12.26.2026.04.22.02.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:36:56 -0700 (PDT)
Message-ID: <d66d3163-202e-46a4-8e7e-c61eec4122b7@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:36:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KAALMWgCxdE4EqA9AIuO7GGhrxutnDaQ
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e896bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OVYcTxqJx27R85M3AYkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MSBTYWx0ZWRfXz8uKpaZLgkKr
 9FyP8cA6sQCcKw0FsHUl5v6nBvSityo+DduCGAA+qCij+/WRO0Td1twACN2bmChS3QhIKWo9YfW
 jYKEkJ4BzU0XiWyiKL4RL/6m7SsCTkJb63Lb2xOaWdGG9FIOCB13LSR1nglwKDJio4fMNfTKCpc
 PJ/nAGwoVfFrjVvPOLT+RAaSgrOoMQ4vtI3In2TzMYoCtYIhMUARu6uXoHZCGRi9CyPnisb31jc
 qKeN9a+jqme3r5g2i682j9TBYbC3nHUo5Rc2Ld9dEmp0AO6It2Rn725dhePgYvk0SNPhjpEIpQd
 tlwZ5h9GF8bD2nnLkaSVADAwQCUdy8rWzc3iy/hMrbWFrtELncPOPC7hegss9gW2E1FiuLJ9oA2
 X3lTncS3zZO/gm3h2t7esjg5rOy0imf+dSNlBfMnuMjmO2kdJhu5CK4p8PNrQke1jvTz0A7Z6aM
 oTYmnKtmD9xTDTmPg/Q==
X-Proofpoint-GUID: KAALMWgCxdE4EqA9AIuO7GGhrxutnDaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104057-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 907DF444109
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/19/26 12:15 PM, Mahadevan P wrote:
> The existing DP PHY PLL and AUX configuration for the Glymur platform
> does not fully follow the Hardware Programming Guide requirements for
> DP over Type-C, which results in DP link bring-up failures.
> 
> Update the DP PHY programming sequence and PLL-related register
> settings to align with the latest HPG recommendations. With this
> change, DP link training completes successfully on Glymur-based
> platforms.
> 
> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>

The tag chain is invalid as-is.
Should this patch have "Author: Ritesh Kumar"?

Konrad


