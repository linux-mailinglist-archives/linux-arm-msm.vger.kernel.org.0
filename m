Return-Path: <linux-arm-msm+bounces-112031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YugvH5LGJ2q81wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A4C65D64A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:53:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ct6gBRAq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cMohSA36;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112031-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112031-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 771BC303ABF3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2143D8101;
	Tue,  9 Jun 2026 07:52:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6D43EB7F4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991568; cv=none; b=WaHgvDZ0g/RiEzTB9lvQ6CCVRFdHyTA16R3w9XAPtwokGUvCl9whX9m2vIMNnLECFXbOuVzlT8webgAFjt1vwNYAinEI5XVnT8oJrPPrIZo1L7d733yXdRlXPKiX2oewjAYvkkaaL9Mk1toAWAiyRKPMROrXcaVik49Imx+UptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991568; c=relaxed/simple;
	bh=az+zpCRnr38vmPuK2q43gKmU5L1LhMy3JC6M8/Khonw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hT7ZkZOxwjqkWl5lmQjb1cqP/MZ7WVHqu5/pvgsAMzkuWPbEphMVjLFm4frrv0D78gkaITuOCk47PRPDBIx3i+ZJo74hG+FayLewrhInHxP8yHbe+15vG+KJLPN+fi7HnT0rlD3e+LTbm3h1Ra5lXEOfx575eD3Q1btdt04YV0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct6gBRAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMohSA36; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596xd3h1878298
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JgxXX2hS8aG2JxwC+zyGcbB4
	dqKygStbIyRootZ5ISk=; b=ct6gBRAqo5x+AOIkv/RQvh9d55tSPazqtB7C/a6J
	kaxu/CHnZ6WRsfqHq5JSTaW4PuqTW/DsSbAa12+bH3seoxPTuLH1RuEk25NDvM3o
	0Y875S3nRF+L9wIdMqrgQxiTZ36HxgVrOdVCUlZchxhG8ZCJXTyrMtN83IyLQyKO
	kCieWCMS9DK/rkMRSJ2aIiXleTBk4FTQkNavP3J2kPlKVETOTNZ1HUopIWtx+4ux
	Z5vOnmmjPrcJ7Sx8tm6jONfQboGpaIYKpA023Sq7VPF4hRNvegfiFQ70VM7IvCbl
	Q+zbbgO5grqHRou0O/NaBt4kALcfTC98TKpJ9i7rVpZ8fA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25r704-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:52:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so73076135ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991565; x=1781596365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JgxXX2hS8aG2JxwC+zyGcbB4dqKygStbIyRootZ5ISk=;
        b=cMohSA36+wTsHbqL0301jZCBpdA9iQJLMDLHOzgl/+guJyaHoXhgsc5dECcYQ2v2d/
         m5GKysVx3ZIlLj2aLulCh2CjxIaNb3P6EYJP+aF6ysvHyCrb1ywryKy3c+1BweFvKcHP
         iWGE5U42H2BYcal7vgqG20Iri8PYWyi716YiO8g39JT67zt95lxgBQbIhtY5YRKBvmcC
         fm1XoRxIigRfRq9zFSoXTNgc2sywTAcuRVf8ebQjPvlqyWgvo958bZu6RTK4qjrBaBCx
         DVu1D/jDzgqNMMjHCLa8K/aVyJpZNFkfYa1gKpDGQgzVcHt6tlXBXGUPEIAW6FNk9ZLi
         UCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991565; x=1781596365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgxXX2hS8aG2JxwC+zyGcbB4dqKygStbIyRootZ5ISk=;
        b=D6ffsAmZQV/jcBZ6CL+Th72W5UbqkD5SnWGd2erc+VvKj7dJ/nY7T30UtUp6LkzEhd
         /kNUXIXuEQPCDEq/yKuOVBhavCblkpR41oHvlA+LvPyM63yrOpVgqqzWa+O/fKf/21lY
         94umxNLOycSxx15enBw7V++IpLLK3uxshoPSo28K6WLyTFuh8qZQxjJdSEPzXfQoJ2mR
         5ziFiXIZ50v16btuwu3UJYUU9fLxX8cY+s7mM6dQYsn8w8Ayez3zZe4tBMp5tO4ViKI2
         tiu3DpEUt7Wek4rb0HexlIjA6+hhB8jrf+OMbxaG3MTtxjW6Kks/R0HqUEpkE5Mj2jvE
         FqaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w4R8FUWcjSZ9u/uJvepyVVkZUGJHnR8sT9Vg6XYOBz8ThPB9dq9gl51ilhVJzhrUOijum/wZq6f/2in8P@vger.kernel.org
