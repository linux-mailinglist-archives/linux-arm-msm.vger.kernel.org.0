Return-Path: <linux-arm-msm+bounces-74396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D6B8F668
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 10:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 860D018911CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145E32F99A6;
	Mon, 22 Sep 2025 08:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHqe234Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D362F3C21
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528298; cv=none; b=bFt/H2g1Zy8Ueufqp6ZQinU0Z188c74/HByKODCTj7F/koEyEro6NP3AScV4vi86iM5rOYuEqyOsu4TA8Ymv9l4dDshdcJgzQKNtM7FuO07b+Om1n80itns5fwwa1/mFw33dlBxbx7advfcQuwc1uvG2igbAwE2Lb15dUa2zj54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528298; c=relaxed/simple;
	bh=xLT431DxIwGI9NTKBWbscnMylArnj++bgBzt6HSURuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mcy2Gyx4p1zXTZZIafh1iU5oERuM8P7HOzBLoUl6t2LcQZGnl/lccK5rDH4+Orfy0Xc9od7bF27nAqLiyMj60n4JQ0Uf1MZ5M2WT//is8cYe660pkGYS9Mw8kt0mOJls0US3OWkXPugRINT3Jp1XENMD2k5uCZQFroPSwxwiLII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHqe234Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LNeRZE011505
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBOlNt0KylCLkmD2DPMzP/dcM42JfiU2PW1abyinKzQ=; b=pHqe234Qr4hfKtip
	8vFbscrqsNDOJhQB6RrHpm3aVnDYgX+Z/kJlOKRtpAQS+BmMCNPZbbIgYBX8TWmQ
	71izMGieIm6StRm2fZ+V6HPEQ+Xtxw34Oiss6v1xpQNjc2WBCerD++Gfil98f04E
	fLRJZhDAIbe7ZeXi4quiOU2HYvvDZo+BFPKdadiCebtgvq1//aAkVZaq2fiVzvX7
	LUbcaVOsO7rmVQrDTnvEyWTE/d+sNF9k4VYg7y6R3hHIGVZf2zIKCI9+KRWrswdk
	pQey1qYAsRpdNYPhW/nKj7pWdqbRa+dKC5OZxs2lNSrOtrDrN3A9vEa/HyuSGWRq
	TB8gPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnm4k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:04:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269b2d8af0cso8182745ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 01:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528292; x=1759133092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OBOlNt0KylCLkmD2DPMzP/dcM42JfiU2PW1abyinKzQ=;
        b=HE7HLphypdsu+yxytRj2gp2kAmRSgNzY8EGTOZInxMLkS9/LQcSPAWIWhVBv0RE7RQ
         c83nyX99NK40R7BW/I2QZITM3B6DA8W6x7mXged682KZPLWl1phCRzoPfUekwg5hxYpN
         TTEN6pnepQ6tHxCQd/ypEwVtc/LKpyoUPEQALi0b+yrrU0ggX09kKSHGCPESqSMXzvpL
         dWHfTkjD7BIVBYfmM9/Avo+iQ8kNGK57xmlyEfXvKeZCuXsBWG5MnMaubb3GyFcpFClT
         E6oBWZVWLADjIv5ov1Q1iEDh9RcASxR3r+EXvHAwPG3H5DHAjh8k/Vh+2zbXSna8FYF9
         JOJw==
X-Forwarded-Encrypted: i=1; AJvYcCXDgR93ax0G6C03q06TxsDxhpdyC3jdMGQyTrjzu+12CHNQ0YrWXjaGoDxA0DDp6Z2cp2AGCR5XMbWH1z0i@vger.kernel.org
X-Gm-Message-State: AOJu0YyfuwMdtOdAv0h+eZsmD2ZgF4M8nD2ksHseTvAdy8nzlMYss2ct
	cx6R/rQP6nIyvxYlhOoU0H662H18KxYUWfpCKKOM/Y+dIuxaMuk/Hb1CMSy0jp+bvERfo78dylN
	WN+edSlIpUEXKmjOneLURI0WImHVEOn5um4HnlMgdsbo/SAwbC6gNWhD+eyd2qtq6W63z
X-Gm-Gg: ASbGnctqXtCGAOxifkuyhNUqzdOWHstgPbx6DEczhczkliK8UJYWzf0swmDkJ7blgPg
	CnMBGNpWtP0j8PjvRzjZM+mwGHE2ekW9bjrDM7rQFLyC/IZCYwp+keaGLTXghNUKMlOQNctZhE2
	k7ORjRiYDVUtLDopVOKH5gQRemy4xuHtTMqOaoaUgkVhbzndABstKETXWr9QnhX7z7DXFpJPOYo
	Bibhu2R5mGEZsjVgisVVOk96aY91xV4MG3gAqk0vsU55xn+ooHVG31GuuM50DKNph+qnj6H6bYn
	D2rDJXZDfL9qGMJkvRqFoba7rWz6Gu30q6dTqE9SeMjESvOA42TEDNRrQr4tg+ZLyAmeRRpKolk
	sHnKQSZeypYZ1N3pQGRj1uO+/gyPOMwVsug==
X-Received: by 2002:a17:902:8f90:b0:269:85aa:3776 with SMTP id d9443c01a7336-269ba565f84mr64992155ad.11.1758528292458;
        Mon, 22 Sep 2025 01:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETp7wbXt+1gQikMI1ABo2kP9bbRyManwLPmYcLYXRvB4adBdDDjXk0Op1hW4hh5H/vg0jXlQ==
X-Received: by 2002:a17:902:8f90:b0:269:85aa:3776 with SMTP id d9443c01a7336-269ba565f84mr64991965ad.11.1758528292012;
        Mon, 22 Sep 2025 01:04:52 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698035cd39sm124460975ad.146.2025.09.22.01.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 01:04:51 -0700 (PDT)
Message-ID: <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:04:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d10325 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M2ADfI_v5YemfhxMpdoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DcpNn6vEVk76jWhhn91D21r8m_AB2_rJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXz43k01bqYI9a
 u9jRitTMOunn+TCv20xISHbQfuVGxXLleclhBKWkQ7opJ5gkVFKpnOGRFPkfttPavXrMEOwhTZt
 pe9PbbUGLFbZVTUhLGXl8+XcFZkf3K5iP1TCGmJBJgF73HjtpLLEqXOcX+0m6rA0Y50LWF3MFJk
 lQWa1AjInYSWmhP1hgpaeklz7L6ZlW8Nbk6qY+ijbXz7R8oPD9bPoXzO11i8yQi4rMyjZC2+1EB
 yrhG2gKtwRpC5/WsBN/Pmrg6HtzndIA0zGl5fKI1tYql/ZBHQ790QF9Bzf49eUZg9XTM+J2RX7p
 DUjseRQEsjxmJXFe81dFg8RHufpxjDELGzDBXTfhc+T3jhTdOhxGdPG4QPivU0br5ifsbJ+KVJs
 3zXYHoS/
X-Proofpoint-GUID: DcpNn6vEVk76jWhhn91D21r8m_AB2_rJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000


On 9/20/2025 12:45 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
>> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
>> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
> Why? Start your commit messages with the description of the issue that
> you are trying to solve.


The original reset list only works for USB-only PHYs. USB3DP PHYs need different
reset names like "dp_phy", so they use a separate list. Moving resets to
qmp_phy_cfg enables per-PHY config without special-case logic in DT parsing.
I will update commit msg with issue description.

Or do you suggest using (offs->dp_serdes != 0) to choose the reset list instead
using new attributes?


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>

