Return-Path: <linux-arm-msm+bounces-104291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI3VI0j96WmeqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:06:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11784451130
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9879304618E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF593E5EEF;
	Thu, 23 Apr 2026 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkD+Ip5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjAV/Puo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18E537DE80
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942335; cv=none; b=YgVTbWmlEhSGaCO11zWaSedslLexDEWR+inzb9i45su75PBwUcmAEq34t8jqMWuVJbTCykTkTW7wAMppy2QfNC8DyPHdz7u3bDRW8155xO+fQBKtFCSlce6L6mN5gnn4hB53hxymZeNlY3A7YydHWP6h6x2CtNnU5yiTvjYSlII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942335; c=relaxed/simple;
	bh=qI2Id4P0fbBofLccnuj4bcYqhbv2Jhxv46vFPW1y1B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnqCU3bURlXmdwESG8b0qfimtPZSXTKO0mV3E96txclsiUZn08pMkXlhSN3usgV6aJ21ABxydV6d33EQh6IaP52WOp0OmDvDe2ea5RvvH3ejd/hjzaIYky4gsUOp9O9lVmB9AXlbGYx+DzyS75xozygFJGaCh3z2/OACzEAr3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkD+Ip5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjAV/Puo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u17I366166
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oym2NRz+YmrUEODJiSP1u6acTfO1/H2Al0orTnseQZw=; b=WkD+Ip5D7gAl2ImO
	RKdM/lxBMV70OUpU3JbsxreCbr2PbC0jiH1u8n7phijgp3e70B+bLCYlkGizUKUr
	fTqJcPBt1ZwlEtw4czY6yFOIApRknEUR2QnN407N0fQ+OjCCZJO0+eFmBdAP+OZM
	b+bh9Lgb5onJPnrm0p/ahRGLLa3iBG8s6q0P17IV5Pi3MBhk3JOrlFj5A8EzBd08
	eNdKSk80RNn0bjG+NOSQTj20dNUPej/NQzKIsT/f+f3zPyw+DEMTEj6iQO0CgmmX
	JaBEge6WNW1pKVTEg58aH0jvG2zkOfwmSEJccs5sVoru7HF0nT/ZjqJwQI/n1dSW
	VyOh/Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rb4gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:05:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-611bf61a809so458644137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942332; x=1777547132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oym2NRz+YmrUEODJiSP1u6acTfO1/H2Al0orTnseQZw=;
        b=hjAV/Puov14TD/CCPpzHXW5wK96oN2kXCElCKtCAycNxxzIaLi7BHAIlKFq8pMZUGO
         rqnHxbyosLAuUe0wdgw/dLJOQqX5J5Zl9Bx0S2BqJWxnUZdLqKTpPz8FsblvGnbc+MpI
         RsKakeBWJxvLM/ZG0wfH871UdzCWPtPxminDtNY9MUVkzZAi33DSYIyOw/fCuXsqThH5
         9+Ptu6MY9yH41vR7j86TqvPAMiEjDAiVaA69sNXp+rGU/U3Nph2xDL9HvFisLk9oOWst
         IoDjqgbv3c4kMOHdrSIO+Zr806SlPtyYON98oIe+rZMaYE2yb/isHOiwe8Z76c00UJ2W
         ZVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942332; x=1777547132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oym2NRz+YmrUEODJiSP1u6acTfO1/H2Al0orTnseQZw=;
        b=IzvWqUCS/WWqyztgeTQC+ZQBQ1eW3m9OGoF28TTfnzkDe12TKcuS9F9lUZj4ooK9NH
         iLX8eUuwmJsMB6fnmc2l3uFF+JtYhgE9AJdg2Vh8Mkm35FhYuiQnJmD7Lju7yEEhzEFA
         JvyXpt6a0TqwStSa0b0pUsazfaxzefJRe0gJR4DRQnB4H93OpYFfchHAF6uhkENNi779
         G30StBvOB7nWZBTFFJ4H6ny47GU1YgEvhcQfC2fDc2UFeOx/21taShjCLDwoVN3OgJ7m
         uF2MAklNj979ADA7Cv9Hpmm29onNRzzqwWQYTI7JjuUYzpVUYX6kJ68W+OYU5QsJZ39z
         N7yA==
