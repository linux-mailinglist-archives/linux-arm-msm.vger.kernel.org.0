Return-Path: <linux-arm-msm+bounces-101729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODzEOpse0Glk3gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:10:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658CA39813E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB5F7303A86A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 20:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FE63D5252;
	Fri,  3 Apr 2026 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGgR9wuq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZ1a7UNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59092EAB72
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247000; cv=none; b=LZG0gCHrzYSWz/c4/K0Pk3SVndcPRx9oXAQhUKLccEKxqjhnnCvdTRB0LMMsej4RAe9oXT5Rd3yCD77FKRaIhvIFA6hkGp/bH8E2YL9omchDqfhgrmn+MeJD8kkxJRK9J3iwlQJA1VWbOcq6PJENsz6X6vItZPqXZU1D5JOfwRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247000; c=relaxed/simple;
	bh=jkvYpgiFxKcrudqUt5ZqS48t1pdomN7v15LlgCfguSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJ1/V+fEtf1KHVvwYl6fo9/ShAQlgbdY1WRVs/6c8N3dpqf64LoapVuzChHTsY4N6Axt/esaGvhmdgbO0PbBcAlaz3c31z6wt69vdmIDnZOl/DKt8BR3ZtSqutc0MYJp3NwoMF60zz4G12UmZw7813k+9oEvimQXxlv6tuMYLV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGgR9wuq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZ1a7UNq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DW3tE2362159
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 20:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tk1FxohX6VP8eWDY7hN1RAtxXGNxavm+7yLMo71jIOU=; b=oGgR9wuqJjpXOfxW
	8ZOgt71TbzyfJk6g/U6JG16zoBuTQMy7G/fn4q4k53YSNPuz/+5gHyZssTLkXYPc
	EdMJF8WXcsbqC1w+VR4VFb653RwHIuSdE5FJq0rFyeo6H0HUTPhtwKhNGKCTHaoq
	cAGGJFamzJ52hcbJJTWGZUu1+zGCQ3eUEXVOdGwiGq+bS5NYbb16CKadCCA15ie2
	yIrR3XkKUWDBOb7/OaBTRWoMvbtJImfC5SoQT1Td4Cn+RUGDjPTBxVi67bsRA8kk
	UmuiUoVa330FHdmp0bSpD6EqMh/MtnwsQB/k92/+wO04HMAWUdeSQS15tRCT8b8i
	zMS5Rg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daeh1h1hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:09:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242b9359aso20823825ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246997; x=1775851797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tk1FxohX6VP8eWDY7hN1RAtxXGNxavm+7yLMo71jIOU=;
        b=KZ1a7UNqgEfpi6wxL2T5yHetHs2Rc9IXJKXV5W1l/GeqQhnzucDpK/MgE3iFX5oy1u
         8Wv5D6bn1REDnv03sEG/VpOjPFkEIlYFOwuoz/Ju50VyHlx6L+JuYs+6JyfYgyPEOGow
         pz5quhad9ja9U2YAFjUBKUxWAiS5v6J36Z9qtQ60Ee/6X/+m1l7aY8RhLZcqN6AAj3ND
         gwD6rPSGThbHPbpso4x6mfLp+xsTT/50BmdoF/G9rXGMjOqOZUrIa1IVCWbso+xhEAQq
         ur5MTiF+H9QPY8uavfCjMT5BAtOm3Si/MNRmlJpN/QnniSx0dVZhb/0z2HrI9mzKZmY5
         zWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246997; x=1775851797;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk1FxohX6VP8eWDY7hN1RAtxXGNxavm+7yLMo71jIOU=;
        b=Nxa/hzABJriOa4NLorn1FUibZwA+pNWFwRuAygu4VrsmNoQElNXWpYVK/bGwQAFX0F
         kDFr0lLj1UzIxnKVfzc439Uoj1cJ1Dhg70ytAOFvKWfrLcuOJ/U5QzZ3JLQYDUq0RKp7
         hY1ibtuEeV40PvsvPmp/O567LLiTKld/vi3mq3KucrS8UXclYOM3zCTnQ9JnqwHMWJZ3
         N60yLIQpfYWw4GH99yaOi1jeTQSWalz2iXnVBWihUTaiLEdw7yU89Ne9l8gzkWqgQ3Z5
         CpkW2+e4sBHqSToqC61RC7e0+CmwlBmYnl6FD/cpBzWtGZPJ5Vc1Gry1VeTNIzn3GIqo
         o7Fg==
