Return-Path: <linux-arm-msm+bounces-116018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JBOGOv5cRmoARwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:43:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 412836F7CCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:43:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b29vioLh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XgeSkc7T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116018-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116018-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CEE1304C2D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8438247DFB0;
	Thu,  2 Jul 2026 12:28:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387D47D938
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:28:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995338; cv=none; b=dfdabMd1XaLzeBifs4ZLt2m1ta/M2nHFqmAO1jqEazJi1deD5EhPusMoP3iqxQ7w7JgUMLxyL5K0L8jYTJwqH6ofAYh4OepEav2+8hlVQg5wn/hoxy8M/AmPVmoHSdO+ijUKVYvzY4jAtELg9rHgqBFBGp4jy0O/nTphdZO3MFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995338; c=relaxed/simple;
	bh=COpY2GemQ1U4F2t1+ZTX6uWDx5gWhzTebof26LsUZNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3nXWhvICQCvLEvAVzAoXIyZ9/vsY+9qAzjp17vnVS3D3/C9AhklN0Hh6yEC1u8uK+CZHXMQPZD7qZ+7Cmzjg8fbMjFi1ysZUZo8KknpiaeeHp/pDdDneud2WK/D3yQ8H+I7qV76Rx0wGginfzvu+xzcgXbXvNAb2UBSpY8yEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b29vioLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgeSkc7T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AZc3g3590859
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lvzb1qRCN0AnTm1wAxas51Hw
	vQwvP/t+tsyHqLNwmlI=; b=b29vioLhQJzREsMmeMkeRegBpy2YSR+BVPJgoGCP
	5PXqVDzRk+o//jDdI0mq9EeJj93XR2jmBvSbFGjNsvYLqW0odFT6mOXsCF5A7Hx5
	+l2Cw0clbSg52UpVCgvLWtoFPBmVER5MsW7JJWH0CZ60BHu2XZYI+aV9OSMhAdUg
	zpeXAU4CLeKOoJ22IOKT3Ho7uRrLGniZ4VQWsEQLpeq2M9t5otNLWzQZUVCwZLOd
	d3E5gAzykzTVxb5eaNnKP0OW2iMD1n+vct0FEA4K/dY2mgYVAUz+f9gAq1HNYZwB
	1CwKNuSk0EfVTpQQnI5zIxmAQ94JUMElvTme9tKuCUXk4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9pm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:28:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e663c29f2so68809285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995335; x=1783600135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvzb1qRCN0AnTm1wAxas51HwvQwvP/t+tsyHqLNwmlI=;
        b=XgeSkc7To9D5pBgQgUbnEn8JMn4l4AKiHSGl+dWrggGu54LOIhqKA4Xg/Jxu8ra9QR
         0gH1CBdu9x+5015pJQ8HjUl+AGlCi/RY+CvNUIdYt3Lzri2BmBMSB7TGRqC1L5QF5q1V
         ymOPUJ0q6yvTTgJ+8jDu4LkEjMJFj++AE+Al3DeiPW2fhEMMqau8cZMrPvb0UbHcCTvP
         SUSXeP+7EjN+Y818nPMndWDPG0dXwqC8KYRVNZTO6AsKUlpfIpuynxMvHPY90rJ75uVn
         bbiQrVpXotTZCyRbMxFmjCJwX5pP+wgqtrAmSO98DfP9dx1J6zP0AIlwM2Onko+gHCN4
         w2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995335; x=1783600135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lvzb1qRCN0AnTm1wAxas51HwvQwvP/t+tsyHqLNwmlI=;
        b=IYth7SeJrCD/pbxqiGnZU7kI2wTsTQKM3Z0184dt7t9WUR1pK4hjt70MLSh5RlQV1i
         MdM6QGpavNCzV3ay6m9+yrHhE5/uWRLLPYDlgs7EryHWV21Wm0piWXxr+TYCEpLHsQ97
         YIVxsJ5/tmpyRRlXYyBqNR1UA4zKGdt0MSep0dlcRUwOadEK0WqOwekWGVpss7qqevkz
         cExSwzPI8cNyJ84ne4EwzNze/z23wJpek67w3aVMytSwW9k84w6fPj0aPp8sWG3msrRY
         H6dDQKh0zhd394juoJGfU2jvf6EkL0dra4h2G3fE8aFdityOHTKa9CZH4OFnb/3nfqxH
         BYPA==
X-Forwarded-Encrypted: i=1; AFNElJ/UcOwKk6X192V0N3QM25JYKp39UGOyCi/unR/H+QQRqtQGTangXWUI+fgMeTCduy3QtSbQKrHNelAf3M7p@vger.kernel.org
X-Gm-Message-State: AOJu0YyvausDEcpwp8jQ6JoMWnv6GYHPMCMcvucWbdrwv+NQNjrCqtC3
	iRaMEOBEnjJrHtEuVnE4aSYckfMTTp54SnIYOJFasPfxjXoiZg6ZqkDNd15EWRlWixXdAUPIxJM
	2AaTxRLWA07HpDbzRYfJGmJwYGuV7WTy32w2e9U+5FCJluHLpRECfq5E3w6fE0Ahn6o1C
