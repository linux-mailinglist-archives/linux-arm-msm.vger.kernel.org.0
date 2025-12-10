Return-Path: <linux-arm-msm+bounces-84887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695DCB261D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E411301E1A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 08:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC75C29346F;
	Wed, 10 Dec 2025 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpmUXVBm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3YMiNKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6666B26FA50
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765354903; cv=none; b=pvJFN9sk1syleoP3rOIDUmYQgXVQ+46u/SgRk8HPySXoenJZELn1gttAvxEhbQf8tTNBGW79MmB2lZUl0eWyNJj205EcATUZzQnIjyINttx3OZIq+p5zqhB+mkNnPbVIeOj70zE5qX1Jtxj5Doc9gWXzfgPAXosgQKtwA6FBVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765354903; c=relaxed/simple;
	bh=/iS+gwZsoSBBxVPwrlvR9WMPqlf4aU+4o3We8wYdjjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku6fj9KkJTgPkbX9SSgUWPT/6/X6tpNWlrb770ZaLl6Xs1AXYpVAoCXSWuXTNpYnF744f2tvokzTwyCrwXjCEfpJKzX4I4oTjIeqO1yJitDqizQDl/BQlMMWfz7GW6UVq3k+uqiMeiWznUUgKOe5IgjRStf59QNZb115dRfTBNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpmUXVBm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3YMiNKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA81fBV1851002
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HnPXid0omdHPGaut8KB5nAWM
	wKfDbeTFf33MoQUOo/U=; b=JpmUXVBm5kGIG3UUOa2wLGvW8fMO9OJGlDMfCXvc
	uEnKlIASTDsy1TgCWU2/ixfBVd3RrPmDyVhBxHTUqeOuWOo8j21AsWDW02YNz+zt
	WrKS5lnuJV97yRy/qVKGHu3IQAPidokI+0Ca4ZRf89VtNLGEG5Fy20w4eO3Ayo5h
	vUbyA/viG1rCqgZ4ssNEJjdtKwrLVSduGWqsSIP1QbNyke4bcyteTpWFg5kTFWzH
	Zm3EJBolnw2XYA3CjO7aUZvIIpxiP/lS71AxUXhKEc7pm0Da7ZaVSSvhZDmb3io5
	hMkrFuIlHkdSL1wGTaE6/tXQF3s8B+SA1C/NZ8h+6VHdJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay505g25g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:21:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so1480450885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765354900; x=1765959700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HnPXid0omdHPGaut8KB5nAWMwKfDbeTFf33MoQUOo/U=;
        b=X3YMiNKppnbhE8xS/zamf7X8LDE9VqRSYb3nnOzNKCdGTAx9F+SyqfFYD1wEF5HMy/
         DXCX0lmohEVuNlFqdklDMUmw3uwLu4ISFeePO6BwxuDBXGIelUxYrPyva5+KkUvqUecX
         3ZfbPwqL5UQ5iGfGvsFNxfnxr5lcxpAWXH6Lc7hs3Tl7ZJIQWnWmCfZhts9ZS5HHnNIF
         Y52d1O3gL4jbRQxKmg1kORr2KA0WfhO6h4MSuVAudB5ZYR+hUY6L6dpd4f9OWjU84Zwi
         id5UrhwtoTJfaqJDSierlvEGgeZ9qfVCBnZUaePEUS4aB1xCDBAtnWOEEc0B6u4plG6o
         giXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354900; x=1765959700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnPXid0omdHPGaut8KB5nAWMwKfDbeTFf33MoQUOo/U=;
        b=ksufNfd1xwz3HCx/pn1RzxTmQdvtUMBIyFqOzRgEdtSXytCnIq8blazlOf1wmhUYS5
         E768Npx2kCyUBFR82se3P8JDVBHAlAriOhoIWxT32qfwZ6s0oNdB/Eq+oPquZfcvqek3
         lTHBGGuJ6Ob/uF/jo8YJbgtj1ivz2NGnpBHD4Nw+OMRUg0sLvhIqnIfNES+xNbqeTWE8
         Ytl5bwxFni663H4cwhyyMSU0ccs53BL5UhHqlvwfJWib56bttVq+M8oG+bO1VpVRzK3m
         iTrQNy4q9JGo9bcaz0OoSUtS8s3/9+qmpAMWKztk0R5cJESmPPLdnKTAdBXBWr/XmM+n
         E7eA==
X-Forwarded-Encrypted: i=1; AJvYcCWA0jjp9Mn6lhVHR4E1qrt1H77Pbx3CISX5yiKsSYf1rmXnKdLOhrepHK4A713WJIWSHd2YnmccQNzJtkXr@vger.kernel.org
X-Gm-Message-State: AOJu0YxKVmXrRYG0/rCwIk/Yb75uAgBQ470UbeV0TAYjy7WsAMr6iyJA
	Kvp/znlGKFyoraCuY3bdoql0LKPBxU9euScm6205DallSkwVNiPsHVOichW9OKz2MfQZz9HSKb9
	5JVik+0d1L+54gbQQTRkyG0NAhvogaT4ZiyhdCH3Z8P4IiLgXNIPUzbGiik87HPpOGCDA
