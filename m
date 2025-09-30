Return-Path: <linux-arm-msm+bounces-75617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F8EBAE634
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 21:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F3BF1943B19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 19:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EA0277017;
	Tue, 30 Sep 2025 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prJio/p1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7180E282E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258956; cv=none; b=S9EaJVYZDXySXNdWndZpdMczNM3+te9Wt0hu8lIgxR2TRTyWkrjeG29qh5JN8VWkaaf7t9oa2oG8npFK4sW/M/CTJx+TJaSg7qKXVzcJaCvl14oYqahkorFa/BjvlCEp1PtDjFdOa/uAgTMAMRvmoIxY2L1JnnI6MlN508KfGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258956; c=relaxed/simple;
	bh=XaKjIs21h7X96FaSfZ/LjO9yTxhBXM+kXjoDRs+GPjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrsppwY5rn0rW10+DKbeXDuOvtF4vXJ7W8vMpXsjUoUX7L9hPWooPSHxe3OJ957XVdPeGAlJHoj1gG/Y/IS45c1yWom18iLdAVnM20fktIIxcpqPrG/wWTpp9SBax7eI4zmjN7Gwo1mpC6RydRBgdVZlLCGWlDomgG6czeVH68A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prJio/p1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBfk9v017570
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXlbr7M+4a1GxvAP+G3ZXjJw
	cK9AWRREeeh4emtmxmk=; b=prJio/p1Pa9iQoymrsQUzUwSwVlmy62rZ0boPOeG
	5Co5oHJaznpcAf7BJjir0I0ubdKav7gNDPOI3BNhzvNVU2u1G1uhd2a06abQovcb
	/saq/MhHYC92LvUIaaB4jaXLPQPJtLSaK0t5ErQB6rSk7JyAd3xDQkowIG2rxbUF
	957QygvR48Eomfe6HOQ5Stw7QNm7S+HdvSFGVn+tlzJkmY1II40Vvdyi9BTLN/oG
	i04nl4mMg1WS4TFSJNoHVcmPcipJi5BoYPhGwlfe+D8b8gnSbpNU1REPcDVYQYl4
	JGYK0P8WVNCLk9noVXZFSBzhqetljnENIu2G8LDgl2w9cQ==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80ttabx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:02:34 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-42a076e4f9eso46551645ab.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759258953; x=1759863753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXlbr7M+4a1GxvAP+G3ZXjJwcK9AWRREeeh4emtmxmk=;
        b=ZmhYXe4q10Mkh92qL076Xw/b/H0/LGOoR6UkrZcFx4tmJegfGrls0RNxl6T79rd5fB
         DSrQi+Wniiz1ysHSgnj7JyWZ9WgX/EFWYoe5wqPSl3uk2uMLJ2iD4FGTeyq90sYr+bet
         oBXIweerZ/tDI9M9N9MAXf1CBT3HAYrDo7pTzvW+4sOT5kHYOSUFMRAD+XmHiheDIGPQ
         pBIxS660a8CugGZE1HE0YGtH4fa0NPKc4po3t8LySBOrx0q97LyIRYrWcv4+rAnNCcqQ
         PUa7tJ5Gl/vRMHJs6Znx0SHciyHOb0LJQ3wLSSOUqc+cIA1ErIuAZbSjNnJ8FgNeBVWl
         tp2A==
X-Forwarded-Encrypted: i=1; AJvYcCVReQXLqXKH0XXGknsii0Br3x3THPVLEMZHxWYOv1MVqgEE0mbwNuNoWPJSh73MpHUBod9waHpnhBBwt2d2@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/5AKUbrHQeBUScW/0VMNY75rlVbMhbjMOfq3sis53R6NL1GJ
	XZe+7aVShSsKBcEPbt7olOeR0Jyle33U8GFpNUlV2QArIWGs3FmEpz5SVSQnvahImn3y1MZ55if
	waMyT447gnfUGeiQdSt8w3LAJw93/TXWeHcGUFBeZrdy5QpySxszBdZPvC8MFy3fAZD9j
