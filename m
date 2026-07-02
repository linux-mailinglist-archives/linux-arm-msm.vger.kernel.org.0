Return-Path: <linux-arm-msm+bounces-115921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DaPuDFpBRmqiMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:45:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F06F61EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:45:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c8Nx3JNU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VvMIM05t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115921-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115921-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF257326091B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4403D813A;
	Thu,  2 Jul 2026 09:54:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA61647ECF8
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:54:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986099; cv=none; b=F39NqXIbeQ3SnA8IcNZcOPnZregj7SR4ZRvFJF+mJKJ5to93a1+7+t6iRkCV/ZN4X5K96tgx243+6yU4mfvfTBko+Wfk6ra8pXiI/TuAs84uX/Q6ePSRfpGOC0pzs0XJ5webbA8EOX9fDEUBS2a9ioBtBtOVIVFrPra1aBUh+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986099; c=relaxed/simple;
	bh=9+mJfEnVorck3wjjVgsHy0HRFt4p7NG0puSJtIQtINI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EkB7ymfK0SZQJtRW5bh9RXlDvT4yfTbypsIPKYiJyiMqTuMLp3pjLPJdY7JT+sfAEIZgChzjrbUgqPm0TvdD2e9frRrm3IUpe/rx3D/1Wl3ThGJKqrRMaV0csy/GQxf8e7QFWx/47RuhL+d+JR6KYH/X0nUwotnva1R9r0XJPm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8Nx3JNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvMIM05t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KfOw4115963
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dYmKx8C4KL+AfADa68PgM8oiVSYr3E5AIIZlvJogQIA=; b=c8Nx3JNUwFLZzGF0
	AyMuXjXDhht9hEwU/DgXjgh2AMlxEMerL2yHcLjBqpBM8L3grbG9LWoDV56dl8Rc
	ESc2sdljK4/nBv65Wb+RCmTBndayvaUx7gsqiTa4I653Xjh8nZ4BsjQoU0sjXCef
	hBA+INt09UdXKNkzK1/4UurgrQqy4AiCu7cehBMYJZ259SodFpldboH0fnFNWWqX
	Qn8+jBp6oIto+LJ4yArtuCX85ELR6edDjd+AsTzEzyZ4CVDxCStLq1Hcvt/B2hdl
	gDIPYYLoq9gbzFPlAJugY8LsQi/oSn/tfClhk6ghKJ8Zw3q/K8DKg3AH96MUvr9Y
	2luicg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n94045v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:54:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9b71388fbso34475635ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986096; x=1783590896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYmKx8C4KL+AfADa68PgM8oiVSYr3E5AIIZlvJogQIA=;
        b=VvMIM05tDqhdQ8E9Grs4vmGF4jFeb26QR8oFhceYK05zcXgDgYReHIuMTDXzlWPUX2
         Kntp+FC9me7xkyQuR2OoyWyoLo4DGrc4/Q/VWBrtMhuzx2CMOiAEpl1i6FsnSU4rne1P
         UDbShO3M1OgwFpa1QjpBvPe2nFRy1v8sSPRqCaAM4b2xT6okWUy6F2QcVhJ30ogXz12o
         BZmd2ejjt7bKxB/RymBGPcy/gdx3dBXR9EJJhVXqil1rRLUmvglAVftCxkhGJWnu7f6e
         Xf/+xpswXCdGbNVfVi+pI1E+yx4Cd64mmmXIDQHNseZAwaAY3NcPfafw0z2izosoBRlL
         dEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986096; x=1783590896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYmKx8C4KL+AfADa68PgM8oiVSYr3E5AIIZlvJogQIA=;
        b=rqxLUxyPSZS7wXiA/zYvJ31qfV1s8gU9tvpz6ssq+te1XSnbn2z8tVxNMNROWHh9a6
         IB/NwriK80l2lF3bTnuPzxAOsntv9pIUqvrZVFoxu4v4IJ0XWVLpwwjMZ4SRjtw2aHyR
         Mniqw5/aQ7LjSD4/RYrYQ8R6GxpzrW+9I1mmTyKL9v7iEbmkQwvZzssw3fTxu7bg1QTG
         +kC9Yic3jEHN1j1JKhpZGhjJcxypQOk54Uvicpynhc+NtZGtamOHt8w7wZ0f8U/k9oIL
         5Or0WbEad8/TSwetUX9m1KZHVY+LDs4P9ojUQbGRhg6Vh4aqLYDXBbccv7d9vULzBeAD
         V3hQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqk1gz5kx+XzyzrcazaPZk1bI/3A69uPqqQWcuLfVwyLmgAAe0XnrYV0+RdvyVV6tpxM5z/bEgzkyc+xf0l@vger.kernel.org
X-Gm-Message-State: AOJu0YzVvdoGPLK1BqIotoxuulWwhZBNVCJtU4wEiBVWWc+8/FrkB7Ps
	IMhmSg41gtl8MzFA4AchEP1h/O6hXuz3FzM+0zsYCYZH2D94bA+C36PpABGwdo/w+0iziqJ/XGq
	8FKtYeoCDfCWYZUnZPUbVh9tHK+ZZQS+JSK4YfkAukRgjxd5AfkRseK8sKtctfqJL/vtb