X-Gm-Message-State: AOJu0YwpI5UMFg6pNxu1jy0/GD0jR65ihs9e0H8p+2TxdLcGFR4q9rko
	kHycH3bESHOfjK9uSBC42qXZjTSCeaHQb2/Aatg6+ogCnIr+yiWPusMf38Vtn6j54Nb3JKwIBTU
	kC8ViL3E3COT1UN6WPZLnVXLsY0kwHRGGNNr1AAlBI+mhrq4OxrlHp1d6GZN7+NZYwhAv
X-Gm-Gg: Acq92OGs+uGDlhbqlbyUfMekCLdjrCGu/z7A/MbfUk52gvrqgBXlj8L3qV2gwD2Bt9V
	1UJhyzMhsn2Zc7A1u6RnvfhiUPrAMDuRcb5gv7QxZOBaRyLQ3J+aVp0nk5mkBZqxYotrzyPM9Xy
	a/kzJ99J/Wa1DSzHNNj6K5La9u6wPAe/igM9w6THhi8cABXL3iZeKx+zfJ1B5eEjh1lSk55qw/6
	G7f9l/a+RamtYYR4Oz9yx9FSfxDU1c6eE5vSci5BF2827TFEmg6/aeJ7FK2E2tysLTKxO5iktbZ
	gsvCFNPcX0ksJuKTwcvttKKPgiZ6dVC9GZCMZllN9I2K7S2RTTzZgey3e7YVYEAmAQRD4XLsvmw
	Nlvtgc0CGK15dka0ZvRZpZqBA/7IB3HNYn0/oK7B6XgkN1V0zFRH8yfuOa2Rcrvvu7TSaEJWQTl
	hBh+0q+taaB9QGxMbYIpXFgB7fyjYDzNlHd4F3nzxfoLdHdi4nsLkhxztre+PVvg==
X-Received: by 2002:a17:902:bd0a:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2c1e85aad5emr150943835ad.27.1780991565571;
        Tue, 09 Jun 2026 00:52:45 -0700 (PDT)
X-Received: by 2002:a17:902:bd0a:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2c1e85aad5emr150943605ad.27.1780991565164;
        Tue, 09 Jun 2026 00:52:45 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm206121665ad.24.2026.06.09.00.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:52:44 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:22:37 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
Message-ID: <aifGReQQ12BdgCMb@hu-varada-blr.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
 <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
 <d291cd03-ffd1-43a0-b4bd-bbad6a4fcec0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d291cd03-ffd1-43a0-b4bd-bbad6a4fcec0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KqLixRK0K__BvoFqpprWr6UuUzHI7qQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfX2ruNPZgsrcGS
 f9GrkEBoet9B/KvHjJ3O6hSoTdpEfqUDvlRuEnNgLdVeyZq3vzL8OxQR3S8CkUGqGThvYAGCtYx
 obz/47oqDWs/G00wNkDh3TIdVwUbkK078/SDe1LfTKF3KN1dUp0WJ45nuq1tGsOMNqv6WA6/W93
 agwkkbF/xiErzJvUBjPrZwGnYPbmOO+rBk3tBXObcda8g2Z+0igNevKftEGI7RHFj053C8SpxGI
 x9rHSRoi2p9t+x0JsUduJQZ3cohrcczV1RX4J6NheHdFW2phdFdP/SsoMBsUGnMQfOp37g4hGSf
 938a1Y/RVHwSRDqAxdjBtj3DbiQBh1sbkuSNz1AS0qJlyyj5LJOwkm8CZCnA7KlhLapOYsPbN7Q
 VuasYL8dqYCfz577X5IIByiZALTYI8+qo7Xnbe01mexAD6yXzdY6Sx4o7qhAsQosx2Bi33hSY6J
 V+rf2SvaQpTBZ4ZYABQ==
X-Proofpoint-GUID: KqLixRK0K__BvoFqpprWr6UuUzHI7qQp
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27c64e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iXUmG0lFcv0RUynX9scA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112031-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41A4C65D64A

On Mon, Jun 08, 2026 at 11:44:56AM +0200, Konrad Dybcio wrote:
> On 6/4/26 1:28 PM, Varadarajan Narayanan wrote:
> > On Fri, May 22, 2026 at 02:24:45PM +0200, Konrad Dybcio wrote:
> >> On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
> >>> Add DT entries to enable the PCIe controllers found in ipq5210.
> >>>
> >>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> >>> ---
>
> [...]
>
> >>> +
> >>> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> >>> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> >>> +			reset-names = "phy", "common";
> >>> +
> >>> +			#clock-cells = <0>;
> >>> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
> >>
> >> Having a gcc_ prefix here smells fishy..
> >
> > Followed what was used in ipq9574, ipq5424 etc. Will remove gcc_ & _src.
>
> What is the name of the PHY's output in the clock plan? I would assume
> it doesn't have gcc_, but it may end in _src..

In the clock plan it is called as gcc_pcie0_pipe_clk_src and
gcc_pcie1_pipe_clk_src.

-Varada


