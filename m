Return-Path: <linux-arm-msm+bounces-111700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0AjbLalnJmr0VwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:56:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D8653465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:56:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dOtKPITR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VpLT2USC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111700-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111700-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBDF1300F976
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F2A379C21;
	Mon,  8 Jun 2026 06:56:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCB532B11D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:56:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901791; cv=none; b=MKnjK4MELbUkYq1RBHI85IlqCot4pFFMeFg4hrDIClHihplmZYZCKPa/0Wq0x1sdVwEqnKE3odsAxIDEDrTV3f20wb5/Hhvjo/+U1XGzMYJNYgIx9wnfz6pRq9JNX+L+d1zeukJ3adH49xI2DCtjfTiqyIw80xWGrkYxXgu0q6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901791; c=relaxed/simple;
	bh=KqlGR9biIhMlNdFTrAQoHD6YnqoAiv2WGq4LdJhtbDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwSU29g/gjQskgE+J9G993VmmkxhaS1gJ5JmfBTxr7hmE6Q9NtG8a3lHQ3cxu2f/+p1+/cSyEoBbHEcnj3iv3orh6LrR91kBsoBJCwgzSUgAWUfeQ6BFMJPQ5WL1PFISJIoiRedeFQhaM9iz2j8CUpia2pllspJezwZnJgXI49w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOtKPITR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpLT2USC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OvYZ2833011
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sDJvWTVEGOUQxwxd+IZUiqxC
	pZ3z+NvRZh6WslCfjos=; b=dOtKPITRwDunlS4VRA8U8VTbgTGox4HcIEsQj6Uf
	8RxhPThUY2Zvlsgyj/urSei/Y7oJckaBUhh1IgglpMYpo9jrFUVybKNVnKOqYQRR
	lf6FhOGTh8+VFzFMPF+WUX6Y/lzdO/6RBd7XlEtB9jKPGB0fvH9XuHDCkc/VCSeG
	z0zpSMUE5sqtqKg2aW4RrMP1ES26dF3GwBH/vuS4ZYQpC5PuXgImc7wpuWeC2sid
	NbDTabdMoysiTfoug2GXkfgshsYo4u0Rv71TZGPu5GOhYt5rOqnKOJuGgxvAuw+4
	NsTEv6Qq6oA1/m6BveuNV1iMy+eJ/P7KIF7QRSNFFOWFfQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmredu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:56:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517afbeda8eso29791161cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901787; x=1781506587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sDJvWTVEGOUQxwxd+IZUiqxCpZ3z+NvRZh6WslCfjos=;
        b=VpLT2USC90kxHghRV1njO3Hpk5TIZtc5QlCVLyaAGfTNSAXHBxPoI8weOKDEFSCc+/
         L4brATowSkYEANJ9HUOryZ5fV1FKBbvTCo3jtTR0W4wwHRWDE2A6Ln4CXbuRLKlaanhD
         jtqdDHRPvjOknPU7VdIQYukYzvH4G4WpmDG918SqVIWnjvKblduSdVJ4nfxGMAoDDGBj
         wBipaNxBvOSten0WVg06aYuZyVedkICThmyqROmwrHyp03boZuoRChgcUb4pq6HdYIV5
         HR9Z38YNu3FGB+66xxABF/wjcgZEKo3Ack7QfCyXAnEJzq36kXyidBKmB9Lca/mlTn6Q
         nVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901787; x=1781506587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDJvWTVEGOUQxwxd+IZUiqxCpZ3z+NvRZh6WslCfjos=;
        b=Okkd+TRoEb+rlAOp0Ou0Ho69BoQY5vb2qOhd7MPpADQ+mlVrB9PzM5jxeJhRRqgpEm
         Z4cVG3EaBVkkEMK4VW8l4Ug+v7Cao2OMK0MftnSEziCFYgR7i2HuPdCIisWuSAEviVEk
         zJ76k5T9CO+rxME7hcgZ6J/sVpLXQX1iFg0AksQQmtjA62XT0OyuwjcElqkXyzZNGdnD
         aLYy8pSH/JcR5VNrLoxhLW4oTgHvOZJSOwWjbCjM6boCd8/vi18xbddAI+x/aVH3JClN
         gszLktMD+08jZaXCS87ZPQJi2WI902BmSduToEtg2ZhFW+3LtGCeH4jfwp87kEV3RBWM
         6ivg==
