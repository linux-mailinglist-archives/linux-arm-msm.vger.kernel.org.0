Return-Path: <linux-arm-msm+bounces-75959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F59BB89DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 08:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92C744E12F1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 06:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAF042AA9;
	Sat,  4 Oct 2025 06:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHs/b3Gh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2F41DF970
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Oct 2025 06:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759558699; cv=none; b=gTOHnTpzaqxZ0aP4R0Cmyb1DqQT3R2HFKllfUNb6VSVqhzASnFKe6iTeKAHRRkfyzSC+Ukm+jOoT8ifzIf27o0FUxZGdFOq4GTWXxFNYE1M0xTNKPrx3q9u5hftxntA6IbRhBFLu3ddpwt0Pp3HfTLh6BSLKRAv7VnIGc5k/Wx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759558699; c=relaxed/simple;
	bh=31XWcry7gNMJMBFj5xXJAolY8j1SpoyiZ5JC83YhKwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPltyJpzzVqKKb3VHFv+u/KfVrWReDos9EaxraFmrgHYiWX1pu3yDmD2X3CmTLEO4qKIETBBADs4iA+ueq+lvtndbgeMBJqIVhG2lUtEl2l9FR2vgqXwZvqdz0K1Vh4zb67x0M8UTILy4T2bUrdtBkdNi8WYmzGlwjiH9G7UyYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHs/b3Gh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5944Bp8J010196
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Oct 2025 06:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qBBjEdaHMll6uf1tUYCMqnSa
	V10k6JLabN7CElpyVZY=; b=SHs/b3GhoPVU69KMdKMUFj8FrlJEJxFn1F1FcUw1
	ox6ciOhNcxI0exwOkWebzcYY21bZi9BO9OUIR0lk1rYwfW0u+HkHsq8kPgmRPNcv
	xjXhtS1hh+TNFpjRYtGoEZ5lHFbORk8NmDr+/aexehj9dQNVGlf5N0zy25w3EUNG
	oZxOxftFNniV6jkiLy+aXtipmwkemtcL2nLJM1I6qdKQ47UQza7Gley2Xoa8HP8L
	QOIKnkV53vpdLJDZseA/ae2A3eEszxUpQqrrOdqaoO6R7+Zr2JvPZoCYkzQnWNF2
	TM3JJWkMPQHCEA11sYIlO/VpATbjwaM0XdmKqc8zvVC8Cg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvbdg4dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Oct 2025 06:18:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e1f265b8b5so67431601cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 23:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759558696; x=1760163496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBBjEdaHMll6uf1tUYCMqnSaV10k6JLabN7CElpyVZY=;
        b=FV4Yfd/sFNJIp+HDCZo+WwHXMIuT8i4nhPmOu47r9MY6prxZbeRhU8FwIlmJnWuIMl
         ePygem+3pkVtj4sfQLgPz/SRZibEh3X0EjSkfsu4cVE6KgnxjnSlm7AH1c0oHgcq67Sg
         iBbd75QMj5FBXb+6y7bJETKZCCea9VJnXVyDlvCE2LYGEefC36dFhFz5/cScnQJdM3Jb
         cZ1owgwrPsSlWlFlu2r/mcQeSsMaQHwBaVtWe9U4wkweUIefVg1rZl8QKJGswLIkJSEv
         W01ZCPb9rruOAbZh2/de1tNewYLCsRvwOrVzOQBwIawRd/7RcmVsq+P2L+/SujuV45kI
         F58g==
X-Forwarded-Encrypted: i=1; AJvYcCV8ddKtxr4fzkjN0fZlksM2WxOwRzR4JJdXNhLmKZPtdkE00WRHVUjTVMtl62ZHKYxOqH0LHDGEPNq8KLbY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2yoDPRGelDBKhrqW8yuM732bZ+alZe88E1gsK9ryUrnQwkh+l
	RsX7abbgt0b1Q96EkjJCcqGNL3f8Kf0yvrznusGbpEALTVG3p4tUZtNcPevhiHv0wctSuDAOWOn
	iQ9p/AU81yI1NETRDC4YSZReys1mdz098xJsjbPt6ZAZpih6Q2IsHj06ZxxEYxHq+rp++
