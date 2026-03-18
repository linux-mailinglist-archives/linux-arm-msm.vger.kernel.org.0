Return-Path: <linux-arm-msm+bounces-98460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFRmO5qlummaaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:16:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F21E2BC08C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BD80317247D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28833D75CD;
	Wed, 18 Mar 2026 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jz3XS10m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGdm771G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7DC3D75A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839587; cv=none; b=sAhtEh36ZEVDGqqWZDDB0VHjgMVJLSeDVmw0f9AKD7JN4wCuezDEnXmTVKUd8ZJsAywD+Af6cFKJBIRmvVXx0HDGLOFhkAKZos+2ACV0xH0bMJbz/gEZxcTsQV5sghJBniDO+5QlXcOM0xpEPTKx0tt6pP0cZNJws9BnVaD1GD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839587; c=relaxed/simple;
	bh=+L9vOqSjiO9a6O165CuZxAw6NKrb8imiDto6ttLiloo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoUu4k8Jc04TplVu9Qeqqf1Nxlhq2tK9hGoSUkf7Vyz9sWFNsMsfB1WMsIvRTtBgibtjFUy3GE7Tlpqf5YvS8B2AwI7POCmLArstolc71peDvzhXT2eEhY/29CXjO8mmnSbYkNY2ScsK61WvYsK9ApSO98o+5KAzEIe4ovuoSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jz3XS10m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGdm771G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICBVBr909242
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=; b=Jz3XS10mK5iWpAMH
	IZOP/Ga9BaythitcXHYA3vN0cyT1r2vfujIy5BPUxHtRuFWfr6ffG0l2k4DOLCY1
	ZWjTGIrIQd75Kq6VlUln45zEZwsuJ7KDKmOteYAn30JGFOJUVGLaMebWdeBRknmr
	Dimqnhhht2vownssAYk5s6br/zRCWqURZY8nS6QxRJVMgnwIi6V7liAY4J6oqPc0
	/aMD9LIGihe1eNN7qRTJg+PUl+0wVv3+YulN16ZaDlTgFOJWgYKb+X26qPN7W2Od
	TVmxKbSfbrnA0CiBuG+iwZqaIrjJUJtDks/tjO0Ka5e/vA70eOxM2NT62/d8zYW9
	oVATFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyuucg6y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:13:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b06395b8deso29623025ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773839584; x=1774444384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=;
        b=kGdm771GAL1UMY1qjIKsg3GRCV22r1rAfOLE3r2RthxgTUjbTWQrIB0kE/2DaCXMTs
         xu2Uhwn3+QkMNL0aDj0GvJnPardbnwOdEfv1hCaD8CIXx6KHrHInE4ynsm47hPv4kICp
         fXle0+Klzp0T8TuL4gzh55TUmYh2oPEaFlgCsbXOeddb6mtVtUzeBZQlFenpbA9goJuc
         uXIv2hFbR1hBXc88JeXIcO+GoF1B7ZfieWIjr+IxqveXRtugvYNbggr372n5nGsTNtj1
         E2t/fJkcAEn4CGkxiFnTFjpqsIdPZGB0LLfM7z26e4rLcFhAPv2VW3GodSqvh7mtjcL1
         xZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839584; x=1774444384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=;
        b=NyTyiPL0gPuZlaxPgNjZgCSGPnR7TnoxgWZ0opIrbq81SF6I5oaKgnAjVMqoEpNjCQ
         6CYEFPokPn2DNzqtbhZb2aFumydVCX2HmSgfgS9DIIjqFE0eso3gAHqkYz+64UUi4oO1
         svKFkfINJgTPBWbxrW0UiIT8jPVFRwliGes9xypiBVAs8s/gDDiD6hOPkZwQ/c/Y7J3V
         wUe+cJJ2l1DTmjtZQRI4RDqsuWMh4UdovtvCtiOtLJ04qJI5F0b/UGGuwiuSMRFB6b4/
         j98Tno6b3qmT0DWNND05WAv2HdK1DDr8LwvfJEG5cEeOfWBDn96UhGqLPPldx8VxBjha
         eiyg==
X-Gm-Message-State: AOJu0YyNIjT5V/xjylN6L4BaJT/O34DwHw8r6wkr/hpAUqzTWfB/+smh
	ZvJI9HxQTv6DIfIbr/eWmWmRBNhzXv1p3X3GybFik6qq6Sahku4jfmDgjcRnbCR9ec1THFddSU2
	ISv+sFXddUxCX4jUhxYn3RJj+4JPvJuqhANVHBIaclQfaJ2w9fS/Rv4mlRALXrokM+nTQ
