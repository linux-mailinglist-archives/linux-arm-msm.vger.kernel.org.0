Return-Path: <linux-arm-msm+bounces-98416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CaxGFeCumnrXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:45:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BC2BA265
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FC7A3012BF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8CC37E30B;
	Wed, 18 Mar 2026 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWGtY84O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDuQr1T3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A9377029
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830675; cv=none; b=cT3KkzJHDYi4wfoVwCEWfU1QZI6lf9FnvNCM/Vm+ChaL7rFMZo96T2HqMne5MD/HbrQD6DgcPN6Ct52fPrtgzGrCRc6r+NzXUJK5s4k82VrpmakAVcOcwrGbcXn+NmTblIb0J57VzmQVeaJgYBqSsgb1m6wK4EVwpohlB/MTjrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830675; c=relaxed/simple;
	bh=Yji3btnVfV9CCokEpyjEwbVFo5fodmpKRObuzj0tlvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WozX2BxtkTsK4On524rDV8R4DMhJRPiLopl6zJtiZciqAfgmhdfVuOTVK50T9fZHBJtppC6kUHhoxRAlkS1Rd8Na4/WIVKGKeSJhTgfX3USDZfHVZmOjKjp31PNdRMnfXE87jvpFwyaj1y7AV5b7VB108wevU5S5aDVIgibRwuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWGtY84O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDuQr1T3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8miCe084587
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9YjRCIhwbUqkLyLDNcmvuCBkcpcTL0Nhz/SwuyLvWk=; b=AWGtY84OtoJ3zfGV
	vKnPTHpHW8bVTppFAiXEHFAzjDvTNxUCoJXqXFKZYRkSI/4DBIseFFG4iF+VW56X
	a0twHjgoetrEbHkleGC8FhrKCpAwHXkmgdnW5aDUYyAFKCoNiobrIWUb+rvA7cN0
	TuGOp2NAJw5Uctzy0/Nf2j+ql3jH+M/dp7LGlinItUIyUJlgw0o4XJyJI8a49IMi
	KICoZZMBIh/V6WPvPo8OYITA3BOQxX9E5Ny32wMI6yVUlWVRmw3LN2aowPt+I6HD
	YzlH31aNjbFnH87SfYRroYDUp7WUXp/xR9g2W93lcDwIKulZzfEALlguAVtfp1l6
	LIGDtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqesv2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:44:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509118781dcso79045441cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830673; x=1774435473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9YjRCIhwbUqkLyLDNcmvuCBkcpcTL0Nhz/SwuyLvWk=;
        b=MDuQr1T3Mf1icDS29nY49eiZHSAkJ0PG4mV7zK0P0BCWZCogrz27GWxPU1Xwnb/n6K
         3WtNkZq3NOIzwpXngRnALXcv4gUn8WbSJxxCos4CMqmaklUTKo/3af16M2Vr2VIGgbp7
         Nc2oI0ggJO3icyU4EOOCUnA8jucYe+swKQcwJpYcVjjiaj2oBZs1L636RvyLPOb7aYdj
         6RVB+34lyNbuUne/C7OTqrrOeKmQPSTaX83g+lFm/OZTHbH3sxd4FYz+cfCrsFoZEW1d
         GEuyqesiabyViamnEr3XIuD2poJoJnN5FReSfhDr0xW7MCbq7IvfG5tsAHi41NIcQBZN
         zaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830673; x=1774435473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9YjRCIhwbUqkLyLDNcmvuCBkcpcTL0Nhz/SwuyLvWk=;
        b=Rcak4fzJJBg5C6VGhxp0osNHQUGafZe6WlLMca/vA+sUmfPyszU1Yv8ZKXPMXcUNM1
         EF6JxYNw9XenXfCA+T5YNIrZifL2YyVZr8nAMvf+lZcWlytuGtzOwS6SslJJ1JKBFQ/g
         peuPM6+lRL61VZEgLw8NYvajdF3Ay18dvlPm6q1WRoEKALKmW40xB6RS1QgZQt56PBe3
         d6IP7wGdH5Ov9LvhL3Oho7/hKmlpUZ/pjVdjzPIutKpZoPqcH+3RqsBPo0N+POVLbYVj
         vKFtwZ8DWb2bZ4jY+XPe9IT8+UST5AN3jYAof1NhnmNoPHisV27RgUI2K5jLHVbb9bOc
         kS9A==
