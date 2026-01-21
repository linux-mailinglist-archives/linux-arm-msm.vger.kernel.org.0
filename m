Return-Path: <linux-arm-msm+bounces-89945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNpRFsR5cGktYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:01:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EF02652831
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9C0E38394F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 06:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C132374160;
	Wed, 21 Jan 2026 06:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwTdlkkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBvAfi/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B32512DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978794; cv=none; b=DjMshJ81mgibCPFVlZMAPxeOG5QtV9IYzdvBvFKH7x51jTy271goMulI8rphkH0OSjedQJ6/SmiOXkZu4ZzK1tGLP+/d6/1+JObXImkFifZHcD3khBwwm9A2KHwkgC99Uo0f0FijAY0VTN6+p4ZZzVgifOckWc/Ky1hOGT/8cHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978794; c=relaxed/simple;
	bh=+VmfiF6q1AJoQSkRpXQ/F/cBZuggrkXNhPRZ0UNCgzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkgRxyJdhtvP5YrLTBb0FvXBr61cP22zaorf9uMRjBJ3gR5sTbvVdISIEsbmJ/ioI2azxbm+CWKkG4+3iiyaeyLJD2310vjSX8nETho5aovS8pEIg+yJKkpJj3cKbfWtFgNFfeHDZgtS6hbQ2cXtnhNxJZmNRpWo9nbD2d0RCpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwTdlkkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBvAfi/9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6Hla4385080
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44gRnAKBKMmfl1NDqW9q0LpAxwiIZ6f2VPZlXasmGE0=; b=bwTdlkkOHsM+d4Fd
	w0k21PcKq29F7JaBmyFIwIX4CDhqTbvp8MpNrwN2h8RgLSreCCoAyKflk7HaiCbg
	YegpcDAe7UpFr9cECH3cPMrQdwKgHO7IEx/PWO0egiJL647v+jKFx9TVswDMwlrO
	ZfXnARzMKGmexT+gbx+ZE4kA2AYIwlNoKYHhBGJ0OLEEJ9lWdaV/fjK0wtYr0Rvh
	nXnzzMnNG+uJh7wH4reqhVY2VkbmroAxkl9enj7Ptt7U7NO1OMxlM9ZtgU3PQg3n
	LBU9Sh/edR0Q/TwBc6HvVncqzf7sHLD5PkFktveofsluq/B3ObE1JK11kJqxKsE1
	aCne3w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta7qbehc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:59:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b70c92f404so1275030eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768978792; x=1769583592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44gRnAKBKMmfl1NDqW9q0LpAxwiIZ6f2VPZlXasmGE0=;
        b=eBvAfi/91cU9f7JF9XlMDgovVDWz9xjK383lNilsThsaXUQcT0JgyeW8UzIigEoUNM
         74gptPLid9EYZKKi7QDS0t/dMMXjp7GweQmrEl2WuC5VMTPW1N3lLU0HYa5EGsjEWTkX
         CmfSGRNmeLQ3brJ1wEfRkqd/JbANT8cOGtXonnRs+f2nnSJpClkaiSazqQDxPBOLq33A
         vPdStCIlICZIzRm2rvl82xIeDcQUdPiX3ujcQnoJy5z3IG9Ni2el0lOyOWQRcy6ROQeE
         M5rnpXCM8qBVpjev7FTA18ERpDeK9P7reXRc0uIFkC460Psx/aAkiA1Ncgkx5wR2YadN
         Nj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768978792; x=1769583592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44gRnAKBKMmfl1NDqW9q0LpAxwiIZ6f2VPZlXasmGE0=;
        b=SUjXdtsYCPYitMMLTAIsIgYZSyNwFeKdXUe4W7uAIyyKnZjL9xQvRiJYA+5mBX2jXX
         GNzM3PzsCL+fK7eeHpBOPpem97ZC5AyHGth6R8AyA49v1bOAnEjHxVPhBVwafI/P4TfL
         Be9IcL2+wJzTEjZmKC6FplONHyu0++846hVFyswJ3cL4e8BY3+OYsO8Rh3ueOlSLvjyL
         xUaRaH9nkDJxbc/OcEYLPUx31WgwwIYjmEBMqp4FSpnbDEEZ/5q4+8lIXRqMWbih9i/3
         Y4f7hl7vECkKNklw07L5XYniaDMPbXxFpHtNkG4xOehW2uyCI3k4C+atNJqLiKDwG2VC
         1xoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmDR23aoYa7hVOy+MlfgLlts4CkPSy4Gw0+KlyeUstHaauWu+nz6vSk85nK+fVZ5GyCD1jv6mcQgcPKlp8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0wDMNVZ2tXPLR4usyy85IrZwtUwzQvBrGLiDX0CPtCD9q/e0u
	JH288nBWQ6zHqw9JfXbOmqteCsig7xc9b77V4CtdH5JpOph2fFTOSNuU5FvrUATLRZxGYCUiC0x
	M0aM9F1IO3cSD21/PMsAI3og6l2Jq3upzaV19hEnzXeaB9dIRhvJi1tmkTsMVDky6ln34
