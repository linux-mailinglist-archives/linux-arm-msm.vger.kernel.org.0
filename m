Return-Path: <linux-arm-msm+bounces-98503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDv5GXewumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:02:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6D2BC8BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B60830DB434
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C401F3DBD6D;
	Wed, 18 Mar 2026 13:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3f/Xky9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FphQGdJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB6A3D9DDE
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841929; cv=none; b=hCN7gH0CyY9eL4N5kuVv3UDSJIYpfBykuM5Y6BGEBtX44LbYIBQXy5z3qkvwkyG4sJT0rwG6e4ZNZ6psbPMbZGt45Cug9oXFjCX4EwNU7a0GyIO0OnbS15X9yVKrKzwc/USc22hMCWAVNqCpx1IJLKIYMz2qLF3VtefIXiHmRG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841929; c=relaxed/simple;
	bh=5lGcFECjlirgOLotjq12UYVAQ+q4pmwvjctjKuAVe3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsdFRAIZRVBLaoCObu2in4OLWLHuSRJQ1/bfOmDUBbzTeLqzMqRcnoPZ086pIgDQIiAM0vX1FY54Uch2jJoxwFLEvY43kMQaPs4HfBQcuuRI43l8TN71NXdgisE4e0ZnjpYzyTeQidUReElnTux+OJUpKh7ZxkKmZw6oLks/ALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3f/Xky9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FphQGdJY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBB9iJ320090
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Z8dinx8Xl/BUcqhfmPWtdPa
	vfkmF9tTU6QfvQAr2Ag=; b=E3f/Xky9VJS7tqy+PcfgXVF+qTpw5+UPA811JcHD
	GmazioExvtCyZWg2PwUj6SDb62aJwlw6CyWaN9p9+/r5JXbcu+djiLhepzbaBagJ
	bl2xSXAiANLRawDNlK+eYmnXeVtuIiqicAECwhMnNViRW3dVTmjp2L7+Hn/5hhWH
	jaL0EzY5PXL6/XdlAc1qHv8eUV/zmDo9gQcy9trKxjUscsfIi0cfssUbAm4yuedq
	kaJ9D9XcBGEIW0A+qXbOKHyRE5Ny2ED/qtLWzmsBWU+yDzTqLX1jv4OFb0CYOnXw
	TqmBo7/eJsDGRNIbg14OB/aAZvGDEzt1eRpVJS+fUhkJTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrgd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:52:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509159f57e0so145603701cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841927; x=1774446727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z8dinx8Xl/BUcqhfmPWtdPavfkmF9tTU6QfvQAr2Ag=;
        b=FphQGdJYUOzVBMJKLSNrW2Oe9IIfuk3BZfpKlwyZdds/wBTlqt4kAj9QdxCZUfd3Ka
         h6VCDEvIzpkdBJ9kTJZK4ce6SWxw+HciqPKBQ4IYXEI1Dg51/o3yXdcj2epFa9UaPqSi
         qAiUJEt1XNpPYadrAVJsW2Dhyc5Iaws7dY7L1//GlNnmToYE7agwENcN3mKa2DHa/tmj
         SavUsKBgLA8LB8IUTis7Ozqjaej/4ohSDNW+Wgxn3WT0iDlRayY0E6xrwnNRNCIAoGr9
         fseBP2czsz+jZtJLzDVwNsdeCp6XvFTe5lXG13o99rLBcDygw61KzkgF5Q93aha17fTU
         4OYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841927; x=1774446727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Z8dinx8Xl/BUcqhfmPWtdPavfkmF9tTU6QfvQAr2Ag=;
        b=a18xedQMdxPZ9V8lSW4POO+AFBCtso7iNs+GWYa5nBwN5A6aovbTnUsq5crVMZSMty
         xrwB/ew97M5gKGgpzxE8PhIAGi0OfDJ3HJ97ITd/n95soAXn/JAYeMPpAcMjGGJHKEI5
         HSXUMuSwRmZNqMypmaEWeV2XRo04Ab+H+vl/xKoR9YywRxpb8wivlEJqJ/DQzhFK5TMb
         1AG847IAkR1dBsBxdKC0zRBf0/YSAquIKgp2xMyrRwelT8Okb+4XS5QRt5LwG4siTHgr
         MAkYlnRQk/PH8+wv/eDkDbPFuZ5zkTf3K5e9EacJCofrHwmKW6zIcVTOfOtE6G6U1YGD
         YelQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+4XB/f26QwM1dWnvN5/DtmI9iO+/+8sQEoHzWx66KkCf+/hQGGPhpUDp1kP98Mrdgise7gaD/kNU92imU@vger.kernel.org
