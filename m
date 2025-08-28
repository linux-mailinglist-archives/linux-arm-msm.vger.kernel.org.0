Return-Path: <linux-arm-msm+bounces-71120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA8B39D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 312744E24C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC9626AAA3;
	Thu, 28 Aug 2025 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEqh6r5k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704BA30E844
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383820; cv=none; b=byr5Q/p5lJ2LQmHKnroiY/ApWXfifVGLo2NWWmXhwFs/fwpOsIHpN0s1M4zOx6Fnupiod29Fhbk7GeNpVzgHYPicQTelFW5jijOslt3dptRYm5dYqXawMTP0rFU9xCGi31YXPm0CTNq9xl8rdPkJvGmgIdcy3Ir+M4WO8tBpElk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383820; c=relaxed/simple;
	bh=5rst5fLTWaEIat1RpzokmV/+HPWeZg8AWqo4Gx9BXE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpRi5X+CW+omaTT/z0wrt3W2SFmv9wX4sGHUMgZj1UsbtEvc3N1B13uxpSlob92LxHpugl9cFqEs9NNEjpJ1HdP/3ZHTyamxYQvon7oPgISn4vVbwcV/UQmjq11eIgStYIHKCB24ErCptnSkSrAjn4rYlu+wJ6/GJSVUaiyH9Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEqh6r5k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5i8CR030526
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EZu3KAVGHFsCh5fcuvT4HNuU
	yEv0CABTxKzQNvPe8HE=; b=lEqh6r5kDbGIOqdjj/UUeO1VQnWeHw6ZOHqUXe8S
	xdjs+71XDJ9AeneQUq0QqbEJKTLgms/37VK433Wo0+s213skyBBJ4PwSscu1dx1M
	C0FWdSIq/oftTYPJ/Zkz33+B/vWd2PCmxurYCE2IRVRq//CLL8Kem5AYPudQeLcp
	tMMdpogw5W2kzSb6UKOFNx291VMf2JLdVhFGgxO2wOgxToDbIwIyeb43cfw6Detg
	4F6Fic7QqlAEshq+5nGutOLD4AoH9aqH4OWKduT4c5B+EY3mI7FB6LTHF5bOU7CU
	ML3/8Gr+dxcQheO2M6W1+4+wZjoHkCr45bOeOPtJ2ltOWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up00rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:23:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-248ae61487aso10663275ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383809; x=1756988609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZu3KAVGHFsCh5fcuvT4HNuUyEv0CABTxKzQNvPe8HE=;
        b=pecLJzdu7SyjtMNCv6fOThANQ+sgCnANpCxicnZM9PBYOqQJlXakR3IRa3p18fLG/1
         xOam0I59Sk59VMbAxjfGCUhrAocBCsEnreHMDbhOowdZf5NEEpCI2ur2WhKC3K3eNTBJ
         oBoTi+Mqa6/V64rmH+ExU07Nw+aFy7spiu9gSiiAyijoMf8GyygT2VzWQYMbtiwX5J9E
         2/BXaYIR7MLHV1HwJukLndz8Cg6B148qyEnwKUIFQdyvR3SsrHT7kqgio7TgwEShEyTd
         y9fq47+QC12lGUgGvep2iP6HRRMaD0ek7pjDfRnvigNFojaDxaAd4E9oHuYrKiQelvx4
         gTfw==
X-Forwarded-Encrypted: i=1; AJvYcCV7R0wvWFHGdW6l5jaMByuYovispohvRO7E3sXbXPQFNVOr6Noqf+4Vf5GLxLqfVamxWfl2d+FTMzsNSOYS@vger.kernel.org
X-Gm-Message-State: AOJu0YwQQ6n36CswyAk+9TcPHbmGA8TvkSRjJApRa+Nd5/2TK6CnnC0q
	zZpptVYY3agxs16ITxe0ohHh8Yn0JXMwD5IkJJnGobCkJmAdEGmicaA/+TO4SDitfzhLXRNegw2
	Rrg2VDT4AhmNV/E+lZ4xquwxt/fZmrphxKN5Gni298dNDHUrmbpkiqoGEO2NR/1ZJ6sfH
X-Gm-Gg: ASbGncskA5nGOl55hBjhtPSJcuz+r+JyPN60lGEhABfYAxtuzgk3Z5D2ZkrU7Slpz1J
	YgAjENHRej3Gv4RQJNcfPWRMn8A7ZvFxXzCgSGqy1aKCkJvpmnGYM96CK7WXO7gzdjO4hNxjCAm
	OvPhFs6sLz92ONkAu38Owf7Fdrv3woZqpuwg0Y9/Dc41tUrsG/yWXx1dqzzqHUDNaAp74sqAQqE
	EAjRlL/kbrBJ4hfuXcmYRz3IhWsVZREGQZllNces+G3y7BqLKyT1qCkAqVIifeZrMevPFYPnPpa
	STdXDeJvcr6km/JJwpLhaPFpnMuryVswd9yTGCmKafdvndmFgPN8LAW7sUAwI/OKBaQ+
