Return-Path: <linux-arm-msm+bounces-111831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ak2fLA2dJmo1ZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:44:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D437655465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:44:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=REvkcG7N;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h4gR9VzW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111831-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111831-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80BE1305D207
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6424D3B52FB;
	Mon,  8 Jun 2026 10:35:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A373BB9EF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:35:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914936; cv=none; b=UZ+myJvRzi/l7nLHOclxTGZh9t7GG2igd5a66zAZj5GQVSP5wqOTjrEbVYl+8lIrulmwCb9kBhFEvW06jbr0zh0P4kRzzjTRL0LmpKL5kVwytayaaFc+bOusN7ZUDOEwO2e2MBLpXYq6iJRRwgvJkiNysvGru2bDf/3bDmL/zD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914936; c=relaxed/simple;
	bh=FVM24WBqaMagISzpUGWgdhivHwLozYlEFzZscEEqlXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSICBbV1HkcbadkhIVYrLibMnkwpVAtfb8lLQvh/Mp944jDFY+J3+DVveIR+G9vBeLlI4lA2HR3zwNPiPaOBay5WULXBDMHqInyiI8hKV5FKdXu6k3XP1BjtjomqXhzjsfVKr1/UXPbOwWuDp9kf34qrxz5GEhQyp6VK8tSI55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REvkcG7N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4gR9VzW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Pkqn2733097
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5JbEetsrM6ridwfrxye3mnM+0f/IzAN2T4I5PfdGCd8=; b=REvkcG7NvDiL94Kl
	bRqk6Oo/yEMlgz59r+gV3Ue3vYVah8ErnV/C6ckxOc8EnHkDCnPbgf621WXpZUlu
	zARNJlus6YhZ/ddBXiy/6Kks5UyOxf8nY1TaMQh+Sg2qtFxcAkBQr4uk0FO+lkdj
	aQhwMLHhbc/M3H6iCdnd4wVFcQ8LWWtt6Ge+MSDFZzeQ6wG4r4rqN6IFFVGWP9kS
	A+1tV0469nLgjFYcqEZCQqK2b4qd+wfdco6hS1XTtG/NInnooRDS3O3zruWcfIVM
	a0gPkiaNEUBbyi9qNhtdCksXX/9WvMBPfIdpjKyRbq66WbV31lBu5D//sEu685ZW
	nLsPGQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf7g5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:35:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so53481045ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914933; x=1781519733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JbEetsrM6ridwfrxye3mnM+0f/IzAN2T4I5PfdGCd8=;
        b=h4gR9VzW4WMNfGQVCRKOQotu+pnoq9AcXozkTriLqhE50F39wUQlG5qyuFsV77ZUVm
         iXA4FpPkY7Ch9g+TpkgOKG/7NdvJrFmkSwqgQBrjiH1sKBBCuvcD3h0ftQ4PHmCbyglE
         m8rsGUL9e1xGO00k8Hj+N5asHNmupGemCNLjvr+VtyeZKAdDX97vvsffZ9anh8el6IFU
         AXvzvCXFXfVO8rH68hE4vD+PHpFSpTwJzGVrfyqxYxDmU587Cg2nOOZT4MchTN47HP5B
         2DZ+YYaarggcut7HO5Tlb9tvdUMROD7iZw8cKBjgaZqb/FD6N/fElueqZrrmEhHe7Z0U
         E9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914933; x=1781519733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JbEetsrM6ridwfrxye3mnM+0f/IzAN2T4I5PfdGCd8=;
        b=p/kGVi/auMQ4Yn4W1u2KFY8LWRhklrVmO6oSVH4HBmHJehS6jZtqItM92yLArb3AsX
         5Knfy0iL4oNHdrpO46H0Nru7wmCKhsEgFItjJUXw/lsv0jvY5eCO27xkri+LeG5zuwfk
         ML+eG7LK8gyWT3rzuklqLj46c0agF8nIFThqd22V10BvG+l+/J8yPWYKU8fZj+WYgY3P
         06uJtNN/8ThHp0yQLz9d6gs7QHJKQePs/1zPuTcHCkhCK9Ga4pKyTHa7KvTjGS6bwMUn
         BHNnA6kdeSgefmTYuiw6JLLg1qZQWNDZxfivW0CdyA8iCeCQewk1vGlI3c5htUvxIffx
         LclA==
