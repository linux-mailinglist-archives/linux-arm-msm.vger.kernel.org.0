Return-Path: <linux-arm-msm+bounces-91623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPjsJRa3gWkrJAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:51:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A280D667C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4E6C3033E46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C99395D8C;
	Tue,  3 Feb 2026 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILmb8T1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sq3PvFsK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E3C34D93E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108640; cv=none; b=PCzzi3M/Xt2zrh26JRX6vLG2kP5AI11djJDAORIiY0Ci1eHi1hAAWogaU/+uFnfOURjWJiGldiMeKNaXLWkfVwA9Zu8QUtOhWUN8xqyP/a+Qa5iETxETeBzmyAzdMj8e5f0XO28Bs6rr7Tl1DJZYjLQ9d9DEjBOjugG7J+Pw7fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108640; c=relaxed/simple;
	bh=5PGNAdz0IGhaQRyIi2BcslJKauqrEIBTICyLSphH+TA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C43Wm3LEgKRRY024EdzngBRLG3JKHXQG1dwj6w6W4kwl+9RLd55rlfsf2sCDXZmlkbz+Z49/xJNTooqfLnNUQsgYjm0EfN3vatQ6aoM+6/kLUSjN53zEYO2Dccx4r9IwJSvE7bMNa6BaSIfW/j+/Vd9bRYlQ4KkB3uu0JdaU7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILmb8T1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sq3PvFsK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61376dPi2885174
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/fRdI2PF6m1aXfRifRrrW4GDQwRezHHNQacN6YnKws=; b=ILmb8T1nDBEAW2pb
	j5+AvKCyNxYmXkyeUl8I1T2THz2iPlbnL1eLh5bMeqTko097STabFMfsGXZVX+u7
	irv8w70rcJub+y8zCFJ+YvHkXB3TUbOoXLYWIdbVxsvXAQEWSBjVcZo7PQb236Co
	Te08TXQrGOTzY9MGjo44mfIYOtt/wc11L0AhLiKCS5gQej+nloDfWi9uyFroSP/c
	A0/m99sYYq1Hsr6FhChF014ApYGKOgezV2IHhEtPurs83UjH4uiHcdx62DrWWqbz
	5qyUTJ8DOGInbHNLnAd3khVQdDbPhKqZ03MYWb9K2fpzY6nwUrmpv5JsbLRygJyN
	mXm9MA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3ke19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:50:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2fdf3a190so53529585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770108637; x=1770713437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/fRdI2PF6m1aXfRifRrrW4GDQwRezHHNQacN6YnKws=;
        b=Sq3PvFsKXoHN4TsSYhyOosDU6fG8J3NT0/8p0/0DlBxCuJe+lnx9s/PH5GVAN76sBW
         9hAALynXgx3tg0LZulIACzUeI6ACMuK34UdYzXgIXuc0FzLhM3AUqe3GEwWRhRRliSkg
         DfI5FXnM4gNaNgSmirNEgkEDKSQkTNRVzc2yB+ztDlA2p33WBGYf5Jo5MAj0aXLC/Py9
         ZTeUrBrT0xRiQLCUcp8iSVcZhPjN53v7iTtxvBD+JsW8+f9n2SnJAcoebgvkEANu+zLu
         6/VUcRUSbGIFU3UgGMlY/M1qnUQMKUPNMABuVLNY+vKZ27LXSIxgB1WykDOMbllqRaGB
         SD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770108637; x=1770713437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/fRdI2PF6m1aXfRifRrrW4GDQwRezHHNQacN6YnKws=;
        b=vZchOreIVpF4+MWUbCdyIcVy49Gfovg6vZucn8nyecMmBv0wc62V2nR7yvBZybLlC7
         bxywl15ew1ICeoBx1aVZkcXkt2tA+SntspomCUfvZzk0KBRLSqq5lvsPKQFLLbXH6Pml
         gv7BjfxgOhVEseDjOL9PC2mGNawS7UyUgfNmekc+j3f1+pBftlv9MW63uGh/pdNq89iF
         46RzTV+LDckO+p5Skw0hVKk2QQSGkHrA+oDEPQlw8ubAacqi1Xt72Odx5vM25ppL8rf3
         S01vfPNBPKDWUtYag3tRkaagfgGQ0zpy2dBOwHvQ9p9gC3UrqU3CBoMeyB8p+L2kbyWz
         cBbw==
