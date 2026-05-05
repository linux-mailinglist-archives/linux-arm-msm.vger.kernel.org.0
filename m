Return-Path: <linux-arm-msm+bounces-105945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOhOO33T+WlHEQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 13:24:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D54CC8EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 13:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4550130C9DE8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C037D47DFA0;
	Tue,  5 May 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnSTWNWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGPvvbfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690B47DD77
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978588; cv=none; b=UbpnIWkq5ldYH3WMlQZ42JXJG9G6C+9XcE2N/C3fIM0z0BIQ2I3/PiMpN+9w/e1Ct8TA59jjY7MJFtdU6Z8QEL+bLrVaTe0I+LOvqGMDpiExx3ojXEEN6bhv/vW3CCt1SDTrU6NSini6Ik5Qg3l7uNp7l36v+ypoEOdfJRyEUbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978588; c=relaxed/simple;
	bh=pa+vF5TZqASsbMrR8W6ER/nESof9jcRO6PtmwJ1Rzcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eazoF6z0DnHGh06XnW8+cZpA3AF9m4vfNo1QCFaaTUofTKtNgkudU6CHrpbMmXBPPW4u4ttFGRUvaN+IWTJzR+vrILo8HzGk4Lk7LSsWVT6RVGIUE2dOOTd26qdl+T1ZmRu9uhXD4lXHTVgLh535CXKunENNZcXknkVyo+vSjB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnSTWNWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGPvvbfu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456HHrV331125
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0n/g4gZDYriruqMbsEfS/3tR8O7J3pmUA8YpZH+2SY=; b=RnSTWNWsIxZifLK0
	ktN0FYF9X+6hIsPxMBqYXFxJxAF2vP4BB6Sq0/inaYb1ZPBl+7bME9DE/ncORgYS
	N9hKS3BRjwjKaWlpqC1P+yTKQRyP2gveh1wRmDID48w3rHjpuIyRgDl83Pn2pj1P
	8sCf2lgGUYxyhNEH8cd92Xl9AH67FwfeHtB0UGuWs9RTlsbr+5bpgMcNpdBR5xrH
	YMRF2+yNw7kd9jicOj7qZHNKIdhhXLYkac3j0bbItHobrVjUH/wDUl7tYmbK3rQZ
	g7XEZnByYPCZhRkiHsMTZROa9NLMz88jWUb1GlNy7hQG+o8Zxuyop7Oe3Sg0H1nl
	loHR0Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1c4rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:56:26 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94de248f59eso311554241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777978585; x=1778583385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0n/g4gZDYriruqMbsEfS/3tR8O7J3pmUA8YpZH+2SY=;
        b=bGPvvbfuIHfEXPIBBTcbB+xNKkZrznVY7MYF16DiJwA1HUA24MO19xtHa8L2XembMW
         vMhRj4SsxL/+B++MrKRJ4gCL9Zk1Hkhn2opvTvyW0uHvqvPy5IFIeLpFgmNRlHjm361t
         8hH2Uq8TznWlcCzpwyI4DsJTNvhhyPzBn7Wl7V+lw8Ey+wYwiitZIvrUQZTImatVk0tB
         eTGBoGl7zifTHbIEmSJ3m3CsfFNJ5H32BckvDHsoBPi7IP0VjruSxf0SRoBI1h/zXDFG
         X7jLevv4J4Wh0hq9H1w9wIfzH67bP6A3aQ+6F50CDGdRMaVEvAwP3m2X0b87XeVt/BPS
         CFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978585; x=1778583385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0n/g4gZDYriruqMbsEfS/3tR8O7J3pmUA8YpZH+2SY=;
        b=abBjLm7P510kY0cTTVn97zj1i5dMobWnvCIldz0hshfMUhzYUFKeAkZeQsdp5DYexz
         TptU0ffQFH7JB1uR6sUxvp4/msS6KWUmbL0jjcinQQcMTfNs/k6T+kGalaso7NQAvr9i
         pkYAfRg/v24Bx0/P6rsXP2maYhw+FRkdJ7xclfqmlksp2VBwLFwnrEwmmNMPSCARQMGu
         9cb53d9v7AYutDhuQDZeNW2bswZ7nSrpbns+UIdHLhmf7fEKZeTfANCYmG7ptBDdAVWB
         f/o6iXt9NcLLatwO31fJJo+/RDOVrwsattPbH6T5cJb81x1SATEWpjbQtRra5gIVKIrR
         ihlA==
