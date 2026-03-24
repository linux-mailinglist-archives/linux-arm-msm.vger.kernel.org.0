Return-Path: <linux-arm-msm+bounces-99480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMcgBGDmwWkYXwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:18:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 674533006AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CAA0307AFE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1197366074;
	Tue, 24 Mar 2026 01:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcaCelv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0SdPiJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394E36EAB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314778; cv=none; b=oAXoImWa00ALSX/WteOW+HfPymPmuhtyGwAYzqLawMXjaFGyQYzeWikOy+V4bDIlrBJlhzU2H+Yinq3ZcX/RzpzNTck7PCgXJrUxoPBe1DDzmSLo0FL/FeHxhY9Bf3sAC4l+ktFbufiNnLzLViwlH0FapGKLwt5Oebw31lls9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314778; c=relaxed/simple;
	bh=EHVTDvCGaf1n3/250js1GMFPx+KIr6aw8SlQF6ZRvAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1Ht+Zq64uhOKlsBr3dLzGfmyTIMJhCBCkuki4CK2qoQFyAIhKLQqR+d6skA8MgER2xwS7ZzeEEc/ecUyGU+XEdLusSDc9QuO/jRxhQ66UKQYNZVbTADSm7XNTyXrWOoYIpQWb+9zFAtZqQ6nMgT2QEc5J2YpFaMB99e4SvSJ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcaCelv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0SdPiJn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqkIr1762295
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8C5oIC1HEyCh8hz5jfrQ45XY
	Oti0XpQiafqzF/RfHQM=; b=jcaCelv9pClJ+E8aqS43co/zr1z1o5IghiQ63jKH
	mG6g4Xi6MM1PlDPd3+3FJ+64o/5M6EsQY4ERMWH7yquqFqE8her2cl61/4yln9WB
	FFep2hHfBPHii01wR4QYcAYOfCth2/241uRvgA4Qd5G2f5lskBb9515fg2Pn3PIH
	o2uIZ3hqJjlBBsN2j1hAKNkZnzQJeRG5XBokpktOeIxP4WdTOyI17eES91Fyznze
	u8yCD7Zk3mKRPK2cRB2EP4SDelUyrB2HRmaEOYFz2iqNi68fS7nbf6HkNJA5aNUr
	zJj3I5M2sn1Igi/X9ZxVdCfXMNXhAOWUhDil18jSkzd2Cg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0a6kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:12:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso47382701cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774314773; x=1774919573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8C5oIC1HEyCh8hz5jfrQ45XYOti0XpQiafqzF/RfHQM=;
        b=b0SdPiJnZ8cT3UbKZLtd6oyW8KrMyEmTXvvxoVptDgtw3K+DQIe0V0kd7+XLtt2ZjW
         2OQ4PRy+zlPlPMjCS7qBp9oDqBSQIX+xcOjzq6NoS7MWphfNuwhm9XuYxxMmpM+aTuET
         LzxmOcoTLTY+ZN77o8yPjAVXXz+X3Cyj1E7iFVDCJp2Fve7fk6ct344zjHD506FAl1Wv
         5yJGCkL7LyyzfSxZSSdJHGlKulftiom5x5HGBs1ZtWDsIfpk7IHp7dp30Oj4oVaQdYWC
         m3IlvIkYPxMkRoiL8Tyv9cBvJeOAtVbFrmTHigG7YNMB1vi4FvkoFz5zI16gsbJ4lqXM
         j4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774314773; x=1774919573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C5oIC1HEyCh8hz5jfrQ45XYOti0XpQiafqzF/RfHQM=;
        b=E/g6/w0S/J3MCU2AygdjvgPLek7g+7KH1uIOWLuHp2Q4YuEgcr085GLZe1S0aVZ7f2
         ZWv46mkCJcwgT9U4rl12HHKE5oALAvf1hVAsL6B6wG3aNmpT3NeBniRUcvfsU/0WfIVx
         cWOL4v6udRGBGqzcBpt7At0aof8L7gMcC07hYCYAWzA7H2wPnLAyb5We1mu8hi+Zn3hv
         e2D9Jzf01qCIVFgqViVLmheCDi+mnvWeoWW0qRa+8pYI3qwU69qGcVSPDEDOb8lvFPeA
         xnUXl84/0iD0Qcje2g7l4H/gdUuEVaULG2kEoZkNaEposiPEmDNi6mttV5OdsmKDMznD
         muMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvv5n2liTr0QfWM0F81EQcZzS6w1THwYWRZeROrETgYETuOqXmg4kXyD0yw0+tLHMuP4NosWPUVRK0Q+YK@vger.kernel.org
