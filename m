Return-Path: <linux-arm-msm+bounces-112384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aDX0L5otKWocSAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:25:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E29667D0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:25:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FLtFBx4j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BOZXWInx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112384-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112384-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D78331CDA99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED613B71D0;
	Wed, 10 Jun 2026 09:07:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A863B42FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:07:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082448; cv=none; b=XfcJQWZ89+46+SOClQQ2Ig4Tb3yt7FSd1TFHepGPQ2A/AWapEdbHUoBmHNAl4t7TErpMvDeUhIbKkXGnO+GbShBjxLToAxUVpG9ZEFtYXu38v0ppX/TU9yKk3yFOnFY1ScrckwcMfdmGZ5Aalk3LPrNdZdJELaKEW6War4zYAYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082448; c=relaxed/simple;
	bh=CVCOsrRWxRuKP37DNqiaGnb9hcJ4TFwAJ0rFFEr3zrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C8WTOSKphCeiH3uSz5Bmqlxc8vnbuDGyxa926mJWkuqpJ1YXv4hJ4OXjc/DHEvbwddxtoavTssz12xs97oCJPpU2gKuIgCb0/3PY9S5LBWOZ8l/wdHMzJBzEcSS8H9cTFacxABUPymCRd9zuwLqIi/ZP8EPkppdGd90tNTuIKKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLtFBx4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOZXWInx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnWF530332
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=; b=FLtFBx4jFf9TAwkQ
	jxRyjDHEDXAvL5lqHoYobIGWqNN4AkH14u07971RY7RYxj9OLQytXFlQDWik+c8r
	mFWwLaQMr5Q85XTs8XtP4qHiomH+29mXqQQSkJKaBHErH5TZdwguaKW68JjwlDqT
	Iulr8tvVEE1S6zOq0ZkZWbM5AuT+h3lI5wQ05AYL2Eh6mA2RoivEU0NbAWT+py08
	QjvFq2h2YGW7TYhLY3G93zIeulE4jnP3i6uyTVxZF1m/aIvjlF0ndatQ5YQkJnJo
	VPyxICyA7VyIk2BUuwuKLMTNJTCR5136/iYnBIsww6uHo3o9DNWECmHSWD//9TAu
	9Dvyjg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hn5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:07:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517796be724so13180411cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082446; x=1781687246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=;
        b=BOZXWInxg7pxy7ka7xhEBTQT3XH8hpn+TakPUziyFCTOf8LyMw0C2ez67i3ija6W8I
         yUnJUd/MNxag+n05o3VUycUe61eEaTcKRxO0fh8VmMsZN6leW2+yl9vqYMp6TCcCQBKk
         O0euAfuFd64RSen6FJCAgMpCfaMxqPjdD69wc8a8fttyX7pnW6AvbPNFN+1JliW6gReK
         BX8J+pHgRAKadK41CKuvwRdN7KO3/fkY8N3qe/9aMk3VoFlDA8yPNw5aoqeQZvU45rjc
         pL0YtAJn3n4m7hdjLOcl0kU6NdZ4TU1x102WQC9YbbpcfrhT2lgldlqjFAh00DkUL6BA
         OzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082446; x=1781687246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=;
        b=cs77KqZC8YpFIQFp14gNgNpRNHRQ+eimPeuk/sjot54q3me08/e1jgQoRZlTQL8G4z
         4BaB3WS54xvmIq4JoNLACOxgfEmzACB0D9UvDwCgmqwVDZSd0zuIH7XTm1AcmopujD3i
         wrDW1vMIzhgTW4Y3wz1+pQJRLLR9piePT29Ep4XHzUm2T0oVhL9ee93nIUwV89+WSLBb
         P8xYhnBqJ31Va7tWC8tw07RUi1QuJeuYYGZqP0ywyTS4n4nBQT05I0V37QE1WOkJj7mA
         /tfs7Iqn07bh975L8sKsAMvtiT66JWMu4EEraFxOeQG0CGb4Vz94cpsEI1L8S+Iui/cB
         Uq9w==
