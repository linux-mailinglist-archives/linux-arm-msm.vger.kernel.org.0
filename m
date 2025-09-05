Return-Path: <linux-arm-msm+bounces-72291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC5B458CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A2E3B5FAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3262E2EDD76;
	Fri,  5 Sep 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHTn0O4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE47350857
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757078684; cv=none; b=lUQRLJghEBJdiqkWfJnE5I9SU/Dk/RGWbSeKY2docEWKZPoVuy9oL99UcGyfZUqPJaGyzhYP8pOuH1uihxL2mJxdGaz+ppzw4MEmxuwgvn13LqqYzpvr2MwF56uZwV70ow9UE5ZvOGZQaH+M3+5OlPN4v3X91Jyv+aOVEfnzKew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757078684; c=relaxed/simple;
	bh=47V1pWT30/JAy9Msd5PdOFGYfzNex1CvOxWZoRPIq0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7LDUO02HqJYjulb43uCPTGz01hRSqtzV7PCTD4N3dp7UHc+m966lWF6MbD5wa6pTkKMiEQs7m0xDAOnpsmF77vMbtvTRt4NsKn/ycvz3lR7QfYQuOSPrMnzIwZ8knGlKIjOpwjGE48DaNistZ2nqNypUB0SgvB1vDxk6hHegYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHTn0O4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58554bpJ018505
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RttbkaeRD6xilyn46DClTRGu1NipwCW1nrCCMWrHQIM=; b=MHTn0O4S7Gy3dMp2
	koQg+xshH1SQPVBHB5e2F1UaGDM3B0BNHStVPQfc40YfWwU08RMD4J4yWOS19BYO
	0aGdrsVnKgH5CPHdZOgrHv2zt4OwZc/IfMxcbaYs9+tgWMpV9L2LctpevJV8/tiB
	SIWH8509GHw04YDwiIBeVpMoNpePUBiOWZa4MqgjXDzYgvhqFJsD9tLWRcWgGD3E
	DXL092Uy7nipZTbgfuu6UL9D0AtFZceB68ghGj4Oi1/eZqe8LcgJmZkyceBwlrSX
	YoiCJgi+f3bADusrMvz+W5C31B1E7wSIYZhVjvcw1R5eTZAoZxK/SOV9KmM7jbw8
	P2VWYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebuu4bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:24:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8063443ef8cso720177185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078681; x=1757683481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RttbkaeRD6xilyn46DClTRGu1NipwCW1nrCCMWrHQIM=;
        b=OcaC7RzH6cg5yrxPcP2y13XSMpNIZUNKZVWULJpOGrFesoILUMfKYX0eUzpPRUMuEC
         O/TEsWikCl1zG+tk7Nes1g1MMoS1S9Jv9VpUG/u2RiJTZWFabF2egHMBlHGOB7GggNMu
         p7DMsDPFJoRISEjoQycY7iKIt03txD2Y4jJ0nF1HxXMLuJ+6X3C9Yn/CIzZD3CAgEelX
         BX++4JxkAe/HO0NpR1iyy72TeKF4tDOFD2gc6nN4cc+tGL19S20iAlWyJ0M5ZfZBPVOg
         dzLkr091N0Vq6UCuePD97zDTbRtqJt/GbLWEeOKYMWO+dDPdspYfNXQ7L09uJyCLruj+
         wheQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvz3DK9JG8sM918N9YMesMdKxpD6IPPQgTy9t3J3mVuwHSMu4Z6KZdoPb/TDWY6WOVSvAdCNu6Y99WOieM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4UXYPnUhvnXll8vMDgVt8H6hMVo5bu4teOgMI+VgSDqdAukTr
	aQrSwJZYA9s17QHnfoWAysoBiQkQX2e2lu8xMEShIe2ynhrviRENeKFXaU1QQoD+pKyln2OW9f4
	g8SRCjIvIAO35TRNX8LEBMWt9ks6mL7DEPnqCBcEtygjWLdZviXWS+6pp4NR89c26hcYl8mIROr
	A46GgGJzy8f+mh27YLEvBLPTiuSNPfh6aPVD1Lh9Ug2uk=
X-Gm-Gg: ASbGnctbaQT9VjhGyDbOe6Aw/sjrlBYTFLzHlMhI3XdT7qaH/tpKDxpDdpfMSqWv5v3
	+M7rIGpPiOc/X9PydnE1tuiihIbuppc6/t36MAXwBC0qb3QLtYacs4SpPHPtRZ1CZDZ3bUZ78q1
	tY8Nq5taHgm+AmTPKEhjD5qw==
X-Received: by 2002:a05:620a:4044:b0:807:87a9:89a8 with SMTP id af79cd13be357-80787a98b83mr1630348385a.28.1757078680462;
        Fri, 05 Sep 2025 06:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwKlqHy3ni2v6MLagolHNSXn+wi+jzOJYgpcpKQrunqd0lwMvR3Jz4UeTH+V50XEmq/HR3JKYmu8PmY4cD2hQ=
