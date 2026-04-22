Return-Path: <linux-arm-msm+bounces-104003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFD8Brop6Gm3GAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:51:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7373D4412B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84AA430293CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 01:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1344B2E8B8A;
	Wed, 22 Apr 2026 01:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ms8Cy+ly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itIgq8am"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1B7347C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822577; cv=none; b=Er4RX6gb2xiFRZPP5Yg38sCMHEqiiHpjfwxbqqDmTM5CLEf61q99pYy3IYukfD5UNL+H4kSH73hR8NN0LePLGWi/w37/RpSCikIWuBZyZ/kB280RE3dOuTNWZvAFNeTfyDU8tI97GgqbsqSrgT3x8CQgyZ1sjZv75Ug5f7D17W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822577; c=relaxed/simple;
	bh=+Wtn7wvNYHZYHKoX5jpV9Jp81OC6dD9Jr4VMinq3PGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU9PaX/0WRY/Z1G52e6mnZk22Ir/kMgC+VWL560Mu/+P6LMOeONZZGJuyv/iRvNj24IeFBf95IL+qfBiXv9Ier33dRYuAFLq21hECu1165K/TxIMq+6Stlt77Kq67dU+2wAZDJHZ+s9lKPLvwoAqdC7EEE8l60yzolfa4jwvyFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ms8Cy+ly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itIgq8am; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZtIL2123746
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hurFr09vNtmPRCEJnucpGA3f
	RhEigXPf8InOBEhGYnk=; b=Ms8Cy+lyTo8U8uLX2ZfLEM+kvoRgLHCEf6ouCKac
	vPQQn6FqXzvayAm96xM5z7MTjnYIsJojkmCvgUaj7XwVWc+zIU2SvYPKUk/TrJjj
	ZBYC6KG0jINAGs3Z2t95R45sQhGyEKUEslf4yHLcGDVrpO0l9IB0pOQTmN4o1RzS
	D+amClEcSUbvkr6OPQ6mQ50k11VcxIsCCjLwKUaiU7vDX5GIChkJ7R9EP6go6nFL
	AdtlLeIs55ybvZQs2pmfVK9m7DPcy39wvcwE3jhWs2DC9eM0vqOOfQ8xbv/Zzqtf
	vtU2Q8ISf17YTcQfKAKyQBvWSV0H3lQ3yJVWYqdL43onSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfs5p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:49:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so52275521cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 18:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822574; x=1777427374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hurFr09vNtmPRCEJnucpGA3fRhEigXPf8InOBEhGYnk=;
        b=itIgq8amY7a4wPD9GY0JelE+G8QoQXeG1wbRNyIJhEd0DK/u/FEd8qrZUaACqN6C1f
         ktLlX5zrcLAzjpzJo9bfZfBSerZ0+iA1zgZ422lpwDmKtdECofUuaktRqnPmJZZ8Ax+x
         f76fh9kOpZElnVSKG/ErLfDvPaqOZ99PuOGPn5yy4HPlvqgpDswxURHDQZ0tn0tSiJGd
         QtHyVTHzyFVMewGbP1X1i56CoVsCv0C6jsrRHCCg5qJKR8nHYx9H8v8X8y6RwPjT25Ar
         EKowb/Y6sYiI/uZg95A3Vxhl3fsRadjws7W5RmyW9U8hSkgPoA9kvJeOgdzDvdrdiP7e
         r14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822574; x=1777427374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hurFr09vNtmPRCEJnucpGA3fRhEigXPf8InOBEhGYnk=;
        b=kI36xF2I51U15SioLEl9maGrnvyfuIYW4M6aa110yFx8H1HA3W56oJJqYrfm2lrXyo
         5UJZ3fqYUtuk+wvfuzT4rQkiCtxZb3atcAKLa34o+89tMsvVVVvDV9BF/vnJszvHhNT+
         z0DKBItjtCNPW3FOduj4NU2ngczCUO/E6Rb8N8eqMFks1R8CLKZdGPWD8MqO6PpwR3qd
         NVhz02mlle8stf8VwPM5ko9xO1hg6crS9RZFosrsWPKZQCK8xDflRG4gkcRPRTNPgBGx
         qqDK3y7qVrIG0y412qzcHN7l3/c91HxdSDMYDR+0Vg+JYTUdgcDHsRjqmih5p+KnDhhl
         v3XQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Lgl+dBud8d5zZ3T6AY6G1/wFh8I/luUkcm7zYaiX1nM2FwR5Kkkmr9vnf6dgabNQRv5Wr58/j9YkOi6xY@vger.kernel.org
