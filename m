Return-Path: <linux-arm-msm+bounces-90748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKAcDoaneGnVrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:54:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AAA93E97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 958903033A87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3326434B678;
	Tue, 27 Jan 2026 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dt9pZ1kq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuQg3IGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEA934A77F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514860; cv=none; b=AyZjInW1jcSsRpL6W3EcJOUHS5Jc4fsOL1RoTCeBmRolbo7yzQ8jOqkX3OVpU8TP+KBzihP9AdCOU7SC0Fop3PDmNFEzV8M/AWuY06+wk2pIeXkMzucm68eJC2Enq6nqURjeIHqGiVqbt8nVH3LtD2QgSQnEbKmMwJjNaqLH+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514860; c=relaxed/simple;
	bh=9eFDs61emi4sfTHgfT/aGOzHu+flEQ8b9nh1vAFK02s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2Zvk+JGAOad2p0e/gcKG81UPs1z9UQWT736r176LAp/kqNyfZLTHEToZAiT+6yqaZn7wI5onraIOxvVbI6iSEbto4w1hoz1Cvi0PX+3aBE4164t3W+Lpi+3wbq+RTcTKATXMiUN64axiCcd5bjU6gU8t8G9sCC9TKpqJDTfZ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dt9pZ1kq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuQg3IGM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAnqpM700163
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wnf8iBeyskshIVYJYndhWW4y/eBQme9JrGBpWCNWUSU=; b=dt9pZ1kqLuyahlwi
	OSa5CtV+2V/l522Hg5Bqu605oMv2Zm6Lc2lpdEVpMiI20dUgqOxebQ0Vam3q9bnc
	0/gkxvXy9OynFjXpk5aK3MNHTP7IM+tCT8L7iGS4DY27u+OQofYaACWk9I5zZMJ0
	yQ+mnuAfHAiBs3kX4d9vGRuCoazx2CPww1JNBExhzCsC+HRMOlUa3QfObNlMu729
	VTVVf9wKTBMxRp1o6ukZWbbjqZIZN9J+CtEosZGSgB8sjtmMyxgVXOeJf1C906FT
	qCs2kC0kES3rJ0/Pe6n/ZcJFf1OVMtMx8SoM2qOiXrV4J7TZpNfxSF8tIeGCK+xO
	RBiy8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3tnqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:54:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-502aca58e75so13841371cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514856; x=1770119656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wnf8iBeyskshIVYJYndhWW4y/eBQme9JrGBpWCNWUSU=;
        b=LuQg3IGMR++QAcgb9Yc9+TN0+zdF/hGRUTvBenIBV3TrTw9884DgebgGUI8DeX6pvQ
         zni4f2ntie7OsN8lcHnSXcvfYs6sCJLiNFKehuvQzsDN54rCMc4nmJkNy2f+Jjcfx+mE
         mjOOgmCuKzs4v7MWeuc10afmlnGLJD/EaR7elyXeZ50QNCmZeqcNyQRMTD9uRO3j5fr8
         KE67D1YuVAC+C4UHWjsI1OW+M1fTkbuWjfbvUcojNgX8QLNxX+oPERW8wkLpuF9wJJKg
         Cn+q5HAx0yIjXVC9M42SatkBe+PL4KflC2QSz9fk5Q2hbBTUpSnXB8ux4SmYQ8OhS1oC
         qvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514856; x=1770119656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wnf8iBeyskshIVYJYndhWW4y/eBQme9JrGBpWCNWUSU=;
        b=e38NQxWyaMa5QkBOatmjpme9f1w511oVCu+ze5BOIdw7hNbbzhZl13UrJ/lGIrn0BR
         pUSk6hfqFM3Hcz6j2IYEBeBR1yLAmED9wa2Tt52j6vZhsJGUlgZp2721JLLDWPVbtVCB
         JYeVs49w7inWTlxWfVkK4k8t+kScHQnMP+2BNSBe60SnzcFTj6F3JsqWYwDDJ4NwOJns
         4I9/ICXnYAwzsHlqDzfqmbML8eY4L9mSsirJjX1jR+5cQ95AIOGsQk101+LNeuxrP2mk
         T6yOuQv+XhoHAlrBvJvfhjnAfsj3p5Djjo4Ps/62p81asMrDFoqOMJR2kh/VdS1fZ79i
         rFYA==
