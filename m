Return-Path: <linux-arm-msm+bounces-111548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /PbUMuoiJWpODwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 09:51:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAC64F09A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 09:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/GUTTev";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jqk8YQRY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111548-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111548-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8018300CCB1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 07:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D892E88BD;
	Sun,  7 Jun 2026 07:51:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55CD2ED846
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 07:51:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818663; cv=none; b=FQuEFnL+J7AFdSHLo4KqYkpvQH8ZkhAoDTk7SpCa3xt7FbbIq2oTCgGn5AWrIwvFtIbGXA5RpEoQLZiL/wmgG0td/AbT70dzYgrs8cwXzAJDhdW530jJrx8T5eZ/yxEfPUk0B9FKD5HWYRo1ofRO67bVSshxUZGLAH/iwIooWlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818663; c=relaxed/simple;
	bh=l3TWZ4OZ3V2jL7Kfjaqed1mPLebXCr7LdftihqcoIjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtOz/Z8q/iLo0iUmJCj1KsVQOetXydyzZ0FiP4xCbv30W0KSpx2wGT+XsjLfQqGrZKMH7dG0hPSLbmYHL76cj34u4mI4GDCAecCKQTRyU+aQq1Agu+l5ZHnch7a6ozizmfF8B4HhyjREAapqEe3WvnhuWV4moUqSxXa40kbaUPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/GUTTev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jqk8YQRY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65778POI3720007
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 07:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iE7PRNG1OJYshR7GaCLN5SGU
	I7asLqXbDQM8lMANVPc=; b=k/GUTTevzM9pg8za5zo6EUTbBp01Ylt6nW/8OjnW
	pOOBPfBpKGC/1h2ogHMxL56V9NJdk5YOKrgbUWkEqw8qAe/lyLrRg6b6cMSOQ64l
	qhBV5JMwg4zpD5bEe9otcV1k1kZz2JzjnVMqQJHmQyUqL1UhnY81qQVp35r78yCp
	O3Sfm08RvhXZBzuHDfyTjuIYPTA76T2C4Aj1Y89Pr5CBfGmi6bxmUyZM3hN9MWXK
	4lXdOLgIiwbUUJcv216xWFokhnvOJt8Puix5UFsgYff/pPvxfEk94Dlwvg6IoP2c
	Uacz526f4HgEZQAx3uYLbmzPhWxSOvk7oyUuFjZogLVQLg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1b6hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 07:51:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b07e2003so3264068241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780818659; x=1781423459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iE7PRNG1OJYshR7GaCLN5SGUI7asLqXbDQM8lMANVPc=;
        b=Jqk8YQRYxXboRIk0zpAu8D0YBjojDQQK5fJAP0lMRdImgWj3uAJIw7VgGcOg1ZZldO
         ELu5kE5O8GYa8U6IY0wKWBzmV0IqM6iRSILLmU4HUy9biZzx0FizaBYIMxxNJ3WI0KqW
         R2FTq05Rm3XJ1s27GUodAHO/8NsVicyG3wtgnO4LUjMUPB7mp0yn2jwtPCdWow9BCnn8
         PhDxL79dWD04QkSE+FZrFoe3ASNhr1FJZJYP4sd3yhhsg7J0Rk+DBWpJKylLfT7VQdgX
         VJBtQRCnUO/RoTT0RCYqccrJphE1t9AEFePvhgWOorBVdoWHv/nrGoVfTG06TegjQoBy
         A9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780818659; x=1781423459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iE7PRNG1OJYshR7GaCLN5SGUI7asLqXbDQM8lMANVPc=;
        b=ittHTYZOlrjDCNCIGEm/b/xLacFt2EOY/D14xbNOWB13KFdbUXJVSMHt1woHh+6akT
         waDm+6JbYjsYf4YUkvW/VQTdWY9W6+AGIy99wHSYLxAcftycpML2TtkjvXkjT/9Wu7eP
         CWih68g722GedszuMYvycPfE99q3hQ2NCzBK5KLBOYKUezihu5AvtCPZxJG0HOcZmNiZ
         U7Rbi558vIFTFE0hUyOCU2vb3pmX+8qJpl7drQwR32DaOGtqR8ttNH13Qvybe9xiejoB
         ojKE4Auj4XWVnPcbTyy2jx/iws0+JgTMx0JEr2EiTbxNRXFdhOlE/SDfqxPPYNVFIztT
         Nq7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/JCT8vUCSqNa9ph5yl4IUyEvxW7g+VTLwFLl3UZKGjbD+h9OlcBT9ZCtqIo4xbzTqPS/nek55N2ODuL3FI@vger.kernel.org
X-Gm-Message-State: AOJu0YxA32gfKEgkOPUpkrnKMcEV1wvF5KXiI7bbSo45ssMJDR9Prmj4
	dav7PnYUp++BqREpatq1I3Isf4uYiFcDNfncip6N3C8jVYUEZmumYP86ryBim2bz01JEgrovTsn
	divyNgON3tJNbpKDZ5khFD3g3Wn4PCGwIF7CueZgjxl1sC57TQXtjVFJdEuOa+Ub+xiJPpcHkJo
	q8
