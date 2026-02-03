Return-Path: <linux-arm-msm+bounces-91624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDyONVa4gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:56:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 763D2D67A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCF81300EDDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E4B396B89;
	Tue,  3 Feb 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGgBQgo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwAZI0uJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87A3090E4
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109010; cv=none; b=UHfgbkuO3s0YbqNnX66U8rNounpmpFJSI1YEX0vFI7Cc/ve+ud9GAsZoKeeshXZE9AFbTRrwcrdi0QZWFgxRm2tpj1ttHhRfryPEomq36gs/epdQL+VPohPmfJazMwZ3Accbj08EHIL90Iq93gAOgRF7V3CclVGf16HDUaNchjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109010; c=relaxed/simple;
	bh=mQdxUP2+dADPWqBHnoh+kFeK1NcU2GgirtlLTlKj0Co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdYR8BRprn/fUTr1n6wmy4/WFR0eiR5OGaCRgUky4cPqcfAO6m0W1CChkXqvKDiqdDHCb10pCTrdIE452vFU7VxEnNz/VtfXc4pm4NY1LnQACyTwj2hzzjc8DDegK6AyuMHoXgcUuba4OKRUewdUc693p4Mz8A1SiJn8nJP7AF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGgBQgo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwAZI0uJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6135knww3459143
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tu+qqR8vC6JdMxD7zlcN7+zYBe5/4iYI6bNeqqyUrIQ=; b=AGgBQgo8DwnyjmCA
	O0yaIkTZfmS8rKITYNPLuSNmq7mJv5urIzSCX2s5hZIG49XVJLsJFwWPn4ssk3Gz
	GEwrgb1pDOqkQhy4OaRWVZztyuntU671uPlxUAlPz/Dux5TMicBqJFl+amzSWO8Z
	+JCKAciRM9Zonef7wFsS2XotgVxi7s/M+u3uzx4oBhIMRk0A/JyNLxLmygv92n5v
	tr9VGCed98IOfUtfmBvEP6vWKnsiIfxblYu7M65fwnKh3DPEv81UrKGVHK/RNsC6
	+XNuDT/3jqAWpcsEyjpYrJFsHvb5eoK5rhIbXDn1F0Cgk2kMcHNuDhAY/8ajoB8b
	290dSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbkkf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:56:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so100804185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109006; x=1770713806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tu+qqR8vC6JdMxD7zlcN7+zYBe5/4iYI6bNeqqyUrIQ=;
        b=ZwAZI0uJD0bAyB3zLhhk/caY8zHR38bMQkjrzG8ffxwHSDezRxHyPYYLF6UZXlBfGx
         yYUcDlzr4ZZ42zLgzB2HweEyTcRRdkik2hyc4423KTM7qCA5OIDLcaH4nyBSoCsU9PtZ
         l6sQE0xl9VpbWmS5CmvYJ/OcinKGnM7PY3FoxDlUPmdiwlxOd7MlScLUU8e2HncrV1Sb
         /gerpeFxASecAFq6YM1Z0/GC8k26aVB7uch8EN3WrQeWreiBUaTsqpgVcXFKH5scVIeo
         /dmoRhZzvwz2MEE9w0EgXwftwmJsOq0Arivs6iquiByzaHGOC+QGwHr6nwRChbuwoxBd
         E/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109006; x=1770713806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu+qqR8vC6JdMxD7zlcN7+zYBe5/4iYI6bNeqqyUrIQ=;
        b=sZq/p9Ykd89fQ3xGyLMhEtatnvOweUAjIofCyYyVFV1bAu3kAfjyOqm893xA/+4tVe
         eqn3+k2NMkgqdRm7w4Phc6fWAymm2YZHkGY5LzaYkURzylHA1f50PH44w3o7Kmdn8ng7
         LfFHGykFafj+ohUXfWWtrilFpEiQpj1NVINTmWVWsxxKoHB7eT7DUEjrZQBetg8QvM8d
         4RAuTuXavd5UzdVjiUNlsKtHxuMswqUzTiOPQqLF2N3eco0pf0yrye5crzwbJaNz5ftc
         xKlvuVJG/r0fRojUHzsxTq04pkEaVTrGQQC/7RwssPvGzTo4B3HstyKJdgVRnd5wjn4h
         Dyhg==
