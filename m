Return-Path: <linux-arm-msm+bounces-99195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOs4EdYawWkyQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:49:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4172F07C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D85DF30A421C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C5B390220;
	Mon, 23 Mar 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOxh1LSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jhh5+AXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EC39020C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262476; cv=none; b=JUW6i6WZGK5mmqDxAgREWg0FgqFC/Ax4t79gshhwLh35AbRQlZN+ec1FVnqVC2Qhua83ZkWJemIBEWgnn0TIrhFQpT9nobbUrZp7F+cHOC/N+dKwpm8N4IT2W21RN447I9DlDd69Gg455eng6Gg/0KztNJs+RS75rYxreCIw7eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262476; c=relaxed/simple;
	bh=7oMdsqXRGNvaicdqOHAsaU4zBGqBAOxTdGO3h9kw9xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+bNXxCKmQZgYJZtpSeTbLeGhJ79dUWUMt4HYkqWDasXTaZDFcQa7HNSOReTnrolTCLmDCibN68dXtf+i+yMA7nwsPTtr0TtoNlRtdyvaJ725t/0xqnP1ANEm50pM5f1qDc8GMErwPkuWcj3D5VOGDG0D2OScWtWwnodmhsQr0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOxh1LSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jhh5+AXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7VC0M1493622
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8LBTPEg6h1Y7za/pguHJmr2p6xBplPTOo6n03VNRxw=; b=nOxh1LSJ7nWE1wpR
	enNoFVHVoobdSDgDMt2Kb+JRKU91/XKmOiq7aqpx4aYklieqZ2InjPy6rPTE7uWE
	5Rsatz9wmJpjLKY7RuPODp0UO3mgV09Otmo2rpgDpYbbfQ3ql/mjDupjbjrQat6Q
	yM2FaFGxfBM16BmF8921O/rUAzwlqmLPJyLog0XtsIrDxb21Z9d/aROJEP5jgSFs
	GDko+xp1LXz4mWNeRuchVY/f9x3goL7NoiNhTGD9bVX2aOkeeginI//5X4kV+VE+
	gi4W0vyfskPCahoPDIb5wgFxaQQHNsPQdhdYa6wqijC8D+ZeqGKD+kz4KqrSs93n
	jjLNLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5w00q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:41:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2955cc1eso25532671cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262473; x=1774867273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8LBTPEg6h1Y7za/pguHJmr2p6xBplPTOo6n03VNRxw=;
        b=Jhh5+AXPKfPcKp/WvVPHeX8FsRt55COVTCagbCAuJxi4+y9udeof6VMpZjQBSHcMTk
         ZBEJrr8Cl6Y/UFfFm3vWjxd+BzJFGF4mWM2XXAJImcrAnVALy7DKd9cSI7Uzqv9Rc3eV
         7HqQxtgOSAQAw6TnOQnzfUbdYiqk3YR3COC1QUddCKz3OuP/m9sbzn6EPW8AB96GLajO
         s7ylnLzu4VsL7SFf0nyinYgMKH3yA876GkTzg7v35DS/9FdLMUvw8x3okc1YCjYj2obQ
         RHeGgu/CLibmSZv3iz5V7zyEp2oemDlHNg5P//wIB4XbTQea6Lr+PT8uKshGmlgeKFdW
         1KDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262473; x=1774867273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8LBTPEg6h1Y7za/pguHJmr2p6xBplPTOo6n03VNRxw=;
        b=f3Y50Dp9QuSJrQ/tli305gDDApQPUDPza7QB/wONq40seDeQxAZMiL9aoT6Y/eYtcQ
         y7qlJuB9J5I0agE6qBQL9LRExncj7mB9IvuiPwK3LgLSA7xzq4mkilMzh7tjMQZ7cZ4P
         syOnxEu0AYFdrxnbK8+ucckCACE5E706+iMZzRxKAi8blqpHQt49e3bOUkhMouMtl424
         WhSVAHBuPEtluKjIy2W3H8suClQvPByL29AEQA54L4ZIoVEoF1r6WQowGESH767eYBS5
         /norffR3JkyMnvLzHl00/kvtr12b2CwjpRMEoHfG/OAXYb/sIVzzWlUc7jlKvBV/hLQR
         9/Cg==
X-Gm-Message-State: AOJu0Yxx5O9g4pWVB49li+6pAQucoXRwx8nGCHqDVIW153D4K0lKiI4Z
	lq2Kk4QnF+1+OE+tgtxE5qwbe1QFSJaiOG3VQcx5fN16vqyOwFPORk/GiTToLWROdre34wKQBVY
	irFmwQhW38g1Euc1G2Y42kkurRBP5TTCKeRuRqDmvpGMqFol29j3XscCiUfVK6Dlh/tot
