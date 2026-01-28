Return-Path: <linux-arm-msm+bounces-90996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO7dFbH4eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:53:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F22A0E0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33B3D302E92C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC81E34BA20;
	Wed, 28 Jan 2026 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvhdreS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yj5vh4G0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB5E2D9ECB
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601143; cv=none; b=GHKxhWlU/FiNlm1l9c8h9av9Y40QAF8t1oAFn21m6cMeetYwZl9gmz/EzedTfOk2HJ/TpfA2FjLo+s9qR1xNV3g2sUPQ7sNktfNzriC2INZJCcM+6NR0Zig1A3z0DHq8Ls387/LyjdjSpSUG8Drz1Il46611JQ9KDLtHP0aXM5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601143; c=relaxed/simple;
	bh=8zlMQ2jArJaTXK+RpBQZByBD4YvxrP2KKFaqI56dpcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHut50fIv9o0SiZVEIRQNNcuwsFdkxo6Pf7P7MBE2mXRCBRqaD/h2aJPPLay9AWhtRKAJO0JTeTNOS29Z3HzO5LFiZ5oOv84FhKsE5zaA4VDpRZZolZMAnhB8m4F6S77S/5D0zxN7DtYTIpDbEruS1KY9YnEsTOgTludMD2SXEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvhdreS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yj5vh4G0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91u3p3879263
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhscgzuAVSEBkQDVAEe7phBxToampWZjS3PZFnVNOQo=; b=jvhdreS8t1moXxk2
	12zBrsQOFnhGd5T0aRSVJTUhakvpqZwl6sJ9IouYpvsLMAXTYB7DPMwrHXZbHHZV
	Wm65QN0P1bjc54YcdnPDLqcQiQWb9fmYQMR0GtNTQLzFL+Fp8KBhhUWOVMiE8g/e
	dhn/tVXrQnHwh0VJBz40VEEAn0/Je6XpHCt5RESgqztXJlknr+rFTwgygnzQEnTN
	V6Uoi2JxIHrfRbN+xx0dFflU9pk9j6kk6EtUNYPthJUgTbvcRoRnRQRI3TTiCLMd
	oTr2Dooc/IpZjhpI9ZsukK4tU/JK+iY7rcoMTB9TqNE0lskD0ikK2N1AeOraIPLP
	m9a0BA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv1a5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:52:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso15554885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769601141; x=1770205941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhscgzuAVSEBkQDVAEe7phBxToampWZjS3PZFnVNOQo=;
        b=Yj5vh4G0+qS4NYyjqv+uMuGVtvtkXhsKIc0VxuG7dGvAJnVI+vKAVFg/ZkM7QsX4bP
         uX4K/l13eu34VkqsarzsrvMOCZHpdyNeoiFkcm5vLTBAsfg+mDz0Q6Wsns0wpqkt2L5G
         uI4OjAykpBtWfWmE5DJVmP56Qo2VDdOcBX+GMoJULrVt70ik+4JwZqkob4xjolv010/A
         cg34S0NZ2PlXsozmBl/A0kQPRCJXtJ1lWteiVg9KWKVk0UgWtNeHlmqmHk9zeuNWd6j9
         DIBW2+dzROx2Y193dSAn1gAa3d3haPtb4Pza5zEUyvR+JlNPr8jT8cz3elXGfQFh+dJ8
         mpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769601141; x=1770205941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhscgzuAVSEBkQDVAEe7phBxToampWZjS3PZFnVNOQo=;
        b=TxQPIDAka4t93+VijQIfMdSYnWZ4ZEbRoE/guEopnwLtxiINbFyWaPpzhXWtsULEQs
         hNM6PaovqCjjinPwvuWh1ectaR/QdtyrZFITJzOwQOmQB4WvigjKqVZe013i/2R+Xdw/
         WLCAWz+RzEkHad04y1LYwCz0ZbmLbvPBOip+D7OhM8M7ckOG9lFLeWeci44IYv3Eta0H
         dNR/300r0+Pzm43h0SUSXkxXzElTPiXKI61bU7tD+yt4EJZk0LqheIuQDLxWuQ+L0bQj
         f84QmUIi5YVNgCGEXMhjSsgrPxh1nQLCQKFJaqUuRCwz3m0XnMt6EGkWVevzALIyZ9TZ
         ipOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7eqDv4U3YMSc9WUlQIqrRWNSgwMCUyJeB22j2r9Rp3N8SoKrxspjmNNHEftpHEBhsqLmas7vg5fknSDAR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3YV27OoWENRy6IQft/OebHaafrP/qIdqzl+hkeiMcosT9SuRu
	lxM1B0JF2nyIwhAkRY++T2Sv86H9oN3abotlpm4ySSSQS8MEjxUCAEtzaI8a/TTPyRn+3/mvISR
	2Qsgux4f/m4OjUVQV93W6KFO1+6j7o+dBwkhNd6bjKA6AIu//JJ2Mbz3dZTgBibUjPYdA
