Return-Path: <linux-arm-msm+bounces-115397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vCb7BlOzQ2qjfQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:15:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FAD6E4104
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:15:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KO3ZZ69R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BfToT5uR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115397-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115397-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 718D1303FFC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D17940759D;
	Tue, 30 Jun 2026 11:55:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9090407569
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:55:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820530; cv=none; b=pHRcd1JMbTwM6uKEDJ5BXc2yFYs/brAOmqubpMTvqPVW5Bv2uvhxmHjziwI5FtbWmJCDIaU10xE0YSnqtPrV5ayh3lLS4Ub9fGeinIb1VAJqyw7tcSMlxuyb5ZfVKptqnBRX+uVhjEkc8lDHhznoT7fft5Hitxotuz2/cqGWCrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820530; c=relaxed/simple;
	bh=nb7/AXatqNpcYTWfCqRgE94DQ81iaZnzHCdqkCxHp6Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Djy1N36fFfTsav5H5qOPcuP6b4l1r2mbXfiKSv0HBrlskfWI7IfcMxv7ThW+jbCP/I0HOvAJkGX76NiNG7wAtB/VQdzneqSR3/io3YvPZ9EfbGEPwsaFnRCIGETFd/sU0L/uEeHrb8Y3hzwwF3bzkk6jT36mZlAnbwuI7wBQD1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO3ZZ69R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfToT5uR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1jd1573350
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSo6UPIJkVrgvfV6mdGI9V95crrjfd3F4e0xvwv1YuI=; b=KO3ZZ69RugTbpBc9
	7pJ2CdDGQvHrpkkONaswfMouKIm68bocBdmuhvOqdU5+TfWboGOL8jUaIQKDx0bv
	FxfXcr7Oy6Mn11qZOECBvVQTOadIHrEuk+IQzMvKKk+59F5VUJvNGVU403OGg9N1
	+zMuNAgWRF5pB+H8nAblvg0mjyEb1fnSzqK76vEz5RnO7xnGH4bq8AJovDAlZ4vF
	7CYtrj2vTCpuY/RUjbWlfZuDOHExeNH+cVEqMI7gC1mBuItga6Lg/hmFqpFiSGxk
	ebL6g7DXfJ5PTnM21skIbeSuLq2vu50dQ/6thjbNgjHeVVlzx0VVhJZTIFh0QaVs
	f4+2/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f468621hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:55:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c82843005eso42485045ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820527; x=1783425327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSo6UPIJkVrgvfV6mdGI9V95crrjfd3F4e0xvwv1YuI=;
        b=BfToT5uRkDWpMq4hHkS8Z5nmuLwM5CNwzs2465/H/QRwV0n6MkKdNC3yc4Ri/BVC7Q
         0utIeJYvWQBXvgLOhzg13gCZWGLy2YWfjGLySemlCcjr6sXLbm+rgQwhebGHujaeHJAs
         Nv+IamcM/k9QTCEWPj53lM1vXx/cQeAvJA5W3iRu2yGiokAowUjhds7eFU7UKWBDvMvf
         NiJ0w0jgWNxnvNdVFcbw2Fyl87siqc8kWWbINBx/4urMVXfB6P2Bm8z6VceH7RGhCVi0
         z9BOAVleG8mY8vkdFn8ZKFlN8wZigl5xcwOjsy5dHclq/ltnLIc5FxCRmB5sKVIuGA/l
         MRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820527; x=1783425327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSo6UPIJkVrgvfV6mdGI9V95crrjfd3F4e0xvwv1YuI=;
        b=XoYa/FEnzryERky5Un3dizUB3yNffCfj37kUG5HtBUomL3/G5JPZRjCc/OUWNNjmmc
         9y9grgaOHcU/L0n8eXdIm27983RTUD+yBlcM26Byb3b+IeTB9vrzPA42Svx4S28PGuoT
         3BQ1g92TGIEUfSfSq3s/Ma1/idhmB10qYIxoJNSBIAG3sAtdhRtveuyt62mBTug3zOg/
         RTWygU08jVEur1X0h+7+BSu8kLTtl+Hoh6S8T5nsLYZ4JvmW9O5HFVZACn2pLem9kjc8
         DB6cP49FI7rXIPjSnz8x1qrzkB0RgITUd0hyCejRpxPqdkI6Ji5stvx0GWpS5wijmXj/
         pz/w==
X-Gm-Message-State: AOJu0YzEHi3wGJgkUa/bkIcTK3c352aYbsJcDfxwC0oA/YlGofYgjq/z
	lOJ/TtSH/7JHOnu3VpSappYdCXDL3J5GYhTnradp7cRQte+PAdBVCm1BrvLZMdva94hNdCp/BeZ
	jpmWaDZAXufk7XyZuwXKMm1PvTrw+lVCMvt4guF0cfKBZPGXjF0z0TuxBQD9E6P1Qkwfz