X-Received: by 2002:a17:902:ef0f:b0:244:214f:13b7 with SMTP id d9443c01a7336-2462efb04c7mr311698185ad.53.1756383808742;
        Thu, 28 Aug 2025 05:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlXTQuslcdRCvIsbREyFEnJ6/4MjqDDqTAmmAr9yqeBhBNxc3DV53rEdm/A47zsJg9ygUrMg==
X-Received: by 2002:a17:902:ef0f:b0:244:214f:13b7 with SMTP id d9443c01a7336-2462efb04c7mr311697655ad.53.1756383808215;
        Thu, 28 Aug 2025 05:23:28 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466885ed72sm149774835ad.92.2025.08.28.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:23:27 -0700 (PDT)
Date: Thu, 28 Aug 2025 17:53:20 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Vishal Kumar Pal <quic_vispal@quicinc.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk: Extend peripheral and
 subsystem support
Message-ID: <aLBKOH2nSkiNppwQ@hu-wasimn-hyd.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
 <uvdrqzpqc5vki6sh5f7phktuk47egtmfuw3jjvoakrbyhqxwvt@obao75mbrtti>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uvdrqzpqc5vki6sh5f7phktuk47egtmfuw3jjvoakrbyhqxwvt@obao75mbrtti>
X-Proofpoint-GUID: IoAA7IyxzmccRvuiu5xCBjBSdQOXbT3I
X-Proofpoint-ORIG-GUID: IoAA7IyxzmccRvuiu5xCBjBSdQOXbT3I
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b04a4a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=cJrhKfuPXHnoPuS3F2EA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX645EHSC3wMdb
 jQUuOaoRbm50ehSn8PtgVC0FNxc1bsya5Tkb4GMNL7gsVda3XRKRhi1yrdeIYLWChWjJ+kKAG3H
 li60LYwnt8I/E00r2MhCnAy8BOyn3T2ujTrk5XAFeUSeA9XLvg82g4Tw/OV/afXj5I02w4SCU0j
 7ZkStTnCOrDQa/z1EYDNIrDUzgBFetI743YA1XB5YczKz0VtHaXBZZ1h1/6rF1fXnCsRkow2CfO
 KVjofutz0MQgp77VoR/CjxEqPoqRbrW98o+bDPJEV+IjPRI1OhgAetwioo6OOLnDlMr9kfaHpOd
 bZJVqDylmMd8diHlnmEJuDwqWlQDGHIossfFGbBs/nZy9OfiM8hVJxzsVegi1iH6iJkYlfRjilM
 uRsZVwgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

On Wed, Aug 27, 2025 at 06:06:04PM -0500, Bjorn Andersson wrote:
> On Tue, Aug 26, 2025 at 11:51:02PM +0530, Wasim Nazir wrote:
> > Enhance the Qualcomm Lemans EVK board file to support essential
> > peripherals and improve overall hardware capabilities, as
> > outlined below:
> >   - Enable GPI (Generic Peripheral Interface) DMA-0/1/2 and QUPv3-0/2
> >     controllers to facilitate DMA and peripheral communication.
> >   - Add support for PCIe-0/1, including required regulators and PHYs,
> >     to enable high-speed external device connectivity.
> >   - Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> >     GPIO lines for extended I/O functionality.
> >   - Enable the USB0 controller in device mode to support USB peripheral
> >     operations.
> >   - Activate remoteproc subsystems for supported DSPs such as Audio DSP,
> >     Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> >     firmware.
> >   - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
> >     and other consumers.
> >   - Enable the QCA8081 2.5G Ethernet PHY on port-0 and expose the
> >     Ethernet MAC address via nvmem for network configuration.
> >     It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
> >   - Add support for the Iris video decoder, including the required
> >     firmware, to enable video decoding capabilities.
> >   - Enable SD-card slot on SDHC.
> 
> I know I asked for you to lump things together in the initial
> contribution to provide as much features as possible in that initial
> patch, but now that is in place and this patch really is a bunch of
> independent logical changes and this commit message reads much more like
> a cover letter...
> 
> > 
> > Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > Co-developed-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Co-developed-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > Signed-off-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> 
> And I don't think you all wrote this patch, you probably all wrote
> individual pieces and then one of you created the actual patch?
> 
> The important part is that we don't want 9 different patch series
> floating around with unmet dependencies and relying on me to try to
> stitch them together.
> 
> But if you could do what you did for patch 2, 4, and 5 for logical
> chunks of this change, that would be excellent (i.e. you collect the
> individual patches, you add your signed-off-by, and you send them all
> together).

Sure Bjorn, I will split it in next version of the same series.


-- 
Regards,
Wasim

