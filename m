Return-Path: <linux-arm-msm+bounces-111680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ehy9D3BbJmqJVQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:04:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD79765304D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:04:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IWNQyrMk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="SE//Xm4i";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111680-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111680-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD5193006F25
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0922837C906;
	Mon,  8 Jun 2026 06:04:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC637DEB9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:04:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898660; cv=none; b=KWOJI4NSVsyHzNm7CP4kadPGsZNXZoNglRUA+VQB8KbX3nHOI7GiOE186Cwi17YoQihXR51tsEHzawSiCjP+Eb0/5uFZMf0mxhurOqlem6cPObCzZmbjF+MDs1Biah7l8Ml5G0Wh7MIKpxKLnPl4UGUjQHF20KuzijB9NSkj0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898660; c=relaxed/simple;
	bh=tQ/zYygJXIMhmnmWlkNagbooYmXGxdVLFQV+VQ4wmnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISoBPUzH80klZlUT4v7/i+Be9xOOlO/WVXPy9xH7IcUzORY9Qpmo1q8/rtrBHOo+OXZLGfHDfF7pXhRlYb6zAeRXouQPGDs1yo+BLhyJApigiIIhjrnXJuA2voEip6yuBem7iZLh6g3oOf4gwTIHGJvSNhsQTknF0LCPcECBcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWNQyrMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SE//Xm4i; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Gb4Y1991577
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bL7RrCSQB6iOyve28SUhhCIRdGFRm2bK3QU0AFb5LnI=; b=IWNQyrMkOngUtDtW
	YfWDc7pO7gwTyhqdYJJtIqH983UEJSIMBKLXNp0XeZtlNNK3DLWKSFWZqxm/CTWj
	MUjCsQNxunru12y1kLnUJrb/AE0ODIOV2JegkDVQ9myiDXQi2xvad6+fMy4HW8Vz
	5KI7IVuWxEUyVxAPLimBsDsg1hDxw7S2nKLHsSK2Ga1BQefrSd0Rnm5/jxvC+HTN
	RG+BwUEK3LnrvJ11KWwCSKl+xDr1Sur4/3s4c1//XmKtpHVsWfEmzNjBCtgJlkRY
	ygSHX5UMEu7seDTN62wbWlA59KEOB4L6FLMhe/lJ6lazwbuNpWppQHeb2w6ds6b4
	nc0T1A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3pjf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:04:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a7cbf971fcso2176303e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898658; x=1781503458; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bL7RrCSQB6iOyve28SUhhCIRdGFRm2bK3QU0AFb5LnI=;
        b=SE//Xm4iLgdj8b6TETsBiqBwulka23ng0CoWs7hT9q3cCJ6Yc0p/KAUMBWMLZdPyVe
         UV3d1KywlGNITHjUMSRtdFgqpb4y+nUKOtp5Ebt4q6eM4OElqRtjQWpQpuSDszJuuNjI
         e0NcJbHsgiUHH1U4YtaukWBZLOX0OGueCjTfCYK0hprz89fraa0Ru2Y7IfaUngST6+l+
         IYHTGKW9P0eGaEz6Pe9lpMD4TH+JvJ95BUmn/RHtaD85cucVcXRgA4ijqeWtygOz+dUM
         JlcPQyHrBzudGt5UfEjvIRQ+XWiGY/036lFCX+2vRtucpfFzDmpuxPPubuojsIgLj47c
         oC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898658; x=1781503458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bL7RrCSQB6iOyve28SUhhCIRdGFRm2bK3QU0AFb5LnI=;
        b=InUpOc8g+rdBviaRX+st8pyttLj0jbuKTGEaOH9px2oMzwONFNUFKmfUVz4qbu7nda
         ampDxceI7NJ6Rx8kVrvAnaFIDcD9W7A3uaeSZdp2dAKZLHQMOSYo5rUJ6RnoetVs/TAA
         DpSOsk05ZbwS5Bj6BGH7vVm1521MNgXIB375bIoppHMrbshxEYAFRz2NRaPVS3PdT0p4
         UI7Yuv3qYQdSqssSpTGFCTfxuttdUTGx5Bu/SfhCbYRtzew1j0VGMPKzxtR/Jrbk21Gj
         Xf1ts4DOgQcaYVC2EHqgQdh6+UWdDM0MU3rIdgcWcTJUpi0e4yuQ6/0iSayNmamY3crS
         hiMw==
X-Forwarded-Encrypted: i=1; AFNElJ8aIwUgClMRYMIlqrig/AlCiyjVLpadK+E65cESPhBRXshoy0vKxXEi9vT0BSV946dsFqCpndAbcHgaZHwX@vger.kernel.org
X-Gm-Message-State: AOJu0YzdodGXt0Wmf3AhsoRMgNV+g+dgPvwAsOA38mVTKYNdO/05X0Ra
	UtmfSo5HaNLTpyWu4OJS0wCt6p9XK2RuY1PdLiUyAentKHBoW+z8Ktin3eF/w/8WOsLKcgRz9n3
	k54K++b8sQDLxGXdR1dfv87ncV85KK4kC+FoCe6sqYkRAPjlj4s38pIPq1Y8xPofnIxF7
