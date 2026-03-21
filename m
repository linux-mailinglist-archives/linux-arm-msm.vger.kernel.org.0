Return-Path: <linux-arm-msm+bounces-98986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM0LNSZCvmmhKwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:00:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982E2E3DFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A4F0300917C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 06:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A152375AB0;
	Sat, 21 Mar 2026 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSQfUl24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2iKbX9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31DE2FF65B
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076317; cv=none; b=YwufZf4EhWMSyM+zthG1ZdgfjqKbKCPAzZy8WwxS/7aLUQH5sjdBlhnX+YtzMbvC+GfEU7f0DtfkHoiKMX8j6vKL7+r7UE/vxoHm/i98eQqdYd6i8uZDEp2RYjC+7yq/VzTsZ5qCzLWk7BwPXT+Lxj4eAjQ4cHEUaR/xeeW1Bd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076317; c=relaxed/simple;
	bh=8w/zODLveHtE0IP60XvUcrbU2F6f7Uq9BB8L37MKFvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmTqHS2xoa1y0d9XRiATNJ1UiuyjmbmiBOPegbuaSCL/fPSBZpPqLNNJa3amKwWrsxYFDrgwckk66oO0cN0dylXEmn807JIivHGXrF3mc14rcd2yanWWwA+gmDJ4FIW0Uvl/yBBXKm0GtfTUHpf+zoUO2K9wcVs3/slxDsQv5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSQfUl24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2iKbX9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L3kN5J357737
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fx9CE9f51VzBgzn1kxsg7836BTv0Nom3EGRHf/E0df0=; b=jSQfUl24jTU+BYAr
	cKqQgU28PzHNEd+6XYbfUO41jB7YzeOxvD3FVArvR55SjCHdzDrHBe1PGCj5SrUz
	yW5lgvDSYaWb7udTgCGNBWHuT9Ca6lRjBoXrPp1/TxlWj/UVaCVA1KQjWuk5SxDJ
	L/UAnBLodCOGeVJrRfAZxZOloTn6re7LDrAWjTIU7ov2EaXHaUBoNy1GQ5IVnGqg
	INDp5/WnIGWa4qToEnCfQNw4fbFFuR9rnP9A2mU6QtHZJ2othAads/wo692H80m8
	BsWTlGLBb8SjFV5WDdXmhzJiRk1rrvXKQsEVDPlhMkrVVlm+ESuunq46z8BkR+fk
	dhptkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5r7jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:58:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b05a3c2421so30667605ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 23:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076313; x=1774681113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fx9CE9f51VzBgzn1kxsg7836BTv0Nom3EGRHf/E0df0=;
        b=Z2iKbX9bbFRRyWr9pHufSEOZV5bCYIo42O5vOQzJj7UYPQrsQ97gTrAbDykvF8pb4B
         XerzZhu5zMpGN2actmraHY6Ol3ahC9fWsTr2OwLXUZxgY6iBRbdVnQqN4bCl+9qjbUAN
         6ROXN4fmxZIzKblfDuNAtsgxLjqJc1h8cD0V5bsV3yAY5oV6CpOORvM+i5TPuVQImQhK
         K/EjftKrYKEIgUvpOfE+7mI8ZRuFUDJDJTVCS/Y7zHEKpXQA8Joy96zR88n4tn8Z7eaD
         2QhB+Bc/vJMZUOgQy7DgcEB1T3CsIkKq+BTvIJHSBdpwa6we9QAjnwsGdWewx/AE7fEM
         xc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076313; x=1774681113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fx9CE9f51VzBgzn1kxsg7836BTv0Nom3EGRHf/E0df0=;
        b=m8IxrGiUUZgI5YgnZ9Vku5QPfY6cUb+85J+XvBIweAHp35WACNvRAnGrjeMjBMcjBj
         f0fhF8WzEZRjZtA5Ax3GjZbj20+tfEtFmQds6wDk3v0n/AnJQ6AnKr9u2JWCh/KTp0/Z
         4P/Lq/0rIzjZ5dLva/3NbTlFb2O4jlWX+VL05KwsVpfWEwcnyJd1p1fvCFUSxINNt0E/
         xac7nuJVH1kV3taWUsy3g69rdV7P6ntQB10RPxLl/9mTao63JHbSBX1XdFcs6aHK7APd
         MbSvC2ekaHB3MpVhy/kaNzqqLLTXJOUOjrN/ma+yaH6G/kzvXUGfdW0iQtx+4nfXtPQf
         ARAw==
