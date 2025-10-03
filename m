Return-Path: <linux-arm-msm+bounces-75956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D819BB83F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB58419E3608
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC8B272818;
	Fri,  3 Oct 2025 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRvTdwQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789E826FDB2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528676; cv=none; b=CN6Aw+j3VXy7iZNP3Ck7I8scftZy6rTElwxsQ/Rsx/FyseE8mwYfDs8YE3yz8LXPC2KligMshnXFTIah4w8mlhdJ7XdGcopiI5Pir1jRkmHRK2es5yxxCTK3oEPIe2/wBg1QKIwktiGlXOTr4iFJ4N9FPYDEGhKzb1vZUSuI2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528676; c=relaxed/simple;
	bh=fEzp16TZ1GnYDZ47twnaQ+dNb+URfspzX8pj/3MILLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORxQ6xelh9q/xCMP81WOh5ghP+3+6MOvuOTCC8z6EzNtsMl6ru2h39OdlLjwAGTy3OYwPCEz9t7vO05anz+A9+Xkwk9ECISb0Ms6FNBVU5GusZVOnJ0Bbs7XXY7GJRvAChfAJ/cFdj32S6FaIbVys83MUhN0zX3nmZvEHspgAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRvTdwQG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593A4Nu9005988
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YNYMggB94eeV7wT4wE4M0iJ1
	TwWVtN6gTYQAscDX/bI=; b=pRvTdwQGF5SCPIywI8X7hDFjxZS6ZJdKkPiVUjrC
	+ZQxBfLqKgPCNSkpZyQCpTU/yLK1GiT/Bzu0S09hC5HvbhbUKtkOJlYX6zfhUg4n
	3EjHpqsE5g2qSIkxReLU8fHJEetvjd+0KHBeuSX6qIc4GsRq9AEKcvBeGMW6osFe
	fwkhjIuxfTBewppb6xrRPtWYjS/wX60GutHoZ5UZAq9Kq0poftxmncWcII6gCHV5
	KkronXCkdTKtDdmgw10QPFFvTyVNjzWPRtQCUsqEbhTYvrd+N+V8aCh9SSjeC+Am
	GM6PRejg88ZLBrndTcfZi3LPdkBdS8SIq8G4T+TquldA5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851v319-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:57:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d7f90350f3so57151771cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528673; x=1760133473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNYMggB94eeV7wT4wE4M0iJ1TwWVtN6gTYQAscDX/bI=;
        b=wyPTkKh6zBPtBkCswvF7Tra/l8kCOX6z1CrWOQtVEYBLTXHyVLCknEKaPUqVxQ7lVV
         iSoLLU55xMccn79rPnBOfsI9s3RXCR+7g9DmVwVlSB+lmhewf18w1/4PwLHrsA5OcDqY
         WBkRWZggwiu+HpGRB55Hw4gy0dmJFm8c6bT5Suoxy8DPjZ7hMlgCEDH4HCjLdEwUkS79
         iBABZW8fCL03AoaS0TJ4cTeO59mTig2NljwE5D0sizd3VKbNKKUqyK0fTrqVUYBPZ8kz
         CfPJr+LBMD71Ao3CS9z1slXsljtTfUMstE7dedB/Q/WW92qoZkew6QjthyT0M6yhBx4r
         cKqA==
X-Forwarded-Encrypted: i=1; AJvYcCWsrdwIFClEqgeo3sEVzgN5MMeHyjQbVi6pdpKWyS/YMgmABRcWkqvhcqbMvep+7X/Kvs1+XH4RR67+TxRq@vger.kernel.org
X-Gm-Message-State: AOJu0YyTD97Ct2ILFuxzUIpPB4/gVScoS47vzshwNn29+LksrLGCc36C
	ER7gn4hzwfBLuZeKMDxfN+fuItqreSzXcb3T7+EravyeJMVgaN5kzDMec04/vC4z/mUZCivc4Xr
	JLP1+950ENvNPQlKHp9Wodv+kfypPxMZjo/uJ610pb1CmBlNVVyKPSgLYtSNVeYqisxx5DF1A/+
	5N
