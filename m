Return-Path: <linux-arm-msm+bounces-77954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 828DCBEFBE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D223E4F02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2D52E266A;
	Mon, 20 Oct 2025 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyjpDBVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4BD20E334
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946843; cv=none; b=WdkrBNNpxlqQeTkxot+FiYCSnqcdqqYJwWUp7thxqd5Q17S5+5OfMUdLkXgvr7oBq2n+H/eotctmGAuLDrIjAAXeZx5ZRIYx/ED+rYc6lEqRIQX+6kXeSqI9FXkpUDh5YrJswpA+kRJrSqHK9yln3uuQk6HN8XAL9+Csyb0SkGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946843; c=relaxed/simple;
	bh=J9f+oiQDwLpd1KItLRGcX2lkXCnsuxnjjRF05bHlNh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYplBaads99ccIlot0mQ1rUiahzsBGscSczSuskEYtF6MI6vB0lsHWRQDGVpggLx5haxkEp0zrzHsm9K/n2NcgSWmubSnvpu1IuFwC1181+Ta9gjaZRBlfNEpUan4S0Pxd3QQgueHmO7P1JwggutaIki+a8mBe/8KMsOfDEBB8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyjpDBVc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JML7ch031237
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LM8Wb4xKnXMWYUb3EVKiXBuMBJRUWQkyl4ilJog4k/4=; b=iyjpDBVcH7Je4rLp
	cYkGTjynusYe4ujH/nbc88urUNJGZqocwL+V5VkVIkzwOMAqDlx676bhMLz3I2Zp
	GUZgzqTEwU583drosSwQZfmc1Tt0LgXwc5g/z+dow2CZjpsWkHmphGmBLcp8cOp+
	KgkmRGQYAyUbAD2ujideYQyyh7x3w4zJrub6jzBgg633MLNmda25muXmeEAO4mXE
	ndid3/A6UzjNBr8QWigJxPjn8wKaWXJVPSTt3oAOKvG+E+W0uy2kBqG1W4YZEqf8
	P0A/1XaL9UzABAkikKu4NqazPWiAtNxQz2deqkaearQUUy9gz5uPg5BqfAOhpac+
	XKovmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2yv3yus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:54:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-890c743a001so113242785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 00:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946839; x=1761551639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LM8Wb4xKnXMWYUb3EVKiXBuMBJRUWQkyl4ilJog4k/4=;
        b=q7Xco0XOyUbLm+Dj2JFQ6Lvu/a7CF/JudHDD5r9RJzJ6V/8PmK4sLR78qvi3MisKBE
         dPS+Vt27g7dsv5yoR6nI1C5Y4C9VnJooTvRnwnbGsIU58QkYZx/pt9WuMemGiNuro+0e
         9Nla8OEZWhoTnzdfhgoBJwV1uNkGsFe2I0H9oTMjm2Kz6lmqKYPmzJK2d33a/daI3bNO
         lHto866GJgbz0kfnlZZFYtvS/hj82TphT3fSzqVr1ugUOBtQZfPiWRiwJEvvcbEcL7EP
         PDlnMFZukBa5nUiPtv8M/ZI4/Cv+hrDpAPa+G+KVpBHnZQ7u/0bzv11oCO7zeBR/r3NQ
         dxMw==
X-Gm-Message-State: AOJu0YzoE/p27vOqY4xBbMb2dMSYl7W7NXhtrlSNVXqlUP4ycEi219ph
	2LYEi4+8KGwgnZUJ+C72a+K2EXVhQfKBxTQdb/e5hP3wyjXYm3nFJC3p+INiKH1GtZNxvXjnpbU
	KH49qf2Z7qTbv+sxvoPigc4VdQZ//K4E76RrUHY76j/DzD9xPfwDVuCgzOVxl7qSRs5sH
X-Gm-Gg: ASbGncvPa2fir6QCQq7F5ijXjgGLcr+BPA/KoxcxYbut2wju1vcPg3b76LTPeW/+FAb
	EaJb6GgGIlMF432qhEryFk95M8gnQkFxWo55sCOvibmJiHyXC8rerRv8+567i+ZgZkREH1rxmLQ
	DvwPStGAtqBBCuV8blbOR+lDfQ/xDp6ovEh2X0Kt22S3YJknCfSTTLPuY0J4T5pQB8IPPLdw30q
	qPI0B4W0CHRvg4mfZhO5CS6ufzz9xyx7FQrrOwNDGmBEHbCh9P6SfpCJLpII5uRzn4CHd2PE0w2
	YeGKTNiWY20PK8/MWfj+YECDQGinmdoevvrFZih0cbT0BWaLjV25+jQsez46LwpgWdHgguGYNCZ
	KF45yV/9NqX2tkWQEQY5XcRXs78QzjxbaPeD3TmEJ7BGJGfuq+zBXkssw
X-Received: by 2002:a05:620a:199d:b0:864:a09a:e860 with SMTP id af79cd13be357-890707f70e0mr918100085a.10.1760946839349;
        Mon, 20 Oct 2025 00:53:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMZp+OC5Adsa0c1sBHHpTL1fc8+Qf9FzzDHNItwHbY6gNDY4TIc/2bJJHggDLAKLYsjXguHw==
X-Received: by 2002:a05:620a:199d:b0:864:a09a:e860 with SMTP id af79cd13be357-890707f70e0mr918098685a.10.1760946838910;
        Mon, 20 Oct 2025 00:53:58 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8393778sm708060266b.24.2025.10.20.00.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 00:53:58 -0700 (PDT)
Message-ID: <e51e8665-0245-4ea6-8c09-c73004a34a3d@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 09:53:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add polarity inversion support for
 SAR2130P
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251017203438.744197-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017203438.744197-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TLlnmMCafNOcBw-vmKpUNmzUYrz5vhzB
X-Proofpoint-GUID: TLlnmMCafNOcBw-vmKpUNmzUYrz5vhzB
X-Authority-Analysis: v=2.4 cv=f+5FxeyM c=1 sm=1 tr=0 ts=68f5ea98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BrIiScFafQzKgqpYfbkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX4CzzopukQ4b3
 10ZVsUYPxmUxHdy3YRJkSXCDRQHEREUx+1kmqOZese/K4FRBNr+WAdm/5F77exvOK0SpkKl5xAt
 lOXohJy56cxscb3YulQqqoc0mWZf/pfZqJTYuf3hbgbl0388hysTOUS+n0jyAPwhfhvvJV7T8a2
 szo5AnoIdAAMf9q+/ATGG/93oFoy/PWIxH8R1nGpIZ+qzTa5cE50dwrto+8PKZ4OYMVeu6vBI8k
 /CFak2hJ6Z701lHsQAOLkZqS7AZKcX7lwjUSrA04mfn/BJCIF52lj7lser6OohOH2xjgiPR4LUg
 u02MczQGwHBrs2Z0S72TRC5ATZ6k08lGhXWBPzJyHAMWq9K2ceC8L5lPkkrr1di2LRh5syv3x7g
 dhwV9vSQPHjiF6fPAUzlnxzFoFrvnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180023

On 10/17/25 10:34 PM, Krishna Kurapati wrote:
> On SAR2130P QXR Platform, the CC Lines are inverted and the lane
> programming is to be done reverse compared to other targets.
> 
> As per the HW specifics, Bit-2 of TYPEC_CTRL register indicates
> port select polarity. This bit is to be set for SAR2130P.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

The downstream kernel for this platform corrobates this

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

