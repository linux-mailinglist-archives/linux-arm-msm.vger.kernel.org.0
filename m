Return-Path: <linux-arm-msm+bounces-105174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEAcNfTT8Wm3kgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:48:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B574492470
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B9D030231F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDE73C3C11;
	Wed, 29 Apr 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHrrDU6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H61FncHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFB13B6368
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455947; cv=none; b=clpEot+05OYlf5KxbBq1WxXVe8IjsfxbpiBea19qvHwsUhS/nKiPBVReKc8XB+e/NNGMfVOTIL+pNTRhgbxKA7ktrLPNDSOYMJ9oN6v2n+ONzXz9Jd7h6GNIM5vEaf3IrJJp5yUR0qbso1Q343M3rH2s+GLZSusYQuqR4vdGZ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455947; c=relaxed/simple;
	bh=3KvaD+9EPrVoBDVzqdktRPTMs5fF/i68th33bzEO2T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eh1DO0g0xN5olvui6oYHbzX/vganeiYeMA8JiIqiJwxaaOP4U5H0EnJEpdgZ4UExHbR7MowWlw7Hewzchtiu2gNjK4rKk4TrpP7pMK5KDELDqKX9H2xI2cMQfrZ3UGIbfPm4bT5ldxVC0oOIeOfnTjarFdOINnX7jI1JpqGLbN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHrrDU6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H61FncHg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWcf2889803
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKc6pbOFliJRXgCPxY0VgZCdhuSHeoxZqhn97SNu0es=; b=AHrrDU6y/k5MFfnd
	lap7HOXbgN+geW8lBrt4GH7BdsWXtUdfR7hczsv5fUgFNV9IjahZZvXm5kXCxi7J
	Z4AOP+I8PgvWqPNKra0ITjF8TQo25mEnSA1XKmiNGo8lB9FMAIl1xKnUi1nDLz2u
	gyvy35+5XFVIdkVTGVNR1R35jFZq1F6kSnvhgZU3xcWggbY5rA+qTE9W6GNkrkou
	aRCoRCkEs1zpdD2mIimkUbeeOIfGkDFw+958kPXP+PxKoNERQIEMhcdNeJ38jROY
	pJVB8YPjpolcJZ2quqq6esB9ByUNDzeH5fFXfFvD5W7+ZKPMVUo8nnC5Z2zi/izH
	phO28w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqb9vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:45:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ecac841eecso208231585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455944; x=1778060744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKc6pbOFliJRXgCPxY0VgZCdhuSHeoxZqhn97SNu0es=;
        b=H61FncHgn4IdIGHQZm70TeiKYi5lnoFAMfNceNk07suQSu9MC4sYCN8buwG+oS5qvD
         hzKvRgjGkltNq2lB7voK1W7nwezk95fQ+Wb3rZ66b8Grbqsehgp1dCvOyHbavHw+WeUX
         reqeKcxgBs3WWqHSidVmYKWKroyK1eHWcG+bEObQNIStK3rwDL79dt7OPiuiHZl3e7aI
         RAGw2Zdt6kr54nhqnELPNrM/FN6hI+cbRMkw9FzEoqucjb7WxFpNeyHo25zNW9yN7Bhg
         ab+SViDOZrMeTpeZwZ2Cqx0Q0V73ntO0weuXsIKSwwSEssunzr1NyXJPgk1XOaHiGa7F
         ViJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455944; x=1778060744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKc6pbOFliJRXgCPxY0VgZCdhuSHeoxZqhn97SNu0es=;
        b=r4PXSrOeBnf4xosLiQaM94dh+M6BxqLW4H0PZ/uuQoCm8kLL2EMRqms7YYsjCOdkKK
         mSAy4fkycL/iShoT5CdQw3LqapMksc0uTxMjEIkWaWimP4KafIksdKVPSW1URFdhve1W
         9bTXR5ZlPOdKfTw7dl+i0Svy8BJyAKFL0nNt2dXrMykq/hG9H5hWVJBAbITA82PNjlfo
         f14pfn/VbbPnvcVD9aEG7Idr8kF/dkGj1p1Og3kD/VOO6sbfPCCgHB2m05/vSBJ+2SOM
         cNKIZ/pql0c5YpjJK0Et8lkDGvg64JvFY5/SnVAHZlnkvlwycl07V5E1TGYPT2dwf01/
         VzfA==
