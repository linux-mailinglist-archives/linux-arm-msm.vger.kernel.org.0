Return-Path: <linux-arm-msm+bounces-103713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJrgC6Lv5WnCpQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:19:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB17428C5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DF8D3013B68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F9438BF78;
	Mon, 20 Apr 2026 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDFETQzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/E611n+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D48386551
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676766; cv=none; b=jkCu3U2o/gDuy+jRgE7LGx4ODLOKFuP2NLOxDiXujA29dgopneDF6a6vqp+f6c1ZdAyVJnf47Ny2/uC0Om5Q73QTp3X6gufNYTYOjW5synMYf5PKf7CGNl0oB2HNwIOKuIpRRT0cMwLEgpKIm3vdua4RDv0YGyd+at2GNj6eLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676766; c=relaxed/simple;
	bh=P24EoD5xGnfBeklnl/2IvyFY8qQQprwNDrVurAnpIhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRk91BA6Qaa81kXdOR4xHV+5t+HFZ6Bh8P2w941mRbMy1HqSo9ELyUKEQGaJ3qcWlNcmC6CEvO1QcZhSfN1g7rMjDymrdZLOJulcFUk+4/KmeSvszX7y3XzAz1weL/uKYx7Xrn6UjHT99lPvmn32718Ab2aRXIJBK/5OiIw0Y4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDFETQzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/E611n+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91Rco2281664
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwwBLlLdW9puTDYK6pG7Oh/PAc0bBf+PodW3Dq7XliM=; b=RDFETQzSXcUq2bv7
	RyThkN5JjMCPrPmRFs+hv8Fj4srbNQ1rRN4AO8432LGQvQCJ3ivfkY6SKvCRMN/1
	V8/jyX1WX7MSALoYRj3YiGN0nryJplTA5hOUUlsRvSoqSV0Z/Epvvf9B9UpHokO2
	o9GaT7+tCgKwhLVFbJZCC8g0rJjbMxDuIrMGGYpuSXBxiJsPzUUrkV0S6H0UZoZ4
	aUh/OwS8fAt6nph1GQ1zKip0XBuwMTIsIBD3NmDH6ggsm9MrwIF1R66F9cbL0vy6
	iedUfJX13DhjFkMW2ji7amhXekLVFHX/CvpTnwp/HYtIJ1BS3q/KBzP+a9yfiZRa
	5ZVZ0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh5982kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:19:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso5840276a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776676763; x=1777281563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwwBLlLdW9puTDYK6pG7Oh/PAc0bBf+PodW3Dq7XliM=;
        b=C/E611n+IKtYNqzOSAdH6IghtzAzH9azgjlcYZBZJiVF3PYuQW2Q3eFyQ100/bHh2M
         oIOA09BYQbN7NlIR/4M3oUcmDHgnbxFRdVlY0LUTZc4nNImBNbTgdWvr9GEWKolL0cYS
         b7CURaUh7eg0inuOZj9RkK7B0u8oy2YKPMBWe6HMdXT1qZDNebA3HlhnWaJEIgmC/Ai6
         T4p3CB3dBJF3KpewCAEYRFm3VRE9D5OaeopnySqCDuASBcv3c/sKrRBpZPWvwb4I7edZ
         CbLIc0HXjJLtsYI+/62u2ZEaQWIQpnlMxA6Aamr5tDA1lh8Qev3/3cKsIGe26fpwhEY3
         Sg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776676763; x=1777281563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwwBLlLdW9puTDYK6pG7Oh/PAc0bBf+PodW3Dq7XliM=;
        b=QroS83EKnWdsbUoanms/snlpBCsfunScfAflnyJitJ4eotyzAnkfhboe8n1hCqRaHc
         SPbUGq1CmOmhkMpe2+OLqcaNkib4Pkodm63zqozQWvtu9SW5pL4p/W/2iw37IZcBRwfa
         kTN1CnwvzdbUdHh4mrZGGjEsES5BZzWoE9Y/y0y20bfMctGYXQOzdwix1VGIvIqpoUM2
         IvDARNVw5KBZ2RklmcLhtO/+PllNdPy4Vq+VSacxw45tn9jJHArm5trjSAWUSzAFwOw8
         2iKrfubXMnpvWbDSoTPf08lWspv/pFM6JZN2PZbJWYeFh4iyBQi6C4CeSxSM7+ss5ktB
         xxCA==
