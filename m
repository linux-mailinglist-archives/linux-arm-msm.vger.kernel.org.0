Return-Path: <linux-arm-msm+bounces-89908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDkNHcsNcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:20:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1466E4DB37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43DCF969897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EA433D6D2;
	Tue, 20 Jan 2026 22:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2hUzwr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAAyx2A9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51C2D9EC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768949883; cv=none; b=NT7XBw7ZWYJVgYu+PHPvKWh63HVlQ7bz0llHbwltvA72YYZFhwROuIr1zuNNSZwnQ8W+d3vqCjDIcAWiugoVFEAvsniiTAbPhqT4i+kSeBWenKkNphjPjstL+pnXIipgMSLP2gTE8np6Zvn/l8KGW0ySbLl17k+IjmZhvH/ixys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768949883; c=relaxed/simple;
	bh=0X2XUXsCmE9pgAaDEHtbK2MrCtdKd2z7RttRaUkQIh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI8kL48ApfkwersgJcNTTUIDSZ9WTu3zFsNbbz1C9VNWZYnxNJSZDoXEZd11VTy88DnhsBgfAvLCsdP/eO6GzSve35Is1tTtayVSwE6NxRSlcX+dB0e+jI6JJVhPhBWkffDJIAzDc2YRVb0TifxnEq08/jVDA+r4nqxgNRJxZWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2hUzwr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAAyx2A9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KJuceG385665
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h52T9Jd5TRxMgBvAbyNGjzkIBVjOHElXF6kADaNoRC0=; b=P2hUzwr+ADdie7JH
	l2Z2i963S4QzGGNmU5xG1kgCoIh24bETJH5xyPkVYbJOdXMe8DDUpRl9U62NA2JN
	kxqbCB44iR37GZ4WyxKfla8XTyOSRDG2oXidbTfCkNJHDbWXO89USmBuYgwfpkwJ
	gWCOkhzdvnhf4w1d3V/gHTWY/G8ReWE2P0IuikFJPyw0AN3VIMd7UsE6yOaRgIAx
	S/Q+2gfiu8mv2c1o8dHluoZK+hcjG3YuajgusS7nQMzmLdag/n/oqAh0foJme7ho
	pi6+fd4AN0QbIsf2aOdtQtWggl9ygbOA77j6UMEOQA3M3aivYJzBJurZEJknI/oD
	4vBscQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta7q9y2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:58:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a69b7813so1154819885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768949879; x=1769554679; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h52T9Jd5TRxMgBvAbyNGjzkIBVjOHElXF6kADaNoRC0=;
        b=WAAyx2A9/y4z++9qEv1LcW/3El2dCHA1DClbSBn9bHA3mAQSalNkfFx1Ak2WkHa0A5
         flQfTHcfSwyjS/Uxeflz7aYV46hi2TGU9iabqpnltW42vSgzTG9/RKhHvjqzErkCnhlX
         Jr5Trk5IA3KzNik8R5/u8xFL/Y5CaMYgiu0xcQzewPdUOpqQ9HLzxl7xRZLVT2iGo1rM
         ArJ0lgYt7nm4HtEbk+rU7sWJUMRBmOmLTURToH3TClvnG+DgJqQKkZo6KiiSkyG2v1uM
         dwONeLR8eBtoRubjoSUTDVgZqU21M1cedkt+S2D6OkQkCHWwL3DFHwyhuqFfUclaWz9C
         1HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768949879; x=1769554679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h52T9Jd5TRxMgBvAbyNGjzkIBVjOHElXF6kADaNoRC0=;
        b=h56G0RY9jFOpJqbjtdXc7f7+3PPbWFMbsa51zGSscDQxsrtjJPU5yETckXslZS1ipB
         LL3Ct1diujjhJzVOIoCQBiY9VbG4uE+D5dfI7Svlsbt4lq7WiSGVG+k01rIAaCyEEuHk
         NLdeSCEfX9nx/wFp38WpYx3dy3ojNZm14I7p0DLZQZALBPxmzsWz7Q9bDDj9jfJQK2ei
         tD7Bt61xeOE2lYqG7QQ9G1FzXmoqIq1wy57e4HLX/aEM2kSj1ft5JbDeHDSZ13nBEfdh
         Xz3GXEmo/jFyfUDUinHA0WwyguFdYlPy/ypneeWtFZOPdwzzWmkKkLipQ35tDB8mFHMU
         rgyw==
