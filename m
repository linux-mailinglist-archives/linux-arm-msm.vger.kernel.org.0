Return-Path: <linux-arm-msm+bounces-106621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG4kC3C0/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:01:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA724F4A86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97A7F30071E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652AB388E5A;
	Fri,  8 May 2026 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzZKL9T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="boAi4K8H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260236B059
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234154; cv=none; b=ods/CjGK4Wqj+BzyUtt/J1hzPiDxAno7cdJjEIgZOOHCMc73DP8NF3+N4OeVy1in2oCu21qgInnV4bfbbttpZa2N1ZSVteSUMcHoZYd9h5j+pxV+8cX7pQyLyty9qx46VC+ABC2l0iedgS+JXxoXjCXrP2M9JpnpvGrGiKpElD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234154; c=relaxed/simple;
	bh=k4zoYpeu5k04Aos9q1kyFrP4uKk4iPakPDCZyzvnG9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGsBjO2Y6Obe8vkTk15PBf1RMJnTZXFB2vpOu7G9VhezHxD8YaqTB4w1ewkkvRohIyPEwagLV6X9cZz7UH8icF4Yw5pXVyWLQZdOuWSz67k4XWpgZ68Fn8DDPTGnuiDS3zZlBXfpBTVt0ZEvkCbKCn22fRgKWvrGnHTPoCqVALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzZKL9T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=boAi4K8H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487KaA5317526
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xatkqkYgItUYJN4TGTyoaYlG8VMTkVHfKPbi4R2Nwpw=; b=EzZKL9T9oAoC1GbX
	xH29Tm/N74twH39FnJlygMEQw/zpULDWWv6Hlrl9k84kxWoEr1KxTf5fwwS0Cgam
	qDgLh0A6iJoOtHcNnU6QXu12t3kJ/I8IuSRbt/kXFzSRjj/EHMXqhDY1JUP92RA9
	oedLgFiF+UeQOVS3DxcEtET+pHH6RvpsZDicLtl61q8P1krVIadJmAF8UvVYtAKi
	j1JB/NbqNhgo/T0Ag++N05v9Fb6ODSkLq+NjtIcHwSXqjznj95FKlWfnJQPN0VzN
	MX8F52aduNw/YEMSCIAZAY10XGGUW2tI7AZ+uB6Prnzik/pNevFq9fptcwEDR8+3
	c/m9JQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc00m9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:55:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e62562b6aso4496081cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234150; x=1778838950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xatkqkYgItUYJN4TGTyoaYlG8VMTkVHfKPbi4R2Nwpw=;
        b=boAi4K8HeIi/7tR10PIKKwIIdkaR6uvYOmu5QKXCq2Ig4lN0w4NWI+WG34ATo+xy7C
         0BJd+S1ushY8dAzgCJbGZ86M72MYGOaglxvukWWjDFx1jiBuC4pbN7eyilZRe5kGD3Dh
         9XyIcVJYPfFzH74r50uAYTynnjloNDFvtajkVNhPlVQeMsYpezz56BgqCVyVOd+5XRYF
         WlEdb7VuUc21rQxPjO7ZCUFYUYWmuCoHSXyCAY4KJGKtfkDFSfzIg3u0j1VBiduPK242
         4j0HPZIgKZMcFN2dZzt8niAJafR6qgw8hWBnO1MzunYIasbSb5I4POfh9hbxiedJ+l6p
         QC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234150; x=1778838950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xatkqkYgItUYJN4TGTyoaYlG8VMTkVHfKPbi4R2Nwpw=;
        b=SJ+4RrnQwEQrpeKCQSA2Eda7Ihip8QJFkBS+Sh+UPWWWWUXd/w3pmKhEQte6/2hat3
         C3jFvlsGXef/3QRdcWL9TES+CirUYOtlvA1/05yMN1qBH6U2E9rLBxPqeITSgEmj5SIZ
         viOjyGVxOd/2Sa8+tWmzJjbk1IQbnO6zHWY6kiC9WptmQ8rxyccnQHi0GOQXZBF4vvy9
         1QUcrrIW3GfZJfVaUuLm8AgsGYl7uLXsAb32SfFAFKjJ9M7lFnAUAQYdNtDQa+eZXcxe
         muUZPqwwQH7qCr/TQ1adZ9nqJo0Zen1giVa1VzQuNjK1Fjf//l4YQJQ9DExi4dI1F2ks
         gmrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jHaEhzl2qFPkAQxRq513SpFMDA0mdYxW5PuU8jGFJmTTHavyb+JXQdx4uRt8nhn9IftTZ8lmQvZqxeuj1@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZyTiwOnUOKHqEGZRJgpyX8a9LjqcHL46XCBy0bLV/QE1xWGB
	kaaLgmGwim9zrclCGVbce/RMBmg19m8avaycd12GuQKaL0ckstctloAI392lz+dny5hJzeNX2f1
	yfDtF68xDaNCn+0uStqhllEF9flbwkjE78MxF9TYM1QSO64RMF/AEO1/XJnE6dhjRrcQx