X-Gm-Gg: Acq92OHOTEzXaXVAsLy2Iv/s9g6zmJEIwLWwKQ4wm/sjtyAgPNY6hbspAVKFNFKkmdq
	QvhGlg3YQ4bXKudPBd9+ndWKxMEqVMZNiLkDgtpPLPHDobl/q/FZ3Ucvx6qUQFIFMVbUfrHpNwX
	rwHSCCQoNLYfvutqsi7HbQqSoFZqmgEBHd6927xxO5/r9SJDvKtyiJtcybrDZAxGTKYK6RFOGcu
	sQdpFetwFnZOwXsxlNlc4cYyjlsBZozmdqe1FkNu4uR7CTOfJj6/X3E3O7LcEIFiGQIR+UH8F6u
	pnCA13U0Ct8g0Y8wNmf3xZs+DPo5EjTtPuUuYSZZWy20p6GNC3A+mNkgrTCKR4aIcdy9AR85yuU
	4k6sCinvjyvHGLkEe6yV1Xg6fJ2jwa82YR6B9zk4NA+cD5V4h2IQspaG4C8aYa9Faco2Nf0hYRM
	9MhWYleT2XZOLvo1TUwmTv/fahYNr/2iAXbsvYLhOMu7GADA==
X-Received: by 2002:a05:6102:809b:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-6fefb0a250bmr5275738137.22.1780818659080;
        Sun, 07 Jun 2026 00:50:59 -0700 (PDT)
X-Received: by 2002:a05:6102:809b:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-6fefb0a250bmr5275735137.22.1780818658767;
        Sun, 07 Jun 2026 00:50:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed8e0sm2923730e87.2.2026.06.07.00.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 00:50:57 -0700 (PDT)
Date: Sun, 7 Jun 2026 10:50:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rosh@debian.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to
 root ports
Message-ID: <l3s2ghhsotwmc74rugfrgwnpfveixqca3ri5ailraamjkn5kbs@2bju7ifashhg>
References: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDA3NCBTYWx0ZWRfX54286p/eHm1z
 a4rt3oVGfRu/mt9c0Yye80icPMYPFHw3LUksCTV73TWrP28Qf3gHu29A9iGn2DUnNle3Smh4GTO
 LscaeRsNzrRHMxmSNAr6mev0x0BSWvh3w6BlGmgE9GAMm49EnMPtgkAawUeSlvAniuoUV8rIued
 sU94wRmK0Myv0xpe1lUkakaL7XwLhL911lJfELGvZGIn8tgFSdocr+k7RH6X1SMMwFjLevc1DjC
 jirlN/UPe8lx4h+4YwKK8nZITYkGS5aG4VRhglonMRYTNQdGfevOpSpujoAX/VOkbnTgkkckq5M
 91oZVVBMaXlNq9ccox/bnZyysF/PAaJAJlQxc3Qs+g+og8U3/QKXgw8Pwo9zC/fyLFWDRkWzmiC
 kz9/hALY+eoee3wBrlfkdqYgzzKoFT/CVldujDfSKow3RMTnPZOa/QjXxAWVLHkvsQHtZT9YVMz
 8oUfBBdECsG6+NYUUKA==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2522e4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Wdb1h0LgAAAA:8
 a=EUspDBNiAAAA:8 a=XRupbPVGphp0XdZxmlIA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: W-rRzFEFAetUUoHVAMmPubCxZONqxZUl
X-Proofpoint-GUID: W-rRzFEFAetUUoHVAMmPubCxZONqxZUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111548-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88BAC64F09A

On Sun, Jun 07, 2026 at 12:17:26PM +0800, Hongyang Zhao wrote:
> The Qualcomm PCIe binding deprecates perst-gpios and wake-gpios
> on the host bridge and expects board reset and wake GPIOs to be
> described on the root port. PERST# is described there as
> reset-gpios.
> 
> Move the PCIe PHY references in kodiak.dtsi to the PCIe0 and PCIe1
> root port nodes, and move the board-specific PCIe reset and wake
> GPIOs in the Kodiak DTs to the corresponding root ports.
> 
> Keep the PHY and GPIO resources on the same root port nodes so the
> Qualcomm PCIe driver can parse the root port binding instead of
> falling back to the legacy host bridge GPIO parsing.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
> Refresh Kodiak PCIe descriptions to match the current Qualcomm
> PCIe binding guidance.
> 
> The series moves PCIe PHY references from the host bridge nodes to
> the root port nodes in kodiak.dtsi. It also moves all Kodiak board
> PERST# and WAKE# GPIO descriptions from host bridge nodes to the
> corresponding root ports, using reset-gpios for PERST#.
> 
> Changes in v2:
> - Refresh all Kodiak DTs instead of only the Thundercomm RubikPi3.
> - Move PCIe PHY references to the root port nodes together with the
>   reset and wake GPIOs.
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi                     | 10 ++++------
>  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts    | 14 +++++++++-----
>  arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts    | 16 ++++++++++------
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts             |  4 ++--
>  .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts   | 14 ++++++++------
>  .../arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++++++------
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                 |  5 ++++-
>  7 files changed, 47 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

