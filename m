Return-Path: <linux-arm-msm+bounces-103735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJMaHRgD5mmBqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:42:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5484296C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45C77302E0DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEBB39A80E;
	Mon, 20 Apr 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAh8/W2g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PExMLQag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E0388E60
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681747; cv=none; b=KWvkuoaIyPq07W00XVQJFGjUKLeQJrJcIIRB1xUA+PdazYbT0snKh+i6WHjgvAA2ktAn46+Ifd/nrh6mxidktoG2Hhke+RlUdgl2AufEowlktF/HY3kWOo0Dl54+wEi3osVoeE+8EkOGoem45NueL0TAR75um/OL/BNKqZzr0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681747; c=relaxed/simple;
	bh=8XZn89MWbru8bQV6AMh5Gl+Q23Shid6hu2LrME/cXmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnG16bbByGbgWBIe621GrV+0u43qd91dWyw+WIV8OGyPbShKoJl+i60NGZmeEaGEl2EeWOy6oOlM4WjrpY4zhjf0ebNvjhzv/MFnNaEa1tc0Wm+HnDl8PlencvbORvflZfjliXSGbyud3RYVged8jrOB1wGBMtbE7iqF9MHqh2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAh8/W2g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PExMLQag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7YmOM3454948
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40+cVj4evBO6ID+RLEdSE4gIx3HZwIHC0OLMB2i0UfU=; b=OAh8/W2gjiaSA+KR
	hcy5VXQD0bjZizOf4bFpk08e+q/Q/u3UDbe/M//Jw1d5KlYh7Lbg/gcsSYg5eCY2
	EN4Y+it+wEWOQVQPR05SUn7cZJ9PEkCpyOq9NVcJwcw8p3ZWDNktnKEEuH/nW12P
	FgP+rrVVzELpM1toR4kETpk/lNsuz+J8HVJSAPi/iPKXunArYmH8T7uiyJNDVVHw
	dphnWmBsP8r5Erv3eLFBJ2Tyal4jPkG5dUxWFvRdZSzv59BVVfyj+iPnf4RwsIej
	2wxX6fLl5wk60nlqYIGfNoNVaMbY/0O9hb/zC/Zat9TvO+ACs4rX3V6nnAR0Kz0I
	IbYIbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjrvyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:42:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso4204410a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776681744; x=1777286544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=40+cVj4evBO6ID+RLEdSE4gIx3HZwIHC0OLMB2i0UfU=;
        b=PExMLQagJS87vLti+jtb3z5e0CnmiROuSuPa8rLYvuJ6zpC6gfrBoonGi6BSOrgi9p
         HFV2swlbq0Ye0v/mwi5XpC9qJNXk/2VeX1QnhpfolRRa1AxQR4s33vV58JxTrSr7c3il
         ApKAMonSNrM+K7IJaDnCvx/6PfCbUjmDUFZngiJcSXDaOG0TQZIaA7byHso2/WdfYTcf
         iJshSYOWzsqUyu4hFE5sE/8OliX2mTRyzQGENjaGHfi5fYTboQL4Tx+if1meNL1EOo5+
         7Q9z8yo4cm2aiPPhGAlgHWtdpJhu+WglS164LjIdO79JU5Lsr7q8j2VwtwEie2asKbv9
         bL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681744; x=1777286544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40+cVj4evBO6ID+RLEdSE4gIx3HZwIHC0OLMB2i0UfU=;
        b=HibE6c7N/JoG6qxMCG6MYtPCub99VRulmrprvqTCoN9YtyWlFDFxasyWAdxXiurO2u
         LG5tw00FxY5kxkmdis42rk/7TTLT9Mjz0XKZWBhqnf2PObJyV18ZaT/HwHL37MCMNIJo
         yRG2tR00flYuLIRVNkro7mui20aMnTcMJ7nlBAmKPVowU1+n5DuGi1XNU5MBi9tRp6T8
         LKLdrgNKO73fKnTpUiJb53A6C1/IXj54WZIEAn6VG54faAO2x1qkR/Cn6l+F+BpraGwj
         9F7ODndNW1/2Ns2WfWmWAdZYETkVMRB5KaYhvHf0JiSZMgnciruNIq4dpXu66fz55dMh
         sAZw==
