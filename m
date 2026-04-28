Return-Path: <linux-arm-msm+bounces-104906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ap8FnRr8GkITAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:10:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B947FA80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 783EE30193F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2546037DEAD;
	Tue, 28 Apr 2026 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlKQij8S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htbhCrvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307334F48F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363724; cv=none; b=SkIa4P7BU2rILUFlpBd4JfM2A8u68iAyp3haCCm3Dlt3SlLMYjgQIQx0Fd/QXTZeOeepEvqu/BzO05CjQ6uAAxM0ThJVkh05BeoN3uOBy4tnd2oCOfuU/2NevKtgnAAev0ASXl7F/hKup6XzKtum5c7495UgNpIgCLAU7H8Bdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363724; c=relaxed/simple;
	bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pabfd6nhrYO/dsYWKPmMS80P6OKaDFKfW7HBO7xuBsR15kNjtsZ/RIBOXfbY1WRTGpiPYAA5zebMHJO7Xcguk9ot8A3k6HwSwBLa4Fzf4udwTm9J6b2YBhPH3B8VPjHHlP+zjRSpkjQwe6k/i4QjdnO0jLUgbbMHf+7RkyX1We4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlKQij8S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htbhCrvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6ODDB241134
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=; b=WlKQij8S0tlpwaSO
	1N8mKTGe5H1O52lOrh8HwAaeYcsufyFNNcIorv+KdFUNLiBSiQBNzS7GwtQdlmZC
	e3nBU7TOmAviuumnLZClaHbMliqdhnkpNxQHYvBv3XSMvOl5fSYNfWH+8YdkVblj
	8XCiobRpobU8y/FFR/HJxrc9hk17Nx/n5BrfZHIAIruBSwRA230ESvBkd1B9hEBR
	plQGKdj4RVOxcGLN/tsqn+VjkbadOwtdkBRA5fuPKwEch/GqImViT3mgyfAsEHlg
	vBnU8AB0MWWpBl1NceBVIjuZf35kuNeycOy5aFg0/zJRBZZOUmiHja0bC2MMNnX/
	n/gNcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946upy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:08:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35e59791605so12130068a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777363715; x=1777968515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
        b=htbhCrvHbL+2CDUpKc6d8dLbI0OegLm7c8hZFRjLxq8zSD5vII9NPgB+Fi7kfr5bs5
         we/QRsXy1TJGsrGAz5duDfhAMOwIIwKcbub4kcAvx0KNJowiicPD8Moy4eiVyvnrkfWr
         j3ajL8sJnT6MloPg9Lwf3r2eIKkrmQprzcrqvuwlJFRQN3lN0zwVrcyf8QAkaGjm+8dJ
         XgJ9sC7ottPi6CtqyMJ1X+zcN0sW25wD7ZPxUNP/I1SHmS6ZCl68TQIZY3OOq+Gy8PNa
         /d6s2OyazuFox8BxlHLgxWTaWyndElL35PVbNwOIhy4d6k/0n2CuV0gZkCkMfSNR0fAD
         pd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363715; x=1777968515;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
        b=Zqi/cVkwUwLlEmHFBGzVqo5EEt4qRhdZ10yjOLwEhF99NWSeWa2g1LFT9baVn8uC0e
         8WQq/k9mB4Lzg6rjhZz9RtIDF6FCpsqhlRtHB1aaoLs1nSx6GKwZuyM97bAQwy6CRSe1
         qSH8zg2nCFPxM3QslRxF3iWPRUSfPNhKwz41hVqFaaSSuud4+l9OCYPGxanZjny8U3Wg
         kxsj1BcnhRQbQiGh1aNrq/hEyYKq3UlDTRsNjXc+9b0whyNb9edVLQdpnRtOVFQyB4Rw
         SR7qZNIXRYZwy0N3HhkP8puuZ/TyPKsQd2HyWaKC2yqWNpub9UcsbStICnjBHFK9oA8B
         f8iw==
X-Forwarded-Encrypted: i=1; AFNElJ+yT3DmMBKDO4bZsRKRHZspCqRC8R90rMSlKoeQRZzsbbfK8aIQKb/V/cZIXapOlqCF09VqUgQRPVvri4oS@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5VLU4T7UEnM3owe9fWzKiZi1slgMQ98+JAD7EBxVFtkjC9Zy
	LM04CWtBQPDMbCOyNrElAAyxGwVjDGK+DP3QM63txGS2wfpHAqItXxwYO+lTQljfoqy4WoDfYch
	G1C0AWciVAtzpd8jlru3PPM2Q0lMM25QfssdWOKQ4EmiQuaWvLg80IBzOuvE8BGNvdPTr
