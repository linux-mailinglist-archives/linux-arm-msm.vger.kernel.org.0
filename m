Return-Path: <linux-arm-msm+bounces-99732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAWWFGz7wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:00:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9531C9EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7821730B4638
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560222EBB84;
	Tue, 24 Mar 2026 20:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArYV2VJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9dWchMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF8324CEEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385671; cv=none; b=g5RT5icsALGafgL1vR68qkXEEZATnuaOhDipdtQi7PnHLStqe68OCQjXF+StQSmLoZM40BHhw5/lj/fDh9d94idNQdCFViyUONvHrhpbctpw0SDu/Q7+au5IwJa5KEmbh0AeVYet/6Pn4HOut8gTH8xRrDJzqCFLMACcd5JF8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385671; c=relaxed/simple;
	bh=Z8NlWAS8ibWrW+F1hqnwN7hUxPRmLS9DxyojjSXY4EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xvg9pq/JV6dT3KSDpIcDDZz7xPWEGeCwhPhNLvKCu8QtQjWDgjH4ue3EnrlREFN5h3Tea7qXh56Z+x0NbkZpiyEX6CXm7rhMaBg8VLrw1FHKL/S7suaqTB4JOv9tdUw/V9htEkrmvivc3Zca4YqmHEYAeAP6RQiqAsLbvyX+mo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArYV2VJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9dWchMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCePK989019
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=416fKEesZoc7uRI0P7P5Lb7s
	vTGvf9yskNjv5O78rw8=; b=ArYV2VJTkIr5mRa5iUC/RuadD2oQBMMGc+Nlt8MS
	LljjJm0yS35LulUhCu53i5hyu8toL2JeHCkBhbpNdv/ce8ymLawvUkvFlSFMumVC
	tDd1EFFKfsPxUCOr6fX3YfUxAElhkLYuXs+VUUy6eTdVdHNsRmKmQyq0kTLTzxJH
	pkmfsAo65Z1FATrfbMnbjqFGvN7IJvBQE89dbzbZqVLo+jc1ysEA0AYpAJsariMn
	a0C5emNJXZIwlbcv4EbLWJTDDE0kXJNZgX3Aj6RKXKCBeS+CQAyeWQgXcQeWPg6z
	J2aMcVA0iVkV514YuvyijTM6DyL0Tni2jPtCpcH8a8WWzw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m1uea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:54:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b92f327so409162901cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385667; x=1774990467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=416fKEesZoc7uRI0P7P5Lb7svTGvf9yskNjv5O78rw8=;
        b=e9dWchMivgi9OmOR3I7jZgUyGr2Rp4SYoWrpozR0VGuialBK0+7aousc5yPO2b36q3
         RTWXRBuZxzoFEEk9baKTulpHCJP3THYRv5yo8ECmLB7SMzhqM+e4rzkR/GgPG0KH/5G7
         R3Lz2bDPLFk7grCo0MQcn547gSRU+s62OMu5ApIwHU0xGTjmaPTN2RYLu35cK5tEpreE
         CRR3sqpwLtZahasplD77BL9gqOJ5rspNjiTT0R6+e8jctkX6NSdV133zGtmlXhR6whxg
         1EEfopdgAXOusIXbR+6hUKK2JVIEwp+S7W76DJOdI43wnwxKim7aIPFXWd4ScvHW1oLu
         GVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385667; x=1774990467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=416fKEesZoc7uRI0P7P5Lb7svTGvf9yskNjv5O78rw8=;
        b=VSv9csfGpfQVhHK35sOlYgnMDXiOs2DfxjDImpoIDpxAftJCRXIo5TzZK2QN94yo9H
         APY/JavK6f8F3AMiQC6OSDvVGHgTFJS6eUEQeHI1p7QoKwtZs/JtFO93F3t/Fd39HZGY
         lUHAVcQckDe5GX8ZwClRr7EU78XZ5JV9GkkIOSF4c1KDpGIvKxNpqj82dD/codvvsHfp
         uSUDele9oyRjfK6dNW/m/LfOJAfxQLo9ZyAVzlBIczK4EN5zV5ZXIlpelTMfnb8o1u8+
         NjxH+u/d1r1bZgNsDhkiTYTMEOV3fVmEMl2gBIhUgdBWloTcp+NzGJfQViGDAlJreZ1K
         ts4g==
X-Forwarded-Encrypted: i=1; AJvYcCWdRrPVLEXS5oGaFkx3yUAEUS2eJVNuPahcLcjBdtFx/tjzYlidOfLSy7hay6oU1B0JZuY+GmYkW0t5N3m1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl6++nfz7nu5lII2E4YDrzT/QxHcIoLmJmDmW2olSw15EfzeeS
	VaIP9D4zetrzaXO1/h+cvPSaWzInSv/fHuu0Y11jgQ+CmH6ZDCuTc553aY5YhmpmBnlYC0SFItD
	b2xOzrlZsBygvE4LraKWyXEYOqYmFmiA6KqXyjd570R5hh3elrHFGpwNTI4lLDDei6hJw