X-Gm-Gg: ATEYQzyMI5WNbaR9X6b7BvGQbQXnfAR+2lK/EJDUucciSb2M7EM9P1uVmyyl2KaHwXa
	jAhsXB9IfaSLkjEcb5mGAvDvMRPaJq0/UhLYP4ptWs11gq6Rk/VzQvaPKuTfTVJxPWsP1gXmcD0
	AKFvDwoU0RIL3BOknxeRje5CTDtRNsiVXTtaRMpeu1MxUSmS1EKcYlPQ+/ljZr19Atb9p89mIMX
	sT/KuspxzlpdFiN4xFm+77chhcm5+HZqxDN4ax/hJ9D3Gzth7LkuYYXSccL0olw6DgvccaROJZ5
	THbGOUAuYF9c8J4xRt7IFPu4LdIg1V/OXz9W+0NJL8DfysLPWcmQpZK0pktwtCx8jcE32U4PIcz
	JleyquWnMT1swOIBGpGsom8TgbXDxxEM5rWe/LujtE9ahAUOeLT+hxe8OdbbDoqbRl9B5+Dk5Pa
	EpaTk=
X-Received: by 2002:a05:622a:4cd:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b37425671mr126608621cf.1.1774262473382;
        Mon, 23 Mar 2026 03:41:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4cd:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b37425671mr126608331cf.1.1774262472926;
        Mon, 23 Mar 2026 03:41:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf7e30f7sm3571255a12.8.2026.03.23.03.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:41:11 -0700 (PDT)
Message-ID: <e01920a9-6e0e-4101-b329-baa706717cc6@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:41:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ARM: dts: qcom: msm8974: Drop RPM bus clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-9-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-9-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c118c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wPxavPm_kgLNTp2k2vYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MiBTYWx0ZWRfXxMKPvddmFGEG
 UzdNIltvXvzg/Vag2W9tcjy2bjSzjOat5wIegWmo70+7bO00jEjMWQP0ZH5SfrDnLwroCqcMmj8
 Kwert/hWW2JmFLn0TT6/GDYyWG4mF5uhiokSedwqagmMPvxIbbVRAQ0KsK7T0Ys2yaTTz2Fhh85
 8l3NPfTSU+hXlTfmheccYZMhBqiOZuA/eLfMojtT97P0xNncAzp7xPxD/P0W0/He0pGsDqDR2FF
 6JCxIxnFjvVwV64C5bdKB1MRZhHuYU0tZw+B56wEJVdB+rPa/VZMQFjIBNLGc3zzgPcka50CGjp
 ZAyIQuNoOopNNn5FAzl4KIacs0ETaKQ6tAZfX8E61yAEpvQUkN6G+Fak5Q9MYdSbgnnElL21KpJ
 P8+AP8k1XpQXATcEL7DAY+iMphx8k2rsSpI2qDuOu9SkCT62vxE3ZFbDH3aGg7o5swFgAMNKzip
 uFXUrQH3rrz0WVPkOfg==
X-Proofpoint-ORIG-GUID: MOkiYYNpnfA_ZtFJ0qTQuxvcxSaERuKp
X-Proofpoint-GUID: MOkiYYNpnfA_ZtFJ0qTQuxvcxSaERuKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230082
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99195-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fc4a9000:email,fc480000:email,fdd00000:email];
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
X-Rspamd-Queue-Id: AC4172F07C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> Some nodes are abusingly referencing some of the internal bus clocks,
> that were recently removed in Linux (because the original implementation
> did not make much sense), managing them as if they were the only devices
> on an NoC bus.
> 
> These clocks are now handled from within the icc framework and are
> no longer registered from within the CCF. Remove them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  		mmssnoc: interconnect@fc478000 {
>  			reg = <0xfc478000 0x4000>;
>  			compatible = "qcom,msm8974-mmssnoc";
>  			#interconnect-cells = <1>;
> -			clock-names = "bus", "bus_a";
> -			clocks = <&mmcc MMSS_S0_AXI_CLK>,
> -				 <&mmcc MMSS_S0_AXI_CLK>;
> +			clock-names = "bus";
> +			clocks = <&mmcc MMSS_S0_AXI_CLK>;

x
x-names

please

>  		};
>  
>  		cnoc: interconnect@fc480000 {
>  			reg = <0xfc480000 0x4000>;
>  			compatible = "qcom,msm8974-cnoc";
>  			#interconnect-cells = <1>;
> -			clock-names = "bus", "bus_a";
> -			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
> -				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
>  		};
>  
>  		tsens: thermal-sensor@fc4a9000 {
> @@ -2223,6 +2207,7 @@ sram@fdd00000 {
>  			      <0xfec00000 0x180000>;
>  			reg-names = "ctrl", "mem";
>  			ranges = <0 0xfec00000 0x180000>;
> +			// core clock is unused, kept for ABI compliance

Do we still enforce C-style comments?

Also "unused" is not really right.. After the 'revolution', SMD_RPM_CC
no longer ""provides"" that clock in reality, since it was never a "clock"
but rather an interconnect resource

Konrad

>  			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
>  				 <&mmcc OCMEMCX_OCMEMNOC_CLK>;
>  			clock-names = "core", "iface";
> 

