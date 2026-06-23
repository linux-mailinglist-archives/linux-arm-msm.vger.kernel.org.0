Return-Path: <linux-arm-msm+bounces-114192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id od06EIhxOmqX9AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:44:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C7C6B6D22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:44:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F1BCHQUo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Aevswgcu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114192-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114192-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 924D6303CED2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199E63D45FE;
	Tue, 23 Jun 2026 11:43:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697D03D5227
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:43:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215036; cv=none; b=S2Myx9GXg/uYBsYCSDnrskOFaID3WDhTJjqfn8UMUSpqgy7u+/75CAvPx8s24n/c2Q02/qUbtAGiAsHU7mhEDszdkZyX4uInwB8smMNZb+4nAt+oombJ+YvNbk+b64wnbsTnMtNM/QZo/bmMDoYVtZwYK6zXfps6JV9YJrRgd9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215036; c=relaxed/simple;
	bh=9xbBXXxIqa56/q5c7t8r4Zk0YJeO+xdElWD1RrJOVkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cZtXqnL5ehrWMvqTKs1+FGfZYgSP7YRVahlK1loOUJGVaf7Y8H3fW9j7wGX67I5kzPrsvHZJ6UY90Cb1LzuxWdEmy5Cs7aRgRFuLmmlgj/CkxUmSI5q5jqM/4BEKNpAcO/Svq0pdbS9JDYdQRL+C0k8qqT1X4jCOZtANzJ3tIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1BCHQUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aevswgcu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBavYl052567
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rv1hQEHAcQj6Aub7u6JH8fJsjCG1ILRkkbQwG0SXkVE=; b=F1BCHQUoyV4k58s3
	Np7B/Oal9LrUJem+nwByLUoBVzOCF6jeabLp8C+nNeCfW1mfpRTuzX2B+SP94OQr
	sRrk8NY3m2cK+dpryb4lB+Z7iOG39dI8Wo+MGNFqw+t9LiKlxVR5FBsUUzDfEoYj
	ltP9e0EaE2NCSihLArsXBcB2Z39hLqn1Pu1blBET1QTEpp2QOX0ZxLMW3dq2SIaj
	BioQDUa+/GoWgF7F1fLExLUx4lOS7x4bQdvMrxBytHoIHrZAwnsQBrU4lRspAYoe
	ksA4WVc2vH3F9SrVFXlOKb2x/Rp96JcNAbNARmcyYTCNYayFQz01czRiNbctitJa
	58aj5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44jqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:43:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-519fe742290so2302931cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215031; x=1782819831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rv1hQEHAcQj6Aub7u6JH8fJsjCG1ILRkkbQwG0SXkVE=;
        b=AevswgcuOWmdFl3PA8bZxt6RNnM7ukFx2bgJD/C/OZQH68yYp67jsN9b+VQ1AKIJmj
         EUCciXYuZvvSeguIWn4ccDI/okQnYhIS8XerMB9b6zuWN+MtUIQrkM7MsCi9C1ku6ueC
         diyiQ1tIrhaBsaENJQHHiCGpRFkRQ6/oDc85BzLku+fnqi8iXdlMEX9WmvNQfJbAIl7H
         N+BF9kIieyflxd7xbcUd+5/qVavIIKY6zXgCEO2MbnNhhyFkKzmeXeWFhELVkEVctNa3
         D1+1yFpbHgF9tAE4IoXksqgPmNCUAo/pFBYjRwTzTTLnH3rTNb0jLFgxYN7kwyVqNdwq
         f7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215031; x=1782819831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rv1hQEHAcQj6Aub7u6JH8fJsjCG1ILRkkbQwG0SXkVE=;
        b=IbKstZK4BPhNf+CvDy0L/fd6HYjMejZoTvmK8/qWiI4w8SUNAgnimcB0JZ1ZhhvdB5
         cdas8rl45JD/JlHOUVRYF1S5Q8SGsWZ5tXVRhjsj/0hS2O4HEqhFOb/1mrejsNX0sER2
         fj56c8KFpLgxNuELJZ3uVbYbwKJ4lsYpLNSguskJJFpdOA+oEYJBqtqs8S44Lo84899u
         u+hoav2GKxh69M4NIrgJy64/4FZaQzdSYRKQS30vJqW57ckfuzqQRbY8pmMPfBwOcdpi
         iLpgRs7i8/XLzjtmVL3iGS/1p7IZ7b6Se4OotxNDGvDUb8+vfue0+HsFztJfG5A+9xsl
         NVgg==
X-Forwarded-Encrypted: i=1; AFNElJ8yxQX1dX9HvGCb9xQmvHIRssn8Fqbjl5mIb0621gtgz2+y/VWC3Rr1Qijq+Fufbxi0eZb3GVgLg4ML9PJa@vger.kernel.org
X-Gm-Message-State: AOJu0YzLJjBWdU3QBUsDUwNEHgzFO0mMBqSa8QhwbHRI3inXTdewV95R
	Fw198spW4U/znpjzSaoCJhZAjl2LdBDRVBBAHxsTxwgFsSDuwcje1bVrhsSg0tkOpd30IvPCYsV
	3vnNcoleC/lENynaypHM1KZfh/PBW8SALa5xcDcCWbhvuUETSrdj3iiuWATvJAT904/kIxrp5Hz
	XE
