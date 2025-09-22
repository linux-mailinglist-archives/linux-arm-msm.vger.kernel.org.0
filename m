Return-Path: <linux-arm-msm+bounces-74404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CA5B8FCBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE56B189EF1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 09:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AAD287519;
	Mon, 22 Sep 2025 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLQ6+NuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FF6283FE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534037; cv=none; b=e4yA7BvKzb0TV4GWDRf+IKTgHx5nFrRbn8q40wRMP5N1uUjpuLFRtzFQu8KUZpuA3Lz6vrTRQLFzvu3h9t4XJjhtOqX9DpRTcylIWHY9zkf4W7Cr4Js8k6DD3xF2/kgNRRzdO3NEO8e0DrscfFX2zyQMWczhLxpeuMD8HShe4mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534037; c=relaxed/simple;
	bh=I3JjGMgozsZSI4dRDbrFR+chwnwd7YjA2xF/sEtSCwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ5rVwWxG+NP1JYaV5IqnE3mYKJo5qdH4m8SuBaySuf2NxFdLym0csGITQAe+fWMtxjxIH4arFCfVA9uPXQlxb+xukCeVzxW7RhBYpc3m5xs8y+lzVO3U75Pwbh9raYtZvZ4frcDcHHBkKd5W/H28apB9QV34IubOmBVXyVUK18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLQ6+NuC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8w91N015502
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hj4Upp6DvQZMXvyU0WYeHHC7
	m3sQ62ahNFhZ9X5v5Eo=; b=RLQ6+NuCiPUV/W2JulyLLZL6rEnT51TRuFjybdHd
	tkFtkdlQJASvNLju4ImrI+Y1E+Zk45K7z6vcnBJWtoS+MtjDj80cqbJ4qubWfuUf
	FBsbjyzvU/nGHL+zuxQjslKcwLO+ohd4L9CWfFBOT6JfD5hw4kP9CH8S0fLEUue1
	hO4xFWEUOhNm7ov69+ut/ZOZS9BIAyX3ovHXOagvcikYF7Jbnbcmq49pf52DKaHi
	Kb5O7uDHt5aUBAB5QjrMv49+B9uHO2hLZoyvrtkSTAB2lu7DYYfS7PV/upznyikY
	b8Tk5sDL5qrrVPe79ijAYvccl0gEUYkqAvhX46zXuahbvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fc5th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:40:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b548745115so90964181cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 02:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534034; x=1759138834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj4Upp6DvQZMXvyU0WYeHHC7m3sQ62ahNFhZ9X5v5Eo=;
        b=YE4SVb2gSsDc6zkU8rfCBMUd3hpCs2ChbOH937ZuPT5nBd0ZlWswUDYzpOQTJBB2Pb
         gHmYTyjlOcuBDoLI/9JFhMpawCS4AUTXHSgu2hC14Q1yc50S44rbbhNaQ+QL3kPTGre4
         zxzgui4sUAjjm+U4LnhNWfCv4krphJMtL/2h0WgGt0TrBhsuSl0CdoNJuQAYyT2h1WWy
         hYwfI6xvk8RoZiPurLLR9Vbts71ajxMARmjxHBv8HxGrkfXIvnpnU3F9QCbgVx4t7fFB
         OBMOqqJM7749LeZGteZJji0MozuTRnA6pjmhnQnFk1OqVJws49o15tnX0rtUqo2oTREO
         4yIw==
X-Forwarded-Encrypted: i=1; AJvYcCUwoxEIMIw8nzW19D2IcrnZ46mGijOgpzPKGGdJhXv1BqeCv8SEDGW1zectcSL6NpT/9vajwho6aketohpd@vger.kernel.org
X-Gm-Message-State: AOJu0YygqAZbnz1XhGvQJEvh0IhjBdmlMmjmFus3pSzVLk+8Wf+14lDJ
	Yk2pRdZ/0zD2hQHLE3omkfTEiFaIQk2WVmpjBTMDg8fE8gEu4T9+uZ0Gz47EIp3+BWiynKy+Bbz
	5KAaIhWRxfvt7JU2Ilm8P9DrHBnkMIRAIPtF5LsS1c/W+SZw3TEqZUWpRZJPm2xSEVwRMGO5vqa
	jj
