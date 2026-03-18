Return-Path: <linux-arm-msm+bounces-98433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBugBgWLumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:22:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 817282BABC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 590E6304002F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE123A6410;
	Wed, 18 Mar 2026 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5Gfzwb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iT9YOnAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCFD3A4532
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832696; cv=none; b=F2qISFZ2B6bHJMqm16wwRTcrMvv2Ah7PjUoA6YNxgTozVJBhoxuFThi7XB7fex+8Xo4DM/e5auxxfeFFR5ni9NXdxDk27wPDO98aU7BlkdPbKtnqn1p2KCRycqIvr2tXLTUwRZR8p8uVKLTKlJJk1w2pd3wq1V0doXskoV3cmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832696; c=relaxed/simple;
	bh=cDfxNHsbKMfcqtlKn4SXglN15qxSbPcn6NXFToWwxZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rR9F0WphXye3TOXpEriZCFt9JNXRAs9qSJINci3KdOp13Rrjy7XQFunsdyf4E4KZtvM8CA4V9/EB2GsHveF5gVvr4/G5LQFjrgBp6F65CESmESToHJgL0p2fKROV7QYfa96gbOTM9I3iB1W5FnSy0Oj2gsymP1qvYlSlw6vKSy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5Gfzwb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iT9YOnAD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi4Mb008780
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MMAqfRUK8/qrilq1EPFO0v6BKRLCe9ctaNNeJl9j3zM=; b=L5Gfzwb603FRNrRU
	ckK1LtpTH31dtm6KzVl2re9qCxUts9eChQ3QI+gojUxHe3fMbHSbWvrvqAJ0z953
	RcKlnrE5S/i6W1WvFox1u68Vsr8MVtEWJW1yP2o6FbSTXTaecKTgUsmE8CJu98Zh
	/T8c/DWfo0DyKKyEcwciaWa5hy+7iaNLrflvn5JkemOh2uzYj+YZcVRKFqlot2xl
	PrBNXQgl156miqtMWqJTnzzS16yF4MKeg4MaCi7/bhyMSgYsudhKeLu6wfcIBLdc
	/56o1OrF1aXhHgjKcXW7XRIhLRiIYkPZxsCGG/mH4sCleYMLOgk8C82TNsBqOuFG
	j9fbTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj503ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:18:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50947db2e97so59837431cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832694; x=1774437494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMAqfRUK8/qrilq1EPFO0v6BKRLCe9ctaNNeJl9j3zM=;
        b=iT9YOnAD/Cg7cPME81mPs73XGo0dg34PFZ7ihlA/oZ0czch7vrGhMlTWZTxeisbGfR
         xMYFHqXktKFXDG477GporY+Dcz5qBJELcvPDFyyTVT7ZWE06OkSyc94qAD5CUvFpID0x
         G6+ghzulbgn1aoHxUn/taf6TPP0DpiDGLQhDnVmKn4ijJ+KFTqcrgg6gU/T8w9rV7cGa
         /i4pk+vtS3Ufug1jbctOB8jW3MH7C5HqmMnjbvFrTBenxxH07h99jv7K42L/mgC1mseg
         W6+u7A6fEF53GbcCWNMH71nwcWz390q+5Kmy9DTK9LHhii3lSkhzEyFf0bPodcbye8Ef
         IIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832694; x=1774437494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMAqfRUK8/qrilq1EPFO0v6BKRLCe9ctaNNeJl9j3zM=;
        b=n65LKLqAWiBtbJVjsXHLYagJ6zHNnLyq4dxC8KB7X2z6i4kfGUHTeJGrTfgaJiO6LG
         Dwi3cBT1If8homfTAgoIVti6mJqbWHNgwbMk48ti80EfoIY20tc2J2a7wt+8K8XEpg/r
         ywqIymGj4Hedx9NaXphl9dOHSiECi1QjNqYpGm/2prh8gLtPamej5JBWZagU2u2xJRq1
         Bpd707WhyYwFCytkD//IoGssjZjRvG/f56YkfFNq+HHZyzhRA/lLXJkYu+SdK2bQqeft
         NovJTovAd/NalSWQdOjpjUuSayvgXwIVwTBQEIYgSaNnTHWCROCZPHNX3w3PzUxSwIZx
         3PzA==
X-Forwarded-Encrypted: i=1; AJvYcCVAJLKyJPrwievgBD7Ml0JJcFQ5lkj6QIZAPYRVw47zA1I4f/jqAqKAL/elisDUsAp9fvRVTDm4nV7cjw1H@vger.kernel.org
X-Gm-Message-State: AOJu0YyBeGrAiYHEEiVDwkrtIeJtHrumKyiQ7Hx+gzLGnQJMdH527JHx
	YuDuK2sIVBYbXAwEtrydJX86d1CwoWVGk0Y/J9Sxy3/4Xvys5klYECaZu0sX9kfekc0mIvuaDdu
	vCwWNYiWtkUKDEe4ENuGskNSThgXBJ+7ZEEjnQNp+LeOK6KsxhUtfKTbQ1HOm/diTWLv9