X-Gm-Gg: AfdE7cnDpGdTZpCpQqvNk7+vUfXP6n2VZkR2MAb8EZ07cXDdj3Pol0VdMHzD2zn/XWq
	pBXq5szR5IsDfCk9BCbYDqOzLYtcCth1c9jDvumj02CGBkh7HI8QlTlF+3yqSh4KkGxgWakk/D0
	tHNo1MRF7J/l2XJyNoKEp6jvBOcNWQP8ZeK0KhYJ3LKZ8keI6ZS14S/0E6qJVhEslS76K/zVINj
	+msD1gjN1259FL9QVuFGMGCsLLsd0N4b0QLnYmzsLwkZAdlmIizN4Sfi+8awOAQBZqXTsLpNFmI
	ePm3MMtfVfiENIwgk3MbYe0OoFvhkiVznrHIIbb9Juz3kq45WDhJ1sweOyILJc30/Vrx05Letwd
	UH5YVSu2fcWfrPukSav/M35xrhbHOSjozrcJ+cg1C9Ad+lJEsHfTiqkDiyEguetCy/0BpYAjxIk
	6d6Q==
X-Received: by 2002:a17:903:2409:b0:2c6:f3ae:2386 with SMTP id d9443c01a7336-2ca2d52baf3mr27099915ad.7.1782820526858;
        Tue, 30 Jun 2026 04:55:26 -0700 (PDT)
X-Received: by 2002:a17:903:2409:b0:2c6:f3ae:2386 with SMTP id d9443c01a7336-2ca2d52baf3mr27099585ad.7.1782820526392;
        Tue, 30 Jun 2026 04:55:26 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bba19sm12206935ad.70.2026.06.30.04.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:55:26 -0700 (PDT)
Message-ID: <20cd2d3f-48f5-44f3-bc31-884723f864b7@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 19:55:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yushan Li <yushan.li@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5GGTRranYTpRv0Ogdq2jrI18PRsK9eWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX0xy6CedqDg6+
 DNo4ula1srJQLFD1GINxmogfckcH25rRBhGDzTApqsPepnLcdY+87kwI8vTXnZONnk6gmJpVPA1
 i/khFYKwQKO6OatnkrRxTmpa0JtkmnPtoxOhkaWfDiXyAmORXkkkKlGtL9Y7e4s3tasicJctsUo
 YjlEeYhQpSMl76tmEK9TYR9XIN2I9kHhlyXrkiNg+m/MrTDvvlwtBf30C2IitDJ1GONVq3VS4i/
 xDoMTMS8sISOvJb04NZ2nH2J3jfRCq07WQwuC0sgqHg9gdsL4gwfACRwNSJGq1MVP9R2urZGXny
 9gDWX3rpSiD+9/XGcd9wBsP/cx0CyWnOGGSq1S9glWQ+YWOuwKm3q8aMcwJqqQRGVMfsZNYQe2S
 r2UQnkmPM1QpnefeGRrxKmyjuCJYeg52vfy9DUmtPZ3Vc5mS1ayDQJORCFhdOdYsAZfXuoGCVJN
 sd2OsckdGAxVFzRmK7g==
X-Proofpoint-GUID: 5GGTRranYTpRv0Ogdq2jrI18PRsK9eWB
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43aeaf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v9AdQsT0JroIR-EB4BMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX08V2HDEEXY5C
 ZOFhfJdMhjsCEGJhStARha6Cv7SLPfbVUAOxjly802NdY9pIv6yynB+y+q0dnElTeCOBBlPBuzK
 ELeStFSEjDVPW58w94rMmw+h+lXy/Ek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115397-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yushan.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yushan.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69FAD6E4104



On 6/29/2026 6:40 PM, Anvesh Jain P wrote:
> Add embedded controller node for Purwa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3..491ea7769cd7 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -837,6 +837,16 @@ eusb6_repeater: redriver@4f {
>   		pinctrl-0 = <&eusb6_reset_n>;
>   		pinctrl-names = "default";
>   	};
> +
> +	embedded-controller@76 {
> +		compatible = "qcom,purwa-iot-evk-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
>   &i2c7 {
> @@ -1326,6 +1336,12 @@ right_tweeter: speaker@0,1 {
>   };
>   
>   &tlmm {
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	edp_reg_en: edp-reg-en-state {
>   		pins = "gpio70";
>   		function = "gpio";
> 
Tested-by: Yushan Li <yushan.li@oss.qualcomm.com>

-- 
Regards,
Yushan

