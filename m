Return-Path: <linux-arm-msm+bounces-84886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 405C7CB25F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80A043013EB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 08:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F5A2609E3;
	Wed, 10 Dec 2025 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EAAKjuRn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+pbdxgl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0860C1FE44A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765354524; cv=none; b=hiyZpFloCPhd5pXGrQBPqEwzuijaesS7v5w10CViqtnerlB3iVy5gh2fOULbopxYG62uq+5FTSGAGDFBXqE4WyT8YMPsh0Dz7BkTzPO6b7NqRe3QAGgvbmQ0dtRT5/FMQiwjUiK06769Z0xM2CgNBQMEkGDv823ucTiqD2VqRnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765354524; c=relaxed/simple;
	bh=7dWpkT7Vtr0kqngvln91EdRoAb8jh8hN5g7wBBYWKhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niyJ9MHujcxcGuaOjCuvvM4RgwYquxeHzEBENKRSDklsdYN4lBefMUFuUJJeR8GoYyUeh84YE/xVAr1mO2QeknOA798NkN/3llPTsdcGCMzqdcKCmYDRrQpmaSnHRNdrYt8MGkeNvVpmIGHO3A4dv9wzOFdQhgjH2S5+I3BtmI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAAKjuRn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+pbdxgl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DvqA1779420
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WeHPqDD45t9OusVf8G6g3NCY
	TFxFPJOxu6+E2ajjanA=; b=EAAKjuRnYyjCGNaAkuya4iOJBMYVbK/OQ0IZudHH
	RDoAWJQrEmCLgqLOESs426lMTC3dUxVj8GEoRsffBMLzYzqAefMIuPCoo4PmkFWr
	ar8CeLXKzvaWL2Mkp7t6awY7PVpT6tLA/t3KAfV9Aju5z2lZmQW/UbBNMP+NF+Ih
	H6ypmoyOxMG2WqW8aLGUk7PtDk3G9JjiJqAb4gTC/j3tupkBckjBa4DpWa3GgIzX
	IrCmKhDke6kydiXGkJUxAnKZLv2g2SjD5Ncxsgq6fAATvmtis2+x78LAO0bbFAsX
	/US31YgixkgoyxipfvoyizdlBH6gGFzRscQUwpppqfghgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axrhmadc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:15:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so5714101cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765354521; x=1765959321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WeHPqDD45t9OusVf8G6g3NCYTFxFPJOxu6+E2ajjanA=;
        b=i+pbdxglviXdQd8ttJob2awNKW4Elx7Yj3DLAlx5Oh1rw67Hs2MzTBIhe7AnAM7n9z
         exgi7hGJfPPw8HgFRtAm6RBDFhwvC0KmkOd8tjoiltQo1QGeS4B4TLJ/a1Cy/gsbXAZ1
         jIzOpTxnQyaZgSutaX2iBoOtpO9LiAzjVQG4l4SvexBdJiohgrHuuNTzBnhxQNK0Bb1l
         xsBJvNB0b7Xc8Hk5PcQj6+I7kVkN72k+Fwm6ndB5FFcnUmoHVIw5rqwhRsd7qz6Rau0X
         JyEkzR/mm8FOaw7hf8vdvesuan0nURmE9SpCaWt6EMK7iovPoWN4LmCnOEd/en59Rf9Z
         LMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354521; x=1765959321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeHPqDD45t9OusVf8G6g3NCYTFxFPJOxu6+E2ajjanA=;
        b=Vznrl+FQY3iBGRufK9Uu+V7S9QkTG5cfv5tJU8kv1udcXQvaXi1ThxpKQ256C/fpcy
         JkuUNbKMQtVYqE/co7Uvq766TPrc+37LXvBTLXa9HmXkHnjmBYk8mlxxBTbaEg/uKNIA
         LpIGJdPkBcikPsIr2zbAbRZNryngWPVrfiCNZoj5EDd+s65k5Zus3UQpHDvm19FbQDc3
         AXZ2twD2C+O9nNZxGWp7/6HghJSMY61WZpUOthX8EgNjNrkY5W3iyoW0JC+G572rxepj
         7ZHTDfewJlEBe8C67rlln7Z9crHER4FPYlIInDOc9F9ImgkABB4KuqdwlbeaYIF7dYkJ
         U0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIgOFaeG3f+S89txMzYRs3LtBzLTPbVaCPIvGQIIPf0Ci/IELbioRWk/R1y+xIJqaxQltyZQ1aYEYbky+p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2x/f0JDqayZrm1qhi8cIGSTfYHpWNSBpmp4Z5SPb8zQybpUq/
	U04OJwmMd+9bpo3BiImm02EuHZJ6SAArH6Gw8VjeOsGidrcPJNsIL3bAEJTBLpYydnR9GYUuaLl
	LHfFRne124Kh46lMddRpx1rldP2QYm+5gjR8IrepYWOFYjOIHjyEfyyepbC2Gcm7sod6W