X-Gm-Gg: ASbGncs4pkv3teJ1UXIYtcbl2wRFDTtVqDDlN++gzNBJrRmrBVhwiQHzIwDbz7qB9Bm
	eB7C9NI5ncwkA1dSD16y4S8IxuTwIj2Z6cVhR5xiTn2iNAqc4V+KDUC6B3BB10vKpM9/OoqrzA5
	B+WXZg2Pc6FQm8ZL6oGCPq/6RaHv3TePhH5UPvaSHNGvr7x7JOjZrk6nUsaYB/qSEviIRUi+NPJ
	/fmaP+othStql6AuFRnFDXxen1PcCvv/7UWg6DfYFvN/t/hxjFwf1BUF0g/RDmiXTukKX7s3NB7
	+N/raxo3pMKdKeCinrPm8TdabbSeRtHHcX/94FGOg0bHoTD8CNtzxXi60fGgK1+cnGwzerHdTL5
	tIE9pAF8RiGfmWHDVhGb5UzwbmaU81LrlAjvmjZzbOExsLvYq9orniV8xfA==
X-Received: by 2002:a05:622a:1a16:b0:4d5:eedd:6882 with SMTP id d75a77b69052e-4e561bc3998mr113526801cf.12.1759528672593;
        Fri, 03 Oct 2025 14:57:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmkOEk5qkYNgMXsVNq22E+jGt6uwDR3N3MQN4CYMlHhgek+PYfOCZ0N2MlvGdN4IjRHbZGAg==
X-Received: by 2002:a05:622a:1a16:b0:4d5:eedd:6882 with SMTP id d75a77b69052e-4e561bc3998mr113526611cf.12.1759528672132;
        Fri, 03 Oct 2025 14:57:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba2e3e49sm19125671fa.22.2025.10.03.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:57:50 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:57:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019
Message-ID: <f3ofbmp6w2rthiapu22infn6bfoeancv5l2azapplpniwtr44r@ffrakyzsjody>
References: <20251001142107.21860-1-newwheatzjz@zohomail.com>
 <20251003131925.15933-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003131925.15933-1-newwheatzjz@zohomail.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68e046e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=WV1l7McVAAAA:8 a=jRjEOkseAnzkkx59WGkA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ly-PvpxawfTmY1UqWLBn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX8D6QZwzymOEg
 K8LLp+e3naEJNyr7CD+94cOdwVzB8AIfFZyi6SMGBD8B/VCVjLWpAZ3MrU1xuRHVDl93VDeRr2K
 8BwJaAsvNZqo7Xo6E24qN5/CF66QIJSLzD58jK7pTrLJ2z00OVf89twBUJlz4C6e1mH+B8/J7ym
 jAjN0Kpp2xJrf0tsSF6ErjPrkUwhskHuz2j4gx+MBtqENFwkVopWUTMWJQJARS+sIirOqKNOAfV
 p2+Ri5vHOSaUrh6V3ti2vXO4kf3r5/z4FWSFacXsh4+o9aCa7xqOOm6Mq6gO8ifOK8eXosm63Qv
 buAYRF1OOiXD6WmStx0WFh9IXFlEgSbPBweJHXx74gAoL2E9Nod5V3Qp9IZgH9XR9GGoH/5Z84M
 eagclxxLwco6KJqDCzZUUHzuiL4fBQ==
X-Proofpoint-ORIG-GUID: IJznpjVVDvQEZtmJ36B0Qt_FWua5bIdJ
X-Proofpoint-GUID: IJznpjVVDvQEZtmJ36B0Qt_FWua5bIdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Fri, Oct 03, 2025 at 09:19:23PM +0800, Jingzhou Zhu wrote:
> Huawei MateBook E 2019 is a 2-in-1 tablet shipped with Windows on ARM.
> It is one of the early WoA devices powered by Qualcomm Snapdragon 850,
> or the sdm850 platform. This series adds mainline Linux support for this
> device using device tree.
> 
> Changes since v1:
>  - Remove 'enable-active-high' property from &vreg_s4a_1p8 and
>    'input-enable' property from &i2c5_hid_active to avoid warnings
>    mentioned by "Rob Herring (Arm)" <robh@kernel.org>
> 
> Changes since v2:
>  - Rearranged the order of nodes and properties suggested by Bjorn to meet
>    the dts coding guidelines
> 
> base-commit: 7396732143a22b42bb97710173d598aaf50daa89
> 
> Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
> ---
> Jingzhou Zhu (2):
>   dt-bindings: arm: qcom: Document Huawei MateBook E 2019
>   arm64: dts: qcom: Add support for Huawei MateBook E 2019
> 

Please don't send new versions as a reply to the previous one. It might
be ignored by other people or by the tools.

-- 
With best wishes
Dmitry