X-Gm-Message-State: AOJu0Yxghb8+epyPy8MFP/qwiGijl5V0iBQSaUOK7a/u8NV18mo+exZ4
	anvLWEVvizsOpp7bn7/fhIyjSwQGWWvS5kqgY9bPwUcYzGQg9PgLDr87iCiB5SZmcmMsfJ1D9bg
	xMKZ4Xvesa1QDLNMc6iU8TKaD3ESGssZnDPODaF0xCOkU+zZLoNPf130O1kRG8CxNrJUa
X-Gm-Gg: AeBDievzjCKUMBFU0HhbcY7B6w3uMFKezri9BCJR8iBFiw+7Gp9Y/o+owrG2cwDKl1d
	3roqv8jGgoKiHABnvx1vgLo/OuYNNF+nJrm4V61L5MHbvn8nyeAsnOGb+7SWuL2zyo/fFx/nIqf
	gU5004uR07SCb+gQ7ThV645d31v3A70O+F8Qj8gphwh6gMsdAhhbP2vGccybsN1mOdL5Ix69vu+
	aSwBbRBqn369yBCHg/I+mL7wCoJKRAZVO2MRhDw02xqNBdk2psKeAqb3N0ZF9I4BFRnu1XnAO+3
	fCiL4DyNXos0lFwucJ0NT0sqhP2KxHdAcAgmTLCXYspxadlUBfQkka6Pmy+T7BJO3Znoehr7ms0
	2hihH//w+A7zScUNaovj7+Nlveh48KyzSWoJcgDgHNQmJgw==
X-Received: by 2002:a17:902:f603:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b281769197mr47455075ad.32.1775246996543;
        Fri, 03 Apr 2026 13:09:56 -0700 (PDT)
X-Received: by 2002:a17:902:f603:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b281769197mr47454725ad.32.1775246996036;
        Fri, 03 Apr 2026 13:09:56 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d688sm67019775ad.8.2026.04.03.13.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 13:09:55 -0700 (PDT)
Message-ID: <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 01:39:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -YbWXnnoNcM989GomphiCa3VcFvwTtFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfX0FnWujdE32Hc
 rKmVLAvAMAAf/XDYOOpRdi6o2wr1HorO8yLqSfaNHRvfc4wFRlfzrk7tmrUEtx+rhH4WXW8khgu
 Bp1pwksl4iC0RLds3F+hSAOFR9p7a156gACzeuxU/G8qocv/T/J81kUJqdx4uJt/WIJ0LL6LUmF
 qLE0+8zGpPNEo7nXlwBN9yFbhxHP2MGsUzrJ01ayZsrJICCcsCTLMRnNYnNbLAR5ZYmwgE8uDMi
 faVv9/JQG6GPfuv1dnDfkAlv6J6Ou7HGYCm7kyNV9sZDh4W0BhKMO266hJ5yPAkgeNup9Z+IWd/
 8Jrff7mHC2cxrJfMAuYPlTEPtnius+Pdi2Bm6IF/KGL52NgiOzOvc7ipf+38HYaZ39HX679eYJW
 3EJzjHZgm7yIeGhao/FdPGMvQ7sJtLQqvpu/zyoUSUHGGdx1pU3WnY+oQ7KQAIR3ecISP8CIERG
 H2AeY5OyhL4efPFDonA==
X-Proofpoint-ORIG-GUID: -YbWXnnoNcM989GomphiCa3VcFvwTtFB
X-Authority-Analysis: v=2.4 cv=JoT8bc4C c=1 sm=1 tr=0 ts=69d01e95 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=YUf46QchBRIYdusOZX0V1g==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CrB81z8CaJ2MUqEuDk8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030177
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101729-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 658CA39813E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/2026 11:22 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index a603f3056d83..38269aebdf03 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -82,6 +82,11 @@ key-volume-up {
>  		};
>  	};
>  
> +	pmih0108_e1_eusb2_repeater {
> +		vdd18-supply = <&vreg_l15b_1p8>;
> +		vdd3-supply = <&vreg_l5b_3p1>;
> +	};
> +
>  	sound {
>  		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
>  		model = "Kaanapali-MTP";
> @@ -1326,3 +1331,25 @@ &ufs_mem_phy {
>  
>  	status = "okay";
>  };
> +
> +&usb {
> +	dr_mode = "peripheral";

I can see that the usb port in the MTP support 'host' mode too. Should
this be 'otg'?

-Akhil

> +
> +	status = "okay";
> +};
> +
> +&usb_hsphy {
> +	vdd-supply = <&vreg_l4f_0p8>;
> +	vdda12-supply = <&vreg_l1d_1p2>;
> +
> +	phys = <&pmih0108_e1_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l1d_1p2>;
> +	vdda-pll-supply = <&vreg_l4f_0p8>;
> +
> +	status = "okay";
> +};


