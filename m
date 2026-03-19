Return-Path: <linux-arm-msm+bounces-98789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJfgISIXvGnbrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:32:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E653B2CDC40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04AF5301F18B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8803D7D63;
	Thu, 19 Mar 2026 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3dXsaEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eo8+Tzp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930A3DCDA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933952; cv=none; b=XVzc0R18h4EMb2RRDtrKhydjQjJrYicSiiZlYvkkdgH3MKdb26dtvLxRZGB0CXCVtY6NBZoDc0YWxXC+AavWrRYbV2xlAgaeyriOqrGH5A/JzrR5dsZz8M9O0OYYMx6YedrsR86RZFqpjexcr0IO9bXUPu7aK0H5CKi1g3227dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933952; c=relaxed/simple;
	bh=QeRC7DoE7uIkVN3ymglkdHFG3p9YnRgTQtIlE5KDBkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5UDZYLz9rRP+Q2he79oXYqEWlLZcWFsiJmGcbZAAqB9O21mahJK7gbA6wXWE5xa5xtXIuBult6KYzOJilBJAgkCdMyt6YK3G5VR0DY7tXKBJoN2qRwmIQKPmFA0m6pn7zqo+ZOcEONAlihGoPnyNHstinJSLG5DKJP1aqmxZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3dXsaEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eo8+Tzp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740rx770558
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wKwT/PQFdU6BJ11ZHU9npP0K
	J9t/exJHghExfMOnbPc=; b=K3dXsaEXP3D1s69ZspiduADC8HsBDEzcFTCqz5tS
	dzagNGUCKBgNy4lfAkVrSA8KxUKd/lYg5V729bvnT7kGJSyQ8TQFT7z5gB0FPjm5
	DFY22zBy4+pj2qo3qfavZzFGyx9hywF9sIOBL0dcVhLJtlLqM6UtUKii1n0URald
	rAnODZFHvoR/XpqlPFVGn+iBWn1JnEdrDZUiGF4EEtJAXK9RW0mEUOd3zbNI/Jtt
	tA/TPFv0n33uzlgL2DVFtU2IjIm7F3M9WtBzw9U62C2Ewi5iit6Bd8AKJeHcjoq7
	9RzppuKwnKlS/Fmm1x/P1KiUxvf0tiOCnefdcsDIN14FSA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00egbppv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:25:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-950c91e200dso8625365241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773933949; x=1774538749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKwT/PQFdU6BJ11ZHU9npP0KJ9t/exJHghExfMOnbPc=;
        b=eo8+Tzp4dnz31/edFxYMlM+lTQFqQkwoBkE0JhYCM+NhGS4NNYFY38g0VmsrrUuNI/
         ATs8LUcY5R72LB5Qxu7PLLq4X0RUG/u9PlCSTu57qwWonikvIZBkWpGjg2axL4xlq70E
         G3MU/t0fnSwELsKtnnsa8Kf3YY88ciasUYYRHCyIeuQEEbIFpaS2DfA3aD2l6mf1HcXE
         kdDmCXBVrWyCFgSfX68aLuEUbbWhR0lMGhAQ7XrPeeRUpRu8x5A+bxlBWRHFhZ2Os1ks
         Cbbb4BfSX3qAjTkaopYCmFKi3cZqfjRmrSyap/ZUUk4yl7ewJ7CBrlZUTpSeo83B3P9d
         22lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933949; x=1774538749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKwT/PQFdU6BJ11ZHU9npP0KJ9t/exJHghExfMOnbPc=;
        b=La7Ae9tzAkwohmsd/4o05PiWpChciW0eI9+tySgB+l/yBJfXAOqaiTB+9/fChMKoXZ
         w6Xk/Qi2RZpEbcreYYXSVgU+cWYIRnkR0lreBtWMnGQPPAv7vOhNp1IgZ/7L2Cg+gPH0
         oKUWEqDZ7HHgSSqK+Ee303FIcJ234EtWCw9y1FmuNSticJBrU/F9uF/Y0npp2u/xbDRJ
         ksEJDsnZWc2KnfRH18DL1Zy3/iimxSX4ozQ2bfuQNO+1o3x3pYFYr3z9+r2Pax9ERCSL
         QbhGOYXa5PhRhcrEke03MvXEe+YxWMpWoioBVsmbQogu690xhh2xz5+rl3MOahF67iud
         zhDw==
X-Gm-Message-State: AOJu0YztJhoQLLkH69cGvsZPd3498bVOql1M7I99B/imhc+r1X0QTrFT
	ys1tdSCGsM7YP85VN1wKfy/EFwO8ixF+cdWajRcDBvy0YDUZmN59ZRjLyE25tvjA8cSuW2gCyD/
	m04z7Y9JyhHcN2mjsdxwrUFnbuO07sQeQoQ1Jgx+IxaXhEX20CpagwEevogLIaLdiqXoW
