Return-Path: <linux-arm-msm+bounces-103447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PweGPn94GnzoAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:19:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B336E41080D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA92630C603E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547323E277D;
	Thu, 16 Apr 2026 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyiw650j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFa7woHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A939A81A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352653; cv=none; b=Qf/vUk5ID3RxLhjnKxmYUlDICXhmhPZG8fXMEiZOHZrIpsryNMDNL6vuxKW/sNpznW2mVBN7CI3PVznWdpiyCTdnN0Q95qU18a2+GRA87KEVf6Ucu1k3vtGpO5xOzML5JwPNrJp/bQbhJsbRGwP/Pe/vrARIM2FejR+BTyX/MP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352653; c=relaxed/simple;
	bh=OoDxQ6JnCdkvOIF3hQyinUzkThw8zBb3mtjvgZ2UdeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImNZt+gOoIUi755Pc+rY7hzX7CtqvEjV3LwhLFaxpeS+NYcU9SwaGZtSlKCOFtGRft2XaSD3egi3kY2EzZvujTLe2CgOnrUfO4fXsZnIifkom8JCSmTtdvzY1pzpVSa+HP65+xQTHP238tuE+3pPD9fvacu5G3LJT+vLzLD9oIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cyiw650j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFa7woHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xg234124942
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=; b=Cyiw650jP1GvuZns
	XT2bm1qDSlwzCTgSyeUxpj0iSWM+xmATXjOEN2tq5YX6sDQvk3ccCsjWRhy7Jkxl
	dPo1WhG9TnHjt0o8vvLE42SY5m7WkyTaOnckdFWmfZLlYj24x4VJOuoWgi5UHWly
	NkXJactehdyih9M4G7hZOH0RImh4lJo5XvGSyEtkzShm6y5wX5Qq33Y/wmeKoHo3
	mEc96UxRtKC86B7yd8M9XLRwTpDCKbglUKXctifyp4/jj579uauva1oyzrtPrUbi
	EbSVnJLCkK8kSstuTyY8YTRbG/Y+aR6JsSyJoTKICn2cqkK3xNWTxtN/XmOJnjDg
	HrEuDQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf999c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:17:25 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46efe204239so1316223b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352644; x=1776957444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=;
        b=MFa7woHwYGxeFHnhCebOngApdmzxgicc4v3jXPQyhwoKayqhWL9ON7I09tiIukrjF1
         JlVC3rkno9sQFab03s4AlgpkCYlgifmTimdK6aemjSzk6XM3tTKPkBEv12eReJX7YzR/
         wRBP5tTxLVjxfZlde9M0d2VmWD2PNnWYfZI7kRtXOa2KanupoC+SZw1y7lKDtbqOvj6g
         ESZzI8hem6CBjRKdblXO/Hnw+syec1p3dvga4MVcFEfkqc2VvpFbuYtcgTH3YdmXOKnO
         beM1Qq3/toeTseRA17IY5M7Vcr33DJddBs09SV1ndI4zcnRsBAC0j8moexzM4yNw+sX9
         mbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352644; x=1776957444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=;
        b=pmn51j2C93RvY4Yz2fX8IRK1oJ/MAy/XrDZxH6l3QcHituWN/jLcYm0MMwZVdqoUKw
         dIJv0+UMxM/wgpwS3JHyJyyvAQjNNcuwzCayZGIQtbsbre0o26UkgcC2AZrbP8j8G92x
         sSHYsPva50Ys27rkMQ/kKDK+QXYRM6U/43PNWR3eoCGX2tDJdwSv6OBWTOM1+OrzVt44
         ACp6NMA/Y8vZxcZnksc/wFspKZwJpbF7b3MKohE7X0s+tmpZP4ZsP5+N2u5MHkJES6mT
         MtNr8zQFO5NkULPwNug/J4c/Nn3hemYoSpTxxfYGqYGEYT224z9H0DZuoYUSPPj6wjRP
         Sfkg==