X-Gm-Gg: AZuq6aJa3FA8Ww8k7dH2ayrPC3ydl46VqaEnca1VXa8Ymo47hPiLPy4h3Y7BWfjW/BQ
	VC5IgkiWCP7BJC+wIqeF4yW0Jv9NqpLImwB5eq2ML7HKuR5BiLXzCFp5SzMNx2ZZozQn1efz9zb
	BMwbyscCXYSdYJxUF5DBLI0tz8XIJQpBUyvao+HS6BVr0Weu1qSv46OUmKwtSwjBeS1jXcK9lhF
	CW7+RRXItzSCxujI3k7XMN6R6VAhoANhglYe58vGJSR1RHz1AhEVtI74j4tHJwjl9+VBraHE/3z
	QqFaPosmaeqcW0TLZ73TLOeLkvXgr2+IPWxL/FX/YkccbkLbaNBfAv6nAaw1IpnDe6S8+PGH8tI
	oUvvvwHMbGvpt59zqzCO3eqjXzvtumuljQGbUMVuR05KlRnmonhPVlwjNdq6m/fot
X-Received: by 2002:a05:7022:6b91:b0:11b:9386:a37b with SMTP id a92af1059eb24-1244a78d435mr11430960c88.42.1768978791534;
        Tue, 20 Jan 2026 22:59:51 -0800 (PST)
X-Received: by 2002:a05:7022:6b91:b0:11b:9386:a37b with SMTP id a92af1059eb24-1244a78d435mr11430951c88.42.1768978790893;
        Tue, 20 Jan 2026 22:59:50 -0800 (PST)
Received: from [10.110.110.132] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fb72e477sm5575769eec.29.2026.01.20.22.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 22:59:50 -0800 (PST)
Message-ID: <135000f3-b444-44e3-bbce-e5e274e6180a@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 14:59:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120070650.3192679-1-wei.zhang@oss.qualcomm.com>
 <i77z7i45g72k4hqzd33z643xiuol7olbk65dzv62fgdhcllsmc@kcixnktiyknq>
