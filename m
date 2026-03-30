Return-Path: <linux-arm-msm+bounces-100738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEWYLddLymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:09:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEB358E9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB175304AD30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7B33B6377;
	Mon, 30 Mar 2026 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvmv6XYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEsTdghS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45B33750A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864992; cv=none; b=dna4sVoRNwpcE4nYR78K0BC962o3kuIJFY8oo7v91BEFycZdzX4B4PFJ2A2pEoEfznc/Nz8mUaKZgaS7A+OZPi6B7PJu49gq6diMTHtk7q1mytBGYGc3ZWEV03qiERUnV1+Obj53YvBwbY94AWifJzvPTelZ3m0V32lPGV5vQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864992; c=relaxed/simple;
	bh=C+6FooB89Ea8VtnjcQENsnOLuZW8/XBpEXiI1xf1Ixk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWoP9veNQvv8cPPz1yK9Q12bAGvZUKJ99RUmemJexNGwXGuMdBm/k4EoGEaAHUMa3fURrNm6LPr2hysqRh885tgdqZHKQXfoh5svZsUUBG/eYmfPs9wzFdsjDwTcVvE+52WNDdrynxCv0Sy1ACxa4xE3oQBvW/mvF9tuJ1SDbY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvmv6XYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEsTdghS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9beqZ2952983
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPHKEQELSsYpRldROQs1jZjxzlapr8PtvfAxE4pQOGM=; b=bvmv6XYgCTGELuX4
	jy2aqWy3cu26/2r5Nn/LqafAEwUnzwq3JJRLUrFriRwLvogRRWNZ/4Dwu8sXfpr7
	rnR6XkgaIMxk0YTZDld6PGDpAwnx8M9Uo3E8Smqn3z0Pddd2LjfD5FeebU3B2OpB
	P8yKiv0TV/6YPwa1T9pZeLnGSGW6BvgwkeUNEAuPy2nWw7O1zdBwi/JCz2xsUOzd
	vZpflX6L+mzO8jsTVt5vZSM9ienYO4TaP/1G7Fdm3yLVVCWdN9Xb29rnrAgjLIdy
	hsxWbH90H6RbyI7XAjyJCiqTXyVAwh3hB3yNldXz68ZOY0+EorWg0+YNy1ChWx1r
	Ymap5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqekfqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:03:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5073ed1ec6fso15675841cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864989; x=1775469789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPHKEQELSsYpRldROQs1jZjxzlapr8PtvfAxE4pQOGM=;
        b=kEsTdghSaJEiZgiqu6ZyYAnumVHORUDXtz5g60NRkMbroET1AXrLFXCncaklJvsWw8
         oo5w/3ia0EYykhQx/tYNuVLOTtcajWZM9Yo+lGHaStI5EjbGLoHW/jKiT5IdS1xZNV8l
         ZyoKiScq2q/w8VJwFD8by72+PU2/UXqw/I5wt8AUtUuhqvm5NSPR0bqhj2QZTYl0Syzz
         oburqFyjGYkSrHAhDjTFVeb0EvVUL3wG3cSoAJugXvQipeDZx0QGTIiamHuqgVgnA55S
         8Uo8c79j1mDVNG8qLpVURK0XyeQ9+kIlqF7CuLM2Ko1qd0JPx5hjb91f72iivd+PcdUs
         gHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864989; x=1775469789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPHKEQELSsYpRldROQs1jZjxzlapr8PtvfAxE4pQOGM=;
        b=AlYy8rIrYHg7ns6io3sJwF4zoeO99DWBc3U78VitHHwEqYTuJSzoSwPTm/kuahNZE+
         Fx1Q5i0/xaymLqm252+xAlU+ELm2pb22N13LDj9QbVFHK3ik0kTK0Qo7nf2mGzd5pakQ
         ZnLoGedsza1swcbcTVYuHmLeiEachxXw0cqq5ldbTXuKRppAxf9ccgIKH2maqoNh20k7
         6BOp8KRBHHYNGUbDF7Sk+HFgV4wlZacRE2FjCjJCmPGURa6Okcc7gWpXldFql/RvVTtS
         iH4oRz6QkGyMDrasBympsxVxmgmX/Rd636t9+zOepWXzgE6Bc8b5RQWVXdLIsKkUPbgt
         mzsA==
X-Gm-Message-State: AOJu0YzZ/RaY5zGbJ9YiiX1xll2nbhT9ZRh9HBP6oQAJAprSMxyL35B4
	2p15M7Sdb5URcVPAjzLXbw+BYPaaG0RAg2H34J6XutmFcuiaa8G7rkpgaBs0VyKPzbsIwwl6kpM
	VUkHZHKm1Lrd+OFNgDTTAocyDCh6kGO9lsnHLnpc6mXx0n332KkgQwlh9U6NsncjACjW3