X-Forwarded-Encrypted: i=1; AJvYcCXb8k2UzeLy3u/VaLd32/DVN1x7jTA6RldQs7spv0aEPe6HZMUYrUZt2W8wCssN4LR240KwPomlUEACaCn7@vger.kernel.org
X-Gm-Message-State: AOJu0YwTJj3JvWMMLxzIuii+Jow/c/VKheDhri6REfpiiEKShEVBUXSQ
	ozX8YY24JnnNSsU/sNxvH626BP58tJu5titHFC4pxKOqCTCiy+Lea/CbDRmxNs7QTgNCqMShGpA
	xmjN1K8uZ3287MFngO8PtBmusL1nz2EsRDKz9nQk2fUdGeYPOqZSXKjxGU/Upyh8jJDgY
X-Gm-Gg: AZuq6aJpSAXlqxJxcKuPSCFVCXoOowBOd8EJeNYp+gvb/Ja9G8GGDC75vFH81L714/j
	mYKV96WtpjjhLpAa6EMTc76+VB7emnsIdlNXTMflPpxP7xkrAI9l5at+TvlKGPLPFqKTgIkPTiU
	sONEfV4q2l6FzvWBJebcy+ZumQWsDezgfE6ugoirklFhCG9uYk6CbriHk+Vdyz0qlYtHkamlVSK
	jmlT5ZNWfGIM4p1RF+d27+AKkqn6q05v7c4wrQYFV4FH9DHCmv9EVkCHZsWqjdcOgxv2RA7IfTp
	rNtUu/iOLZCKdLXvruuZg/cbnQ1xnyXpclsY09h1UCgnJvDClO5f1WpceJk2u91Ddc/Za0jDAKv
	CVpfa4KG5FJHVIYYgZT6Zk54/FLO4gDOvWN2yspqtU2uczEQmzrQnbcGV4cfOsUeQHN0=
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1519797285a.1.1770109006441;
        Tue, 03 Feb 2026 00:56:46 -0800 (PST)
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1519796185a.1.1770109006048;
        Tue, 03 Feb 2026 00:56:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm1007806266b.67.2026.02.03.00.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 00:56:45 -0800 (PST)
Message-ID: <d91d62ce-8d85-4182-a0e6-9253f07bd002@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 09:56:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pakala: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-3-a5371a2ec2b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v1-3-a5371a2ec2b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WorDc92ggGV085rO06ejh0OYcNfbPIGS
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981b84f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WorDc92ggGV085rO06ejh0OYcNfbPIGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MSBTYWx0ZWRfX7Qs9sv2AFJrW
 Fht4QTlVjRwrrDCtfYTQNJAgAFjensimQW0O+pvvfOR/Ax6/XmKk5IKTPLZYC/lLufsb1Vsvi30
 TPJ6Z3Qozm3au2kP01ob6LNYxyHaLXYxdPUMz7umoUKwR//CZAxO0ajO1/5YMmRQNFzG/BHJ2ay
 hIUpZXMdyLVvZVziiHwOLCGDKt+LnkUAq1BIRZUOtbieyg1DsyEoxADuFesy72uqD50dlO8zNCx
 Tw8i13OvKds5N6/j3kSoywf9KDCcQiMal+C6GiDlD2ZABLnD0aYZk2edJvHTsuahrQRWYK22vZ5
 xt8dEjWFAJd4v1nfv5UQ/fcquJQnn1fivJ99DFYpgQhrUiFiFrAs9bL/wEoL4HTPEkkzadjRxoU
 Czmggf4AuEc9CxYZpqAaLAcgTf4XXc7aDOrmUjB/x/a4didp5OanL/QOoDDRWVDFrKbMwo4kxR9
 xgYFLT2EOeqEZW8TQ8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91624-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.152.154.104:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 763D2D67A2
X-Rspamd-Action: no action

On 2/3/26 9:08 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 177 +++++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index f56b1f889b85..1e39503360ef 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3574,6 +3574,35 @@ tcsrcc: clock-controller@f204008 {
>  			#reset-cells = <1>;
>  		};
>  
> +		ctcu@10001000 {
> +			compatible = "qcom,pakala-ctcu", "qcom,sa8775p-ctcu";

With "sm8750" in the compatible:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