X-Gm-Gg: AfdE7clomDTuQ34yNGjLxhNvitHTd7YTxiT34QhcsJKgv2MCGFMuCAnEQepExHuSpDc
	PH2cKyskFEiYk14S9XMert6bI2l8wn5rZaCxo0LJBnaQuZFmnOmlfGg2OQPDFbyanaoPMvGdPNb
	lGTC5imSoBqjM7EoMH/rA9xOWfF2Mvt5CKsDlyuPwFsQ5ATn7FGgpsHoOL9daB73j1xSkv3fjY3
	r6xZoJ1TYki1dxCtywVlM7yhgOlX0xp+11dAUjfZwuzDe8zj6U/AdlTl6qvvzu6epa3WplQ5BCT
	jjgH6qfq3dUKlnrBa5Y+lsbsyJ5auNB03VNudsrByN3Wo6fFNmzku4IRnbi6BfoRuc7lXFYO9BH
	qErthUaFgTkNTmxWwaLQafpK54OtlI8PhbNDCLXZLNUcl+UvNoYqwwVDtcmnDgM7Ksqd7W1UC6j
	D3Tgk8NF1+3TlrH0vQdcXerWUf
X-Received: by 2002:a05:620a:404b:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-92e697c2f1bmr1298378685a.21.1782995335450;
        Thu, 02 Jul 2026 05:28:55 -0700 (PDT)
X-Received: by 2002:a05:620a:404b:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-92e697c2f1bmr1298374485a.21.1782995334929;
        Thu, 02 Jul 2026 05:28:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d5406sm655725e87.51.2026.07.02.05.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:28:53 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
Message-ID: <rgmbpm6we7o3ojyf5nlh6vq4artsbbcq3c26zpihlz3yxsm2ny@wrzagqnglyd4>
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMSBTYWx0ZWRfX4Yb9VPemPVqe
 186/A8gChSlXQVDl9uiRzXGGXEm6ahdLPc56d0b6CjoNpp9yAzrjyOpdPLQ5yhI3/7RRDTpEsaJ
 SDviIUol9KnNKlJ0b9LaZ/HgpBoXYFjBI/ieywVF7CUmsdCWAfbsEmmxMi51qOzdzsGU1GQddpZ
 IPRIx1WZ0YiiBjDq/oYPYoPlzi6ZeO71NhSoUM/2inWFhiG38+ad6qncgS3V3aktfde4VULRCvt
 KnHwmdNzrF5wE1CHVuqtn75m2vTHb11WwyEmJ3w0uyENjq0riwLCe5N2b9VI98p6LaDsuf9jdl/
 lKqCczW0HhGF7tKdhiyhu7KnonWcPCUwgIdqW7QW4LMbmsfTZPDZd/hGuKzBh16mHAkGY8bFj9u
 q7YAiQ1MDt6DKHwOQT9OQO3JtPppTC1B8pTxfBdfdH0+Upfr50VtFoUIfr7dlXRc0UdZEbcPKi9
 NoAavNnB38r2Pu51LWQ==
X-Proofpoint-ORIG-GUID: MTUYgnin1mO9u0MqezOdTVXb2Q1jc1oM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMSBTYWx0ZWRfXwqbHRmF4ywFV
 ElJE3cIVn2drCBhst62cyeO5bl+AF9VngfoU2t/zNW87/6hybhccRUemafsLQiIgbxL+tDvDuSO
 ZHbxxVAdmpfbDCQiDCb5RtYgn2KAXRE=
X-Proofpoint-GUID: MTUYgnin1mO9u0MqezOdTVXb2Q1jc1oM
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a465988 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-bbeSf0u8fdg_r4b2XgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116018-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:yepuri.siddu@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:quic_mohamull@quicinc.com,m:quic_hbandi@quicinc.com,m:rahul.samana@oss.qualcomm.com,m:harshitha.reddy@oss.qualcomm.com,m:dishank.garg@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 412836F7CCC

On Fri, May 29, 2026 at 11:32:34PM +0530, Yepuri Siddu wrote:
> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
> industrial mezzanine board when populated with a QCC2072 Bluetooth
> module.
> 
> The overlay configures UART4 (gpio16-19) for Bluetooth communication
> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
> lines to minimize power consumption when Bluetooth is inactive. Host
> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
> SW_CTRL is mapped to gpio86 for power sequencing.
> 
> Disable UART7 in the base industrial mezzanine overlay as it is
> not used when the M.2 slot is populated.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  ...3gen2-industrial-mezzanine-m2-cologne.dtso | 110 ++++++++++++++++++
>  .../qcs6490-rb3gen2-industrial-mezzanine.dtso |   4 +
>  3 files changed, 116 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso
> 
> +&uart4 {
> +	status = "okay";

Status should be the last, empty line before it.

> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
> +				<&tlmm 19 IRQ_TYPE_EDGE_FALLING>;

Align on '<'

> +	pinctrl-names = "default", "sleep";
> +	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
> +			<&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;

The same.

> +
> +	bluetooth: bluetooth {
> +		compatible = "qcom,qcc2072-bt";

If it is M.2 slot, then it can have any BT card, not necessarily
QCC2072.

> +		max-speed = <3200000>;
> +	};
> +};

-- 
With best wishes
Dmitry

