Return-Path: <linux-arm-msm+bounces-80474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B560C37030
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 18:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DB1F501742
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 17:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0E533DED5;
	Wed,  5 Nov 2025 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pv4jYy4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyyjwFBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4BE3203B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362182; cv=none; b=Srn7wfCBiNTYekEhdbYHzG6KCPWSsPAVHr7og1/rSfBYymwvlytUHyk9JxFZ2ajlQViVUQyHyKUAalIzRAot0SGHa4xrlBYeZLBBOF+Idzb01WQ3KpiywLlerDSICJvjU9USJt6AFro16rpcVuaRE+Hh1VqGeEA10BY0QUhlok8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362182; c=relaxed/simple;
	bh=yp/bnWLHfETEVmldtVZrLCIHTQ/Vp3q+ORHES0tz+Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1fVLH7As72iTEuEfYlH6E/re6EzoLSk1y9qRBQturASgY6N2K/ORA2yq+8LGgtySzH4p+0gGOefigAgkrkQylulWfgGq3pBCdVjfsZ9W05a1SZhdMmbR19eyYPlMXoHeG6DhagpunNZWilyStUhx+sXIjvCh2Frpur7uheg9lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pv4jYy4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyyjwFBZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58K3N93164678
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 17:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qyYx+66r12SMj/Ysz7zSUgAk
	oAonFWXlCXbOfXMij+Y=; b=Pv4jYy4I3b11wSUZ2im4uhyPzm/y+/stDpujl6ae
	SiNWLdcpi7Q11oQzcyjYzdYjIyNIV9TfBlxMNfiQJ1m+PJN5mUZoWSts3JG93ksJ
	UBkjQ64EkRdw/TMWyHM8bKnHGJJoYMkvYhUUNBWWf2IlinCVSQ6AgGl9KTH/WLF7
	F96b115k6lQXgRqyxp0hHDslt+Jl/+fl++2atmkU2kQFupy8OXAjI0Z1EvWZQprn
	Ktq5855P0EPs5kZjpDbjJP6/SRlwqS5jEsZDAK9b3EtlPjmjjn2M5EPrG6ALcTzN
	sOINubAo76eS/2Ob0dRw+m7S7oEbjs/Ltq6M46oKW84i0w==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ketmb0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 17:02:59 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-786a9b0d282so12721957b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762362179; x=1762966979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyYx+66r12SMj/Ysz7zSUgAkoAonFWXlCXbOfXMij+Y=;
        b=CyyjwFBZR8CJgkYbX9pRCeQMX0RvebEVsZ3DH/vNCsUr068EOIC6CYNQBW2htbfQX0
         OTmYjeAY45MsNeGFHexNF2Qoq26YYm4RuHLQLyvTEnSHgykRTsSzJ0TVnKN1760nY1ek
         tYoav20WxbomSu7nuSZ5xkQGmcKFO4A47oIcyJGp0VT32RFyET+t4wQgmkJlhfnfrl/R
         6fgwufYKQBTg4VJ0P5CAM+z4KNW+dSqsTqfZa+ns87ZUzrUkvoGw5/d4lQfBD3Oc8sRI
         hJlUw7jJKjXm1zNkR0BX5uhLZn6bGCTLYn/WSqBUbbWpCfozuMA6cInpPfY6TLeIo7uj
         HQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762362179; x=1762966979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyYx+66r12SMj/Ysz7zSUgAkoAonFWXlCXbOfXMij+Y=;
        b=EjKaObZ4NQLfwuXRh+I+N0wbSvkP9GALEYo8KN4W7IGUfxceHGclb+OPfzLV/l1wOv
         di8iSTrPT1DflYY67XmLwEEiVAaDniwEUSB5JbseFRQiqBdEDDpMbci4oHEaeFZBzczs
         PNYECeklOntimKsE3pLFCWPq3lzk68JoBk22Yf+l2r7hqCCJPdwHSgzXJHNcAPLlSBol
         URCCIfE1Rm0g8CxkzW3fs3u/MFNqEsAZHDwVKfTsWIYwBefjyzsgq+wXaRejWWUKcQED
         WL3A6PNeDg/Uu4wjVIn1A4PxjxwdInRunze+Jh00OQEwXXycAUgudNuca1bHG1ZzSVJu
         ft3g==