X-Forwarded-Encrypted: i=1; AFNElJ+zeUgWFNyVMz6+sxq1tRq9sjvR4wpfwZcIX1MjnpJ6aGeqTt/Aq48DxaIlgtLQchJd90Bqc9ddVhMsp3ER@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyq7M33UxJoUlOsTyQpmhBBdFRqlTY6SAbX7jzQFT3dJsrhf4z
	yEPZlWagFepCxYUCwaDghSeEAIBasUI/ya/IHvPz/ezPcPTao3J39f+g0Pp9vkn+kg2RkinlvP2
	4ascN9O6QZw+6+oQGUQxrbyHirjnNZT8t5FS1eaZJWESWcP8kEGfe9Mx2AH6brWTzfrpT
X-Gm-Gg: Acq92OEnWQJ0Qa3ee6Lche3RIX8IY2OVWmUr8/Kgds3t0xxLTV7hoWJLl0OdH/TLzrz
	IGOA/AAfPFjVoIbMpS1MmZmvCgruRy2CtjEK032c1Yo8AJEXoj3MXa1aaNxlfZJL7gg/jLLu8LK
	JYZa04eBvQK2nTCmgkQTShS4oWhJK77BTM5ShgUW9kGbTGmvlB0hjvuwtsDF0dfTPkVHdpNgMvV
	D5BvT8trdrJXfiMC6CTGx2hlGimaYLSznQCDY0iFSLbSH5xEIvvoQeU4mGNPOUZVijMK/dy6V+c
	omPJY4LWAmDwhZMj+CSKlK2eSwN2hABzDArascAFAnex56TdVYFnV7zIT29Nq/0dM1Jmef08aFl
	htv0ejXob/yAyEgUBxidklBmeqDBtCafYyB7Vm4CfPLrDgS/Wcv9fsgycEsJj413OPCYwwdH5xz
	zDsXzqwTuxClX1YEhth9A1wfD1wyp6+O+e1kkjvKOe+7BL3g==
X-Received: by 2002:a05:622a:250e:b0:517:7701:c085 with SMTP id d75a77b69052e-51795b9e6efmr221641881cf.21.1780901787524;
        Sun, 07 Jun 2026 23:56:27 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:517:7701:c085 with SMTP id d75a77b69052e-51795b9e6efmr221641561cf.21.1780901787165;
        Sun, 07 Jun 2026 23:56:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be00dsm42953011fa.24.2026.06.07.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:56:26 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:56:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX/LeGaFKVsGQu
 n+rSOE8JZ+kmfRyP1F6bfflCYbOUR1lxFH7PCkMubRZicaEzSXroOJkHkoqELS31fbawrs0cQiT
 pAaoAgOa/yt97NVqh8iihcImbxZFwnqncReTVKP0Epr+6FPbElNrE8EtX6A8p4C1+0bQsx/wKNJ
 apdKqurjbBJ6/CFNPuU7PJrRAHKUFlnfjwkRNa6x2/UzIWqhb7e7UYHdBaNF2H6m1DthaGToHmJ
 PiFc81F5zX1JTI285oR0WOjvVRQrTgJ/+TP5P6fX+B717m9ytxsHuvu7KqsUngnLqlmzW8z8cmQ
 E+rbfRGO0+fEeV/uKkN3NmZUswA+0RUezWpIcrz+U+JxhseveuBKDEYU6Xafj4bLJ+xG0uNoDRm
 KhaulhRyR2FQmZy8p0KBDSjJucDnIp9zXwNAr767hwwdyq8dphG/e3i6IVHyNGlJmjTsPKIcQQd
 +uBEBV7ijnBqLEuXxgQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26679c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wA38C85zNOdD-9IkiXoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 19rIJuYG3RsmYm1ROOfUZjYxpB3WMhJ9
X-Proofpoint-ORIG-GUID: 19rIJuYG3RsmYm1ROOfUZjYxpB3WMhJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 707D8653465

On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
> supply.
> 
> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
> refgen regulator supply.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>  1 file changed, 220 insertions(+)
> 
> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll",
>  };
>  
> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
> +	"refgen",
> +};

Now vdda-phy / vdda-pll supplies?

> +
>  static const char * const sm8550_qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll", "vdda-qref",
>  };

-- 
With best wishes
Dmitry

