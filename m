Return-Path: <linux-arm-msm+bounces-113060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MUJAOFcgL2pF8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:42:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56912682565
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:42:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IX5vBccK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SKmFF7pX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113060-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113060-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 651EB3002D6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5F63112B2;
	Sun, 14 Jun 2026 21:42:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7AC309DB1
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:42:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473364; cv=none; b=S8Gh9Lcy+WhuBR1ufrQl7LNk5z02CPMl7tJiFAolSJHSi9oZVG/i2X+09tbCT4k+e5w7Ca8n9huvRDniIEhzgPfDRyeaRE8fYNsrWyU2dDD+/Wl7Ea20exDLzjkIYOeANvt14oTeg+D60dT99pGJ51g45e0eSJDP1v3eHYVthBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473364; c=relaxed/simple;
	bh=O5RAX6vSkVyMV9/AiCOkLDjnKhqPtvtNfNqeJYGa/FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWXobVJteTYKaalwPwwxHysERldNT6rxRjyC00yr6qcjqsU3aGfh5Y5GyPZUJbFSyZwRjEn/co+0yEq2NRq5cZxnKGVHxjStBmD5yb4SJZlbpuqxwcyVrAPnUth8MToncm4NG3QIxAYaJ5CLOxMxsfk6SzG7jCXmVSv2/l42yLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IX5vBccK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKmFF7pX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELFAtE2198152
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nweQR30NtiV5h3TcT7NqDuG3
	GC9ianIw1AGvroZ8LpI=; b=IX5vBccKZb3QFGume1xt4/oY+zQaOG3/CoqkgSPx
	cvd0IEzMrsvGjiW/bhewea5WW0zblECbt/1Qx5Qkgp9D1HVc8kpdGl67q6/zyiCl
	SFz1OwFTbYKNdrQJU1aekxcEtGXRRXLDw6Zkgwqstolx7/b9si60EQwnF/gnDDt8
	Os85PlcPUmHIdXSQ7Pu+mnooyZyW0HEjlcmwjoFf0kB/Ww+DMOzlDXS65MOvRLq7
	3uqWNQ1nm1cMsg5h/gaLgnK+q67RjAD6RRB/oypt0fc8PM7Cq6hvj/1ohg6L6B6k
	YggvfOo9d0SBi9cSLLyxPP+T4zNkQHJU+uM0TuaPFtEE1w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g84jn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:42:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce1c3c26bso89462266d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781473362; x=1782078162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nweQR30NtiV5h3TcT7NqDuG3GC9ianIw1AGvroZ8LpI=;
        b=SKmFF7pXdAtIEQOnEg1wLdt7E0qjPREcNySv6jm0BU/Ag1wVbzlbCuAvYqtY6ZMBro
         3WfgG8d8WCqclOG3ZrwQPz9/pmaGFjTpSdhhs5B+89VOdKL+I91dG4pknqKGcfF7IKZD
         8UozDOiqzEynaQcCBpVFyTA7+0gL77PUJBqb2Gf83X1YIV69E+l2+7oY6diSpvDpsZTQ
         SEONe9XD7vqkMdcgeHWY/UD1dDX2DfnlAgHN+3XUmbamiGQWhhS9HprwAvAgauiEZK6V
         wf6QK7RmnaF5DrIctyXQmz1qq6RHDf1TKNL8iK9OHS+LGF3qLqaGWLjoeEsOW2p71enY
         +K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781473362; x=1782078162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nweQR30NtiV5h3TcT7NqDuG3GC9ianIw1AGvroZ8LpI=;
        b=oA9KzDjDXuqv4g0hhXyAOIH8jKcJb23Ao5zI2QKcWUBRFnvUzPslU153eMaIJWewpQ
         Deu5D159n4eIdYdESIo0mgV8a1ULx79HTlB4mvXE0u3nfszxthi81EsP+bEv/qEZ9vNP
         x4Ca+bI9+rmZ+XHvM13n8bYbNoZBhdIGNVLmu4So8cfd1mYg010XSsPXCyub0Uz70Hx4
         5u9/xCvP82AR9Uls+efkexGPTAAuZK+v9Ie3SPQD7+VD2M5u5utipMjKiUOwoyRXZw8V
         biACg5DwMTwzWV0z5883aMijNkThteJXj9IXw5WNfT65RQcK09IKZA4k0GFnSMFZ9yjR
         PGqA==
X-Forwarded-Encrypted: i=1; AFNElJ9l/OYwXZIPoRk5EWYTJkWRTSONMefcn89RTRhVjCRYJk8uuO1W2a75UzEqOj0gILQlC3zWSjmB7V8J8kBn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7MDV65z5bZPFvv8nOEMOctuPr/a/BpUItIBbPlZrRRMhTvohj
	uq+uFhYg+aEkGSV6JDov1dRC3Hmj8OJxF0qjMnt9gtABKyqF7Oco6avU2PvbSQjVXleiGk9rLHU
	uI0OmmLtOAFOhP6vO6yLgoO7gk2Hvg0ljTf2Brl2haZcPiPBe/zmTkjFRNqWIDCYe/heJ
