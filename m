Return-Path: <linux-arm-msm+bounces-107586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIGuFQrCBWrXawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:37:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B8F541BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCCA83006B11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7E33A7588;
	Thu, 14 May 2026 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdZfUXij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNEjCCQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8AE3859DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762181; cv=none; b=WFX1BSR0jpRyXNEFFPw4Bd96kDQ1ch+/KHGtHEB5cPRK1tYF7I44j5h1fAfEFbnbQ7hZeUPYs0W7tDRCoNTXrIgfCAU8ikdeoUfswgwLtKD5MN/jqAtCUUTC8C7f321BlLau0vF9vJavCRhXBTk58P/mdmxQdY3E1eX0gbjG5Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762181; c=relaxed/simple;
	bh=xQD6ynP2HswCTksRdrkuex7u22mk5r5rKc6Ptzhavws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsNgChlbDkv+x8V2+jFKZ4eWLrwACrcdVysjL43w7zLNNL62UcWHPTTvDmUImv3n1132Qa5PHOEjAyoYVZ7k/jr0UJPc8TjqjEfmMLkqC2YqUANRICTbkfvYLBFpT07zf7WMmam/c8j4eDudLz/UjZnPHzTCG4f+escZSyx88JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdZfUXij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNEjCCQH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUZj3061905
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3E4RMWJDlN4oTIAm3vwmxetHRc24rPFl0tCcoD9zto=; b=YdZfUXijc1B63K4O
	JdArn+cNh/r/AmZB/J0SRCcZ28FQsxxgqDgzALCmvHrC6TZ4czcJ5FSfjCVxIdLo
	m5wiUrTeTxnJ/Geh+XNmLOqRuJJHLJ+E7RGvS2ygDQ7P67Gp/VE6+L2Ue5sBctVH
	BcvvCPsVXEJYwbtK1F6ULFfEP4vh+3tMCFzVpzQz6u6wbT0/KOEcco6smNCe2tx+
	2WikL6CpTdyaCDtwnYRf16RPCqNwjI9OCSoJm6P77yHVgLxbj4DTGXUUg7br8UT2
	RUMKUMe3kAUtmfFg5059U3y59k9H17t2qLjKS7i9zCV7MU/ScqOv4z/mAbF4AjxN
	AXdELQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554a9yah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:36:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57606a825easo7343e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762178; x=1779366978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3E4RMWJDlN4oTIAm3vwmxetHRc24rPFl0tCcoD9zto=;
        b=PNEjCCQHBRrCqdNJbfRyd0MClW+4a30ymMExHYI2SpSUG8RCr14TXM8B/gcSIDPa5s
         PSiTqyEWS5hTpwJXhjrcZyKtj55108OfVTk9bEY6FssCPnpXQexD2ldClwPtGxzZSWlX
         T0HFkCArqbRDniBNfqePQgNsJkdzO62aZW1wxI528lcnUnWOIq2M54k6MZMfsIwYJWG+
         KirJvcN4em2vv6ETO1CY4bgKLI/fO9a3rZnu5bYERx3XrnQN7NzQISHTkEGcANqs/wES
         fJBBarKV+Vhe/woC1SzTpzuKtMT1XFJs+cQ2XJoS8/oz97D5IUnQWtZnG7u03T+lemXR
         lxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762178; x=1779366978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3E4RMWJDlN4oTIAm3vwmxetHRc24rPFl0tCcoD9zto=;
        b=mQU0ujUIKBFpNPW+CXQRzeq6adCAIc75JB131BDIa9vFSWXJ5O/SJJCrO2+wgb7rTj
         46/8QyPKYGQ3yoWBaGtsWlyG5clbhpOwUTs1KsRRe1P5sfUinCg0Mkiu7nS85KQbIkyP
         xQRQ113v1zPRFMbYOA5FAFcck2OGaVXACRF/uwFyiCN1z0z4heIDtEEn7PGMzY0B8zvF
         tQLa1Wm18kmaKOr9QAuvtaETq8fq0ouPvdZQ7irV72NrRUsfq5w8NJ4J1UWvVOuTPmYm
         UUKTmwp3mdHdDuANweKpxXldgnpkLxE0wNy1hoFSo59o68DW1YwBdjNV9YC5hslymIRg
         ispQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fwE2qK2Zak7gk0xmwX7IXjMZ+IunfMcHh+99I5qw9PWI5d6r9LPfW+c/kZSST0j7qdhgvN/Qhp4FH00al@vger.kernel.org
