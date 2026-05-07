Return-Path: <linux-arm-msm+bounces-106259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFRIJKIx/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:30:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35D4E382C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B79430066A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D81E25A655;
	Thu,  7 May 2026 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9sKEuaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VRUrxCps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BB270EDF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135456; cv=none; b=fCaXyouPoBT0lBtS0qenOlyzhJFyE5J/Gf7lXzLqlCHpDtcw8FmxOfdMWv4kBvGhUhirTF5F4XpVU9P4AWHyx6yH/zqPWZC69eb9VrIKS0nZRx5+W4hXgYPt7b2ielqCeqSTw3YK8o1G+H/tOxSnUB0mofUmeqUiw8L6YAKk0M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135456; c=relaxed/simple;
	bh=CRS1X9h2eIrm7CgoKUmybU1wGmuTngBtmE4RHyo4itY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixX3gs5oR+EJG5uJPI4bNbQGIebOj6Mkvtpli9iNw6jbPeEkwraA3TCygRvkg3XyL4IRmQb1OmBqN1ZyR4CfGlQe/+MTZ9gOsQ4Gzxb/FnndnB4hiw6oOVB+uoeI7A0OopY6RU+V8n7kXYU9Y+NGPEnVDKjXYCdXduGf73uzT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9sKEuaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRUrxCps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475M7gf3156913
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qo8D8dOib3c388wYIEL6vhCGom9UevQVF3qyxOh0//Q=; b=C9sKEuawLNtmUgoh
	l6mIjS2EOA8Jcgvj47a141pPLBBStUN8SnObNke5Bomo1idlPpRVmGLvZmRTLs6I
	AYQQ1TDLzqjCoFyNfAxdNCpkNN3rkOy/ngCozxCGV+WqFp2v1mdRfCm/KoaQjb88
	COHw2H8TItJJWm9AmriZcHPGkdNqEpvojeV+D7b1YO3igs6wRwYzREHjVaznVKgP
	Q/t2VMOBuVub7URI9lVCYvYZgUiAFQfkdFlEHYS6UBh2BzmwrPPpegsp32W1DtzL
	Qk7VEgA50nG0ovbmayYf77e6gZ2F5FtJAf/fLEMu64BYhdHmuhutzMaVST77AEvw
	obNw/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf079r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:30:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6097ca315bso775247a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135452; x=1778740252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo8D8dOib3c388wYIEL6vhCGom9UevQVF3qyxOh0//Q=;
        b=VRUrxCpsAuaAl8CLk/sKwVLtBmZARkP/S2S7KIYMPrzZIhXiYtekFqTpGl37OUDjKZ
         n/A8uhucqoU0dVPhu4+rZruzf0Gd13txDHzhxZVMc0Fg+LxmiFiz3dCNC/2O2wtBq8NE
         PKVP6X7HJaxWgGnZxA4qB5Xb9jupFyCbHCA1YLseOU8did0l1IB6fJJtYrWuGBlhDsHq
         e0D1TDIjtGWVn+gJBohBUfih6LIVYVMHuRDiwRF21n0wj1G1bJYuJNC5hsDERqJc3KJL
         IffhHhE00rTtStSsfRX4aNrAEh7/FBEROxoHO64dCGwlCg9MuLNwB1cz0tkfpZQsAszX
         IzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135452; x=1778740252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qo8D8dOib3c388wYIEL6vhCGom9UevQVF3qyxOh0//Q=;
        b=MQ3onoaXtiy2oqUDHzbU+e5jmHzczcXlIWVZApUIX2LIfib+oBV5LCeDJWyPi/LKuK
         32VpGU7EPv1bzpg+p4yvDsiQZp8EX5UU0u9xxd8tZlG0ZtXFOyTN0DvUKwWxYLNkc4co
         o9waz4tlLlzefMn3dNQenVIwKmzUvY5iXVbKt1OwTJYNSc2JafUWw5F8vSfcRooIdewp
         LFRHg25IAg/B4US0wNhR+/PRE+qHXXzU3EDOiyC1XSXCjsxEqLo6zG2TCBkNQe7mzmD6
         cY0JlZbhzrVhn+tI85LIiVAwMhlxV+OhMLXTH8dmcCu+ten//8R8spfBbqWNUpGICJDe
         zKYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PA52IO9rKaJD3liIcUsbP4+KD7pTDCSr1GGMsF519FB0ksZGjD7AKXNzDCb5UYLDA8HbkP4GBC3TlDHyV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdy4kdyOs5WHB3inMBtnzbNb+ZRq/FGgJSWbj3f/Vbd0yFwwjt
	kAecIqBbd6voKj8oWfL1bdvp6t+6EOg+bGVAF1e+i/wyk8scmOi3he979nbcOyGJqxXruHh5L9U
	SW8z2TcnY6yGFIKO5oxnuxbuBuioouf9LIj3J9PpMZxbVeHe7EMVAELMTBwT8W+KBUFRb