X-Gm-Gg: ASbGncv42z1+xu99MfPwrNaZxcOwhbwyxHZ9CuEq52WAZ2XR+dH5Sa/tPDRPpFOsggX
	OQazmpLZ5rn3WlyiCZ6hrA/9K9j7blsZ0xOK2NVuyuKKU2pXxK/rgDOMyNcQGdSK0rVCHPoynzX
	pRLcgzKNAMvuqQfsCDGXSOgr2G485OZy5TXoGOBX3EAxSix1x4CoKc6S+esjq2ypxT0HhRdhoBU
	dXdPr4Ni9YGtaNzn2Ev6w6TLom/xoz92lV5T6c2MruQ4929NX0DBnGwLRBBFumnOc2svtEGy1ol
	84wSsf3N+XGcBe460LmzKT+IeScb2XYPCP/uJnRySh1awwkLx9QcWaKbesfV6U8Ksk86IVLgzFN
	mUMCQowk9gH6QqcuVPCyHpmkPOKPFtrNwu8RAH2zZp3g26yj6qoMB
X-Received: by 2002:ac8:5a0c:0:b0:4cd:ff33:1ce7 with SMTP id d75a77b69052e-4cdff51a4eemr13103171cf.3.1758534033784;
        Mon, 22 Sep 2025 02:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELhFuWdjsYSdj9FPHM6ic0X6+DJCEC6Pmfu51Xrw6oDaWX8H/IWt6E6CzyE1gUwe2UoHrcGg==
X-Received: by 2002:ac8:5a0c:0:b0:4cd:ff33:1ce7 with SMTP id d75a77b69052e-4cdff51a4eemr13102901cf.3.1758534033229;
        Mon, 22 Sep 2025 02:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b9545a8f0sm1561000e87.83.2025.09.22.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:40:32 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:40:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Message-ID: <we6q6eg6ho4hvf2b6ibhakoxl2gdph6siokkgvzrnpp2iampl4@xomenqunmssw>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
 <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
 <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UUx_jr541xOI5Fha6Ic0gtSoaRWR8UhL
X-Proofpoint-GUID: UUx_jr541xOI5Fha6Ic0gtSoaRWR8UhL
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d11993 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o0wnlFsxEizOfUfN_0IA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX6GaCdFQAc3rS
 ulf+XuL7zX5JwEi/mFzOaTQY4xVbKebb4IFlKmnwH7o4wo/5IVgYWg8QzUXBZw4kwdV4dS7ORmy
 yirTEpDG+S/dZt4jjyCfty/86O4Y6+O45moBFk/enZwcilk9GzIoMzu0rXnQPASX2GAcrN0g6fC
 4oQTfC/UwGB4G4cLwZxw1NaYIJ4VGeCwkmLFHCukNIWedn21NDXDnxFtWa8ZQK6BTby4sawgNOF
 2jYihGAs/UsiaAgkelNM43nw1mnVK3sAxtHSKjndzya9wcRUMsV6DPu4wCxCONN6zuctmuGie9F
 M53nWLdJTPr8hznd8z8sBWHvRztoNh3aDB1io+iTVIxoqLw2i8798CmOFvyXMvCmZKC9Os2IljO
 0FbXyOC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Mon, Sep 22, 2025 at 04:26:43PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 12:46 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:23PM +0800, Xiangxu Yin wrote:
> >> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
> >> Extend qmp_usbc_register_clocks and clock provider logic to support both
> >> USB and DP instances.
> > Why?
> 
> 
> Shall I update commit msg as below?
> 
> "phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
> 
> USB3DP PHY requires link and vco_div clocks when operating in DP mode.
> Extend qmp_usbc_register_clocks and the clock provider logic to register
> these clocks along with the existing pipe clock, to support both USB and
> DP configurations."

Yes, please.

> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
> >>  1 file changed, 204 insertions(+), 6 deletions(-)
> >>

-- 
With best wishes
Dmitry

