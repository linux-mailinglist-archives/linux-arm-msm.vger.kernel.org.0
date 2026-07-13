Return-Path: <linux-arm-msm+bounces-118631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5bRzHxd6VGrKmQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:39:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C88387474A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:39:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZDbv3dUa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="WWk/d02W";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118631-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118631-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 905A53005757
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E432F33D6E6;
	Mon, 13 Jul 2026 05:39:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC6EACD
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:39:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783921172; cv=none; b=ZdAda4rJk6kTLrL6A3NNzLxkf5/ASUOSgOk29DOJVeho1Z0NBj+CqmQgpkh7OMjnMjkqfenE20YpBKWcijeP2aisc4v/29mUYshfncjZEUAzIy6bzvq3yLvgLOBcB8dLXEXs75tqSLF/fRPXqc1S+hX95pGfVjJ2aKYXDzeqLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783921172; c=relaxed/simple;
	bh=x4I6Scw9C8eqFLJvs/06PrDu9U23LOpRWWHuzG5NeCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfXzff0NnM579eVJwOSRS51sdAQ/F2mfGxmvWU484jnZNe7x8Ja0yx1TO2djJdKOyERsuNYL3ChhMAHma+VhtC1mVtenHe6DDE6eOeKSLyxEPcKR+6H8EuTa/mQOz12sNTkc2D+cJRsqIr+pKOtTCDXrX5+RUaGjZ23Yqzasleg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDbv3dUa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWk/d02W; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39usg4153558
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5wkf83Uw+RcAqzwU5I/kP144bnk0J0uMffXfepJFss=; b=ZDbv3dUa4vZ750Qh
	A6+gQIFU/nSAuDgAzaPRky98ADnVMmW1AfLKHvfXgVlO/xeC2V3INZRoTJqe/TUF
	QqFlrKAwyCqVgm5ThmTLoguUO9a9pXm/zU8dR8TVtRT2lizzPIcmC5xmjJLaUS33
	L5iITTOXIxMeTR3ENpmzKGJdqmpz1N14u4putWAYiBNbR+ScTl/09pIWwrpOF8jo
	38QHLD6kgUSGIMz3QVTNcJR0W01NEnJ6kGaGLYbu7npUEUlw9Zngr4wQ90LcYwHt
	1u/YbZ9R+R/ux4ziglf31u4CS9JJLDPqMlk23umShXdQTKbm7jKIRiEs1jDqZ3lo
	mSndNQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gmdm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:39:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484ba00601so3207842b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783921170; x=1784525970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5wkf83Uw+RcAqzwU5I/kP144bnk0J0uMffXfepJFss=;
        b=WWk/d02WRhBLAAQXw6X7wIONdxTgY151mF4uceS7Z/zZ/dBuI2eyvxkq52Yq2H3M3l
         ITKjeEDzLPykyWI5V9pya47yUDEI/3lU41KN8EGfcTrmjg6TTVngCHFJu1fUvXHZbnH2
         bRn2GoD+upyK5jNoVHzPa+xawQGYdqFkoDTY6T+x+qlGt80re0h0/GjbNYCOohhKG6lk
         xRVyLA05o3wxzvqudTtyWjdQFGSLWsN37W8Yvnur4FAMzaDkBKYL6T+bDqAhdSBNL8yx
         U6VPtNrwbe6FurF6IIibI3zfnCm/2j0XuQqHH0dnbJQd5plVQo/QoSF55JeVS0ggFPD5
         v6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783921170; x=1784525970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5wkf83Uw+RcAqzwU5I/kP144bnk0J0uMffXfepJFss=;
        b=hNxamPwatH4AzyRVm0L+GTgnxsV5gb5PcTaDQ/kdJV9I5PwLsXQHK1zfJ1Kl/hkjVI
         H3+yZOTkW/lq/DpItKh5OAY4sudkgC2wkjmN9Bu/Ik0mskq1iDazYcB/9U4o2TCvbJP+
         A5SD47lqUiP4g0zJwgrhB+Hj0G2wcyzuPA2SFUJkdIfWSXS2glYpOodC3w5L9AhcyEm+
         ZyksnW/VALTxJ7YPx84fuZyYcvYa7BPcOL84KzJIWbton6TCXXuRQvvNh4XzLb94Ko0p
         bk4UyseV+ghcU22WnT7+cMOVj0kE2nHKerGEomA9l+vZp7+FiGKsyDp6n7gDPu/9aW33
         pktw==
X-Gm-Message-State: AOJu0YxNOBtMSlzy0K9JUp+YraTDjVUDIu2FDUPYmVnQxYi/4GOsaHel
	+wGXu4gTDcgln/lF1q7Su3fd7KdIhfyP0Cn05fmFJiXszC3z9DFHl1HSlwjV/l9swCJPmdjQq1C
	oxmybhc5Mfnt5unNM0PnwRzJPK7NxFJTytvOSgbbssLvqyKZ1lg5Z/0XLjbfNWQ4NxLnJ
