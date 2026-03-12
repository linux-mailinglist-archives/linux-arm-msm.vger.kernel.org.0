Return-Path: <linux-arm-msm+bounces-97123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPoNF1kusmmzJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:09:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D227626CA36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 001E0302E7FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A35C382F3B;
	Thu, 12 Mar 2026 03:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxCPI/Ki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wf90ObFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB238229A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284910; cv=none; b=F7PXXgyWz5mu0n66aNQM77Oa8q8xFK6DwAIfzG7F93NpuPBsePg3Q+qIoe9S5JfcDxfRlFLS27vZf/3hLXuGsTCg9q9wDCTlB+q6X00zKJOEaXb+B+xLiGreUm1hyNuAcrww/WI83bk+yUwaY5QL8AVRJusdxX1KXS+sc/k+Xc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284910; c=relaxed/simple;
	bh=F4nb1kvt2SIMOfaFz95tLq1sQf8AFxVs1Kr/Y0HjwFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQYDyhn5/TmgyZXsgHuJqHfU2EsTO+Wy+Qn3hrTdobiYLVWCwahJCVhXkp3LwLGtG3GXQ6BZ5uUmyvFgUhO8HGnkTXCzVR847et2o6u48OJrqeW171IqLMeQJ/xg8iIygHIBX5j9ux5aYQcFkhIgLiry9KlwAIaUVZfW3KIB5EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxCPI/Ki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wf90ObFf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMN49h263554
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXZR4M6WU8YFQEgGSCbF7Ele
	7XsFuPfmRnNE+Wvn0OA=; b=UxCPI/KiNcIP6uPxxHb1WT3lejZn0tclapRIXSTc
	3LdZxp8utK3lJNbupraO/MlgRVH9mTOjvscATKIgtCs0e0kNdX1uAMGYMOuAvV5/
	M8MW0gHsIOWgRMJf9rqMMGIIeW3OEU3v2AT4M11tZzFl/7lZNViPLtN3rKjJxRDT
	LMLPa/iMTY9VAWPQRn6x1mM9xLa+nYx5aOc7q4GeSkh85g/Zvbs6OfikxwLt/aWY
	3nIyRvPCd4ikoxOsogw8sTbCtZtiaPgc3x0nEe0IHUubw9oitWNCNEo6BcagfVwg
	EO0xh/0Y5kIUWEruu+IJo8Ga8irw1Izx6byVGYH5ajZ+KA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ygnm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:08:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f474fae1so145117816d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773284907; x=1773889707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXZR4M6WU8YFQEgGSCbF7Ele7XsFuPfmRnNE+Wvn0OA=;
        b=Wf90ObFfBHfw96DcQdw9bB6xzZd+wR+tGR/+engSWYL921tEoTLg4r1fYi6FcK5RLK
         qLyZdaanoseflONuA2k79x0ErqNNK8bLHPBKp6nhW8JStoUytt9tKJezhzSNc8fg9nG0
         U1bqithdlOmmxlkePN6ZxALBeN3N/eVryUNTNdxgFIwMZeHwCh1RPiKQf2mk5vVMP4N2
         /3eC5OBwTuOW/xX4IuPAylxZnq0lVMnTponAcACluTG64DdNJwAxCOcjN65kxiEWOxXU
         HFx1deEUER9/Inj+KdrI4SrugbqHYoD/JTpOGsemYr8cb97ZDQUsXcsPZjU/n+OUNR42
         N48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773284907; x=1773889707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXZR4M6WU8YFQEgGSCbF7Ele7XsFuPfmRnNE+Wvn0OA=;
        b=IuGDuL621P61X2LYfCNUx4E+qRXifslv/6GG4Th9TzTD7DKEabRGEtGa4jPgqqoUOc
         11voUdk/l2LX7t0bBWbpLHUwTmSxyYXuYSXRbUy2hn8qmKO4DaSp4aqSH/1dWwtANwWI
         SpqK5xkfQOQ8ZaKSKIbtdaaC6qtxFSud1+ctktj18Aos4EMNmmx31gs9mHDGMlVc6EW5
         DcRoPaWB1zQJNhkN8waHNNOWM8YtKK+N5fOVT82dI1l5M2PF6k8tcZ3/dLdX69SRWB7x
         9RHpCSsTvZK3hNxZfZFqqJH0Sy3PZIamTRNJc+Pk52n7nqU9/YmGAQsHxpOIwTWxSuee
         tpBg==