X-Forwarded-Encrypted: i=1; AFNElJ/Lz0C/Z5072UHG67tO2omWQloYqZutmX3MiL71uFKjfBsMIHVQGOX+iL32V2aDJwJ0aQZRoUXfMqlmhWoN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Xl30++SLa89dgR5lsnmRzDjAbpOpjf2AjR/tQo0notvP8kE0
	PQ3EB8XgYHu7AGys1nnZkGSNu9xVMSW40BwFMJJ2f+q8zk2dt+NzkQwLVvfD0nEnoWvY18oxwCI
	bbppkkSIC9PCQg7JC6Z5iXHan/xOZ0FPSQvCRIUc2yS0x6aaKrvxUg6WZRGVV8Hk9ntgT
X-Gm-Gg: AeBDietPnhSsXbukm5GR2ALEH724B/EpHaLJQpLlb8A90qcsL81sFXsxd5tNlVCVrZs
	WxYg5zP3sUO5YmVQoXPnOIAD51owU7JSXD4GJz8borhiPR9nUE0eJlFeR9PNyL4hVUcb6BZhfkh
	W5VL4+ciKO3EqC2jkJKimj40hHkyx/xRNydZqw1mZzr5pFhQYIzK5LoQvzMuehuAxcLSzSFlTss
	R03g2LgWQKEvoYKNDA4S4l4IaUnlvaqFNb4RrqN3Blkvzi0VAUwb20QwO9+Cnvf3+ntFUM18Dh9
	AkNTOs7lr1mWX/bcioFfp1YOHg6WZXLo3rWxjiX1LJQZ/4hNTLBqRpTOJN3ZRebaoicVeSQUQHs
	QVZ/MVY2lyCWnxOvGKqHAkNQkocK1qzEegmkkSZWeNqx/MK6BWWKNAt7nkmvSjN5/xw5GftHY9a
	FAOIfGQ+kCwP2iPA==
X-Received: by 2002:a05:6808:2225:b0:459:f0c5:781d with SMTP id 5614622812f47-4798903ba3dmr901512b6e.5.1776352644398;
        Thu, 16 Apr 2026 08:17:24 -0700 (PDT)
X-Received: by 2002:a05:6808:2225:b0:459:f0c5:781d with SMTP id 5614622812f47-4798903ba3dmr901486b6e.5.1776352643869;
        Thu, 16 Apr 2026 08:17:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba299f51c01sm93170766b.4.2026.04.16.08.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:17:22 -0700 (PDT)
Message-ID: <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oeGGdG_b0s57VoWj8-2hLq6gdIDB5ZJW
X-Proofpoint-ORIG-GUID: oeGGdG_b0s57VoWj8-2hLq6gdIDB5ZJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX/2AqXFAS/Z4j
 6oI/pes5qL0piznXi9Re4IYxveSbG7IJsq0r82ZTEL7/Nwq/gVHweK8OjzYHipKrkdDxSG+8+Ih
 +2KYYgWgUoTblonO9aBx67iQfEEvjY9IDSQABU8Dp0MAF1k6+kT8NVySsPuaX23a/pLhj3xZk6c
 z2IOI46Gt17LJ7gLNMC20TFgyAUrC/vCC8ihoE3xlYe1FhhRMVdimdS+DzOU5TVYAUsEMeEqrQg
 BKf20OecYCBUQKpPEmU41UswYQfYMxu7VkayVo4SwXKePft0eAalxxDo/0L/eWQo6Z6GLlkoyPx
 pHH0wil1aQHpNCYus2iUKp98CWUfgfiNHCQnwRUw0tpX7yFBUgNsO/aFEuo25XiU0DHcbdrWiW4
 2hzXTzg0MBptWa3OZe2Oo7V5YZTToOk6gP6a34EMMkzP8gsn361RkSe5dhlXUnr6rUHSp2bVKB5
 kwxorwnH+k6sqehJCTg==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0fd85 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=sGea1UAM9DjOSmaL17QA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103447-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B336E41080D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index 90e966242720..231a3e9c1929 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -267,6 +267,14 @@ &usb_hs_phy {
>  	extcon = <&usb_id>;
>  };
>  
> +&venus {
> +	status = "okay";

You need a firmware path here

Konrad