Content-Language: en-US
From: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
In-Reply-To: <i77z7i45g72k4hqzd33z643xiuol7olbk65dzv62fgdhcllsmc@kcixnktiyknq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uNkx-iiHqv95v3tolsD4ftOF8pOIaiRO
X-Proofpoint-ORIG-GUID: uNkx-iiHqv95v3tolsD4ftOF8pOIaiRO
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=69707968 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=uRIq5cPlbIFpHDivVdoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA1NiBTYWx0ZWRfX6iNHq42epn37
 Jvu2lon9i85IKJ80kSPb8mal0/b62bDiejiHNIW6ef8AqxDLXHhe/9dj1gmp2vZKgQlFKozI+CG
 oebrJA1MROiG/YFV78XytJn/BG7KAqhU2KTlPXbnwiVcfbeFsPOUd436BW0XjCjYPnxnl2MS1RZ
 35rv9U52+cciCfznXEKGlxHJi/HmS/K3yWgzrgHK6L8OGUFxPAwVnw7ydPCRyFMobUPVPxpFMmN
 Knty9bPOsffgrhjbOPfz02RJXKX8QuiYL6w/wlbM60V20AAnpp3s75UGgcqRM7bBECyfgy2cGpp
 tnSo+SauY4frkyZQoU0FClrfB0MGxrdC1DjYLUbppFSlGTYDPRjNBqM7AegL/+CPULoPSdSlRk1
 Xfyj8wNLME40q5cAsnWTAk4sgJ/xFfbMlKqpBLdfjMwf2bBxAC5gu1YqP51uiS+ohUDKRRxxyJf
 zGpg0vCTyz4YAXZBKiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210056
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-89945-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF02652831
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 1/20/2026 3:44 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 11:06:49PM -0800, Wei Zhang wrote:
>> Enable WLAN on qcs8300-ride by adding a node for the PMU module
>> of the WCN6855 and assigning its LDO power outputs to the existing
>> WiFi module.
>>
>> On the qcs8300-ride platform, the corresponding firmware and BDF
>> are QCA6698AQ instead of WCN6855, which have been added in the
>> 20250211 release.
>>
>> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
>> ---
>> This patch depends on:
>> - PCIe
>> https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.qualcomm.com/
>>
>> Changes in v8:
>> - Reordered regulator nodes to maintain alphabetical consistency (Dmitry)
>> - Place wifi@0 node under existing pcieport0 label
>> - Link to v7: https://lore.kernel.org/all/20260119090758.2780678-1-wei.zhang@oss.qualcomm.com/
>>
>> Changes in v7:
>> - Align regulator node names to match the existing naming style in the dts (Dmitry)
>> - Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei.zhang@oss.qualcomm.com/
>>
>> Changes in v6:
>> - Rebase patches
>> - Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
>> - Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
>>
>> Changes in v5:
>> - Rebase patches
>> - Flip the order of property-n and property-names (Konrad)
>> - Flip the order of bias and output property (Konrad)
>> - Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/
>>
>> Changes in v4:
>> - Rename the symbol pcieport0 to pcie0_port0 (Konrad)
>> - Adjust the property order in node pcie0_port0 (Konrad)
>> - Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
>> - Specify the calibration data using the correct variant (Dmitry)
>> - Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/
>>
>> Changes in v3:
>> - Complete the nodes property definitions according to DTS binding requirements (Bjorn)
>> - Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/
>>
>> Changes in v2:
>> - Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
>> - Provide regulator-min/max-microvolt to the regulators (Konrad)
>> - Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 105 ++++++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 68691f7b5f94..864b32503d29 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -24,6 +24,26 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	vreg_conn_1p8: regulator-conn-1p8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_1p8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_conn_pa: regulator-conn-pa {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_pa";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>>   	regulator-usb2-vbus {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "USB2_VBUS";
>> @@ -33,6 +53,68 @@ regulator-usb2-vbus {
>>   		enable-active-high;
>>   		regulator-always-on;
>>   	};
>> +
>> +	wcn6855-pmu {
>> +		compatible = "qcom,wcn6855-pmu";
>> +
>> +		pinctrl-0 = <&wlan_en_state>;
>> +		pinctrl-names = "default";
>> +
>> +		vddio-supply = <&vreg_conn_pa>;
>> +		vddaon-supply = <&vreg_conn_1p8>;
>> +		vddpmu-supply = <&vreg_conn_pa>;
>> +		vddpmumx-supply = <&vreg_conn_1p8>;
>> +		vddpmucx-supply = <&vreg_conn_pa>;
>> +		vddrfa0p95-supply = <&vreg_conn_1p8>;
> How comes that 0.95V pin is powred on by 1.8V? How comes that 1.3V
> pin is powered on by 1.8V?
On this platform, all power domains of the WLAN module are enabled 
through external buck converters controlled by PMIC GPIO4.
PMIC‑C GPIO_4 is used for DBU3 ENABLE (PWR_CTRL2_VDD_1P8), and it is 
also used to enable the core voltages required by the WLAN card (1.95 V, 
1.35 V, 1.05 V. etc).
Do we also need to define a regulator for vddrfa1p3-supply, 
vddrfa1p9-supply, vddrfa0p95-supply, etc?
>
>> +		vddrfa1p3-supply = <&vreg_conn_pa>;
>> +		vddrfa1p9-supply = <&vreg_conn_1p8>;
>> +		vddpcie1p3-supply = <&vreg_conn_pa>;
>> +		vddpcie1p9-supply = <&vreg_conn_1p8>;
>> +
>> +		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
>> +

