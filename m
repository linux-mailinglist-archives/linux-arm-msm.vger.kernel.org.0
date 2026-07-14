Return-Path: <linux-arm-msm+bounces-118977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /F0TLjbpVWp5vgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:45:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C605B7520AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:45:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aNmx+RMo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FvHoTytn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118977-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118977-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42FCE3000BB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4DD3ECBEE;
	Tue, 14 Jul 2026 07:37:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A283EBF19
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:37:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014673; cv=none; b=SdMpcWn8TA1LYUhxQ7wxEzJydKFSWjK2U5Xwjwk8NOgHPO+y5iW9C3I7yyszq/2OCtLKXXG0FiWbxDySwgqZtbF3Mpe2iw3UvSZbXVUbjeHmOE9otwrJZh8Q7Y5j0hWZZpmp8L5F6cuADwdsFPdUcm5co8/oN/QVzirw9Fi18WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014673; c=relaxed/simple;
	bh=r99awxz0Gqs2oWlAIIX7XqgjN6912zD+998H0GUE1g4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPhcII3dqqzxqs5JfZhaR7lghbng1i2uUo8lwrxdexi3UflmHD+pK7If+zx7fhPCrN1xdRkSadV8PXpdiu6yyfEJVk7lLEshCAX6j2SvCz6WWHyYDWWxrOODLZ4FbdC2BHqErqVNJ78yRGp8eA9MkTsStZ3xSqyqnnSiPuu2kTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNmx+RMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvHoTytn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SUw53929111
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8cmj7ExWQJxMmHoSgBCeQ5Z4Q05ZEN73r5TB6NB82w=; b=aNmx+RMoc8YaPiPl
	KpDEzaVaD+36CFPjZCr2bHaRaz8o2c4ACkNhiVYr857qoXE9ShoGgNxWrFpFfVIn
	AeTDls4TRCMsHc8i8D8vX2ph4l9LQEVDmVMQ0lRBkBbiedzqcnD3Zes6bqBsbvks
	kuPz4rRWKWiJPmVeijiU31xQ8CqPwGCvIhW28J0uONnJ3qQ+H+4Nalthdd293fZu
	10V5Gy7SZt9TszFior6Vv223V04GAt4VWJWHsJ1aT2jf9Y34dB+TV1HzvUP4WkNN
	dst2lu5c/pAGuEeVop05oz1ZzpGZNMsGG87bSi5KJwvdAmeDThyb+H3r2AtsDxX7
	VA8mHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xaw7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:37:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so85777065ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784014671; x=1784619471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8cmj7ExWQJxMmHoSgBCeQ5Z4Q05ZEN73r5TB6NB82w=;
        b=FvHoTytnY5rxjKV+Ad8fEIKMo14IMPm9eH/DfwmekNVFVsQXeHScTVpm41W8NMplIm
         Ae1CM3YCXFy6HooAIw5cWx8kW8VB9XoYoMnQ87kgsQ0sp/j/BFM3Hft4oeCXQOwh5V/r
         37WMLPPbgdj3PfP93DkfG+/+YAkw8b+XhTghSya3jBewGuBdsSRp3vztsQuVyDrdPf2Q
         1L+KF0EFy1JWjZot2DezHs/KeNQyZRdeW4JnrilN0InaPWs3tq8PszUBXgFBGmCFoNov
         exynzq52DVTVkZYDWS7fESOfReQYJHOHQfZTGxCJejlRuGRRh9XcC6dEt87s+JneuEL1
         NevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784014671; x=1784619471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8cmj7ExWQJxMmHoSgBCeQ5Z4Q05ZEN73r5TB6NB82w=;
        b=qD5wKfN1SOJgh4hUUNz+ARHGWFBLmD3Ovx1WF4T3u3qoBuTphCkC4u9xIR0nThIOwp
         mghb7Mm0I3YmKwLb2uZ09jkCwF/2YZxQUEfRm2ttUqygWPb2QLioQBtCqAq6OiXxJhPy
         +9b186JnUhJvw0meppSeKe3DbgKWYuhI+3LakZCRFigMSe5jTp0S7MOBG74Z4FscA8k4
         Rsp1HfdQTwO+W04re5AL+W5/ObGNJyzQACDKMIDuYkbt8jjrxHjDvOcX6Ekn0QP3yLwi
         ZozLylTpooesbsse7056Fll0+wxaRtpsUPf7eh4X/OoVkpCZ55DhSy/F+rctVxztl80t
         Km9A==
