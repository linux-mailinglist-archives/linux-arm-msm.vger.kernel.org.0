Return-Path: <linux-arm-msm+bounces-70319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F187FB3138D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00451AE3CDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DD22FD1BE;
	Fri, 22 Aug 2025 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWVpWQk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCC42FC03D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855026; cv=none; b=IoRlOiIGLSje/QhnrR245BhMvTvqbgpGufRgfx63OJgZDfl/e5f3xHcDMf0sZe9DjHDjAP2uo5Ws9pYgv6SLOvKLfIN26rhulqjOO97UI5UNsgEHdqUf7JEYrypLjAwphifET7Nd9bsuzYmdlNHahVY0w3XhPV6fV8fUTiICBYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855026; c=relaxed/simple;
	bh=DDOINDlN4zJfXeUV+i7J2/ny9DQpMWb+X2z1LIO2v0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHEfGmdY8bMxZ7Ir8Ujkvx+sVWnJYe/cbc/As1Jg0MRDOxy10YUWMYOnaDvWIcJF5sXAiWBI0notsgUbYLMlwiojtcyhP4lBSHbabyzdFlXGtjJDjkkBOIVzHYR5bOuToy5uuwguPD3MCUYXJd9TtSTlHi4DgNFBeHpo6QABJsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWVpWQk1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8Uhtn006837
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=apgzY6IIDslGxm2ZxHxgxxLn
	8qHnWA9Q7ouAHkWulDk=; b=PWVpWQk1s5S5VH+XVqgN6h5G1JwLdtQQbiOc7xJ+
	0avKZl8+BGCTG5VQkt+ZbnVhRAOZiNxwELWjL29adVz8OGkSCuSHBIkMRw8wQApy
	0eg0Rr2mA3MFwnDGdV/0on3OB6DgBwxkGBj7pRVprDS3N9GEvcnuDFpCxmYMztt7
	b8hbsSnIaivhLona9IzshfMvX4h11oLDijqNfiLDG/m2vPEGDLxgTtvQ/dqZ09z4
	W7L8GDZh0tsDNpQcc3i4ohWSq/4EdqArFvBi69DeK5WZWDwPF0+ez9SoHCFid/of
	F8yDHBND57vBPkqDmB6Vk9BFAT24AZn+D7inmHA4neCUMg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52drkr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:30:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e5c4734so2165480b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855023; x=1756459823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apgzY6IIDslGxm2ZxHxgxxLn8qHnWA9Q7ouAHkWulDk=;
        b=wW/tbCE2wv6JHf+BFXccsdfPKNDM/5zbqd+hEYMTBWcCVKzvbeqY4yoTKr28y29HAh
         DUazxuXtFlIrwogbOFX/paIdxzKDMnartilFPt8dDAn/bh2wcqFMJ6MPqatyNqCybpjt
         YtTp3K94IQt54futlJQkYlf5HA1FAQoOOGB12AnFLrX1gRf+8C+rRw1aa+KSioJmpMsa
         aiBwCtSmV6E/g8LHW2nTwvQaBoBwhaGOnRSPiF/CmqonmRYWJHWM3rOc2EUQFztuBOvg
         L1wJfbkUIA/6Z+GC0ZZYPMnYO2NMG15LuGqBWcyzpq+/smbZfYBITJgHlUDA4Iym+tWh
         xbXw==
X-Forwarded-Encrypted: i=1; AJvYcCVYrU0W/74/ju0MCyxbj7tMdznUq2ZI0EbyGs/XNPGOVHtSfvL5ZdqfHvtCR6SizD2b5/XNPvYBKmJj3wRy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbh//Tf2dAoSFP8iDYZrsMQYsWcFUMSZAZrhHq2d4OFwIdbody
	a9bbSFelOoBfgXDSj87KFurQnTrV4Iqk/4IObtT4cXrF+HqMxxQDLh67Cq+9p9HTgZNwaDGPtxw
	iM1giw4ap49YM2atvFaH8vzP+Q38KmUEwzkRXVdLylW6VrvFPcCaeLMUiiyf26aqvAKTQ