X-Gm-Gg: AfdE7ck4Km6bhLdDCZkouTjBvUVPPtYknxmHnffdlKlsz7I9O/QXSfDr1qo2XN+9KMr
	Ax+dppW5jjc9CxJYtI0XwuUBo+a6ws6sKUsvxi3+VFrTT4/3Lj+Ho/37erw7g2/7OCi2vuV93yb
	6MEaoQS1tzY0a10XiBOb0GkAbcNyf6Gs9KEI2LPvdgUXWsVc7b2PEE6r5t4Y/nEroLA/p7yiEzy
	kr+9ow3xS9tazV/XUEyu0Y//8ULYDCPL9S9RyLEdOD6G2pwnkE/LP+dPmmFcHVlYRiWbSEum88N
	UDKMZ1wo5SKNuXwH59G+OlBAFfQGgRK9CQNSWixpjpfuEbeS7/pPaCVTfV3g33nw8wkkNwszmbA
	xwGnyFHhHztk42fiJOBDwSAuIfqbTxrSA5oQtmhs3
X-Received: by 2002:a17:902:da89:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2ca7e6b3396mr57806275ad.16.1782986096246;
        Thu, 02 Jul 2026 02:54:56 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2ca7e6b3396mr57806025ad.16.1782986095672;
        Thu, 02 Jul 2026 02:54:55 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.29.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8dadbbsm11149905ad.3.2026.07.02.02.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:54:55 -0700 (PDT)
Message-ID: <751ca9d2-a264-4533-98ba-7b7b9d489fe4@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:24:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin
 <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
 <6a1fdadb-6a52-427c-b65d-70dbe80ccacc@oss.qualcomm.com>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <6a1fdadb-6a52-427c-b65d-70dbe80ccacc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMiBTYWx0ZWRfX5nycCJpXaDPp
 Wh64+eaAeP5XYYHCu7UaR5AR8xBMKDCsa6d/LQMMJC/Qpmf29ssKuN+hKYG4ROKVt6NHgZm/yEQ
 BGVrwSmI2yXSVZyi//q5HkGMeuDpMdrMLQhczad5AttYGxwME5H97rZ2qvav3aPS+HeC+HG0PeS
 Vu2A5iDJvLxtqU9n3FHumAT8tT3tblrX9auKPsu3eiyu3k/iHUy7tVXDoLid6xfgfmLi/A3Xeth
 EUZIzjX7ldcPJUk7N/J6cxO0O9mUrapQXfG+bibT9T/hDDwO+WK+liSysl85lm3W1QoJhpR+2mf
 ZCUSt+HUEN48UKtBvybBrQR8fUPEkcknc9JwzMa+ud3WhzXilLbauE6A3ezgQ/jmwbFUqC9durv
 FIGuU3Qd2xS4VVBMqgGMtPEgN8vqNHg2h2IsWGkdAK9qCvKlYItJnYGV//FHuaE2FvP1LghybSx
 jstWl5rXs+hhHyp8Q6g==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a463570 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=1qKOYMtCOh3zOq8T1Y2cZw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UCYWkEfTB1DHydHpn7IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: lUh8frIzxCLl7Eq3uwzb1kkOjS0Vyjfz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMiBTYWx0ZWRfX7Dceggfe+CSu
 1vsxB/MIxYi5y574K0UzYWom3i1R3vipe6fbWIEnNUZyEDVyWI9Fk7yx+PfrMoN2f41XymKgTj7
 MOwltuRRz0Q+Cy35tINkNdYxDcqiUcw=
X-Proofpoint-GUID: lUh8frIzxCLl7Eq3uwzb1kkOjS0Vyjfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115921-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 944F06F61EE



On 6/11/2026 2:34 PM, Konrad Dybcio wrote:
> On 6/10/26 1:15 PM, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Add support for SD card on Glymur SoC and enable the required pinctrl
>> configurations.
>>
>> Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
>> Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
> 
> Firstname Lastname?

The mentioned name was the preferred full name of the co-developer.

> 
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 20b49af7298e..0989fe39e7ef 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -3927,6 +3927,57 @@ lpass_ag_noc: interconnect@7e40000 {
>>  			#interconnect-cells = <2>;
>>  		};
>>  
>> +		sdhc_2: mmc@8804000 {
>> +			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
>> +
>> +			reg = <0x0 0x08804000 0x0 0x1000>;
> 
> nit: Let's drop the \n above

ACK, corrected in v2: https://lore.kernel.org/all/20260702094056.3755467-1-mchunara@oss.qualcomm.com/

>> +
>> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hc_irq",
>> +					  "pwr_irq";
>> +
>> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
>> +				 <&gcc GCC_SDCC2_APPS_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "xo";
>> +
>> +			iommus = <&apps_smmu 0xd00 0>;
> 
> '0x0' for the second value as it's a mask, please
> 

ACK, corrected in v2.

>> +			qcom,dll-config = <0x0007442c>;
>> +			qcom,ddr-config = <0x80040868>;
>> +
>> +			power-domains = <&rpmhpd RPMHPD_CX>;
>> +			operating-points-v2 = <&sdhc2_opp_table>;
>> +
>> +			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "sdhc-ddr",
>> +					     "cpu-sdhc";
>> +
>> +			bus-width = <4>;
>> +			dma-coherent;
>> +
>> +			status = "disabled";
>> +
>> +			sdhc2_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-100000000 {
>> +					opp-hz = /bits/ 64 <100000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
> 
> The SDC doc says this should be 50 MHz> +

Frequencies below 100 MHz would be taken care off by the 100 MHz opp 
entry.

>> +				opp-202000000 {
>> +					opp-hz = /bits/ 64 <202000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
> 
> And that this should be opp_nom
> 
> But the clock plan doc has info that corresponds with the content of
> your patch, please check which one is correct and file a request for
> fixing the wrong one
> 
> Konrad

This has been checked from the clocks plan PoV and referenced based on 
similar architecture targets. Updated the corners in the v2 series.

Thanks and Regards,
Monish