X-Forwarded-Encrypted: i=1; AJvYcCWlGs85k7ABBHeGFgPfnB9rw/FXfwP+figcacxcTGyo6OBebOINWqZXIt5+smGXntdOu8hJHWRHizbpCXEE@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0dvUIVyjWvJ0siqOu/ebBn1zLixW1IJO++SvsuKTX99zRIu+
	W3CTefuZTahI2o166+CPKe4Z/l2nQc8Sh8Ehm9GF3wevV/1qH40Sa9h4B44vfn5h2B5tbVMdbdx
	L5u2Dq0A2AlgRBJHQBQ0aXSuHnxQPKD1G6FWdphdxCSitVUIikYuwQrxowq00psFWBQr7
X-Gm-Gg: ASbGncuzPTKjHITiuvDRqhEfIK6nkdsqqYLqQRY1ZoqNtrvsg/9R6Sfva8KBjnexMQr
	Y38yCYHqlJk24p7XHu+JvENGiUWmGzQBFiwD/xqzrEynG/Yj6OHeiKNF2gNaTnwXJ/ZZY6/x5oA
	XEz3z+ufbPHqWbk4hrWyj+w6etWvOF+lpnFQUtaFqWxsjO9PJfXqshM0p5d8JCWYIGw+xLknIMm
	Uagc1GIZN/KnqLpmMAumFTTNIDsHdZjvTW5IiEn/zkfQ0qTp8KK6foT3MGTQxtOwZ8qctufjN7N
	3pBggV7nZuVpZ+6Gpb/3cGAbLkDYmRyX1bEFjoIixtpTVUMhsj/b7+Ygf2xc2B9sWuM+RyWVu0j
	6tSzBsVWN+1p+OtFM61/OJK1f2xPHhjVcQe13ZGUuP7vbpNE/ca0tIRvmqqXja6jdP8wEShsoze
	HbBhs2+ICMD9IE
X-Received: by 2002:a05:690e:c43:b0:63e:3099:fe7c with SMTP id 956f58d0204a3-63fd34c50f5mr3160661d50.16.1762362178878;
        Wed, 05 Nov 2025 09:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTAmyohmCTXGVTToGXMGdUogTSBLrIX4kz1aq4q66xM2USJqaQ352zw9xnhAw2RV1nJjCJjw==
X-Received: by 2002:a05:690e:c43:b0:63e:3099:fe7c with SMTP id 956f58d0204a3-63fd34c50f5mr3160583d50.16.1762362178181;
        Wed, 05 Nov 2025 09:02:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594492b411esm34691e87.105.2025.11.05.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:02:57 -0800 (PST)
Date: Wed, 5 Nov 2025 19:02:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <motuct5ezykbkta2wz7ek2vwnfaamphrl7b2wpv2bvu7qnnbmc@4j4aurlva4iw>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
 <20251105-a663-gpu-support-v7-2-1bcf7f151125@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-a663-gpu-support-v7-2-1bcf7f151125@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzMiBTYWx0ZWRfXwqYSpy0ibirw
 KXEJd58dS7rXL32hY7cAmITBamid46N8mOsGWc2egQAWEriw+co+pr4VpLrYhX8UqRwmEIyvMnU
 H2iN9JzN7KogsAffaOrGZqKo+TqH9ifavQuswndmhZQGIvCzf3QqZ2dMmRNn8NUEzxprw/pRQBj
 HPKjYMTAM1p/2R1YexzO/6L3guIfrFxDbEfLKl6k73pdALvHoAWHrUbqb/lTeN7f6NeN/xd9umE
 YH024DdzcxvQn7CPAdZesQFNt7t8bsK9osOnZTtQ68Zvo9DyPAMnjTorJP5HoMmlEAkJM4W7Gve
 g2YhmAgMi/8tUQdAQfVBxeen7++MDbniJ/X1S7qpydTPpSmiJNxh/gQnFuTd7pgi9xI/2AIpqn1
 oZVauQtrvfDBAmeq5FM3oUc5R8YPvQ==
X-Proofpoint-GUID: 4MPqjIpY-B3243lse2ELtPe5lvPu1gGP
X-Authority-Analysis: v=2.4 cv=IdSKmGqa c=1 sm=1 tr=0 ts=690b8343 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9
 a=CjuIK1q_8ugA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4MPqjIpY-B3243lse2ELtPe5lvPu1gGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050132

On Wed, Nov 05, 2025 at 10:15:46PM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.

Technically the subject should be updated to use 'lemans:' instead of
'sa8775p:'

> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 

-- 
With best wishes
Dmitry

