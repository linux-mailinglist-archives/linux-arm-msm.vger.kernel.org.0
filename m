Return-Path: <linux-arm-msm+bounces-70966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC23B3774A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 03:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C456361321
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1199C4438B;
	Wed, 27 Aug 2025 01:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksvCaqyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E41E35966
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756258984; cv=none; b=E6eGBEULrlIOXHki8pO4WiV/48FIz0uaNU95kmZ7eDZ2OMUz0P+BypUqayCtm0gzpX7R6di8y4+bYyxwN8VZjB/qVn6hCWXN3xaeBTcaNKnxYUdW7QaFWnbOVpB4BX8OPVEO6I5+xi4dw6uyqO6rYqr43Qh7DwlZw19YrNn1vz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756258984; c=relaxed/simple;
	bh=fWl6m5YOGo9P1YvZe/p/luMCITAlgRGqAaX4leCQoeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMgz4FgtSV1Om/BdrQb5p1Vvbq055ISEAO0a1HKtbzjb1wJ8SrkADSBWDZJNjzHfu6RuYK91YFT/u1TgJyBVOvGTZRWbzncfTI/FjA3wozfJ7OJkc6rvbL0RfD9F+HxhrdNe2QmHzGAH2L0XmFUTsKgrtHs9lXLV+sjSEZSd0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksvCaqyd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QKit06025970
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsUha+m8L5B5kENE7iORfAGBbDtAXg/UhJjqwsAdzRg=; b=ksvCaqydkUxVEl9R
	JZM26AiWOJBUnbTE+/ItNgRLfgSC8QuYkyJHY7iQhTsxOTqkv455JmCbqwZHpEnJ
	yM/9Oc3KqphSb8rfL6jHzZ/bPmD5P7tgBwOzj27As7tCWmxzqwbo+1YSrctLFz6U
	ab1c8hG77sJk8PBmas4GhEBenT++WiSpVjVklFqXPLcMf69dGSPOYO5B0sx6Uw4n
	k8ozGrcKCcNlx5dMksn4WVJy13fFARjnK8SdN27NuUxYo6Vj+q9oOrE1OxhAIdVe
	N/SRQaFIXdWaJtwWvczr98a5JRA/0EE2QFpVPPfQ4AbViB+gXDXw//PD6eNXWBgO
	B8wzDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unttju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:43:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b295536c25so114187381cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756258981; x=1756863781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsUha+m8L5B5kENE7iORfAGBbDtAXg/UhJjqwsAdzRg=;
        b=i64yl/gpQD82kd/ykNQzzAYRP6IGiYH97whPG18B5Fp5YD7ND7b8Q8ceOEpuFWJtIS
         A24JwXhW5m2iOR40wuVlXdxVY3/SWrua1/YNFPHaX23jyiTgRF4SPPcn5xcurQpycgEr
         lQsMCKBMQCsQts9CxcLcsOOvMH6EmSxFq1U9TAqc//aVexQYSSlbuF7ue3Uh3DKCXsp8
         X6fNiw1vGbIcFf8S+RacVKWFB8ECAW0FbdEQo4lv4y67vzFEPjAhg2ACtgbZT03hIMZk
         A8PdWOvToH28WrqG3fgxSSy6VDIrXcW8ZozKDj0uGJX9EzoZVp6Jk1O0PAhtgKUTIzf/
         0rKw==
X-Forwarded-Encrypted: i=1; AJvYcCV6MVrEzZZis0pO1iKmTx9HS7Tav4DKc+QWbNVaigJA9vYxvvBXDQ6+9t3xe5wdfc9xP+Mbfd8eDXCf3oA8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5GXK4VsAn9Ir76vpV+vBa/6HbTMVNfz3FbJUoXv01TqYg9Uus
	ExSVHVqUe1imGJGERKcdeUYgVfpxTPD+R0bGZkQD7sdDWTSNJfXJT8x6FKFNMWeyfQM/fH+vzyz
	5ESqnQrlWI1kKyQxw7t0AQfcDPoDlVMQmH0PSkw8bWeA+S2gcCzHZ5yTDalwDflwWXW+2
