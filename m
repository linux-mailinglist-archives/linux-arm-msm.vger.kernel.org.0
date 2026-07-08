Return-Path: <linux-arm-msm+bounces-117630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AWyABqBKTmo0KQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:03:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C572695A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:03:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NokrrRbo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gfqYf/AH";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117630-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117630-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AAA8300C33A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF1B25DB12;
	Wed,  8 Jul 2026 13:03:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810EE3D76
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:03:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515795; cv=none; b=qitJaqshi2Whh/NMBhFpidmecTFvW28j40L6rZjp7yqtGGNui0ZERVbzcRjl1Sj9yyn/Fz8WrcU11x17FXGW844EibKC0s8YUijbiUjmRttzIWPNn68TxvepUwnw+N36aMXGcZLakMn2TPz43rcE8ckbWEMjIW+UI/BzS/6ppu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515795; c=relaxed/simple;
	bh=WdAXu2wQhnSrNal0fclWdl3vSbNYAndpe0G+kbfr2XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYGycPeCrmJTiwNk0J7iaGeIVJ5+d1D5P9YNQogM1MFBK9dlvFilc0JiIP6FmKupBhw0OJN5cCCzOAEInhWGAo2YaHdY9IutauSb3EAzcSSzePiU7aEQ3qpp5MwF2DYOatkh3UCVhybCWzM0C0e6MCiZ/llrjMIyCrx2wdHg//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NokrrRbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfqYf/AH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3RGh2667485
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=; b=NokrrRboT7RTHzyS
	x4K6XgaFT/nO5k38Xa09rFmoVor9vKZIi7qmnRlqP2d11ThnH0pdBItRuseWlEUu
	vMRTOXG2CyiWQtu1i3jJh7llsTdKR3cOCrd+GfH9mP/8Dku7sv0P3W1kCIcAmW1q
	BNMc7Q1vAlFUf3Lc1j7jRIEDwq7APpArJni6cUbQrspcr+Y6ZeHAQRxi/DSQ3s00
	ZcMSwso3eJrAYeCodkxOjL15ubgwPpNQY13EgIOlPkHgW62qqVf+0+tkT4zB/GV+
	g33WtJChJzXg21pvgicPbuCKLglZsEtjBVJELcMRdbwFPVg/qK2URFjSU1gWxd64
	M7WtIw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgu8pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:03:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca81c58d63so1842055ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783515792; x=1784120592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=;
        b=gfqYf/AHTRZ61BqCiEAaDtbsRy1AM+QDd6zb1QIinhHsn+Hg3oNEXiF+9cg0QkHnOl
         m5xTcvypDjuu5A+ZAKO+NlxBNkKlibHXGfjn1IjdmRF8+13BzM+CLS1AyhipFNTadGob
         7+37J3TrKac8UiDu4fbK06P3rAj3bH7ZuxwHOZ9PQE2agmF1vqpZ5eX/M3Yhc960Xk+4
         Wze4weOsf1I7B6VumdEG9qVYi3l93v8VjHvykxjpZbHhkbc8zyEa3ptLYkN3KJKl0cgA
         koW7nIw1WYAosn4fSwns5+UA1VHV6jhyu01K/4xPCEO3AfWglq/r+M/g7LvHIaq3+z1E
         38HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515792; x=1784120592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=;
        b=km17vlzKv4m+iUmSdWWex+BnBTmBCSM5rcnXaS4JdqDx+ngHlPXbZBioI6mzW8SWSU
         Q0IUcSzGt/9ZLaJRnxCegnqQ7pzSCkypEmf0Z3zgUBOfO8XEkLeBBcbkj15WXNnJF+qb
         tkvuuoFZz2RW28NuFpz7Wkr2ZYp85/5zfijbZNXW7MfxXTjfhd0z70xqB55SA2nhLBY8
         J/D4CKuIWziMnHpCwRTH84Vwt9phOd30cZwnOhP5gnlGnCYRGbhonWqUBUnfLCPhza35
         yJ5cx2naJSqyr3Y0abyAnQZbxzpmrRhJWE+M6m8GyB8EBkhDTLhapxAYJZ13fECefOZx
         lzKw==