X-Gm-Gg: ATEYQzz7rp6HT+WGdS7TISBR+0880ud/2CYrGZu7AvyhCyeEfqIWqcpfy60sAhKhY4d
	wOOSck0mD8J8lp1CkmAW6t/g32D3f9xF9TKxjEGJaMJ5wS/9yXinn0fDEwoWoXiKjZ+cukErO7m
	neNY+t8eK8TjwW5Dl0kwv/GYtiqnyWGj6OlgJuh86I5ysi1HbBq+OqyKRW/Oc4PUF3coORm1pPW
	b10jDWQOi20TeUfs+DZjHiZGBSAuNxTNHPwv1oioAW9joejuz7A8YmkdqwSHIY6hLlfpslPQN3E
	oIt21vdgoRNRJ+4xTx9DsQScBIfuZ7adOYgNQiNASbINjSUePb3ynBQy5izB/eQVyEgZKRuxAdT
	5/W7Miol9y2xwuQgIp1f9YMme0/PDH1z/TTcRv7CH9OEV9jlC1oNLm0Q1AUfDDzOz6A==
X-Received: by 2002:a17:903:2f87:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b06e35b4c7mr33140675ad.23.1773839584301;
        Wed, 18 Mar 2026 06:13:04 -0700 (PDT)
X-Received: by 2002:a17:903:2f87:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b06e35b4c7mr33140445ad.23.1773839583794;
        Wed, 18 Mar 2026 06:13:03 -0700 (PDT)
Received: from [192.168.1.28] ([122.164.82.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e44a258sm27444125ad.34.2026.03.18.06.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:13:03 -0700 (PDT)
Message-ID: <11471fb9-a862-41b9-95d1-68ddcca5b7a3@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 18:42:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
 <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
 <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tf8tvFW8onRBZ0L6KPevnqiBZxYRXEUG
X-Proofpoint-GUID: tf8tvFW8onRBZ0L6KPevnqiBZxYRXEUG
X-Authority-Analysis: v=2.4 cv=U4ifzOru c=1 sm=1 tr=0 ts=69baa4e1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=x8XZtM9IcEPKAfKvXv8PGA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=onala_4StLzjsFYz-ZEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExMiBTYWx0ZWRfX4UR2SaDEOHud
 9OpIhzxX/2uU1tbIbU7ndRVy8hXv6jDbwBSbNuktPUQ7fNG/XZ+9vMUFsbQGL1jLhlfGSjp+wz8
 USaSv79dSn6YNrPZ70kb6MLCErvJAbUFvILCv0hoo2jhML3aSE9CfXsD1vEJ6cnIwWKwvz3u+2f
 jKmj5h6u5Cj/YiAP+gQXd26pV88/UGt3YQ87Lo0rDS186O49hxbLtGUSWrTiNoQXY9UFPeIiobv
 DJQYvHCEXpqfuqeyrCeYZcltXRu15A3QiFVu0dVVhpNFvP6PT2mC/MJToNkhiAQ5794dG21Z+B4
 2pNwg5SFVCtxxqp7bRHwxt39nvH9IIA8GKpnHG49xaJc2EYQ7ug+/VwAQPQT/f18bNNuqcwYeGo
 9gWMWssYKdpZyNEUdKZJc5gCbzNqeWck2BMbNFFxF3ZDR/dyYlMMZ/tJAbYUYB0m2NohjfJ2XoC
 tWDn5/gKf1pQn6c9eSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98460-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,b120000:email,b000000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F21E2BC08C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/18/2026 5:14 PM, Konrad Dybcio wrote:
> On 3/18/26 9:39 AM, Kathiravan Thirumoorthy wrote:
>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
>> rdp504 board.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +&sdhc {
>> +	max-frequency = <192000000>;
>> +	bus-width = <4>;
>> +	mmc-ddr-1_8v;
>> +	mmc-hs200-1_8v;
>> +	pinctrl-0 = <&sdhc_default_state>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
> nit: Please keep a uniform \n before 'status', file-wide

Ack. I missed this to take care in RDP DTS.

>
> [...]
>
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&l2_0>;
> Since we have PSCI, is there some sort of cpuidle?

Yeah, there is a plan to support but it is under development. Once it is 
available and validate, I will submit the incremental patches.

>
> [...]
>
>> +		intc: interrupt-controller@b000000 {
>> +			compatible = "qcom,msm-qgic2";
>> +			interrupt-controller;
>> +			#interrupt-cells = <3>;
>> +			reg = <0x0 0xb000000 0x0 0x1000>,  /* GICD */
>> +			      <0x0 0xb002000 0x0 0x1000>,  /* GICC */
>> +			      <0x0 0xb001000 0x0 0x1000>,  /* GICH */
>> +			      <0x0 0xb004000 0x0 0x1000>;  /* GICV */
> let's drop these comments

Ack.

>
> [...]
>
>> +		timer@b120000 {
>> +			compatible = "arm,armv7-timer-mem";
>> +			reg = <0x0 0xb120000 0x0 0x1000>;
> Please pad the address part of reg with leading zeroes to 8 hex digits
> (i.e. 0x0b120000 etc.)

Ack. Will take care of this next spin

>
> otherwise I think lgtm

Thanks!

>
> Konrad