X-Gm-Gg: ASbGncukYvvAgHDtdbNnpRs9VR9h2yDOrWPtmwiKLEbkfiU3GnlywScxIf0i5BZgpgU
	+WIxpjAUAA160er2m6wcIavgIX/pIJBxBB2sNC2tX0nJ5VfE6vP+0zHsSdJAl3a3B+E0CVIvp2m
	lkMlZy3XsX+3GuBL+CGAtZdsS5wIjz9NqgtVwohsfCdAtxVsTdVpmQ3oPYdgCRzva/DOGS8Y/mq
	MCXb8JdjCdaOVjXHmwRdoEpAyJ2r24J0pluvsaYMqds/VWjOT8aU2woq3ApgBVTsvDFY2yUdIbP
	YCR+Ru6mOlIf1D0ZT0B1EbyjOjIDisuVg4RZynAliJZi4Nk2z67Gy6r/9Tj1HmpdXLPQXrpzxm8
	Kznn1S+DPFwQF8KB140TvY6M0U/a86JFEXzBW6RN8rKhTV9WROgtzToooLQ==
X-Received: by 2002:a05:6e02:230a:b0:3f2:a771:9fb3 with SMTP id e9e14a558f8ab-42d8162461dmr18055265ab.27.1759258953238;
        Tue, 30 Sep 2025 12:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJV3txOav9sQu2ukayU7ugj9yuYkFavKZlUgXjEWPN2HKtbR36iIvOChi6ogqZ1DDolHbXtg==
X-Received: by 2002:a05:6e02:230a:b0:3f2:a771:9fb3 with SMTP id e9e14a558f8ab-42d8162461dmr18054575ab.27.1759258952745;
        Tue, 30 Sep 2025 12:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe6b29sm35412471fa.63.2025.09.30.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:02:30 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:02:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <hio5xdgjb6oxejrnk3hy7ylro75p2ebqa6oczyuwuxk3xsbp5l@aewbvmuk3ldk>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
 <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
 <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX+Uum+eWNCsym
 0S4vpQOQM73Adr5t1p4rdtdSwgUrvOJsnnItWPY4MwhEW6o5McysU3O9KJTWHOSCNz7cs7oB3wB
 klq8qMEVDpAxC+vlPIFk4te4SPhn9UXDkGltTJCW5pFvC0oaU748wKd5qj4dlKfJXh+pwA2Kwe9
 uU4dElR2kvONvmWnH7QhPZwyB3UnpqMDH4qQY3W5NZ+I3Yzrt+T8cRQD6LtLeAZ/RcJc/DJWCWH
 FSEc1T5qRFOZ2gAq4iTEYIOeLvR7ldiWBOAk8ATBZAwvgu+w737L1N8Fpa5dapqCaWG+I5owEUx
 3mL08bMKdL0EqJKcyfO5R/oLxiYR400iyMMJ1adnpl6HflOer2BEWPWRbiS1BgYeZcZKiFkV/Fv
 r8oV8jDWRpkw/6j/u2w3bNJIrTOYKw==
X-Proofpoint-GUID: Wv3FwVjJ-SORSbNIzZwUQ4M-5Kpu3xwq
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dc294a cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=jIQbB08qyBSz40biqjoA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-ORIG-GUID: Wv3FwVjJ-SORSbNIzZwUQ4M-5Kpu3xwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Tue, Sep 30, 2025 at 08:48:13PM +0200, Neil Armstrong wrote:
> On 9/30/25 20:43, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> > > The ports definition currently defined in the usb-switch.yaml
> > > fits standards devices which are either recipient of altmode
> > > muxing and orientation switching events or an element of the
> > > USB Super Speed data lanes.
> > > 
> > > This doesn't necessarely fit combo PHYs like the Qualcomm
> > > USB3/DP Combo which has a different ports representation.
> > > 
> > > Move the ports definition to a separate usb-switch-ports.yaml
> > > and reference it next to the usb-switch.yaml, except for
> > > the Qualcomm USB3/DP Combo PHY bindings.
> > 
> > Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
> > and keep ports definitions inside the usb-switch schema?
> 
> Rob asked to not do that... see https://lore.kernel.org/all/20250905175533.GA1000951-robh@kernel.org/

I'll respond there.


-- 
With best wishes
Dmitry