X-Gm-Gg: Acq92OH6wDcKK5QRt8vyzw3+DLAN9sahvdpKIpfTONyYW9TD4j1uRv31UwhQJpvJBqp
	9WrwheHofiwLGEJcFH2mpgSC8E72Zhp0NhX9ETa31S326XaTob21KKicWm4y+tVnJPUgADxSn07
	ZbhJHqdSGrWICPGx5uLViY1ndA7C8GqX4AO1CNcDjya9sZLxwCDbZOKNfqnAzbWxItrRleMyYHg
	XHDOCXaFdL4fLqNZZMgPBFV4ZLjen67n39N5PIw/zhluKcHvMIJwmWT9vV7suIIWpMyypsoAhPj
	ZuL4b6ZCNiH+U+vhHrqXg86X8Yzw/0TPyZDivcVROnKmn2HzjXEcxxaPlGpCk9lCWFYtgc7enzZ
	NxlX1nTDsj32lSmIwTA0uALO2VFjh/XBkrHFiPoSWny5S/e9op22/OH4WW788id/GjkdYKIjowQ
	kEZjLo+3d6pM+Ss2gDYDYbIIGAGtLUX8hoi5g=
X-Received: by 2002:ad4:5dc9:0:b0:8cc:f55a:9e47 with SMTP id 6a1803df08f44-8d44f9f899amr143563666d6.40.1781473361829;
        Sun, 14 Jun 2026 14:42:41 -0700 (PDT)
X-Received: by 2002:ad4:5dc9:0:b0:8cc:f55a:9e47 with SMTP id 6a1803df08f44-8d44f9f899amr143563296d6.40.1781473361374;
        Sun, 14 Jun 2026 14:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6abe7sm20905221fa.11.2026.06.14.14.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:42:40 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:42:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Message-ID: <633bh5nvxafrwnga5mdvvfdkazfgmrkt2jgn36dh7u5dlgjkgs@vewjc6tkgytq>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-2-57d5e6c7f47d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-shikra_adc_support-v1-2-57d5e6c7f47d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2f2052 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-2XugwumPvLk_3HJCtYA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Z6edsWunmgH4CO4k47K-PJW6jB5-W-5L
X-Proofpoint-ORIG-GUID: Z6edsWunmgH4CO4k47K-PJW6jB5-W-5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIzMCBTYWx0ZWRfX37+BfqA+as2x
 KIHKNRZY5qdDcF2xcv4cQ6EQ4LbfJ2oYkcqjQwHa4cLOwDZ4egLoRKf8KJVlWWDVNsynQy7tMYj
 3HAA4zitAaGaD03UR0B79UjTIyVch2ot1Ob69deRVMcF/uVCO1ZKjKI/q9sv/s/gbOdP4Yv8srT
 i7zKAmizPf7VTt1uuiZbQew4jrlEaTZ3KVr0NChNhrwvGUPhl+drZO+XaJI6SfbsiMM245P8fvo
 JL0FRRxiRP5CZ0u2SjAA5u0x0LDxXnik42mb6FuniJL1G3K1MqFqGqsPbG/p87haKJmZyxYMASR
 ciCZ0qIspyJBOhS/y7UZv441aZOHj9/3ctWYmpmypGkecp0HLSAEGlL1P99mpbhPJR5+lZc+rS+
 YTf0lOYAvD2r9lC6ubcPVl4RRKfyVmk+BOoWNlAjTa6Kkgxd2O/jCYGKGeHXoerJbQqNpzDxVXE
 z5mh+9FOK3XejT4CNQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIzMCBTYWx0ZWRfX+ceb8s54X59m
 pMTOtWCUfLkTzPjsuJ8eVMcXJeEe2v3zliK0Sy/Gb0YWqCjYvSLuvAwd0B/G1p16UuaPZ7+ffmJ
 E15JgEZSYlLe9EXI/vkYkwWBDFhO+RQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140230
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113060-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56912682565

On Sat, Jun 13, 2026 at 01:39:22PM +0530, Jishnu Prakash wrote:
> Add temperature alarm node, used for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8005.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> index 0f0ab2da8305..180809a0ee73 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> @@ -11,6 +11,14 @@ pm8005_lsid0: pmic@4 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pm8005_tz: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +			status = "disabled";

Missing thermal zone, also enable it by default.

> +		};
> +
>  		pm8005_gpios: gpio@c000 {
>  			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
>  			reg = <0xc000>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

