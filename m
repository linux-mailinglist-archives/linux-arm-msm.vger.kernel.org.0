Return-Path: <linux-arm-msm+bounces-105181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOkrE8Lh8WlZlAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:47:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C50EF4931CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58453300DDEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71783EB7F0;
	Wed, 29 Apr 2026 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMotN0Wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWzhxj9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A53E51FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459428; cv=none; b=WCwqsd5cO6N89Y3r3H6bivXgzB6w4xrACxSxd61r8/652dKBJmENT0rsuFyX/jlkmylKChzP43ntpE08K5yzcqHvMiZP12d3yBBgxgJX84qvixu1trKglaEEg4idZW3PdshEGxDQXFwC3R0kPHCA7QP9FA3O4lZvWOSuHJNJUNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459428; c=relaxed/simple;
	bh=kLpe4nBO1EEqY+eeCo5RdibwdXifGeVFAhSBKQCLbf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4DyiKAYImNNSllNpiBDHD/4dwtb2t2ndrMFsVE+YU3X9RbFsiSIzb+1mByuF/NcxPicKrXMvokzRzrpPqryCJLkUxsab9oRXjfrboXx8X+uAxHgOmuX3lBrAVGAgDB20cfE6LbrZkEhNuhwc/4i1I0MmApKpl6gLL0MhvXfdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMotN0Wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWzhxj9o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7Bo1721243
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Hcg/mdJagPhL4gZ2X13igeHogG5VDvHtgIlHe5+ZTQ=; b=fMotN0WgA1RcsQm7
	lkxeX855evsD8KGrHctFsk24hDbnjTL7+8TCAYAk5ASl6vAV67ztQ+tGxYackF/y
	QVg+8fTQ4W9CpyCDiKqVNHz/mgrJaKIQI94aunWO+rv13u/Loa8LmimjK3nXubhb
	P57gNTY17OsbGjGMh3PCd7JWLeNoWxKvIfUxRGwydB+/KOPppoL/9KFCM16bMxpH
	A+s7JxwohnJM0y74oCf+9p1zqbeZzObyhc+4l6/L8OwU44ZXxioQos+khUhL88k5
	nn8ezyR+j23nX7ijCpk6iSj9Wv99sZ9A5A8EInP8p544JLU1MNMNbhRdUQdAr2PT
	Kbp7Gw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua731nms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:43:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60586b8e65cso672726137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459426; x=1778064226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Hcg/mdJagPhL4gZ2X13igeHogG5VDvHtgIlHe5+ZTQ=;
        b=dWzhxj9of/sKKsaozjkztG5Z5ua217fYTvfEarcZv89PRIY9uPILqxdaXQzvnxSAji
         Jvdy3jb3rVD7gVgPLL6sUVk4CLUfLpTdQcrYARqqB0u6QP9m78GFMtgjO4E6KvBsWaPo
         eHJBN9ux5PsJ2afy1uJFufhv9CBDlNNTXWDQXeN5+XyjTdIFHv+XP22PagcJJ9mc//X+
         aPYIXglSQnm+cLI5kN+k0frsLdQdbHpiu2psFN86JAVNjFTk0MnG3B7F1lkS7HrZuwd8
         h3wlS1hmWYZPGoUK71f9IbrMpx+u+jmyPeLrxLMETpB46kObNQcT5tfX+NPKWORhK6CY
         3CwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459426; x=1778064226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Hcg/mdJagPhL4gZ2X13igeHogG5VDvHtgIlHe5+ZTQ=;
        b=Z0nu6njUd0wJxkmo08po09Pp8L949SLDTr3QnFx5+ArQ+Ft/nLRqPfuvBgt9AvCd4k
         ooctV7i0saqdL666i9spWJtzoanZqsgWvOpaauE7fZAYcIVYf/dVeqSL1tMeJYrQt9U1
         G0wy+Wz1rErA9atyR6kzBTS3kbKFs8//uMHYAJS8hSzUJHzQorOxYj34E4j9B8X48eAq
         eNEOU9m8Omm8ew/HPVxM1FKaRJmzpQfDaN0llicPHD2Nmp4lj9qY5hXUB/6g2NwXosPD
         2w/wflkXVoEFlMe68YHRZG46zNzxpaYDCmp49rVHB8lF9ccFPWKkS/nb/LbpWVaBGLF+
         t0sA==