X-Gm-Gg: AeBDietMVhdVFQGrt/7b6JQVMZrm3tN70MNYoGb/OcbK85iYWMDVvvQ26o/OQrAuRZy
	O48fEzgBp0c5LzqZv59vELe+yZbsi3uXfRIGPDCSiDHHZi72OOo5U2ihavRHZK9hqN5Rtwq9+T+
	xDAueDOP7P2xYMzCCUzkfAF872xvzTxh7JMS1H21/eTdDmDgBJ9jv2TlK/fWTkLRtXdQzMFAXdC
	C+UFkH8FbWrtiCV+6nWKW85PJZsoL4IqX1P5DMsvKsHIoJ/RnWmVsYL6TakMwtXPfpq0cKI7m17
	9fDX2EFG8pK1np/ocBUem4a4pe6w2nw99Q+m58mgK4Lpd9B/IeLDLZgBL2FaDbHVNOIvltweg3w
	zrodii4/8QSChbE3tLCHEq0cnCbZmlc+C/D6jxzCp+nIrvzjlu3BbVS8OfCyR9pFdzK2wZO+O3v
	LkGOI=
X-Received: by 2002:a05:622a:4894:b0:50d:9138:3322 with SMTP id d75a77b69052e-514621d3ea2mr112862561cf.7.1778234149586;
        Fri, 08 May 2026 02:55:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4894:b0:50d:9138:3322 with SMTP id d75a77b69052e-514621d3ea2mr112862321cf.7.1778234149185;
        Fri, 08 May 2026 02:55:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e0d132sm477266a12.20.2026.05.08.02.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:55:48 -0700 (PDT)
Message-ID: <7cb8c0c7-c697-4d4b-8769-684e80f41df0@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Dell Inspiron 14 Plus 5441
To: Adam Szyma <adamszyma@wp.pl>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_bjorande@quicinc.com,
        val@packett.cool
References: <9666c1f5-722f-4c90-8412-19257a4afae5@packett.cool>
 <20260508050828.7442-1-adamszyma@wp.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508050828.7442-1-adamszyma@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfXzwtMbgFgFXwN
 KCb6jjgFGRAYI3SEnVxeuSfX8tu4ABJJxYOQlhRU4GTXLkTbbSO0Uu2XplSVs2YvblBLSqHZjmI
 dOABDGGhngOPTHs6k7lkqbwE6gojETBMG64UtVxMEi2tEtL8qVf6l4uN19E/TvgOhoz8AguHfCB
 +H27+AihymrmkdaeJa3v/9IvcON8lHs2nox28pROsA0A9SgSozHR2vPfaYLRqcxrDDszOgz9mtm
 MYvnzOo/NhQMLyNU3iRct69u6Whw3DuUAv2iOPh0r6r42hMPrqc/A8ED1ClRET6N6Pk8NhjJHKj
 bYdv1HKwr0ExNHY9rmuKRMoRObXibsr2Tgp+MTlsXdx/nzF+5d+C8724FQkjnGPK+8+BzU1ppQ+
 UUE180W9X9LEuOI80okzqPOtqru+jH9KMta9kOp/9pkmoXzBm2Uwom3bFuAKny6SZ+Ai8LQvdoU
 k04MXhcc8acXp6BLuyw==
