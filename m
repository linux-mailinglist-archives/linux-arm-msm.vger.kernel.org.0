Return-Path: <linux-arm-msm+bounces-111183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id COZdFjxiIWr9FQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:32:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5763F718
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 13:32:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NBkelSar;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hCoBT561;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111183-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111183-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB23B30179FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 11:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261F1409621;
	Thu,  4 Jun 2026 11:28:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63D2413221
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 11:28:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572531; cv=none; b=d1PJYqoprxWcpiiux7Lb/CktTCsJfMm17yyx4EMh1G5lcS6VB9kgSt/Mad8pLr4dj/ekRro16uIZ56iX0AvyNhjsUipZ56jvXWjcdjZ6bmTPdA3JQrQPFrUoN0PPhWaZSpzVMCcFR08xJXgVxQbxLO3IaPXRBtFr/5ZKD+vgjv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572531; c=relaxed/simple;
	bh=01YYHSUuwLuWDVbKswkCkl7XEsN7XLTXDUwsACoJPoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoayNuojB+7rpttB7J3DQY3J0cn63rOnZxwGi3rJj+ENZ4+GAXtaIac4t5B5F8zrBxJ2FFk6Q7B1rM+6BnWOVgZfvZmdH8NYfOwtrWER8/isZrzMbNBVMbTgPv/9aZGYPchsWqieE+eSH6/TpgQBt0zlv8POuAmbr3L33qZMxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBkelSar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCoBT561; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654A86oB3233912
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 11:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LKnE3tc1RlkqqMOtABkKWPKA
	xR6YYffnuCDYRPtMBwM=; b=NBkelSarYTR2VYSxH8oE1QMBbNGlnftrTasO6eUK
	DHBshzwHZfov+rpmJq4C9dIUdzuIatepAx1hFz3JPHESS41Cn2aLvQggmGCh/ADe
	bhnC0i3+wronf1K29Jj0vqFCKL4seGtcYBrqk7/r7duPYIA7BRFHw+efqGPn56qh
	wWirqA8M6EdBQ3fACZayazdE9LqDOSvQxHvYeCmRjbg+zGCQFYzxfhyLplcjsNLK
	5aeUtlVyz1ey3D4rD8NXXjbbTo0cYtRNpWXgeWlSXhqemznjwvn+WussJiJ5lgQf
	i/KgBRBxusu226OLWW5uhiO15wzk3TiTSlboVm4K5linuw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s3f84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 11:28:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2f1d1e5so379082a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 04:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780572527; x=1781177327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LKnE3tc1RlkqqMOtABkKWPKAxR6YYffnuCDYRPtMBwM=;
        b=hCoBT561IykoLr+KPuTXzC5dhj4fb+4rrBUDk53h58nYY67KYC2HaBtOnE6TNdxYiq
         Qzt94Omxo8/3z7ApY62e2aV+vsjywdWz1Q0b0J86VwHs22mRwI570Y3ByvrbLkS4cL4m
         xBr8S0obcgrhmQ6DoCnQ1qL5gPz8JoPcLw2Z6HMUnjaCPak7CmYg8IHKAO84D0xWHdI+
         LZzgL7smrOM8faLHFvDZTosEEprST9mpZn+fGKpyuDW47oxGU/Cx2Rzat8RHDFFyBhRB
         ljHzibS09pNSyx6SPHGEqB3u6UvuIAM4RblIzaX/qwNfuUs9Kt1xP3aWx6GEM9Uy11vC
         ++eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780572527; x=1781177327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKnE3tc1RlkqqMOtABkKWPKAxR6YYffnuCDYRPtMBwM=;
        b=D0eS6Rtd8AmL4XyOpSRoVlCYPP/vOQHJCWcgfzqKEtgPStwrnlRxMmKedAhn6qo5rU
         2RX19RYQbr0TpgC0QTSsdNYfG/s+wCvvt7O5UGh2P6k6NuWuEucYiT/GRr3M43pYEatQ
         4492QKaYp7VIya/FLCnjETkyNYH9stWVjLcd9ZEwlqGxBL/26Ddfc/lIiR5Du8ba5lx/
         JHsEyjI92OwGWtp8rQOaAs727gK4PMxn41HuHLlz8KdOXPFO+I1FvRZ8xYpcVyXf0N3M
         9t6Ple0W7XNYVZAgJPjsH0F7QFlH9sQO96ftOF+gNSUdVPTtfUKoabXiM0F8/wErt2P/
         ZXUg==
X-Forwarded-Encrypted: i=1; AFNElJ/w5HCswEdZjoK7im9lEFRz3klg5v9e4vYMB89J3ku1K8UGXCwm120kRTXHQrLDbzvSD87PZP6nStaIbRDz@vger.kernel.org
X-Gm-Message-State: AOJu0YySAHttPA1ue1keZHRolvLOJ4LxUYIRkBw8/NAmitzmXBnxhDWo
	GpEhVBFLc4sYbqCwf45fjBRaxSJps2na+zNH9H+C5eMidYZmmllfmvCpmI2oDNZgHnBfshyUCxf
	YkKQw2dBPHWEHPYxp1IMvP+irVaNgNTyhEvCaKU3zd78hOJify9oTZCKmQbNEQrbZoEiA+ReSSu
	53