X-Gm-Gg: Acq92OHr4pFgBoEYD+5/s2WYIBzEjQX6MFb4GYQljiR5iVgEEB21HLD/viKKFG+erEq
	ZfuHPEUfjxmOclCw/fpZy2AJdAC0JZsq84JE9+4hpIaswqJFC+POrqmNcCn7swMRqwmTI4diqd8
	93xOJW7t8DNzmyPfMXcCiS4cph4bSKS0l3LTWuDM9cMvCTOJAgs0cvJj9hBrzLJY7AS89yA8sRK
	EaC+UUSLit6Lj848FHIPjqUEHJ2czkjAwm8qIph8ULnalj6uwv9AaZJVex2vC9oyV0yhTK56Ke6
	2ocXX508TJtqihN4fYhqSatcUBypNFG1RKvV+krn7JtrE0iVfYjcmMtPw0Xem3qHsfQbpRylBew
	OcdqYaXOpxYtfNTqAAtOYFoGkvtGNbPYPySJ3/UsKmc6Nj05LYHTSmkdVgM1Zru7IfZibiZq1Yi
	oKZ+VyY5mu5jS1Abv4g1Rj3wUJzvdyNAdHQuUm+uOKoWWxHg==
X-Received: by 2002:a05:6102:809b:b0:631:28c1:154c with SMTP id ada2fe7eead31-6fef92b85dcmr5513725137.9.1780898658056;
        Sun, 07 Jun 2026 23:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:809b:b0:631:28c1:154c with SMTP id ada2fe7eead31-6fef92b85dcmr5513719137.9.1780898657668;
        Sun, 07 Jun 2026 23:04:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2d3sm3551255e87.5.2026.06.07.23.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:04:16 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:04:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Eliza
Message-ID: <ywabwqbgjkvurybqsc5faq5vhli262nqe5gplki5gio2w2zsve@g6h5d7tigmvc>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
 <20260601-eliza-v2-3-6b44c9c23d5e@oss.qualcomm.com>
 <k37nby6lnczb5qajku2shpff4rsisyynlfmzu46lhojl5eiwqo@wkpy2tbeoa3b>
 <29763928-2301-437e-8787-916930b64a88@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29763928-2301-437e-8787-916930b64a88@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MyBTYWx0ZWRfX9HCPSTnJF/GE
 tUdj2KNjtHQsaljbXC2MWFfz0xnZAK/Q4LWthHvuhu39+2YgWB7368WgzRxA0x/2S2A8lAiXAPD
 XAFpjlYIboOFHBSfRXeVeS058X51mtQ1BXhg7vd4i3YRU8/Z1GH4Ld6v7x+ApCzixnJRrrIR8kS
 kuzOoyHjMhCB3HsQGdMQDonyzgdtPMtmkRViAfegozDtrqZaiXdUUp21vTZivdt007iDU0OkASV
 zA6diffQNjZil2hbAbiAp0JWsRjUjcn8JeYJLlVs95Oa3w8Fp/Z5GCyQ+WX6KzPrJHUyiIVMVpe
 qF9f07XzvDYHWrGIx3azMpUCN7XW2vcmUvbmjIKOYR5ZEhoIp35q43Juc6MEu3abNnexVvyZ50l
 hl3Ez1iAM5/ZB56Scx2rosjvFrsJe8E3N7vqiHOA5WSWTRL6qJiatCEjPJBcF1+cnaK2qp/F1EO
 jbimcC6N03kpvzSJppg==
X-Proofpoint-ORIG-GUID: RSLCIMupJb6BwFUY9l-G1kuuyJHpJCYr
X-Proofpoint-GUID: RSLCIMupJb6BwFUY9l-G1kuuyJHpJCYr
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a265b62 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5G9BQlURLoUVyWWmJtQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111680-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,g6h5d7tigmvc:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD79765304D

On Mon, Jun 08, 2026 at 11:12:13AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 6/7/2026 3:59 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 01, 2026 at 10:59:46PM +0530, Krishna Chaitanya Chundru wrote:
> >> Add QMP PCIe PHY support for the Eliza SoC. Introduce a new Gen3x1 PHY
> >> configuration with Eliza-specific initialization tables, and reuse the
> >> existing sm8550 Gen3x2 configuration for the Gen3x2 PHY instance.
> >>
> >> Also add the missing QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1 register
> >> definition to the PCIe V6 PCS header.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        | 139 ++++++++++++++++++++++++
> >>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h |   1 +
> >>  2 files changed, 140 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> index fed2fc9bb311..257b4df965c3 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> @@ -198,6 +198,112 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
> >>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
> >>  };
> >>  
> >> +static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_serdes_tbl[] = {
> > Thisis exactly the same as SM8550 table, except for three extra writes:
> > QSERDES_V6_COM_VCO_TUNE1_MODE0, QSERDES_V6_COM_VCO_TUNE1_MODE1 and
> > QSERDES_V6_COM_VCO_TUNE2_MODE1. What are the default values for SM8550?
> For sm8550, the default values are different than what eliza is expecting
> 
> *PCIE0_QSERDES_PLL_VCO_TUNE1_MODE1*-  0xA *PCIE0_QSERDES_PLL_VCO_TUNE1_MODE0*-
> 0x53 *PCIE0_QSERDES_PLL_VCO_TUNE2_MODE1*- 0x1


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

