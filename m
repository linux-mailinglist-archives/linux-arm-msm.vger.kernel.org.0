Return-Path: <linux-arm-msm+bounces-110256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBG1AiF3GWqwwwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:23:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A676018FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6137A3039CA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121E73D0935;
	Fri, 29 May 2026 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLwaQyR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlMNcrOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1653CFF72
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053462; cv=none; b=ot8Dpcuuo40sFuSg94FDmGJaPCRutL4OnUFT0oEh4qdysWyZ6+S0oOjF5F/4u048aHxMJ5Hdth8lUymIirb3Eqpy/HesItxDhiqyQRxs3VLUZGeS3jbmxHl6gUDf1wGQX7IFevYyyOsFfYmRDvZlNJllNLMvRfhYFplXnzMI7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053462; c=relaxed/simple;
	bh=IBmlyDzfF8aWtyA/qYIJJU3gS/F62zvROpfr4+/L8dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTeCRLdkPLzui0LO9i92wsHT+IN/eTVSPKLrg0ZFeh1DJam502xIdoSww4XIoLBTK6eOlzb5NLcBIWGL9E3Q1BDLuWijaBsfC8flPy5wyVtUY0gK/DKbWgiZQ7T5dh0RT88RoXBVXWslMKpBu7kwS7f5MeCFZT+i2UFwR0uEvJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLwaQyR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlMNcrOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6Rm5O562524
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QkmRn9TbcwNckCQs9FsSZUZ3
	HeV/NcF5t61EORQ7sJE=; b=DLwaQyR69nUcXelnPWKRnkTrx2e4E81OE7q/XE2i
	Mr83OaX5vhha+rI/Xm/Ks35OuebAFHtvnv+G4hjsisslRk/daKbPelLppc8v9Plk
	3kORx3HDRIKJx8Co7/vuvsscB5uTdJ3qQ9KZSZpylNG7hZAw7TjAzeqaaXJGngR+
	q4BpMjwH947CsfkVCRPL6ApXW1AHc4GegBcd0UX2Y3B4AM0EKGbBKtn/FmgHMcfV
	5KeZTZ9m6oevUletgbUFdxmxqJjpfX8WJ6M6W+E42FZiRorIklABnq+KUAP4P5mU
	HMMz1vM0DtGoEWMpxyPfre+UyK4hX7PFnIsEEb1iFVS7cA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug39ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:17:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5165d10e036so245075931cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 04:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780053459; x=1780658259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QkmRn9TbcwNckCQs9FsSZUZ3HeV/NcF5t61EORQ7sJE=;
        b=PlMNcrOX+2sEGA1fpwbRy8jo/JdPU1zhqitYDKD4wdIhTEKNwX0G2PZia86dgo3Hdx
         4EI5S0nzsYOWFIAudvluddCFjNXaHj/xnAa9gvfBKZUUqX43ky/+vWP8gzsIBdpF8D45
         pFxUVUdUgStoUUeooPCW7/eWqdc4a6J3NMuU01W6F8d+eofDbErFb4NbyUjuTB+eG9cf
         P3BRbccEEF4JUYOlc2iaeXE13D0FqSZnnL/AVrKLdInWT7f+4m2xZ6GltnzVJinnvHEz
         1fJ5gSDFKu5URipU/4abVdTRYod4xQRPqsRqRO+yf5RHwYDq7ijIH///+RwNtj6V9wRs
         CqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053459; x=1780658259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkmRn9TbcwNckCQs9FsSZUZ3HeV/NcF5t61EORQ7sJE=;
        b=LvS8ZpSIhuC4uB7lTFwzmLZJtZcce5qfxFMD9jgT3Cvi0djLPhKLq02Hh+HqYLUhLy
         rd43pKShYW48NZmrysyN4X3dg5+L7lf7Y3s9DApkvAsiVt/WdwRRoORzRVtB5jT8oLdX
         tAC3k8RwBq4lYfY7X20UqWfbuWjXB0ebo4wXWvGL63S1t/ld2jwMhdjNJ2pfxEJ0TM9K
         LTTzXGuQNlMc/iCJZtlC3xr2HOEOoEuCmcgkHsiLXsln3T6eSpq9qCwJrioK4gNpi8+z
         ekQ/YYx/akSzejbCanzTlJ/qDd0ufUvJHTZIVbim4D9goNHkSITNEbqQ9NlYOijoer8F
         vjMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/wtefsemGVIDMVrGjIkqO26C2jz3K2BVHTO+IoL4KZ1cd+fW8uwFCuHwAe2VT0zEZdxzGeVR9SZXh6GlL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3I0yyI9urDjoS7fLYdRgASwxPU+S0HuNqtpR8conHODpShr28
	eQJ/4pLkj3BHnfeiTls1IeA+HHzrsIihV7Go9gvgWzy/dmY2BfPVf2k9cASlZ6zgBsz42ZJRVE0
	35Scgy0EjyQ+lWUlnzlYI0Ceq8vinQXTWtYJhvntGbsfD2Uv14LSGNz7DiF0otLej2dNi
