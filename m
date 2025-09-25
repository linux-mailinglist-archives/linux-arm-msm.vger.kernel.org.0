Return-Path: <linux-arm-msm+bounces-75158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD2EBA0B1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 18:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D2C07B8E2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E1B2E62AF;
	Thu, 25 Sep 2025 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXkE2YJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF4296BAB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818960; cv=none; b=YaJR5SwrbJL6CKa1miEzlQJokMPciWMEB45/4pLPStykQiB84fj+48ZRRdDfZivs5vMXT8v1UTpdynaG22zI228ngqq0WP18sNbhdPupJrGXJtEOiO0KXa+8WNFfDdP2QUpHnbNiTy4TyCfMHymORN/kKJEevHS78fNIPJcN+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818960; c=relaxed/simple;
	bh=8FCH12DyEzMNnnk+0LH+hPIRigAxZoYH9xFK5aw71Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZTJISZ9KmtekQKQoZasiyfEOdGCoK5o0nbgI3xYgTJKtrPaifvjuUevr9HeFBv09exHVFUNnsC+ubvtKvYsyiCQ4+hDVpp0IYUl1jzSsgcSsYI99VIED/6bMmNsTxD2qeygxBIJUYxprlTtgpczKXcqTaRPOEVcWNm0H4A6T4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXkE2YJn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9fGtu029712
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O8E/Q0Q2T0miV/vIY3HkyaSY
	ay9pRIb7qiM4HhHNagM=; b=EXkE2YJnBmXZLqeSLfzc0Bplvze0C2nnFdgMn3Yb
	ujSz5PlCpp6BC1b9jQ6D838Iotob/+it7FXcDh6+LVmmhlGpRZscqAhCLUr4DlIu
	0pVOApH6o603MAePpATQydnNJp5wM10bDFlcGLmforaBmjTvy4ohrN9dUvnfGCR0
	regPt1Gl337qSqoJydHx+1snwE/RDRb+hh4a3JZ6npMme9Zx2+Z+VL5zLOs+Pibs
	dLqxNrQelOpS2vf1SeTBVQ812ORqz/xc+yGTWvm20vwzfLfj+ZjiKwrC/5rU5H0S
	T+td0Tcs1HshuKbG7mhPhhF8sfqpXyRmc+XWwGbvOFzHbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1frsrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:49:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b793b04fe0so27437351cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818956; x=1759423756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8E/Q0Q2T0miV/vIY3HkyaSYay9pRIb7qiM4HhHNagM=;
        b=LC+uMvhAlOlLlO8ibU3Imeq6AKAF9oSYgqBbjBAoEJ4KKggHRKnb6DstVSC0oflwEk
         vWuMcQmELGuet6nJ7pGfn+1GcGLUlKUiz+i7bbzb+czUcOX1OKCycgtO1JBeYlvP2UJQ
         kwVuJuiI9YJdyGKk6IJR0w7zRAdC9x8G2L9GWWDD/pq1Jft9r7NfeDb+3d4rq2T0mJiy
         BA6HaZXUbyXsBawweA4fE9lXfB969GAa4RMCPC2kMOXCTkAg+oeZErAv01RyUlA/yQE4
         //cAu7Cxe9cIY9Fc6PiVHJ6VJWJN9sCfdAiDVOPqrSHrM/mSe3+96YK8+IYh7Vjhg7n6
         kX7g==
X-Forwarded-Encrypted: i=1; AJvYcCW3BRYVfqasax6spg40hZJNFcFfdGZXV0XHtfvZRw+MTXTkO1nCzqJNuD4WOLVTxbPeWv2+irrZUtrn0yop@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpquu/76Qtbd0tcb69lk8jJan1vWtqPvZtleuGU2JasF6kUlsj
	QXuzSnNdVOZNFbpOEV4Cd/ulaNca6FNxDyTUiFYNJkfgjvh1KixFTc2ClKSHFnZrNL1Wr7tbABJ
	YIqGjKZJf/9qtj9ACN6f9bImvvsZkw29VlFgIspAV5jLutqOG7Nmp88Q8D9f3W/xrzHw7
X-Gm-Gg: ASbGncv1M5q0ddkp2b4VIfVw9zg6VnHIFVoC7G1cSxjkBSUM3Q6N5f6O/8U4Fd+Rxhv
	iX5NLzi7E5M7igMKlIG64JRaYfNAdw2ZqCp399NVOx43xY5DLeebDeA3mxOJ1l6z//R9qVqeidG
	LZ3Nr2/xbOJndul+fJMiom+4Vf00IrrYpevXydHbbS0CNkWxQwPll7fCZQGCpRVCky4RZ24J2lz
	kQsynMAzbKFbh/wtskrxHpq+al74YrttiJ1X2kaCi9lMk2eAXgkBNfXrB5f/HN44tc0GGi7qlZA
	uvHWnDhCbTBRyLb0WOocX16XQouICiueVvzm1K5kC1m0zDcRYhu4fTDHCFCKwuT2+Q/QBixgh/s
	JYOViBC1+howKeUmht3lVO2OLqeiHD9eGyVeNyzWHjLzD3kFrJ64S
X-Received: by 2002:a05:622a:2d10:b0:4db:7bc2:92b with SMTP id d75a77b69052e-4db7bc21423mr18058831cf.42.1758818955743;
        Thu, 25 Sep 2025 09:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl5VAez8V9byRkomAR6n8Uz+yVV5p6cTSYYseuZ2q/3tAbwHDTFxFiaDtB4a8EkykXmnhBWw==
