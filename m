Return-Path: <linux-arm-msm+bounces-107078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF5fINoPA2qX0AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:32:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D451F61D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2D1330480FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D6942982D;
	Tue, 12 May 2026 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZtFxzDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkDFx+Nt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B2368D67
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585333; cv=none; b=jdOHr+1Glr5yZEQKTYcnWJ38YVPfqqpfkUljt6h8lcQZ/GjhNOpuPTwefmOQSDe9MY5c6QyM2PkdE/piGPueJnkGbRE2I5QaHv9LN+7n1q115wKl7ZGBJQJACzQUy0NyOSACkSa2R7+klIQN7d+AqvQRRI4hGpWHw+JJHd0TJAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585333; c=relaxed/simple;
	bh=L+4cMMv5ZsgrYT9SZWw9YF1uSZAITcwm777swf+z40c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdvGfbUGmKBGZPXhGUgcUj8ZKzqAFsiTb71aWntGDZ5KJs1q3J4v2wlE808Rcco8T2LQD8nNcZLKo9hGeXMrtVvAGjchK4d0k7GlY0ibkdf0/K+pLGkzPQIQWeC8gKZ9G6Zpz8XgjG4D5+BshAHIewQ8osKsZ0zviKmo8WiTSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZtFxzDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkDFx+Nt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkeY2740506
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=; b=BZtFxzDjHiMJjqEf
	avHqHCdu26W+iIarGuad11yGm4CzCkY8xAGZU3LZCnm/Qpvck7sjEbXsC+QXmdW9
	De43p5fr3LghZIbY0+6NdERvy0FOq7fk9bHUTu/eLm1aFkPkXxfv6JlM8aSOGXFb
	xcaW1gUPdnqDq9nWaKG6xnsP16gBu3Ns55eDpL6KAlqlPOjLDUsXUI7TD02t2hCK
	VCqazRR/MuJvH6+o7DG38ishsOG2flCqjZdUzHrRh5yjDMfgvTfKOWkthgpyGRkC
	mvcC35YSIFcj8qPgFXkWHgx/t6R8srmQMRU8SXeSsoYygQu2bVBUyTcHcj8Tjo6U
	LIV+0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhr6xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:28:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e576143baso13684401cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778585330; x=1779190130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=;
        b=LkDFx+NtGXW4S1egJeUYVj7dY8UM5TlpKYKRNTx5n2uCst2QKfMJOe6Z+156/qBtVj
         VRVS4Ex0qPNOhkPg3gMBhyio6NV/PDlz3QuRZwIuJ6ceBCD4E2AM0zCLX0MwJUwEZI5O
         6+k4d8WbIdbckFA7cs4apeilNPcPdUYCD0kg9T7l1k0pP0D67N+95ed+rnX4PuXwwlhx
         2AQGFH73GR/TYCdtdwinAnILMfgqLs0KaDj69dsG9yx/VK0Ikgu28JVaFNEKmXsvli90
         ENNVoeq5ohmkc2C+yb4OgySzbKVjCdTRCkVzoJgUWb3qSsWXFrIA48Eir+uZalt7bsB2
         EOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778585330; x=1779190130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=;
        b=A0f4Fz+s21U1GgIaLkiEvvA16jRsHuABvnqA0Ol+RTW0WjbNgo5MW8WKzo2x0IJqns
         yDyQKQgF3/4h2N5ZdxYvEbKhKDhoHShTWS6VAfeiVYTQbC7SC98ebfACGHkzIKa+mxfw
         mVis7s0laFWzzW8zebOG2l6u7zB7eDVZHDpKOq67Ka9GYD1IQ86BYJuYrtc6EvrgtA5D
         L/sf766wY0HoCxBuA1SjilcN557YlMkT9LV7Mkde5mE1PVoavMdtfe2ZHPbkTwu14wWy
         ayNzd40ibIHMfrh1Vom0Avye3EfAHaQj82yRbj9sFBrWlMI79rTzLtPUTJGiTq3RMOR4
         mysQ==
