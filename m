Return-Path: <linux-arm-msm+bounces-77010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DF6BD3052
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23E2C4E9D71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBD726561E;
	Mon, 13 Oct 2025 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibG1wdZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910223F431
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359238; cv=none; b=jiJp4h7GFijgEm6xTyX6gEUtz1FXzxJ6RNBckNvd8kJk2xsPxDMNvF49QfY+L1HuzsUmgnRNbu4bTQ2BBkdrvs/iWWKO+V0ptZJlbs+RD3xmhVPrt4K/R992LNT1J0Kt2apK4fL99vrgl3WJmFMsZAZIA27uodd9e2LUQt4w4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359238; c=relaxed/simple;
	bh=dZx1FG/WcIlbQOgcXxuWDW5+YDqYBZQhGx5Hx6dPiIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+hqya8nvXTkpPLj5QafgzcJzv6n9NUN/qGV948uDqR0OgGRl+Zu+qO1YG+lzPxihHxTtSpMtyMjqMBsUnTLcj6iukMVM3SdMHoXEfxYSxYdH2+utpId09h2zMWzGO5f/bLlekQtaJ/ROiRJHXo/tWj5gmx5Z2LvZRxSAGjOE7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibG1wdZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAaClk022220
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f6scyOM+ahva9+uwhw48pxSb
	yDQ+LPEwq5/UOfcG8bo=; b=ibG1wdZh8jBFjAAr/HF2MKezLDCDoQs9U+AgU1E+
	gsv1WjshXlYEN9CVA1E5jrdrhhJ6K7/zPyVZqvMENNAU/tCyIKuRxCus6Jc5tetA
	a6rPPK+TO2BnfR38pazxRS7lrCik4W5lChA57gij0xGAxeev/Yl1GjWFyr9HS0nR
	l2fHx/xpO+WjXOHdNhSY1nFy8+H6qGYESv19zRsJl63y/BExMozlu7ORp7RC9c4l
	siWH/7eZgiUEdQnb/G4twJJ4YbPKpXQ0MOFG0iJRvYn+xVIVfDBB/ZAX74srez0Z
	OSrcURx02nSd3it8vowRjjgF1swAg2wZTvtQ1POWLIVZdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfvejb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:40:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8635d475527so2925517985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359235; x=1760964035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6scyOM+ahva9+uwhw48pxSbyDQ+LPEwq5/UOfcG8bo=;
        b=SjKniB1vNKI6yMhGS6TPu75LP9EvL5gpLs7YfeQw/ndkX3D4Dcf99MdG35zK3m4wR7
         pB63bYVgNqq57+xWsu7uqKzLYQ/4XT9MfP3Xws5+QlF2lNOtS5h9UQqpgNb6gpfzbPXI
         rfnKCVL1h/rCxWLfbSKx6Zyoduk1ONgl1qwX0GgJmy2BjuUTWvb2hLPtM5y06CUsyycO
         ZcSQ9db5pPpC95UpONesq74sc4eINFL526oZLw5YHRTI5RhSq0Y03Ld4PmW/gb79V+Gf
         3Kmk8oSDJ6eSq94P5C3EljTG45x5QC5kNiR4AUNizAeizEuPfkQWmQcR/FZ0L7o7M1hX
         4Pbw==
X-Forwarded-Encrypted: i=1; AJvYcCUA07sji8Y4GdJihohvRKgnyz05LogQhxauftXf2192giFX+ZosiycV+o2KOiBpduq15XB+dt+fWFuuiXyV@vger.kernel.org
X-Gm-Message-State: AOJu0YwhubEtHfzZrwO6axJgTo+frVsWRnwhWn15z6bCW+NsfW7Z8yoo
	euYsgFlxzqrf52ws1doBJh7dEfScCkzPu2s4Sl7ErNB6tKoW160jHxPj+DbNSH3j6LOTbtoh6Dc
	Jj5Fs6C5ASghT0kaHputtof6hllDKGYQyfUQXb8o/AwZQPEzqqCGNOq41rvNmFWMWwhkj
