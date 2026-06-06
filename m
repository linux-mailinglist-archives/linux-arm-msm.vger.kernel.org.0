Return-Path: <linux-arm-msm+bounces-111541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QZGMGVOvJGp9+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 01:37:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF13264E835
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 01:37:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WDlGpHX1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S9o65S+G;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111541-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111541-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E33C301588D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 23:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B344071E4;
	Sat,  6 Jun 2026 23:37:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8F271464
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 23:37:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780789072; cv=none; b=Zg0quOA9/anq4kusmzGuIBdcWFBDHws4E0KF8i9j0VemMLdHPi54DD6WlQqPKKezqD32AEtIOn59JkCsTquhON87eqmtn/Nv6xDpbIZABj6pS2igetJF73yyJay8K+KpSchHe79Wmw2DQ2slOcNram6b682puhtbJABqNACcuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780789072; c=relaxed/simple;
	bh=FNdO4EzkQlK7edPAWI5qSEOC3CTj300PKXMEaAiIosQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FW4vScgbwAbVV5+V8hUg78iSJzwsbcIpSyKJB1+1Nd4iMcASJKH6TqxDOsCbDvW2sYMjruaUWf0JDThEt3h4hhogPRVKmz6lWuhC76LxE+BR/U3iZRCQxd24WDZOpbYE3E+VaIRVpwvkTW36JBJ1OyJg6r+TVM5al0+BvrKZWdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDlGpHX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9o65S+G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656IhxaE2240785
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 23:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I4T2ktda2y2xuFsJV/SVVBkd
	1GmugXsO7+QrMGj2C+I=; b=WDlGpHX1kJUrjA7pXHlyFhDQ5Ba0yBtQvoWL0WUw
	PDSQKO4hk1VjPcPAU2spAG0A7X17vS/VdMdABZ0zDJ7k2h1JOCpEXqUnRQxcjckv
	gXzZCOFVmJGzbiMqg+C5LSp8778HE4sGKNpu/op8L2vW36z4PJetwqR4ZY2/dw82
	J4RCnDQBG9rUmU+dyXKTU/YSiDSiLWuyWtn9O3oMkV67cfRdoXm/qaUiIhZqjLGl
	rD3li5Ji8iov3ZYVsFRVJhK33yEDj/OzizruAaws3YS4W4GUTpRKJ4kUP7vykA1b
	B0qdv0wvLnqe2cfmOotGlzhvK91ymf6PLClMgZYTH53QIQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98ctxy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 23:37:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59bdafdbcbaso2480673e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780789070; x=1781393870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4T2ktda2y2xuFsJV/SVVBkd1GmugXsO7+QrMGj2C+I=;
        b=S9o65S+GPuoOq5spQ6zHyGhUaaC9uG0Kn4LmglHTucAr6atyaHeDbvK4+mpCR5gRrW
         Mp8wIoADBqCu8frOWKSqJdxaNNe7Dei5gDaCVXqvWA36J96BATaq5s8Wav3wHmN/GZDh
         CJmrScEUuaiviie31n9psMczc7E1eqnmcmjSQFf2UnpOe4up6crdp/jiGi+HaWcknRVy
         KP3yA5i+p6p56jxazybTLJtQo9lYh/tpdq6QOUQDwuc6hpzCmqNCyCmxZzbjpysBEO8c
         obfCyfuJqTbMVSPitC5UcR9bQeDt8NZ/7l2HZ2FqkVr+6HMcRLHVyL3rh9qPWvKaVudB
         AIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780789070; x=1781393870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4T2ktda2y2xuFsJV/SVVBkd1GmugXsO7+QrMGj2C+I=;
        b=J19VPNygNkxmZubOivysqAeSjMruOEbBl7fiKjKQiO6+X1ejZ4D5GKQ8KHJmQcKZo9
         /9ev1A1mP6yxXxcnIBdlzJ6C66x05vqrXqaqUgS1UqQVrV/nis0VAiKtXQWPNRLdysAY
         3UeIW2FV4IWe91S5rDpJpf2zwKxTfyv32dDcfNQ//SWINRfgS88koVce6VIrmvvflZZp
         gUhL9z2stzNPkYN/f+1vkNTeCwOQd2PyiFZfGCCsQ1BEGAEjfAcITwkMJ1QzwQ5KYXhf
         OEOr1qukNLb9FGAx4G+H32/nKIDfAulcRij1o2g3lDcHczruwSGiWvovRLfbHp8KLi4V
         aRog==
X-Forwarded-Encrypted: i=1; AFNElJ/6vfsbkcVY/tk27FGlVXPnGbnVID96Q7jntUtGCu9UM7QFvvuc5NDbCxT6eXzOZKtB07cypetrdq9fbS0D@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkneZBfyjyDUNEeZNKy40h+SDR73OCDZG3cPBW2PIq+gXkNOR
	JQ+zqHjIRkw9Z73jDztke8AER5CEPjiIJPMm4ypkQFClhjtps1UN1mVb70p4yRCnjZ+EN80CiT6
	PPTSTPczm60r+osa69GsRK1i8D+tnC7vTQ4iJStlFSaSb9EIZoXR42pzVAdoa+ndVhXrm