X-Gm-Gg: ATEYQzyExONSlmbFbeX8sn7pR4+YVqxBjM3oRHaRUGLcCYN5kQWv12qObBCJgD6xmaT
	AWccj7QiIIwhozWlpjU/huHHTVcF4DZbPruEs3e8WshW8RJ6zFCO2tH4OWz0GOt1EEiqoO+DeB/
	6D97a8Zjfq7KnRzD++8pG5iVc8vqE2xxbn2boIDtplx0fOqgisELzdV/+ipeGde3rEILLPn+PDX
	bJQ76Jb+Jw+IJIt8OspE5GgBCAUFqrviQ5NNUHv3FNiHmJKc9vaHB/Hl8/PzhF84vSuSfYLDQUl
	KGdqAK1FOw5vGmx18H9RHJX3Ap8mxcrWNXSq+qx+vqBUc6x9zeTlMVBwyrJR46HDiFCtYYS253b
	FfljyYotg8l/6cYpi8Q0XTTbOr6iM3YP29g==
X-Received: by 2002:a05:6102:d90:b0:602:ac40:96af with SMTP id ada2fe7eead31-602ac409f47mr303082137.27.1773933949174;
        Thu, 19 Mar 2026 08:25:49 -0700 (PDT)
X-Received: by 2002:a05:6102:d90:b0:602:ac40:96af with SMTP id ada2fe7eead31-602ac409f47mr303068137.27.1773933948472;
        Thu, 19 Mar 2026 08:25:48 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b9fdsm78321865e9.2.2026.03.19.08.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:25:47 -0700 (PDT)
Date: Thu, 19 Mar 2026 17:25:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
Message-ID: <m5wf7xv7zkrf4hll7xzvcliqurub2dkyxwkuazrtohstchah4n@nc76nvmvhi6j>
References: <20260319-glymur-dts-crd-enable-kbd-tp-ts-v4-1-dfe67a134996@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-glymur-dts-crd-enable-kbd-tp-ts-v4-1-dfe67a134996@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bc157e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=eegTK38dZLw-gIz-9poA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: epSH0ocy-WJHBAgvpdneZpg-o-fFUCmM
X-Proofpoint-GUID: epSH0ocy-WJHBAgvpdneZpg-o-fFUCmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyMiBTYWx0ZWRfX9G3SJhuXucPL
 jIQEteEnpJqonfa+DrQ7cb5Ve7CIbDEnezf0VI+F7sxBPew9By7LD6YBJG1ilNWaSnsHEx9Q2Yk
 JHfwgcQdLTyzlfADmccB5JjXrcG4OoeVtDVakYLeOu+klemNSNPPY/1JbZ503TkswUIcX5gVvBZ
 K3MUuvV931AhAsuN2MjmWcFV/0Cl9xxfva55/QEbiGu9W/0oM+ryOoWgUN3XEeP7iwaubXhR5nU
 1bEMXZIflrlqPqg6C/b5kkrxfzapfeerheMfFgC4MDM8xcWFwSxG9mI6PIenFQEvzV5AqmrZb6B
 D6Lb5i3MX2JNA25XESxNpFEujV7K9QZo5USOQH9lobhUcn8nPczBlJo5qs8wznCLxebHsrBudc4
 WwNL+8vOsN3HixGQsLhlx08/X17IwvgHGyxyV7FZQX/fPkzSs8+Aaoh8OVZ2mbC0j42t+GMLYbR
 L8L9gofQx+rgRzghOXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190122
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98789-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E653B2CDC40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-19 16:00:16, Abel Vesa wrote:
> On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> and all share a 3.3V regulator.
> 
> So describe the regulator and each input device along with their
> pinctrl states.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v4:
> - Rebased on next-20260318.
> - Dropped all dependencies except the USB DT and Display DT patchesets,
>   which are needed for this one to apply cleanly.
> - Link to v3: https://patch.msgid.link/20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com
> 
> Changes in v3:
> - Picked up Dmitry's and Konrad's R-b tags.
> - Drop the output-high and add bias-disable to the reset pin of the
>   touchscreen default state.
> - Link to v2: https://patch.msgid.link/20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased on next-20260311
> - Re-ordered pinctrl properties in vreg_misc_3p3, as Konrad suggested.
> - Dropped next level dependency patchset.
> - Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 117 ++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 38cdcf662ba7..5089ff7cdca3 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts

[...]

> base-commit: 54526d6c29ce58d5399cd4e2237d631266ebaaef
> change-id: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
> prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v5
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v5
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
> prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e

And because the Display DT dependency patchset was respun due to the
functional but non-merging phy patch dependency being dropped,
now this one has to be also respun.

So please ignore this version.