X-Gm-Message-State: AOJu0YxKpyBWGu5xIMpPSL/NK+1MW69jiVL4VGOahXoOU3ZTuTtZDeLw
	4rzPTRPrWOF3Hglc7YzWDgJACTE+BCsSRFjeR69GNAx9EkTFTpudhnWEfT/YuW8a1EXPxWADKgJ
	jFLqoJqT9OliV55LBvzt1DJnmoNYNDN3coRFUmpwkGmgOZvx0i7i1RwNmrj93IRNrcG7r
X-Gm-Gg: Acq92OE1ti7ePJQa99a4DDsCJ2IrLQkdLhT+VvtbJfqgf6yoXRkHLq8UqZLDUwPbLk3
	7cqczAcB6CPKHZo5aJtZQGcaeh3+cGaW8NoAUodqeLXLjT4WIps1jv5HrekpXKNi9A1bPeH3IMm
	UUQLKImctO3c+PGw7oj6W8YwJzR5djfTHlKebx1LOXbg4hMlLsupXh0MM03l48Y6+BBQ7BGTq6f
	F3zlwVKkw2ODJFX/esEaNBIYUANYD+MNmH7op1TXFXy+1K17LarFPhtpWCUirbO1BLvkohId3tm
	LCfyzDZ14ihP9XxGfNLORIKlMhbl/jXYwowTSBPHhw/aDI27CIqdoqs8WDWzxCHK70Ea0EWnQQ4
	/aT2Jfc7eQgVDJamLqXqiyN3qUITBGykC6Yv36zlLnT3dYkogjauvBaAzbRJRTGwS9jQf5pbM5z
	yLYHHoMklExFm+Cg==
X-Received: by 2002:ac5:c7d4:0:b0:575:2300:9f54 with SMTP id 71dfb90a1353d-575e6f5a3b9mr1298016e0c.1.1778762177940;
        Thu, 14 May 2026 05:36:17 -0700 (PDT)
X-Received: by 2002:ac5:c7d4:0:b0:575:2300:9f54 with SMTP id 71dfb90a1353d-575e6f5a3b9mr1298009e0c.1.1778762177520;
        Thu, 14 May 2026 05:36:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bcf7f3sm85198466b.2.2026.05.14.05.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:36:16 -0700 (PDT)
Message-ID: <83958f30-59c5-4b15-a62a-92da02187c08@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:36:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1GaHz4uI1gBCXKt0SMgblm2IRaxSBieZ
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05c1c3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=54KNg95dvv-uSQ5X8vIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1GaHz4uI1gBCXKt0SMgblm2IRaxSBieZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNiBTYWx0ZWRfX8uKXRGVLblBq
 sFAtaNxODPIFDxoFNhSXzTY4EXSyIYTKXo0QTpXaH3qAzkt+WStfj9Qr/kUo+UYl0v9rWX4JzjM
 7/+2RFy+U5QeBUOQjMkVKd1E7EBYUvXz4oF9yE8VRWnTHlovj4QezhgZatuze1D9Fu2gUMNn58p
 /mGPeX+Amyjs5kmSrAEsd1atU9OCgbULymfQeil7ocJxSGP51yEReEeTru0wiFaQklBw1BynM5m
 FU+5JJ3Ppj+exvaOQHB07N8H/ejaCCW+1S9vSC2e5vYy1LHhDS3jtP7vELEiinR8wlYiqyUP6n2
 d1IWoyMUpxZ3ejwKxkUTrSTwI14xVYIZLKvsbsQuF2goEsITk9EMKVEMgX18MRYOU336oTsf3pJ
 QZxLvgPM4gxw1RQ2GrTibBzyhXvJwKxzSUBp12iRgkWJfIfRMkBoNSjrYwxF9w8JtGxZOoj+Z5k
 BBtt4Qv1ywAzIS6Tt/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140126
X-Rspamd-Queue-Id: C0B8F541BD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107586-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3da0000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,3d90000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index bab654bbd6d0..26a4de9c8d45 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2597,6 +2597,47 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,kaanapali-smmu-500", "qcom,adreno-smmu",
> +					"qcom,smmu-500", "arm,mmu-500";

The lines are misaligned, but please reshuffle this to be 1 a line

> +			reg = <0x0 0x3da0000 0x0 0x40000>;

Please keep the 8-hex-digit padding for addr


> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +
> +			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
> +			clock-names = "hlos";
> +
> +			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,

likewise, please align the '<'s and align the property order in this node
with Glymur

Konrad