X-Gm-Gg: ASbGncu9ZE3rrmtAO+4doL+CCaENgADvpGTMiaBcE6nbGzpqV/5ZPafx/BDpWqInoPM
	dPtOrDYUYWNIlPBASIzf/kiAnb2Sx99fAQ+J3DrF0OGU9gcHIt6eIem8Yjhnoz/DL4BTLOU/g4+
	QDPn2W4n3zakugub+YDTf7RW3ipuK64TP6bxgb3mUYc4mPcBF6vX+jK3PWj7NVJTZvUA7NKmy0+
	vBNyswWhrSewB9Gfo+dVAuzK9TBEIwU2V5a0fRzJ970V9nbPM/YUfdrkKgCrAytu1P4+p7D/HFd
	LRiqnHaSoX+gy/qcJId7ROhRhXe3qX4smzFzqNbMdBsNqXIr491GueT36wrxh8RvlNHTuNOyTjy
	+m4oOe5+4NXoxIFrOuQMTJwBsowCGxEfctoMMIUZPI7kRaoeOxUEh//35ZaggpSjhBXc6y/6uyV
	Reqe9aorpyNGg0djlUjfoiWj8=
X-Received: by 2002:a05:622a:5a12:b0:4ee:13d0:d02b with SMTP id d75a77b69052e-4f1b1a98cf3mr18823781cf.50.1765354520961;
        Wed, 10 Dec 2025 00:15:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgcBXJ4xcaXDO+CICe5hoUf4MYrPd1eOEbniN7F4xmNG4Pg177/t52ADMpXw6UPX1AQgQ/Eg==
X-Received: by 2002:a05:622a:5a12:b0:4ee:13d0:d02b with SMTP id d75a77b69052e-4f1b1a98cf3mr18823491cf.50.1765354520482;
        Wed, 10 Dec 2025 00:15:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598e9f6e4desm1646862e87.88.2025.12.10.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:15:19 -0800 (PST)
Date: Wed, 10 Dec 2025 10:15:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Enable cpufreq cooling devices
Message-ID: <ufngcyzhuisms6sljw5xcex3pyddf56ml244wbjn2ih6c42jgq@al4gsoxoin4d>
References: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
 <a3mzhjs3kl7yfrar3gh6p3benvfa5bx22xwuznaqlhyytlyxkj@r5p3vfd3ykde>
 <87454dcd-9eac-47a9-9d0f-e2e10791bc6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87454dcd-9eac-47a9-9d0f-e2e10791bc6d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d7X4CBjE c=1 sm=1 tr=0 ts=69392c1a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Yg0R-nYePyn0bLyY1ksA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MCBTYWx0ZWRfX/jarQ8uR/Xtw
 G7PtATQRAAGXju9DJIqpmTJMAYmaiUzScZSjYgHWRersk2YDhibe8VHzvob+nYyjrQ5SWRIfwO/
 MKGVFnikqaKk9rSQpQVJHX9Qnd3ewtDoPm31RA2YiMVPY8XrM6RQATNo1AHJ6YSmGmspAXREdVb
 vEGsISTju4SK1Y1yd9CPn2SUGBUxnBPn40q/mrzWnSlKJy1b3VTqpzGxO4dM0UBqj+248Hlomvm
 uCh7/hxuWp/x2Ga25esjxgLwJsJdjiit3tcr2cM7DzPOSyDsQ8f+Ejd/qJcl5nmp4u9CrDZkkLi
 +XUaTqXTJMsKgUYN4Uy1wHf4c6GL0yjn6M8UhFKMn3HPC7nuk+x4hlm58p8t1t6vzUG6JhaPw1w
 JIr4K72V8mGktDArF/MjmJuBPwKgJg==
X-Proofpoint-GUID: q15-X9hC6vki5Ae4L89NATkSz81GNSnW
X-Proofpoint-ORIG-GUID: q15-X9hC6vki5Ae4L89NATkSz81GNSnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100070

On Wed, Dec 10, 2025 at 12:37:05PM +0530, Gaurav Kohli wrote:
> 
> On 12/10/2025 1:38 AM, Dmitry Baryshkov wrote:
> > Are there any cooling maps to be defined?
> 
> 
> We need it to configure from userspace daemon.

You are describing behaviour. Please describe the hardware instead.

-- 
With best wishes
Dmitry