X-Gm-Gg: Acq92OHTBhiqmIzLVLHUv2vmTt8kyP/Zz7cJZR3HGUHXjbtYIm2O/9A2kmEVavRp2T8
	Nu7mCCQObDq9FWt3y2CJ1Wqrb2EXRKuWw6Cwcf+TwxlEfdAg7ispnlZ4Si0VXpcAWv62mcC/020
	nJTD76e0LFnOW9UJNNExhy4fWT2kDrMrD/YYPgCnSkSlKU1vqI9KoBSMGHcKgUPi/PI85d/LuuC
	ooJfp/UCxSPyC1jaLIe3ms777nXfXYZZ3+WdrEIZCfykke4lGf84i2P5bUvuMMh8LIWzuCKKKg1
	jvWEn+AOEN/D1AJaArNXw2870MWzaqmCemlKhqNwEcKUMy93Api1y5FvSSXll+NoPuXg+pRbFIv
	IGS1Cts0EqSJkWTO1adMUNogN74MhlsDp4e8bK7RmFhSnj5s3TDtfz/3nfRpD58xsVhRXpADyEv
	/pRqGK5ShpvvNFcL+0bW3HWKpJuSt84F9n3bASWkCn/BZMig==
X-Received: by 2002:a05:6122:d87:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5ac55be8a83mr4269874e0c.7.1780789070195;
        Sat, 06 Jun 2026 16:37:50 -0700 (PDT)
X-Received: by 2002:a05:6122:d87:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5ac55be8a83mr4269865e0c.7.1780789069747;
        Sat, 06 Jun 2026 16:37:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b904207sm2715915e87.32.2026.06.06.16.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 16:37:48 -0700 (PDT)
Date: Sun, 7 Jun 2026 02:37:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rosh@debian.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Move PCIe GPIOs to
 root ports
Message-ID: <3eot5467yvyvmw6rckfsklmw2mh3vs4v3apqexjthg5ygksdag@j274au5cv3mc>
References: <20260607-rubikpi-bugfix-next-20260605-v1-1-ff97c5e35bf6@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-bugfix-next-20260605-v1-1-ff97c5e35bf6@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDI0MiBTYWx0ZWRfX7d26se6c6j0o
 sqprsVNnWBn0oSrGHjIWJHbhf7oSUBk2wwJIp4IPLE/fCXU94lujtvchEhwmWhU0c5RPbuWVt/j
 0fOVGd7s7ZM8CEtSkowL59sbY0acDo+ikYP+734p/bDp1UdVBoxPEDMedLrWamtplL7oE0/rP9/
 /BYasidhjCgwdGA9gksuv8vZYlHWnG81qiBFeRZsKGcIuK6tWSOD9QLx6s1U34yMyzQkNFrFerT
 CunebJRJFcGhXt/2IFLixr+4sZMgqRmEU8S1ItFCrrBX3G9nrC6kC3Fif7XC3YzLjPLKlxDS7cU
 zrJqOC46ZW8pegQFoJwEflSdpBKUNtOyUcHjkEJhah3JNqRGYzRAWQBqJoKRSFU6JtSW6yqIfr0
 jAHxIk1BTyu1hSzwyGzm1ao07vwzxTlXplfUwgUddjnu533m5PF6QXge97314g8a8nwj9Xp8EN6
 zeu3kzgtXM/RJ+9HCBg==
X-Proofpoint-ORIG-GUID: 1t3l5g-GRqi3qIheQbknJq-FtmimgSol
X-Proofpoint-GUID: 1t3l5g-GRqi3qIheQbknJq-FtmimgSol
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a24af4f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Wdb1h0LgAAAA:8
 a=guB-6Z1nZhQP84zmCysA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060242
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111541-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF13264E835

On Sun, Jun 07, 2026 at 03:13:49AM +0800, Hongyang Zhao wrote:
> The Qualcomm PCIe binding deprecates perst-gpios on the host
> bridge and expects endpoint reset GPIOs to be described on the root
> port as reset-gpios.
> 
> Move the PCIe0 and PCIe1 reset and wake GPIOs to their root port
> nodes. This keeps the GPIO ownership with the device below the root
> port and matches the PCIe binding.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
> Fix the PCIe reset and wake GPIO description for the Thundercomm
> RubikPi3 board.
> 
> The board currently describes PERST# and wake GPIOs on the Qualcomm
> PCIe host bridge nodes. The Qualcomm PCIe binding deprecates this
> and expects endpoint reset GPIOs on the root port nodes as
> reset-gpios.
> 
> Move the PCIe0 and PCIe1 GPIOs to the corresponding root port
> nodes.
> ---
>  .../arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Could you please refresh all kodiak DTs at once (and also move PHYs to
the the port node).


-- 
With best wishes
Dmitry

