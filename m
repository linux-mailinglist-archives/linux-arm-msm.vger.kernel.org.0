Return-Path: <linux-arm-msm+bounces-89336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32684D2D935
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AA423019B4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5D9256C84;
	Fri, 16 Jan 2026 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPVrTod1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csrkIjW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF893C17
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768550065; cv=none; b=eB80wt0ctZI7H2lNPtM23lMRiIJoFUo6jXXbd5yBvKybFE86v04aopuyFxngMQr4SexKggkR5CRemdK87ejAJWhDDe+ptIi5fPHUXLbs18+kJG8GAhCYBdLzg0vsqubZAKGLAl0AyZzEuyn2i9ACk1VZIdRaaGoYW2PSL1D6qAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768550065; c=relaxed/simple;
	bh=FeQ/2elsJYTkiuWp4IloEO0qcnIe4QF6CyGzdhfokVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0lZlckmjPvummNTcnywjc7db8FilbtsFExJeXhk5zTqnyB4NyJ2guV3a/NKVc5PCbQfkdSt9pqsmPLwxE9cDUlcNeUKaYc5BSSfC+vv7cYUQANN1sNj2i3OKYQaEoyQKR9aXtpPJ3Wc4sArK+OHrbGtLOOOfFqGNs1/W4P5/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPVrTod1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csrkIjW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMksCu3582826
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkdEieaxVHPqkq11OJihy/oCjaLgcwMVLwgcnnxe92k=; b=gPVrTod1bbxs/KYj
	UNOWq2MpNkzlzOLlcng6tjtI3rdkPo9chcFWqRc2+w+XIwa+tJcet9yRSJ0NtiyU
	+Iv+38ynaSV6KajbcAUPFF/KlpAr+Vg6bx067QLa0cVCpk15ZW10pjXlbE5MyNoX
	O06Gd7xda16nivcZFCREB9l73cEBgoQXzZ54m1/R9mycq2P0j9MxkoJsXeoBQnZm
	NmC5TyoS7B/L1fLEkR8dBkDP0dSVGOITQ32HXUqAMe24h94qp5/cGrIFhAu4LxKC
	7N/uKzp22MLMIy40zdYFzwspBe225AQGkK6kv20vhHmo8UntL6frP1M31kw/qCp2
	VwcTwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9ays9yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:54:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52c67f65cso657867785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768550063; x=1769154863; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FkdEieaxVHPqkq11OJihy/oCjaLgcwMVLwgcnnxe92k=;
        b=csrkIjW4eenhpLDoBH0dLcNoSlqKOc4QKfY8oujG6mUVXqrjpn2dmb0Tq7eedyWxrO
         XEF5ZjZ5kfMHSuCJBdX8AvcGD6td6JHQPG65d3cK6C7JReSAqH1FVSJ7KcnDWWTlRvDL
         FqXH7pXo3VmqTold5qNGWbXa2a7z1LBPLWxVizWkZl6fl/WYTwOeOSjsW0ywBkPgjkDU
         F0GxPQRCJE6moC4UoC/hhFnyiKOODOMvi5SiQo/qQA8yyUhbM+QX99G7Ev0W1Er2HRdR
         JImc8P1CPCRA/rkog9UAlknVtYnc2H8HY81g/Um870SPLHpjStxgDswirZ70FYcFbMzs
         3WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768550063; x=1769154863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkdEieaxVHPqkq11OJihy/oCjaLgcwMVLwgcnnxe92k=;
        b=wnmt4kRZIzdRj5hBUnakEvBtFlAJ6hiDpzDB2IQLDhvYfGcgxe4njZ+0VekW5R3xEM
         iPhgoHpEJjncThHXx8iGZ5W4LUnWFCjBgjK3lGAbCc6uz2uYZFFUqAJSphEgdiplbm5W
         evjKepjp/k7yd6JoAmaAVFH5LHenHORJDf3fEkf9LziTDeHMuvaNB65nVreuf1mMInfj
         DV6YX/RNucbi5YfQp0dhnYCbmp30smbjWS2QiNzboBdOOg70wvwmjYa0iUDfTz7ieKFc
         jzQ1foH5N+xu6d42xhnrawraFOb/JqI5O0DBD8RHjgRvrrNm043tlmRWqD6LNNM6r5ql
         2mjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW00NdJPio5nRJed1jCEzw2mzDGK7iz2J59FMjR2OCusS1IGpDpXsSm1S3zBvi2w9sbmy3geQGjEsBPSUC@vger.kernel.org
X-Gm-Message-State: AOJu0YwzP5RB7SfITU3C51E7oi0XCBun/2wGUQ8AVd8cXEOmdy9igymk
	dCA9a+L7LNUelDtCbUeApX284HEn6je+T4y+Le2kurJQVNeg8J0tsQtMH2uOCyeAJ3ELQbtA9o0
	EGk7SCkKFGSMnsZo63ABRp63h/zJfeInbwSaRqJWvyXRF59yYTvf+iM01e+AEnw0It3Uw