X-Gm-Message-State: AOJu0YyiDoZExgcgg9a2RMWXzsPoqNPA8tdtDzCjSfX0EpzmRRPlm829
	1CDE8Ia2zec1+HWCi9bA10P7Bv69wW6asHvWZUT3I6rz6FhaHBb34+SRuCtx/Xfp3KgjR+MZI6Z
	jtz5a2AlB/V6BmKaTUeP0/PkVq/TKtp8KjDSVSZJW8NCAOcRaQAixzg797GU3uzOocPL9
X-Gm-Gg: Acq92OEFhg7u/IueU0YfFPHS601MqCdErkg13bexih6GRwBGRSaxG9Iw/jpUROSh7zs
	Fru4mBmMlIeZIIPu1EGPtCFseI2GsXT+Ko1kzHhI/1NA0IN58wx7etBb0+Erxahh520V2f2nTUR
	u+y2VT5dt0MJuj4FdJyN/93U9UloX6UR8xshouU9jW7WAG9RnqC+gJEaCqa2ad3dlT/QwEcLKGz
	GPlQm41hkL6Ziwyrg2dUyiYvTmZmuccv+fAi9WvDhpbZV007kPo1NM3tO05CSNPrxJZOHyF4uCH
	lroipNPIEGAPtXGhqrsCN3JdoYN9GEjtlAg1PTeUIfB9K4IWcC/Z6tCZskjn8xeRMKGMnKphaFL
	wVX6PNJAUaIFM6Zaj+FaIg0bGHE/cVPPiujD8dhHMnT5v+GksbDvWulc3SUaHP+VLQ/3ExBLAgw
	ol1yg=
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr274543481cf.0.1778585329567;
        Tue, 12 May 2026 04:28:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr274543201cf.0.1778585329135;
        Tue, 12 May 2026 04:28:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3bb2asm4776531a12.6.2026.05.12.04.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:28:47 -0700 (PDT)
Message-ID: <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDExOCBTYWx0ZWRfX9Xbp/Nd7TGlu
 kwnqQH/ZKo9vxKtBkUbIPZCKy26I9NYl75RcdoCQjKI8BrhKjenIv2sxl77cpwUpHvkSdDN32yg
 4Wc4Gb4/u/AEkvPCsTqaE21/HTwVciXMvZ5Z1PcnPGgGNpGHnoylEB+3zxCy1eMCKIxIeX9eG3W
 sLcF/odK+JC0bZGpuFFe6PipFBvnkzC8CHaOd7QsJ9AupHavwEASVHOGfHwiFuebMzmYOPYahoL
 nmADRgOOf7nIUn9s66lmilh8a50Ka38GpsOs2DWRYJejGyRNLPyEXDW/okk7aRCwyuV5z90+FQI
 Eb7Aj9seWPkvOX5a79QbZBeEVWjl3zPog14kq1ZmXFtiVglPm78N3ciG2DhhdvPQ7ME8TgCIps3
 BgpHX8DZ2MeQQ80tXoUpqukufKnZaFYi9XMRfKb2gmx2HRJhgdZdQY67kTqs9+SgvlxSrgCd2CF
 exIqLxkS2QKtXQTXXlw==
X-Proofpoint-GUID: qV7DH63kO_W5rmRldfBijRpNZB8_szeI
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a030ef2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LELUAEsiHl5uogXv60kA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qV7DH63kO_W5rmRldfBijRpNZB8_szeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120118
X-Rspamd-Queue-Id: 2C5D451F61D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107078-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/5/26 2:23 PM, Umang Chheda wrote:
> Add AEST RAS error source nodes for the Monaco SoC.
> 
> The DT describes a processor error source covering all CPU cores and a
> shared L3 cache error source for the cluster. These nodes model the
> hardware error reporting blocks and associated interrupts as required
> by the Arm AEST specification.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 7b1d57460f1e..8e43ceed7d84 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/arm/aest.h>
>  #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -29,6 +30,46 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aest {
> +		compatible = "arm,aest";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

These 3 properties aren't necessary if none of the subnodes have a
'reg' property

Konrad

