Return-Path: <linux-arm-msm+bounces-104292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEQ0FZz96WmeqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:08:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982D451183
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60EAD300B139
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C603E6395;
	Thu, 23 Apr 2026 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5/tjeRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXtT3NQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E603CEB8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942428; cv=none; b=hVR0bykAN1W9Uz3o0fhRGkBoZi6WwzwLJrl9ArqdViObUrxfSBZMJBNJcoXJGtdLZ2E4WF1rhM0tvri6mdBE6AhzwLux6DwKVoEX/uFBbec8HRyzUJQd9LyddzHNAFzN/WmoiFK5Ujr/2zHOc2iOnr128c2Dbp6lq91p3i36br4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942428; c=relaxed/simple;
	bh=9C/kWYxYwf3WG04MyX3l/9Ak/A3bEvzfMk1jFe44vn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usEcxQINUWU4rnkrgZCfH4Bg8FuZDOm1obAP5jfSQDemJpiRv60Gl3G0xrudLqDNskCUJyVO8f/t/qlov9PjklU2pbzCEzDTIqZld++kz0auR7AYL/K6WOsniKK0WcIENbN8GlyHOrfpQ1I9DKlpfgcsIUo7ZoKGJUkpSwTS20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5/tjeRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXtT3NQ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N96WqK1204771
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AfSMA0QbucQHqV6snfKtLI8N
	WtAMHekaj8A15WhgdBU=; b=k5/tjeRa32ioBD7786omohP/URimuJrH7ixem7Zg
	35icic7FDfemKYXv8Z4aXhzeBFC9o3/zO2uvMwX8D9UHrrqHLtuJ1MJ0jOgiEam9
	jIjs2Cepy3aiC0iNr5rTNE7qtdkWqtPanflBf/C6Ua3a6XjyjxV/cGUj9PG1fTul
	/K8udbo849GrUu6Xk5+Jupcb5AViGG5RJsm3jrlQsORa7rlxiDTBPjdU6RXquIu8
	DtZfXOWnMAd85yKp9Kp5Yn85FSwTzErquzi4W7Nw0IpIo4DwMAtHxi4vyRzPV4bG
	kQv5K/7n3AUR7bPBneoCPa46CpDPgpZTMMWcrc4PPTLdPg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqggn8emy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:07:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0ba59a830so10178459eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942426; x=1777547226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AfSMA0QbucQHqV6snfKtLI8NWtAMHekaj8A15WhgdBU=;
        b=BXtT3NQ/wtJ2IrW2xc8hnJAPY/qHzbDR+L545Ppw0vPuTBIt9RFTZNrmoPqcoSgCFb
         zaKsT6+2iqiVWF07q3PKRrU72NwUxuHbYzQRBlElvZzo6re5X5SLJTYKu7CLm8S3LfRI
         jvwJkCkDbnXK+xRxtiEJqOgDq9PsHoNB7loCiXS4n2zq80j3Bvkb1zfOlV7hxs1DYmdc
         Q1gsI1+pvs4OMbOkin7IlBZ48Qha5ScEE3H3zY+MkIU5W/FAh/oTK0lPqvn88lNc4/Ac
         lmuVpeJJcRp+TSUGY3pI43Xeds+L2b06HI7U4LIsKzq42386lZqKRSIrCa4KhkIWuAS8
         HlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942426; x=1777547226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfSMA0QbucQHqV6snfKtLI8NWtAMHekaj8A15WhgdBU=;
        b=SeFItVsm/X+Sgs1bYbYU9g11asW3r7tf445eopySU43CS8YMKuCL87PLcY5F6vhrvp
         VN8MNoLk8k4oygw9pZhJo1JT8mZPyALMfzgE199F8wJh2l0DEgMiXBjoIVZDok8RXpwl
         EYI9c8ys6SDco7MSn2aSixo8sUx2YFxKQXlygZzUKyv/0xVlk6j0MrlQU6aSkIVd4bMX
         iNf7tztdlLL6xZKtCVhh/3mHUp6xmJTxRQxsGlrG0lG/OHPEJXSDQNafDYe50InvVT9M
         tbVT3glhT6xeFf39ZsINNvvqNOviBnwuXPh2nhyswnSzJ+VsNX8LNxne8hKFAiuxV93U
         uR4A==
X-Forwarded-Encrypted: i=1; AFNElJ9ggQIKAJdAAfwUVdARdbhIvMtI/XJYTcZkPR49DUUbOmsB4i+ojwRnyB8nLwrB4Q2TAI9k9Z+k9bop0aXJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8WAQZXRrTK7jsXQqwXgV43PT1i6tFVKYuTbSzDPAd3Wc2q2Ks
	+wSwbuTjRfKB3dxtV4VGHDZqBPIC7GXMlVS1DFec4Rb/pJITxHsYcXm/et5hTN1qv4bN3f1Gwlt
	MISze5r6xGwTD+6FzOjzOP8Sl1KgGeEZJK0L7b7Zg+SmzXdtWVr3+OEpyq/AOqvIWR3AQ
