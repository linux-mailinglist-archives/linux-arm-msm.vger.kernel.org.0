Return-Path: <linux-arm-msm+bounces-111419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id awW+NqvJImrRdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:05:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE0164862E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:05:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OhHLCJ31;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ur/hfIs6";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111419-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111419-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A60333042272
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 12:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BB3426698;
	Fri,  5 Jun 2026 12:52:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00133B5846
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 12:52:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663943; cv=none; b=Z2xXeLD96+3wOYMuSDNvpNsPaAgJ+uQ0RIOyh3ahkY0w37ZOfC8mM+rEePzvZyNLHX07rF9JB8aosM/1CHOBd98iYacSMDquFO9VVpTFhT5EQjPrwcQzivdqTiHoyz64uaRrwSqraLWzq5wJLue2/1HPWqgQZUCgV/amOxZD+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663943; c=relaxed/simple;
	bh=Us+yG3m2+QHmSga3tniY07Eashl/QzlKEg/ECZRt1e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Du1c+0WPxDXBySrctCtU1z604cVuKbmAkbaXxFwxrIS96VYy+/nUs/8EjxfRL6H7BDRdmzxro6U4wXT+x4fOaqhrF82RYJ5kZShhIbvI/+8ppSml0btJqJO8NdxH6cPNgbBNVHjvPb9YYFnhnUnAkOzX2lyTUPP6WhMkzyxe1sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhHLCJ31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur/hfIs6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65599S7l820652
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 12:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXXPMAxCCNVKnzaiOEhcmEjF/NB0kuT+OfqrX4xSO5M=; b=OhHLCJ317ujs8Vuf
	XHzv6gpokiN/RLYmVCzSlcJ7Vvb8/99t+c9QBBcBLNdYkHJ1BR+Pqo6P1m22pgGe
	RFmxVfP7gQjJWJu2rw2j+0MmOAZ2eq3U8fyckemiTqozfcsY+g/KY3FGvkbao0zM
	xB2I1fqmgNmFQ/wNsx+7aoVCK0SHcKA6Aot0g9rtVo3buN8xECLSD9r/4SNvPJFx
	msQAt4XW9+YmXj9mF4++bvWTZEGEsrvZD4m8x5t2W8C46ckxFJCGAHWJ8wv9xzy5
	y7+oqabmr6UaBWNtTwaCtgy6eoCiix2VXVKeme5BBhusfq3jG7z6IdD9JcYkFeRu
	fENSVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbj8sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 12:52:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso15184885ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780663941; x=1781268741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aXXPMAxCCNVKnzaiOEhcmEjF/NB0kuT+OfqrX4xSO5M=;
        b=Ur/hfIs6gp045G0MyWJjkqs0oA9WJ8JSmIKV/ClTH3QseKI2b5IOYURu76y2ZvMx6r
         t0GINdST/hxTbStwcgPsxPVsrZh27EDdKpNax/nABKKjwvraHfqRzlFo8HVZGqOkykoX
         ZUFbH7A+N2LtB5BxTeykd/9JfD8T1LOIacrCm/pvSQ17YeMqTd/orlrlNEWxgWOB0Au1
         WHHGUxeOwzLBIcsFmbzHUzV69jJ/J8ELLg8EJnSM5CWpoi7vFZQNgWdrgRTBdDzL/9vq
         U8E1kIdGQZ7k+WBbW1fucvH2wnT3Q0a1n1JWn5vh1bBo3++83V+V2iVaj7CcqjgB+RHP
         K1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780663941; x=1781268741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXXPMAxCCNVKnzaiOEhcmEjF/NB0kuT+OfqrX4xSO5M=;
        b=Czp1t70LiPqt9o02kSME/Uqx/c3+W3B7T77EMqECYYZzkDiU9Qdfe5Hdudw6dmyzB+
         6+BYD6AcvZgTFKVUj/6W/pcOQrkx9z+cZIKY0lJLjbw9F9bwSvTyHqZUAKa3mWa19nXT
         vS6KoE+4dYIAzIryW58tpSXFj4DMc6fCfhLHhXjtsO8XYOnBOg/RTx9do1Q5IDqVOV3Z
         hXdMGHo1gxF4+xnUSzTdkd+DeJnv9p3B2ps2JbG3Ei834LQtKEm75xW/2YfkyYP+Qpe9
         Lah+1H7br6jBfjJm2zBcVEhUlfPh+kthbsgmuBFyIo8+nN05FXZGCW9xm7xsKxnnl7Eg
         2uXA==
X-Forwarded-Encrypted: i=1; AFNElJ+Kzfm6uvtLse6BN6oInqr9aPInLegV4lJ1i1gmk3fU/ega1M8BL/38LfCUhcNpZZmRAKO6hs0W7EExMB7i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsimyz1Y4oNgQnksxQiDoKTbpoSDnIz4EHDbY7RNe86kMFOs3O
	Szs5j7VoSdmHxeeDWTpUiYSFnggpILb6I7HGB2XvmJ1T3NVJMpF4QrMQhR5vSvbDxC+UVxOd4qY
	MS5gHCe2JlVUWLfkcCIVEGE7CSisHXc1rm6gqEvgBDojpRACK7AG83aRYpOXfCmJTLRCE