X-Received: by 2002:a05:622a:2d10:b0:4db:7bc2:92b with SMTP id d75a77b69052e-4db7bc21423mr18058561cf.42.1758818955211;
        Thu, 25 Sep 2025 09:49:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831343158fsm924184e87.4.2025.09.25.09.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:49:14 -0700 (PDT)
Date: Thu, 25 Sep 2025 19:49:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
Message-ID: <bgzzkcf4d74rhdzr3vbjxs55gssojzrizinfvedt6zrz5zgs5f@phggrhdhz4el>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
 <CAJKOXPfGC=FK7AKOtmmSV7=3NNXAHe8A_PGjjhTKgRs4Jk25xA@mail.gmail.com>
 <CAJKOXPe6Gdc8qb7fwwNsMLiv0SxXm=aOtrR0HsU0S9wiu6erKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPe6Gdc8qb7fwwNsMLiv0SxXm=aOtrR0HsU0S9wiu6erKw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: LTXeAJabpcjpfD1fTDi7XPRRrJKt4Idc
X-Proofpoint-GUID: LTXeAJabpcjpfD1fTDi7XPRRrJKt4Idc
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d5728d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yAlcOy_z4u1BhRCK-xcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+r/SKi2o7Kwi
 tDlhf67U0hLxDYSRLhzopI5OQTwJIPxhSra4UVhRLke6t5ImSqoFnNCStcyWUiQYip3Y5uzcQ49
 ynY956FZ1OFzakDeOz4NMjmggcQQ+0xX+Qjpu5Ps9XjHsTYw4BOTJhxRMfIWE3rzD2NlYcGpP1z
 bILIn8Qy8F46H0YdGPs+VkuTEq+8UcU3Nm8R2NFR+RSlVJBS8SUaoWv4Q4+6UNl8qpH66OxVpjG
 kTYzLxKbtn8imBZhMBVD31mrVSdpItbKHNHno/7LSI+FJMkWAWZk+n2d8nUTqcl2vcOABm7WDv6
 CW+YbKWqqXySZtRQ0EEeFFtpG4gi7htHxjgyBvn8Q96EiSSfiHNgdzHUTWpvIpJNFF20VB+9tud
 dKYWkwei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Thu, Sep 25, 2025 at 06:01:15PM +0900, Krzysztof Kozlowski wrote:
> > > >> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > >>
> > > >> Add the base USB devicetree definitions for Kaanapali platform. The overall
> > > >> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> > > >> (rev. v8) and M31 eUSB2 PHY.
> > > >>
> > > >> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > >> ---
> > > >>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
> > > >>  1 file changed, 155 insertions(+)
> > > >>
> > > >
> > > >
> > > > Second try, without HTML:
> > > >
> > > > I really don't understand why you created such huge patchset. Year
> > > > ago, two years ago, we were discussing it already and explained that's
> > > > just inflating the patchset without reason.
> > > >
> > > > New Soc is one logical change. Maybe two. Not 18!
> > >
> > > It was previously squashed into the base soc dtsi patch and mark like:
> > > Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> > > (added USB), Manish Pandey(added SDHCI), Gaurav Kashyap(added crypto),
> > > Manaf Meethalavalappu Pallikunhi(added tsens), Qiang Yu(added PCIE) and
> > > Jinlong Mao(added coresight).
> > >
> > > While it is over 4000+ lines when we squash it together.

As a reviewer I'd totally prefer a single 4k line DT, because then I can
navigate through it while reviewing.

> >
> > That's why you send one node per patch? Multiple huge patch bombs land
> > the same time from Qualcomm, with patches adding one node. It's like
> > the "no more patch bombs" discussion and rule never existed (yeah, I
> > know it was removed but the spirit of keeping maintainers mailboxes
> > sane remains).
> >
> >
> > > Also as offline reviewed with Bjorn, he suggested us to split out the
> > > USB and other parts.
> > >
> > > >
> > > > Not one patch per node or feature.
> > > >
> > > > This hides big picture, makes difficult to review everything,
> > > > difficult to test. Your patch count for LWN stats doesn't matter to
> > > > us.
> > >
> > > With the current splitting, the different author as each co-developer
> > > can get the meaningful LWN stats.>
> >
> > We don't care about your LWN stats.
> >
> > Sending stuff like this for your stats, means that community and
> > reviewers pay with their time.
> >
> > This is really just selfish. No care how maintainers need to scroll
> > through their mailboxes.
> >
> > > > NAK and I'm really disappointed I have to repeat the same review .
> > > Currently, there are 10 SoC DTSI patches sent, structured as follows:
> >
> > Why did you ignore all the feedback from 2024 and 2023? Every year it
> > has to be repeated?
> >
> > >
> > > SoC initial
> > > Base MTP board
> > > SoC PCIe0
> > > SoC SDC2
> > > SoC USB
> > > SoC remoteproc
> > > SoC SPMI bus, TSENS, RNG, QCrypto, and Coresight
> > > SoC additional features
> > > SoC audio
> > > SoC CAMSS
> > > SoC video
> > >
> > > Which parts would you prefer to squash into pls?
> >
> > I made very clear statements year and two years ago. We also discussed
> > it on IRC multiple times. Can you join discussions instead of ignoring
> > them?
> 
> (Apologies for lack of trimming, typos, HTML - using phone)
> 
> ...and you sent both inflated, LWN-stats-gaming huge patchbombs
> (Kaanapali and Glymur) three days before the merge window starts.
> Community works for free, doesn't it?

Most of the maintainers have closed their trees, so it doesn't matter.

-- 
With best wishes
Dmitry

