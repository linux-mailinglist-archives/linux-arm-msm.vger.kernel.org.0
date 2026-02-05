Return-Path: <linux-arm-msm+bounces-91854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHRkGm4DhGmHwwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 03:41:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E178BEE080
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 03:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76E1E3015D25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 02:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A662BFC7B;
	Thu,  5 Feb 2026 02:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pz1sCE81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnXrJqBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567BB2BEC43
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 02:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770259294; cv=none; b=o7a5XTmJwT03ZNiXvhkLZjyklPIT4tCGIUJhBBnDDLfVhi4j8xobDObmvr2yJeLz5zZ1o3OR8HaS1o+VOaVC+hRTcs9xFekSwclByANQg3oTk88lisoxAXa1KL2BScuAuZ1VHGpU0kuN5Dds9C8oMJnpND/FAKDtNcTT9oiAJP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770259294; c=relaxed/simple;
	bh=Kbo7luFxwtTyBTiWCJlgiehQe/5IfDIyDdXs4UMfIZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0qyaEWh5uBx8SWPYGujwO5CNkD2it8LQ68LayB5CoaNCkLePEt10WMGULErJjgajLdqVBbj3hEZepmKfTJ+S+o/n6H64O3Nw2ewtE4sIuLrCFdckO6ncISHPgobLKRyAVmGrXQ2S+N9FT2BrvV02/eUh0WXPkL/9g3UCfNRSOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pz1sCE81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnXrJqBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6150Y1Mq1705289
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 02:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5/HbRMCeosrCYvwHki4QN0ocMs53vnaYeHSS39PEV0=; b=pz1sCE81UabhFz+h
	puqXjVt7inM8butUpqT8Y1BY6bCO2uqfsVyqi8nl72F+n3utER3aLQu8pDxTLItB
	zjEE88wVHDYHdjmZN3Q7SQjHW/ZF6H+n4INHau1hCSm7qrGM8X9rbg7nRM5/WyYX
	cslMY/ztm7uQcx3jOtZVKFk9e+xehn/uSpoV6OL6Y0DUraQTPk175G7RwNbKAHcb
	7GLH0jFmHOThAdCj9OYjIINJTh+HWSzPQ+G62kzanCAI9A9E4B+P/RtvOJAaFHKp
	S6P8eOWh2bzfCsJU4CXm2CFuT/lHUHd6bpic3/JpR3k7/eKZpoKR48CgZ/79AxnP
	Gnh/7g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjjnp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 02:41:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124ac76ea5bso4092637c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770259292; x=1770864092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5/HbRMCeosrCYvwHki4QN0ocMs53vnaYeHSS39PEV0=;
        b=AnXrJqBERG21BRDJGQZM7LeB6t0ZgFPmpQYNNhi2Rw5HcDD6zjO29lYvC7FLHAlai3
         gPd3QGrIQoFaCfECfjIKskE6JiqcGUVdWrGoKE+fXQAm29Btv74NVmfEQsgFb4enBIeM
         eLPp1DV/OhXGoaK8Y7X7wxs3G8hhc88Ia8wRWbpultaPPb33Xu3tdn7O44nZ3YBGPhju
         2QvCiMZk2Dyq/+EOyrrSueIaqzq/dra8hK0UJVVKcy8JeM5gWkK2Fd3MHqK85tWo5UFN
         P42svU7obtKHsjUM6cUqL9LknaTwwVLpw1agFap9O/epmFLMsWWtdPd1mA+Gl/t3/Tvb
         2mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770259292; x=1770864092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5/HbRMCeosrCYvwHki4QN0ocMs53vnaYeHSS39PEV0=;
        b=IiRGinJwkX1q4kKUPDtqtTPUA8xEDeUb+vQqhnX7sY08X41IteplSvm+vumviUAH9a
         1ymIdb4vGMDnpM8/VuLhIPP4H86Qd8iqTqTBhtTm2Rh11Z8HjQifSOCVJi/DBBr8x42c
         TNOhdDXdPyigz7+5hcJZ/4wxHm3NdoMIf/UTwi6U1WSrF4jGHvLRgHgls56xoGGgO01q
         HlQX4sbArAQnfjUhor7O168+Ov2LI2ytJdCkyWZZGBwQBWlzxnSeKKB0E7I5nYl36s6L
         QDracnvv5FHsS4mBbkHmnG23YIYvFRhv1svAwSvXXp/Zkx5n0rdN3xrJv6AvlVcDFyrp
         OBmw==
