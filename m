Return-Path: <linux-arm-msm+bounces-112634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fwNUNodoKmqKowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:49:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38966F8C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:49:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aopiqepx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X8QiSpa4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112634-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112634-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2C20300BB9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB74536F434;
	Thu, 11 Jun 2026 07:49:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AAC369985
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:49:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164164; cv=none; b=cfGq5of85vjn6ATGCmLYiItvuFzwapydkNUJdRXfVkGKrRBMWqNVcOrcSI9EEg75Nr3zjX4mjBg0cOW6fmKme4n0SzAXhhlYw8DB4KmZ5OM9yqKqeeA0C43iF0mcRFnHn0pSTnLMpbsPuxIp9gfUqBC5pOEsV+aHntSjosTgqOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164164; c=relaxed/simple;
	bh=r4u7525wBMTu2CXxDilTPdQiU4seuStXSxr4mhu0jLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dy2BGUsYp1sJahXOZuSgwHBZ7O7kgYPR8bVqknxnvDU9YiObzbuTkn4Htfk7/coieCqv4TTU/eEehAXb22kPHmNbJhrOPzXsTcPJ7mo1E+fV6gPcMbvS4G7NwCB7FF5tO6tuQwim4i1S9cOpf4boclI7Dp6mXkH1nPtibQS5N0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aopiqepx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8QiSpa4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GJW73761248
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/tvkY8zr/P0A/+5aGOPJMzczHUrqigU/gDVfyTBh4A=; b=aopiqepxGMr0v6Qz
	5bdcQmuZTbH3BPUe42QZj8F/adRBZX87r0PDDnrVFHZVnDgxqX+UJDkYYO2gTPqL
	+hhqmr/NbxW6EaB8deAOFa68kyGfn+mOGt7eG3L0gbCqwE1BFmyeawY65u5a7J8k
	S4CHxrZuigRepsCLyo5CFPlxv3CuMLWrmss133BptG8nyZQ/da9XixEgivv3jI7j
	8Dte9XGqr3tz12lkCWDQPRKPeDbDdfQfDdL/f8ZYHFGvPjF3wDxwDHrk13Tb/cbv
	7ypU/HzN64nsYhhatDbpIUcO3hzVEOTGZO0BGRDFNHHdNqGx7bPUbNNUYSvxgqaw
	qGso3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjbvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:49:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768e1d798so19530881cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781164161; x=1781768961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/tvkY8zr/P0A/+5aGOPJMzczHUrqigU/gDVfyTBh4A=;
        b=X8QiSpa449p3UfkYtoMYeCT6dDXl8hWgE/EcDAoh39T22W+PWRHcNwqTUlXEuN9u/B
         Zn/fytUd0lFq1hh7814TfWiUqPmtnHgdL4OpN2/1pwl7orL1jLzKDm754mrDimN+owiv
         CqQb9fN5PGKSkk7DwV/P43cp3jgUjodTzP38qiRXz37rEBuNELiYjlHppvGuDonorXxo
         hl1pr/BoTlSZKyuapKODXGSXL8mOBBtPSGJKvHI2egUEcxxOSZv30eC924yC2yqDMAI1
         ew30JejfbY/hvBsU8Al/y1km0cGnemXE7jTtUHEG6J65q1Sgh1K9AJckpyjQK7emeJzc
         P5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164161; x=1781768961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/tvkY8zr/P0A/+5aGOPJMzczHUrqigU/gDVfyTBh4A=;
        b=Ivelc0ai5FFNkcPsqNeq/17QjtiPHO9aX993VxBOwDePrK+m/4Jo6tqpPVdUXNdYt2
         Jskgg0ePx5G0oiDoe08MwLSbcXyZr6pcbg6Jy2X1Ci69+YKh5ipedd6gkO3X89bp45SS
         w8pM+9KnvQB4oPLguPc8IjZ6/PvesKSIQg94MXIz4Fl7tjCRbG5tBiLhBENAi8Fea5/j
         kIoae3PmvLR5VtosJ8xwOvMJsJTmrfFV1yCFvubV8A/hRamzp9ShvDZVex+4+H32YZVb
         bse5jMZZ6j/4aI254jvx4GMFEuDvJxbEcZtXb61j2ssrDrcUtylb5B4F5WwPIlunMYpT
         1QxQ==
X-Gm-Message-State: AOJu0YwugTDv3klmgrlM0smgkVPlv5JpqjwxvDvXEB6+04yHj/6Y7RBt
	KAK/1YTBWn3Gcw6sfT3suub4caId4GwjEIvoVc98niZhNV65CHFTuJ3lGmuoYpivs6TA+viRvy7
	zZGoApf7CRvXhImfNwCBW4K1jVIMfev6uSvIgfcW6q7vOq6e713jmY4oPZXsF90RXp7UO