X-Forwarded-Encrypted: i=1; AJvYcCXwcXANbAV6nOQfjpvp4wmLibdj0u/D1Ha1XYjYagzPXYZAHsOJhVGgsyAOgSvrmEJ7GpvHpB6ZL5VdFHFO@vger.kernel.org
X-Gm-Message-State: AOJu0YxPDDSN8ZvTyya2Y2ZtXgJN7aVLaJb6gB//0p5xjLlytPngBGGc
	XkzqxnbXKpldiT/ZeLH85o0M7RBTFoeIx+3XgeEhtcPtoZeYNnAAmjjcCT/P/NwFXz9H7+a7wAW
	O47dUgG5/ocp/eWaL44IPu0cyd+ZcGYJGUlfXIFeBxlRO7c+p/OiuUqCLnORtS2fMf1LS
X-Gm-Gg: AZuq6aIf+I6weKyRM9VCoz0OM+u9MSB6pkp9Ar+uEpM6oDC0PJQboFh+PwMGqRvhjpD
	04I4RyajKmfrIeE+kxBbnEAiDyT9OLsP+h9NopyPlxeB1ATPocKBK60YNJPjEAFZf+E+06CxjMd
	m1psSZXUgOJRS2AEf37hZEbwZC6Oa1/3M7k13CfChZLbBPK9XW+MD9v7VktGmx2eBqyO1t5UMVk
	igI6cbtrWVsWr3RcP3c6wg7SF30+O3zaRe0cxDg3gpdodZAt/6MUfRVrJS4xYvz6fGMKYGfN4DF
	QE6UNy2CJVWnMHPZAPBYlfH5zx+pf+TcZ3JlqXaOwRHVCv24Sxug9v2AFC47KvLMfX2P0ZhPPVS
	rNH2pnmE3FPj4XDRYeP9DFjDhTu9ok6/NC342r5dQPrlEedBqzXUfbElR7SNERC0PgY4=
X-Received: by 2002:a05:620a:28d0:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8c9eb2ecf59mr1389594285a.6.1770108637373;
        Tue, 03 Feb 2026 00:50:37 -0800 (PST)
X-Received: by 2002:a05:620a:28d0:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8c9eb2ecf59mr1389593785a.6.1770108637017;
        Tue, 03 Feb 2026 00:50:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffedd3sm975081366b.29.2026.02.03.00.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 00:50:36 -0800 (PST)
Message-ID: <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 09:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WuJRb34yGOrWvqI_UnblxaWMOFjFy5wy
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6981b6de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JrAyZVcpMNYPRdOpmqEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: WuJRb34yGOrWvqI_UnblxaWMOFjFy5wy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MCBTYWx0ZWRfX/zq1viWUsY+d
 sJIfK4QA+t8lsAL2dzhO5DSkfaNdFYWx9Mb+mlgyJ/ALJ7IgKse4Outp28ya20jz/qjknaUUjYF
 uFhsPuF6QeEBGraemEHrV64t5W738yfbv2SGuJ8Ms1FufhF9p7VQB2H8o3j2q/nB3m2U8kYOHop
 SSlsik4ExByVM6oZIyoCZWODjRu2s8590XNMUvi6KydrNJWGfPdPci6y4ebCpGpwXEjYYLeN4J/
 FQaSOfbh1uvxqztqFdapIYWaIy+eM96x0jcJ5SNvwlQFvVVWvMToWEeXqLfnXaOriYCYoEtyx0h
 XxKCWAfTL/u/gOWGOg9mPsPhgTUtkJneHydabheB+DZg9rOxK1PN6akEeJpKPvNRWSaM7FuvOsS
 kfc/dHmEdVIukWygCsZEdkevhQlnTyg6Q4K5OEh2Qat4IMEGv/4INRI/P1Z+5X07yiGQWhPxpcV
 KinrVgLtfLjiduoSedQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91623-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A280D667C
X-Rspamd-Action: no action

On 2/3/26 9:08 AM, Jie Gan wrote:
> Document the platforms that fallback to using the qcom,sa8775p-ctcu
> compatible for probing.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index e002f87361ad..68853db52bef 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -29,6 +29,10 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - qcom,glymur-ctcu
> +              - qcom,hamoa-ctcu
> +              - qcom,kaanapali-ctcu
> +              - qcom,pakala-ctcu

Platforms with existing numeric compatibles should continue to use them,
so that the mess is somewhat containable

Konrad

