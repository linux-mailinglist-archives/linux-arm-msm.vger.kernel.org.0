Return-Path: <linux-arm-msm+bounces-73666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB89B5931E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC7C3A93E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A322F8BCB;
	Tue, 16 Sep 2025 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bg+iBgdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E92F83AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017704; cv=none; b=EdUWupr3O2fWE/cQV0uDCnP+2dCBUz90bwF9erj3ZaHy8viVCBWdbRN0Cgfq2ztJl9DgFjDGd3mBP3Ne1h9Cd68L6jNf3A4ph0dYMiDypsR7EvpWCT76HbQBpiQ2ESDW5U5M/0PAuaHOezxpkBn4Nqx6JunZFt9EKdBlKtCSj9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017704; c=relaxed/simple;
	bh=+EHE6h36GP4hqZxcdvHcymNoZdBzFbv7bXJmCFPI3jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucFUepeTBElCENL2XrEmM7dxUKjfz3+Qw99LLOt3UfLSkrmF7KVxrJC7EDpO/1AiR/bCCpWYa0Tg6nBT5XIR0fx7PnHCjfuJYDXBZw2icFuRXnLoO0y+NhHaDujsUgGUw2SziabcQkhavGjsS/5mSZfDpS9ncBNF2LsxmBvvc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bg+iBgdv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3pnSM020449
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Fwmjx7MBs4brMM/94CNwnzV
	GXNy2F1qKzPpKtFQCHU=; b=Bg+iBgdvUIyXugJM+YPaO7kKCBNc/nZ7Wr3VCJyQ
	vS2vC6F0mzGDcyuE+PAYKRIGTnKiSJS/PSn5doxNyYfWz/2RFBxrWAEfyO3YAA8W
	zMHEzWbsWjMpeDFYjfzcjNG58IEnPHy2Lemd2zhYGcggzOoeHoexuBLFd5GujR7+
	4pVmagcySGqQ2qor2NE9OmvzUo+z6SN9eFptJykoNxDku/2qTRE5vfA9tjkDSYCd
	yPqYGtnuhlcrk/v887rRbMNksXY71LYgnWFd+wzLca0jgdA4D8H2O1HcUkS0Rh9s
	iKPqFKfch+MRYOYiyyKjlZTS8xtFctML2ArXIv1aVLzmXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chgdk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:15:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e91fb101so146391321cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017700; x=1758622500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Fwmjx7MBs4brMM/94CNwnzVGXNy2F1qKzPpKtFQCHU=;
        b=HXdGXdupMHsfEqIbPIXU9ETRv7ZitJm5UhNj1jVh31WsslAlFClXrs00F2qH5YM3GO
         VrrubL5vQmwu1gy8i2txKg2NsYE8WcnSkktc1lbZCLHmd2bX94kj4DAJ26l9Lcl4ox6g
         Y5Z4MPpiPtwgTatoKbawTE9P9gBCXzKBPVJA41J5izwOStizshBSNyzUN4zhqnRqfxos
         CH3wqWWahD4xdljBqAx/b3sBZbcQT4PWHCfUVNJ0L+Fcum1kUjzsnrbaYVPAPs8Q/ZVs
         3ohIGhvXdLBwIrMjBsjg1ZfrEVquhtDyt1JeA3/3nYqOa/7AcPeRnDNWAio+siyiNw3g
         CIWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4TuxZRKkBHHMG+6z4D5kO6LwroFEMXL2TuH4DessFyjQcEFMH0lHaGJxMkDDcuU7ogBugcUmFVTP9j2KW@vger.kernel.org
X-Gm-Message-State: AOJu0YzbG25XKGyFs3vFZ/F5xLK4DwbcABU8apbjzWWOdzVu2kVdg/Oo
	MF/9cV5p4s0wGIjoeaWyMSaozP4H6w7eaKUPwLLdi7IvfzUa1LkXEMfoRBz2txBXVDIhI3epZEJ
	Lld3onqtrgdaEx3/H4dyzSQzwQ7gt9SFmbGMn0inYOYcHtb4Ph+Se6Y3PyuvjIpMa4abE