X-Gm-Gg: AfdE7cldhx5SbH3ZqeOXQm9QuxxJfp2GPAVk7aiCvhNcpAXpojG4tq2oBD0NOMdBcXC
	Z52H0F2Y1c/kqqx/4xuhJYIAAxbUHswiSeZf6d5ivm9tR8ubpE2izFlPw12Qt6aG3OvshQL3/28
	ky7xJG+WM6chV4WOn0AU6e+ZaA2H6gUcGTiUqSKCH8PDH6Vsxm6uB6qaZ4ZRkKk52Gy//8oFRm7
	ydlVMJ4xZr0cArn2rAEZWCfYJl4SG6ZBqGfBWhqzoRRn/+L3W/oOImkHqDSQKwExTXBaSMa9wgy
	RY0Wtrl+36uIaOmtEig0Dp6Q+dtsL0sxVniMnNwbxW/kCoUwLq8E7zKLCSf/p5gkskh9wlEz3CP
	PxL+iLwsNtlmsbDCLDEnyu7A+Dg1TPhLXAiYiO4kVJ2vm9cqZTwORe5ePtrXyBIKsr0aZFzRw3k
	KH5kMWKBc07de+1pn2B2kPP7I=
X-Received: by 2002:a05:6a00:b4a:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-848896c3a47mr6413496b3a.7.1783921170122;
        Sun, 12 Jul 2026 22:39:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4a:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-848896c3a47mr6413465b3a.7.1783921169655;
        Sun, 12 Jul 2026 22:39:29 -0700 (PDT)
Received: from [10.79.194.163] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9a832sm13511408b3a.18.2026.07.12.22.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:39:29 -0700 (PDT)
Message-ID: <ab5b5cfc-e0af-41e8-8f55-d8176f633bac@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:09:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
To: Daniel J Blueman <daniel@quora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260712134601.99191-1-daniel@quora.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260712134601.99191-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a547a12 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1obtQX-UFFl4KiQxAf4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=CsAS6f0m0zARWR-uHzm3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UPUXdOpsKwulodsbnl6uK1LkuVaQFiQZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1NiBTYWx0ZWRfX4ZTyKc4zgEWh
 bDs5hwH7Ho4kKLgi2nzpEQ/zQRf4RuacJhsd4mmLAIHbxTrKDXq5MNu7ep8bdS1+z9VhhqJlwRa
 zjQNAt0xEtZfLZqYtQjuabLjvEWyUIO1JZd1YaZ/AKQ67wp1GRQrTz6o56DuQOzYMyFROUvm+VO
 dzYS686MWprkcteHNw7zT7uyGhJ2cahVXPbgUnRPS5TVjeQSVblTso8e63sOTWIzrkoPbnHa/8a
 2P657SQZtPGltW+7UFyN8lInbQ8o+UNk9rDd0LZwAa32HrEMiSe69kWdSPQJbDbyO/zW1jS1Y70
 F2tt3jVqeCsAX1vElPXjugNOrsEdsUpDAUBmLPBQt9tunjaNp2ya1pd/k2TQDIj+o8Bi71UdVrD
 XI+fVnZONPVdk6srZS2Oxgw4ej/NGiDshCQtOf98RbyM22Sg9hHVDs9FDMB41nD1aOY+jVpqxlB
 TPPPLQ5IaDDQOjKNtTg==
X-Proofpoint-GUID: UPUXdOpsKwulodsbnl6uK1LkuVaQFiQZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1NiBTYWx0ZWRfX+XmbZlYosF+U
 WA3QByvWCOcQ9ep2uf/xuzdrEv/D15CWfdhOfCe6OixXm9EQRIZwBISsbgCspgwdoJuiY80D0NW
 UwxWpXwUiGnm8XceU1OA42gaZh8qqgg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-118631-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:rdunlap@infradead.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-kernel@vger.kernel.org,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,infradead.org,kernel.org,linaro.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: C88387474A0



On 7/12/2026 7:15 PM, Daniel J Blueman wrote:
> The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
> Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
> the fallback.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> v4:
> - add reviews and acknowledgements
> - updated dependency URL
> v3: https://lore.kernel.org/lkml/20260526112409.66325-1-daniel@quora.org/
> - new patch with DT bindings
> v2: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
> v1: https://lore.kernel.org/lkml/20260429103301.17449-1-daniel@quora.org/
> 
> Dependencies:
> https://lore.kernel.org/lkml/20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com/
> 
>  .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> index ac5a08f8f76d..813d41769c0b 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> @@ -20,6 +20,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - lenovo,yoga-slim7x-ec
>                - qcom,glymur-crd-ec
>                - qcom,hamoa-iot-evk-ec
>            - const: qcom,hamoa-crd-ec

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

-- 
Best Regards,
Anvesh