X-Gm-Message-State: AOJu0YxY1qRAlmuw3DnMOI+9t7aqGQt28wQ6GNKnfXCwf6RKtavv0oOV
	dCs6GCJJzU4+Zfc3E7blqzNLkGV3fveHQUMx722J1PbRH08/Yv7hATeCexA6+JjcJCA/zilDkO3
	af5ZUaHvtlqSWaSF/e4w0w4KbDFNqKbL8YglsPzCZGsZophbGxEksbYdyykgKag5A9m1X
X-Gm-Gg: ATEYQzw9AnAr6RX6uZXJ14cwZ39rdgZXs9QhFJOVWwxGfFsPOLZQ7PW8GBb0snpiscW
	SOnuPynbezUpqcGDG1pJUSl4wocKH0BFuDe3cKsC4onpxy1arZXZjBl4lc2jgwQ+ls8Y6on/323
	4hNWYpQ4O9lsIU3VNDwbTV9O4X3LTeDl9xJGz2rLg+5YLEJ7j+wsKRNYMRwtEUKfnBVGy/i1u03
	svNG1W8akycRbapOTubFJPJwtadrNZW63NK/LJ6cHh/OJHhgVFaJE+lb/qaVhoWD2tQPAEatmTO
	rUsWlc+t/YhSY/iasaZzpy0PDGEO/Lc6Hk7vm6CKN50AD0IDTsYXarjtntP+FEunL4TI6eTy1dl
	MObma4VTvzWmBrhp0zZTKvedvo7wl3iW6LaJp7RsGDw0qkMpuJCMRrJgqeavPhjuzYq79AyrMBF
	1SuQgDnclChWBOR0MoQ9fc3O0fMkFoN8rLuUQ=
X-Received: by 2002:a05:622a:a28b:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b373a033fmr199684381cf.1.1774314773054;
        Mon, 23 Mar 2026 18:12:53 -0700 (PDT)
X-Received: by 2002:a05:622a:a28b:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b373a033fmr199684101cf.1.1774314772582;
        Mon, 23 Mar 2026 18:12:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf975e9e3sm28139151fa.16.2026.03.23.18.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:12:51 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:12:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: kaanapali: Add PMIC devices
Message-ID: <3u6yfqqcxrmf52dl6xxvnrg4jtmwekpm6n5t4p4ujead3urxqg@dognueejo7hk>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-1-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-1-70bc40ea4428@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c1e515 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=G95pKlZTSomyLyv_dk0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wDqBaIFUtCx9i8cnAUKwnfmjUU9dscO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOCBTYWx0ZWRfXzcz8wGOC8Zl6
 ufAaYjOcLUCgZX6LN7Q1MXNAEPUbgQPZzoWg71qvc02GB8GTQtAiv/pAXlqAyi6WFMxHF0DsQXS
 vRsaAmUocrMhcNp/TaBxr5ycnvwMiYj9jglClND2AbxTLTqs9JiMw8qnwIPimI9YH0efnejXkb6
 svwhrRGF2m0J2nOAjU2GkKzz4bNeYIbQLw4S0a73RGCK3w7EPscp90uS3IBwNrLtMjA0fAZNjzp
 CXxN+g3gs7yU0WvUgrqFts9jgj8tZidkif8FNS2ISnJohYcl/bmorccO1oTXHLJy3iD67ehypuX
 saUiFz/L98SeTXFPMdNMDTBmPJ5P1lYYjNbMWdbqLnc9YU40BNAfHK5Uh32R8e/Fb9+ZC8SCnvM
 zpp58jhUFp35eudIElyseqYrs4dDJM/QPO6mNUb/lFWI6eKEX0fF8XA1tFXCqWPtoQq506MmASN
 g4pNRb9/Z1CPSB95pEQ==
X-Proofpoint-GUID: wDqBaIFUtCx9i8cnAUKwnfmjUU9dscO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240008
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
	TAGGED_FROM(0.00)[bounces-99480-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 674533006AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 11:19:41PM -0700, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add a spmi-pmic-arb device for the SPMI PMIC arbiter found on Kaanapali.
> It has two subnodes corresponding to the SPMI0 bus controller and the
> SPMI1 bus controller.
> 
> Also add dtsi files for PMH0104, PMH0110, PMD8028, PMIH0108, PMR735D
> and PM8010 along with temp-alarm and GPIO nodes under them, which are
> needed on Kaanapali.

"Also" usually points out that these should be two separate commits.

> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi          |  47 +++++
>  arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi   |  93 ++++++++++
>  arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi  |  62 +++++++
>  arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi  |  63 +++++++
>  arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi  | 213 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi |  68 ++++++++
>  arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi  |  63 +++++++
>  7 files changed, 609 insertions(+)
> 

-- 
With best wishes
Dmitry

