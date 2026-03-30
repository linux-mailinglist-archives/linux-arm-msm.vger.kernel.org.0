Return-Path: <linux-arm-msm+bounces-100776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ck2Ilheymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:28:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACA35A401
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 053A3303BA71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38863C6612;
	Mon, 30 Mar 2026 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmCBxfD7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfrHrMkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65E3BFE40
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869691; cv=none; b=AwPsznWd7WNktdoPuM8r4xPoPBiug04XxoT+z6W3mXPhvS4YkYZjwow7X9MbNJMU+4q1lidiOPsl1A/x9xJhuq+8JoSw5g51hKw8t3PC8YfNUd/3WE7ePCK6i8+K1yJzEt/ixgWg3fMfPwqW2UY+NQvbBDdZ3xKCs9IpzPkn71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869691; c=relaxed/simple;
	bh=Bg9krAw7ueDQsORyfQo9j1l4u0mDgQNLOjwkDMzxrnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGjaTYUMGjHNABI81Ib2642X09R9/KNISkKCei20FqZfoW/iBOYQRDugMMwKve+5tSlOXSOkAMnCOxNoyFuMrI7sVR3dtjH8OeMqdotdhjLYE7MsdIZkghSJj4PKPbCjIZXK9dbO1ZRaQbU6+jzyom3HGA0rf53W9795UdwYA4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmCBxfD7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfrHrMkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9Qdl92195654
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Ic1nLhA2BVLZfE93GgGLyyBeF9wvtvwcAK8zVyhSjI=; b=YmCBxfD7q9t9r63g
	ibklCkOWxq+X99CAEkisCUvvmaMndfimumjsGGt56ykUo3Idd+NNX4CoZrCn3msV
	Ermoq1ZyYt6DLxBHSqD5EW+9Mo7kdYyFdW1KKhoVGqnwD2LquUGdgrks9twJQQWz
	sFuUmO/tkXoUZpHKlxV9lJKQAf4Zx3nfIKKlTb/mYknDImbRj0PnSoykkvYlAFxT
	3Wt1Xzgwf9GBQi36HV0pMnBeNU8gQQsQo3g0YpZIWbtMm2fzOOPWAqUr79Yh/jnR
	ryGt9jd/98dd/irm2L2YC/pgE6M/1JzwE0L9oTlgSEoHMab/XVezQAODw9ftX2zX
	ql1KFA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3uc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:21:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccf10567dso21796796d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869685; x=1775474485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ic1nLhA2BVLZfE93GgGLyyBeF9wvtvwcAK8zVyhSjI=;
        b=jfrHrMkDwwECD0sqms1v+SxPwy9v8WiB4aIypHfhTG6/+goQmSRikK9Plrd1nkpJZ3
         LloYGYCuGvtunXjvhwHgdnii0/YrXQI20B1B0sDsUM3r6PnPokGArDcAUwWLuvdajgLi
         2z+n6+Rhgr6Mim0jT3QJD8QeC2Zbhjd4HLp5FUbJY0dV3zIoJUzijA78Xa6nkgUTutVD
         mjH9TV4XcggvS1KnBmDO4JFdLwdVO8N0EP2w+bspPbblcMluIXy4LBRjSE4VYoWBlJmx
         QGZlQ0yPErGEk73y9jL5f0l0Vj586VJXVi3XMHVxA/EiTM1WrF4sFAZhsfTFA6xhQ1xM
         mbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869685; x=1775474485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ic1nLhA2BVLZfE93GgGLyyBeF9wvtvwcAK8zVyhSjI=;
        b=I/bAKDCcR9mcmA8PRei+bjC+OYtBO0i559SYwubwNX2XeE/HRS+EOI6zi4GHU2kKK2
         wF7miR5SQfBj4cneLBuoCUOur28vlSWyddlpBsYLOFt/JuQ5JAK0sNUuhrQcYoKGeZLR
         fQgWO2+b0v2ERBNRkqkOX0/ZnrSkYxq3D+8nxMpwep1mUu4C6hjfUFGofyxJ0mj5MrQ/
         CPOozRhW96aJkWjYxq5Vob5QxtDEXWuCCGJRCll+DVWufHVfG5JDg0TaYrtA5Wev/gwf
         imZoUffqv61KFZkhvvLjgArBwfafskXrfWiMkSzFKexF/+NR9DL7WykqSs5lTg+pgwxd
         mcYQ==
