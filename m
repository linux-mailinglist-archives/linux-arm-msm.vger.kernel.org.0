Return-Path: <linux-arm-msm+bounces-70597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A174B33AB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F173A52F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 09:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE05E29D283;
	Mon, 25 Aug 2025 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWnzqxDi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797581F95C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113849; cv=none; b=HFO8KSw+cZO4ezyrdS/tZQruYh3I7rbIr2wfS9fMROuSN+bDJL/QZXFA84DS6/9PXd2KWobzzMKtAW7+w2iJnSK5JklOvNWztYiF1eCLd/pA0EgkRJnbU0UitomwRH7QvJM96qies28b81wKRC5JGYgsS+5w1nQVC6vgwT5dnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113849; c=relaxed/simple;
	bh=b2EDQMgIJW/BbvJCKvsn+1m1vJhpeJsz1lWiTiulmsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZimXbfXSDfRlW0Nhxq/Zl0/my+I9LgIcS9AuPBwhWnGoModPMpBrQzh0bHE2cIc+2e98nbUpYPLAeR2TH8AiDL7a67aDDz5xwykfzhSzqTNu5ZBn2hOF7ICUeqwQgLRae23267Rqr9NUWoasfqIMZoaMolAsqcneEi6CsXnv/e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWnzqxDi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Hg7W020705
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AT6FII3PRnGlX4a1qfX1+I0s
	GPeMrRjRAQ41zyHfCGM=; b=RWnzqxDiDyxxzeQAFtb+eDIoCyR8NHZ6VNb9sF8J
	jDadzd1bTuX2tLbaS4rysvu+kllLiBRG7QemuwKSVBYCEOrTkM6RtLP/seaV+qCo
	c3RnN/w9V9BkEVwUPH5GWd69n4Bl/nvjC6i01GQgqa22IvbrEhU6EHovW/kL2N5/
	A5n29nBjzZ3+nEPCTs5nqCdvffDt5nNvSCMq8UX/BN+yM/ThoJIlQ3agAAfrYiSO
	LkRaxAcGYymw6Ow9wcJrSqcnYVNQ3vvgNIGSGvYJBa3ngFbnun5DYRUDkoHD1E1A
	HT40jcUpwOUK00z4JvtB7ys53thHrefHPyMNSZZh7MSpSQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x84heb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:24:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70daf13cd03so29837206d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113846; x=1756718646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT6FII3PRnGlX4a1qfX1+I0sGPeMrRjRAQ41zyHfCGM=;
        b=NjT4cdwVaYDPntp/hiWIk4Is7fZwB5YTP4ICtzwBN+oiStHNmLDgwn+VhnbFmn6p9f
         K+SHmKgoOfLVe2k0rrFEJxNh/A/od79IlI4DIx2PQp1aLcXovJYcwowvxTm0W3rAxc6k
         t1LKjfwmJo1BBAoEsf+UV0VBjePgYA2QY2pbUtDyCprXRPJvS532xKQRFX4WeFVZey3g
         dSsS2A34nwDpoDTejiJTiiy8bgaPlFeJeaAezZFvcMoBx8Z/wyKpVxaZxK0O8H+BW1dK
         nLJGj+zjx4r2oaVHZVie3RHlJlZtLwCswdG5bYW05LVQI/FgfEbVLOfT3zuYdl94xJV6
         bsvw==
X-Forwarded-Encrypted: i=1; AJvYcCWrVxFlPSsJOEFrxeliALbeP3MmTPknplvaD15M6m2D/53g8Ja++1yBnr8cuEU3bL19DqZvd9xmM9DYg+rp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8rv0m7zDV5uzrw7eSQmYg9OLLbdvKr97nS91WPGo1Vzm8QSmr
	q7FjC3T25eQEx5ia3Lpfdl2DM0CrXJQtsH056MnLQZcZev7oNWCKnNEX5fOhwxGIyzTaRDSssxQ
	9rme0O2AeZYiCMplnpM9+UF08/oeoumQ6oaf9VF9uytAhAuThfUSmAhqw3O1nU7PZS0S0
X-Gm-Gg: ASbGnctat16pRCkUGOuYLWMLhd45Ls1NG1bg5kpfyLwHYX3Xa9vccToYIr2jzRxu9SB
	zBt0N8mCnol2axUhZNPZrkhhqa8TLdjMlg4GaIcu2j4dWwhTVSE17Djw6ssnqHuL6Kmftf8uS5j
	a4Td5kAaessY4slNzx4egTXxWonWP/KkaCudO2CoYaRcyrKp8QEq9OVc/ybWjNrUhbjTcGv4R99
	kmeIJlvS8weXuWQ2VMYqW8wXX0o8kPo5gJYTDz/k+VeGkV1Cx2TlmXJ70MsiCnUgzvDCCALoSJu
	6IF7Ps2/whURsGQMf8SnDx4cB/fvXn6PQ/a9Zq2vl89oh1cpSAPfJ64Ys8YhahjEkx9liP7EDBM
	DLKiU149FddfJtz/BatWxIdt7EeTSby+9QP5hcF8dAkflgVXfsQwB
