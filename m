Return-Path: <linux-arm-msm+bounces-96985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLdkJ5VqsWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:13:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8352643AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FDF73068221
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C46E3016E3;
	Wed, 11 Mar 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnCNtG0M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIYWTTZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8E302753
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234448; cv=none; b=s8DTe0TwzDjLL3yNtpI8daS/eMlqHdiUvdKxFe3k9prZnq/vv6zUN2tvvJsSHQsqZWFb+/7GNQnfydozg/ZAKLkJ9dbM5xAwccyuBXl06pOer4i+VeYGfXZif++Eabpvg+jj//x0SY0G1ONkeVIBSQxJX56LeyRkL5OBgCKUWQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234448; c=relaxed/simple;
	bh=fbjFeQKkf3We9Z0zCyJZjbfjHVJDOCBeDpY4Djg3y4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHZ0OefH0BOBiTdhXZ0eWK2kk5XUmJ90szA0a6RelmyUx7szHLXBgTS3HExaQHNAbRxKM/bYkjDQ2KxGOGyGznrlRI0GDn6uDGYMLjJAJIhuYjTmkCxC0idu820VRvuV4jYRJQU0Wlpo6Ms65INkL+WNzO6/xThI1/OltT21NcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnCNtG0M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIYWTTZx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5jpE294464
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFGqFcju/HBfaEF7ZbKNU4HnJrp9Ga0LE8bLG/xknuY=; b=AnCNtG0MHmyRgtB3
	3PMNfUOyZ2r2xET0T2DicxSvHIlN1kTzx6Zpc4SnpoXk0bH52ZFkiMxo7Tmu+vmO
	hy1eHEHmWWnG/IGyyBxEsRIS91iAnvZu0hBPjWEE/AUcaHbpoPHNBguMtzytd7Y2
	dgKLKA7nMPqtOMugOUNTR89VuLY4i3EfKFwiQyY/OyCHfB5H9DlYiT7C0EOnIlk7
	L98ycHBTxudJ0xAnqPRLluHupNd61O6sjD6JI+KDp4aBqIzPaE1dezrWc9z0dwYZ
	n0y3Pj3Oe9CYbUpBbtu6S6AFVI75f/ljkAKCHhCCuqo3z4WnHeVBIKxlSvCBoJCu
	kLTamw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb8kru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:07:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94dd01082f6so1661949241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773234444; x=1773839244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFGqFcju/HBfaEF7ZbKNU4HnJrp9Ga0LE8bLG/xknuY=;
        b=hIYWTTZx+GuEgYVa1u5bskA2fDltGXY3mxeYf157WooXozjtKbSQJcYXBztQN/IBbo
         xql71rOV3Gik6gCkv81HA3LsscmEXv1f6qIuKRPns3UCT3te2BkoJkh0eU2Gyaf030Rl
         XzjsAO3PphcfLNwKbNIMKkLqgxmycTUlKtt90T6x4U1SjZbtz1huOAbfLGIrzOEM6lth
         HFJqPSPmXE7Qduyv5imXQcLfyaxVwIbCvqGH8GN2HZylrOZnVE9xOvY5xT99JhoygNKg
         KDBnnSSLAaJ7BwUi1IChSDdbjfsq5szobUYp/DaS3pkpHqEGE959Hix/d72HMACbS/W5
         z8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234444; x=1773839244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFGqFcju/HBfaEF7ZbKNU4HnJrp9Ga0LE8bLG/xknuY=;
        b=RVS8J/70JUP7bydZz3TLEAgmfv0VVeTGkh7zA3oMZ4sZ5wNCM8/V6FFv7StM3ZmUtN
         ugZ20z7OEm2zT0XMZPoLdq1tZPxLXXSsZd5b2NjL0LObkPMPP8AxcDNiesC9c7SnOPxz
         9Vaoig0FdFVpwgT2Shfj4C841dlr2Z1MwW8aICtRC47dqxOq/fyFplZkvElUlkK5KbSh
         wIYNXcvL3fapxV6ojzqnzdyUx8XNHeuw/bODq3cLU0bzRRo0vOW2s0pMdaKl1LZpyvsX
         K8OCDBH5MG3rYH2505n5YbVQUqgWXL1OYk1x+co196ZzORaEBefIaHxij8azAgRCZZMK
         au+g==
X-Gm-Message-State: AOJu0YzcLFdc64jJ5erYIIHJniY0YY/X0QiVslR9ggwooCNFuk2697vn
	7jrBsBu6adkJrfJnrNPPUeSeOgftbI8AVROb0Oseru5WeX8nFwHK9p1QYx0IBMgTGg27A9c8nuI
	vpwCV5ErbsfSz4yotUPADtSxwDlO9iEeV88YGTnDNrEo1Y6bj1aICgtV+rxng0aSLRoe2