X-Gm-Gg: AeBDiesd2c2PZHrqzZZUQ44vGRBlSoVqfPwggspdbusukkp/28nJvxFTZLfAWzAuNw9
	Sz5tfoQlfyYLgLlGS3JVQf5jNOxlM6SBqmhF015ED/+TmZKskbHseDc43Y7yHLZHRsuYZhvEg8w
	FzSo8+XF3JqNCD6ehljReOXxibZcsTYzH0MwW6p1583OlKCYLxrhavQyxTSbhcYrXZglQIC/Jgf
	zTeL58oPc5UCLMUkRIcvzKQ7hi7O+qcl88Ll1/mDYW+Zq7g3nNPDDunCmfD3l88e7/FpMoiQln6
	Cg3W0XYyvqaQfgwmx7pwjniwnf2qWo8ri0kRqWAE2uILJrRYJoc4lH8KQXlgvOa/RdY2PQoN6qZ
	w9s9SOI4N0iQyf3GaAHd8b4AdpYVJiiKFWeK06fuCPw6Q0i3ZbQqdSpLEH/l5KylgY8PjHC/UWp
	U=
X-Received: by 2002:a05:7022:6606:b0:128:bae0:e044 with SMTP id a92af1059eb24-12c73fc621dmr13828076c88.30.1776942426380;
        Thu, 23 Apr 2026 04:07:06 -0700 (PDT)
X-Received: by 2002:a05:7022:6606:b0:128:bae0:e044 with SMTP id a92af1059eb24-12c73fc621dmr13828039c88.30.1776942425654;
        Thu, 23 Apr 2026 04:07:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm4439640c88.15.2026.04.23.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:07:05 -0700 (PDT)
Date: Thu, 23 Apr 2026 19:06:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord
 SoC
Message-ID: <aen9U_3jMRagJwgp@QCOM-aGQu4IUr3Y>
References: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BAKDme140i6W1viGMh8PoH7kFv6q0a_3
X-Authority-Analysis: v=2.4 cv=YZeNIQRf c=1 sm=1 tr=0 ts=69e9fd5b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hCYcIqgGm8RcXDvY5OYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMCBTYWx0ZWRfX1gsQ8615B1hk
 YivAeAtDAhT6C7Hl4WEO5N0PpsM93odm6+/KI9jmXPbiy5yJHRloR6bvhKpVgeWLIF/0YEGQ1Ft
 4/B3AvQBOk04KVCzsEs6hLA3gh7T86Pr1uX+NZ+qMbB95fp9jrtn8UJULxVQntXnNnQRJikZhIz
 pAmsJsDkSzO7AIIktfPxqKAEOv3E5mzdAaxWeqmARRxxCkdm6Qw2KkGlv3cG52j8vW3v0lWqr6y
 +JrPpTwiV7lJNGoFbtt/ifHnDadTdAaExEuRTk5pfol3DiT7aE167VYTZ8FFW2laCskclPLvi+E
 gb6V5q3bEwDlMlSuOVG+B8hAYA1ZcDzpS5CEpqJ1MELy9dwij6z/xKpQb4VK+3H0Itv7b72XWrm
 LN4fL6x4gFdQ/gXs/Dq9RjC4Z4s+ygvvomA5hk1GW6mygrmSgDIDqjET3KUIeDFfdgnNogDrXVs
 k3tVK5oa26JUn5s1baw==
X-Proofpoint-GUID: BAKDme140i6W1viGMh8PoH7kFv6q0a_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230110
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104292-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1982D451183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 02:44:01PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
> with fallback on SA8255P compatibles.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> index 352af3426d34..d73f9edcbbdb 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> @@ -19,7 +19,12 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,sa8255p-geni-se-qup
> +    oneOf:
> +      - enum:
> +          - qcom,sa8255p-geni-se-qup
> +      - items:
> +          - const: qcom,nord-auto-geni-se-qup

AUTO variant of Nord is SA8797P, so it makes more sense to use
'qcom,sa8797p-geni-se-qup' which is more consistent to
'qcom,sa8255p-geni-se-qup'.  Will update in the next version.

Shawn

> +          - const: qcom,sa8255p-geni-se-qup
>  
>    reg:
>      description: QUP wrapper common register address and length.
> @@ -67,9 +72,16 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        enum:
> -          - qcom,sa8255p-geni-uart
> -          - qcom,sa8255p-geni-debug-uart
> +        oneOf:
> +          - enum:
> +            - qcom,sa8255p-geni-uart
> +            - qcom,sa8255p-geni-debug-uart
> +          - items:
> +            - const: qcom,nord-auto-geni-uart
> +            - const: qcom,sa8255p-geni-uart
> +          - items:
> +            - const: qcom,nord-auto-geni-debug-uart
> +            - const: qcom,sa8255p-geni-debug-uart
>  
>  required:
>    - compatible
> -- 
> 2.43.0
> 