X-Received: by 2002:ad4:5bc5:0:b0:70d:6de2:1b35 with SMTP id 6a1803df08f44-70d9723e568mr105994886d6.65.1756113846208;
        Mon, 25 Aug 2025 02:24:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9KdiFDmptPVEofCOhzPmh2gkvGoRl091r38GytacLaqu0DbZGgyFkNfMNserqEeK0yyOrKg==
X-Received: by 2002:ad4:5bc5:0:b0:70d:6de2:1b35 with SMTP id 6a1803df08f44-70d9723e568mr105994626d6.65.1756113845564;
        Mon, 25 Aug 2025 02:24:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c9a21fsm1548650e87.128.2025.08.25.02.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:24:04 -0700 (PDT)
Date: Mon, 25 Aug 2025 12:24:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Quill Qi <le.qi@oss.qualcomm.com>, Jie Zhang <quic_jiezh@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <qlyqobhy2wjwpp437qwyk3zs6gqp47sremvdud674ygjbeziag@motnuwsalpvj>
References: <20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com>
 <20250821-hamoa_initial-v6-3-72e4e01a55d0@oss.qualcomm.com>
 <jj3mvad27kdpfxo4p2c3jfpjq2icao6mltpx4uu3sretqgkfap@vpqgfwzl3sjs>
 <33ac5fef-f855-46f3-acd3-daa8fc34d918@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33ac5fef-f855-46f3-acd3-daa8fc34d918@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Qz6O4ZQWFKKYtxJVtYOBBYa_ZGRNJ4SX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX/o3UzHoyV5dA
 eV5VxSeArpZTUPxKwCzJn1N9nKylXi7/KmFJTD7RgATx2RguGnvFhhYQz11h7Qg0Sc/qVzJXK1e
 INOrll0XKNxMuoqu2yomrOZTiAHhw5DKJ07vXR+g0xgwk5GDddJ/nREnWjqQW8zMhMCXqDhUbBT
 gzIDHv9ZnKryPp6LgJdWUCyKeU3kCzwX+39F12xml0W4sKJn32i5nYc3h7A849kq/+gZMN9qjNu
 IFXzvnuW3+bBGQwhghTm57HjMsAnWbS5dAVDIPVCaC6Yo2p9pxG3fbzOHUbb4avE3WFcVzKUNTL
 1IqN5c5RioT1wYZBKbbZHepaPr/pWrnSJpoi6QHWq/vzFnUhewluY7bmKIVZ/Mc7/HwQIjs8P3U
 m+9wUPLT
X-Proofpoint-GUID: Qz6O4ZQWFKKYtxJVtYOBBYa_ZGRNJ4SX
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac2bb7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=PfjXB2Kww6_2cIryhmQA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

On Mon, Aug 25, 2025 at 10:47:22AM +0800, Yijie Yang wrote:
> 
> 
> On 2025-08-22 19:56, Dmitry Baryshkov wrote:
> > On Thu, Aug 21, 2025 at 04:20:24PM +0800, Yijie Yang wrote:
> > > The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> > > the Hamoa IoT SoM and a carrier board. Together, they form a complete
> > > embedded system capable of booting to UART.
> > > 
> > > This change enables the following peripherals on the carrier board:
> > > - UART
> > > - On-board regulators
> > > - USB Type-C mux
> > > - Pinctrl
> > > - Embedded USB (EUSB) repeaters
> > > - NVMe
> > > - pmic-glink
> > > - USB DisplayPorts
> > > - Bluetooth
> > > - Graphic
> > > - Audio
> > 
> > No WiFi?
> It's in patch 2/3.>

No, it's not. It has PCIe4, but not a WiFi (which makes sense since WiFI
is not present on the SoM).

> > > 
> > > Co-developed-by: Quill Qi <le.qi@oss.qualcomm.com> # Audio
> > > Signed-off-by: Quill Qi <le.qi@oss.qualcomm.com>
> > > Co-developed-by: Jie Zhang <quic_jiezh@quicinc.com> # Graphic
> > > Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> > > Co-developed-by: Shuai Zhang <quic_shuaz@quicinc.com> # Bluetooth
> > > Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> > > Co-developed-by: Yongxing Mou <quic_yongmou@quicinc.com> # USB DisplayPorts
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile          |    1 +
> > >   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
> > >   2 files changed, 1248 insertions(+)
> > > 

-- 
With best wishes
Dmitry

