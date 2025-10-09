Return-Path: <linux-arm-msm+bounces-76724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06001BCA36C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE5334EAD97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B83E2253FC;
	Thu,  9 Oct 2025 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2LzNvhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2D224B1E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 16:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760028078; cv=none; b=fnG0dUJVl9blZBF2dPTvZiX8tzlfEWmQKYzafXE1BDmZ+mFG6hSrgkWZ7l3gdTB2hnxGZOzoQuB2A4aFS8UGzUznNde5jjZ849e+aEbFl80qHacboaV3H7DiYQ9T/stfH6S7WiiZnWnCHVAk+F3JYiXkxBxKZc+8ioEpC6KzQl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760028078; c=relaxed/simple;
	bh=huSoky+Njxyfb9vzBoqbK2jj6WEztwZYTUrNvSEcOCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyIaLPz0k5ZVa1CxW/GjUi0D3/HvI58PkdBxTbGKJKyuSpEwG0XQLE7T2KHiBK75137CeybXYzZRgLr3jfx3hjQZ4u+j7tiBDZXZ0rFoJCNwFKP2atzg0i/CHzic+hihoUuEl5fUU3MMHTEaASpL9vHNbvKozdhaAdBfktC98DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2LzNvhK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EuGnE030119
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 16:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZH5MJU1z2kkrReUPnfpEC2Sv
	Ik1fLetQo4m68cqSWX4=; b=d2LzNvhKuBavrdidkriUIThV2NX/6sb5KV6nKaS1
	jo+qKSyfFtrUq+2xG/gR5DGBZE6VUaq11qb66S4nDyxj0ZEJJjmdgS+yQWrd1Upy
	VoGKvT0Z3pJ+flX6w5hZDJMP41gD5RQ7Zud1vEBHKiM5qtjfotfZN448/RhrecBF
	i51BiZ/2MFwp1vOG0RDl+cqeV3U72LvuMrP1XCfWzqJdyMU1oN8X2NGOZL0jgFPd
	0nKhQTt9hBzsI49DRbr27tMKKh4tStehoDkcLl+pkMpUeksS4wm9RTy05MnsaSiv
	tIERK+DIgif0H0eWgEeBuphRI1ggctbIfclb4t5C9iiN/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kunw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 16:41:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de5fe839aeso42494051cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760028074; x=1760632874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZH5MJU1z2kkrReUPnfpEC2SvIk1fLetQo4m68cqSWX4=;
        b=B/rpc/ZNOo/YsxMUDGFBpREfXP3VSQtWVVC39sppjN9+IC7kEysROFtK5GkkH0FSRP
         itpbAgAqfGQD/QsKV7OsbGNzAJDnST/WF0BoUnytaYEcpb1D5+lV4CnrRxa03xgWGniS
         u/klIa0EQ1vh1mgbyzATrQFaig/QONJGGOTD8mF2aSz3uETu+nQ5lM2FlKNjE/6nHVYL
         x3WU+9o9Px+Cml0Imoac5uDsEQPFjMbuY/ZEkoDYuUwAb3/y2t1QWn6GYZ8xK7a+S6Dy
         BwzSO7A7poSArcHx/fuoPZtbak1+xweDKJUJ9zAS+sBytnT8w5oFN9nS88V4NdD82Che
         UGkg==
X-Forwarded-Encrypted: i=1; AJvYcCVqvswAgMe4BzYwlpdW3K48UBbXOTEd9L9QcWH35aWOMKjbSEcJAXQSyAx5ORki4NeuNDYyNOC650zQ6XFS@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfIvkw0tk4Ddv7fAx5Uv80mg3rQ3SfL0VOJ6HxtWMXjXve4Ja
	G3+Ql4TYYSQkASlmWpXM7eCVcrBnozaZlkIrX3+jAWhUbtjrtxm91Qqn3Q4jxE77FY75IAdOe4h
	tf8YDtlJvBQk+GD0GDtabFjG3mSuUisnnpcAUbzjxELF3q+tmwvjbuDjF3uNjHXKhk5iC
X-Gm-Gg: ASbGnctN0/rh+pyyZgN2UjA6kSv/OQoj3O7fNKSmtUVFa5HO74Z3jxlbd/kVtwAGnJD
	pBksJqOcYwAt/fQcK/LeQgCO2UBEsk3P5VEecM4diOltensoVDEJFrUlVlw/s0evu3iQMqxBD9Z
	8FTOXhLXMBw3cxCJSGTMVozJN7OeZOI4evrXClPBabLS2G0X5hK5qZPUxhrxiaEX/UG18GnHmpQ
	hRFubR2+7hLWsbaFdKXamKvhtybkKBZQTLCuzZCmUlA5rmjaAQEn/SHQx2FftEbYT8b2sqeKfhM
	oD6ldWuhuJEgFuRjv+Cpi2oAHalqM60LH4T18nqiA5D0HGy0juQ2TL6BggbnIhqouv84pL3aQu2
	70uHLEeD8/Abg4vkVGtg/9FrR2PcCPsi/erHqGIrcQZK1m0Ww2ShcX3GjEg==
X-Received: by 2002:ac8:5d05:0:b0:4de:9f9a:b8e1 with SMTP id d75a77b69052e-4e6eacd1632mr109502641cf.18.1760028074436;
        Thu, 09 Oct 2025 09:41:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzrUwRk3yaunly+XogzDKcTmyOuXyUJaEXYWlkGYC+ql2A+kl9xkhVKy9iNz+hgl2z4DiTtQ==
X-Received: by 2002:ac8:5d05:0:b0:4de:9f9a:b8e1 with SMTP id d75a77b69052e-4e6eacd1632mr109502251cf.18.1760028073944;
        Thu, 09 Oct 2025 09:41:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e577asm154e87.11.2025.10.09.09.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:41:12 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:41:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Fix uart3 QUP interconnect
Message-ID: <sdxrshrrx46wlskoz5kbefqzlhc3nccmgaqoxbc3aif3ep32dg@c57xluzx4znn>
References: <20251009090718.32503-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009090718.32503-1-wojciech.slenska@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4+gL2GKn+R9Y
 kxq2Yw9kzTFJvu+d/cfYzTTflAbXqWJQImqkKNibjD7+kSOQCopZW0TWXIK04QJ02nM6p7UqXl4
 WKSKWp0vwm+4eE9WZ3sy/8T00BeqRlKLgvZMjx00loK8zoHwNkzvHVcoz4AJc2Uq/US35AwYKR+
 mzObQwhyeHcHrlEFF+BUjG6vZGmKmHJrEP0YsRmp8y/6azoic92EroQkTs0vnxJWKiCl7b9i0Ik
 EWouHzT5kuJbKxfkP9w2BTlgs1ThlepfTB9WT17hQY/IlrjzvS8Uo8VRjY2WhhzK/ymX7SZiEjP
 HV2wfy+8z93YpsjrtAlqt+T2VPMhdcI5BC0c+UwvslfFdqzFdRHFBZYiP7Ib5O1fg/l4By1FWJH
 kqTg7P/CsQ3MAd2vbdPkNzbiWsHWDg==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e7e5ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xtyRbcdHMR7QiUPwaIcA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: JooaN6LDSnaqgVBHDvsh1onz2znaG_ij
X-Proofpoint-ORIG-GUID: JooaN6LDSnaqgVBHDvsh1onz2znaG_ij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:07:17AM +0200, Wojciech Slenska wrote:
> The config_noc interconnect should use SLAVE_QUP_0.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

