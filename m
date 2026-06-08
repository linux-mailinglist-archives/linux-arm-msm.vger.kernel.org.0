Return-Path: <linux-arm-msm+bounces-111781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id epsVGfeNJmquYgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:40:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A7A654AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:40:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jm+rzYcW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X9GPruAx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111781-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111781-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C1A5306A991
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90C33B635F;
	Mon,  8 Jun 2026 09:35:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177C4352006
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:35:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911304; cv=none; b=T6l1bpRFeT50cKlhv+w3g7DkY2fwNA9F/ToiUgsJet9z8cL6wbV2KNuobGyAqzbHMae6SOR2Qx6WJs0QuAPC7NfZC/CrZj1wbQYSxOwhwRHGYIm76O9vsdm3IALcFmTh/WDM3KZF9rLq08puYR0mI3peAT8cv6eDhEx8u3r/4Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911304; c=relaxed/simple;
	bh=xcS8+PTdPjia2DBa+T7ce3/XFD4I1lgSgkQoFiLYDnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2odxF3kR+FetXGu7NA/5HyIXGFC0i7dFEpbfcnXORsg58aaNVjjZRsOjY0rbMHhmx3zedE9iLddRXW1RSDlKUf3TfciwKXT+di1KabLe3sJiZuePwzqvOGKrrLGIiVzZbx8ySwKz8kstwvXXeFTPAlB2Qq2gAwd2ibadJaN9Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jm+rzYcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9GPruAx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Qrsv2771578
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=; b=Jm+rzYcWw424UMaf
	a6G4DrKNHyqLC4QeZ+4mXROqjrbFBVZtS4hqLHDHXjUaGZApYU65UUvBnUKOm/tn
	Y+SS9tLch7/LWzt+BLS4+V2eSJs/u1vX5uJPanOb1LFxNiPERp3833DylOPUpWyV
	SoGB/HgM5EjTK6KoK+3tssRvbNYvO7pVtfZmjPiqKv01DCtDgafQLdCtTOXXBvjT
	fl/YHJBDE9mh/pFM2KxCagQnACXM3+N1x4q7PULVm9VI/aWQP0f7GjQ9Tr7zzoSr
	WKBHpndHgqNF+HW5T9HRU2KQJ4PkI4QcGrzJKcCAhw0D2JbJr53YRQYujVW+QCEV
	ZOIjcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6f1xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:35:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ac43d27so11530491cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911300; x=1781516100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=;
        b=X9GPruAxihhoxXGGQEGaGG+lSkUWUMcJs79EMowaWL1uW8nsl3Sj4709WdHaaMozLi
         EOAXFO8UaZrpmbw2g41H3JFDvOdD3CsvV5K/qG+WV4s53OIYTf8Z+Nk3kNaus9eud+k1
         faiOCr+/povcAzVTK6a727wD0rX7H1IAdRy6yYlKQVhw541J1Z1Hse582eKgiKAukKtt
         yG4xhcekpPEEf8QWmq5oMVqd67v73yXKbEZKAYmG0rPLbBXS4b6OG+y5l/UO7eGbB4pz
         kbtDWe3vZPhDSKk08q9p/IXqsiI2riaQHy6h6AFsYt6r5paQOm87fe6xCtS1lGVJnAy4
         F72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911300; x=1781516100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=;
        b=l443qwCX16hhFgXsPhI9JophDN9ByMqh7RVoAr9qypWqqvnXnwy8x7BrZna4Fk49fJ
         Rxlb2wDJ8GnICMewNVWSAzPhGOS7jTj272+FkzYXSlJLcbGf77UfW/HONMcWPVmxL1so
         YgRRc/EGehSS/a7/1p1mu40E9qfjq+6Se3k61ZMeTfh5Ay3mByCiGyMnKyjLMi3z9g5Z
         Y+Z1ow4R3jX6rYE1YpAMnVjBkLZeVQi+LUR/TdUCwk7RLgR4tRL7BfzXR4BFHDltaVG5
         n6QhnR4ffrMkhy8DZRD4NHSsGd+0bdhyUaXAm7TMU4CPz4y59VJw9Q/IpBg7MgTANanY
         Htug==