X-Gm-Message-State: AOJu0Yw33QWEsZyQ2fEuevyCuIlC6akafzljZg7NgaIIfMScUc0GRwTA
	PaDuB1sdot1B/r5lKZviRnZDJBUmWtpfmwV+KjVIETCNoMezqdXqPuFsCd0ZQDpZKwXIas4rFUB
	WrGMgupGN4VyFn/qd+zylNax3absG+CwB+zy3A8PhPlzyhgz4T6DqUbMheN4O89mVMSoD
X-Gm-Gg: Acq92OGfiUca3MqxxA3PPj42he47rlCgrh+WNaRmdHr2qyQcU7XrOIf+bL9YubvxZ+4
	S5iwNEOK3FTkX/38RNGR0gsxn45nB3Eqd94sgFASFPF/8lOsWLZm11x/oNwAdNcmDlW8hRS45oa
	0eX7OO9YHWLw9i226bvn3apKb6hPEHERu/3ffSjU7Gvodr/lDD0X2DKwUbNvJO9gX1bPXtvfOkM
	CHQ1y1cfhCLExcJYIHiR2vNN7mwboa9kgL67nNNYtngD3hwTYqYeleuTDCXpa5lmfCeldlKpX6v
	g7Tz7181q3kodJBKYlCM8gCTzRY+KS1zVHFop4M2W3Sobeoo6hgA9/p5Itr2/g3lJVgfzQoY7fG
	qBnlc0z0Lg2G/6deaCDaaZz9EkL/IRe5X6tZ2G4O+Lt0xGxiMStIPiAUcPF3AqqQ=
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr169901165ad.0.1780914933147;
        Mon, 08 Jun 2026 03:35:33 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr169900775ad.0.1780914932684;
        Mon, 08 Jun 2026 03:35:32 -0700 (PDT)
Received: from [10.217.222.59] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166396fa9sm177600475ad.66.2026.06.08.03.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:35:31 -0700 (PDT)
Message-ID: <fc0e48fc-0cbd-4f70-840e-674b29260a1c@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 16:05:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a269af6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B3AD-90MoOjFDUla1LkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 3gu2f_wu4Q8eOcGfc1AG2yZD3l30hxHo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfX8Lfv31x/5hpo
 vHlnh6e1HuCz7ZbIZCkZ8IlmWwR3U08+gr8y14ma2Fro4ZpibmIWkqmNBa5F28eYSO5na1km9Pu
 hJvUR9TCNezj3Kqn4Ic9xK8fpNxZTZqrI1uKACoxHJYfZ6e742SQdtUhN3iIrOAZDg/tTZPhOdo
 7enKXSB7NTwagIwtGVafSihQJEtUGGwt2ryEK/neFpcLD14Jy6vZShdwETSJt+8qshxgVLk94hz
 NVv7ww3FQHpHgGAQHv2GCLIZmiYK6ca5eaaqA4p3Zq8v1ELy8cef7mig5nOXeOy8XWAdktI9XOR
 r9K1jg5pGsZEho22M/zndLSgkpef2jyhSxpvlMLdkI87W+NesZVOfGkFr8dD36eHu4/eRUhbGfP
 B/KP33yeJMcaaHSY+IKRydl78HoO2XVEpfncRrUhvdoB3zeWuM/mOAm1c6lMr939Y0PyXyxhz7B
 cz/7zBf2rFYHW6THqnw==
X-Proofpoint-GUID: 3gu2f_wu4Q8eOcGfc1AG2yZD3l30hxHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111831-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D437655465

On 15-05-2026 00:53, Kuldeep Singh wrote:
> Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
> Shikra bam dma supports 7 iommus so update dt-bindings accordingly.
> 
> The patchset depends on below. There's recursive dependency so referred
> to base DT patch here.
> - https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
> 
> Validations:
> - make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
> - make ARCH=arm64 qcom/shikra-cqs-evk.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> - cryptobam and crypto driver probe
> - kcapi test
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Kind reminder, rng/ice/qcrypto patchsets are sent together sometime back
in single series and please follow here[1] for discussions.

Please consider this series as inactive from merger point of view.
Can still use for already engaged discussion.

[1]
https://lore.kernel.org/all/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/

-- 
Regards
Kuldeep