X-Forwarded-Encrypted: i=1; AFNElJ+YP14NHan6IQupBskAHsQ4Zeazq2f5C1YT+be3PQtcXi1KRtN4ZIMGEsBU6Ak2GzkoMMzF1l8ktFr6JByP@vger.kernel.org
X-Gm-Message-State: AOJu0YweXqfsMbxu0pavlmSyrJagYYiZjdbHPFB8EDRDqSZGp4h8P+QO
	lGnDlgIJuz1TKnEXZZCyk+k6ckm3gmqORCQeItcsB9Nl52s7EWCHpgp3nWA+A4EL/YwsEHfc2W/
	InkL8oL33psn3UMFXMOmXy2Win//V3vgqe1UYijFcICxZ19HOVOmiWM5Ye6hjfFgQVKmEGVKeYW
	U7
X-Gm-Gg: AeBDietpOkBmcA2JYNFP75BTndiES1UGN+I8SreVbBLFTqKIHvyEBu+n96LRFOh/0dA
	Pv35APlAja7+r+W04Mu0zFJ/8WH+wVlzYfI8RewdYdlQkimS1Ni6Y03gGYDT7dh1hP1S9i37Eu6
	Nh9NyYDEyfAT5i3BfooL6/FR6+zvIDx8fI7MOvOKkDCNHkXAxl+YsdHzBeCVuXdGEoHm71MnWMZ
	sC0sRgRe5uplyLAF6vxhCt/25AVhvudWJQwoZGjBr+VvcH1/odDgDNZOpX/FRmTnwod2wWzOTdD
	jXqG9G8Th1N2NeW09yLDzKNMXi2uG33kpK4Vz2svW89kv2Hv2/EdlT3Tdtj/QIv/+d/ZhB4dGrV
	H5Czdo/tHQz2dDIrURXYvqUi7H5vQ5QUuUI5Slhd3bw0wicHAibnNx0bIF9A+8sE/kGHiyxPZIr
	MeqjbE2SoV4r2gpQ==
X-Received: by 2002:a05:6102:1609:b0:611:82b:add6 with SMTP id ada2fe7eead31-617003c48edmr5182222137.8.1776942332205;
        Thu, 23 Apr 2026 04:05:32 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:611:82b:add6 with SMTP id ada2fe7eead31-617003c48edmr5182210137.8.1776942331797;
        Thu, 23 Apr 2026 04:05:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f652asm40152231fa.12.2026.04.23.04.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:05:30 -0700 (PDT)
Message-ID: <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwOSBTYWx0ZWRfX/aVASEZb78DH
 BDPWJ5g/cVSqtKB/aYfFZCT2bbtjPivYX4kv1IlMbBcU5vd+O3x35zj2GUeJv05LnPUUJXuDJCq
 DAwDCa8emj8GPg+Df09VFOZn6jJjGmw19DAPrFri/+Z2TUsvAj37Rs5yvQkNAY8BkzKIufoL+no
 NM0c/I7TE7b2AlAMdnmJB2rrBG13+HF8gJf2Vc9thx2MAJbZo9I4GWYAKQk31+1gTTvpBwympvA
 C7dssb/QGbiAB9JwIVo/rDbZ2HXbrR+/erYVRXwAO5GyXj357GUrseFQduX7gzfvItg76p/8iT9
 IWP0WkeuUWkKYXigEjsTprSqyP8nZiueCEDm1qdJSyhMGZg8YDhknDXOxz2WZDMMdSpF0DQuO5O
 rr9q1N2zeqKS1zgsbRFqT2RymXK9Re0C7kA8bm5eTPNdhgIf/Qkef55+AQqviiUe7b4LBKKCCvS
 HZkRDQtmT4XxGTy2aDg==
X-Proofpoint-ORIG-GUID: wA2o7Xu0Mo6EmnNc5n0I9tqEcMdhNuq5
X-Proofpoint-GUID: wA2o7Xu0Mo6EmnNc5n0I9tqEcMdhNuq5
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9fcfd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=1l1YoXn3vtdfKgcNvScA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104291-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11784451130
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 5:39 PM, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 36b419dea153..af2bc29ccdad 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2458,6 +2458,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;

Please double-check that, the VMID used to be different on
older SoCs

Konrad

