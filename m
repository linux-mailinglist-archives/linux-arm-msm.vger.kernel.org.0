Return-Path: <linux-arm-msm+bounces-93480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCIxEuQwmGkzCQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:01:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D635D166926
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92783301E20A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451133370EA;
	Fri, 20 Feb 2026 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9+1vcW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S67XPS8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2464B2D77FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581651; cv=none; b=HZRfo7zwUiX/axK+0HP7u0P3zxOwcxvQNpD0mZsaftld89hogL2z13wyDNvr7NeRlG12pUok/ppUFmz0nEcMNr+LUNM7d8UAMokuX7CKgCCuywNWpGlhgVAb/A0cxf5AFm5rkPGIC2XI+agLvYd+h1HsDe6noPR6NqrrE15hL4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581651; c=relaxed/simple;
	bh=ALv+Y4MazO7kBQC/n25Bvu/WdhV9xJoS4dScH4XjcXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ab0zTaUA0J6I/KAvI05jgY7LYNMU0dIJP0ZcnguRJcv13q2LYeOzHc3XKKDcxwsGlJENbkStg9ubjFFZJWWVMQhsHluHXPEJK1F9fmIWA8n5aiZAKFH40oqEXS3BVgpFRu4CBcJZmP7TQQ0rc+4NUG+R71L2F2e0DRjG0RueGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9+1vcW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S67XPS8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5WR7v1813906
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddo+U4gF3xTQh78RUVFL3FgkhoVPcyhxFLNelU0/ITw=; b=j9+1vcW9GTqa1ay/
	BXhTEz6glwDILfEnCfWUGItTE1+SXCH8rLdVzkirf713jCD35xCTM5xG1od6XcjY
	QOP6grijJG2smmA0QmKzlARJDTRjNKAwPpzUjqKoyqW3ChiDFizLjCNt65hlgrKG
	6XRJnQaO7UeYK679pTA9/qrIbIbP+gIxoiRyyxP7zvxLF387ia0Vvdanv0FufmMo
	WkIi3d1HgYroHZdXpfGHL6jLYy8whGtwQFUZ9TxxoFAbMo23GcxDfY/KChUjYNCU
	7ytuSLny5E/Umy2N2ieBusd5+saPSWeFOzBgTnsqP8Hjb/fPVw0Ji6tdYK2KM9q2
	Sul2cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cedsns7er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:00:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38a5dc3cso187206285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 02:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771581648; x=1772186448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ddo+U4gF3xTQh78RUVFL3FgkhoVPcyhxFLNelU0/ITw=;
        b=S67XPS8I104hm+O+CmKQ6nhxIYHmOQ+/yZ35aNLvx9Q4KeW2L8f4wpf02xzhtb0nkr
         36zAYNcXXSq2SMS/HRvBA2RulCct/dFaDZeTCc7h1NudJ6f2ia1eTuE+5FgrN6MMwrtC
         csyTfYp8F48FMUKiDNxT53NQ7zUgdzp7zhUoqWwGf0aRAP/FVOgOplBFaODA5ebFCOKi
         prLvUnChxiJxXTFATLNjtqUnnciok5jRV8x8FAmSwB4jGnET31g0YG18rbbp7lUNOJ9J
         BJHsTzv5V9G/6MF9A+V/lxALIVVRPR3WEdmsoeWA97/j6diJ2sws8INjPpQh28RODHp7
         ZU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771581648; x=1772186448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddo+U4gF3xTQh78RUVFL3FgkhoVPcyhxFLNelU0/ITw=;
        b=MnriZmVsyBkT6VJ2qoELxKL4aLQUXJ3D5Uh8DzN7/2rfUclXVFtVEiCG3cZUXh5UAE
         FiXxkxFHzG5LjR81JdPjfoMcL82SMeYtrUmVorzIEiTmKSdClGtr1MIQy20aL5se5gAc
         zWEMSxWZGmw33ALZUWqi+CWdd4dLKHASDzVr7lDqggHn+y8ohPgoTNFNh7VM7HqLaai9
         wWrQFHaDdr5hDBWNLtKG7yvnrPqqivnSa/LDMIydpz1ch51lX7jJo6KiWPKp7enhb//h
         i72VOlCvi2n/JwAyW1v8DapcT1vbnmMCznQo9MATGAFd1T/xxSkThpVhWSjxOSPPu1kv
         9YrA==
X-Forwarded-Encrypted: i=1; AJvYcCWyh42VdZFqxy/BQnpn4j09hgbsQH44Fbw0Eo/vfDygQ0GKhneC3F51DcRP1boD1F6dY90hzEhO8vt1DtsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyZcPj2QZo3r/URz6fa3oTddJo5P2t6rbXuOJ/3dtOYF7PxRYNL
	zR2tCqEjXaiNS2X3EWmQx9iqkbHUMCaR7d8m1NE5AOeZodyp/JU6qm7RoZEFIs4tAU45p/ggtID
	ZQHS8z8oKkbdp+S9bDkz0iYRW8KCsbf64CElQCHYDPXf6LM/MYNe0kIVjZjc5S6vVIbOY