X-Forwarded-Encrypted: i=1; AJvYcCXH4jiATANAlA+K1SY3gdwEf873GFrUltdUwBaqHsQs/pu+jTpt/PkX08KmGxqYpFwI5jVmApYpAPJmpUho@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXMK9gkAPlc7QzG+0p2E9jxeZWZ3jCU66x/t7h2QCimVl0YUa
	SvYArWFJtsqOU0VqUUQaK9zb5LnJ9JfQVKRhcg9S7gO58PJowjJgjcaytpHWBfHlp7s7YV3nVQB
	KRQ7R8DDoznGW4TqNf7BfwcgPDW1S7ycwb5J90SUpaf2sreLgX2b/UVLn3iCjYkihMPJP
X-Gm-Gg: AY/fxX6pmx7K/YbEfBlXcRyNegGEXJGY6udTvfvOrYJ5n36DAiU2gqA36l5gqVvW85E
	BOZW+HL0/eYgJHYfekQoWhI2L7QxwZMM+7IhZEYwYVfTMncm993i6+Y+NygOZ21U66CtRRMPOHj
	rbhjUNs40fTCDrVw0s23erK8dd1kl0Z3KFjekURsS4fD5/QJ87ITkmQBUkfYxEg+B0vsjuLayT9
	gS5bxpsvFdYNPMlQoiGwXjFQY5aiCOuzwL1JIHpp6T/Qt6yN2Ny0v9jTe5R/rSkZZKbaGa+iMqg
	ErK+deVYy+ANeO38rAJzbTwXiCm9x7ZMqkapmaZBn0vIGsJQ0p7uiiFJeryKXuelR2PciODKDtr
	dEnTx58TLbG/ORMF9wp5/3PMApQLGzkpsBzPeE27QCrp/00cA6V+w1NKlNYd1kucUoDSdR51Opg
	xB1dS6PVjL0SGip9OvSV7gAWg=
X-Received: by 2002:a05:620a:2a02:b0:8c5:3869:3f28 with SMTP id af79cd13be357-8c6a695902fmr2453855485a.85.1768949878808;
        Tue, 20 Jan 2026 14:57:58 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8c5:3869:3f28 with SMTP id af79cd13be357-8c6a695902fmr2453853085a.85.1768949878184;
        Tue, 20 Jan 2026 14:57:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d3da7fsm43686901fa.2.2026.01.20.14.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:57:55 -0800 (PST)
Date: Wed, 21 Jan 2026 00:57:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: tessolveupstream@gmail.com
Cc: Qian Zhang <qian.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <x6cr356i72727fhtvc4ng4o7p3jml2tdgga4mbdtalm4d24ujp@6f2ljmznomgj>
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
 <20260109095221.2847067-5-tessolveupstream@gmail.com>
 <3a4e0513-5b2d-4890-a4df-5306a694cf50@oss.qualcomm.com>
 <530e2a7b-52e4-4119-ad54-8ff9e1d4fec0@gmail.com>
 <ei3zvx47jubvgrz25pemfeu6zt5be6dduqpllp5qyhbhqblvnp@c2tqv7hyicii>
 <3eba04f8-fd1e-46f7-a674-510ed6f48ed2@gmail.com>
 <k3kzreaehe2whvxbnbhj3pb7s4gifobfp65epzvmqgb6s6xoi3@wqawppwj7vmi>
 <2d9775c4-e8fb-4c95-b1fa-c775e96d5e04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d9775c4-e8fb-4c95-b1fa-c775e96d5e04@gmail.com>