X-Gm-Message-State: AOJu0YzkJbGLTFZAeHLDdQObtrHUA43zyfDEXDOzk8g8eJKDtsSHpDsc
	RpniYE7fLyC1G2mH2Iiac4ODIUeP6N+q7nOs6EljGDMWcc9c1AmPRVpFKX2SMfRvspbWE7HVeCF
	Zb2aQsjwdEKT8yHWH9GakCn0tNlQINpNzS3i1Boi4CCAQkq3YA6aT2FoeSwNneZYJZ5XL
X-Gm-Gg: ATEYQzxyD35llmY21pr1BTtN9UXkB0q5TVix+mlxI/7sxIf0LfOSnseoREcrjK0iVUJ
	Aa/z8wE3+ycGjC++s58TCNhBpawVfNiY0plnqRAFmTglXke9TbWDRAiNVJYrHx+VKbFGny3sxxb
	uzKuujMYKLJyXrTSlrZv0P3oTtDS3vc8rKepD1f1xQcVn87RJvI1TAsbuyKQenXiQHidTp5MuGM
	WbIRO3DybT/EcULLK/BDDteWVmPmg2quTCLz3V4XMzUkjejiw+bv4iXJnWxfFLgL9n3i7DcxKoO
	XyUtmOeITEA6baQJ4sWC6EKt27m4RD7Hx2MRM7ZXwZ0RorziiI8iLcWVs/JchpMx5+rpCAHghwd
	E/AuFYKRJEBz6bJwSJzaI9PdGq47S0YG54T/9FcH5jbhFCXHG/PTKnzGNaunkiRuefp6ZXNCDGZ
	VZ6t4=
X-Received: by 2002:a05:6214:1bcd:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-89ce8ceca2amr129623346d6.1.1774869684856;
        Mon, 30 Mar 2026 04:21:24 -0700 (PDT)
X-Received: by 2002:a05:6214:1bcd:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-89ce8ceca2amr129623056d6.1.1774869684399;
        Mon, 30 Mar 2026 04:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fb3sm282004366b.31.2026.03.30.04.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:21:23 -0700 (PDT)
Message-ID: <df073955-476c-4abf-a0cc-b5842089371a@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:21:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: hamoa: Fix incomplete Root Port
 property migration
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OSBTYWx0ZWRfXxCtL/BQs63TW
 ZJdohqBeGGf3jp7dYWftsOY23zKVv/aZ3bHSDeILT00LALf67VgmQXrlLTeiv1zzCKyegDUb3kb
 ynaqEhZE8iMRg9Je3ghbqvJIp0SjKdmmSHgOwp+TyL6gcZ153KeWTR5GoADapnCDk+aWCmn36u0
 O7E+4SCz1dUKax6JGLasqOjhyqcPn0mt2i95nA6D5OQoRFzShKa1BI1LxpSt+LQIz+MPeaHGaO3
 YiAI4OuojQtc+kPBDE8KihUGwnFiwK5VWLB1i43PX0ud/JTC3AaRgo38zpELaQq31/qrwY2cHuu
 7qWFLHpQhAevpCQ63Lpp6ibgS1A0nFLS95vZSXXK8BZHtlrEym2+mzEeNjfEll1EKeJp3cDkGD0
 F3h7Yt3NSCaYQU7xlS4wB8r+uHeSaToD4N9QO7lbzxEhSA//n7DBfuUcDSu+cRRW9hi/QyH93oE
 fg53KhK/Ey45n0xWO/w==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca5cb5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tO3S9EIgoizo5XbbBjkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: S8osoe76ZSzpYuRDyw6EK4sASwwpqUaM
X-Proofpoint-ORIG-GUID: S8osoe76ZSzpYuRDyw6EK4sASwwpqUaM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100776-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,google.com,linaro.org,linux.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40ACA35A401
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 4:09 AM, Ziyue Zhang wrote:
> Historically, the Qualcomm PCIe controller node (Host bridge) described
> all Root Port properties, such as PHY, PERST#, and WAKE#. But to provide
> a more accurate hardware description and to support future multi-Root Port
> controllers, these properties were moved to the Root Port node in the
> devicetree bindings.

[...]


> --- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> @@ -1033,9 +1033,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1050,6 +1047,8 @@ &pcie4_phy {
>  };
>  
>  &pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>  	wifi@0 {
>  		compatible = "pci17cb,1107";

nit: This single hunk misses a \n before the subnode, but maybe Bjorn
could fix that up while applying?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