X-Gm-Gg: ATEYQzwJd2tWT48nev64wftS7SrKkMTuxRK6Ab/GN3Tfgb7W9B4H4NrTGgYV4MWEDPd
	R5Jxog7gypyjTfq6EVS9UOMNPSzHhgZFtMDEXrjiDLBuHsMX2c4qlskqP7xxReSJezaGdsGGZ7u
	TXXcp/PN5ZAo6iiFJo9hp4kUuHcvSeyJ8Bji1LqtyMr/JkfxPCPE2KHZ25QgjZviG1Tf81FIN+I
	6Vd/rctgxjXjFNQZXu4wdQ3qXt7Vfj7S2b28UgEM3v4F759plDRi/spRw9IyKuxoWizENWJbXGS
	7pshI732pcDqcnPEJZDAysxhfn3pu6vfAk1a77O0ys+ixIIz3lCLl4kkwxBVvra+5SQxvUnlcPY
	VQW1uxTKkwOLdGo98wP4KtLyavZpQFRMh72Kz8Fzdmv6lVbyCs9gyVyhSKhOR8eS0FHq7/NQ819
	D7vv0=
X-Received: by 2002:a05:622a:1aa5:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b14751006mr27541151cf.2.1773832693588;
        Wed, 18 Mar 2026 04:18:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b14751006mr27540561cf.2.1773832692775;
        Wed, 18 Mar 2026 04:18:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f17410aesm185250466b.62.2026.03.18.04.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:18:12 -0700 (PDT)
Message-ID: <fc42719d-3474-4883-859d-b12a1c4a5cee@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:18:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Introduce Eliza Soc base dtsi
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com>
 <20260318-eliza-base-dt-v3-2-8a50bd2201ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-eliza-base-dt-v3-2-8a50bd2201ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NSBTYWx0ZWRfX+ZkYjRZJjqTo
 CA4R2H8IsYe/4goEsJq9ly1Ugwv049gA+2zDqLGx7rHtSB4eXX0h4ybnNjdG8AZK08KRttGR5AX
 T9V0665adJyYRwv/3v47CCT7OtunCIEoT1JDzZMFTnJETBYOpcfyTP1v4AbRFD5bll6y4W6j8/v
 8II9Dxn/xqAwogcjWEHSvncAKpjqRP4mu5EdQsV2GXzecPvFKwhBPQtFtv4sSvenxA500rY+mUx
 74RXlHnRqjL+UJg5WYgIPdY1x52zgdh7BRiNTY3mP7AEMVYCVwRwxXi7iRW3iLsE+9gXhOkE7Dk
 hOuSSb/9/MnlZoLvxTtn2fxnTrr1tMuuliIVeTC6UDhd4ZwYErgWURL8IVo/vbnX9k1FRfy8PwS
 G3kfjc1okPfGKnrNCEagsfdW4q6ecEnKl4nvfXA/CDOyHcSkGSUMJfst65naSuVfzDPz6HUnJBl
 Enj/WeEoc8psavYJd+w==
X-Proofpoint-ORIG-GUID: MYIeqoUhG9CVMF68YhhGiJG818Xw-rER
X-Proofpoint-GUID: MYIeqoUhG9CVMF68YhhGiJG818Xw-rER
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba89f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2ZscZiC02MhLG_3MCHcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,c400000:email,qualcomm.com:dkim,qualcomm.com:email,0.1.134.160:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98433-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 817282BABC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 11:19 AM, Abel Vesa wrote:
> Introduce the initial support for the Qualcomm Eliza SoC. It comes in
> different flavors. There is SM7750 for mobiles and then QC7790S/M for IoT.
> Describe the common parts under a common dtsi.
> 
> The initial submission enables support for:
> - CPU nodes with cpufreq and cpuidle support
> - Global Clock Controller (GCC)
> - Resource State Coordinator (RSC) with clock controller & genpd provider
> - Interrupt controller
> - Power Domain Controller (PDC)
> - Vendor specific SMMU
> - SPMI bus arbiter
> - Top Control and Status Register (TCSR)
> - Top Level Mode Multiplexer (TLMM)
> - Debug UART
> - Reserved memory nodes
> - Interconnect providers
> - System timer
> - UFS
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,eliza-gcc";
> +			reg = <0x0 0x00100000 0x0 0x1f4200>;
> +
> +			clocks = <&bi_tcxo_div2>,
> +				 <&sleep_clk>,
> +				 <0>,
> +				 <0>,
> +				 <&ufs_mem_phy 0>,
> +				 <&ufs_mem_phy 1>,
> +				 <&ufs_mem_phy 2>,
> +				 <0>;

power-domains = <&rpmhpd RPMHPD_CX>;

[...]

> +			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +				<&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;

please align the '<'s

[...]

> +		ice: crypto@1d88000 {
> +			compatible = "qcom,eliza-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x01d88000 0x0 0x18000>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;

I believe you will be affected by the change (?)

https://lore.kernel.org/all/20260318-precious-qualified-oryx-ef619f@quoll/

[...]

> +		spmi: arbiter@c400000 {
> +			compatible = "qcom,eliza-spmi-pmic-arb",
> +				     "qcom,x1e80100-spmi-pmic-arb";
> +			reg = <0 0x0c400000 0 0x3000>,
> +			      <0 0x0c500000 0 0x400000>,
> +			      <0 0x0c440000 0 0x80000>;
> +			reg-names = "core", "chnls", "obsrvr";

0x0, one a line please (also below)

Konrad