X-Proofpoint-GUID: F0iwd6WD0tUtmOmXjGAX1UiKxoomFC9o
X-Proofpoint-ORIG-GUID: F0iwd6WD0tUtmOmXjGAX1UiKxoomFC9o
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=69700878 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S3_FL3m66Qb7-fltA5cA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5MSBTYWx0ZWRfX1S3d/NUSKVMw
 Q2J0ei4yP5Az+NiHLJUK2YVP67Z2O8DCAJir3Wcm8h/b4D0raKRLSyJk2U2FzCVsEwJKKtx2Nmv
 ebmCjkuS+foDlo7iH++x6xFosObgZAyfsp+3CO/z70zKnmO1teJHmS5W3m4SdyGTHt+MebwmfBk
 msdJoubZGuVeJLmmsoCYUvh21xV/KVYHBo6qqILXh5N/KXwfjFxjcTEftttuAe3ZRdpe+nrC3Ix
 bNCt8gSK/bpTREhAR+VIgiobZGEcR8poZWyK3swksJjHCBGDVRpin3aaR0nlWogGrcs49y+Mgpc
 j2NhEW782HjO8sqlBPZYK1Rg1X5KozM1JqfVjqgKEAoCOXhQWXd4gmMBKcVxWVOflez+eR0gH++
 Chr03pdsNJcLNMa9Q2NLJg3EZnacQCM94FcKqgQEaS4zF1Quk9ZdQTEG2A4bSMeYXmefP/vF47+
 wxCh8SYRbvvYM60Zn0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200191
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89908-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1466E4DB37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 04:33:28PM +0530, tessolveupstream@gmail.com wrote:
> 
> 
> On 16-01-2026 17:19, Dmitry Baryshkov wrote:
> > On Fri, Jan 16, 2026 at 04:57:42PM +0530, tessolveupstream@gmail.com wrote:
> >>
> >>
> >> On 16-01-2026 13:26, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 16, 2026 at 12:28:22PM +0530, tessolveupstream@gmail.com wrote:
> >>>>
> >>>>
> >>>> On 15-01-2026 18:47, Qian Zhang wrote:
> >>>>>
> >>>>>
> >>>>> On 1/9/2026 5:52 PM, Sudarshan Shetty wrote:
> >>>>>> Add the device tree for the QCS615-based Talos EVK platform. The
> >>>>>> platform is composed of a System-on-Module following the SMARC
> >>>>>> standard, and a Carrier Board.
> >>>>>>
> >>>>>> The Carrier Board supports several display configurations, HDMI and
> >>>>>> LVDS. Both configurations use the same base hardware, with the display
> >>>>>> selection controlled by a DIP switch.
> >>>>>>
> >>>>>> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
> >>>>>> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
> >>>>>> can describe the HDMI display configurations.
> >>>>>>
> >>>>>> The initial device tree includes support for:
> >>>>>> - CPU and memory
> >>>>>> - UART
> >>>>>> - GPIOs
> >>>>>> - Regulators
> >>>>>> - PMIC
> >>>>>> - Early console
> >>>>>> - AT24MAC602 EEPROM
> >>>>>> - MCP2515 SPI to CAN
> >>>>>> - ADV7535 DSI-to-HDMI bridge
> >>>>>> - DisplayPort interface
> >>>>>> - SN65DSI84ZXHR DSI-to-LVDS bridge
> >>>>>> - Wi-Fi/BT
> >>>>>>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >>>>>> ---
> >>>>>>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
> >>>>>>   .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 126 ++++
> >>>>>>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 616 ++++++++++++++++++
> >>>>>>   arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
> >>>>>>   4 files changed, 885 insertions(+)
> >>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> >>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >>>>>> index 76cf0115a00a..289b651ef0c5 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >>>>>> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-mtp.dtb
> >>>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
> >>>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
> >>>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
> >>>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
> >>>>>> +talos-evk-lvds-auo,g133han01-dtbs    := \
> >>>>>> +    talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> >>>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
> >>>>>>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
> >>>>>>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> >>>>>>   x1e78100-lenovo-thinkpad-t14s-el2-dtbs    := x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..ad058cf4cd93
> >>>>>> --- /dev/null
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> >>>>>> @@ -0,0 +1,126 @@
> >>>>>> +// SPDX-License-Identifier: BSD-3-Clause
> >>>>>> +/*
> >>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>>>>> + */
> >>>>>> +/dts-v1/;
> >>>>>> +/plugin/;
> >>>>>> +
> >>>>>> +#include <dt-bindings/gpio/gpio.h>
> >>>>>> +
> >>>>>> +&{/} {
> >>>>>> +    backlight: backlight {
> >>>>>> +        compatible = "gpio-backlight";
> >>>>>> +        gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
> >>>>>> +            <&tlmm 115 GPIO_ACTIVE_HIGH>;
> >>>>>> +        default-on;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    panel-lvds {
> >>>>>> +        compatible = "auo,g133han01";
> >>>>>> +
> >>>>>> +        ports {
> >>>>>> +            #address-cells = <1>;
> >>>>>> +            #size-cells = <0>;
> >>>>>> +
> >>>>>> +            /* LVDS A (Odd pixels) */
> >>>>>> +            port@0 {
> >>>>>> +                reg = <0>;
> >>>>>> +                dual-lvds-odd-pixels;
> >>>>>> +
> >>>>>> +                lvds_panel_out_a: endpoint {
> >>>>>> +                    remote-endpoint = <&sn65dsi84_out_a>;
> >>>>>> +                };
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            /* LVDS B (Even pixels) */
> >>>>>> +            port@1 {
> >>>>>> +                reg = <1>;
> >>>>>> +                dual-lvds-even-pixels;
> >>>>>> +
> >>>>>> +                lvds_panel_out_b: endpoint {
> >>>>>> +                    remote-endpoint = <&sn65dsi84_out_b>;
> >>>>>> +                };
> >>>>>> +            };
> >>>>>> +        };
> >>>>>> +    };
> >>>>>> +};
> >>>>>> +
> >>>>>> +&hdmi_connector {
> >>>>>> +    status = "disabled";
> >>>>>> +};
> >>>>>> +
> >>>>>> +&i2c1 {
> >>>>>> +    clock-frequency = <400000>;
> >>>>>> +
> >>>>>> +    status = "okay";
> >>>>>> +
> >>>>>> +    hdmi_bridge: bridge@3d {
> >>>>>> +        status = "disabled";
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    lvds_bridge: bridge@2c {
> >>>>>> +        compatible = "ti,sn65dsi84";
> >>>>>> +        reg = <0x2c>;
> >>>>>> +        enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> >>>>>> +        ti,dsi-lanes = <4>;
> >>>>>> +        ti,lvds-format = "jeida-24";
> >>>>>> +        ti,lvds-bpp = <24>;
> >>>>>> +
> >>>>>> +        ports {
> >>>>>> +            #address-cells = <1>;
> >>>>>> +            #size-cells = <0>;
> >>>>>> +
> >>>>>> +            port@0 {
> >>>>>> +                reg = <0>;
> >>>>>> +
> >>>>>> +                sn65dsi84_in: endpoint {
> >>>>>> +                    data-lanes = <1 2 3 4>;
> >>>>>> +                    remote-endpoint = <&mdss_dsi0_out>;
> >>>>>> +                };
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            port@2 {
> >>>>>> +                reg = <2>;
> >>>>>> +
> >>>>>> +                sn65dsi84_out_a: endpoint {
> >>>>>> +                    data-lanes = <1 2 3 4>;
> >>>>>> +                    remote-endpoint = <&lvds_panel_out_a>;
> >>>>>> +                };
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            port@3 {
> >>>>>> +                reg = <3>;
> >>>>>> +
> >>>>>> +                sn65dsi84_out_b: endpoint {
> >>>>>> +                    data-lanes = <1 2 3 4>;
> >>>>>> +                    remote-endpoint = <&lvds_panel_out_b>;
> >>>>>> +                };
> >>>>>> +            };
> >>>>>> +        };
> >>>>>> +    };
> >>>>>> +};
> >>>>>> +
> >>>>>> +&mdss_dsi0 {
> >>>>>> +    vdda-supply = <&vreg_l11a>;
> >>>>>> +
> >>>>>> +    status = "okay";
> >>>>>> +};
> >>>>>> +
> >>>>>> +&mdss_dsi0_out {
> >>>>>> +    remote-endpoint = <&sn65dsi84_in>;
> >>>>>> +    data-lanes = <0 1 2 3>;
> >>>>>> +};
> >>>>>> +
> >>>>>> +&tlmm {
> >>>>>> +    lcd_bklt_en: lcd-bklt-en-state {
> >>>>>> +        pins = "gpio115";
> >>>>>> +        function = "gpio";
> >>>>>> +        bias-disable;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    lcd_bklt_pwm: lcd-bklt-pwm-state {
> >>>>>> +        pins = "gpio59";
> >>>>>> +        function = "gpio";
> >>>>>> +        bias-disable;
> >>>>>> +    };
> >>>>>> +};
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..95ed335bcb08
> >>>>>> --- /dev/null
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >>>>>> @@ -0,0 +1,616 @@
> >>>>>> +// SPDX-License-Identifier: BSD-3-Clause
> >>>>>> +/*
> >>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>>>>> + */
> >>>>>> +/dts-v1/;
> >>>>>> +
> >>>>>> +#include <dt-bindings/gpio/gpio.h>
> >>>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >>>>>> +#include "talos.dtsi"
> >>>>>> +#include "pm8150.dtsi"
> >>>>>> +/ {
> >>>>>> +    aliases {
> >>>>>> +        mmc0 = &sdhc_1;
> >>>>>> +        serial0 = &uart0;
> >>>>>> +        serial1 = &uart7;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    chosen {
> >>>>>> +        stdout-path = "serial0:115200n8";
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    clocks {
> >>>>>> +        can_osc: can-oscillator {
> >>>>>> +            compatible = "fixed-clock";
> >>>>>> +            clock-frequency = <20000000>;
> >>>>>> +            #clock-cells = <0>;
> >>>>>> +        };
> >>>>>> +
> >>>>>> +        sleep_clk: sleep-clk {
> >>>>>> +            compatible = "fixed-clock";
> >>>>>> +            clock-frequency = <32764>;
> >>>>>> +            #clock-cells = <0>;
> >>>>>> +        };
> >>>>>> +
> >>>>>> +        xo_board_clk: xo-board-clk {
> >>>>>> +            compatible = "fixed-clock";
> >>>>>> +            clock-frequency = <38400000>;
> >>>>>> +            #clock-cells = <0>;
> >>>>>> +        };
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    regulator-usb2-vbus {
> >>>>>> +        compatible = "regulator-fixed";
> >>>>>> +        regulator-name = "USB2_VBUS";
> >>>>>> +        gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> >>>>>> +        pinctrl-0 = <&usb2_en>;
> >>>>>> +        pinctrl-names = "default";
> >>>>>> +        enable-active-high;
> >>>>>> +        regulator-always-on;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    vreg_conn_1p8: regulator-conn-1p8 {
> >>>>>> +        compatible = "regulator-fixed";
> >>>>>> +        regulator-name = "vreg_conn_1p8";
> >>>>>> +        startup-delay-us = <4000>;
> >>>>>> +        enable-active-high;
> >>>>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    vreg_conn_pa: regulator-conn-pa {
> >>>>>> +        compatible = "regulator-fixed";
> >>>>>> +        regulator-name = "vreg_conn_pa";
> >>>>>> +        startup-delay-us = <4000>;
> >>>>>> +        enable-active-high;
> >>>>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    vreg_v3p3_can: regulator-v3p3-can {
> >>>>>> +        compatible = "regulator-fixed";
> >>>>>> +        regulator-name = "vreg-v3p3-can";
> >>>>>> +        regulator-min-microvolt = <3300000>;
> >>>>>> +        regulator-max-microvolt = <3300000>;
> >>>>>> +        regulator-boot-on;
> >>>>>> +        regulator-always-on;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    vreg_v5p0_can: regulator-v5p0-can {
> >>>>>> +        compatible = "regulator-fixed";
> >>>>>> +        regulator-name = "vreg-v5p0-can";
> >>>>>> +        regulator-min-microvolt = <5000000>;
> >>>>>> +        regulator-max-microvolt = <5000000>;
> >>>>>> +        regulator-boot-on;
> >>>>>> +        regulator-always-on;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    wcn6855-pmu {
> >>>>>> +        compatible = "qcom,wcn6855-pmu";
> >>>>>> +
> >>>>>> +        pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> >>>>>> +        pinctrl-names = "default";
> >>>>>> +
> >>>>>> +        bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> >>>>>> +        wlan-enable-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> >>>>>> +
> >>>>>> +        vddio-supply = <&vreg_conn_pa>;
> >>>>>> +        vddaon-supply = <&vreg_s5a>;
> >>>>>> +        vddpmu-supply = <&vreg_conn_1p8>;
> >>>>>> +        vddpmumx-supply = <&vreg_conn_1p8>;
> >>>>>> +        vddpmucx-supply = <&vreg_conn_pa>;
> >>>>>> +        vddrfa0p95-supply = <&vreg_s5a>;
> >>>>>> +        vddrfa1p3-supply = <&vreg_s6a>;
> >>>>>> +        vddrfa1p9-supply = <&vreg_l15a>;
> >>>>>> +        vddpcie1p3-supply = <&vreg_s6a>;
> >>>>>> +        vddpcie1p9-supply = <&vreg_l15a>;
> >>>>>> +
> >>>>>> +        regulators {
> >>>>>> +            vreg_pmu_rfa_cmn: ldo0 {
> >>>>>> +                regulator-name = "vreg_pmu_rfa_cmn";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_aon_0p59: ldo1 {
> >>>>>> +                regulator-name = "vreg_pmu_aon_0p59";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_wlcx_0p8: ldo2 {
> >>>>>> +                regulator-name = "vreg_pmu_wlcx_0p8";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_wlmx_0p85: ldo3 {
> >>>>>> +                regulator-name = "vreg_pmu_wlmx_0p85";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_btcmx_0p85: ldo4 {
> >>>>>> +                regulator-name = "vreg_pmu_btcmx_0p85";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_rfa_0p8: ldo5 {
> >>>>>> +                regulator-name = "vreg_pmu_rfa_0p8";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_rfa_1p2: ldo6 {
> >>>>>> +                regulator-name = "vreg_pmu_rfa_1p2";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_rfa_1p7: ldo7 {
> >>>>>> +                regulator-name = "vreg_pmu_rfa_1p7";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_pcie_0p9: ldo8 {
> >>>>>> +                regulator-name = "vreg_pmu_pcie_0p9";
> >>>>>> +            };
> >>>>>> +
> >>>>>> +            vreg_pmu_pcie_1p8: ldo9 {
> >>>>>> +                regulator-name = "vreg_pmu_pcie_1p8";
> >>>>>> +            };
> >>>>>> +        };
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    wifi_1p8v: regulator-wifi-1p8v {
> >>>>>> +        compatible = "regulator-fixed";
> >>>>>> +        regulator-name = "wifi_1p8v";
> >>>>>> +        regulator-min-microvolt = <1800000>;
> >>>>>> +        regulator-max-microvolt = <1800000>;
> >>>>>> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> >>>>> Please check this pin number
> >>>>>> +        enable-active-high;
> >>>>>> +        pinctrl-0 = <&wifi_reg_en_pins_state>;
> >>>>>> +        pinctrl-names = "default";
> >>>>>> +        regulator-boot-on;
> >>>>>> +        regulator-always-on;
> >>>>>> +    };
> >>>>>> +
> >>>>>> +    wifi_3p85v: regulator-wifi-3p85v {
> >>>>>> +        compatible = "regulator-fixed";
> >>>>>> +        regulator-name = "wifi_3p85v";
> >>>>>> +        regulator-min-microvolt = <3850000>;
> >>>>>> +        regulator-max-microvolt = <3850000>;
> >>>>>> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> >>>>> Please check this pin number
> >>>>>> +        enable-active-high;
> >>>>>> +        pinctrl-0 = <&wifi_reg_en_pins_state>;
> >>>>>> +        pinctrl-names = "default";
> >>>>>> +        regulator-boot-on;
> >>>>>> +        regulator-always-on;
> >>>>>> +    };
> >>>>>> +};
> >>>>>
> >>>>> Are these two node necessary?
> >>>>>
> >>>>
> >>>> On this board, GPIO91 is wired as a common enable for both WiFi 
> >>>> power rails: WiFi 1.8V and WiFi 3.85V.
> >>>> I currently modeled them as two regulator-fixed nodes because these 
> >>>> are two distinct rails.
> >>>> Would you prefer modelling a single regulator node that controls the 
> >>>> shared GPIO as below:
> >>>>
> >>>> wifi_en: regulator-wifi-en {
> >>>>     compatible = "regulator-fixed";
> >>>>     regulator-name = "wifi_en";
> >>>>     gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> >>>>     enable-active-high;
> >>>>     pinctrl-0 = <&wifi_reg_en_pins_state>;
> >>>>     pinctrl-names = "default";
> >>>>     regulator-boot-on;
> >>>>     regulator-always-on;
> >>>> };
> >>>
> >>> What is the voltage of this regulator? What does it represent? What
> >>> should be represented in the DT?
> >>>
> >>> BTW: what is powered on by those regulators? I don't see them being
> >>> wired to the PMU.
> >>>
> >>
> >> There are two separate TPS62130RGTR regulator ICs on the board:
> >> One provides 1.8V and Another provides 3.85V.
> >>
> >> Both regulators use the same enable signal (SOC_GPIO_91_S4A_1P8 - 
> >> GPIO91), which connects to their EN pins. 
> >> When GPIO91 goes high, both regulators switch on at the same 
> >> time.
> > 
> > And gpiolib-shared.c should be able to support that.
> > 
> >>
> >> I described them as two separate regulator-fixed nodes since they 
> >> are different chips with different voltages.
> > 
> > okay.
> > 
> >>
> >> As an alternative, I suggested representing them as a single node 
> >> (based on the review comment from Qian Zhang) if you only want to 
> >> show the shared GPIO enable control instead of the individual 
> >> voltage rails.
> > 
> > Why do you need an alternative?
> > 
> >>
> >> In AF68E module, 3.85V regulator powers VDD_PA_5G and 1.8V regulator
> >> powers VDD_PA_2G.
> > 
> > Do they power up the WCN6855 itself or some external PA present on the
> > module? In the former case, those regulators should be consumed by the
> > PMU, in the latter case, by the WiFi node. Anyway, they should not be
> > left as always-on / boot-on.
> > 
> 
> On this board, the GPIO-controlled regulators power the WCN6855 
> WiFi module itself (not an external PA). To model this correctly, 
> I updated the device tree like this:
>  
> a) I added a single upstream fixed regulator, wifi_vin, which 
>    represents the GPIO enable line (tlmm 91). This is the only node 
>    marked always-on, so the enable GPIO stays asserted.

Why? Is there such a regulator on the device? Why is it always-on? What
if the user wants to turn WiFi off? If you have consumers, why do you
need always-on at all?

> b) The downstream rails wifi_1p8v and wifi_3p85v are now defined as 
>    fixed regulators that depend on wifi_vin using vin-supply. They 
>    no longer control the GPIO directly.

Why? Does the shared GPIO mechanism fail here? If so, how?

> c) These two rails are then explicitly connected as supplies to the 
>    WiFi device node (wifi@0) using:
>      1. vddpaa-supply = <&wifi_3p85v>;
>      2. vddpab-supply = <&wifi_1p8v>;

Are those documented? Which pin is this regulator connected to?

> 
> With this change, the regulators are not left as generic always-on/
> boot-on supplies without a consumer. Instead, the WiFi device node 
> consumes the rails, which matches the real hardware wiring: the GPIO 
> enables power to the WCN6855 rails.
> 
> Please find the updated changes below - could you please confirm 
> whether this aligns with your expectations?
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> index 95ed335bcb08..f37159af2375 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> @@ -146,29 +146,41 @@ vreg_pmu_pcie_1p8: ldo9 {
>                 };
>         };
> 
> -       wifi_1p8v: regulator-wifi-1p8v {
> +       /* Downstream rails controlled by the same GPIO */
> +       wifi_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
> +
>                 regulator-name = "wifi_1p8v";
>                 regulator-min-microvolt = <1800000>;
>                 regulator-max-microvolt = <1800000>;
> -               gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> -               enable-active-high;
> -               pinctrl-0 = <&wifi_reg_en_pins_state>;
> -               pinctrl-names = "default";
> -               regulator-boot-on;
> -               regulator-always-on;
> +
> +               vin-supply = <&wifi_vin>;
>         };
> 
> -       wifi_3p85v: regulator-wifi-3p85v {
> +       wifi_3p85v: regulator-3p85v {
>                 compatible = "regulator-fixed";
> +
>                 regulator-name = "wifi_3p85v";
>                 regulator-min-microvolt = <3850000>;
>                 regulator-max-microvolt = <3850000>;
> -               gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +
> +               vin-supply = <&wifi_vin>;
> +       };
> +
> +       /* Upstream supply */
> +       wifi_vin: regulator-wifi-en {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "wifi_vin";
> +               regulator-min-microvolt = <3850000>;
> +               regulator-max-microvolt = <3850000>;
> +
>                 enable-active-high;
> +               gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +
>                 pinctrl-0 = <&wifi_reg_en_pins_state>;
>                 pinctrl-names = "default";
> -               regulator-boot-on;
> +
>                 regulator-always-on;
>         };
>  };
> @@ -413,6 +425,9 @@ wifi@0 {
>                 vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
>                 vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>                 vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +               vddpaa-supply = <&wifi_3p85v>;
> +               vddpab-supply = <&wifi_1p8v>;
> +
>         };
>  };
> 
> 
> 
> 

-- 
With best wishes
Dmitry