X-Gm-Gg: ASbGnctaMju1MBXa4W/bV2hOI19OPOMSubDC061KP+q1EbBiw/YMyQcKwg6mV7Vn1PN
	qQp/d1hDKGgJ11aDHrpeOdzGXtUK/ZZtA5PSvVxASU6ZMVnElvbNflRrgx6CEJbPyVo2187bR6K
	nUTQ+dlBhQyO/lH3kLUGrWlWpWXs7B5N4WhJl6IU2NcTraiptxZhVJq2gVMNBbhpJ8hdPyRDlqx
	TZSYs00qjDEbGStK069n9d0Kc71VdHTtPoytPJIQY2xqlA7ZbhDl8KB3fvHqONN42gJvp96Jc0y
	V4s/bGQwg8efSDbse24K64TXMM2oJFHRitDKNCNc2iXK0FYqoRg+H5HPWIlwGgHlk3LuUFCZYiz
	OCacuj3xQ0Iik3M8Y5SQgrLYZFhUCX7I3f4V65jXrJGEDCa9DQM8N
X-Received: by 2002:a05:620a:458c:b0:868:54ba:7c42 with SMTP id af79cd13be357-88352f83d61mr2871641285a.25.1760359235452;
        Mon, 13 Oct 2025 05:40:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkvZQ+8ZJnIwC2hIgs/DILNFhHouXWRCw0k5tWWtya0oIkN3txK/mV8/TSZwSq7k0H8FX0lg==
X-Received: by 2002:a05:620a:458c:b0:868:54ba:7c42 with SMTP id af79cd13be357-88352f83d61mr2871637585a.25.1760359234973;
        Mon, 13 Oct 2025 05:40:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908857792dsm4081471e87.105.2025.10.13.05.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:40:34 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:40:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 3/6] phy: qcom-qmp: qserdes-txrx: Add QMP PCIe PHY
 v8-specific register offsets
Message-ID: <x2443gg3bj37j7qxjk3ocol4xzcly2vandob5j46bp5c6akqb3@zgwrl7qhl2y6>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
 <20250924-knp-pcie-v1-3-5fb59e398b83@oss.qualcomm.com>
 <fw5hf4p2mjybvfo756dhdm6wwlgnkzks4uwgo7k3dy7hyjhzyr@bv4p7msxapcb>
 <aOzSnxuuAb4gFCkk@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOzSnxuuAb4gFCkk@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX7ER3WmgBdTaZ
 TNYSzMzXFGvdAJAZMtufK5e1M9SX4ghHHELnAubhoobhG1djgSVE7yzUDDtewd0WDo2xDKKHySZ
 6HwDYc0UNk9ssn+0bsht+rzoDo0Ji11q1dauqLNDBXANBKF8kGgJ623fKhoZQw2nOethdUo4+Y8
 fUbDCmmIw8EQmJksRiQ0fVO26Os0wxgG79p7JqlSxWImsgFj4zWCd5ZKfHe6TxQotTlmhVAc0n9
 uJl68ugqGdKN3g13A6SUD5bwdEy9fbSqzYfKNyp8JKPlC+rbxape1bnHAzWd6C5oQrRhmRwza1H
 GKQ12sKZWWXe/lRk8KOwUfhC3b39A7GfE85WMBybLi3D6Kx6gMy3480aoqNg1OAykwHPI68cQna
 TCPFtYedGgRcAsNfLgs60DVnSxV52A==
X-Proofpoint-GUID: vn5Iy5kPDFVmFzrFHA0H8gtQGos8GwY-
X-Proofpoint-ORIG-GUID: vn5Iy5kPDFVmFzrFHA0H8gtQGos8GwY-
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecf344 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=SRHymB3k53h_HzVQ3XsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On Mon, Oct 13, 2025 at 03:21:19AM -0700, Qiang Yu wrote:
> On Thu, Sep 25, 2025 at 05:28:15AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 04:33:19PM -0700, Jingyi Wang wrote:
> > > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > 
> > > Kaanapali SoC uses QMP PHY with version v8 for PCIe Gen3 x2, but its
> > > qserdes-txrx register offsets differ from the existing v8 offsets. To
> > > accommodate these differences, add the qserdes-txrx specific offsets in
> > > a dedicated header file.
> > 
> > With this approach it's not obvious, which register names are shared
> > with the existing header and which fields are unique. Please provide a
> > full set of defines in this header.
> 
> Sorry, I didn't get you. Do you mean we need to add defines for all PCIe
> qserdes-txrx registers? I don't understand how this makes which register
> names are shared and which fields are unique more obvious.

From your commit message it feels like
phy-qcom-qmp-qserdes-txrx-pcie-v8.h is an extension over some other
"base" header file (likely phy-qcom-qmp-qserdes-txrx-v8.h. It makes it
harder to follow the logic and harder to compare the values. Please
define all used register names inside the new header.


-- 
With best wishes
Dmitry