X-Gm-Gg: Acq92OFPdMFh9uG5Au2m6mav91N4h35NIhL2NRjkr/bTCev0dFCbGVfqJKz2+60i6sr
	t/W/IgIoeq6bw6A2VkxH1UBWVUy8FVxkT3KkEsuihA4avtZg4oWkYY5oNQYfrztqt8QoWxiMrsN
	L9VPphtCKdTAx2ITi/FG1r9wQp/wzgnMu8JVQKYclgx6SZ/Gl035r/4oEPUL5bsO0qZ8z2vV9hK
	S2sMF9kbzKqnqcxPWg4fYnlwmrJmMEzSk6VgFUuc6o6fGKVsy1bjk6MPDHOT8LiTxmL2Msg6lxa
	ejrYe8uex1ADip8qpXr/FHo/tK3709exFo6w60jQCEfr1tB/wjgMvD0ai5Jq2OxAv0BsoXT7+/o
	7+T9Fo5ztQgXZjBflkcnYZd9cgxseN1wKTGoEoUgBsSEg9X1qs7/3IzXE1eA/s6CtJdVtm4ZSaa
	A+JDV8JBnFwJQ9sfUqKdMflDx2YcnOleKkjxcHYRQ8sJFQiQ==
X-Received: by 2002:a05:622a:180e:b0:516:d70b:25ce with SMTP id d75a77b69052e-5172dda8cf7mr30123831cf.55.1780053459045;
        Fri, 29 May 2026 04:17:39 -0700 (PDT)
X-Received: by 2002:a05:622a:180e:b0:516:d70b:25ce with SMTP id d75a77b69052e-5172dda8cf7mr30123261cf.55.1780053458455;
        Fri, 29 May 2026 04:17:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793b9bsm211741e87.71.2026.05.29.04.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:17:37 -0700 (PDT)
Date: Fri, 29 May 2026 14:17:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 09/16] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Message-ID: <urft4kklev3palxzpkrbif3jx3fuwdzlj7weyjtodl62vbbzto@v3tpmfvsrlku>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
 <4guumv7ve7rshw2pjvumenopxsefha7hvj26tw2pgayz24ytxk@iry6qyqqqs74>
 <cd43a941-5672-46ed-a9e6-1bc134c94e03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd43a941-5672-46ed-a9e6-1bc134c94e03@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExMiBTYWx0ZWRfX3LgAv2iFTn1B
 SLIha23G5l9k60R3vnS/fzpbIWnlI6ImVvcfXrR3+l+HgvpQowIW40GX991ekW6nROmedP97i5a
 UjAymcfFmOQCTSWvBNSPTdPgjm3y9GbVyF9iwBvOaXYF7Cj1mXDzksAUvOQBlinyZjFUT+BoQ+d
 L+/wRFIiY0l2XGgzrAIcYRWL9M7g6rJ4F8M6ZpjXNFSv6MWqdXDvGlFyRoq9wHsFa3TxuPphkfC
 GQteY7P3G9rg4aRenvC3nOmH5fwi6Q8X5d7HLaxoplAf3WUwNlkUlDMQY9V+X+0s//H0a1k2m8J
 886Gw3eKFRhWq0Lcq6oD/RoukWM/H4jAni9qSAlIGHBe3kM6AE7ivyjWCJsrlI6Vtl8qGOjpZuU
 jeBdovQSAdMkZjYqpIA1tAuvBhUjfa2Weq6/vfhi2uu9T3IXuJ2tXLo76ueGpY6hfjZSvxFd3CW
 2HmybOvmvmqP2q6VKyQ==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a1975d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=I4w7QG70X0q2cnev5jYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: egsDIeUqnAEc-9yrkZNJhLTj-6P9O_cS
X-Proofpoint-GUID: egsDIeUqnAEc-9yrkZNJhLTj-6P9O_cS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290112
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110256-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58A676018FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 03:41:50PM +0530, Komal Bajaj wrote:
> On 5/25/2026 2:57 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 01:19:13AM +0530, Komal Bajaj wrote:
> > > From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > 
> > > Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
> > >   1 file changed, 164 insertions(+)
> > > 
> > > +
> > > +		remoteproc_lpaicp: remoteproc@b800000 {
> > > +			compatible = "qcom,shikra-lpaicp-pas";
> > > +			reg = <0x0 0x0b800000 0x0 0x200000>;
> > > +
> > > +			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
> > > +					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
> > > +					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
> > > +					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
> > > +					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
> > > +
> > > +			interrupt-names = "wdog",
> > > +					  "fatal",
> > > +					  "ready",
> > > +					  "handover",
> > > +					  "stop-ack";
> > > +
> > > +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > > +			clock-names = "xo";
> > > +
> > > +			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
> > > +
> > > +			qcom,smem-states = <&lmcu_smp2p_out 0>;
> > > +			qcom,smem-state-names = "stop";
> > > +
> > > +			status = "disabled";
> > > +
> > > +			glink-edge {
> > > +				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
> > > +				mboxes = <&apcs_glb 9>;
> > > +				qcom,remote-pid = <26>;
> > > +				label = "lpaicp";
> > No FastRPC for LPAICP?
> 
> No, FastRPC is not applicable for LPAICP. FastRPC is primarily used for
> offloading audio, sensor, or other DSP-related workloads, and is not
> required here.

Which likely means, no compressed audio support?

-- 
With best wishes
Dmitry