X-Gm-Gg: ASbGnctbQ2MH1pR7XUE8Mr73zBIdRPjBvCrgWkV8gjRo4YJ+C/5atx4nQKg5PQT/zop
	lIJXwVy25jyTTVv9fx0ZMElIxQX07w7eTYjoBsSwErrzAuJxE7Oy53FzWQGCgmJAnu1eThN1C1y
	RhRCVadL2KFm+Dy3NaYHPY9+K/2a/eIwoxXkH9T9jgA6swzi9gLsd+UmWLmsEy6vwkwIoexHwrP
	l/F32loohfNQKo5dIZQyg3wwPeLSAU2c0TAyNeFMbtKvHlHKBP01doKW93nVbt9pKnrrwpItfFb
	URzdhfZUHCkxv9xxf3h1hWVRp3lrJnAN+/jrBV0QJwKc3dZsgQCmRb0eMWqVLzWu7rTXOML740H
	WqSGQctacJf2t9w4A6TLuagcyMJVJ+synMsix2xsD9xi4m4YA2ieu
X-Received: by 2002:ac8:7f52:0:b0:4b1:22bd:64b3 with SMTP id d75a77b69052e-4b2aaa62db9mr184993051cf.34.1756258981387;
        Tue, 26 Aug 2025 18:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoZmqg4v/9oFiKfXeAJrF5O6/DJbro6fcPhk2DgsgVHkIwXmllyNxHiBgQHmToCR5oCCvzaw==
X-Received: by 2002:ac8:7f52:0:b0:4b1:22bd:64b3 with SMTP id d75a77b69052e-4b2aaa62db9mr184992841cf.34.1756258980864;
        Tue, 26 Aug 2025 18:43:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bc0asm2574774e87.70.2025.08.26.18.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:43:00 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:42:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Arun Khannna <quic_arkhanna@quicinc.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Monaco EVK initial board
 support
Message-ID: <ao3nb3xkeutqetqx7amlfbqtvhuyojfvzm4prsze2mhgb2rpnc@s2bsigcrlxzo>
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
 <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com>
X-Proofpoint-GUID: cMPyg-07jsdfH9BhwII4Ma6Uwl0eNA43
X-Proofpoint-ORIG-GUID: cMPyg-07jsdfH9BhwII4Ma6Uwl0eNA43
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ae62a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=IVo3xAofRzk1BSpusREA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX3wRAz1Sspy4+
 WegNCFQ5wGiXdmHOk5RbthmgvCqP/sbKTm1sMy6eM7hl8kabkI8FeLPZ4W+Ee6bfHvpoAhMVcKz
 3zArJjSBvxY8v/KFxLyMXNm1L1VC0cWNlzUG/XSifgLqNxcMPdlZZ5o2OKb86nT2sTc95kMjEWt
 t9BYD7/vxFbnSVZKh90Fca4a50pKZyMPsOKApQF5tLDdTiUSuYRJrSPbwEMuehLd4kM6JF6Poj7
 gu7Letiigvgp5/c8qq8eqfgPvbF6enP5kGNkslX6j2CKgi6nXwWpvYcN1pVwToZdc/TcSOLo+Na
 sJKHF4ARNpmoWslkIaY4vv6dI4wTDioQz3QV2ZmeqQVjH0u2B3gbtzhELqbFjQI+yRA0FynGOtP
 8vtSkg+a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

On Tue, Aug 26, 2025 at 11:45:06PM +0530, Umang Chheda wrote:
> Add initial device tree support for Monaco EVK board, based on
> Qualcomm's QCS8300 SoC.
> 
> Monaco EVK is single board supporting these peripherals:
>   - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>     and eMMC.
>   - Audio/Video, Camera & Display ports.
>   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
>   - PCIe ports.
>   - USB & UART ports.
> 
> On top of Monaco EVK board additional mezzanine boards can be
> stacked in future.
> 
> Add support for the following components :
>   - GPI (Generic Peripheral Interface) and QUPv3-0/1
>     controllers to facilitate DMA and peripheral communication.
>   - TCA9534 I/O expander via I2C to provide 8 additional GPIO
>     lines for extended I/O functionality.
>   - USB1 controller in device mode to support USB peripheral
>     operations.

Is it actually peripheral-only?

>   - Remoteproc subsystems for supported DSPs such as Audio DSP,
>     Compute DSP and Generic DSP, along with their corresponding
>     firmware.
>   - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
>     and other consumers.
>   - QCA8081 2.5G Ethernet PHY on port-0 and expose the
>     Ethernet MAC address via nvmem for network configuration.
>     It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
>   - Support for the Iris video decoder, including the required
>     firmware, to enable video decoding capabilities.

I don't see firmware being declared here.

> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> Co-developed-by: Arun Khannna <quic_arkhanna@quicinc.com>
> Signed-off-by: Arun Khannna <quic_arkhanna@quicinc.com>
> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Co-developed-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 463 ++++++++++++++++++++++++
>  2 files changed, 464 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts
> 

-- 
With best wishes
Dmitry

