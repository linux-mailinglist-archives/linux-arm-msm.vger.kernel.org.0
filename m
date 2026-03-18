Return-Path: <linux-arm-msm+bounces-98447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H5VFyWQumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:44:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE32BB017
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43C3F300D4DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D2F3CEB88;
	Wed, 18 Mar 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGUaYhA8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gc7KNHEr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235CC39A064
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834273; cv=none; b=HO0EPTKqVwvuL/Sc7Wcs4vP1/hRIBxcI9gc/+VH/G/IVjZ5LrVCv8qvMLzvWnTR+xiZBphYEVmEnNR2js565svj8ahI9gOM569XFcdzPEfxmz/0tqAu5KRX7R2+N32tN/rusOct/xrTM/oIx8xPdRLpn1BaakI8kyo4jV2xHCJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834273; c=relaxed/simple;
	bh=9L28kowxIIemfNyOytDxHCf7inashgWwKKT2MHSuFb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXVQsgr6vF2LSN+qaNgDAx2uA207fq6khUHKJpzEZCkIxT8Ch4BXmNdZfxCZaMQCUASf8NJ8flEV0Q0AoY9oDEyXS1IbX4InfypF2yo8eMzIWdOkqtGSazvGIqFZXlnA41dUM7cchlSEEYjOfD7gtbUFhfr4flOOvRzG4VuUvO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGUaYhA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gc7KNHEr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8n0xj084720
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=; b=XGUaYhA8U74U/fH5
	H/XUwF9h+GQnBI/AAp3/r3Wh0KFhUZrOW3SsK6ZB3GkJCbzegUW7p3MbeiCRaa07
	Khxv+wEta4tK1q2D1/ZBXRWpUY/xWUx/SZh9/SLNgyxIW95JurUGvD6/B9Dc1JJS
	/0vwehpzjc85CQYRt08VgsmZPPsvJIA6Kdt5JfTRcYJ7UX/YiRxF6f4ySWPx8Ig0
	UJgJlFtL4JN/Gv7XqJseaJRrp7fzAp40WQ4CKNvTwQM+sT2PfKRVgxcdSvQ3dlLm
	PwZbUKdJ2aBUxdSf+xIz3xfvmRGn5RVHwzCa/Y0Waek0UQA2r9rRKMhmotVDSaYE
	vAaaaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqet2bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:44:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509118781dcso79570241cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834270; x=1774439070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=;
        b=Gc7KNHEr/UTxDE6WDbBp696CECf35RTrswlwNrtMPXjIX0awFgiRoe3iWVP7m/+lPw
         REbdc0kZQNFKaXcwP/tHwm0TaIpFymEfg8V6Rgz+Zs3QwzHG7HbfU0McuXC55lS1BOs0
         SLsgxzyG9eeJmAY3lGbmrBmcypzZxs8FD3lC0mXHJ4XS50iOe1/CRrSTkUDjOtF3iINb
         KEAfLGZ9o/HKfYPl81YEJXYvCk4AzuVQRH6GHNwYbRz3oj4RN74JdZWw3ltrmVpcAEop
         /ZoK7tVL8tJQm8M4YvIRAyNLyv8wB3JfWmcNIsH5V4r2XsVE4vy4ZTudo1jKbe8fMEfe
         yn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834270; x=1774439070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=;
        b=SG311vS66/vkngfgWxrtFdQkF/DRTE4uzQ4t8oYQMBxPzaXMFRSFtkC0svs+vR6DKJ
         qg3+RWGgjP22CNt6Ra3BPYkZ1SW7+dPdqWZ4db2hC9vf8k0bOYDSX+tdbok9WaQRUDA4
         UsCbc6Em61uifemDrDpXjRmEicWsDl0YdcTesfqpgwuXGRiufPkiqTlsHEvk/sKqU7pU
         w3CcucQCVrRJBs0wT5CoayWYJv83ukxJwZRxdH2aQrXOf/ALB2/u8uZDmG9LLYmhjkRS
         LosT3WoQt6Agl456L2B4jiW+qzSI6D71s5cwZxJTq9HdTBV76qXnqIQsdog99gXAdCEc
         +mjQ==