X-Proofpoint-GUID: NQ_5yiSMY8-1gFosMuakQsPt4q_U3oya
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fdb326 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=tJMTg3xK4LZRUi73EXAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NQ_5yiSMY8-1gFosMuakQsPt4q_U3oya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080102
X-Rspamd-Queue-Id: 3CA724F4A86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-106621-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[wp.pl,vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,wp.pl:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.182];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 7:08 AM, Adam Szyma wrote:
> Add device tree for the Dell Inspiron 14 Plus 5441 laptop which uses
> the Qualcomm Snapdragon X Plus X1P64100 SoC. The device shares the
> same platform (Thena) as the Dell Inspiron 14 Plus 7441 and Dell
> Latitude 7455, and reuses the x1-dell-thena.dtsi include.
> 
> The 5441 has 2 speakers only (no front tweeters), so the tweeter
> nodes from x1-dell-thena.dtsi are deleted. There is no touchscreen.
> 
> Signed-off-by: Adam Szyma <adamszyma@wp.pl>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  2 +
>  .../x1p64100-dell-inspiron-14-plus-5441.dts   | 44 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4ba8e7306..81e058a22 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -449,3 +449,5 @@ x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
>  x1p64100-microsoft-denali-el2-dtbs	:= x1p64100-microsoft-denali.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-microsoft-denali.dtb x1p64100-microsoft-denali-el2.dtb
> +x1p64100-dell-inspiron-14-plus-5441-el2-dtbs	:= x1p64100-dell-inspiron-14-plus-5441.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-dell-inspiron-14-plus-5441.dtb x1p64100-dell-inspiron-14-plus-5441-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts b/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts
> new file mode 100644
> index 000000000..b9e9ee417
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Adam Szyma <adamszyma@wp.pl>
> + */
> +
> +/dts-v1/;
> +#include "hamoa.dtsi"
> +#include "x1-dell-thena.dtsi"
> +
> +/ {
> +	model = "Dell Inspiron 14 Plus 5441";
> +	compatible = "dell,inspiron-14-plus-5441",
> +		     "qcom,x1p64100", "qcom,x1e80100";
> +};
> +
> +&sound {
> +	model = "X1E80100-Dell-Inspiron-14p-5441";
> +	/delete-node/ speaker@0,1;

I'm a little surprised this compiles.. but this doesn't do what you'd like
it to - it would, if the speaker@0,1 node was a child of the node bearing
the 'sound' label.

Also, I'm going to assume that the 2spk configuration follows other
machines, where only a single soundwire host is used (i.e. "left tweeter"
is actually "right speaker"), rather than the two soundwire hosts normally
used to house 2 speakers each only being utilized to drive one per side

To remove the inexistent ones, add:

/delete-node/ &right_woofer;
/delete-node/ &right_tweeter;

And re-label the existing ones:

left_spkr: &left_woofer {};
right_spkr: &left_tweeter {};

(customarily between the includes and the root node ("/ {"))

And then because these labels cease to exist, you'll need to make
adjustments to anything that references them, which I think will be
best to do as:

&wsa_playback_codec {
	sound-dai = <&left_spkr>, <&right_spkr>,
		    <&swr0 0>, <&lpass_wsamacro 0>;
};

And at last, to disable the now-unused swr3 host:

&swr3 {
	status = "disabled";
};
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-5441/qcdxkmsuc8380.mbn";
> +};
> +
> +&iris {
> +	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-5441/qcvss8380.mbn";
> +	status = "okay";

Please also keep a uniform \n before 'status'

Konrad