X-Gm-Gg: AY/fxX5Si4rnaUCGciGWDq35BgLTG8wGbatdcpg2rOEKEIPp4NxHa6BFa3Ay+rbr8q2
	K2f0ExTHkFA0zV0w/fX2CBSH9mWq4I8ZtU+w3tg5iebl1Pox9Jiq3/+utdhQnhx15n8fRqf48Cl
	WFQFLK76/+hVyBoTA88qxK8sb0TniksS6rcLjI+cLzCY0kkH0XMZ2HfEhDn630aak3ByYlkmcUa
	b8j2AM9C63/TQ/3dtFQlU2T93YBLhgQPUWGuuUslC8xVA/F4aRuFoH78K4oUWnSv1LXxXLKdObF
	EwqpZzcqjlnHGK0bmx7EgRHFmFrvRa9s6Qy8b97N5H3dNFkwOmg8DMLQzyX7IcFeH0rMaH4ibkk
	nqxtz/CWMid8++jmSPfzlPtPpKNIk7FYkzfn9TdozAQfYWpo5w0kMUboCW9HGvVnhMxDja2vjYv
	PYyAQ0DLt+abnwac470USrBJE=
X-Received: by 2002:a05:620a:690d:b0:8be:8e5a:7a6c with SMTP id af79cd13be357-8c6a6956087mr263900585a.73.1768550062769;
        Thu, 15 Jan 2026 23:54:22 -0800 (PST)
X-Received: by 2002:a05:620a:690d:b0:8be:8e5a:7a6c with SMTP id af79cd13be357-8c6a6956087mr263898485a.73.1768550062331;
        Thu, 15 Jan 2026 23:54:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e79114sm5269301fa.32.2026.01.15.23.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:54:21 -0800 (PST)
Date: Fri, 16 Jan 2026 09:54:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: tessolveupstream@gmail.com
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <5c5oalpne2xedc42yomtur3lo7vvdyncgs7yd46xw4nvi6pzbd@vcjz3wsyjd3c>
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
 <20260114100043.1310164-4-tessolveupstream@gmail.com>
 <5102252a-0f50-4ee9-97b4-a90859a33b2b@oss.qualcomm.com>
 <128a5f86-dd3f-4e5e-a55f-3c8b5993779b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <128a5f86-dd3f-4e5e-a55f-3c8b5993779b@gmail.com>
X-Proofpoint-ORIG-GUID: UoKjSm0O3NP6iTPQXw-do0YyG3_2jaXX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1OSBTYWx0ZWRfX8niuREYjYKL+
 FB390BG1vjfe01BZgpMwhnAoOOTgLRoVtz47WRXMACW3YQIwb3D5Og9SFDoYczfEVpfB95UWOeR
 oq3n46AYUsayt1rgaXNB0/7Vy97KVaxeZTKzmhbUrDovfbN+fFhB6AOOgjJexmOYaAElueQwi5P
 TACSjkd7YWR/8XmQ4AIlKAO2z9D++ZnGE5P4Blp35PdCO6zOrDJhlGyEzz2m54Wb1nEPPwuH0+I
 lqCsc37SRB5rFxjakMwyZUqt/y6ORhR8nA83Sz4cJfRDNer7nIowa++aXikkU6niEEtfHSwak+H
 h9l37NzvkcDAPryEUvvP8KeirJozpIE/0VYAfGZNRhrP7tXR++gyMbb/kxBc00SZgq4zCJ9C40n
 s6KUFmjIXhihKU3T58swcZtwzgWLlNuJAZKrxYgiNkECtpT0mqfWW1dL5RzZuHDrB5lD42+FEfq
 eHFc2Tj8KQACZnkEkBQ==
X-Proofpoint-GUID: UoKjSm0O3NP6iTPQXw-do0YyG3_2jaXX
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=6969eeaf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=e2_Bygt052TcFees0PwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160059

On Fri, Jan 16, 2026 at 11:25:50AM +0530, tessolveupstream@gmail.com wrote:
> 
> 
> On 15-01-2026 07:54, Jie Gan wrote:
> > 
> > 
> > On 1/14/2026 6:00 PM, Sudarshan Shetty wrote:
> >> Add the device tree for the QCS615-based Talos EVK platform. The
> >> platform is composed of a System-on-Module following the SMARC
> >> standard, and a Carrier Board.
> >>
> >> The Carrier Board supports several display configurations, HDMI and
> >> LVDS. Both configurations use the same base hardware, with the display
> >> selection controlled by a DIP switch.
> >>
> >> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
> >> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
> >> can describe the HDMI display configurations.
> >>
> >> The initial device tree includes support for:
> >> - CPU and memory
> >> - UART
> >> - GPIOs
> >> - Regulators
> >> - PMIC
> >> - Early console
> >> - AT24MAC602 EEPROM
> >> - MCP2515 SPI to CAN
> >> - ADV7535 DSI-to-HDMI bridge
> >> - DisplayPort interface
> >> - SN65DSI84ZXHR DSI-to-LVDS bridge
> >> - Wi-Fi/BT
> >>

> >> +
> >> +&usb_1 {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >> +    dr_mode = "host";
> >> +};
> >> +
> >> +&usb_hsphy_1 {
> >> +    vdd-supply = <&vreg_l5a>;
> >> +    vdda-pll-supply = <&vreg_l12a>;
> >> +    vdda-phy-dpdm-supply = <&vreg_l13a>;
> >> +
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_2 {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_2_dwc3 {
> >> +    dr_mode = "host";
> >> +};
> > 
> > Both usb devices have been configured to host mode, do we need adb?
> > The adb only work with usb peripheral mode.
> > 
> 
> This topic was discussed previously, and the fix was implemented 
> based on that discussion.
> For reference, I’m sharing the earlier communication in the 
> links below.
> 
> https://lore.kernel.org/all/qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr/T/#meaa464a4e6992b36b5d8d41ddc691ee4ea36b1ce
> 
> https://lore.kernel.org/all/20251014120223.1914790-1-tessolveupstream@gmail.com/T/#t

Neither of these links is relevant to the question.


-- 
With best wishes
Dmitry

