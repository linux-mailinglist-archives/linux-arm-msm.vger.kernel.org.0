Return-Path: <linux-arm-msm+bounces-82177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF1C6741B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 05:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 14082364D47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 04:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839641459FA;
	Tue, 18 Nov 2025 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZ/OZPBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP/OFhHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1572625F98A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440239; cv=none; b=bL31SgDsecIEVKQgI9DmO5ItNg2DJTBu9cKbtu/d+LNxCmKivC4FWiOxL5VfF+DrlLCaEHNsNvtbPaDC9RmAlHNS/h2acDiBmGdbCDOAAPhanR5pUnQ0HCsePvPKeDV/0PQc0yATG4uIhwm10/ZsmuCkNCVC631JzGqS5smaChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440239; c=relaxed/simple;
	bh=yzw1GrdzJcigm0aCYVCGwl4m+lgHhKqz9BpKYqT/T1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/CkjdWYjimB8WvMQgSjiBGGcXFmKnlPixfpZ8N+BkSJ8yzBYGPdhP1q/q+xjXU1Vn0otRsrx+g/qoLNJoPw7ua78ULZ8Bs2d5q+JiTP0GsYV5FGWAAHuD3mpdDFZlzcmaR4ypZPVPpWhh3mjSVOL3Bzl92uzv4fiQSnUeP2GBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZ/OZPBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP/OFhHY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHJQoVa3671301
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RQJR728JMNm7YLg1MFMI4UGwy687LvMd3MTimSmFaQI=; b=VZ/OZPBbxboNnyhN
	6Y82o4Vx2GDZrsPrtep0WIIDeZ+zQ4K3xPvEfuH3eQWNYyOp9ggVv40hb6hdBMMG
	TvpdHGoXr2vrPplWc0IWqv/5tFikfb6AXs2+5UEOqj+fjuoINBzi2GweRw+yOfpb
	CQbDwsLiNTmX0sSzosRYp26tr1XlA2wfxGQgEQCcN/50RLNO8d6wTAlhA8MkRqza
	NUCsAJ0MWRk85QOjvoYkjcHFgd9iE5gqEQgIVjqzPJL/ymQR4YPDaYgTf9BrK7Bh
	oPsr+RaTKBXtHeUbF7TQ3ku5yyvl1bS/WBE+l8g76RT35c5PBtLtTvdOJtKEmlP3
	g+m9fA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g5apwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:30:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823f4666abso113740236d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763440235; x=1764045035; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RQJR728JMNm7YLg1MFMI4UGwy687LvMd3MTimSmFaQI=;
        b=kP/OFhHYNk58fAqAqoh4XI0TspyrQ5H/gbbOeLPcUK8ZdmjumsY7iuX9OIa8q2lNxG
         oTZm+pc9IygAEeRF2Y3Xld0mPjh2ASOmnL5/6RNVmeAlbvNQPsyWhOpi/fjAnUnN4dfI
         IG9FdCSyWWwempI1ViKUbE0i+bzX8JK9XKu1RvKCyuimx4YD5P28ovXuA4AFx+ki4hWQ
         pfPttP+fhJBctGCTai5hNmG8Q879Yl15lo41fEyMnJgVVBHDaefBPO/juaNEcmllNQaI
         ZnpqMqhLQ8xLRWiqicZnth46EXB6yw5jx9PYmNK1EP3h3T6khtOlivoAwSV5D/nHoL0M
         +6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763440235; x=1764045035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQJR728JMNm7YLg1MFMI4UGwy687LvMd3MTimSmFaQI=;
        b=VlmWg04e9jVTUyofRk0eBuBh+AHIaCvimiT1IQgqssMH07RK9DgkUVfX0a1MCLxuSr
         fIFOnr9S807VLWpayvpk7vTN82SYTP+QNIGc7//Hf48oq2LhgaPOO3Yv0oIgyEx1H9es
         dC9M6bTtdgBLExMNZkmfgF36JYHnEMxYjTarkWxWojtoHviijFn2n4kNeKjpjqLBWEQO
         G6i3LnDlcRmj8sakU4ooLOnI37JX0zBFnstvExj7Ag9gP22qdun2VsT7TSbfctkrqp+b
         CZ/P6e4lTjhXuuFAB1UGRFL0MmcaLqgjkd5CsXNJEdZDES+izbxQtioCh96J01x/l+M3
         GdHg==
