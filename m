Return-Path: <linux-arm-msm+bounces-80456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 998D2C366C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 16:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C2B623F84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 15:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C9F333758;
	Wed,  5 Nov 2025 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/xQTcrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wfy7cCy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B36F32ED55
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762356225; cv=none; b=W/OUmI9PkkEPlLovvOvVWhHk9mBiiXZzH70NciugONCozMUxLu9Hf2s4b58qTee0SqcG9dTNCsp7LkJkl3JrQG8vgOq6Da/9zACxHfO4C9bpJ2wCpXF2Xb6j6/ZiTdGG1SG75TNzoRzBzp3SAhWqbLwoJaRLl0jg+XdLsMD8qZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762356225; c=relaxed/simple;
	bh=PKXuPnAhtqmXtDzWb0C3akjyrd2DHMR9QTKQBXwRhds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDI73SoPznmZN+2ufVzzveeEgIaDuUhvi2jE9WHaELMNk8XBmA+inufVTGb7ZrtWt1tj3k28b8tiYKCFwa71bJhS0wAkkrNYUj0iwFmJDBnqAyFbdCpuksoIuTZuK/UL8gUxj6LssY/afj/MK+W33uRm/yIo03RWrqqZEprMaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/xQTcrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wfy7cCy8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A57uPTk159399
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 15:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oy3A07/anT0IBOVcSxy/MmXrPi4O7gBYhCS6+0G3uc=; b=A/xQTcrSL6ErtiB5
	CKDzUiAzIoX+fsWNodNH8cOKEIDVLIdaIBKj3I9GrvM55/5FxWudd0cjWSLLrGlG
	5UyNBZzRWnLpJ9DUXrCu1CXGZicEt4L9TnbFWo2ejLgpUr+njyW2KvCFkTEUs0r2
	3vRALYetuukUa1UbMIR3LNJAG9GN8R2/oEXiypHhBRux+l7EaBNbf96fc+ebVNXX
	g9ik2IHJGc9817ZIK6lg3GQLhX6HWH/RwrrTZgHUp3hdY047Z2wSAIzYK0h1TSfP
	gk5a1JvY9SD43Qs19OrGjQoNLwgPUjP5i/RiqhR+tSOkfTIM8cz6E0xLhcO/tuyw
	icIhpw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt1802-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 15:23:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33baf262850so2214a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 07:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762356223; x=1762961023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7oy3A07/anT0IBOVcSxy/MmXrPi4O7gBYhCS6+0G3uc=;
        b=Wfy7cCy8NSSOS6oXFSuA9ABMTWwjOtDqxQbJzyGXE9uqEEeF/N9ioS49J567Dw/KTP
         q56ef7aoGsaA403oZiRW/bsR+8lDb6N4jn+xk2P5cU8gHJ1xhWZI7OiCi1+BPP0uQHPZ
         EQ4D85Hb4tSTvTMAAjJcyFrOLzmPB3YTL3syf1b4nV2E4kXZShR6zW4F5pFPfUqOuVEo
         Y3Df75aGcklpmj3jVmvajRlIdXbeZSqs+5Iw6kAXqHkruE+DqJ46usXD0gl3tlkOZ4Ae
         BdzYM3UUXjQ0CFJ+rm14ZWobmUUqeh3T+dJyzlmS723lIh50WORPR1hl37MVJVB63971
         vP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356223; x=1762961023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7oy3A07/anT0IBOVcSxy/MmXrPi4O7gBYhCS6+0G3uc=;
        b=EB4VoVpIzkFCsOzj4WdtF5aplKPOk9N6Y9T9FGhoc3O11OxL9sVCPmi7dvXL7DDcEz
         JnxRlkxGG0cYl1bZMsALte4UFbHF0C4JVnNLkBhYFp5EvYVkrzpAQ18oztp8Sf4HEv6z
         HzLXBQSWe992DRFoKv/m7bunrV0cgRbZdH8t0h2I3+F+5nR4D1HRA6p4PbNzvtgGfL+i
         5OXnAM3QfEkQu6i5tWnKnGnZMbnUGY/3mP55bUaBFPW4d/2B2TYXJDM6uWp3rMFxR7yn
         IMTZlgK37oDYrukV2ocG6NaaH57xzVYwF0845mvbvCsqfw7NN36kIO6QfnaPUNf5n7kk
         XrxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW20AA3N2bKGtf1H9Bm0DOsjohvdQsoc2CiJiJW7OxNNZ6rcQuNg/coYtn5KysbDuQjpBgh02EyTSGgFgV+@vger.kernel.org
