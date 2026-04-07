Return-Path: <linux-arm-msm+bounces-102228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFp0H8tf1WkF5gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:49:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340E3B4029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF3C0301D202
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D5422D7A1;
	Tue,  7 Apr 2026 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Db/EPS89";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq1NwuY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554DD327C13
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 19:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591169; cv=none; b=mGYPCx09N+xbVqfRPWgVGmVhs4hcYw4sHkxQIW3lPE+mvtcCGDWlDGzP8gTXkQGAFudhuCldTHVqVulmFYgZS05/EwDEil1Y19H53K+D6PYj9Ks70WoCIF2XzXemTeX4FJkiGfiBH9jLtC5MRX3jsCSuddr3WGglKYC32gfIOmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591169; c=relaxed/simple;
	bh=PEBo3CGGJkq0zIUzkCrcAuQgkw+k2xuFQhM5II936fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iUVEWfRSTN5pdl8hDMxiBXlILBce6VzkGramg93WfmFXB0fuP7KS00ghdFiACWaQnvqb1gOQz6WkGa1PaKAvSYhhHbgh+jzMXSnsL/v8sXd1W8/Sy4ll8ydnGUrDmeDF7qab2a+UZE5pgNWzE6nfrFqWCe8HKXnXNESLwJ26eK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Db/EPS89; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq1NwuY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J83lO3362738
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 19:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIjq0YEjJ7jpzlM6N05h5tBr2Wsb2iFf41iaHc/0aBc=; b=Db/EPS89o38GK+rd
	YD38sVl4Fqi8z20nteZ0ZYxzzP1wz/f8eYn8RBklT8lZxpK1OGzQgxw75DQ8odrS
	V9eR6nR7oRJTew4Y7qJhX7zVGQzExbGpvo/Mim+bvI7fQuBatoAyDIuTE2GB8iGI
	DWmIcswTiZkcTzd+BKigVLHWHYgrOt+eMoCMG7wjNZPPTxNIq+q+Ujtf764uerWc
	4R4zaP65LSMURrP41eaYnZtvD8o0FW478kNuw59mRYjdxO9mVaZaq+pXarypvLKV
	SM9wW+IxOL+r+qk7MLSoVqVll15Io67LoQ4/wFX7i3rOqq+p8+HxnSKSog+9D9Pv
	0vJYVw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkg4a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 19:46:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c741f038f7cso2735829a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775591166; x=1776195966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIjq0YEjJ7jpzlM6N05h5tBr2Wsb2iFf41iaHc/0aBc=;
        b=Dq1NwuY39xPyz9M9DnH+cLYAKVyBNufB/iQWkSXmoWmPoxXUsdVZhMWTU+hz/UORfT
         O5GI6MF+DztVxNXASkuV8abdPG5PLcym66COxqTEJmFGdOkX3qxG9TC5h9M9TH29Ki48
         JFj69euPmSNKYjvadv1Fea7/rKSGEt76RqvuzVLAEOQjDUaxea5O20m/Lq4SWwV6ksVB
         C57nCYnT3KBl3eimIvF15+eJCNYW7LUDDYrcishMUEJxSKXJoV8jh26czKj4cHADCfUt
         CtIOvVsuHDac06PXbmJXLs84q1fsZHrRpnuFRrNmxd5JIseYiyb6wS1/zCNuj/5Lp81K
         uGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591166; x=1776195966;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIjq0YEjJ7jpzlM6N05h5tBr2Wsb2iFf41iaHc/0aBc=;
        b=mq/bWaNdZa0JasRH2gbCd9cS4E9McNcn59kCWz60J+jKZLSvODfPwaGjzjsd+AG5/4
         1v78KRU6OQR3y8xVVmsAbDl1i+I3dHBhPgO/f3dYz1IVtmK8se5r2/iARFhxKqfAH8xn
         w001ltEWWmV5knbaaYKnjO0Lnus6aULKg0VEqM+delWHTANqPLE9u/QOJKJ7fM2h2FNb
         PSpydfhd+r1OLPMyvBAKGQQSPkEQl82+jjKEEXF3YLnIh6Lg/lpUE4JgBVv38wIVN8hK
         ZvozIM3Z87NCYNyv8fAMbBpvlVV2kkXXH85poXUVTS+nsnqfBUAivVzsWXhDPBO/R0Nn
         EcpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP2dfmwex58eQuwjNsqBBoRGQcgY5PRP52qO7dfuA5nqdDKiMyT+7Fva7NHVQohb6kG5M8paDKkfmVxrTj@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVcyG4wEATzv5AuAh2pJTeIRE+k8eKJ/gt2wG/j59Vh/A6b77
	M4yeIhaO/+o9hdTh/D3i+ZtJXw8dw5o0HN2YVN1fJQYqbXzn/IC5q2w9hJdjPWpazgz+72YXplS
	O+69Rht9Dyeb2Pk8dwCOV++mmL5gAnEm44CSV03z+dP2+4FO8cEtX0Kxxc5xAlz3WlI5q