X-Gm-Message-State: AOJu0Yy1ZV2GxyavTVkWNKWW8HPyLCqjK9IpIPHHYnEu/9RZdF2BMkce
	C6iTS5lh6ShOmnMAs1aF88YNk9tA6AiOqj+SQ7VjxFPMjkEPKWaHeUUf6pDaB+lsj2sgcMvfh11
	NLkC2ini9GVujr/9MU9GRxN8IRYBU73597ZR/QPywjNXHmtTBD3vTrNEzdc0EiVf16M764WW4tl
	D3pb7uxQ==
X-Gm-Gg: AfdE7cmsewMS5Pj44nuLxrU45H7zgDadrwV8OEuHaAIN6UctnxZklwt3WZyfzYWyOGO
	VyBb2kC3bM5WC4NXJRwk28CB5HbOCA7lha3UPo0F8hrXNiXWBUnu9EdMe3Ngw4pQrQGlJPcL61j
	BPZSapUKEDIIFAedcEO3dXNUE+Kcnv/UH0IiqiWCE4lMIQT4Z4kWT6lDBdIRXLrfb4ks5IU2cw2
	YAp7Dre/z3sp/HGTFAwrtM4xqm7hrIaAiuPryQ5K1GDX7k7IuoqEvwNqmKWkfOJoFwoutfzJWZ7
	TPXUOVC6Uj1sqYn/mk4OS8xeGqilbS7DeUA+TqtoCYdbfJYHAmsLYZQB8xpcD+qbGr1IZN3VYAT
	AN9mwKku5gvTEp4iuJwFgOq+wOm7bHJCehljYMnV1R5TwPJTTVAg1qVPq6oxcXz2JEnwvgAS6JV
	eI0mw=
X-Received: by 2002:a17:903:3bc8:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cee9a8bc0cmr26774945ad.14.1784014670584;
        Tue, 14 Jul 2026 00:37:50 -0700 (PDT)
X-Received: by 2002:a17:903:3bc8:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cee9a8bc0cmr26774595ad.14.1784014670179;
        Tue, 14 Jul 2026 00:37:50 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm111613785ad.67.2026.07.14.00.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:37:49 -0700 (PDT)
Message-ID: <f7996f18-b63f-48a1-a680-467dcbaaa5f9@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:37:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible
 for Qualcomm Maili SoC
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3OCBTYWx0ZWRfX2RKbFEJzCbJs
 wVQe4B8X5at/JJG1M9I/pJAuQDA/AJbmLw8WWED5I2y+7/8Lc5R59WyR4tmmtU2oP+z+92T4+6d
 QY7E5gbxKCFP1GekIUb9rcili2iV2SwVw/rPvRPPaJa8hTbNWVFki5ANE0svnBUDLZ3HeGHeAbO
 fSsquuPPZMVq9MP2fkaqSFb/3GRmUzwRNxkERA2bp+JLvjH662EW5i1bTuy2Da4tvdzNXoKPnuf
 aoci5Powpc97am9VOFfBUHqRfz0T7tCLboMtRfajyfb9oSYQJrPwIKjT/f+bbm8+YJH+TK0hHou
 +mFR5Bc5HmNQlsTQBYiqcfd6gcACJ4sXWsq/EtCq6Xi1BeK6H1x1NHObiw7oMEwPQygCSDzYNrB
 7ZULK5KkB+oilzkcK9fxUTLheIw/9XsyodwrGXxpBwVzQuPfhvBbr5ytEtUKgbarXH0xw6NKZPo
 su2TTpn/w5ta0u5vHZg==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55e74f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fXidXHBQz6jtLiNKt2oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: eJ2JCtUdTGLF3UHh_eevQcGj8KJ_ryLF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3OCBTYWx0ZWRfX0xirhtC5Ncyf
 TmSwAiM32zjgNUmbHrmnSRNeVIE/ISWV340ngXGC093PtX9dzGnEJJ8sNpGrJCNABxgKSDwhOTz
 qe36rBoGjFPCXgldPD4MeVOzC8cRoak=
X-Proofpoint-GUID: eJ2JCtUdTGLF3UHh_eevQcGj8KJ_ryLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C605B7520AC



On 6/10/2026 2:29 PM, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> index 1593a1183a36..44c864fd5fc7 100644
> --- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> +++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> @@ -27,6 +27,7 @@ properties:
>            - enum:
>                - qcom,hawi-spmi-pmic-arb
>                - qcom,kaanapali-spmi-pmic-arb
> +              - qcom,maili-spmi-pmic-arb
>            - const: qcom,glymur-spmi-pmic-arb
>        - enum:
>            - qcom,glymur-spmi-pmic-arb
> 
Hi Stephen,

Can you help to apply this change?
Thanks

Fenglin Wu
> ---
> base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
> change-id: 20260609-maili-spmi-binding-dbecf60b498e
> 
> Best regards,
> --  
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 