X-Gm-Gg: ASbGncsDQCXnoCXZ0Tv5FNBfhhLFhR6xIeiuIxJWIKP6NKZagWKpooWIecYL3n8KE/o
	nSucIJ53duqQuJ/3GjtNrhZae4PdT4nhNgcXYwcXMnE/6MCVQ3qAypc4tXh3TTpYVkML6ZAs29X
	wjPEXQUWN+NwPdx1pxq+735jFV8z/t/qGcjg1stGcy/CUNkj/K/9r9xuruLoLCxme0LF48C6j6Z
	Uq0adjRZgnrVKINu38sqr+xGIjxq0jpcXLWI/iPTQTde8U4xE3k8X/dNYlxmgKbIqwIX+NGH7lB
	6OPNSk5Pn639VP5hm//6wRgkF8wUGP+qdEeTNRj0sppvMMWM4yafAZnQOcE3y6JZMgPUkAzY2Ss
	5syYjXqy6oXBPws1/RKTh7XH0gJkviy1yAcfmXjfO9LacW/SZ31510wS4Qw==
X-Received: by 2002:a05:622a:58e:b0:4b7:a92d:3d99 with SMTP id d75a77b69052e-4e576a469a0mr74836401cf.1.1759558695990;
        Fri, 03 Oct 2025 23:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRpdIygFcf6KTn5/QEqqXWhnCJScGwKcv5Z0AXlIF9fllAXu6mj2WemBQzEzvWqJKCmZoO4A==
X-Received: by 2002:a05:622a:58e:b0:4b7:a92d:3d99 with SMTP id d75a77b69052e-4e576a469a0mr74836211cf.1.1759558695552;
        Fri, 03 Oct 2025 23:18:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124378sm2558329e87.11.2025.10.03.23.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:18:13 -0700 (PDT)
Date: Sat, 4 Oct 2025 09:18:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcm6490-shift-otter: Use correct
 compatible for audiocc
Message-ID: <iwyoaxo53kz5b7kyz5gxme5ywtn22ho7vsrl7tsvw7uogzjz55@oeekjknm6qew>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-4-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-sc7280-dts-misc-v1-4-5a45923ef705@fairphone.com>
X-Proofpoint-ORIG-GUID: 7PHSvcy6is2M0UUBoMVlRg1p5N3BchbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzMiBTYWx0ZWRfX+ep2j/sNGY3Q
 UeMlCReukUpEhFjHZ/ftXM7fp6JKGQAL2JcSbd/RXnoB01ePb0phuhBLUVJN/r1UnoBhz8UD6ae
 jhRCeykH1ywJ/UQgx4bMGQavhPPiPNke94Egu69PLpva0AZZPYc9D6DlLPU+mzudRRyMFovstyL
 XNNbAS2i2G2w+eqgmEW7OgtPt5GbbHAIk0KVh9gj6ALd5dMDbDUZ/rcSCk4o5D2FUGIccLIGVAj
 YyXnEFKfXbJuEBJ7+t1dAJuHK2JElz67YKuMnfosLWFEAPOaFXUhpS1ncjKv6kKFaYiRuJzfmo6
 kFDKxG+Xns/o3DoAxas9sLCqwgOCrbgq1qq34GHjsynp9HDkqu1AqOBs+J0VKT5AZwPQ07ng6TY
 BA9R2UpTypgB/GP90VbHOKzCdNaoHw==
X-Authority-Analysis: v=2.4 cv=D89K6/Rj c=1 sm=1 tr=0 ts=68e0bc29 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ZWl6vx9Q9smWLlo6MzwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 7PHSvcy6is2M0UUBoMVlRg1p5N3BchbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040032

On Tue, Sep 30, 2025 at 03:57:04PM +0200, Luca Weiss wrote:
> Use the correct compatible for this phone with standard Qualcomm
> firmware and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