X-Gm-Message-State: AOJu0YyUt6oLnHanC6mwtYdLxuCdi1tZpY4lbfKeCT1xPNZRwV7ukiVS
	tXBlxSK99V/vC/c31rGpHwDTa8ZERSxK4x1QZI2R6zhAgGQDUNu5SUPM6Cvf5vyVdbcahdOkXIy
	3t88YzZBwUtpXfHZSzAaoe3ANzFYrzB0YW21RgpIkOnNOsZpqjWaHvaYoRFknJvOY3rOw
X-Gm-Gg: AZuq6aJrawsWGuqX3YL6aUOFiGSwO1X76D/aARSF1q4qT4AYr/8EJ66nbpbGBCgrYEE
	R3MhVRRxo2DV35oAJog7LVJ1Ahgn7dgH/rch0WeydNgL+Q3sS/1ITETQu8KMi9PgKF1m1ccD4N1
	kQo62BEgixjoGSP5Nmr2c+2M5fXMoPxvrNlweibpozsRHSK2Pj7+qEQi5CicXOiMIZjrGgIkfOA
	TfmxZemLM5fVELGO8tSi4Unpr5Rx6UzXoLEpHpjea2TYjrj3/IL7T0caruJokG2hm5qAMzLHxSr
	38YRTVcNjp7wxs37Dggn9H6jdhplGkNSPqkve2nT3AWxxzVCyh3ULe//MZLiLegCaxUWy8c7ZJq
	AmTNYQqQPIGPEjFUK3DPZhLc+XdqVfv6pzaE/9xchx0kNaTl3bIgVwtIXbkF14uwGR98=
X-Received: by 2002:ac8:5f06:0:b0:502:a0cd:4ca0 with SMTP id d75a77b69052e-5032fa0a876mr11839241cf.8.1769514856039;
        Tue, 27 Jan 2026 03:54:16 -0800 (PST)
X-Received: by 2002:ac8:5f06:0:b0:502:a0cd:4ca0 with SMTP id d75a77b69052e-5032fa0a876mr11839011cf.8.1769514855671;
        Tue, 27 Jan 2026 03:54:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3f6ff8sm6356227a12.15.2026.01.27.03.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:54:15 -0800 (PST)
Message-ID: <1268a87c-a2c1-43ae-b99b-3940f4aff63b@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:54:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set
 memory-region for framebuffer
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
 <20260126-xiaomi-willow-v3-3-aad7b106c311@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-xiaomi-willow-v3-3-aad7b106c311@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fm8RGIrgJgSfncPbW0rkw7JqbMq490si
X-Proofpoint-GUID: fm8RGIrgJgSfncPbW0rkw7JqbMq490si
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978a769 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=xgpo1DY4mcIGgMJ4Mc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfXwFGsgfk8gFGm
 IeNPtvLfZMpMM7LTGD+nx9mCuZXXYHZIcMnMwta2FoAS3+T8Z1xJtBLZaA5NhNxOMftqCsxVSOT
 4IMNJfNcJozNuTKZNxTvQCo8fbS5VNt7gAtSdgV6Bf9ZLk7JVbrR9WaCBZHpasUMnD+66l7HZMZ
 FanLhxcEqV1qVUY6gA/suzJjYI4cuxe7vbo82fibnLGzZOEzo7RU+XrdfgumKDMWDVkQ4tOPWU1
 0KGtoPgWi6tU1ZApKItyiS4jZygq/wduAc0TU4kujojJ8roAk5fITbGjB9B50z1cxjq+qklApck
 iypIAugzz6z7UD7Zid52ZvMlwUEOMCpFLlTrUdNL0zA3HlDaEx36MyPPmUvJqSdg7mjY9MJrZZ+
 HLmkSWXJ2o1IKFmGJHzW0f+08t7RzpIdWJgkoHgr0zknbuWyt4qo+T6zq+hw9r0c3orR68Zu9Ht
 vVOyt2O/BPJ8M18hEpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.37 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(1.03)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90748-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mainlining.org,kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7AAA93E97
X-Rspamd-Action: no action

On 1/26/26 5:34 PM, Barnabás Czémán wrote:
> Use memory-region property for framebuffer instead of reg.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

