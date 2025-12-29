Return-Path: <linux-arm-msm+bounces-86843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 095DBCE6BD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81D083009A9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09043112BC;
	Mon, 29 Dec 2025 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6M+GQQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S26C064I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B630FC03
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012167; cv=none; b=UJxOfXBoNVZNhwTFl3gEitt2wZJ8VhjMsamzg8uSpVKs33uc4Ev4zDFXaUdCJrED/6aDuAgu/Pw1w2Bysugap7za+qff3opJPETlVuvpV3dReuy+yrxv8V91cds9Md8teSTvMMlw08urOUliSE9B1p1WssYboJ/Q8UMq6AOyFcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012167; c=relaxed/simple;
	bh=HStQwqlHIUJ/YHdSxRjY0mxn/G5b77jipXt1NWL3hDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isB2rLlGJGW2hw59Z+fXTZax69RD4kbbY/WUYFhHnYyq/LE0LYqGxoEoFyj6hV30zmA+BJKPvfaPEa1wQXrMcrDauCRpn646r5HgV0TiUptKgvgHlE9W2wcxS9XtZqi3Kci/TsfMGrUWYs7AWuvugzkL1AnalJYkPHX1n0yPPIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6M+GQQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S26C064I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9vIpd1348132
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLHoWUGPZQRRcoUshVTCLj9GEq7fs37dxj5p84TlqEg=; b=L6M+GQQ/rhpFJ30R
	PkY1vD5tRbELnynwl2XHvCRNFeYoE0MlCtl2PElpCE1Ost83n25iKhRgpOvWjgII
	oreiU3n/cLuKLbExaJuR8ZB7RqXZ67APZ8tVieEYdR+I/15yWe3cIUbsTXQakjYA
	3afqCfhFg/8p7xijULRaif0j9RP4UV12aelZKuuS+dEDZLhdpChXd1gUPWaoBo9V
	mfEDmaS0pS3ADWnf+kAdiqcRcr/pey334NV0S1nscy5pEYP77exHmeq9DlFCxAAh
	ZMl+6EkHU62FysqBnI1zR+7AqkX3zaJEh+uuNbt1SDKzqzhJr/qjbTAVhFvExMhW
	iYpZ4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj2stw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:42:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so29840171cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767012164; x=1767616964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLHoWUGPZQRRcoUshVTCLj9GEq7fs37dxj5p84TlqEg=;
        b=S26C064IZfkqjfkh+/EcOLMZeqCZEmRPHufRVMDqyxvRyP/1naunxRIkCBPcDcIAl3
         WED0fdhsSSKAdN8ATQppIWDCtXxYB+9BN/fMk6v021/fBcBexb/6Z60N9XLTPCEjxdLw
         qFFOaCTA9oiVmKTxSjSbuL8AIm3fuIjtk4AeYGhyHSjJruJR7+REg+tPnlosdzJ0jfmJ
         ZZDZOsUad1oKOy54lEF57Zlf72HXXvFcS+zCxytStl/9eUjifH/1T3pfbKr4jTh/h9Yy
         d/c5uwnCZcMZU8ZNNq7Q+T9xzlSW5gQu6PJ1Gh3tmKy4wOeKhu6DM5QW/cuggwmmev2L
         MhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012164; x=1767616964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLHoWUGPZQRRcoUshVTCLj9GEq7fs37dxj5p84TlqEg=;
        b=soeb0AHt1khm/pnRVGh89qNJf2hho2Bv6b/nb+b3uadQJSdxc7kcyxnWU0Or6fg6nB
         JV9eRvqkK5lcjqb63/35ms0EmDl+bUmZ6Bnfkc+wxR/FkSoP6j1h0U6wPgFhWkkY2p1T
         UqvVzOocxoYxU15vRdr+Z5Lao+66twMSJokFYEFsyoEUP2JoCBhRk01M8mN74H2oAzFG
         HIiS2d2szvINxzCFcP2oPN2tO8mDdaUo/0QNnCK9ff/aewtCZNkyo5Q1gASRmRk0qxwH
         vIjVeeBQv9LkWwk1vakyWePlCaulhx7dD53zXObkM1r70SOwl6u9OlooUWrjoB1ScPFw
         1vmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSeGueJLPQq2Spt9PQnLBzLuEzUQ0RDO5tgh5UNFg4MBsKCJkN9mMLSvLmm3aBKTC9W0kmbEhzwGMB9g4u@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSCfK/swvdXyXeNp75RNMtSe/vePAgUHotyWDWsS17h3ca/EV
	KqA4YS1wazfQipb7XXLpBZSPikACL1UiKujSg1VEdG3wjx9AV12J35wQc5iDHUwPt8WC5n1ASt1
	b8L9tb2+SRLM7wWIWX5rOClvS+ja1BY2QG3GOvukeSTaOhxMEidFrN0FL+LvWON8aHATg