X-Gm-Gg: ASbGnctcFWgQC7IQIPFKu5ge2dQU2wwYMfOu9cGGI8/EpROrLhcQk4xF6Ll8y9dr+2z
	64nkML/AaJcA8HtwiTwh1kkZAAxbHQ2vMu+ZgBC1ttuvoN5IzeKpw1NIMbqrSzDLSdJxUYDXYdj
	kGiMK/sdut9SooCX/kZSiGk1JaIcnpEb1DWY56ae5U32lFUyBsz8Nb/539iup29q/yUO4NB0zFM
	1pdGAhui5d50RD0fhsIAlwjqL/AWNJId9vJeStYhMrahn1pQPU5+MZ8SQf/Api8/C+fnOP8CZfM
	0sWTHU7njvKYWeo35PJ7f9bHLA5wVVKXu3PlnZ6tfIu/2JFj+/1X5hCanZSZ6Z4Xufk=
X-Received: by 2002:a05:6a00:2350:b0:76e:885a:c3f2 with SMTP id d2e1a72fcca58-7702fc2d339mr2910844b3a.30.1755855022164;
        Fri, 22 Aug 2025 02:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPjl9du6NbhNGBRG4TzW7fpJP7yr3XTt7Akf+uqRroowTWYPJrBk6a36wmJwTgWdjLdbhyxg==
X-Received: by 2002:a05:6a00:2350:b0:76e:885a:c3f2 with SMTP id d2e1a72fcca58-7702fc2d339mr2910802b3a.30.1755855021746;
        Fri, 22 Aug 2025 02:30:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e894bc4d2sm8255639b3a.67.2025.08.22.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:30:21 -0700 (PDT)
Date: Fri, 22 Aug 2025 15:00:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <20250822093015.snkxlspg2czzrmgz@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
 <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>
 <a59da8d7-4e35-4af5-8b9c-96aaf1597271@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a59da8d7-4e35-4af5-8b9c-96aaf1597271@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX679hDEfUV8sG
 8UMnm7Um4LjXGriSNJ/AD582Ec+xJRwTdt6BXMNcx1GfhmyybmV3zj1q8hfYWFpUIVKDydpYic4
 CwzXWcXfZ7OFx8GTuzUHeGIluBUKTOYAJs4VW3mIL0X27b7DhX1LSnm89XcMPD4wt5I8IcYS0pS
 SD9JUfaDL8KHHJMv0TVAI/J1q03aaO712hMTL4UyKKiz7JczbwcnyopVBdtqoKaD9LENDwS1SfN
 9ErqE9GoP688/lbiV28BjuvWeNL/gv8n86mEyefj0+BvWuz3WZEPWB/ubEKOwCau4EECf7qidHA
 SMhvtiqMjVyVYACBsH+m1A8A6VvluhDDClZ0b1fhNzLg6m3L8AZIrU9L+ZfwLkIsFOclERRPzc8
 d4EIIuL7mqqm46iiqPHdS182o1qsOw==
X-Proofpoint-ORIG-GUID: X0SL7RSRNOB-BF5c1khgdftQxo81lDg6
X-Proofpoint-GUID: X0SL7RSRNOB-BF5c1khgdftQxo81lDg6
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a838b0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=DtrYIkIAubBs6YGxpE0A:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 10:35:42AM +0200, Krzysztof Kozlowski wrote:
> On 20/08/2025 18:32, Mukesh Ojha wrote:
> >>
> >> -- 
> >> -Mukesh Ojha
> > 
> > Since I am not subscribed to any of the mailing lists to which this
> > series was sent, I am not receiving emails from the list. As a result,
> > your recent messages did not reach my inbox. Additionally, it seems your
> > reply inadvertently removed me from the To-list.
> 
> 
> You decided to remove your address from replies via "Mail-Followup-To:"
> header you introduced. It's on your email client.
> 
> Just like you will not receive this email (surprise!)...

This was not intentional and just a switch from mutt to neomutt where I
have added stuff unknowingly to filter things and showing inline replies
correctly that may have resulted into this.

> 
> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