X-Forwarded-Encrypted: i=1; AJvYcCVypfdugeE/VLdcRgIzWc8BW9TGglBL391/qvoP8+d/siSlt10k9T4tL2biLVPEfLD7BTi72xHx/1dpaF5E@vger.kernel.org
X-Gm-Message-State: AOJu0Yze17+M2K0dqj11aRp38dlcXeWohuyFBjcJKCn9Fc76HL591cuJ
	Z1xja/fXDvIRXDKgfVt3EfILpn99/0MeHtmm54FlslEBcJ1MxiK3C5k7eg06RgfbPJ2cB2M/VYE
	JilSs3E226e+mUE5pvMeUP8OnLlCruT6deVZh0WjzDkS9yb04oDe8eCsEc69wRIdk1MfJ
X-Gm-Gg: ASbGncu3Ftqx+WIiTAtGvw+eiwO4zgJfR8lDJjwKh/LWMz0tiiW69K/5p09Pe7+WT1j
	6DyIExjEJw1LmzpuYYtF5nim3wIw9W+3OZTMQ8/UOllzDB3yIaKFITN8BB/p1b/I0C6+mi5Axd/
	wXDh6M/ySC6oTJ6mIy1xjvlB7rNk9YPNSpamgjjnW9RQcqpHm+0ShfskI2oFI1Hvo5w4smkpq2A
	kV3iPSGD4K19zAP0TpDJFLxwAGfbupqGiWZBxgDdEnz3pxxqvNEtBKKTbEtH22xmaOCmGWUTrkY
	Wfhm+F55wmKsTudeWmSMYuqWCtI3FF35Ow4+eMP/E3VS5YlklXBXnooBYHHrmq4kGj00U1ZuX8r
	+wlg8N2D1wM1Yh8qHA+MbHRA8Any4OFqeT3I61ygWbC0OLCimbeEck4hd7DnpsiJhhmmSnfy4wM
	F4kBwIcp2leWgu
X-Received: by 2002:a05:622a:49:b0:4ed:6e79:acf7 with SMTP id d75a77b69052e-4edf212a433mr211296901cf.41.1763440235456;
        Mon, 17 Nov 2025 20:30:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi1Dwkn9v+3PQte62EIHoN9RnD7aNElhuqtkrJPAElhnS5vCrYuccx/wtlZxkvqHwY94rDnw==
X-Received: by 2002:a05:622a:49:b0:4ed:6e79:acf7 with SMTP id d75a77b69052e-4edf212a433mr211296681cf.41.1763440234969;
        Mon, 17 Nov 2025 20:30:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003basm3676196e87.56.2025.11.17.20.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:30:34 -0800 (PST)
Date: Tue, 18 Nov 2025 06:30:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 4/4] clk: qcom: gcc: Add support for Global Clock
 controller found on SDM439
Message-ID: <6kzcwl4jlsdnpnyafpdhzczx4olckjou4jqt4ho2dnjfm7f3ga@wszxnzk72hz3>
References: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
 <20251117-gcc-msm8940-sdm439-v2-4-4af57c8bc7eb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-gcc-msm8940-sdm439-v2-4-4af57c8bc7eb@mainlining.org>
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691bf66d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OklN4PO2VwZmQYoFi2MA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: CZelm17hw8BF76Ou5Ia_8IGNJ0SieLcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMyBTYWx0ZWRfX12cZzgSHEsNS
 CPwtmPEeVzjha71JX5lN2o0QHoDLcjDJaDCTe1ALVn0NSFkz+QEtNHFrNUUeNIRF6a93y4P3rQV
 iZZ03PoYQyvHrIQaKNMr3GLuhCqGnUzVtu9P0+dIMeFL0uFLR+ZDydvNFBam5R/lMPLgtdBsRQb
 uqvvNX3USh2Hz0n1OXZHvni8wQZ3E+GG/EG0y5+rve66KWAF1XP5uc7687BtHq2r+bElbK4KIyF
 3Z6Ed/WP3UGTZ8HsdIc25snU+4iXRjLJon3By+A7ynALepWOaAU97R9/5zRb9aXalXyttowUxtH
 k1aTYq3qqLk2Oc63++AcyjAzT5JOvYZwHoZguMdtWQFmrYp6nkMJ2Y+ojp17bR2M85zEFAQSrrt
 gFEn7UALWxGMaeS/ISwxeOxlCVY6Tw==
X-Proofpoint-ORIG-GUID: CZelm17hw8BF76Ou5Ia_8IGNJ0SieLcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180033

On Mon, Nov 17, 2025 at 05:57:09PM +0100, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support SDM439 SoC. SDM439 SoC has the
> same changes as MSM8937 SoC, but with different gpll3 vco rate and
> different GFX3D clock frequency table.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/Kconfig       |  4 ++--
>  drivers/clk/qcom/gcc-msm8917.c | 49 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

