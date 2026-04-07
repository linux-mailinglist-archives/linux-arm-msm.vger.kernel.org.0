Return-Path: <linux-arm-msm+bounces-102140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JtpG6bl1GluygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:08:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C004A3AD7E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57D6C305B0A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D443AB27E;
	Tue,  7 Apr 2026 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYpa0Kme";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcoCiZ3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4001C3A784A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559937; cv=none; b=DhPk44LwfJrqj1oj+40DXNX3ob0SB8dmYqKRR0dmZLHPA/OFMTwRmZtfAqK73l05Kuzt1LHkj6dv9+K1QSMb3OgXCWb3ZViU+yw/eHXTueSwPATuLDoZQsihEQmzReCyU3tvRAparEoAh/4tEQyc/Qw5VmvPRTjLFII/AJh+rNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559937; c=relaxed/simple;
	bh=wYs7LP+CwpZSSYTwk1QrHLFlXIo8bKJgPk2jFbQEx8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCOc/b741n3wfG27YTx58RQYU9B7vZbSpFl3iMRmrbtQu09J/ohOxePZmqRBVASg/qYseIvnlvJaAI6okuxgOCLIH2K7akeAkDCt45lsQCL0XWupsC98RciOdC7UhTNrVF2G0WeZPbtqfDYM3Ftayq/ku/2Y8NtGkCf+5TsiDeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYpa0Kme; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcoCiZ3h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376kIhQ1403547
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZb7XG487cufxCiXWgItkS+Okdf5TRVRTd9LbQnWjN0=; b=hYpa0KmecTcolIKY
	BplPypP86ey/BtPWkqnytqbfrO/0kMYhsr07qv9flGOXIDF0IIMyYExfnA38ZbB6
	McxZDHahPNYyomVbXreDlds5yUcckB0YmhPPfptuiW8sEfP8LYx4RscPlve88h1T
	G7yfm1Ux57XjJXLX0DqwwBLRbEBvktaoWjALp2xni0R1oV4Tq7vcu+prQrBRL2tU
	MgdwnGoqtPrjkiJF/SKlcawguPvIFLrJ4Nl7J2BNVmH24AzVZpIHPIKYOyx3BwSi
	L2OGxAkTNgNjpuktliJuYv8fmGC6H0VwB0AEkkjuBlysgRZjHIssje5puJB4y1xB
	iG7cyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8adrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:05:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b32feb719so6401951cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559934; x=1776164734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZb7XG487cufxCiXWgItkS+Okdf5TRVRTd9LbQnWjN0=;
        b=JcoCiZ3hDmEPoTB782VmljFdDofZf6RuPBfWIEIsG06ZpkBruI/xKouT7w5HtiP5ns
         P/070xuzPtMMrszLJUCyNvuUIzlrNergA2/NP1AvTHk0BPF9/go3AxYMHyezuas/G7e0
         PetleHLU5cQhx6PKXotQVBbDxwvOSXmx0NTEeTZ4pSzFhOt+ROBiOyLU1tRdctHPXs1j
         Stam2ruA+pUe9jDIHhQ+iFlW/roED1BCYD1Qo4/8/2n/em6IqT5TXXI0s4ZYH9fwAEJh
         Hz2cfNArxUzdA2OVbTB5ipJ4rLQ5Y3mDUWiq1ikoRCELy7D3GnHwS/kL7E77520cZhp4
         WW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559934; x=1776164734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZb7XG487cufxCiXWgItkS+Okdf5TRVRTd9LbQnWjN0=;
        b=XoqOiXbIP+ZjeUlkyQXcOfttPsEehA0dubnN+Sfu5gnrEet7tozbX+yZJdhrojPnWu
         CK6MWcxWv7moWgbNlAuLXTAYdCYn0mUH+MiyAJLnZlR45fI5bBFfNEM/L+H1l9+t0eFM
         dJ9acVhCSXt7LoVjcHs3LE8P/Jd/UvsbmI5vGkUtWExHsFFnYxNAopGiWdut/6C9//Z2
         G6bcl30YdcA3C2twucTY1MPdodseN3QN9v7CyS3O01y755WBNcwc2ZfKDA1Op6oubYwz
         lQX+ICxlJdHEPtO2uT0yOn1kO7Jy+YPnmUoWN40myKFpC00d1oiGJ4WrysO/yzChrGoL
         Bk5A==
X-Gm-Message-State: AOJu0YwzQI8gyTw28h+h8Lt4xTyCugIUcX5quWhK3aKEAhT1pLhx+Xz4
	iG1LC8Xg61FNnwW5kWkd3/jfJcFdl5b2+Jr06DFWmv+leWF3ppqK/A1TV3taxxKj7z05juIByH8
	LlLs4brTqVkVBavCv/auyzCiT8w4YN3lwPtsRVAT6fbHrK9A0cc1zx0DeNdz+Jv7RoCtYbag8sT
	4r