X-Forwarded-Encrypted: i=1; AFNElJ8yhBgcmHLZnZN4HKNAFXbVr/qut1JWWlF+dXKLp30gihAt6a/rkjqBTmTZHMQ3yXhbLToA/cqHVQYk/e+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwY+cl7IprN33kREMTN6Pgi8I04RLGhUMkBEsAqeA0tWJxopj1k
	/1nwIBae1FOuWPLsaSPh6s/IPArLpOFM0GbO5Bz6ugXvULA9LdsQRT3muCy/6ZJAmb/xJqLXpdG
	pS8gBPznPUzkwhhiWwvfDWF68KEs+TdkLqVxPlJcpCOr8bx89YsYg2BfnoUCqtGGZtpNRhOSp+5
	U4
X-Gm-Gg: AeBDietKCxg66F5rPUcWSKa3Q08x9cDgveUUyVJnHcge/FPyGIXgnjjFv+IQJhT3aR6
	XPw5SFSlTIwZ+valn1LqKLgoxB9Tf+FTE2EU1fRWd/hx8iVS7ou156Qb6P9k/SDFDvB77RWzj+Q
	47Sp34vvvRlvh+J1hvD+foVwC4/UrIslWn5xf9CVd2B7o6lp8bV+5SMmR371EOipqQedwqZv/IQ
	+V+bPxgjhZIbE0D//LwrkmdVxCt4vd1frU+eyIyXUCspjBBr5McxLKx/iTdyeLyEuLWRNxRaVGZ
	0R90ui8MIrJvZrrSNIh6uDVz1e75tWAXVBTw5U+em8nbeZALCa3IgkCsiSw9bo6HuqIGdFHZCX7
	oflGd4OuV3y0h6ZHvrx8N0HLehGtGrc17PfbXxqckJjMwnxE32vO1nki4JiA18R0SNfwIoW815F
	e6pVoKCuF8OwuC5Q==
X-Received: by 2002:a05:6122:a16:b0:575:1f1f:758d with SMTP id 71dfb90a1353d-5751f1f7dcemr2119104e0c.0.1777978585410;
        Tue, 05 May 2026 03:56:25 -0700 (PDT)
X-Received: by 2002:a05:6122:a16:b0:575:1f1f:758d with SMTP id 71dfb90a1353d-5751f1f7dcemr2119098e0c.0.1777978585007;
        Tue, 05 May 2026 03:56:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d66c90dsm483320766b.43.2026.05.05.03.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:56:24 -0700 (PDT)
Message-ID: <32e6d6dd-0448-4097-879e-6649df0f2594@oss.qualcomm.com>
Date: Tue, 5 May 2026 12:56:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: Move MODULE_DEVICE_TABLE next to the table
 itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505102854.186925-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505102854.186925-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zLwiv5zcdNsUKL6l4wtIUKmoRtjIUKd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMiBTYWx0ZWRfX1zFBlhTjp1+b
 R91C2jQePKNvMb2QE02XxK906Lcxk4dmqoqn6zzdZo++7JCdinDCvmyd8XHi2WUDwhgPGToYLRJ
 UJURYRPsKWQ+U1e6hkzBwPFzcRzWxIZ84L8zau4pmGMFgfThPNw/M5cyKPfM1f4HPbBws1ScsMG
 1HvHKIcEIvpFfALtnMqZFtdixpw3SjyiBanf3lF9rLDe50w9wvsAjUFVOWh0utwdlW21T3lF9Zk
 3vUZnN57naS3VqhxuOyk7R4G/refqbUZyr6WWK36nWfCzqm/3ovBf/Kc4AJaFm4IfBkYpHwGUAU
 qkBqEEBDjZxM1qkQYNURP5o6c5gb2FB5cKUuVChwl8+kn3W4FBNaihz39jb30FPYODd3z0pYBVb
 yLvc2xR41OofyZp/W8cUo39Vu7yJGmknEztTPSE56Vz2xi0WpQbg1bgHE20MMAt4gJoyz501Hi3
 0P3MZq37ApAFB/wFUlg==
X-Proofpoint-GUID: zLwiv5zcdNsUKL6l4wtIUKmoRtjIUKd4
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9ccda cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kQAhAZ4d5FSSWymYSLQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050102
X-Rspamd-Queue-Id: 525D54CC8EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105945-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 12:28 PM, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

