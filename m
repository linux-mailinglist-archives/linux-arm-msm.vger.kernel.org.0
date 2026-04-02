Return-Path: <linux-arm-msm+bounces-101499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MtAHqA1zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:23:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C530B386D94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9146C30107D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAB73803D3;
	Thu,  2 Apr 2026 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWV/tnlY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyB6PIU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A2838B7AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121794; cv=none; b=mBuCaQ1uOh45lUbjJV/2ioV/VB8u59lVZB6HCW8Xaf7MnCAK00PBcYEhoJFAfwtNoyYcVOg7HypxOKO94Ke9jSpFTdTYl5MeY7DjBcQSMpDoSbyFWkN2hsPtMAIIzjHDF0BdZA6m/GJsEd4kLXmX/zEIKMosF/2RXAXn8+peRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121794; c=relaxed/simple;
	bh=q9j+367l79vYQecpLmaLpTtH+va4Wtpz6t3r4tF7vyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhapBmsmXzFovVUqOeI0z7jQ6PPjBCPkcowimyAvl5oa8Z/nCc7O6n1mno5i0JJ3BPOCJ890wwG23XCnE+OaOT4Tg93zbAiNqMD7xTBz9bF1V5iPITSofAIYlhlsFwSJeRSdaxqRqrq5HHq6PG47oeumVd5tja5ilSs7Z7EUs7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWV/tnlY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyB6PIU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326lui14009498
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=; b=YWV/tnlYRJfUMLIy
	TtfMrPl/X9K4U9R2hhggX70fmeuj6hM48rj0ijQQ2B6Wq2K5SMtGijcEJukjAj8M
	lVuF/OIetpvHMnQ0Hhf5THmXOxvQE6nmf99mtqySBVKD/pKjmwDWU8mf/HPWEpob
	iHQ8f72tHMNybvcn9j6lfoA90SRSp2IjmvtxwO1Umz+udXJWJUMSsLebEr4V/NJI
	PmhSIlz+eEMHAdVOTSwqULAaAXwccXutUPY/gVS5gAY0skDcc3ja+dhCzK9TB647
	FCPunDFOkpJ52jdlYZaq+NETM8ePB5ZHo/MRACM2yfTyScRzLX4G9cYSaCp+Dlxm
	6aVKzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e038xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:23:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a016b99579so2725106d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775121789; x=1775726589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=;
        b=RyB6PIU+8Z75WmgIYMOW/t0EF/0/ulbziOBxFX5/0xI1AUFVEgZnUjurh0o+Nr2hjj
         5zk4XHDvC1k51q4EzSZY/s4ehOsVd9vjZULZVWD3E8GxKJ4YcvKuxZuUK7uM2Zyl2z2/
         dTpgXQQQqtoUZDYUhYWJ25x90z38ZVeYFAHlb6HxfPi7bjfI+oY6oifLFhVyF2uCzI8j
         Ym/FvKVRpVb3FoxK9THdF37BdtaCYuX6puCXlz+8fqVBY/D8ko7/NE7TGI+18PfITUMd
         uBoUiwZFqfRz9C+aNEtZOCe605I7xoDGkaeRtlxgtv/Nv4o4QfbVSlY1Jko+NpEHKH9G
         rHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121789; x=1775726589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=;
        b=szMuE0ROlpPzquT/okO0lSJ4igtrHsepZjOihwhL65J1BMeP5x4hDLehZn26+40z4G
         41UShqjNOGU0pbkR56LPQo82yJbiTino19HNNVwMhI/cfClR7dSN7CUIeOoZVlFjTpHg
         YCYkMuBXBe0WDCVnKF1V/dsL0ZpP42YnYVUrizZ2gtoyyRh/RN4Dz8dwyGlctSP5C7N3
         tkPqOpEIamDSn1yloT0WzClP572w90g9GcY0zONzHUKyKrowhfkFRD0jk+19Hb//YaYY
         LmT9po1O9o48rxx8edBvkIHtLJpWa2tee+7Y7RlzNzZ2nm8y0MJsoeqk7tQmufuhQXe4
         pPvg==