X-Gm-Message-State: AOJu0YwiJpmR+iynzZAMR/8CXV7MECPIGBD1hb1ijLq2YdnAJR21mCPQ
	ExM9rIHhrTwCyBOmdyUcqA0UMir0iik4uB2fgZ3jP7cf/Lddct4pVzGHEuN90j9ReggOS4K2hmF
	c8fa/uTSwsHCm5VlInw6WosFgxaUoM2xJkxJ15PLrrhnD4Vf6zlprn6NcClF9DinhoF05
X-Gm-Gg: ATEYQzwLRNdxevZuANgnLjWVC20/11l0ZYBOftzz2488eyRpO/BfXaHl6/9sV8gCgiQ
	1LI1ZcbmSLjhhUGhD4r4vAu+3x/wWAhXa6UXRvbLs/cKg3FS6dvPCW0MDmZ0X+2Cgcum8rCXZ5C
	XFMbsp94RrCmIqpsmULWdi/0NkTaiofbyevPOE6IUNlabKYJhMoXEmI2CWpazKDHrez9cBpi24q
	+UV9Hs09DrdyLbFpn3VV3D46qUK121gbKQ9HcBOx/ebrAWkUtgo9os55kRcJ7GFUep3jijPvBUi
	3lym8llQ6Bv+h5u0fYA0yDC9xD2Tz9zspO8hYSeelwdDZdyTXhhri7DY77eCyDgQrPcQQVoiwBj
	Z9/aHaz+99cwuryhMFKNq8zii5AS1y23mXk9pgBy46i3Wcq35UAFpSA0diwSqd9njkxZ1vjgEdx
	EriBw=
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr28548301cf.0.1773834270530;
        Wed, 18 Mar 2026 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr28548091cf.0.1773834270129;
        Wed, 18 Mar 2026 04:44:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e83c8sm187232666b.2.2026.03.18.04.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:44:29 -0700 (PDT)
Message-ID: <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:44:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX8gmxws5YUA+n
 0DtBcmxnlLZ6qTuz3YTKlRYNMph4EkpHFckTzJs8GIRtawa2a0sWqonCiFErjrTQdGyaIxRPeY6
 MKxC1W885OQiYkPOjIUHkUvnDdNBEIS7QEnOD5ez/ABuc/XCS0zX6FMNPf8wn3uj+ocjBGWz22L
 QETyFhTSxGWYVRdWws79SZsdCYFgz+yhUO6wiRkS/NIgv/QzfQDxE/ObJL/CZaWZj9ieW+PDGOI
 ymTh2A+JbmfJ+/hNL2txLraHE+vRSMsfUt17ByiyNdTV4UZ+vhy6SYRa6fnlk34jntXQAd/uwws
 ppkERjusIOZCHkUnBYFB6dVdnJ5Hdk1r6ce8ATFyF5AL0agb4ZRsBostT6n3o4Zz0fbHQVdthcf
 6czV2zNDKUHVdrlNq5/fhocC23ep/1NtffIIvtLeh63NSQITxZtzGU+y0OrIpoxS8eEegcaHs2L
 ib+WQglgc9F6j9TpfJA==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba901f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fu2ZoqZfox1az8yWQm0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TR4l9zgggQOzPnnKh9cXdJaQK7rnW2N6
X-Proofpoint-GUID: TR4l9zgggQOzPnnKh9cXdJaQK7rnW2N6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98447-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,b120000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01DE32BB017
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 9:39 AM, Kathiravan Thirumoorthy wrote:
> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> rdp504 board.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +&sdhc {
> +	max-frequency = <192000000>;
> +	bus-width = <4>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	pinctrl-0 = <&sdhc_default_state>;
> +	pinctrl-names = "default";
> +	status = "okay";

nit: Please keep a uniform \n before 'status', file-wide

[...]

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;

Since we have PSCI, is there some sort of cpuidle?

[...]

> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x0 0xb000000 0x0 0x1000>,  /* GICD */
> +			      <0x0 0xb002000 0x0 0x1000>,  /* GICC */
> +			      <0x0 0xb001000 0x0 0x1000>,  /* GICH */
> +			      <0x0 0xb004000 0x0 0x1000>;  /* GICV */

let's drop these comments

[...]

> +		timer@b120000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x0 0xb120000 0x0 0x1000>;

Please pad the address part of reg with leading zeroes to 8 hex digits
(i.e. 0x0b120000 etc.)

otherwise I think lgtm

Konrad