X-Gm-Message-State: AOJu0YxZeNDray1g1OuX1X+R/HIOez6R1vFH7wsWoHnot7YeRJsfyD68
	9/ZtvBKAAiS6yCqRg9SRm8pwgfYlORR4hCANvgm3GKRY1OvVhFtMhxMPDhtuaBtWz3UeHyU/SHs
	qwXkILze54ibRAlHsNI7K4uQrxzEdc60i5s6pd9mWwhx4WtwVQGtDSPmcAV8hLO6fx91O
X-Gm-Gg: AZuq6aJ3G+0k1XhUfIrYvdeV/LzCF4Q3lcYFt6NpeO3UVZ4Z9sxvlRtiIhVZ7yJkxfR
	a0Ec9w4/b4FXaMfoNliEVFj5MD2UjNkHchvjL1WjHaHQhps/Vrg4HT3VAEQUomrzTFSOvFesVa3
	PHwhsHDFk7ADzu+5pXrtmgaJCSYwT5EbU3oisBtFDF7Q+iyCiQMW2kOATNkGt3nZ+5UqFBCFKmQ
	mATWnjcZzj39p/cuBLTUEqME0BduNgK0pLQvbqKqTKFHzP6/GIHkZfuU5amm0s4rj1PpIO4lhXe
	hbeCbAhEBAzgGOnyxGXHhrTrr05cQxqOBH8C6Iro2i1+SAo4hvkd5L1ZdjmZJ+wmai1jtGZX6bo
	EmdUEb+c7zbNMIKTuNTEc7dc9RYNGcw3hlVF6dFefs95EqRrQL1WTIkAFGDQKvg==
X-Received: by 2002:a05:7022:6711:b0:11b:bf3f:5208 with SMTP id a92af1059eb24-126f4771f15mr2189791c88.1.1770259292108;
        Wed, 04 Feb 2026 18:41:32 -0800 (PST)
X-Received: by 2002:a05:7022:6711:b0:11b:bf3f:5208 with SMTP id a92af1059eb24-126f4771f15mr2189778c88.1.1770259291490;
        Wed, 04 Feb 2026 18:41:31 -0800 (PST)
Received: from [10.110.59.69] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e0f98asm3538260c88.5.2026.02.04.18.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 18:41:31 -0800 (PST)
Message-ID: <9cb24a53-2077-4862-8872-db386a7e1742@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 10:41:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, weiden@qti.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260122053624.4068718-1-wei.zhang@oss.qualcomm.com>
Content-Language: en-US
From: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
In-Reply-To: <20260122053624.4068718-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=6984035d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=tegrCIUBQuEar7wNNIIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JRAvnRdQfitR7Hnp55IzUHrSrLyNpS3Z
X-Proofpoint-ORIG-GUID: JRAvnRdQfitR7Hnp55IzUHrSrLyNpS3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDAxNiBTYWx0ZWRfXxzy562rz/0xD
 4bwSvPRM2BXvswIvPCtKj+s7r9hKRt1M7/J33Hrmi2ngia5PiKx01M3ocTj7rbN0qDm4qDE5gTF
 lOy+S/U5DscmWJEsLPFi2YV0GFzhlTz/HtuGUYs0RCbYG+Lyx7TO78KMvUlqj2h2r0wCjnXKyi4
 /CBzH3n0TlsyXwcsvkPWMliMFoN12S4nvvOk9VmiiQeupKGuExJt1yqvBU7XlBo1t9V+Sro5Mls
 k86BY6x5iaBgVsJzED41vnurm6XjqpMea3KnMmBlVcEvfDTGBnmzd5fuXDXKYdlXUJUJAZ+s/5o
 lxD8/ETOoBLIx5uC9P+SGzC+3BDhzVmse3GQzZ/hp+LcBpbzzdItO/sTSnOFVhUzJ8jCYepm3r+
 iaZl5xdvYO3rsQB+gBoDvPAUrsW/biVt+A8AdYArMkrsxyMXI79RdD/UDLixZB4KMYIY9Sn1KGG
 4506bGVaKbtHOdns6Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_08,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91854-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E178BEE080
X-Rspamd-Action: no action

Hi ,

I’m writing to follow up on my patch which was sent on 1/22/2026.
It hasn’t received feedback yet, so I just wanted to check whether there 
are any comments or changes you would like me to address.

Thanks a lot for your time and review.

Best regards,
Stone