X-Gm-Message-State: AOJu0YywATCoqXaX1K0jwfoyuhYCmTRxJ6PkzfsrlbYZDP//ttQWy3+t
	3LoJ6DcW25pJHuEaWCPj8+FuHV7KK4fHcaIbndRi17jz2IA7OPgX0AvMRtEkdvYVAEPXqk9CeOW
	+bUgQCW4vsqZcxKSjp2x0Fd8wLSIPw96R5ogyPpXTjL6FHnT1Dxdq8A5nTsCCFLliLPNL
X-Gm-Gg: Acq92OHZD8F7+KrhtzEnxIhn4BRgAXum50cQWlIqabHqhi9BZWi3cPEq6qsc22Ypi2W
	qFxg+tIJzH7iu85+WGzMq5zrHlDhVaMxYjxv270TLq9MXzw6JTnQZ9XxPHbyp+WTQogB4GFA7yf
	Wg08kLwH+D6fuuO9rA1/yNh7eDOCTy7r4JIxK2RrsI9OtAEoyhLa9x3jUi3wLVYEstSpl0iXlTP
	ySHd7dRVMtXIW2gb2mEUSe1jXetpgZQQBNMhk4DIRtU6127ZDdG/0FVjBZwO5kAjbaddnY0CXHM
	PE/wPvBDyolW//+CmT3KJ8Vk986gCpz2JgBHQWFAChxRuoHj+vDIYJl8A4FnkmebG0XEMbs36GX
	fJStIsTKVqtIAiyxchj8WJxOZhQ7y0HfQdF1wFAua5d0hgOkQw0QCiloo
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr211515041cf.5.1781082445796;
        Wed, 10 Jun 2026 02:07:25 -0700 (PDT)
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr211514711cf.5.1781082445307;
        Wed, 10 Jun 2026 02:07:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0558f3885sm1149831566b.54.2026.06.10.02.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:07:24 -0700 (PDT)
Message-ID: <02b45c77-200c-4e1a-b84a-e18cd58d9530@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: Add defaults for desired arm64 drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-5-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-5-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a29294e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=G14gXSJJWdPwksqYDHwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX61+uLkjxusRz
 wMbSOfdjgSZ/EBGo22TfyNbkCksW5LCreYoElhPJ5Oc+x3zzHnaiUNvGbwGkn9fa/CnuIUUnBUJ
 BpRAHE+ZYH6EyzX/RO94bS8w5w4L3WTrH2MXyiBXaKNPTiSM6qjJ4qHvd6CF0agATi/MTEYYPH8
 HsQiRNBK4jcpYVgx/YMMbAhdsbpAXiLHl1G7m0xWW6auUQiR2Q004o8rzyMk1MFQt5zlvOrKl+T
 SayfoBcj1c+/5zQVioyIGge/QYFCINU1zPRhMmnVvYgYbXaMbe++wf7PJpCvA5JgRi64rCnzNCW
 Jn2WLsgcobH33k66QqPhWCePG6QJXdFv7xiTcTlWi7LaQ+/pF+IZd/2OwjnAqFyulVT9bT1U9hT
 q0ehLM08F3LjH2bDPsr4DuCu54TfSuAvHuS7KB+1p6/T5fXteygTkKfBiuVrLuABp8yZFfF/hOD
 yZil8LpFazPvGWdKhBw==
X-Proofpoint-ORIG-GUID: gi3eN5RO4BgR4Vpn4VwKNARR3Wc37cLe
X-Proofpoint-GUID: gi3eN5RO4BgR4Vpn4VwKNARR3Wc37cLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112384-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61E29667D0E

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Enable drivers for upstreamed or being upstreamed SoCs, which are not
> yed enabled in defconfig: Glymur, Hawi, Nord, MSM8976, MSM8998 (GPU CC),
> SC7180, SC8180X, SC8280XP, SC7280, SDM660, QDU1000, SM4450, SM7150,
> SM8150, SM8450, SM6125, SM6375.  Note that main GCC clock controller
> drivers are usually already enabled for these.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add defaults for: MSM_GCC_8976, MSM_GPUCC_8998, SDM_GCC_660,
>    SDM_MMCC_660, SDM_GPUCC_660, HAWI
> 
> 2. Drop the Konrad RB tag, considering above a significant change.
> ---

[...]

>  	tristate "SDM660 Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select QCOM_GDSC
> +	default m if ARCH_QCOM

Drop the 'm'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