X-Gm-Gg: AeBDiesAwNGZXvQqZ1/Min7WIB/vbzdan3hbTLUV43nu7xM5VhcJvomcZPMeceV3vtu
	zMabesicvhyrbiFKH7MephXSaUGe2Y8lfUxIkKZeLfznf48IWPzhHoBKC0ePpbgnafIn77vJNLq
	a2LzWzSja/oRxP2/QlgzQ1U5VkSLukfFgac6zOacXen/JkJtlmTx0qa2NHsrZSgG5TxpjGoYCPP
	t/JhkaTf30TmqBLN76S4Ct2eeGRA15LXH3yHAznZB2X8woTox3MvEbANQSTiOdffnsd1TROrJyQ
	jQdXxGBEGT8Wh4yMGYcrzJJAUNAcI3ocjWyjvlG2ZkoZYEpSNUXTEvC6j3u/wj8aun/nZOdka9/
	8zGXOpD3/AZ//A3PIWY9X0pabVBev9oqx1PmyewJl+8snXg==
X-Received: by 2002:a05:6a20:3d8b:b0:39b:949d:6078 with SMTP id adf61e73a8af0-39f2ed105f1mr20292993637.6.1775591165639;
        Tue, 07 Apr 2026 12:46:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8b:b0:39b:949d:6078 with SMTP id adf61e73a8af0-39f2ed105f1mr20292960637.6.1775591165144;
        Tue, 07 Apr 2026 12:46:05 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76d2684b75sm13359006a12.14.2026.04.07.12.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:46:04 -0700 (PDT)
Message-ID: <aeb8fa01-3ae0-42d6-9bf0-226184b36260@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 01:15:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/6] dt-bindings: display/msm/gmu: Document Adreno
 810 GMU
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-1-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-1-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d55efe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=CPVj27tIqRs5YXHx02MA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: EL9Xh9CMOqauxatEokJZ5hojI7IMH2Vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4MCBTYWx0ZWRfXxrTjuUpbRhFu
 vAm6ghtPKONNpPOtdJGooML1iWxoFsqy7972inWJLy2IGIphzZavTEz4eSrWKiJtQkz8EEHQM8s
 RC16OAxCM/2C4dUcJGhP/KofA+4Nml8LVjepATRGSn14a9dn61yuzaO6XUM0i6LrF42sA0pwOp9
 yhgIxHYZerX/nEeNcjW5OsVbLK/bf/7C2tsTKvcFddIeb6af7tUGvJNgVbd3KAOTsQmHTgVHvR1
 k8hi34sqcoV4CCkCty/wYQoJnmDsVeTzNQQqd1hSb90/AcwQKOfSmBJMUFOywsKkZjQPQnLao02
 syHmVrJEPosw1UzkmqBFciatctAtD8QWzfsfNuaslrY9UpkiL723HLoGIRnWy18YJlQDBGTdR9n
 D4fNQT4mbkpq+4oLUQIj1YwCqpjMt8ZTCVlLlNwRGmw7mTxrO347XCe+iBzCNK3oPOnIvaZFUJs
 5OHEflTFqyW3ZiANK/Q==
X-Proofpoint-GUID: EL9Xh9CMOqauxatEokJZ5hojI7IMH2Vm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070180
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[fairphone.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-102228-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,pm.me:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8340E3B4029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
> Document Adreno 810 GMU in the dt-binding specification.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index e32056ae0f5d..2853f6aef966 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -299,6 +299,38 @@ allOf:
>        required:
>          - qcom,qmp
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,adreno-gmu-810.0
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Core GMU registers
> +        reg-names:
> +          items:
> +            - const: gmu
> +        clocks:
> +          items:
> +            - description: GPU AHB clock
> +            - description: GMU clock
> +            - description: GPU CX clock
> +            - description: GPU AXI clock
> +            - description: GPU MEMNOC clock
> +            - description: GMU HUB clock
> +            - description: GPUSS DEMET clock

DEMET clk vote from sw is not required for Milos GPU.

-Akhil.

> +        clock-names:
> +          items:
> +            - const: ahb
> +            - const: gmu
> +            - const: cxo
> +            - const: axi
> +            - const: memnoc
> +            - const: hub
> +            - const: demet
> +
>    - if:
>        properties:
>          compatible:
> 


