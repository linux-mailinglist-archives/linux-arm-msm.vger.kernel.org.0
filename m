Return-Path: <linux-arm-msm+bounces-101059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHxkDFrOy2luLwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B90736A609
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 007FD302FF0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8663E51C5;
	Tue, 31 Mar 2026 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMC8TqSU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INciBXNY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6B33E1D0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964239; cv=none; b=VMrcXVNEQHHanuv+NAc2aNlAbHlfBfkiGOWFdQ9cdVUttlDz0Jjgm662HlsFPWJc2+EwzlNvcRz+XtZ4JRj8eUhmu6DGCYtZWq4lct2bvAcQi8HHVCD9p0LbvEqW41Fb9x49JvtYQrU8WZviGjgMnJ7OK0Zck6sy2p0sgP3+6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964239; c=relaxed/simple;
	bh=GFKlivnfFDiOn9cyPuw+fFKjZ45ioQooErK2zXqHbXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4Rbg79SHvoF8ZQ+nogYDgj7PfPC9TRNxbsJ1kASH4+i/IUYlqNVFMr6BpIRRz5uVQjaj8ygvRfvr8WjZTMNiFWUqV1v6Hj4jP5m4+m4TxzPtOXT593h/iDVKYlTrmRNO1sAkMlaCqhLzvl73sHaPt/J9sGqp9D8Vodq09koUic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMC8TqSU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INciBXNY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jsIo2049373
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWjDQhyp71MI20S0T4dy1GKstt/menChSWcPwdT/rr4=; b=bMC8TqSUuUqlVitA
	y8PWKhEF7rvX3g9DCu4JrFXGgRHMeEQ6n8ugtgiWQLRnJxlqSf68i+/DzmsGrXsA
	67v2Hxt0je6jb3Xj7frTEQIw5+06KfUhuh7Lg7XwW5noh1guSF3gbYLFFym5zSPY
	g/3FAr4FDbQRdJNCTR/zPzx/fOcOh7Qn+LD671a9SAaS7ocTaTNpe788O6kdfHAF
	ncIS54hDXIpGLt+kaTLd9OMUq1Oi+3TNrMNRo1hsBx7cfyYYaQ/2Ajnup/LLKvQ5
	sFHloeixGz5I0j6k/XwbrLKfcECLcln8huDhHFJd36ahJIFP676r847Y1Ao8yLgk
	ozatdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1ys59q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:37:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b86b756c4so15190251cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774964234; x=1775569034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZWjDQhyp71MI20S0T4dy1GKstt/menChSWcPwdT/rr4=;
        b=INciBXNYp8WWCuLLBuRh9uX7DW7LppqtA8HcIEjLZj3suYkK5uZ5h9YT+d3xHSQ5oe
         8JGvacz9NXZa9+nUzv+X5WQTOaS63s/xQVycY+qiTzKTAxAvoiytDPgwThNSs/h6phPN
         kVGaPJbWvr0N3uOSlHPTi6y5Q6Pz6Q8vk19CBtZmhZ9pR+0gCwAasg1jMRJxh8dJQ2+a
         ghBevZ17+2FkVp/14WM5b0XjzXMGzzOsMdzd/J2yDhVgEDh19QTr6CbXIrEewPs9NMFD
         V+ajBo0ksIcoKHf4lZDntuW79z4H/kxe8WT4rDrzTMqoUrkGT71lKBPA22n3B/8cSnxr
         gkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774964234; x=1775569034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWjDQhyp71MI20S0T4dy1GKstt/menChSWcPwdT/rr4=;
        b=GCvL9MVLZwWoWKTkz9uZ3gFhR4BWruoJQ2BfDJyrg6Sf90Xa8TLF/S0+h6fey1xOwT
         AYkfqyQU+scG9okq4Pc+7YBfN0WDIp+Q+SrzS6MvsU5kRp5DO3L//oYA648ZY7YKvWLf
         y414UWwjEx67Xa/q5mBG9hKTdDn4j8Q2ZjnRBxJnbvTbqDWbg3rR4oexsPLizn6qo2K3
         1zMCi+m14XkaN/RkJuSyJ/1p+7mRhkraFx0Lnvro/mNJChkJfRm3/Gw+TkZpWx3914kf
         lnybvUVM2TWdKTYj05YJY29whkb+prGuxbLZAy+K0RqMqLq0xpA9oBnladiPrbiVuMyD
         wrog==