X-Gm-Gg: ATEYQzxibp2e4G2J/3fyp5Cci+4MEh+E0gw+ctt7stVBCH3oCxOuXWV2ab5995oViys
	fXWunPL93DQXePHo8yHnMLqy5jCnsxk5qyPOMWtilD2lSW8Bz0UncAxTwJVHDkp8fRdCR+PuTnw
	NzDoYftEOHKuTEKxpyUosbotk2WU/RrKrYXOdUqgqIci01h0luXulwas7i/GSlFC+B/GrHi9oXt
	LnqVJS9qewgQif34ulNhSeHJ2rn66+zVctIFqm/+1WRWgwKkWvUkoX5QstY1ed3sI7Y7re1TuSs
	XHraX2svX7A4SeorIG3Os0Qi8E4sPVaH3cOJ3E0RRJUqatEx1yeoiDepFjMogrlysJoWCl9Cv2h
	j5uP8ZOAN4um+lrpDoLt37cs+dsy1+RD9ZVU6TYZWJJTBpPNIuZs+Ff9EyBOw91Y74EdlXUgJk4
	BP0zM=
X-Received: by 2002:a05:6102:94d:b0:5e1:8746:85ed with SMTP id ada2fe7eead31-601def8bf46mr421407137.4.1773234443747;
        Wed, 11 Mar 2026 06:07:23 -0700 (PDT)
X-Received: by 2002:a05:6102:94d:b0:5e1:8746:85ed with SMTP id ada2fe7eead31-601def8bf46mr421391137.4.1773234443277;
        Wed, 11 Mar 2026 06:07:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631448605fsm521124a12.12.2026.03.11.06.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:07:21 -0700 (PDT)
Message-ID: <cffdb8ab-a293-4535-860c-378a4b8a3d33@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:07:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: support Bluetooth
 over both USB and UART
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kKKkO95shSajz92JmFi0Ae1NyQ-YoSDe
X-Proofpoint-GUID: kKKkO95shSajz92JmFi0Ae1NyQ-YoSDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMSBTYWx0ZWRfX49NdwDK+PZpD
 S77sK306JVFhfSgl7PjDyL/34WQAL/96/wvdB5S77Yx38BulBpcu4dPxyxxgtb3kjq6PIc7VxDZ
 5k88Z3Rqmfdq0Ht+0cqNaQ7odNMELgyHRoVNDOrMAaWHRZGJYJDoiRQP4AyAp9TMTlwszZwswwN
 wSaOU3xlJQzwWY5qXz2p4SQ/hbHDXdU5a0v5jl/UQQgAIXS7jhHkc6SVjMjmgPf/vXhASTP7ZPN
 5vIP90NziXL51RagIR080YVdI67Qbe01LJzDztN68H20KxCIcSkLkTItHCYDEZWNISowrpvo4eU
 U/cNXH683N7xj/1bWqemcixll+0kbzH6zb52CrSPFBKhF1ivavAo6cvsI0ee/bPr5pmnBV3eZGV
 cMiJn7hI4+9Y3hx8umjaAh8FcBkHN7fFJDETEAmX5PcO8QqTb93zh6bjsUVEvIT2Wrf8kSpcmIE
 t+PDH4drZEQnDw858/g==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b1690c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BgJLFjmsKqNP7uD8e2MA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110111
X-Rspamd-Queue-Id: EB8352643AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-96985-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/11/26 10:09 AM, Shuai Zhang wrote:
> When Bluetooth supports both USB and UART, the BT UART driver is
> always loaded, while USB is hot-pluggable. As a result, when Bluetooth
> is used over USB, the UART driver still be probed and drive BT_EN low,
> which causes the Bluetooth device on USB to be disconnected.

Is bluetooth connected over UART *and* USB simultaneously?

> Configure BT_EN as a GPIO hog so that it is controlled by the platform

What's "the platform"?

> instead of the UART driver, preventing BT over USB from being
> unintentionally powered down.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 630642baa435..60a0b3ecbc1b 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -647,10 +647,9 @@ wcn7850-pmu {
>  		vddrfa1p2-supply = <&vreg_wcn_1p9>;
>  		vddrfa1p8-supply = <&vreg_wcn_1p9>;
>  
> -		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;

What if I want to power down Bluetooth now?

>  		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
>  
> -		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
> +		pinctrl-0 = <&wcn_wlan_en>;
>  		pinctrl-names = "default";
>  
>  		regulators {
> @@ -1398,11 +1397,12 @@ wcd_default: wcd-reset-n-active-state {
>  		output-low;
>  	};
>  
> -	wcn_bt_en: wcn-bt-en-state {
> -		pins = "gpio116";
> -		function = "gpio";
> -		drive-strength = <2>;
> -		bias-disable;
> +	wcn_bt_en_hog: wcn-bt-en-state-hog {

This name is illegal (make CHECK_DTBS=1 qcom/hamoa-iot-evk.dtb)

> +		gpio-hog;
> +		gpios = <116 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		input-disable;

This property is not allowed for TLMM pins

> +		link-name = "BT_EN";

This property doesn't exist

Konrad