X-Gm-Gg: ATEYQzwMrpxQJkuD+y0NwBGhJQHEN8j/2TY2I3oKlJvx2IHJqTkirPRWcze9rG9dB8Y
	RC9NoEoH16uo4FS1nLpn/AiKTLjpTag847Guogg3cefP+MKKUBHWk6J8pd4YBoGVzEIakKHrePZ
	WHsgMbPk3iOL+DGJXhrcTn2tngGAFIAQCXj4ZhPIw06Af81df6Pwjzpni6idogg4M4AcK3iOb9Y
	IyoxcD/mVauXBEy2CNwwm6aGKqRUu03No8FoWTRWPPdCMxn6vN1VB5MttnVHDBFyqAERO0It4pF
	8+UQYQtR6YpaGdUxIfOqkEXwynEpY4WQqBOT3Fw/Oqbiw5wCGxwBv9W/x0ePbFIXrnP09FuDTG3
	iRX8HF6o+KDDdKoHt3a4ic3G8ybspJDojU7LfDBDGWxyaS6HKyPJdsBXG/2mL/iqT7Sj3keKpx9
	82CXQ=
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr115390681cf.7.1774864988830;
        Mon, 30 Mar 2026 03:03:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr115390321cf.7.1774864988191;
        Mon, 30 Mar 2026 03:03:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae522d4sm275487366b.22.2026.03.30.03.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:03:07 -0700 (PDT)
Message-ID: <5c0747dc-f0de-4b78-b0fd-8f6a6690e86c@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Motorola edge 30 (dubai) DTS
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260329103055.96649-1-val@packett.cool>
 <20260329103055.96649-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329103055.96649-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca4a5d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6mXsR_sTwsZj-yjp6PMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: CauF5CpV3_ML-y-r8T655XsMVTRSfKBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3OCBTYWx0ZWRfX1LUjIRokd/Dr
 Cad64EB0N3aKWSnK9NSmWOPOqEhjLuwS3HRDNEL2fZmlh5u4EzdMjyh7f0NGdh+wi8kIASgKRXD
 6mDFqgTnx+co5sszTN5DAShG1RI+lPqmsc1xCZyrCY/oC4B1QscaoOlaQPcNOw+Z7eE6WQeN5Ui
 AVIcWvheTgSK0rghx7ESyz/NoFp2t4K8zDFz+RV8b2wfbiDjfIOt8OidcSsYMddDuGshNFLEwid
 uqfxiJL5v8cjw6lB+CE7cFcImmpjPoMOIVXfxzzxA6mbAO96BbKlsjb1Jq058WSkPEeY+TkPvL5
 fbV510eEbdxowLoY44ZO/y6DiVezkC85jB+DNxp+MDXabKWUJCA4qck1Y/EKohTeDlQycDB2yuk
 QM3w0ErbFhcQLXio8Uf0susA/qsQDayeA/5LisabSrxCzXBQ4ChvwoTS3pigIcSEQWN9yKmub/M
 FGJ2YTkUsZ+EoPvUMeA==
X-Proofpoint-ORIG-GUID: CauF5CpV3_ML-y-r8T655XsMVTRSfKBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300078
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100738-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e1000000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,packett.cool:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53EEB358E9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 12:16 PM, Val Packett wrote:
> The Motorola edge 30 is a smartphone released in 2022.
> 
> This commit has the following features working:
> - Display (simplefb)
> - Touchscreen
> - Power and volume buttons
> - Storage (UFS 3.1)
> - Battery (ADSP battmgr)
> - USB (Type-C, 2.0, dual-role)
> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

[...]

> +/ {
> +	model = "Motorola edge 30";

nit: Google tells me the 'e' in 'Edge' is uppercase

[...]

> +		framebuffer0: framebuffer@e1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;

Let's drop reg and use the memory-region binding (also drop unit address)

[...]

> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;

SBU would be @2


> +		cont-splash@e1000000 {

framebuffer@

[...]

> +	thermal-zones {
> +		cam-flash-thermal {
> +			polling-delay-passive = <0>;

that's the default setting, you may drop all polling-delay(-passive) = <0>

[...]

> +&usb_1 {
> +	/* USB 2.0 only */
> +	qcom,select-utmi-as-pipe-clk;
> +	maximum-speed = "high-speed";
> +
> +	/* Remove USB3 phy */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";

Is it really not wired up in hw, or do you perhaps have a fake cable?

Konrad