X-Gm-Message-State: AOJu0YxE5PGBBEWzWXUfKgJQLMY+Lul3uBNENmrg74Rn17lPfAaDi4ls
	LADIrWQgBCobFYgTIV2QUldsyw/4ahYQYGmBBlDMmSn5vYn6LIG8Zqqd/H9aDHM5CRvCJC/uuVv
	l6wcU5Ym7aLGgGYXOCPhY36tyx3hULAwybeRlSoqwgoCsVUvkSFmpKOtexkenoyCBziqR
X-Gm-Gg: AeBDietOz9jQC3yG0MNJo7/DQjN3eP629s/SGsGYgsQkGrLCtCEGZ61ULWTcQdouuKb
	An1dmZxkX0oQcum7bbwNb87GemimtnZiwgDY4ChjDKGYRFECLnxyfZHMpXd6Hmvr9c0uc7TW+K2
	C+GUNtrgowQ7kpIRUL0fZ+T21dR2aUVgAqnanAWsyiUdA35/At+s0OjCRMHeaD8QL0iW2f4PaeA
	V2lwvcwYFZSmiCP29ShUFbaaeG4NDI+HYX0zAow/C0UoTxsYzTGkRdttT5V6fVT6BDgKiAAkW4a
	pjdJO0WJMzX5zjqynn5vmfymNvkbK28luy7f9Yu8V0HFdMuEIrbRFBeHkwjXudnrOm9Glyowemx
	hXEi5L7/Gu8L+V5VVup0gUScuzvFVq9lZmcONOq4FV1z6vu21QxIp5zURG2Jz7x+gLpq4tOBr7c
	LDqWV9F3mb74WRy0Cq+Lig/0ZlXRa2wYsTctcuJacPk3jwxw==
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr67301471cf.19.1776822574150;
        Tue, 21 Apr 2026 18:49:34 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr67301061cf.19.1776822573662;
        Tue, 21 Apr 2026 18:49:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc25csm4072345e87.26.2026.04.21.18.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:49:32 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 7/8] ARM: dts: qcom: pm8921: Add USB ID extcon
Message-ID: <7cbmtdsq7iz54fkxckyfqgpkcz3yweg4rrfvo53vyxmraqj4kl@yrioxjdcxu6i>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-7-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-7-bcb0857724de@alex-min.fr>
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8292f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=0w_FVvD09BqdKzzQVHwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: gWWSI0iBVi0tutrYETfVAkap_88gJynu
X-Proofpoint-GUID: gWWSI0iBVi0tutrYETfVAkap_88gJynu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNSBTYWx0ZWRfX5i47OLk0w8x/
 b8Cgpvf52nGAcht4IB+z6+1edMCHls9AFGzW0nLkDj7Q3ZZZctv0jGF8Bm3+p7tejyDgZ6xUFrA
 /Je0IOnC4Yvev8w7nWLe9DJPitRER5tOhCF6d2aXfcoRk0WI/WC8VTGIAaV1HBc+ZNyy1JlnkkC
 q/2vsmzMVoX0/9joeNT2B2jeZgc0THHDokP5t3/1XAjFrKdGZzhxv3MqhBkpE0AeLPLwfMQ5SpG
 sBqNhm2lZSMTjDogfKPGBftQ4XQ4hfu7/AqEImwP20bG5vVGXBBXlGhKt7/Zq0BYbXSaNfP/JxX
 kkDh9XCDiGaSUdBH+7Xm1ReEVLdg/oGZ960iIb87wW69CSFQBVZ4UIqx5kUbbeMBE97WaEvCPI4
 g2Ucu1ss+GFTy8NzGmEminuKOPlbB6czY+7uq9oH8GWxNTtR4OqxXhw5lhGJIdwzHQChxoC21RY
 Q+EkHfvU/xlQSC5FnXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220015
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104003-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7373D4412B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:45:13AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add the PM8921 USB ID interrupt as a disabled extcon provider. Boards
> can enable it when their USB controller consumes the PMIC USB ID state
> for OTG role detection.
> 
> The interrupt corresponds to PM8921 USB_ID_IN, block 6 bit 1.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/pm8921.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
> index 535cb6a2543f..935383d6a594 100644
> --- a/arch/arm/boot/dts/qcom/pm8921.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
> @@ -41,6 +41,13 @@ rtc@11d {
>  			allow-set-time;
>  		};
>  
> +		usb_id: usb-detect {

Let's see if we can find register info... Anyway, if there is no reg, it
should be placed either before or after all the other nodes (to keep the
sort order).

> +			compatible = "qcom,pm8921-misc";
> +			interrupt-names = "usb_id";
> +			interrupts-extended = <&pm8921 49 IRQ_TYPE_EDGE_BOTH>;
> +			status = "disabled";
> +		};
> +
>  		pm8921_keypad: keypad@148 {
>  			compatible = "qcom,pm8921-keypad";
>  			reg = <0x148>;
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry

