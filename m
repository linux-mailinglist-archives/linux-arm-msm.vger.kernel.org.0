Return-Path: <linux-arm-msm+bounces-93882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOQlNksrnWmwNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:38:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 764B5181B21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E8EB30CD01B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB171A38F9;
	Tue, 24 Feb 2026 04:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8GMJwpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjusYEu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC51519AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907596; cv=none; b=JKJBmlPUQKAcGgE5jRl2e26Er2H8cMErxXxawlWEtkozs+ACpxqfsR2DH+9PJ6HO4bkCQGiTAvqhvyNoUYXPqT391AjFs2Liy5Ujct0QhuLTamee3JKjID77Tc4vHM+8ky/gHgsTPF+SO5YSRahLZ7QbQgIoAdTaNIPfrcbJ1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907596; c=relaxed/simple;
	bh=cbMblWHEpggARZ0raE2x4FcCFY8hp0Wgxes8ltfPLtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tTzyaWkRVqDIUEqyE4cObIpyEhCB/FLrX84WbXhjApOSXbdSIBtrx4f4Wj6EPzeOiFhvuuGqBOiFoh5qEu77NHDJMFm2JnP9J6SFxYYeywwcYte33PItoxuXicMlMI5mxtZXNQiN+DvK/hcLZzh9ol8iRVOI+W6juTbEB8puiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8GMJwpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjusYEu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4Loas3125554
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxaXpVx4mutZ2XD5jljrmv2ktN2mvGucKtvUTSLgJq0=; b=Y8GMJwpGlQeCpVCi
	YSjOP8Rp2TScVm3nfN3XGdoPm5oZOUMYY6wfys3MhrxLz2yuRXiMTfINrs+JuTIo
	/idnrggo99A1msAV61OK8rADmh6x2r8jo5iDjjD2Rr0bMX6l3akCw7yAn++Zk3nt
	MHXrN15gVxsiM4jnufA7k0OcPx2Xcb6mJIpYXWIM3V/F1RiPP9KoZvzeWJwOngl1
	6eQ1RebH1OXPFUgDpEnplK34bfMt8eMmACbg3K986J7h83pOMLuynuTlirLVQElN
	BZkNGTW+xLsJRHtd6q2L9LOFuoBGWUJQtlHruIoXh7MrwPIGT01WyPIrhyDQwyBH
	nVC/zA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8st27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:33:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aaeafeadbcso58401745ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771907594; x=1772512394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VxaXpVx4mutZ2XD5jljrmv2ktN2mvGucKtvUTSLgJq0=;
        b=GjusYEu+Ci4CGdmXX5LW0Agiv+15jfMSW8pbBwlE7/n5rdE/MClKLwVJ2fCfeD7ByH
         UUSd5pRg65qM84iNgD3l7Zk+m95N+o0yOcYPmkF4KBsGIy1pM9sdn2tjyTxseUNOuB2f
         t8LveQzj/oZ4zmMm0rae4mJ1d23obi8/CKvWlmL2NqX/bmowbMVl/PB7FcMVoOrVV5A7
         WM250gJpCEkGEnA/68AAxHZQsyAHseDZxWO42RhxvYfU0IwBgv74jxevrIQNw2qJz60F
         g+oXvI81LYgd/b9sM24noD+3SttfKI6R9/1efoX00pL9kLt7o4FI2n69W3M/+znXyDEb
         T6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907594; x=1772512394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxaXpVx4mutZ2XD5jljrmv2ktN2mvGucKtvUTSLgJq0=;
        b=A/FsjNR7P4GrvWii9GFeNvU7YlmwrwK9ZCg/9MvrJSX7kIoTo92NYKuVpNo+B8QBFE
         SopXfHCmXq2BQNc2y5eGwMtdcCUl6G0njGYCVIcNyJ6QZJi2QEFAh//MpgxDinwd8Yqa
         DGQdSFKeAAURlqX3WpWwxVyW2glpXADqS/KXdGgjDtaDbEdIUU684vR0DlcVSu63eF6m
         g2ctHfaIub2/s0m3qJwZPFDMqztJVk5R63o4uTMcXmpCQvf/mIgc4dm7+m2MHi7QzcUg
         0bwdHBSETHXUbIyaxmOP/C2qcIY2ouhC06XSJ6SFI3nrbvdOs2ZxOIVtIal4TDRMyTzd
         7PoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8SM1+bP0MWPTSdr+BHr3PDC+keqPvvysyMqS5pXgbsLw2VhtXVCD8n9v7m5MG/hL2lL3ZqjNyF8HTfQPJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyboRh2kDO2a58HCo7FdMlxVxfEnsY0BaG1GF86JcQ1ygHO95NM
	SWVX0s3osytWecdLRqIeiQvE/hZgOFmgiFOZtdlHn3w5AjkSN4i+AFRzal0czhSQ9iYldtkXq9l
	gaUOGQ/sFByle7zY86Mx5ivGBMsA703jQ1wzjugIXJUE6RALE3uZCGni0j4GMuNLGuEnp
X-Gm-Gg: AZuq6aKNoIUewxdjlfk5YSknng7YmxUKIm4nlIJzam1YqILnNdG3PbFYfLBMf2YgAhz
	8zYLghysyI6lA/RP+7Gx9i0vfrHCt01t6EbKdABoRVzPXhMzGYDnHjZL3A5qWACmU/Fj3lFHL4W
	P1li283vr+xX3UmyjkLNlg7edR+hHOzHfSNNc/VQWv5y3hKh94ndBNnfA2HV/Im5IK0zqKQOz1u
	jhOb8sw1ZC49lR2yXXogai3bLoFCGKJYqlZPsnH1wZ9zb1TBa82wZSXxWsigG2OQe8Ug6wWCtxi
	kgi/uhCmr/yWDdKfFGqdfeFDzsxov96TJOKgVxbfsDx93/rGkLIvCfw8nwOffYTJ/lFokyyCCTI
	+D3QqF0uFdKNNrTPrO/Ix9WyshCEuBP79ZjwGXU65q8i/t2RS0Q==
X-Received: by 2002:a05:6a20:9145:b0:395:116e:ac6d with SMTP id adf61e73a8af0-39545ee5e7fmr9947203637.31.1771907593344;
        Mon, 23 Feb 2026 20:33:13 -0800 (PST)
X-Received: by 2002:a05:6a20:9145:b0:395:116e:ac6d with SMTP id adf61e73a8af0-39545ee5e7fmr9947184637.31.1771907592855;
        Mon, 23 Feb 2026 20:33:12 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b7180613sm8728494a12.3.2026.02.23.20.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 20:33:12 -0800 (PST)
Message-ID: <e025b1b4-8f5c-4fd2-853e-56b89f1f8e79@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 10:03:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add missing GCC clock-names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260223143624.118271-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260223143624.118271-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IVmh_HVY5GPz7PObCW3ZYRnIv-SNI2Vd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzNSBTYWx0ZWRfXztvuGQFFF8dU
 sz5gSAKz09rNrYdAyB9eYwbXjtw9TaGNlkDTL5gK0wvttOMHjDOEBRo7wQAYknilTt+8emGvFK6
 JUlZYEEmFgu5pNqJ9fqjisALL/zIpD5so73RHA8vMOnwD/BUlHkEPVyagT8tJ5UtQfXOghZhfQm
 iSKZ2fGgl+8p6sNeUiFgy/7eM8YJkMQ3tIEmSuV1MbnRsTydN3RQEULLfq81ngNAgEGbc6ZTUuE
 tkyXy2iR3dTPIm2s60v4J76g/9T8B1P3uCQs98uuRrHQa/0HRpPG1+bhSlx3usdWRo0R+LOUDPz
 wnTE0OISZElpbbCf5S1OO/TQde7OHe5Di63drIk7tTgVI97dVn1UaM3iu6n/CBvbcEvtsSd9gNH
 b9gTdYcZ5wQbgHAi+RaLHo6j6/7e46fMmbaEKIcX2WAjy+6kfgKMfqrq5HZkUo568d2Vw3TfbAp
 /lmj9Kl9Y9UjevN8VAw==
X-Proofpoint-GUID: IVmh_HVY5GPz7PObCW3ZYRnIv-SNI2Vd
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d2a0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oYZBAe1WLvZJEsEo3mAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240035
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.1.134.160:email,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93882-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 764B5181B21
X-Rspamd-Action: no action



On 2/23/2026 8:06 PM, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 75716b4a58d6..6dab0d5dcbb8 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -666,6 +666,9 @@ gcc: clock-controller@100000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>;
> +			clock-names = "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "sleep_clk";

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