X-Forwarded-Encrypted: i=1; AJvYcCX56HtGi5BE4TsjG+RNZ3l8/nbCr0nSx3RpoVjEoWXmWLs8ShARcEZTUz1kh7v24bYWdGaEORbIkqtpTpR1@vger.kernel.org
X-Gm-Message-State: AOJu0YxNl413l2rvWHSAJA2bti57A+85jlVZbWXqlCEX8t2c16jWJ+1+
	KqNVwpwtBr9/qdD3Ra1u8GcehnV1lTbP/KRxi1M96x9gHLvJRAiRbTohVJXVSOJo+O4FzBN0rWx
	QnNSYXN57Q5qw26Sq6nQ7xmfh/YYwI5tXnhkiajrkalAHI5Cn+WnTgySQOtTbsLP5qaAD
X-Gm-Gg: ATEYQzzYEcevescRqAg7KcDaemjshC6APuGYgdl11L85IAd9pJGdF8KQVx/QoTCe8WF
	ru8ymaiRyCBWimJMwYHukr4U27Wb4Nq+J5sim8D9xFe87yAk94aDu3FAJn7W8YjrZzOUZ1cdYcv
	n1KQhA/R6/zSDXEgq1RA8yxolpsmpiXD3V+Uw/ADal4OrO2UEu+VCRHK0bAHTu5z9I922cOf620
	Z5vNh/jHLHgXdchcufODvBrjrfP1J8GSG9qY7Vx0GGsEnaW+AWFQ57JMtSxN15CTYzTuGgedz4e
	Vn9fShBiwWjOEa16NH3yuoPeMVPykEyoi12L9jN1CfeZn2pcpa9hKf7G2q2k3Y0AE+xsw2Qs9hO
	6Z7dcCvtY8vy5a29gsAWATJA1U0R0J/sdUI6UGsjAx7HIMun98p77a8WYCwsE/TPPjMQKzl7fHN
	0/jN230FmZ8D/h+A5+3eLgGHrSLO6KPTmGwd0=
X-Received: by 2002:a05:620a:4514:b0:8cd:9300:c864 with SMTP id af79cd13be357-8cdaa88a14amr252151885a.35.1773284907510;
        Wed, 11 Mar 2026 20:08:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:8cd:9300:c864 with SMTP id af79cd13be357-8cdaa88a14amr252149285a.35.1773284907090;
        Wed, 11 Mar 2026 20:08:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e7d9sm696474e87.35.2026.03.11.20.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:08:26 -0700 (PDT)
Date: Thu, 12 Mar 2026 05:08:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for
 PCIe1
Message-ID: <jgr543ldiwhh6z2bmpyhmn4q7h5wyzol22ofvnusvsgxo7fvto@tgqgb4knvevj>
References: <20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com>
 <20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMSBTYWx0ZWRfX27zdN0s3sYmz
 WjGmu3e40wV8D/A22F1WfAWwFGAUnSu9RYj5PrMyhBoNcEz66+v+9nybZukBkf1u48KdNbGmCt6
 exVftKac+onF41O09gWwZYLzI3R6Sv/FSlKusUnK40qgDZMo2JejuG+CCT003E65/AZ/fCpG55X
 G4pCu/vS5Z5HZ3H+e1HZ4N5Uf3HhL7ZAHg+qpYxIfsQLOuut0JJJHLvnTkwFlXXfg+cXxs946vw
 Xlysaa/fC6KyHBnLZc2RdOXDHPN9pdwUKrmIU3ZMVfiFtlOKEiq82OK0Xh9yYb7ZzIy8ivsToPr
 MPr2e1oT1AfrpcE2YczeFY7t/lDREigYjxAsJSW5w50uBXc6eBThAbnAB9+9yd5BhIQ4uQn5eHM
 MHZ0YEGMqDy44k2j6izSgdGCayFB/9ugovICKcw7Amd45R6vLcnvrDYC/XzHglZD9AuI/uFf7za
 dgm6ZSFCEF9s0BgsgZg==
X-Proofpoint-ORIG-GUID: 3QpwTb-a1-BOydHNlKZqCl_Fcd9vHsQk
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b22e2c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4YHYcllqtR1fZAE5NfoA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 3QpwTb-a1-BOydHNlKZqCl_Fcd9vHsQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120021
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97123-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D227626CA36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 07:09:32PM +0530, Sushrut Shree Trivedi wrote:
> Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
> in cascade to the first TC9563 switch via the former's downstream port.
> 
> Two embedded Ethernet devices are present on one of the downstream
> ports of this second switch as well. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> The second TC9563 is powered up via the same LDO regulators as the first
> one, and these can be controlled via two GPIOs, which are already present
> as fixed regulators. This TC9563 can also be configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 102 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   2 +-
>  2 files changed, 103 insertions(+), 1 deletion(-)
> 

This might need to be fixed by squashing [1] in.

[1] https://lore.kernel.org/linux-arm-msm/20260311070408.2287889-1-hangtian.zhu@oss.qualcomm.com/

-- 
With best wishes
Dmitry