X-Gm-Gg: Acq92OF9aaSQJc+md5kKES8rS0Du8ar8HL8kVu0+YF1y8qQcPVK7BS/WEUOV3/teiYV
	P4w1bI1Q/P6oQMINUqxHp8A2akpiQnwYt8AUsjLh3W7SO8qfvEtUfpq4kGMFIChzS6udATZospg
	lV+uvFFpWystXr2gL4ws4KiArpMWF9U6Pb40jsjbgqR9S1HGLl1qax2eA7UqRezv5MOkjBrFPsO
	V2s1pD6u0V8TXfstdSeE9Ycqm0FN4K5lkP80ZW+uiGO2MwpweDBPyQMTlSA5E/TNLK6MmXptHS9
	oZSdC2T0V0X7ZOANUO2M316s/I6zjJIH8bmxVB8IvgBQyWtCDMjiusE8cB0vXpYRsYuUa/qiOFW
	WQu94Hx2Dqjf9euEvVuOQ11RHnkQHH41cd/m6opq327gPBl96PZFU57m8wkwHyiGxPtll/Bz+XS
	2oVfhOVsBAcVO8WncOyzXneSlLJaAnF4JtCdnFHFW7RZr+mao+XZx1JbJy4qaJmQ==
X-Received: by 2002:a05:6a00:3288:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-84284f23ab6mr7402410b3a.33.1780572526769;
        Thu, 04 Jun 2026 04:28:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3288:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-84284f23ab6mr7402388b3a.33.1780572526325;
        Thu, 04 Jun 2026 04:28:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282374300sm7278706b3a.20.2026.06.04.04.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 04:28:45 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:58:38 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
Message-ID: <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9WZXjggeh1uje5qy9pmKWLtp3wc_He5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExMSBTYWx0ZWRfX6Eansrt7FOKa
 zMb3x10UIB8jQ+P+xviS5BkbaihS0b1OuMATAELX8Fbq++HsNRoNavBjBxqzhX7H4q7HWJqNgai
 sVjjBMd63BKgOGRBT01g02GadDk5r1x+JlMWoyTt98TdBeuDzt+SNEnu0A235WUz3MVS15qOCXi
 Us5hMDh94lVOsDc6QoDxtelDMNcQRrfmD2bpBxFVLCmepzk9OiXqDgTqpZKOgTkPGRd6/x1hIfC
 Os02owUSU35n1cqsYa91Pydww1N0N4yyUZwAQzWnumVJCniCzzyiij2XYMyvoxtPSYZfnmrNPjd
 9F3eQMOJYfIn6u9TKMgu1x5VCjZvM0AJcl0X2CLCddO//CCZz72qYXeUFrgrXwH0TKu5OYeCa5v
 L4Q09TpxEZ4LAxKaSQymTUWWr6/rYGfpuT0X9PwUqPZFPtEU2UikgIAJdVDS69uEr2Cc2s2p21C
 CbfAxJLI9KohPplWp2A==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a21616f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XMczTv2Me4NSQKEp8ncA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 9WZXjggeh1uje5qy9pmKWLtp3wc_He5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111183-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBF5763F718

On Fri, May 22, 2026 at 02:24:45PM +0200, Konrad Dybcio wrote:
> On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
> > Add DT entries to enable the PCIe controllers found in ipq5210.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> [...]
>
> >  &tlmm {
> > +	pcie0_default_state: pcie0-default-state {
> > +		pins = "gpio32";
> > +		function = "gpio";
> > +		drive-strength = <6>;
> > +		bias-pull-down;
> > +		output-low;
> > +	};
> > +
> > +	pcie1_default_state: pcie1-default-state {
> > +		pins = "gpio29";
> > +		function = "gpio";
> > +		drive-strength = <6>;
> > +		bias-pull-down;
> > +		output-low;
>
> You shouldn't need output-low in either of these definitions (+ sorting
> by GPIO idx would be extra neat)

Ok.

> [...]
>
> >  	clocks {
> > +		pcie30_phy0_pipe_clk: pcie30_phy0_pipe_clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <250000000>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		pcie30_phy1_pipe_clk: pcie30_phy1_pipe_clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <250000000>;
> > +			#clock-cells = <0>;
> > +		};
>
> Why do these exist? Just pass the QMPPHY reference straight to GCC

Ok.

> [...]
>
> > +		pcie0_phy: phy@84000 {
> > +			compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
> > +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
> > +			reg = <0x0 0x00084000 0x0 0x1000>;
> > +
> > +			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
> > +				 <&gcc GCC_PCIE0_AHB_CLK>,
> > +				 <&gcc GCC_PCIE0_PIPE_CLK>;
> > +			clock-names = "aux", "cfg_ahb", "pipe";
> > +
> > +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
> > +			assigned-clock-rates = <20000000>;
>
> Is this clock supposed to be fixed at that rate, regardless of the link
> speed? And is the default rate incorrect?

Will drop this.

> > +
> > +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> > +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> > +			reset-names = "phy", "common";
> > +
> > +			#clock-cells = <0>;
> > +			clock-output-names = "gcc_pcie0_pipe_clk_src";
>
> Having a gcc_ prefix here smells fishy..

Followed what was used in ipq9574, ipq5424 etc. Will remove gcc_ & _src.

> [...]
>
> > +			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
> > +				 <&gcc GCC_PCIE1_AXI_S_CLK>,
> > +				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
> > +				 <&gcc GCC_PCIE1_RCHNG_CLK>,
> > +				 <&gcc GCC_PCIE1_AHB_CLK>,
> > +				 <&gcc GCC_PCIE1_AUX_CLK>;
> > +
> > +			clock-names = "axi_m",
>
> stray \n above, also in resets

Ok.

> [...]
>
> > +			pcie1_rp: pcie@0 {
>
> pcie1_port0 for consistency with other DTs, please
>
> Same comments for the other port

Ok.

Thanks
Varada

