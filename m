Return-Path: <linux-arm-msm+bounces-79005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9AC0FDBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 19:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A36F34E7453
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA223081AE;
	Mon, 27 Oct 2025 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="de1RA2UM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117231A044
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588540; cv=none; b=oYQtmyjaNpvNGyXRnXD1u2kiRqM/isYHelC/oCjARO1t6Myh1AlknolOZxVBG6fkVsZq5+lUnv/SZ95tEXpWoZNb6gfAIbe/CNJdTyVf0E1sWIMDAVHkWctWEyG6Qg4uHlTiua8ovGSQn+/MljVSaI5Yr1F62lGUffmTswkZNfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588540; c=relaxed/simple;
	bh=mQ5yrQiiLezsNbS2WeRgOKW10mVRu3yaZW6ikZYPChY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GyxUom8qeJhqZZXSFp8fL8v9CbY1/GaR/LeNxJWmEh/154rTF/8TYjWhlVWoosQezR1PjbLmufMNCboKFBaSrV7GLCePSYB52L1iojALETxN01ivsx1UTL/rzz655nqZudRo7QN4ugMk3XustUmr63F2v+dEZgZV+AoVgRMPOiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=de1RA2UM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RDfhIL2881785
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hvn7LJasZvefGH9/xPy6TvYTOwT6SohrY6oT5mpUx/w=; b=de1RA2UMmZR/C7Fi
	HSdjA5nbIFrg4EfkFE/4UIllX7bmzHc9vgvEwFDZfqCRhEuUF3j4g4l5X/N8kMrU
	aFT8BYRxA79MPKtUElLQ31s6Mc/B3n/FKNmUxuYdrWXXb3bSXCklblNDdS9Z4VzP
	6yBbWEBdB8Ki9zDML4X6+jgcAJBnIwIigFzQmdO4cLSXspsZEeWoIMdXU92dX1oi
	O/WWyNrFlZ8Ppd4htrELT1joRQT5qwzpG2ytpye1vhEPVhsbnxQ752aVvzudanep
	R0qAqkPtKyYKd1J/9zMNZvylqb8anvL6o3vOlDTS1/92UVeXbaK70tn2hDIgw5Ho
	qAzeIg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uh8xmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:08:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a432101881so2340020b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588530; x=1762193330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hvn7LJasZvefGH9/xPy6TvYTOwT6SohrY6oT5mpUx/w=;
        b=LnhtTbmP/nt00Jr3rvGi6JKMUTIJKX8NqxVHz4EZH/G3XfkJC++1zjkzRP3NmHu/Do
         W8alLGv7PNmaEpksCadmONBw/jc6mimlIwM5yTQKzr+eWWQtHIZXW2FI+vIaVeUU09If
         dWPOnPyjU5BofpuOATjUKKAETNh4OT16OU6lbR8NgLFIpPBNZcgRq3vLS9tNfSZExO+s
         jRfe6BxGjN3UWubY5Qz21h2fX/C9nbip9HJWK3zDpxShlH2ZWj4+rk3EgFKTT9BWgVNg
         pmSMwpzi0Rl+4p3KCdkRTNfXY0NmNsykoExgd0UxN651wMrRyigkLcSt8oz8lYob8O0u
         75MA==
X-Forwarded-Encrypted: i=1; AJvYcCXSukOGqrGsNdoYFqnFdYFsdnYy6jAHnAvViqSoElNbsiGR2kGBYdki6VN/XP5BFHbe0O5ixjU5scd0aeET@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8N7yA4/Ehd5J5dNAgkIxaCH4NCAspdwEMLfrTn1SWEvb7sY1H
	n57bqiJM1oBRJ4zLes9CDIqOu2RQac1zzJkJWz536xH9xoZOKvPeKa2JEJsWAWgqj4bEH0GWd6W
	vFw3oukQFa9daCkx+Ogz/f/S+YsDvs8zMvEFNNV6rPDNZDxPUJFjrxRIJJKp8HNkmm1jR
X-Gm-Gg: ASbGncubszZfGa75bG9kUMT4A9E8I0ReiNsN6+4OtosCPCBC7JZVlKPljMgTHEX6XnI
	R7lnfeBPeQjkGCEmzLMcwMWDkLE0gnVBy/545sfypCIpqdqb6gpgZEJT/ObYmpQp1597DAayPYY
	8r4F+hqAPQyD3mbXrRKbQtN6iqd3pe1pNgqgWp5Z0Lqlt8asFUlQnpDj2zp4tdAoixsMzPQ4j0f
	paNorBDmXEb9xhmjn8QlQrx0LS56LsJkyzevV62+v6pnhf9KlsJIXDM22CQf3m36qZfrWlnVtGK
	98A5fsy/bwIqt/RJrVu9ighx6cA9wll9iE9RilJfTSkaYnFbXYVSsJUEjE+NstmgX1d647GnXXe
	KDkgZpTT4xdrbJDJa6j7N74KtuLw80bJ3rFrNi4A7mvB24vMqv3ac
X-Received: by 2002:a05:6a00:2d09:b0:781:17ee:610 with SMTP id d2e1a72fcca58-7a441c317c2mr1072112b3a.17.1761588530453;
        Mon, 27 Oct 2025 11:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnFqQqxMR0ZuuYg0MuwEfEzhNhp2ik33Kx9l+7eRLMndtABabQLoRqA3ZlvV32tZ6Y/G3PqQ==
X-Received: by 2002:a05:6a00:2d09:b0:781:17ee:610 with SMTP id d2e1a72fcca58-7a441c317c2mr1072072b3a.17.1761588529993;
        Mon, 27 Oct 2025 11:08:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414065418sm9024634b3a.41.2025.10.27.11.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 11:08:49 -0700 (PDT)
Message-ID: <2a35fb51-028b-4dde-99d4-ed43aa4bf399@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:08:48 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix comment
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1hTUEzUbiBAUbWFFJQk2bQDJhn90jAfl
X-Proofpoint-GUID: 1hTUEzUbiBAUbWFFJQk2bQDJhn90jAfl
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=68ffb533 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sS_EF5oJ7B5xURoN_h4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2OCBTYWx0ZWRfX8J8xlniyW72W
 kpqaHkzIZRuzWxhIwYP7taHUGznyeNffPRtFq88CJ+OIfcsRhKR3RRmeml2Jyt9Hgp4VnAi9+Qf
 ooFmRzub1rLOrmXIMFKEiOFdVlV6K7NiRTCfK1XXXORRsjv+Ehhn0N43mAb2hUbSat31ghQ+atQ
 ClTwkSsMVG7Chd+mIryWf/saY+HKJEZ4zkYR6EHrayruHpTKNhmqsm86T/isQbzrFDHOAHfsgUn
 XJdt2qC/0z4DHQcRRb/S6mEACIgxsPbSfoHd6ItVAznTHr7T0g2sImC1EbUrskkHQF5VPrXtWKi
 Ye92kTOgoVucs/FoeJGYJ4+xTKeHxDCO0Nem3ODwc1Iff5+S17SW1r4yp2rWrBtjMMJjrOOZn7C
 +qf55RC1mjlhXl0OXF8YD+1bDcw3EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270168

On 10/22/2025 6:41 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Replace the word "Qranium" with "qaic" in the function parameter description.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