X-Gm-Gg: AZuq6aIRWNS02sD69plDQDjfpKy1WhrO+l4Q6RIboKGHxLzGm9T+NNzgM6EbGygTe6o
	HqJCk6yO1Zxm23q+mUzzhCYIDDEJqYsOVNTxp9RF4WrdQICRHNHC7CfnhOjjyusWnBShnWOWv6U
	fOGxXQe6YqfZFkGNDXmFUSQ+m7h8ip+0jA+xgjGzTJ5TL6AzRF+w7RrdJeptttzTdE869W9OWg7
	pjOBEiyXKjpBVjxDQfvdiJRvWld9DXkF4Rqz+k4h1Xa0TD4TaP/4y5rz+dqr+C/kw5FRGMy991g
	MYfqurU0J7+SGKqU7VBy99RQMRv0/DjD+8n8TebKXGtEelvyi3U0XiHCaZnZdDZ/WFpYm2BXLx5
	gEJkv0ccN1bp0P1ZlLNOalJQqGG5oS6qZ40eC/NwPPxHcMjs52y8azLRrz6pctSJjCzHq6cEUI/
	s3JJ0=
X-Received: by 2002:a05:620a:4809:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cb40869db3mr2446728485a.5.1771581647668;
        Fri, 20 Feb 2026 02:00:47 -0800 (PST)
X-Received: by 2002:a05:620a:4809:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cb40869db3mr2446721985a.5.1771581647140;
        Fri, 20 Feb 2026 02:00:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e579sm667828666b.9.2026.02.20.02.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 02:00:46 -0800 (PST)
Message-ID: <85ce1f2c-f5cf-4e97-9611-4aed03f69cd7@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 battery temperature node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Cameron
 <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hansg@kernel.org>, Jens Reidel <adrian@mainlining.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NiBTYWx0ZWRfX8WSgVsoRXic+
 d2u0xgqE+zlOB51jHTbpcR/zoApEGmpgddLDQslcCGrvFCoMMyjt+8IAD6V57C3rR8vz32Op/B3
 VuDlzEFS3ny9sfm+/DSzrNwYslKh+AIx+6MZJxQ2/L923yhCoOYynsAf8E7peKR7icY+p3yv4V5
 22eBQ2q4qJnmecpEqngQFfZ+nDq60xL2rQRTzd6qwmcOc7fjiOsHQ1JC7aO3apDDA/kbp82Fg+6
 eKo0U+81ey0JG+ZnYasPAwAqWoOSDSGySlP7Bv642JqqKdT3jnbAHdHHD7Zhk+QmYsD40aPsp39
 n/B8pd2ufRGXZql8kIILhnnRiEIldaMwhbk9hbl/ulBQ8oTv1JlKoFe8UhGCcZ187pPLMOYhHxb
 6a5/N90Jvy6pu7XeHzPtFsI7tY+k3YTpDw3f840iSp+eNDH8zzIeo29FDHZm0NtBAUJ4xlvUSKv
 I5LU1hPBm/QfQ/9Xx5g==
X-Proofpoint-ORIG-GUID: DNub3Y8BTZxoranA3giC8mMTZbhapFEU
X-Authority-Analysis: v=2.4 cv=JsD8bc4C c=1 sm=1 tr=0 ts=699830d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=8l1bqfnc6EbWCU14WoQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: DNub3Y8BTZxoranA3giC8mMTZbhapFEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93480-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RSPAMD_URIBL_FAIL(0.00)[fairphone.com:server fail,oss.qualcomm.com:query timed out,qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
X-Rspamd-Queue-Id: D635D166926
X-Rspamd-Action: no action

On 2/20/26 10:19 AM, Luca Weiss wrote:
> Add a generic-adc-thermal node to convert the voltage read by the
> battery temperature ADC into degree Celsius using the provided lookup
> table.
> 
> This will later be used as input for the fuel gauge node (QGauge on the
> PM7250B).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index b697051a0aaa..7857003099a6 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -108,6 +108,89 @@ rear_cam_sensor: thermal-sensor-rear-cam {
>  		io-channel-names = "sensor-channel";
>  	};
>  
> +	bat_therm_sensor: thermal-sensor-bat-therm {

nit: this should be a little higher

> +		compatible = "generic-adc-thermal";
> +		#thermal-sensor-cells = <0>;
> +		#io-channel-cells = <0>;
> +		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
> +		io-channel-names = "sensor-channel";
> +		/*
> +		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
> +		 * 1.875V reference and 30kΩ pull-up.
> +		 */

I think this looks good. Is this data going to be correct for all/most
devices (i.e. is there a single battery sku)?

Konrad