X-Gm-Message-State: AOJu0YzLqGqIzELCx5qJKixWG3C7r3SmI+B3MAtjpqOEQZ5g1t+9mNnl
	XMT1ZIP31wDx8SRsrbPa2qY0piO+EYsfvb+PO59nXOwVnAqw+BOS+LDA0eEcflFvs293MHYIMQM
	HuxLd9Htg3ZBNTi3pskdyWZ2BdSslG7fLGltYy4N8+acwhQD24reLVdyMaJM73shy/8iM
X-Gm-Gg: ASbGncuRW5HLvS48Nb+ZhW8040FfZllCx4wT2VUmDreq9OMalMRo6z1jtbd9xsSItkG
	cSNaX1vFnH8dhMmQH0F705EMb90lOCkp8fuhVFAM5Zl0ABWaR3N8xlyVK8w8PL2VHUgH3cZ8bop
	tqR+z3eLtZNfRAasnSYIi3m79VR5jPdP0TYoxLCm8gdftb8cpcuY3IKN+lBuerCDSRzn9p/JRh3
	b1JdHl/YJtqDUmQfQk74WJVGaVVHnsg2K3V6PTv0U2dPp6ZBheb/QRghGnQRpZPXi5NAw+hY/p4
	Qkzh4MtWc3B/4wb6JswWubsnlOJZsNlE8F75VVAI0jkwnCE8ziV7IIAsZT4VDv0fuGMF92CoED3
	uHQ77MbnjmmIsNZFk8H01cO36/6PZ5DiWQetvH/g7M+K19a6YYp+1
X-Received: by 2002:a17:90b:2ecc:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-341a6c1e327mr5200611a91.7.1762356222996;
        Wed, 05 Nov 2025 07:23:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlrZRl7egxuVMy0d1OODUkuxed6UHluC7bwHK4F9UcSTtFYFzhGGgWezpFwZeOpFSv4Gb3VQ==
X-Received: by 2002:a17:90b:2ecc:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-341a6c1e327mr5200550a91.7.1762356222452;
        Wed, 05 Nov 2025 07:23:42 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341abdec3b3sm2804594a91.1.2025.11.05.07.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 07:23:42 -0800 (PST)
Message-ID: <4006e05b-db5c-448d-bbd2-256253353da6@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 08:23:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Add support for PM callbacks
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andersson.kernel@gmail.com
References: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDExNyBTYWx0ZWRfX9RbnimSNl88w
 Pl/9lqzvtCPxHEc9QjeE6eUx7eTpidW7VDSG/rWCGd4SvN1ZYXCYXBihfQf4dVCax0/R5jrj6Nz
 tM5uo74dB7uec/mINtMbckqYF/N7Ws6yIuAb/dP4FyFwIt+jrVVWOXIK4ORzE8PvsWCJpkHQbjT
 fUlozAl3PZK2faZ39MQZ8tUB2Ok3/3lcpHzt90Wy9T2EpR3HFtTODxFRbyL+22uRJzzqm4EtGFJ
 qjKYSRdpgv1QTpSgycIrPmQ+5azMw/51FIZu0/Z+295EW88wI4vk60tTD2pYvRM3xztl971bSVo
 KSwVafjzMMynZ0KDIYaVCH7eLNF89NIzvUlCTKrqIB8UdXn1yf576Orl+y+C6Kx4YLhd9iiMYzn
 kDcQ6O/GzZ9up0n15G3qvoTArg06SQ==
X-Proofpoint-GUID: Y6x4qnH7onZ3y7gOoBxbcXIeB2ybKLKW
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690b6bff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8xjd3bi9v8xYZN13gnkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Y6x4qnH7onZ3y7gOoBxbcXIeB2ybKLKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050117

On 10/29/2025 12:18 PM, Zack McKevitt wrote:
> From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> 
> Add initial support for suspend and hibernation PM callbacks to QAIC.
> The device can be suspended any time in which the data path is not
> busy as queued I/O operations are lost on suspension and cannot be
> resumed after suspend.
> 
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