X-Received: by 2002:a05:620a:4044:b0:807:87a9:89a8 with SMTP id
 af79cd13be357-80787a98b83mr1630321185a.28.1757078676776; Fri, 05 Sep 2025
 06:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
 <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com> <ao3nb3xkeutqetqx7amlfbqtvhuyojfvzm4prsze2mhgb2rpnc@s2bsigcrlxzo>
In-Reply-To: <ao3nb3xkeutqetqx7amlfbqtvhuyojfvzm4prsze2mhgb2rpnc@s2bsigcrlxzo>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 18:54:25 +0530
X-Gm-Features: Ac12FXwf69CKgwq0J5qfcDqJVVXGxU5AIZsk8pJGBMQ2vq1_qm6B_7wK263cVew
Message-ID: <CAHz4bYs7Jy_NXcn6bOCHfxG=YoO+5vcAMUYEcptkJK+Cx+pA9Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Monaco EVK initial board support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Vikash Garodia <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 85hbQIlR9mH2tOuAok97PMDbWAgm0tsq
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68bae499 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=uv0PlPAYtInrpSTTwawA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX0SG48kdkgFmv
 Uve7uGa6iEYqQco+mYZNS4vMnGX98KtgLjVda+QHR7osybnaVPwuca3xMEKJupbMqS3LSW4PQUD
 PVyTZpMIHloXc/sHcbtIuBEPptMsYNJFSFSPl/GPdijDBcldrse5fER31/X4FvJZ/GV5yieI/r3
 pgbQXVD8eZTTNv6IDlIqJnvwqOC+FiSh4PWSEPibZWnenh6+JQGX9e0PApZDKEUbE+B8NzEdyjF
 r1xo2Gzq3SoB06t2lPVPfCIltwgWV+eyQeA+zW1ij+pzwsoHtMsZzWWxtZTVoXS5cmYtE2PyRqZ
 jORJ5ybtfqNtM5w8Vm3Gzp/tUIWTbODNzcPBjLDBCj1mYBQ+vpPzsPLkS2hALEjZ6+M/EwAJjKQ
 J1CkscWs
X-Proofpoint-ORIG-GUID: 85hbQIlR9mH2tOuAok97PMDbWAgm0tsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163

On Wed, Aug 27, 2025 at 7:13=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Aug 26, 2025 at 11:45:06PM +0530, Umang Chheda wrote:
> > Add initial device tree support for Monaco EVK board, based on
> > Qualcomm's QCS8300 SoC.
> >
> > Monaco EVK is single board supporting these peripherals:
> >   - Storage: 1 =D0=B2 128 GB UFS, micro-SD card, EEPROMs for MACs,
> >     and eMMC.
> >   - Audio/Video, Camera & Display ports.
> >   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
> >   - PCIe ports.
> >   - USB & UART ports.
> >
> > On top of Monaco EVK board additional mezzanine boards can be
> > stacked in future.
> >
> > Add support for the following components :
> >   - GPI (Generic Peripheral Interface) and QUPv3-0/1
> >     controllers to facilitate DMA and peripheral communication.
> >   - TCA9534 I/O expander via I2C to provide 8 additional GPIO
> >     lines for extended I/O functionality.
> >   - USB1 controller in device mode to support USB peripheral
> >     operations.
>
> Is it actually peripheral-only?
Hi Dmitry,

HW supports OTG mode as well on the USB0 port but for enabling OTG
mode , it requires two things, one is role switch support and another
is VBUS supply on/off support. Both will be taken care of by Type-C
manager HD3SS3220. Currently, VBUS enablement support is not present
in the driver. Once that support is added, I will add OTG support for
the USB0 port, until then we would like to keep it in peripheral mode
for ADB support.

This is the same change which was discussed for lemans-evk [1] applies
for monaco-evk as well.

[1] https://lore.kernel.org/linux-arm-msm/d6816cc6-c69e-4746-932e-8b030ca17=
245@oss.qualcomm.com/

Regards,
Swati
>
> >   - Remoteproc subsystems for supported DSPs such as Audio DSP,
> >     Compute DSP and Generic DSP, along with their corresponding
> >     firmware.
> >   - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
> >     and other consumers.
> >   - QCA8081 2.5G Ethernet PHY on port-0 and expose the
> >     Ethernet MAC address via nvmem for network configuration.
> >     It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
> >   - Support for the Iris video decoder, including the required
> >     firmware, to enable video decoding capabilities.
>
> I don't see firmware being declared here.
>
> >
> > Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > Co-developed-by: Arun Khannna <quic_arkhanna@quicinc.com>
> > Signed-off-by: Arun Khannna <quic_arkhanna@quicinc.com>
> > Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Co-developed-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile       |   1 +
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 463 ++++++++++++++++++++++++
> >  2 files changed, 464 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts
> >
>
> --
> With best wishes
> Dmitry