X-Forwarded-Encrypted: i=1; AJvYcCV0TK/bswUfLK6cr9lzlL+Ve23Z5V477/AFfEolf3PYz5YDE5HpPrdfklH6HWHjcM5D3jl/mJOz9d/CAx5r@vger.kernel.org
X-Gm-Message-State: AOJu0YwHG4tbRgyzX7Spr/gkjt3pkSbgd+cotxGV/Uen5wzFhBE8XcBD
	GxBwen2Pwvb3qdklXQNu9+PRZuOCuOqapPtrfzBbRq1HQTdM77qH571CGaErGyPRG1h5QPeUakw
	zhCgFG7HoMKBOC00jgdmLRC/B7E75myzzx9zN+S7+C35DGkdEczEKOFG/Jjva5wQ+Ai38
X-Gm-Gg: ATEYQzyAOEb2l+VXV3DgwZ8/PmZPuZ5HFaMJK3R3AraEsyQ8nOZwTkrb6uiNeuyHIC5
	zJXTCKM6CdywY6OwodtxAkJKH6ygUDDV94mZ9ZjCcPWBsgWoBvhDXtHX3s0yuLkjnYQnBDFqNrA
	eFkWrSEHuVVRHTQm5h4hopW7EUOaXz+SH2rhyPSFpSeaJutXNQEkebA5lWsx2vRX0TRbgZpESoP
	YFSPoHFFTbwqYA6ivzqvcCL34pz2gIMrIuLyTjhPdMI7R/G1VqGQg1OULg+7XwLbe3FLAWp6b+q
	E2tKMeqp5LBa3fGd9sqoY2m9qn7smII5mBlIqPiwUkpLH9ulYKoXr1YfPqDusu704EfaI+IPamB
	+hf7CYdcTgaQgP/XOaqBD1ScrQruMKvMfk5VIIIpEX6JBcR81iFzeN8h9Lg==
X-Received: by 2002:a05:6a21:99a6:b0:398:849a:847a with SMTP id adf61e73a8af0-39bcec0c6f8mr5028574637.42.1774076313538;
        Fri, 20 Mar 2026 23:58:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:99a6:b0:398:849a:847a with SMTP id adf61e73a8af0-39bcec0c6f8mr5028560637.42.1774076312974;
        Fri, 20 Mar 2026 23:58:32 -0700 (PDT)
Received: from [192.168.29.146] ([49.43.232.136])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a9391b0sm3085441a12.15.2026.03.20.23.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 23:58:32 -0700 (PDT)
Message-ID: <f99d4889-7334-45df-9148-1f2eb54010e2@oss.qualcomm.com>
Date: Sat, 21 Mar 2026 12:28:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Enable PCIe1
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260212-qcm6490-idp-v1-1-80a45bd46ac5@oss.qualcomm.com>
 <j64qo4pnfviycyb32fuva46j54sb72djapjk2thqho4j5cbalt@4qykle6nrizo>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <j64qo4pnfviycyb32fuva46j54sb72djapjk2thqho4j5cbalt@4qykle6nrizo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69be419a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=RObWm1bxEibDRpuCBrDfiQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZNl6TJjcOq9ufUx7pSgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NCBTYWx0ZWRfX6MusIc0qQ12v
 61M8Oea8c0bLpRbA5DAnSt1Az3TnfQBd4DdawAXj8/Mtrf4nEWPccqKIjjgGBvgSyqyd29ca2Wc
 d2qwtycgjpvjpi0WTitwfsmUYDgM3Y+3qUpFxoBX0lHj9FmBdF6DpEXCAc35EA5HQwWKdxBsUHR
 7p+E1KeQWXQlqMCicxox3bQRB/nSJgO+ucQNNFeeu16D0uK8ORCCco/Q6tOB9vHHpSU40GDyKsv
 aOpqUBSy/e5aKr6kWg9wNm5REMN+BIPAtnTtqviGLxqn5Cbl+Uex/GCkcUOGtAV53jBQyAjOoW4
 ooA5aKx7OcFEJitKCXMoItun4tZuCiLS3swMYeu+XhyMSMHSXgTMjSiZft/8k6Fsr8Jvkywcwuq
 /GnkwcQ7oR7FnSQMiKaIKKn8DewkldvwaEfwEtXP8/wcCZpeY7BxAz21M/OBzt7v8dxpoZQK18x
 yFPdjNBznopjzMub3YA==
