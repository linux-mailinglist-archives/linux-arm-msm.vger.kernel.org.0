Return-Path: <linux-arm-msm+bounces-79006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB6C0FDC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 19:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D74DC4E5765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D4C3081AE;
	Mon, 27 Oct 2025 18:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxUqA8bM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8F2E0926
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588578; cv=none; b=sorqlJDXcOlYVqI4H/caP7QuQdVcO6bX9zHkuzIkr5wPytdqDAyjGl5rQtOagE2FubscZkLcwRfh0c0rr+49cCaSAB443/DFzDFOOmOdD8lfbgOPV6QHzOEBJTFddgEax5kMFLXvnd2Wli6VNmTI77KfboHTCz19+s9SF9xNOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588578; c=relaxed/simple;
	bh=S1NHMP6vr4XgQL8VY1foJuw9uXM8zwcN1ydxW62Q2dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXz9WjhZTmIL1eWB2qw5idE4U4thSYybeit69GcGs+WApDDhGRPRHd4piPkVHYBXWL2zZ4n7AB5a4/0pv6dbCgKyzhAmZnxKkzZ9psES3L+DWSiBpNrlCvlVmr4l1TMY5TDnkfYreF+6frJlwWTehXwcRskt+pTYVjIyTpMtJdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxUqA8bM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RBK0x22546933
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nER5Vf2N6nzZ19kKqRvG3GDVZFLsgbu45RxSnf2oF+Q=; b=nxUqA8bM6E4wScYk
	uUrJEcdPhSmePzZ6i+OFETjex7hfhy0gv1Pv4HOtHJuYMmcUzrtex2nbAfc2lzWk
	GP9irNBn10AE7HNaRavVxrgQ36VslLiadJ9ZCceKX5KI1273J2duDQdLvOWdSsFK
	Z892xm7/QIFf7q6vEeN3jYree4d8Qu1TpEK0cGFGZ4Xd4YAaupAeo5xWLXRg0YJg
	IHdLt8gXqYcC+ikgjXt8Ljzng1IQDKb3tp3eh79KclTeT2jrtTF7+9TEQGSdq3k2
	Q/N31zvqWSzKtYB6OR7Dc/iAxLxVLb0kd/kRGIeNMMZFXlR5RhuvyogYWywsHTUY
	sw94iw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2hb23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:09:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290c07feb72so39738665ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588575; x=1762193375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nER5Vf2N6nzZ19kKqRvG3GDVZFLsgbu45RxSnf2oF+Q=;
        b=cyl7J+RkSXhK5oBbW//4hW2GrdXjnBZ4EghWggfOYlSQEDRWXO9SnBkEnd1D1MreQC
         eGBWLdpwuz5k9H9ZswButY1qB004TtQ8EwyWbP8DENuiKQYK15jeRFDu07xO6kRuOmc5
         CyxY294rnng9EyrA5op9uJB3M9oXOxWfYqTf981HhfvrkaN/kcGBdh16KYV7rlTLbOIW
         8kSl/bkpKThJ1jP+XpOcIMdZFT887h5UCcixE/LrRkUuA3FM/FCuheD+aLI5MtRq3aBX
         2YZesLDWDaJZ9j3Ux2TgNG0lBhuMADcWJ7o2NLv8duMLz3j1Kbt+S5HdlkkQTPFKQwmU
         J4cA==
X-Forwarded-Encrypted: i=1; AJvYcCVnYjoSAzSP2tUehELHWdkFUumG02wN/z092NDlchrHJdDh+iaktkMsY/2MdryPlVmmvp9ZzUetXHJ7zlHE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk537/QTMbYoh1/xsXW2CA3el3xf06Eei0cf8QXMRGm1H6HgCc
	B2BuaXMxLRKlz+blZEydBTRB/S2aZFYP/Tjf1zF7eME+LH+B2QrvfnWCkP99hDHJqFsmQl8m38/
	IGOJZt25HyFim5APuSBhkwd79YM7C5mOe1eD369SzwFR3eyjuC6ah/AXvu6NUnos7mrGgs1Zma9
	W1
X-Gm-Gg: ASbGncsa42s+jFe5IJ75VRk85I40309EfEFNMXHFYGOfhbGcMw12pmK2zapQWzRzd6w
	SzcGalw55oEFS3wUV9EG55gfXhb1ZcSXNnX4eiaQOpr+Ed4H0Sbfo1CiHap3PzLu4a0tvCDdv5C
	6u10cQxxBZm0rq99puncGijPxgBfRkRaHNSVCgOONDUdZz+gRtcVPbXJYQ3soBxQWeuQeMNtZEX
	HJWbRLYpfb01wYAD+hqyLFoCKdOQxwHfRzJFZCxTjBzGy6IdqN9EPDwPBGOkEyyVxuP6MLUdPES
	Sub6uRT8rBOdjSmzETqmGYyXqEn47/rJte+As1Nd36BaqoGEEpVk6iBvigRoX1jfje51J3l7idb
	4FyYoL6LBd+YVgR3i0OcOvLi88HfY1R3iNALGTczjFB6TThTfwPSn
X-Received: by 2002:a17:902:e545:b0:290:7e29:f59f with SMTP id d9443c01a7336-294cb3c649cmr9399165ad.27.1761588574657;
        Mon, 27 Oct 2025 11:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE82MYBfO55vca4l+rbNsvxfkVy8h4wEuMXDl8VHNIaPRKmfUeCf7yfL2DCaJZaMig7Ct8ULw==
X-Received: by 2002:a17:902:e545:b0:290:7e29:f59f with SMTP id d9443c01a7336-294cb3c649cmr9398905ad.27.1761588574234;
        Mon, 27 Oct 2025 11:09:34 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d097fasm88793685ad.29.2025.10.27.11.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 11:09:33 -0700 (PDT)
Message-ID: <4500ae03-c95f-4004-874c-66a6373a6a6c@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:09:32 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: rename constant for clarity
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vp7MpacO7qT0fm2NRzG4N4fVYEzDs_1S
X-Proofpoint-GUID: Vp7MpacO7qT0fm2NRzG4N4fVYEzDs_1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2OCBTYWx0ZWRfX3Tstz6uRybUU
 cvlVcjsBM7lW5iv4xEztP0UYaI0ybe3LbZJgoxuU15uYdvX0/G/p9E/IAx/l9Fwg0PQrddMR6R/
 nWMZbi6TtvYrszu0phvM5Xi1ef90n8D35+Zyr2Yc5rXOH36NyywalIAMgenIcM7VIXpdaW6BrHN
 SgpNi64cthlnPshDTD1BcoxJ1LVRRoW/y2oso6R4FfhLH7P9LMDaaSMRDYynGddyIewvI8q5vlX
 vgZfpokTJRhvEriHTutBtxYsm0rxd1wB0AK3/QxsxiuK1zUBhvjN/ngwNAIvfRYawmdo6Wp0RZ1
 W8b6BZ7XmPsczawnxaia30oFGT3w6PdEEdz3BzJxDPM8aoVv5MM6DlQJNgIeWbyd71EiLtGSEKh
 DnGETrlx5ABT/KEXdRH4vs9vVh4Rqg==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ffb55f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f2z2pkWm2ht2ZSlzglkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270168

On 10/22/2025 8:16 AM, Youssef Samir wrote:
> From: Troy Hanson <thanson@qti.qualcomm.com>
> 
> QAIC_MANAGE_EXT_MSG_LENGTH is ambiguous and has been confused with
> QAIC_MANAGE_MAX_MSG_LENGTH. Rename it to clarify it's a wire length.
> 
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