X-Gm-Message-State: AOJu0YzJQF0gAvqoO6Zqo16z+TbxppD5uYj3SPB36Q63zpsNNhkod4/J
	5vV6EjpytzlG5ajIA0cQt3rKUDjGJXLAlRGIGf71wx90GYX9UGKOhBY+5sibj1J1eW3mL4V4qRo
	qH7TuGbC0oIZ09VdYZ0RoqMzwA5koaponRuWbz/baYEKKyb8XKzj37WiphE00DFE2JjJHzzZsrc
	dh
X-Gm-Gg: ATEYQzyiJddzkqgTf33IPMN1cQTO+lVIpnbeakApl3WO0NxFmixMEYxzqIXqak/c05T
	0ayKBr7yDS+tSdE/GbClqLluEfuYQE0q7U3X6ZLjnUCCHiiCx49iRrxeic1HWI0YhcufBGsg0W+
	CRfw5oPBJyzzid/FMSoYOF+pjqpVb9euPiwrSVgOaealEXNq2sdDYz+m/jsr2Z4jSqOYQ7sU0d3
	e9asYzZE5+L35rjvCazxjtWZ8m7wjMwq2AtQzNwtNC4k3RevnAZKfPx5znnlcvMX6YR8xoKpinv
	KDdv90XHPD3lCK5vLrwqpB+sYhAZf0Jhqrc1hbGhhRbC1cyy0go5boCepK8QovOzcJ4ySdLDo0t
	3nqGG/kg4MZaJz55WrxWJbljhmblFeYJyltlu1st8PgZaLxtonQioUbnLALKTMTuGDwlWZeOQ9b
	UYv9c=
X-Received: by 2002:a05:622a:1818:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50d3bd5723bmr73354161cf.6.1775121789005;
        Thu, 02 Apr 2026 02:23:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1818:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50d3bd5723bmr73354031cf.6.1775121788564;
        Thu, 02 Apr 2026 02:23:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6cc4sm65225266b.32.2026.04.02.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:23:07 -0700 (PDT)
Message-ID: <a5fbcb92-dedf-423c-8721-59838da60980@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:23:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 sdcard
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexander Martinz <amartinz@shiftphones.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz>
 <20260401-axolotl-misc-p1-v2-1-f3af384bbb50@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-axolotl-misc-p1-v2-1-f3af384bbb50@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce357e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Mtb5h6N5A-RCbQxWbuYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: B7FENnoWBE_Z91jGP0K4-pn_lSWWca7S
X-Proofpoint-GUID: B7FENnoWBE_Z91jGP0K4-pn_lSWWca7S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MyBTYWx0ZWRfX1iOLLxjS/b7z
 q96dkgkfsuFG17Jz5jx5wnH09UX4HQLi3qu6Zl/6WzxxENfc5all6Mzvb/JddnPRWCvuJ7hj0UX
 lYNPENeJVkRm7sZjFq+IHhD0vUvBWNQjlNEEnykj3k21nPUBMkeOKNDrrdoZpN2wBfNzHkbLcxI
 TCbHVGo+Iu0i79hOTcfZmVW6+fr5BgJ0NWrxxQsyuWb+z5XdaxvhUrkcqeNjCdVtb2zxyEj0hIz
 GOO1wR8rA7RsPRe7Vtr33pdfT/galInuzmV2fTPUE35TmupbfHAfFUYPp/+k54xSqotyvSizUkB
 BDsV0ylRzLGtz8EjMtXuXk16yPDaz+0IyrWtaMDTX9WtxF9Z2OPZTLQeTxnfn62guuOKWVZOIbw
 vB8USwlVLVvPmuwIuzf8FboMxsxixf7zg70/NtKxaIaSH+6tIX+HpbKYB7LP1bfbAGRgSeTh+3y
 ukjYyqGOKpq5Sx5EQhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org,oss.qualcomm.com,shiftphones.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101499-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C530B386D94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The SHIFT6mq features an sdcard slot, add it.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 44 +++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 740eb22550724..c394350998c26 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -600,6 +600,24 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	status = "okay";

couple nits:

Status should be last, although the file is all over the place 

> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;

preferably in this order

xxx
xxx-names

[...]

> +	sdc2_default_state: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <16>;

All other pin definitions in this file have the bias property below
drive-strength (like the card_det_n node you're adding)

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