X-Gm-Message-State: AOJu0YxJaNzCitd75fWQx1jg7f1mT9Hp3ivGhBwxANXQWzM0zL+FaDB/
	bhD53Kl3/M3uQPHAxyHCpgXmRjIDUgeg9zcQ8UBqtn6GHlmYEpOMJRNgFVQGA0ETIhi2Rp3b9Ep
	kNbxfh4FPg2c7bAdenKiawoBHPqGFS2HGidMj2QvzxYei57SuYPz+12CaPx8671a1C7/t
X-Gm-Gg: ATEYQzwgjz9lqPl9680YYWjuTnlgkwKN2nP0H4jgDvJa/FGhtV9VYFesKVFi0yhNhR9
	i7wJkkZb3c7SM3R5/VY+h4srLBv4XttmpJO9FIDJkd8Zj3SiecUkcaXb0/vx2qw/TYVEfWgANiM
	Bbe7izJ2GVhuFLJIXoj//k0aDdBtJmJ2VzRskmzyhll8zZQC6wvlvyjbS4KdyNoVlvzPAanVNlj
	UGmDak2P11GZCQC7+W9a9+VO/KL0NQtDYdOqkdYoI74654nUiOpdbclO34oXI60aP0lvnZq2LFO
	H1aHhYkIFM0McI3HPJlk3Wh+keqcuLvrEwu1hBsaxhTEiux7YzntEeMOrVCvRu5zqPtCT4/onnu
	fZJnDM7z1cj45KLaOLn9jrrBt6Osf4dhTHEb7Boyi2iC5tdch1t+mrOLXvePDB3rNi1JPhyr9A1
	HUZlygbRilpqGR6XkyFw5wAZxRx5EenKS4BmE=
X-Received: by 2002:ac8:5a54:0:b0:509:4294:d18b with SMTP id d75a77b69052e-50b14887770mr41778701cf.54.1773841926866;
        Wed, 18 Mar 2026 06:52:06 -0700 (PDT)
X-Received: by 2002:ac8:5a54:0:b0:509:4294:d18b with SMTP id d75a77b69052e-50b14887770mr41778251cf.54.1773841926398;
        Wed, 18 Mar 2026 06:52:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2c152sm550302e87.23.2026.03.18.06.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:52:05 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:52:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
Message-ID: <c64tkkmgnvbkzpwheyid2m3gzere57p7c2aimzixau6ckz3vzb@r6cwfsxol3yh>
References: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260318124100.212992-4-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318124100.212992-4-gopikrishna.garmidi@oss.qualcomm.com>
X-Proofpoint-GUID: tsA3f_JylBBSvp8_UxLfoWvPL9w2nb3Q
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69baae07 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Nb7YlQY-ZbWq2oqyhYMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExOCBTYWx0ZWRfX3I+q3htu89O8
 EVDwvQKb5a2MOKcQKUd419ofdNhxiyeP0tC7sn8U34lV2rsv/4pEUU3na/rviNrhBUon9rmnRS8
 slCU8sbL0sT4RuNm42T0D9MxMpnbREQ+RUvo8LwadA1WDA5apagtpJjEDC4CYmzjEoPLkdR5R3Z
 fY18mCEz07pRtW1rzXovBx6ldrBIxmmzpdEEjc9zAKforrDNu/6nGcfyNWUfIELJn68VJyDoxKk
 neDDn7dPO4nSyT9qLMhbnJf7KTl4V/nEdA+t3yGdo+FIjg7Oq/TfX+i799YujrnLzioG6ygwWWS
 4IPC0wBx4MlHMz4UzI2Kfbxka4aiRtlNr4BsOSl64QOL6zHhgfTWCGhRRL24ztsgcQQybEKWf5I
 Ilj7FdOIAC1dwRlnznpMdaNArPJKFZgQrZJ165qTDriBbb+fdEtea9hNpGRnv3Nlmfy0Uv5x7ia
 UJpt7W5/vBOK4PA/bOw==
X-Proofpoint-ORIG-GUID: tsA3f_JylBBSvp8_UxLfoWvPL9w2nb3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180118
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98503-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08C6D2BC8BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 05:41:00AM -0700, Gopikrishna Garmidi wrote:
> Introduce support for the Mahua SoC and the CRD based on it. Some of
> the notable differences are the absent CPU cluster, interconnect, TLMM,
> thermal zones and adjusted PCIe west clocks. Everything else should
> work as-is.
> 
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi         |   2 +-
>  arch/arm64/boot/dts/qcom/mahua-crd.dts       |  21 ++
>  arch/arm64/boot/dts/qcom/mahua.dtsi          | 299 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |   2 +-
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   4 +-
>  6 files changed, 325 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