On 1/22/2026 1:36 PM, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
>
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
>
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---
> This patch depends on:
> - PCIe
> https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.qualcomm.com/
>
> Changes in v9:
> - Refine and add precise descriptions of the WLAN voltage rails
> - Link to v8: https://lore.kernel.org/all/20260120070650.3192679-1-wei.zhang@oss.qualcomm.com/
>
> Changes in v8:
> - Reordered regulator nodes to maintain alphabetical consistency (Dmitry)
> - Link to v7: https://lore.kernel.org/all/20260119090758.2780678-1-wei.zhang@oss.qualcomm.com/
>
> Changes in v7:
> - Align regulator node names to match the existing naming style in the dts (Dmitry)
> - Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei.zhang@oss.qualcomm.com/
>
> Changes in v6:
> - Rebase patches
> - Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
> - Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
>
> Changes in v5:
> - Rebase patches
> - Flip the order of property-n and property-names (Konrad)
> - Flip the order of bias and output property (Konrad)
> - Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/
>
> Changes in v4:
> - Rename the symbol pcieport0 to pcie0_port0 (Konrad)
> - Adjust the property order in node pcie0_port0 (Konrad)
> - Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
> - Specify the calibration data using the correct variant (Dmitry)
> - Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/
>
> Changes in v3:
> - Complete the nodes property definitions according to DTS binding requirements (Bjorn)
> - Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/
>
> Changes in v2:
> - Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
> - Provide regulator-min/max-microvolt to the regulators (Konrad)
> - Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
> ---
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 130 ++++++++++++++++++++++
>   1 file changed, 130 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 68691f7b5f94..f8f021cfdf21 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -24,6 +24,50 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	vreg_conn_1p05: regulator-conn-1p05 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p05";
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1050000>;
> +		vin-supply = <&vreg_conn_1p8>;
> +	};
> +
> +	vreg_conn_1p35: regulator-conn-1p35 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p35";
> +		regulator-min-microvolt = <1350000>;
> +		regulator-max-microvolt = <1350000>;
> +		vin-supply = <&vreg_conn_1p8>;
> +	};
> +
> +	vreg_conn_1p8: regulator-conn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_conn_1p95: regulator-conn-1p95 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p95";
> +		regulator-min-microvolt = <1950000>;
> +		regulator-max-microvolt = <1950000>;
> +		vin-supply = <&vreg_conn_1p8>;
> +	};
> +
> +	vreg_conn_pa: regulator-conn-pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
>   	regulator-usb2-vbus {
>   		compatible = "regulator-fixed";
>   		regulator-name = "USB2_VBUS";
> @@ -33,6 +77,69 @@ regulator-usb2-vbus {
>   		enable-active-high;
>   		regulator-always-on;
>   	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_conn_1p8>;
> +		vddpmu-supply = <&vreg_conn_pa>;
> +		vddpmumx-supply = <&vreg_conn_1p8>;
> +		vddpmucx-supply = <&vreg_conn_pa>;
> +		/* WLAN rails: 1.05/1.35/1.95V (nominal 0.95/1.30/1.90V) */
> +		vddrfa0p95-supply = <&vreg_conn_1p05>;
> +		vddrfa1p3-supply = <&vreg_conn_1p35>;
> +		vddrfa1p9-supply = <&vreg_conn_1p95>;
> +		vddpcie1p3-supply = <&vreg_conn_1p35>;
> +		vddpcie1p9-supply = <&vreg_conn_1p95>;
> +
> +		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p7: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p7";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>   };
>   
>   &apps_rsc {
> @@ -327,6 +434,23 @@ &pcie0 {
>   &pcieport0 {
>   	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>   	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +
> +		qcom,calibration-variant = "QC_QCS8300_Ride";
> +	};
>   };
>   
>   &pcie0_phy {
> @@ -461,6 +585,12 @@ perst-pins {
>   			bias-pull-down;
>   		};
>   	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>   };
>   
>   &uart7 {
>
> base-commit: cf38b2340c0e60ef695b7137440a4d187ed49c88
> prerequisite-patch-id: 0e8aad7b8514142fb33c17829386f17c3a55127a
> prerequisite-patch-id: e641f09d4139ac77c34757bd08af2db746de3963
> prerequisite-patch-id: 4d16e87cf6213d6e25b2c40e2753d4e629778d53
> prerequisite-patch-id: 40187dae2c9518a10866104b9fcd5a481ac67d51
> prerequisite-patch-id: dd3bdf2aebda74f3603aff24a2c9aaa7f4fd6763