X-Gm-Message-State: AOJu0YznG1LwQT1Oe9QRGKd5hckg9uHIy9JNdpUR82En270ryw2OcOjz
	5zFs/gF3VJExphIOLaCLrXStNnGkG61HaQYeyWXBmemUVOcMZkmBIvaWvXIIz+Lf7L0QX4JEhx3
	UDEVs5H7+zi9O6yg/DmrnlEeZueQiq5CKnHHpcSXd0nNstLNq5PV/im55MeHmJd8dZtAt
X-Gm-Gg: ATEYQzyHrfd+ZKXBSXFkEHrz5fhCsWHCecSVyskXydTxkrBm1TXnbqh8SHdlSttIUtd
	JfMVuwAHRkNSthqiCd72zUU5qkGEGOZY7df4JB1aVjRQz01D7M2ABrx63T2mTqOYrNqsqdZwxHi
	mGbqHKfeXJfvygr61Kdnzd2sxVnMk3PKSVp5VCrE79rEjgYhWV5dM1lBsByyUoP8zELnIL1d6PL
	+L4xBomySvG86v7ALmQmCcOAoHnduRZg3/jBLpOsoRCS7zbLHUaRY+TeebuW6Tklx+6Jw2X6ih3
	iUfg10O1wSfby94HBtU9+Q+FdeJ2p3owy4xTFIJUFqbgYkY0gvVYo1wSxVqNAF6sIDPxRG3GmPq
	ggcPsxL9nh6A99ol8x9pLtzL72fbfOarzs5deiVKkuoNPaXkP8RKUDNHP8e5A4RpTEfXfihsW60
	hb9FQ=
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr26767801cf.0.1773830673129;
        Wed, 18 Mar 2026 03:44:33 -0700 (PDT)
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr26767671cf.0.1773830672775;
        Wed, 18 Mar 2026 03:44:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e9941sm184320466b.3.2026.03.18.03.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:44:32 -0700 (PDT)
Message-ID: <f1e369a7-ee5b-4342-919e-abe541611f38@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:44:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: defconfig: Enable Qualcomm Eliza SoC
 display clock controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-3-8c05581168d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-3-8c05581168d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MCBTYWx0ZWRfXxA7o/Qi8OHS/
 nKelzZUz8FQKyYHA+H9+Tcid4fSrAkhk7jY8nRQ2tVeoAMOr8J4Li+GMADovNMmHTxKIfi5jJbN
 t9D6K3YikQ+W9U75P+uD11hmEx/lDP5mEbV4Q2rAHCxHKrcNoCQdmWOhCQ20CiplM6uLeS1jMRw
 CaF81E1ehPny5By2F04HYS1HlQbPXx2xN1iGUVvgJrTtqxPTdjupUM1Q7G/NHaqgictcIAFFqzz
 /+367IxhHVcIoZ4ZrBcaW1VYcRsPq6cyFK7ll/AR48lnlQbVWu1RA2Rjd8fpwNKjL11Ljjng1rK
 7TxB/PSbxtg/W082FfqQjehS/j/ZZA5rfdy1KdlrKC7pEQ8aT8W4uAPvkjgS4fGsRaoVOBr/eYs
 t23vJ4appCHae8ZeLtCPVFRe2pY1ZRrZstT81XF9i35hzwksjqyHoagPF/cQPrJT/8et+BghEyO
 12HRKq5e24Foj3GFOuw==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba8212 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iyqEaw9I7auMvmsjhYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4qcEqn2x1dWIY3E4DlUR04iy3p3moEif
X-Proofpoint-GUID: 4qcEqn2x1dWIY3E4DlUR04iy3p3moEif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98416-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF6BC2BA265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
> Enable the driver for Qualcomm Eliza SoC display clock controller, used
> for example on Qualcomm Eliza MTP board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