X-Gm-Gg: AeBDievQnS5zzxTIEMRFgAggMp669xoNirXXQU7J/pvJKHfEK3njBrUihbmqMHq5SX2
	8lZLWVGtLM7UqxoBj+cFaj7NJ8x3JXGC0rMODCz5LxklxY2pVpDEoE++Q/J122HqfVyZ+D6thnm
	tZf8Z4Pi/eFXjSSbKYo9bqAX5Lf/pmUwZEu8ddlfnaw0O040UGdpxGehGPFKOuPGjHPRNCbMHdY
	LTvtj/EqPuPLXFC4shqKLzeQenXhGIexs6U0+uLyZ7oKFQZ2uq7jdMFYsXvBktGDT2Tg1qlZNfe
	4mZG8jIiBmHjBatwzb9G2bB/my0nkjdoRnm89ILQnTCp8Cy99Xqk+jt+LljVs9eo6L6MUfXlM1U
	ynTiZ+z9g9zq10ijNBIvQBH8AU4fPwJm8GeW0J+88tNbxGHueBOS5O6xsf4W59HyJ
X-Received: by 2002:a17:90b:2e88:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-36491fda867mr2410759a91.9.1777363715229;
        Tue, 28 Apr 2026 01:08:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2e88:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-36491fda867mr2410709a91.9.1777363714720;
        Tue, 28 Apr 2026 01:08:34 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490c4f3edsm976224a91.6.2026.04.28.01.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:08:33 -0700 (PDT)
Message-ID: <97aa5f18-d1d5-f082-9075-a385255f2e97@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:38:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
 <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
 <20260428-nifty-quaint-hoatzin-6de65d@quoll>
Content-Language: en-US
In-Reply-To: <20260428-nifty-quaint-hoatzin-6de65d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f06b04 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HCVpI3b-1_oNncJzd4sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: CHyoGXiy4PRxVVcxiVMBQLveG9kJO3_F
X-Proofpoint-ORIG-GUID: CHyoGXiy4PRxVVcxiVMBQLveG9kJO3_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3NCBTYWx0ZWRfXxNc+P737zUhc
 toLKVWJdAtgbi9n9LnU/tsI6qzP2ZmfDEB2kBtu4DH87d7jaJgcGUI+VzDN3vtdkPSPfm1BnjFl
 N41kanTkMPJcufYOheYcpd6oZPw+tfTcFyHyWFr+PRQjHZKin6ec9g4KVlSgQwCNNL6/1O7Bf3o
 Fyw6TKZqh2yjrljVwGeujc3IF7cp1HDrwuWDdtRRBlxfke14kpRoIzLy/NFdFwgsywS2fF7BjCe
 5dVXkapGa4qZKGQaHr9HTwr6rGaI4SI9tuOJEJEMrzkXHp7b4ETrZ+16RPnMWqZIZ1JA0SLdm2d
 exN6vUJX+472fcut6htitDBtbfmiEIiqlZ1A3EbK2rG1XWoL8+AqCoQYWrPqh64OPR9rXykA1SB
 WMPSqR9lT1qW3oLxmS1MQLjtpx5i59hUw1jpexhncnMLNoij3iR2xQJ3fVpKjmsv3fCPMFnMzA7
 9v5Ak+OlO822Y+WL6LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280074
X-Rspamd-Queue-Id: F37B947FA80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-104906-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 11:44 AM, Krzysztof Kozlowski wrote:
> On Tue, Apr 28, 2026 at 09:24:08AM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>>
>> To accommodate glymur clock and power resources requirement, the maxItems
>> constraints in qcom,venus-common.yaml are relaxed. This allows the glymur
> This is a very confusing part of commit msg. You cannot relax the
> constraints. Each device MUST have a specific, fixed constraint. It is
> your task to be sure they are not relaxed.
>
>
>> binding to inherit from the common venus schema without duplicating shared
>> properties.
> That's obvious. Why would new iris device schema not use common venus
> schema? What is different here then that such possibility exists?

Glymur platform has a dual-core video codec architecture (vcodec0 + vcodec1),
requiring 9 clocks and 5 power domains. The stricter maxItems from the
qcom,venus-common.yaml takes precedence, making it impossible to accommodate
glymur requirements without updating the common schema.

The same thing I mentioned in our earlier discussion here,
https://lore.kernel.org/all/6d5516ab-f693-e605-77ad-e3f7d0bf579e@oss.qualcomm.com/

Alternatively, I can drop the $ref and use additionalProperties: false.
Please let me know your preferred approach.

Thanks,
Vishnu Reddy.

> Best regards,
> Krzysztof
>