X-Gm-Message-State: AOJu0YxMn4Sj0smkNZYA5/aBQyhfZoIczBvyJmcZ1X31MY2NdCx8kdzt
	V1UWoW3A0jAFsV7erbyePtUPDzFQu5ukd2vCR9zQH8KKVBw4wos86TXeHhIeiBHUtB+LLqDh63H
	yXsR2WyyOnTAy5lLYLOdjJmXeT9IDMZan1iEEUdKj8tp06IUKmB4NowlW9n6frFnKjWyU
X-Gm-Gg: ATEYQzxYKXaKiw+c7h6DqczU2h+xlWpeJ5LnyMoCNOc6phyS60TzljGtXttdpVnlToz
	rGZ/HEtMV4eM19kzyyysziQYB7FhM7DkhST0nVVjP/pJ8RGBa0FgVPk/fzV/fdwbzP/zQVrU9ez
	dC6sO8lCScMSEVMRhSSok9zNjT5GTRmZHl3osj0yArQDhJJpUQVETPJI/qpGjsHahjWeUvYLO16
	lTPVsbylVdT7wXgEm7Etyq4DcmKIpC6UekXNxfPffYqdP95IRI4e/ZUyqZXxycH9mGwW5p6sMBQ
	52OtyYdg7x4zp1gvTw0TCUD/FZsjGcwXsfL7Clff6YKMfxF7T4u/liODnjKavrClUitqzQ4jrLU
	rz4cEFwlnN/uI3NlXrNvDcZ5Wyxz5xjQuygj+6jxelVJf1E3JSyF2Ys7zWgO2T64VJTdsBQm4Li
	oc+Us=
X-Received: by 2002:ac8:7c53:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50ba3819907mr171956281cf.1.1774964234181;
        Tue, 31 Mar 2026 06:37:14 -0700 (PDT)
X-Received: by 2002:ac8:7c53:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50ba3819907mr171955411cf.1.1774964232959;
        Tue, 31 Mar 2026 06:37:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72978cf2sm3560420a12.8.2026.03.31.06.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:37:11 -0700 (PDT)
Message-ID: <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 15:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jdCyv1BZS-lzgsyncdkQurTs2a8VRa3X
X-Proofpoint-ORIG-GUID: jdCyv1BZS-lzgsyncdkQurTs2a8VRa3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzMiBTYWx0ZWRfXy+7iMUCOu3f9
 R2Nam+FEGdlpGNEvfBPo/GN+0Y6xIrhTzduMFHKamHivAfevLhpYdLhwsDHwnb3v5kH/radpsHs
 ksOOO4Yn6BTlezSZGaDoxju8/PBkH7bnTrvLH7HEaMyln6dzF4G9W388LqJUZdpoS3/EUHZr0pj
 kSK/+hOLapZMUeJjTiRF8sL92p04pXkBcXhtiGZOTNKT3CmwWStGa4+Hk5bxQW98vK/15udB+wk
 YDQORFn3TCjKYPWyeohSiL8K9N9OHYoaTzKlf17e9A4T/ck+yNFEaIz8NeYFuPMHycTT1V/nFyl
 h3EcFDUDOPX1jKCVKFG+dz0iSYsOacGM2L3D6o4wUQBEJqdgoKL1ZvB+LBr3fUDNXsq9gG3cnu9
 5f4S4K+3qVKV/nSzX2Apfry3CiYiw9fpkYgXpBqr+K3RPnmnfswki2g21kO6dpCEZqlRlds360d
 mhuzUSd9DocoLmJcVIg==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cbce0b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iyPJuOvhaBYjIUodIMAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,a600000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101059-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2B90736A609
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:37 PM, Abel Vesa wrote:
> Describe the ADSP remoteproc node along with its dependencies, including
> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> 
> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> combo PHY and an SNPS eUSB2 PHY. Describe them.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +		usb_hsphy: phy@88e3000 {
> +			compatible = "qcom,eliza-snps-eusb2-phy",
> +				     "qcom,sm8550-snps-eusb2-phy";
> +			reg = <0x0 0x088e3000 0x0 0x154>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;

This is TCSR_USB2_CLKREF_EN


> +		usb: usb@a600000 {
> +			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";

Does the device suspend and resume successfully?

Konrad