X-Gm-Gg: ASbGncvueQ6Mwl/dhphXJPRzlCdCakHzMymW6aQB4ip2lJ6oK2SvmV6BdcFg1Ag47HB
	L0ymhySrbeZAcGKxX4Jiu6gaTjfMIvnyKricaEcf9GABxwKzsINDKYtOkvuHsi7RV9DMwxxZZ0R
	rlYIujYjR03aOhIB1GlpClew1dGpnYNI2ugUpWTymgps9pBvFLGWb1BRp4iaIYZT5OEF211lZal
	sj2zXO3hH/et4HRbtGfiHwcyY3VCxfwSSctXVTJHmZuZwehPkJOrbTkLyJdRKRlDTQfdQa7VbLD
	zmFyGDWaFcSbCiCstAPvlLVtEqLYVgyOfjnyKWx/9HgCd+pMuwfaxbkZzxl7UmlfeZ/677gRyxI
	/M67s9m0b5CaAlPgVZlK4Yiku/o9v88HjmxVHZwfMQkineVsfu7baX1ro1vzaP7NodKbbTaH2ul
	4ErV9HORb3tK5fwJmjjlNuI6E=
X-Received: by 2002:a05:622a:2444:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f1b1a850d6mr21108781cf.33.1765354900596;
        Wed, 10 Dec 2025 00:21:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZERnPWe3Yc2HBRs6Tkey0IEG4u7fCpGxa0fWGHQbkO3ydYsnHYceLuRvt9f6FnX3itW8Hgw==
X-Received: by 2002:a05:622a:2444:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f1b1a850d6mr21108321cf.33.1765354900148;
        Wed, 10 Dec 2025 00:21:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e54csm6202863e87.59.2025.12.10.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:21:39 -0800 (PST)
Date: Wed, 10 Dec 2025 10:21:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
 <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: imFeiirLm12JoO8gCMAtK-CxQIYwW9WS
X-Authority-Analysis: v=2.4 cv=Bu2QAIX5 c=1 sm=1 tr=0 ts=69392d95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bsoMiNti4Xze2ZiuTnAA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: imFeiirLm12JoO8gCMAtK-CxQIYwW9WS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MSBTYWx0ZWRfX4Zms2p/MejPU
 1uHiT6HSVyxHTE/gMy51nt3KtFUaeBC5AgSASQt7eC0bubJ4vr4xJwixAIWcwIU4zgJqWHgcZIh
 6I4zXrLWTBR6O1aO6DCN67bVwxNbmmEDBHrkQETQdMRwaJY2ddnJGwxoVOem54cRKM4+K3wLB1Z
 0r5oR4AA84K9xu5JBQFtYKfsJHgwkUBsgqTkj144N9iqhubmfyfUn+BH8NzSyhYxGYiJsfpUxGj
 TJfVQQKFP/hMuPk5kFZS8MrXXjPunTyLqOLENlNj4CFP+n0idJAuD6vi0yAsPYW88w2Z3Ay69qw
 bHf4QM/cUhLN5GZ/6nbFA9cT0uqPoXgEMEP5mFclxnhdIy34Bq6eSk7kfg5gXYPXfZujMzef/z5
 7uYQF9m2nW2GlL7FLlUI+FL3YAAUBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100071

On Mon, Dec 01, 2025 at 02:35:44PM +0100, Konrad Dybcio wrote:
> On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
> > Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> > Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> > on the Qualcomm Lemans platform.
> > 
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > ---
> 
> [...]
> 
> > +			mdss1_dp1: displayport-controller@2215c000 {
> > +				compatible = "qcom,sa8775p-dp";
> > +
> > +				reg = <0x0 0x2215c000 0x0 0x104>,
> > +				      <0x0 0x2215c200 0x0 0x0c0>,
> > +				      <0x0 0x2215d000 0x0 0x770>,
> > +				      <0x0 0x2215e000 0x0 0x09c>,
> > +				      <0x0 0x2215f000 0x0 0x09c>,
> > +				      <0x0 0x22160000 0x0 0x09c>,
> > +				      <0x0 0x22161000 0x0 0x09c>,
> > +				      <0x0 0x22162000 0x0 0x23c>,
> > +				      <0x0 0x22163000 0x0 0x23c>;
> 
> The last two regions still happen not to exist

According to the memory map I observe, they do exist.

> https://lore.kernel.org/all/vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m/

-- 
With best wishes
Dmitry