X-Gm-Message-State: AOJu0YxeRqwGNEnxQzNqv3ni3Smfu5OSArtSx7x7jCyraNmGWHXc7VyF
	7dxtw0oJsDugH+2GzVTcD0z6QqjyTHnFonGpvu7A5YopAVH30v/lLJV9XKc3jDxsvpLzZZSMkxr
	71/SS1e4QFc0w0Y6z21WSJduOnfHbCN5IkRNKftJFwlhLVzzGm2crs6UbmzUnBb7/vEwH
X-Gm-Gg: AeBDieujm3G/Vmy7aZQsETL6JO8InwoclZ8Q5YbC9lQMehZBpgpkZO2KXmfntPRyr3k
	I4MI3fqWHSn+Dd0KoiX+fJ1vytfbJUANMHDGIjQ7rGuCuwimPJS/SAqUH3NGmlPGZCv4f/kj/Yp
	zTfXDkKaF0ANsZlJjdLBPUIAzYLpfsNOEYcKWkMfUb/0pxYRMWCFGf4VTu/r5eheEurU7gQkJSM
	P6F2/MMIY1hqmYpZi36tZB55Kzl8XQprcvsTonFwCdxRqvMEioLZ9HSfuGaRy6ZIGjPQCvGRYJ4
	SxS/lE/do/2kXwkcdwTpOMeSak6IkkAeRvhxOpVsm8+dnjc2Q8uDPiPox9d3fZZZjHUWPYLfFot
	EEiEHarm8tCnMn+2QFHDICt+uOx/v8CzN+XKaWIZCBWNCLfBWRn2So75mbCkS
X-Received: by 2002:a05:6a21:790b:b0:3a0:c285:e511 with SMTP id adf61e73a8af0-3a0c285f10bmr3732465637.24.1776681743851;
        Mon, 20 Apr 2026 03:42:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:790b:b0:3a0:c285:e511 with SMTP id adf61e73a8af0-3a0c285f10bmr3732438637.24.1776681743390;
        Mon, 20 Apr 2026 03:42:23 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981d00sm10066770b3a.5.2026.04.20.03.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:42:22 -0700 (PDT)
Message-ID: <03861088-a1d9-4bc3-8882-755860db9c89@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 16:12:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
 <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-3-f6c7ab3c889a@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-3-f6c7ab3c889a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eVYIOFwHxRbfjGNABJG6WeQoF46ffxwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwNCBTYWx0ZWRfX0PheQkO1R7Qh
 c73kNhNySyAVzAgJQc2ih2JwNAJpCqTd2N9H5cx0j6qYiyZcVpKGwDiJiuV6BAVDwd+uGTEgsj/
 yESN2rerUJ6BDvFVSDZ4UdFTsy1PusxPDpas5OfolrT0wYdGTijsT7Tdzux47av+kb/Z3+pQKmD
 dC2k9ao5j5gUyf/aztDN+YRJmsIBDxdTPzbzUSYU1N6us7CSkxwGQI3NLjx04zINltOwBPJBZPk
 wHNlw85JulPwNtMvTt6XtTtUtD1nbxvLlyBevZNE+F43QM6wfdD1LhtYZwksSq51hl89qyaBQU1
 uxvVkc80EJSU37oxZUamCiyGh5TBN4FlzyhWDTT4G7wyqE/ykER+vus5hYRt1MSxObRlQv0z3Oj
 qMRAh6ge1QGoH72tZbKHyxdjgiiskPmw+tibDlkvvizTsZkUYgOXP9n0Yzst3OfB0u1hr/w8Zg2
 HJ0ykcXbQxIixgrJ0gw==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e60310 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=_9h3uwt7-hqOWLc0GMEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: eVYIOFwHxRbfjGNABJG6WeQoF46ffxwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103735-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD5484296C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20-04-2026 15:12, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..2dc53814aa55 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2455,6 +2455,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +							  QCOM_SCM_VMID_ADSP_HEAP>;
align this line with <
>  					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> 