X-Gm-Gg: AY/fxX6BAml102thUaWr9AWAbsVX5pkqqccp1gADXKx1xL43A1uvNTUrcn3Y4oaff95
	m5TydWfHKFjYzJALpjIsJBs8XaXrsqHp2QPDDCnt8gCiK0/SvnYKtP/w51ntV+CFTYl/xqQZ0T/
	RbZOXa6zjHI5Xq/saOZ7zFLf+L9Nyg569lUOy3QZXtHH8CIr0O7hd1p8L2jQkhgZ/76tM+TcaAh
	HLaeRpXcPBjVYv2A28uLgvhmyFrdjlp7wSib5SpHpnl8ftHw64LIZM554I/HlP1t78Zbf4ACS+M
	Wj4DqEewm/zYMGbDvLhy70Yn54leBNDI1FIDc7MnVhZP/g413BPMFJR2pWADut4QdQUhkexS9ul
	YdG3AKnRKB6if9m0W6XlCMIJFOIhUeZ9V7OmD4uBDWfh1VXun/Ecyx6sD35E+5f2eJg==
X-Received: by 2002:a05:622a:14:b0:4f1:aab9:851b with SMTP id d75a77b69052e-4f4abddbe18mr339555011cf.9.1767012164402;
        Mon, 29 Dec 2025 04:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3VoUQZBgwgGsEgvchqDBszNXpRAZvF4EhyzRtt/ufOhbSzL7jsNtZLTpkJQKUk/DEvNRZLg==
X-Received: by 2002:a05:622a:14:b0:4f1:aab9:851b with SMTP id d75a77b69052e-4f4abddbe18mr339554671cf.9.1767012163968;
        Mon, 29 Dec 2025 04:42:43 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f09149sm3309398566b.47.2025.12.29.04.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:42:43 -0800 (PST)
Message-ID: <ea6429d8-4079-46b2-a961-f6d758c5eb5e@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:42:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229071258.456254-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 60gIM7BRVNE8hNP-IkLdgUk5udz9y-Py
X-Proofpoint-GUID: 60gIM7BRVNE8hNP-IkLdgUk5udz9y-Py
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=69527745 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YvOuzFCPeRrlURUD1m4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOCBTYWx0ZWRfX0hLhuY7bc9rR
 tZ+9r3dR21brp4pZH4tacqZtybB72eWHerZ4Ekq+jWocVR4cciDZ0CiFZjG6dkaSIigMqPaQbjb
 TZnCAFkx4OGQ8fyqTQihOMG4rmZ51Fn8KVggegUw0ayDG7r80UMe/uSosG2Eh6xwtEWXvKEJcew
 gJx+ANShhRNFkYdq+zqBJSbVjBXRT04eeV4j1Kv4ToeTYxMjKu4jNGcyh39Z1ceR0m3GxETV0jx
 SS/Wh2sFw5KtEv+kwlDW/Wa/mwD7yz/JNkDTgem+w6qXPwNrZfEWp5zRr8MYPe7xioxM9lqDxUA
 RGiJaTQFLPFWrKXIUjrvlNj/OsrJaLFVBw56zqM0GUJ805Le9C5aoUOf8CmO67bNBAKNiT97BKw
 N0ZKYOFNzkHUiDSdN8nQxK/rZzD4dATVU6aYtq0tOvtJoRFT+c9Ap1MYnV68j3V8kE2zeVhDdNG
 syovyEC0nwivd4+BkGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290118

On 12/29/25 8:12 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Gunyah hypervisor requires it's memory start address to be 2MB aligned.
> So the address map for Agatti is updated to incorporate that requirement.
> This should be a backwards compatible DT change which should work with
> legacy QHEE based firmware stack too.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index e705eb24160a..153916980ac0 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -298,8 +298,8 @@ reserved_memory: reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		hyp_mem: hyp@45700000 {
> -			reg = <0x0 0x45700000 0x0 0x600000>;
> +		hyp_mem: hyp@45600000 {
> +			reg = <0x0 0x45600000 0x0 0x700000>;

Losing another 1M of RAM on an often-2G platform hurts a little..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