X-Gm-Gg: AeBDieupnM1N5h4EQMZaJ52wDZY/gUwrBa560r041Cl7MnE5bTeM7cOoFdIePaYGUY4
	woQxAXEgmx07sq94FHO0VjpV4/YL2eRSv2i5XqkRNnY/AWuGbPCI5iwLK2vOHQS20xw7GlmzVcv
	tjYe0sBJf/w3AZKcplc0h2IoEXOifRTIklqLeURaRrjJoU64ecbqODBZuSJZXTOfkqa/GcoiiqC
	LRlK0zrwBlB0tQyBPGhhX0RzM7cO+itWb7hi+0xJHBnzlLZFJPDEoNRYIjS2uD0Aaa5Wv2BJEQq
	rE6U5p/EVJcb0MV7/V0l+CASQKcB7b2Qd1pFY12WjhrQYHbB7ek+Bl4MXSrO3pNPuYgtCz/Sbee
	jWnUcMv78TfKwb5Po6ScaKuR2+XJmPIEsxN/iDkhVN200HK+cRUmOCACu4k3vht64CG6Ky7B9XV
	WVAoK3Oaca4Zm8T1X9Eac7QkTzFPI=
X-Received: by 2002:a05:6a20:244d:b0:39b:e789:7d0c with SMTP id adf61e73a8af0-3aa5ac1ae40mr7562871637.48.1778135452511;
        Wed, 06 May 2026 23:30:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:39b:e789:7d0c with SMTP id adf61e73a8af0-3aa5ac1ae40mr7562838637.48.1778135452058;
        Wed, 06 May 2026 23:30:52 -0700 (PDT)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b352d4sm1052719a12.19.2026.05.06.23.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 23:30:51 -0700 (PDT)
Message-ID: <badc2def-7ac4-4af8-9402-9f19fd621fa0@oss.qualcomm.com>
Date: Thu, 7 May 2026 14:30:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MSBTYWx0ZWRfX51g4LdIy+srg
 Hu8Q1yq/6w3AER51PBDxRiY8wawRlX82ZLm5eZeZy0HYYOR+idY9qRWwICzEZJu7lnmrW1NqIGB
 81ILW3MVl1mxRo0wx/a7RGEnsxWJK0lN6DEYgG9/OPwPVxYjhGXpw+Ook7BuvRHv1UKhg2dPG3y
 /WbCySvk8Id5HjRk6eRQsp22Mv516DaYTOrwfhnOK9ceyflGisuxHBk7Lkz/PSFMPNRzfhrCchQ
 DKnJynjV0uJtQi4uUv2EnSqKNH2hnc+IdIeVEilW31zVTmesCCNs1sdP/FHehtOG1waLj8lyT7r
 jM6gqwzQlvaHcEsn6Q92YLoU6YAsgdfYTz4Dzk8QOcqiLhVLEGKv3zAan6Eas/zw1btTAje9Ap8
 Kfd1jl3sgDNuQpImHop/bJtEhWK4YFQEr2GMu36oOgEJxccbwPjo23tOcmlKJfLZ+uDMhiB/QdO
 5Req0U5FHfl1eQS24Bw==
X-Proofpoint-ORIG-GUID: BYOXZpebozQYBciOVF2LLVxDsZqG-50L
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc319e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=D95tBGhMd8aj5o4-fEAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: BYOXZpebozQYBciOVF2LLVxDsZqG-50L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070061
X-Rspamd-Queue-Id: 2E35D4E382C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-106259-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenjia.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 4/29/2026 5:35 PM, Kuldeep Singh wrote:
> The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
> UFS node lacks the required qcom,ice phandle reference.
>
> Add the qcom,ice property to explicitly associate the UFS controller
> with its ICE instance.
>
> Fixes: d288abc3a70e ("arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
> Validations:
> * Driver probe
> * FBE with standard keys.
> ---
>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 18fb52c14acd..4ea7f6b7e20d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -5396,6 +5396,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			phy-names = "ufsphy";
>   
>   			#reset-cells = <1>;
> +			qcom,ice = <&ice>;
>   
>   			status = "disabled";
>   
>
> ---
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260428-sm8750_ice_dt_fix-d32c838c0c3b
>
> Best regards,
> --
> Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> # on sm8750-mtp

Already validated the standard key and wrappred key.

Regards,
Wenjia