X-Gm-Gg: ASbGncs2AUk7Sbtl1CwYsLyIPUM70DxV2wKAOFgaotwRty2XlSHevirSx5E2HxPC4VO
	9MoAa+sw6Wk8MteatxgeUXA1iKaNw3s0Ap/wjfuBxUWAI2uR8hkMJ9iyuc7ApEmVVxM1jyOrkay
	Reba9GvpsgQDmUxjVtShv7NkVlWZAtmb9OZtVGmVrJk0dGNwrIlq2OLydExYtHuQzFrC/qSKZo3
	t/9AZRX8qh2CSmpA8AfQvHOn2pxkqTvhXCObepa5Z+d/Bv2ZZFMKGyVrHveVSYlmiASVj1YlMg5
	lCy8amE/Ypt+XIQJXB50nBE5hP/MfPWoLCIzn/JE6C1776ZDHb8DdzcllQaBzqnU4OKDcvtbsJA
	5B73jinubutZ4f1NyyPIFr7SiwgnxJ6OA21aTkS5mEK5946LyrEgf
X-Received: by 2002:a05:6214:19c6:b0:722:1db2:f8df with SMTP id 6a1803df08f44-767c5436ffcmr240450366d6.67.1758017700340;
        Tue, 16 Sep 2025 03:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuV0hRyMwLwqzjzHvISeECe7iq+Q18PhhLX7wE1emTPMhlHDwWguYFsLl5+dlfARKvcHfdXw==
X-Received: by 2002:a05:6214:19c6:b0:722:1db2:f8df with SMTP id 6a1803df08f44-767c5436ffcmr240450106d6.67.1758017699863;
        Tue, 16 Sep 2025 03:14:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1c6cabedsm34708191fa.69.2025.09.16.03.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:14:59 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:14:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yingying Tang <quic_yintang@quicinc.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <jimz3qnjrcvemvgrqpwxq4zmywfo6psplsg4jefkvvpiwlffek@fwn3juynr4zx>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-4-38ed7f2015f7@oss.qualcomm.com>
 <aMPhEm8PuhEofHP7@linaro.org>
 <317ffa87-060c-4f1b-a6bf-61bb27367477@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <317ffa87-060c-4f1b-a6bf-61bb27367477@quicinc.com>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c938a5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=J5uJnYprzHOJOAIlhSUA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vPv-AeeZxn3tRUKP5aQ7kbOsQkMQO6CO
X-Proofpoint-GUID: vPv-AeeZxn3tRUKP5aQ7kbOsQkMQO6CO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX7IkAmvLQD6wb
 PI87xx9VnI1Asu+jWnPetMpdRUGtKqmGorcEBc7WJgnfnBWR2hZ2jqCwkCmWL+rxQDrGjjVFmqW
 q0p8zQyz2EM5zgnFYbB3DnDE5xGKfe0T80JLPEG63h9juYJANMB87qw4w0run7ZYUmLr8Eucp4I
 HJFah0dQoE+etbmWcy8QTljvJwTROI7X9StmxLxx6zqDqUIrVpedE2PhZ26oO/4cpEko5q+CG1u
 hlynrKjKn0/TG7HLrf8Mk2/0895gNPf1bbucvqADbTV4a54WZ1pXB/Wx6CrCC1ZrCVpDiYsxM7K
 k2QN6fF/87KA/YkhD6NZVzQyzrO9HUL1rp0iAkLdLAgzrwOQBs7n8L7o2+34yQjMDpbUUBdg3oR
 6IYNQ8WP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On Tue, Sep 16, 2025 at 09:42:26AM +0800, Yingying Tang wrote:
> 
> 
> On 9/12/2025 5:00 PM, Stephan Gerhold wrote:
> > On Wed, Sep 10, 2025 at 05:02:12PM +0800, Yijie Yang wrote:
> >> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> >> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> >> embedded system capable of booting to UART.
> >>
> >> Make the following peripherals on the carrier board enabled:
> >> - UART
> >> - On-board regulators
> >> - USB Type-C mux
> >> - Pinctrl
> >> - Embedded USB (EUSB) repeaters
> >> - NVMe
> >> - pmic-glink
> >> - USB DisplayPorts
> >> - Bluetooth
> >> - WLAN
> >> - Audio
> >>
> >> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
> >> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
> >> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
> >> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
> > 
> > This looks like you should have Co-developed-by: tags together with
> > their Signed-off-by: tags.
> > 
> >>
> >> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
> >>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1221 ++++++++++++++++++++++++++++
> >>  2 files changed, 1222 insertions(+)
> >>
> >> +
> >> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> >> +		compatible = "regulator-fixed";
> >> +
> >> +		regulator-name = "VREG_WCN_3P3";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +
> >> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +
> >> +		pinctrl-0 = <&wcn_sw_en>;
> >> +		pinctrl-names = "default";
> >> +
> > 
> > regulator-boot-on?
> 
> It shoulde be regulator-always-on

Why it's not boot-on and always-on?

> > 
> >> +		regulator-always-on;
> >> +	};
> >> +
> 

-- 
With best wishes
Dmitry