X-Gm-Message-State: AOJu0YyehM6uTEug4JVqJTGvAgOol0A35BZqNttby2aeHPPyMsUZ6whm
	6P8OyLhYsCxPQ6yNZ0Qagx1xMJasCJ4rMEBZInY8nVtOi5VsFKS667Q4GeNIvasu3SqF3zggazC
	uzcl8/4xV//P9clTsKa97I5fXo9AAJJzLJr9Sa86zg2tK4sIvmc0qJxaa07UqMi6/AyM6
X-Gm-Gg: AeBDiesxPQ6km70ETAnLPNCPG1f5nMCO2ti8Z2L2W2yF0+eZ5+bAfswyPmGfbUdKGKm
	CBXuB971zSXLtlO1A7s+u0OSlc4VaSamc79ooOSBseQK2IkXewcNKz+XImhqq/x+MZPGHCNyfLk
	slkxKo0kojJTAhpfzVZHnNA92L/C0mC5/0n1tYOIxgZuBtMFE/8BZyMBcrsLLmWX9lR3icnElmN
	ZR2GKfsxDXfJ0ghQqeOgolPbCWjLI4ZUW7PeX/4rOpxQlxOgruPFIfhD7OcGi755ol65CPflKc8
	tBXdm4SFfqzWJ7sBztYxdaKtGzhHWpK0+zjCHq2MNNytOQudFzs8oi07e0K6OJ4tn9fbwWEcJc/
	18PRK+iGDr28Lx5MwjXsdAMHGF6xr3TDCHcNtMH86P6pAMcV2LTq4pgx73YpdEziMH+8Tey0Wnh
	kwKVFt9dfIGDXfOA==
X-Received: by 2002:a05:6102:5885:b0:602:b87a:3524 with SMTP id ada2fe7eead31-627d5fe21c2mr1152117137.8.1777459425795;
        Wed, 29 Apr 2026 03:43:45 -0700 (PDT)
X-Received: by 2002:a05:6102:5885:b0:602:b87a:3524 with SMTP id ada2fe7eead31-627d5fe21c2mr1152097137.8.1777459425334;
        Wed, 29 Apr 2026 03:43:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb981b4ee3dsm76268566b.23.2026.04.29.03.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:43:44 -0700 (PDT)
Message-ID: <b4a5e69f-eadc-4ac9-a78f-2b56aeba97d0@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:43:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: slim7x: Add Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260429103301.17449-1-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429103301.17449-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1e0e2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=J7uTrBVL25gZzBqQJcQA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOCBTYWx0ZWRfX3STFx5M06+R8
 sOYJX8FkGGoWQmAkSreN//dSRBBxNxSigkLd+ovFNRpeDJr5fZ3StF5a0GkLUoelee3kVkN9qCD
 5L0STcj+e6+PvoFOoOr/wf+0TJuIUxOBxXd+lFTID4ThSWZZg8jhf2spHdNOelkBHu/yQKWue6x
 ZHvcUJoIRJDvVK8GK4ZMbnByjmBeTlDrybLcZS//0fwlddFsFNVQQ5RJzzKmzbVR/+qAeiOiJnh
 tjgCM98RxMAoMt9Za48TqA2fa7UJoONriLudQV7IpsOXbCACqqelr6cgWcIZyY8Rz+PvdmQfglf
 MMhGjayOvoJltMj1dfE+qkDQ+BYRH7uDqsQT/equLsmonLcDAJgKYvTxaAuhFdDw9nM3XV/12RE
 dNYwtxINuyeicwRRTdLnd1MWzF6IVJYFBJ5/fEhGbWeTMpgEfoUKBSZ5IBIwCOi61mWHvmSqkQf
 /wmxUMWWBneew5JslrQ==
X-Proofpoint-GUID: 9tr1-LwsSuAStM7MydBR0FiphVkHKFuw
X-Proofpoint-ORIG-GUID: 9tr1-LwsSuAStM7MydBR0FiphVkHKFuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290108
X-Rspamd-Queue-Id: C50EF4931CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-105181-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.76:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quora.org:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 12:32 PM, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm
> Hamoa Customer Reference Device (X1). Wire it up for fan control,
> thermal sensor and suspend behaviour.
> 
> Dependencies:
> https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/

This should not be part of the commit message - please put it under
the --- line, so git doesn't keep it in history
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index beb1475d7fa0..22c4ad34a2a4 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
>  	};
>  };
>  
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@76 {
> +		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";

This should have its own compatible. The Glymur CRD is a different
laptop, with a different SoC. That will need a change to

Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml

so that dt validation passes

Konrad