X-Gm-Gg: ATEYQzzCDzh9K8cNwwogrc9Fc6raQGxEW7DXpVVi/VJCwJl4VsaxR5uHI/LvAAKvre1
	RTeyGbEnJM0N7X5LhrbDLwKwg98aYhsq08rI7eBGmqDchy7Ez9xKHFMEnMNiqFvGIQnVuuy11/e
	h2bJqdpMAP0ZsfaFuCr1nsmUqtu1VModuyy+rsBo57sDVc2GHy73l1+qBrQr1w1pRHhgHGArX0Q
	9uMud3FFZhOZVe7J0TGEMcpxclzynYDvhjwNdk/guDvKa/ZEXdgXHkhD5vOwyAYfhZzdfSt+LBs
	O3fjK8RUr3TwGXsdvUdoKdoxDez1IEPRl6Vn8FTbv+DxWOEy40D6Yi057SLkdXGmtRT11TWlRhC
	sdso3Eh6vyJl1Ko95Th9X0A9Yv/A5g2ChyBvHhTRsRLbZd1HKGLgCwc8//6TjkZLDDj9JWzrVEP
	D9QiZgMsVFJ3NEg9Wuqxd0JIXi1WVfYTfjcGo=
X-Received: by 2002:a05:622a:5c93:b0:509:481:5365 with SMTP id d75a77b69052e-50b80e63242mr14891651cf.50.1774385667380;
        Tue, 24 Mar 2026 13:54:27 -0700 (PDT)
X-Received: by 2002:a05:622a:5c93:b0:509:481:5365 with SMTP id d75a77b69052e-50b80e63242mr14888691cf.50.1774385662062;
        Tue, 24 Mar 2026 13:54:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9753c7dsm36218071fa.13.2026.03.24.13.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:54:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:54:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Message-ID: <i73fny3nxdljztry4qn3rotjtrjnlau7oxzjfj2bfsox42ylti@lllrvsc4eyum>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-5-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-5-3efe59c1c119@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c2fa04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=b-WZSYoPuCkCoMZxyvkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: BZnQ3Ym9YZBKfJKyf_MgqOm-mgsYT4id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfXxv49OirAXtNV
 5wvnh+FC5CvPjZQ2Wp7BnssE5rLajXA0jkFBh0PeqI/VkVSCcc6mMuXOGnoXUECZffNQFECQbQN
 1Zzhsik9oa4lxkP+10yvTnvLNA/EeXpzMivEKRbZO2hRSr2N//Whh6FetGMA2wnKXDgurzQ02QP
 n8Ovl3fH+zR9m4ezbuvgZFck7DL8BZ+oCeM2S9cK7x3//J5tUwrOMaRCIbGQUuchB75m+Jk7aoD
 rGOm6e7ZnGdQsJ0lQGnxVjvtZXKGOevbpK6L4nOA373us3cKm5gRXBt4UdF+fbp4iycVEt6NMyK
 LWTCaR7q47LgBucd1esLRQU7pEkjZfF1BZ9IOU4msHwYwDuCKxt1pFaQz/cWWnz6r+T0uLrxWHO
 OaKjAz+oYbEjo47SNy1S8EGGqS0Ery0a1iCfP0KFi87u+qObb4kYxFbvucpEbBxdTX3RMJKr7ZC
 MPRDd/TK1CwkfLlrpZA==
X-Proofpoint-GUID: BZnQ3Ym9YZBKfJKyf_MgqOm-mgsYT4id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240161
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99732-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAA9531C9EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 06:43:22PM +0530, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without it, the interconnect framework cannot vote for
> the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..9a44bb3811a7 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4312,9 +4312,10 @@ qspi: spi@88dc000 {
>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>  				 <&gcc GCC_QSPI_CORE_CLK>;
>  			clock-names = "iface", "core";
> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> -					&cnoc2 SLAVE_QSPI_0 0>;
> -			interconnect-names = "qspi-config";
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QSPI_0 0>,
> +					<&aggre1_noc MASTER_QSPI_0 0 &mc_virt SLAVE_EBI1 0>;

As you are touching thse lines, please also switch to correspodning
QCOM_ICC_TAGs (and I'm not sure if those should be ALWAYS).


> +			interconnect-names = "qspi-config",
> +					     "qspi-memory";
>  			power-domains = <&rpmhpd SC7280_CX>;
>  			operating-points-v2 = <&qspi_opp_table>;
>  			status = "disabled";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