X-Gm-Message-State: AOJu0YxHYRxf/OL3OHsv6RFMkSuY6oIKroYBGs3oD9zLPOvZJGOOuwgp
	AQtSTceF9mpwLZbMQqomzld4qv5/sbDfC0MwJiu14fOeaxlBg8G32GiBwzXxdgB3y2OSw2sbG3a
	igU09RnsVqL6WgiiocV0eCqF6lcu66XW+c+EcVKjjsou4xlWFbD3/HlZPh3VSEa6q13j0
X-Gm-Gg: Acq92OElHbCRjDhGetdcDQclxBogbic1AFnMTzV9OvSCPqGiqtZb1bu/cn/eAqudOR2
	izI+luv30SnTFH3pab2QJJWVgJmmJJ3k1yCGyxK/2bUo0J2Ok5FMMonX/OpomiI0HkK8ObENow5
	cexvbBbIh5EYJlYyhLLKK0mCB4DiNG7VenF7n87w+guhfqbPxg1v/kiC/+6eSQTqj+JkOy+dk8S
	fB1cLl/CjvhmfXWvyLUEF4/RyXkyeyC0/RJeh1S9Lkv8fvRFnoNePdVMBw0LkY9yLiJjNXgmGiy
	9Z0j1ur99BhPOYSkVvOU9gIsuOEhtlQCXw50tTQuZhK41pvGcZLNzDYFmdjGaJrhIU9zhdc4P+g
	lDD0qGUEeL5ChnGtts270taGCn/DkGHpkPm1PJVVUY32KB49DJzm4Na8M
X-Received: by 2002:a05:620a:6486:b0:8f3:5988:f97c with SMTP id af79cd13be357-915a9d85addmr1243695085a.3.1780911300329;
        Mon, 08 Jun 2026 02:35:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6486:b0:8f3:5988:f97c with SMTP id af79cd13be357-915a9d85addmr1243691085a.3.1780911299749;
        Mon, 08 Jun 2026 02:34:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm838592466b.52.2026.06.08.02.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:34:58 -0700 (PDT)
Message-ID: <a5783c4b-abf6-421c-84cc-b7b565d37fdc@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:34:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a268cc5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bMn7uSZEEfIJnIPTgxAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4OSBTYWx0ZWRfX+jSQE/WorKsS
 PZ3treSUtC9D3pjaI2hOKbWyfoEQ3mxDMYntZ6eotrgcGMJjkZG66nRYAhZkH3meYjrBB0NGinh
 O9Rjg720hveS7jLLNtjQdpPFEUdD14rh1TfiW3kczM86M3Et5tEc5DPXksgAUbsGPYhWSpPl3gA
 NLrzTNNG++2po7jW1mP8DZxfpUPhKmWLrfCcVgrXCljIpZWhalzWXxmM9ltASUpOOejfENChDIE
 TYjCRBCez7zBSFAYpHBA+kW1YxVNyq1+0CyHHsOiyO6bfu4X9HB3DkL3cc1mUrwWfrqFjmSDZuO
 kjj0zHDxeJkEEWcksrD+B61AXOWvUBHV029BQEOJ1MjJo7Syt8nucb4GlBNDJz/pVxxxc6uITt0
 YWjDOOLBS6IoJmUVRrdGjGCCaFzIjVkIegiJFKj0QiG3PMDc9pEJLedkY47U1EoA54/UuiVa+1E
 BiHnhz4jUtmwxlXUYTg==
X-Proofpoint-GUID: Kw7cTI5JRFMvv0fYbSL6Dy4DXJBnTjqq
X-Proofpoint-ORIG-GUID: Kw7cTI5JRFMvv0fYbSL6Dy4DXJBnTjqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111781-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,google.com,gmail.com,holtmann.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:qiang.yu@oss.qualcomm.com,m:jjohnson@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath11k@lists.infradead.org,m:devicetree@vger.kernel.org,m:brgl@bgdev.pl,m:linux-bluetooth@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5A7A654AB0

On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
> The recent suggestion is to have PERST# / WAKE pins and PHYs in the PCIe
> port rather than RC device. The kernel recently started warning about
> the older style of DT. Modernize DT for SM8350 platform by moving the
> entries under the root port device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index eb2a795d8edb..136daa444865 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
>  
>  			power-domains = <&gcc PCIE_0_GDSC>;
>  
> -			phys = <&pcie0_phy>;
> -			phy-names = "pciephy";
> -
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -1596,6 +1593,7 @@ pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +				phys = <&pcie0_phy>;

Other socs put this between bus-range and cells

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