X-Gm-Message-State: AOJu0YyeDsVqXgpi7e3PQPETSuSwKATTH1RdHmHSLZcRoScR/4VzVve8
	OuTd2jiCkWvXZjUCzBXE61M9x3duIcYwRrtGcEzUrTxVPcomLC9QroYKvtPITaN5GQQ8OaC3LmI
	frKxBXxzRfQX6lzmI99wVFn5jJ142AMdokiCbmZ0p6zeTOD7DTtF8m0OL5WNrPH0ziiJi
X-Gm-Gg: AfdE7cn618ayIC8qatjn+cTZHzFU8x1WeFupLkOHIKEi0o3V6UbMv4gq5arD7JO8Yyb
	bfUdxvjFe9ZdgK6MMfYjHmnZOUK7H7fnMHEFiZqXb/mytxZeRNPfcz033Qymt3xu/FLHPYVqGMd
	EDznHZ6fXzv5zVDfbovt5p3dR5jXmMOAIMO9hgtVyxSqWl5nhlluxbm7CkoZfxfq6Di8fKHejMZ
	W0xrLgNV+WEY00b5W3CV7eEYCq+8c1VCQD2a30jYFWlSC3EkNJNEzDuX9SDas9WsXd5I0YZI59O
	E4WI3gjC8dv6AJzNxVMl0sJ2rQfCsSj4P1cwZQwNyVV0jrm5wo0DXddGp6BLpHTGHmKpKsjHc0T
	sUx86PTOLuHGMxr35x9hFaU3bLEwMc/1zAu8=
X-Received: by 2002:a17:902:e747:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2ccea276712mr21921365ad.0.1783515792332;
        Wed, 08 Jul 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a17:902:e747:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2ccea276712mr21920945ad.0.1783515791798;
        Wed, 08 Jul 2026 06:03:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3859f69sm89230266b.27.2026.07.08.06.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:03:10 -0700 (PDT)
Message-ID: <6d2f66e4-502c-4f69-a57b-0cd779cd3501@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:03:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for videocc driver on Qualcomm
 Maili SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
 <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bvx-mpYVgpT3ljbZE0xRfUAxRRLZ1Wz0
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e4a91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KabViBKo7pAC4wHH2OwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bvx-mpYVgpT3ljbZE0xRfUAxRRLZ1Wz0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX3DWkCYwIdC+0
 a2uHE3E7X+lTkaLdUwtGuk+tpQCHBq53bOcOr62mv3a1UQFeFvXUPXSvRG6a7uSBfYc/gIsDgfs
 LzfH0Ac/1b3fD2vQcTraWZ182cqSSXc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX7YilOcHX/yq5
 GRBLX9X1b2k6/S8ky+jO2+Q34u1ZaQFHtx1tLj/OoFA1/RY7ES25i7Q3SOz6P0txDyT0eUEsfe7
 KMejQNWnFrHmr2OGf/a+AP9zKsFexxzOuS/Syu0o1dTow+eN6s6KPfno9YzlmRYbhfGfaj3rOfh
 1Fg71z+RwAjVPjdhtFrDXPBykHKb4YTQLgzqwH97skPjndIM9VLrOSduyesLJaCRhfAn9YrTPaM
 k6l9HxMtG462JDdH25ne+NG3WYzaqJlrs8rVWoxPJlTNjexrSPp51ubSMxwjXi4+QyrM8AbTTHK
 7LzQvhjEJE9tvxy2G9xWTQ5Rsph185Iix/dy/TB/ZXT2TkbBepA4Wy9IDVjKleh052yXO69qpUW
 21452j/SMj8Ln30P6p7QMR5l0VInIcGAx+AI1gXnrjZsYqgL6ML7JeSTZEBnECv+3oL+RkV6TOt
 h14U9Fx8J+PnwkwJ8rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117630-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B3C572695A

On 7/7/26 8:13 PM, Jagadeesh Kona wrote:
> Add support for Qualcomm Maili video clock controller driver for
> video clients to be able to request for videocc clocks.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