X-Gm-Gg: Acq92OF4jji4RX7rTOUJvqB3eM8r1uL5VBirNR0ird8nBTHSocrCsGeoteyqAtohspI
	ZDPYRe5oK9CoFxJ5DibZcflQ+BJWsmMo9x0cV5CHXV8VGMuNZgGoG43ILjGODRUnFzf6mVWE/Y6
	Sj9hWu5KMGqOmliUEf/1gPlpGXeJ7x6qMhwNEtkR+HnVhnk8e4/zwcwa1FUUi/kk5vXVbdnPflU
	sZ87GRhK1O+TkI8x8zd9TCgg47iLm/L11fifajnRHLwwu5wDqtvkeYgtrn1Y7Y7ND11SEshCRIJ
	VTG6mDh2WntxstOgOataU7P8gbGW0b93o24oP5tETX3aOnPxuXk6WgxaoRmn2h99h0FbwlWkDVz
	TdTD/dYWJRXlnTwGKzI90akKbIrs5BqJ7EXqH2w5nZvD173YaI3RGxLDW6mRtIfVluCpMKI5ciL
	YHa8Ye03/bRy21SBAKCzuHgUKqlKQUQh3coI0uWyDNZz52NhAxOtU=
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr38497255ad.0.1780663941401;
        Fri, 05 Jun 2026 05:52:21 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr38496835ad.0.1780663940969;
        Fri, 05 Jun 2026 05:52:20 -0700 (PDT)
Received: from [10.190.200.113] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d389sm90760015ad.16.2026.06.05.05.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 05:52:20 -0700 (PDT)
Message-ID: <ec3c29ec-872a-4a01-bb92-7573a625211a@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 18:22:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix gcc clock specifier for
 usb_mp_qmpphy nodes
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a22c686 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=04xiu5HVr_82CDOhBRwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEyNiBTYWx0ZWRfX4oRxoMprotEO
 YYJ/smdFn6vUt02qyPb+vlgLaBL57xTH6TzOOqbeGmpXt3Q3JhGFxRuFhPS7TAc5N2fztE4kqKG
 nTf3hzx0o30fm9dN3tvgk3WkSK+ZMgYyH4C9XplkwhvlBwWF2PD+ZJYYZrXgUR/SIqRs2G9ZTem
 7qBccfsbq8IF3QSc7MxBvm/FGP97RSk8ACBlyUFhXTpFUeu7XfVuEhU+obJpjLwhoXnvt0GrWmI
 WQ7RQG1CDwNQGkADpHDgqW8bIwN+r/zwv7ytWLn5lC9XnM91O0R2ddvJQgVqB3VWjfylqk6oTEH
 ioOFMbkVMON00OZfqfhs1s2kUOPLCtS8R5ju5YnKpG7W/NosNc4X93EtYwdlgryTnKBBpHGzdeA
 l6/6vhwFmRAYIYtwb4K0G0FGqFxZ8nQkkchOtXoE0EClSNE1f2taMuKj1wOrK29atPDL4SusFIP
 wsQ5KvIHfHBCyVEORAg==
X-Proofpoint-GUID: 3UtnKllZeOvNSN24BbbitbQSs-B0rgMU
X-Proofpoint-ORIG-GUID: 3UtnKllZeOvNSN24BbbitbQSs-B0rgMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111419-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gopikrishna.garmidi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wesley.cheng@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EE0164862E

On 6/2/2026 10:21 PM, Gopikrishna Garmidi wrote:
> usb_mp_qmpphy0 and usb_mp_qmpphy1 have #clock-cells set to 0 so they take
> no specifier. Drop the erroneous QMP_USB43DP_USB3_PIPE_CLK argument.
> 
> This fixes the following dtbs_check warning:
> clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], ..... [0]]
> is too long
> from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
> 
> Fixes: 4eee57dd4df9f ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..fd503e10e409 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -786,8 +786,8 @@ gcc: clock-controller@100000 {
>  				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> -				 <&usb_mp_qmpphy0 QMP_USB43DP_USB3_PIPE_CLK>,
> -				 <&usb_mp_qmpphy1 QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb_mp_qmpphy0>,		/* USB3 UNI PHY pipe 0 */
> +				 <&usb_mp_qmpphy1>,		/* USB3 UNI PHY pipe 1 */
>  				 <0>,				/* USB4 PHY 0 pcie pipe */
>  				 <0>,				/* USB4 PHY 0 Max pipe */
>  				 <0>,				/* USB4 PHY 1 pcie pipe */
> 
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-6d5e671f173e
> 
> Best regards,

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>