X-Forwarded-Encrypted: i=1; AFNElJ9k0IA98/GoBTZuxSEkYoY6jxSUruSmfg1mxygLdABrzIqNP20iwSMdtS42OfPtPqsdAr35Sn/1feVObprL@vger.kernel.org
X-Gm-Message-State: AOJu0YyXO+cL2Vs8weexiN/jLB4GLflCzG0hSjgL3x08yGZzLwDnaa47
	VHFGB84jlQfcegy+UWOJ6kT3uOr3c5tThnUAc8NczCS0CpucdXX+Ak+/O9X/7paWpKRokM6/2Yh
	9ab+vVtBoK1wwQy0cSVlzBSl3TXm5uieBJBu76lz2ywq0/SHW5MHAksABXJlYziE2/5Jc
X-Gm-Gg: AeBDieuzLQUV8f20EwM3jkhViKeiuROAUs9Fihqg3jcxajV3yI2doAunJYiuifnvGeK
	l9Aq3RubGd4PzCwj8T5e5GZG9PD+V8L7rvEsokOy9zR+QOmp4X2QY5pxpAWlLYeb/bD94C3mIOc
	NIdat2qeBGBhOrtwG3BJuNDUr8yNcyzXl9fFzrMqsVMM1GzvASFeKaOj9cPUA3PaBRgdstB/Xy2
	UFyIlp3zpRb6AVmKkexaKYAdq5LLiN94M3rvPEQlNMdI/Al2AQrqsPUd3w9/4VxSsclITF/5C5T
	6e5OKDaFdwV32aE4WbOzmfGmhL2wwxMiqtjRnj1LwAitiA5cUNhlNpSzr31FebgvOuKgm7IgbF3
	87jsL6NnINqBaPInKKsYxtZ7kO5Nh5jfH23S2wFtjl0HSUnBEBar/noNj5uiLlepC5hDTTvQGsi
	82QWN32pN+BHCEZ/ZAkYLk6p5z6IiVn4sTdth2QuBbRwWNYxc=
X-Received: by 2002:a17:90b:5583:b0:35b:8d89:7199 with SMTP id 98e67ed59e1d1-36140468a44mr13149852a91.15.1776676762930;
        Mon, 20 Apr 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:a17:90b:5583:b0:35b:8d89:7199 with SMTP id 98e67ed59e1d1-36140468a44mr13149827a91.15.1776676762522;
        Mon, 20 Apr 2026 02:19:22 -0700 (PDT)
Received: from [10.50.10.19] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc5d94sm12989529a91.2.2026.04.20.02.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:19:22 -0700 (PDT)
Message-ID: <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:49:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: upX7LuYg1CFf2pW3_KAqoA688kzMb3b9
X-Proofpoint-GUID: upX7LuYg1CFf2pW3_KAqoA688kzMb3b9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4OSBTYWx0ZWRfX17pnEC1w3Zez
 7sLiuWaOh+vfn6Clb5d1LVTQQV5Dn++1/JzFsY94jj+NV5eiyB7ctRWajpC2d2DuwwehKsy/tdk
 1zKgynWoI1LPNcPI/QfNoIhi/LUbkKIEil87cYDdz/ufpAWJKuMHSxBljkQYWeRtgvPsL7GZAo2
 qxEKZH8RV6Vz2P40i9OhxlO12dZIWddW4452iIauh760+2TEj+VNgnPQuvyCbql6wfXNlby357R
 fobpUuDd1EEb6CgjS0SRpclB+DlLr0CDKNE2XfdfGUZCYoLCbH4xAkNI5VAxk2wxYunOq2R9R3V
 IeG5xNgLZt4dfEdH2cgQZ10N4Q3ALJN6iTt3xa1YZx3fwql5MGmPoDhpdshEkCJwzgN0h6MmLwY
 q3DKTR3wZeoEZFx41BBIaO424nM/e5ZHnKeanqRrrEpmoGVozAYmboiaXA1aVVnfkx2BRzwiYFJ
 KLDxTWgWCqkLNaRvPCA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e5ef9b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mF-kcvSE2y_lSODwij8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103713-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BB17428C5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/2026 12:24 PM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add compatible for Temperature Sensor (TSENS) of Nord SoC with
> a fallback on qcom,tsens-v2.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 7d34ba00e684..e65ebc6f1698 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -58,6 +58,7 @@ properties:
>                - qcom,glymur-tsens
>                - qcom,kaanapali-tsens
>                - qcom,milos-tsens
> +              - qcom,nord-tsens
>                - qcom,msm8953-tsens
>                - qcom,msm8996-tsens
>                - qcom,msm8998-tsens