X-Forwarded-Encrypted: i=1; AFNElJ9153lrBnE0rAu+FvJz6HaRRPy7Hz8OeghnNK+tSF1LEvjh9duo7mHgF9cNwFnflIjqCRGKYqaNA47zz6n9@vger.kernel.org
X-Gm-Message-State: AOJu0YwHojebBkLAzPOVJ2bR/tIOXUnijVoj4GsJU/0MvsjZfiPHJiDd
	FgOq7GbYbY3N7HBFWeNlt6WLWbkOvx+WK0xkSnYNUGSHebQYvBnRnNS7xZ8kHV0sFb/6l0lrkLy
	+ZO42ZBoz3UAHqDtqQwZy2VIojWrzWtQ+4vKG+JyV9hdVZz1fxHcSDz7tVIJGB03Z3Hp/
X-Gm-Gg: AeBDievWEOHPuSQngnImx5n0ozOIyrMiLvhMTLMv/Cacbz5VQOSzi0B4VpSpBiPEhut
	MqoDkbjE+dLti0GcZocGpvghyOxSToVkNPT46MMO3k5UpaGBnSiY1zzBoHr1a5C0NIuZn+47IAJ
	JekJa/9nCebHmBhW+tLx5IxV4U+SATRDsdjmfXgbQQ7p0M0/cjnad9BknFW1GbS0uh9MBHBbI38
	DaVju2aX3SBQH2Br5FzRuIxT+QTabMiQgnP9RthrqiSBlflHVT7b+dIc2UiAwAju9TUjDhtA8IR
	OxfRXpf68k5wAD9YqnPijC78ATukhFlKF0D2W1zKjC6H5qvuoANbwAxZoq4eWw2r5K60Daf/Ekw
	Cesw2cAD9A3WIjL2ug7wIZ58V8vQwZJbDgsbLaW/UWGH3ME7H1mk9yFh3jR4M0/NStsKs2Ql2t+
	YVv13UE5yAftjg5Q==
X-Received: by 2002:a05:620a:318c:b0:8d7:ed38:8189 with SMTP id af79cd13be357-8f7afbb363emr679343185a.0.1777455943838;
        Wed, 29 Apr 2026 02:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:318c:b0:8d7:ed38:8189 with SMTP id af79cd13be357-8f7afbb363emr679341385a.0.1777455943418;
        Wed, 29 Apr 2026 02:45:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22165ce0sm497042a12.20.2026.04.29.02.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:45:42 -0700 (PDT)
Message-ID: <73491a9c-5aea-478a-a81b-af84ab6352f0@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:45:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qfZkleOQyymtQldrL0dMXqOuOc44gsho
X-Proofpoint-ORIG-GUID: qfZkleOQyymtQldrL0dMXqOuOc44gsho
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1d348 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vap4R24UawxQ0CsOHRsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NyBTYWx0ZWRfXyNdK/VLYOlI1
 3qHV9bjfQBm3rUMp9ztLPvQYljQmQYk+v5kMVK/+lJyJcJ2JiceAVlZ+7M3jXNFHoeyy598dFfe
 gi1ozGrAwu9r9bTPl7j+311TgKVUFeHsWOZVbm+UYsudl0IiujtuJUGK+4XqRbiBnY/ecgQyyHI
 tBCzY0IufyihtKX8OYsiIgKjM6orafUuM+nb/3I2qUUVKYLGya1iUO1j0bzQLIC6zshMfOv4lsn
 G7SfmaZAwfpN5iM7X2uo3IqZUglz5MLzfR3wlQ0XC72iY6PxUQiAvkk6DTkHMGaHOJ1Ga+UA4AL
 nUn2coFx3XTL0YRVjxCen1YNBslNq8+XS6H7W+wu0ie1H3mEhQQF30uMvd3FQcKyxRTTM+NEZdB
 pAGNS8N0zdzznQN2VacmIVWbr7CO4BURKCuwthNF0TiKPvkhCn4IysfIlZaa4M/d/vvkYj2P2XJ
 hswVvVtoolSWc/PMN2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290097
X-Rspamd-Queue-Id: 6B574492470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105174-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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

On 4/29/26 11:35 AM, Kuldeep Singh wrote:
> The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
> UFS node lacks the required qcom,ice phandle reference.
> 
> Add the qcom,ice property to explicitly associate the UFS controller
> with its ICE instance.
> 
> Fixes: d288abc3a70e ("arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