X-Gm-Gg: AfdE7ckxstZ+u80o52g01UEvMkayG7s9h3SkbtbPq5XkUvbjWGfS9GHngmF3wRbqYnj
	tjd9b17bj3BvRM+tFsgKEEVTHdwA2qjqY3AReuCIt8LTPDBB1qC8SnA56slGlkvYSakZuERPUVI
	tze4yS9+c59+cAyVAuCXdtkLVjsa9Jqmtr53W6xJbChuuqPTfNR7GiD1tNRw0jPLy0tCBtRONpJ
	ho6ebJD6e41s0vCPTiQOPFetNdnQEIhFR2IuIluD2wA3X8V9l7XDj2H91vwr15EBw8IpUP30Egc
	n0RQfBzJWCF80cKny3yEYYUsVOwylrZXPHgC0dAu0qNo0EUKivVi7U9HSbke09wginQn6Pm7135
	c7O+z9WBBN6xC4NeX65i3cFs4R1r4cazL6A0=
X-Received: by 2002:ac8:7d91:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-519febcfc63mr146663781cf.1.1782215031583;
        Tue, 23 Jun 2026 04:43:51 -0700 (PDT)
X-Received: by 2002:ac8:7d91:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-519febcfc63mr146663481cf.1.1782215031129;
        Tue, 23 Jun 2026 04:43:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be4b9f6sm4376257a12.22.2026.06.23.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:43:49 -0700 (PDT)
Message-ID: <3d24b1bc-baca-417a-8f60-a060cab5719a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:43:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
 <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
 <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
 <6ad8d604-b04e-4f24-b616-980f0e18b4c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ad8d604-b04e-4f24-b616-980f0e18b4c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfX6BhmIWlmaSwM
 RmD4dYp2NCaLi+RyEcvGVrTBYDSNcylip+01smFb7YWtAtEHa472uajmiqluXZ3YRTYK+gOgU9S
 Xmex+05D5QfLz8wZtTF9Y1W0FkQrvhs=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a7178 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XyekhbN6Ike5yq1yYGIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: o3vt71keJ_4zOu06EwB1XtSKi3x6o5sv
X-Proofpoint-GUID: o3vt71keJ_4zOu06EwB1XtSKi3x6o5sv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfXzbPS/uhnzeQg
 O6kA0f+1W9D8zgrmlgbQq/CJo9tvEQnatl7YKPUdEof7MJxF2zTXNVtUoFaArhNLdloSW6lLDZn
 LvpN9LnNk1EbzBZE+9JF/UzGyirgdU0nmPul4+N86iOPe/FT2J31yhBaAGTKR2yEVvmSRJAB/2o
 bUM1foGjWvnySMCeb1cGnBlTF9+7HJfbjzDxdn8WcMyGp0UjPql0D8GsqoRlmUb1XEabDcpMHG4
 a2I9N5hWxUbtZx9RmNM3rcbCbgB+yqRbgriKoYtOydHhap5n3VM1Zm2MVcnGg7krNN+2rMeaEKH
 HiX5L3s17f8p4/uNkiqm/+toEQg/G0CXbJkxOctSVOr7s4N/mXsEV5rx8R1PdFQHqhaCqUMnV7x
 cRpx1NgQpnHRRaNDdxj0idgnKiIjG69iZ3hsX69rJ1ju01Rb31xW0csG4nrJ8PgL6n4VCXcSbaH
 gtTK16XTJheZ4O/aZBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114192-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3C7C6B6D22

On 6/23/26 1:42 PM, Krzysztof Kozlowski wrote:
> On 23/06/2026 13:38, Konrad Dybcio wrote:
>> On 6/23/26 1:31 PM, Krzysztof Kozlowski wrote:
>>> On 23/06/2026 13:27, Krzysztof Kozlowski wrote:
>>>> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
>>>> Display Clock Controller is enabled and references parent clocks from
>>>> DSI PHYs.  Devices which in base DTSI do not have all required resources
>>>> available (e.g. because they are simply disabled), should not be enabled
>>>> in the first place.
>>>>
>>>> Having DISPCC enabled without DSI PHYs causes clock reparenting issues
>>>> and warning on Eliza EVK:
>>>>
>>>>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>>>>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>>>>   ...
>>>>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>>>>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>>>>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>>>>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>>>>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>>>>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>>>>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>>>>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>>>>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>>>>     platform_probe (drivers/base/platform.c:1432)
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
>>>>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>>>>  2 files changed, 5 insertions(+)
>>>
>>>
>>> I should call it RFC, because this feels like a band-aid and should be
>>> fixed in clock drivers maybe. Eventually DISPCC should be enabled on
>>> Eliza EVK for HDMI, but DSI PHY will stay disabled.
>>
>> I'd say all of that hardware should be kept enabled, if only to
>> make sure that it's parked safely
>>
> 
> You mean enable DSI PHY, even though there is nothing attached?

Yes, so that Linux can shut it off no matter its initial state (which
may include "partially initialized" or "partially shut down")

> My warning probably can be fixed same way as:
> https://lore.kernel.org/all/20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me/

Quite possibly. IIRC Mike Tipton wasn't a huge fan of park-at-init
to begin with.

Konrad