X-Gm-Gg: AeBDietIwcfYTl+WPYG7QOQGeugnle4MQDXPEpdpnTXejPGskdysizRnWnpD1mnVvLQ
	9iBBlt8Fy/Jm61zKiklqyoIkX4rXV4cuCVo1LrZ+trMXrEvsrzC3mAPXq2ivLHdjuJeDtFK6eBw
	qcfJh1jiiqsseISTnFugwDAevXsxZOKemfAqpgFIfxVWOmTBAax2gNMQmk/+/EAds1Sqw+KCYWE
	WBVfiSccB9pVeQt9HaRnN+sYaomg8YcABvBGFZ//XTO9rgRRYIrcFUlFMA7PT4LipCJ8Y8reKYc
	tUQzgEWQbXrAA7/VxuFoHSFcAdVAO9VPDwBgoYQGGl0YDPjm1OG6NJtGCM34qud1yGVa5ZhtcoD
	GQrM62nnXBgjCQKXjb+PTSSWa2r4MCNhT0Y1UJUwRHucE9oA+dhapv6HTVt0wzz/Pi9Rlkj/LBp
	jcJWY=
X-Received: by 2002:a05:622a:258f:b0:509:e68:22cb with SMTP id d75a77b69052e-50d62cd9f4dmr184118961cf.5.1775559934475;
        Tue, 07 Apr 2026 04:05:34 -0700 (PDT)
X-Received: by 2002:a05:622a:258f:b0:509:e68:22cb with SMTP id d75a77b69052e-50d62cd9f4dmr184118581cf.5.1775559933919;
        Tue, 07 Apr 2026 04:05:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff17basm547511166b.50.2026.04.07.04.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:05:33 -0700 (PDT)
Message-ID: <ac8a4139-f7ed-4ced-885a-59145c188406@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:05:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions and port labels
To: jsandom@axon.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IktZ3qXkgqAA1j0rGX7_3kA2lg2KABB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNCBTYWx0ZWRfX5wFghIbWIAzs
 U4fB6QaTa4jnztRpZMHrvTkptg3ofi78668Ef9iNTig9rh5ZOa9i/sZEGlfHzca+g2Pf3zhtLQO
 7vN86CoDsWyBWNny3qVataMBuyAbn7wWL6NuQurT7j4Hnx6yzCl7T0s8LTEmI2In7dsFRdR6aYm
 3GbU7zXPn5l6LWszxqU7obWZhMWJmZKi4yzYQEdW+TH29z6Gamz2dN7WwSwzeWGiylotCv2GuvA
 DkGPH9nxN4PBNxRa0y8j+RH7IHj0FeqcViniBiw1Cercu5PqQ6YuvBF7uCO0dX/Euw7aDibzg/t
 3UmCDhWlCLt/9lLxrJNpOA95/1/hhN6sUw53iAdlhR+cc53r4k/oovWBDDzECqMSUVNUsc+qsrj
 5IqHbtZ/xZv9Guzc4Lh0j4/EmJrVwuWBc4VDkE+oS02uiUwdNrETszWo995l3ZIsxu3N2We/si6
 pwqg3GgnhnYIo/XpYYQ==
X-Proofpoint-GUID: IktZ3qXkgqAA1j0rGX7_3kA2lg2KABB5
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4e4ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=h77gEMGJAAAA:8 a=Tbjyt6IBEl-nZ4hlP0IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070104
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1c00000:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,axon.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102140-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C004A3AD7E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 11:50 AM, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> Add the MHI register regions to the pcie0 and pcie1 controller nodes
> so that the MHI bus layer can access controller registers directly.
> 
> Also add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> allow board DTS files to reference them for adding endpoint devices
> to each pcie root port.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..d4caf4d00832d7f1e8f65bf2bc873cddadc42168 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1964,8 +1964,9 @@ pcie0: pcie@1c00000 {
>  			      <0 0x60000000 0 0xf1d>,
>  			      <0 0x60000f20 0 0xa8>,
>  			      <0 0x60001000 0 0x1000>,
> -			      <0 0x60100000 0 0x100000>;
> -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			      <0 0x60100000 0 0x100000>,
> +				  <0 0x01C03000 0 0x1000>;

lowercase hex please, both places

> +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";

Since you're touching this part of the file anyway and others asked for
more changes.. could you please break up the reg-names that you're
editing such that there's one entry per line and they're aligned on
the opening quote, i.e.

reg-names = "foo",
	    "bar",
...

?

FWIW the reg ranges you added are OK

Konrad