X-Gm-Gg: AZuq6aLF/u6EC1lJVVaxLwf9uUtX8rA9uIJ37o3sKThzpo5OF/ea3BN8KDeVOVdMvuX
	ZuJMZuLVLerKsXtRqlOl9Fom2ioucqvMvINwh1znOa1Ga7uDKQRCP6AG56r/plafPbEkFZzCO1f
	fqZWXGmKh6gUa+nJ7sCuegBbivGj6pX1X2bNFrpEvlKPtRVDD9xxeVjilsAYUXv3/WdGixtk2vV
	1CQkNxJE273jFCEiJpHIpDKJGZi9YSQEtpu4IK3P7MXkOoW6hUcftAIfymDWvxfVDmXFkSSHe2d
	nAz4HdJfdpfLC657dri5YhxQ0NCoXtX1ACUU/w6F6zIGK+9t/QfrOaRyKaFVF7YGWDT/VsSNqEX
	EOMk5kJQSyW3/Uph5bMxPlKgjTGBsmhlWaQGlMJkGbLB+t9o2M8Q+8mFCejqfOV1+5EM=
X-Received: by 2002:a05:620a:2904:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c714a67607mr127482785a.0.1769601140635;
        Wed, 28 Jan 2026 03:52:20 -0800 (PST)
X-Received: by 2002:a05:620a:2904:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c714a67607mr127479785a.0.1769601139956;
        Wed, 28 Jan 2026 03:52:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc8f96sm121649366b.25.2026.01.28.03.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:52:19 -0800 (PST)
Message-ID: <6754527b-d562-490c-be8c-4130b0d7b1b2@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:52:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] arm64: dts: qcom: kaanapali: Add support for MM
 clock controllers for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
 <20260127-knp-dts-misc-v4-9-02723207a450@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-9-02723207a450@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Uv3fgFHGh-_01MpFV3Do9Ryi76R6aJEL
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979f875 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1wcADfOFAc6XBC1J6XAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX8ISn5QcJg+s+
 dhcY7fy82KXe+ApCdiNWSHbRz58PU5LrEWXtZD6p1jVPZymDAxvBYB8AnWQuL0X8t4HtsEnm9re
 EqLVuUNs9YK+HkiciBg0sRmc6T1+85IjzTSFsKtrzCegEB9/2TRuDS2XRgdLSROm+7pRC7UoBAy
 oWu7E6mkOZtpZkzyiXLcTkO8WJtKOl5WeKRmCg4M0VPhlZ5aODqCdtdj4DdoHQXW59Ud4xqM+vA
 6e4lxVC8kPTOuQNNpSuCcOP5UuHjywgeft8vRUhxzUfEp1sS6bgJy2E211u4xOiYZyw6tUOlRc+
 J4UKe6B/OIZUACEsydBG5wlPRFRXIMN/pTOaRx1BPvs0D9spVW5tpsFkDhTYySgIJv9ZpMlKb+P
 GRjr56Wz+0vXurSu7FbsrtbonPvrdvkHdPcXeP0v/W8FCQZ30I5cEyiPAx0RH94MNf/HcxhF0Nb
 I7YcaEr9zT+3uhNrddg==
X-Proofpoint-ORIG-GUID: Uv3fgFHGh-_01MpFV3Do9Ryi76R6aJEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90996-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,16e0000:email,0.26.219.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03F22A0E0D
X-Rspamd-Action: no action

On 1/27/26 9:34 AM, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, dispcc, videocc, gpucc and gxclkctl).
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 111 ++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 050d47691f5c..53e159a58768 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3,7 +3,13 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> +#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
>  #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
> +#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1557,6 +1563,24 @@ aggre_noc: interconnect@16e0000 {
>  				 <&rpmhcc RPMH_IPA_CLK>;
>  		};
>  
> +		cambistmclkcc: clock-controller@1760000 {
> +			compatible = "qcom,kaanapali-cambistmclkcc";
> +			reg = <0x0 0x01760000 0x0 0x6000>;

This should have len=0x8000 (its full reserved length), the current
size clips some trailing registers

lgtm otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