X-Gm-Gg: Acq92OHOZdAWpxmxPQUDWeEs6dp0xEgBu4tELdIJxEJQAHFCI7CFHIv4wVodqBQkPck
	u10TQO/1neb9j6jW7KjhJ56UannE7lT8TnIxILV9q0qmw5pTsei6QHn7xOzJotQc29f/J0CSqE/
	hBIfvB+I5MRxIncF891QroQUy2oWE7GwsM8DTrnEzoe6QGGOQGuJuFT47uUyAr77KThJWC9u7U5
	ujZJSdJ11Ec3EwGRFzS2vPPN6EUh6/VSOjb5jDO+B0GsITRYYHZaOl3UpPpbc1F/MDRgVlQ9N4O
	qQEccRbw4cuNYKQEIQ8T/4wg8Uq51ZWMUvy3xGaawzr8DEDmRa7OeFggMYI1oa7ddm9nf2ZW0Hl
	jHDJ1VFNDq4RYzJVS/m5u9dTW/7a5TDm+wrG0tbLs6BkFbVOfnUXvaz7Z
X-Received: by 2002:a05:620a:1a09:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9160ad62db3mr134148885a.3.1781164160968;
        Thu, 11 Jun 2026 00:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1a09:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9160ad62db3mr134146585a.3.1781164160505;
        Thu, 11 Jun 2026 00:49:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f1439esm24362666b.1.2026.06.11.00.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:49:19 -0700 (PDT)
Message-ID: <5a65ea59-b38d-4cc0-901a-01c239381d91@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 09:49:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/37] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
 <20260611-wake-v2-26-2744251b1181@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-26-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a6881 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Pp3Y-cPEr_PWQjmyE4QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ij6fLfdZHTpjy4u4ir95S8Xk4M7DW15A
X-Proofpoint-GUID: ij6fLfdZHTpjy4u4ir95S8Xk4M7DW15A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX7wfVBWte+WeD
 aWoyyu6EM0DnahfkohpOswqn8FgwcqtoMVE5A2y+xXfGxODraWrZuUS1ZCfLj/OFu4Qkvqu/MPF
 UGD4EGn+uuzLuRKAa5fE9WiUAF7zASXgOchPSKYHTUHvTBYyvHwd/6reYyi/rp+ZQfstYJeXPD0
 kgYyzsmVq+3xlICnLMU4EXgpvAboht3H24EKn29ybwkj2DCqFISG03OR9JQ4ryQkxmqYFaC9pL2
 9Pst0OfdnNp6yQ3OL7gf/Gqsj1pwdseWycat9I8+5v87gb1Udrol6qisOwS+r6swxuDS9hu0EjE
 YUecehAFzmjupk2nc/ObnR5KsS8LU4R4eJWvlQbbIGflTpXEiMqdc4332IQ1dE2lK+fUldjADX0
 AcJnNrhShDqMLCL0/rZUOGqauJG5t3n3VbpvyoB0yfWHJcqHtnpfw0r3XSAFtqP504S/gfCjZdB
 XkiRTk9lWYIdsnc/Ewg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX86LffBefFhiF
 tE2AIyjFKOLjWxhIM6i6OyQrSdFQOIC0VoQUOxI5GDThblGbSgJiw197zssVofMThRY0I4RFF0w
 ug+X+HUHqFox4W5HjK54gWS1wuXcaYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112634-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A38966F8C6

On 6/11/26 6:59 AM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
> labels to these nodes to allow board-level overrides. Move
> perst-gpios/wake-gpios from the controller overrides to the
> respective port nodes in the board files, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
> ---

[...]

> @@ -1779,13 +1779,11 @@ pcie0: pcie@1c00000 {
>  					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
>  			interconnect-names = "pcie-mem", "cpu-pcie";
>  
> -			phys = <&pcie0_phy>;
> -			phy-names = "pciephy";
>  			dma-coherent;
>  
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -1793,6 +1791,8 @@ pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +
> +				phys = <&pcie0_phy>;

Other DTs put this between bus-range and address-cells, e.g. hamoa:

pcie3_port0: pcie@0 {
	device_type = "pci";
	compatible = "pciclass,0604";
	reg = <0x0 0x0 0x0 0x0 0x0>;
	bus-range = <0x01 0xff>;

	phys = <&pcie3_phy>;

	#address-cells = <3>;
	#size-cells = <2>;
	ranges;
};

Please follow this style

Konrad