X-Proofpoint-ORIG-GUID: ul3Wtv-hJdfPO9GNzinp6SceRx3Frzlu
X-Proofpoint-GUID: ul3Wtv-hJdfPO9GNzinp6SceRx3Frzlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98986-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3982E2E3DFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2/19/2026 7:02 PM, Bjorn Andersson wrote:
> On Thu, Feb 12, 2026 at 05:36:29PM +0530, Sushrut Shree Trivedi wrote:
>> Remove PCIe1 clocks from protected-list and enable PCIe1 controller
>> and its corresponding PHY nodes on qcm6490-idp platform.
>>
> Does this mean that the firmware has changed or does it mean that the
> protected-clocks list has been wrong all along? Is the remaining part
> of the list correct?
No, there is no change in firmware. During initial chipset bring-up, 
clocks related
to unused peripherals are marked as protected to prevent them from being
turned on by mistake. If there is a need to enable a particular peripheral
later on (e.g. PCIe1 here), the respective clocks can be removed from 
protected
list so they can be enabled by respective drivers.

The remaining list contains clocks for currently unused peripherals.
>> PCIe1 is used to connect NVMe based SSD's on this platform.
>>
> "used to connect" sounds like it's optional. If the NVMe is soldered to
> the board then say that in the commit message.
Ack'd
>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 39 +++++++++++++++++++++++++++-----
>>   1 file changed, 33 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 089a027c57d5..1fac051ab3e7 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -533,12 +533,7 @@ vreg_bob_3p296: bob {
>>   };
>>   
>>   &gcc {
>> -	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
>> -			   <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
>> -			   <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
>> -			   <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
>> -			   <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> -			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>> +	protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>>   			   <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>>   			   <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>>   			   <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
>> @@ -615,6 +610,22 @@ &mdss_dsi_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcie1 {
>> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +
>> +	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie1_phy {
>> +	vdda-phy-supply = <&vreg_l10c_0p88>;
>> +	vdda-pll-supply = <&vreg_l6b_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>>   &pm7250b_gpios {
>>   	lcd_disp_bias_en: lcd-disp-bias-en-state {
>>   		pins = "gpio2";
>> @@ -920,6 +931,22 @@ &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>>   
>> +	pcie1_reset_n: pcie1-reset-n-state {
>> +		pins = "gpio2";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		output-low;
>> +		bias-disable;
>> +		};
> That doesn't look right.
There seems to be multiple default pinctrl configurations for perst.
On rb3 industrial kit we used the same output-low & bias-disable
configuration while for other targets, I see we have used bias-pull-up.
I feel the current config is more appropriate since it ensures the endpoint
remains under reset and doesn't try to link-up with host until the
controller driver initiates link training.

Do you suggest a different configuration ?
>> +
>> +	pcie1_wake_n: pcie1-wake-n-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
>> +
>> +
> Extra white space.
Ack'd
>
> Thanks,
> Bjorn
>
>>   	sd_cd: sd-cd-state {
>>   		pins = "gpio91";
>>   		function = "gpio";
>>
>> ---
>> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
>> change-id: 20260212-qcm6490-idp-24f7b6a1812d
>>
>> Best regards,
>> -- 
>> Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>>

