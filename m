Return-Path: <linux-arm-msm+bounces-85644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0E0CCAC58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62ADA304CC08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DDE2E9ED6;
	Thu, 18 Dec 2025 08:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rz9O2+Tg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNz0bOnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC182E9EBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045081; cv=none; b=aUbmI2P7YbA8EEDF4qdyn07yPSsgD8NkYemzeW+ow4Es2dnvViLEuGUeCUjRpJ05vEbMRSt3RJOn8IHHaXTg4EeP0H6AeBS/3Dt+9wz8J2S1qUN0PoNNwVfrDuSaRUatiONjvJscBHKbep8Kd0JrjtAn8SVtHa27YIJ0XMxIRLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045081; c=relaxed/simple;
	bh=TFqg3WB5hwDGl9dJWLvtO87zHRyzmULsyv2KnaxgX4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=La5Qe4Uetd7uWCoKEngt3WyYh/Z8nE9kvlMizx0st7SqRTrixQzv57X2CaVBU45Z0OpxhEYdEURIr+hcm2ZGBJVSxvzUG77M3j18rP8wFKhnBFWqJ4bfBp3eEWcH3/lTKPK9bFIVK2aX4VDc0wC8o67ia/kW4taHW2fZmjhCQvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rz9O2+Tg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNz0bOnK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Zk9p2016433
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4DWOXSWzlTtZOjyy4rMbEfCF5CGxVxPWGZO2wZ8x3O0=; b=Rz9O2+TgPqN3Dh6k
	T+fCBrW6iwEi5fHRJTbU4+5fslX7yu7CfVyCzCkzNiGdjrG2ycgE+rwFd4u0tFZh
	AqjnaE/WNhvqAzoS5LkI+uN7Qiv9XjNFg9/h08C3KItlAR88Qf5ZtLH4Qzlgjh/m
	kLRKbrD+o6Iuqk5Y4pDXJ1y444VDuCcUJgzNEExZRvLm5OW87KRU9cbGcM3CnFmX
	Evtwia+mU3zfPuobzFs2O6eBebtl+I3FQdI/TYE9VlovnkjZBYLBaRiDDRluxlt8
	7/P9DOyiPfcqy2+yd/OADEOBR9PiIhFWo5tzEmihBb0vC2zZ1h3tZ7rq+DFTKsWb
	YmQNgQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e3nbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:04:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so458081a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045078; x=1766649878; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4DWOXSWzlTtZOjyy4rMbEfCF5CGxVxPWGZO2wZ8x3O0=;
        b=eNz0bOnKBmLTkcX2KHyfaft3AERuJVWg3S+qHlTE+Zfoz9qbzst6wUmdHHH+MCL+aY
         3oIcXBZyaL9rc6/Iv5j/hZTQ+w14+IVF6DaIX6q6AnolhTD4lA6gDOQSPtiRCYChyUDH
         sXQhmv/0U+TDyytqAitTzPW8XBpLwcNG+acQ7IN7D5rged+J1GVeB+SG4/3wkHrS2JNY
         XCDuC49/rOSMHEzQLLcNTu3mIhGFCNs6aXVd9Vsywcgb0fA/GAn2hvSEa15Cw2rXUjm1
         EQxOAPVQUbUCM8AK/VTUeApuKOeLXXjCwV3Nnwrhh8omMY8nIS0uY74LU/gK3JW8YuZm
         6iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045078; x=1766649878;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DWOXSWzlTtZOjyy4rMbEfCF5CGxVxPWGZO2wZ8x3O0=;
        b=HwGLUTKLR74kbN8mZ6SAStrDICimXxBzjLmKKx24NwwtJCFs6mkL4/Qh8psPU5NBnJ
         7ilIfQAaGZNo3FajiTxeEI4RQmK4r2XkGmWiOjEUQ8Q2hzALdM+agUnXeUirVG2HyEAj
         qY1VhiaKJP3jgK8Y0DhpohOmDrWkQuVaCFm39XXT+/6d6dwTk/6ZL1LD/bQR0dPXvExj
         rXT4wBpPX5+J/DUgHjFqim965PI1rs0/SWPGtHt2Aw30D3qPJZkkihRdnb3pS63mq3rK
         holegBdTcyBbvTiFf9lhC98mKzhu/yFAE4bm65UbRSR+1kOqIbsSrvF3uqQ47ZyIHAdO
         t96Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBkIBkt6H5LwLATom6vcj9dORkoYVuGqf9hcJBaD/NdhS12TFdyPzuZkYTxsCY6fVAdkngw62RV23QWneC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3QnBSpb6XQzgYHjQ3FF2SoqxkUh8pOAX1NpDoce2PTr+VZRA
	h5CQqWkKPeEgRuIU7EDmLuF4o3W3E61/qj2Y1+bfuIeKP1E3CdvnY53ts32IP4VdrWJrztRptH/
	geVZEFn4RT1cjOkUMxdH97tFwjj1+7aJqufZC/m68skkLbqKAFpx58R1fwO20PsmbrWf2
X-Gm-Gg: AY/fxX7MFC0XHgKzJiuYc2tVeH1S8C3dWkyVpsQUAT8LuQoE0LnHJqINcBx0Tg3eAfM
	vocmtIwERIZND6twyH52IQC1uvbK9y0Xrl4LhXBDnBp2qQ6P6TUMaS+rUclYojg4obYlaIIZnmv
	BkufrvNqgBdSqFW/9LC7ZDTrWz0OXSQQ89eHnt9xxZTT/pxcbrkl4cBSin3blXM1X9iXBy4xx44
	DNhrbA/1p2ibydWSiqzSQr+McYuX001Wi371IlQO3akRKesH52sycbltVhtqEP+Ef32QFD5AHxI
	aQiWJm04FdM5EyMHnAn1dmjkjnY6eLhbdaLl9M+zjhl6VN782RBMVGtQN89rso0m5u8my5ZLIZ4
	2y673WSP3lWphxRygCJGTK6bIS4p5yc01MXrQvmK3bJO9GFUe9ji0SSmE
X-Received: by 2002:a05:7301:7e11:b0:2a4:3593:dde5 with SMTP id 5a478bee46e88-2ac2f8a8e36mr13849964eec.18.1766045078006;
        Thu, 18 Dec 2025 00:04:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSMa5PCkQCOhML0SzygPkWNEf0IV3IXL6ZdrL7WcO/cTCC/3+mPi9apLajuR28U2biYmFJPg==
X-Received: by 2002:a05:7301:7e11:b0:2a4:3593:dde5 with SMTP id 5a478bee46e88-2ac2f8a8e36mr13849925eec.18.1766045077384;
        Thu, 18 Dec 2025 00:04:37 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fc5613sm5385179c88.11.2025.12.18.00.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:04:36 -0800 (PST)
Date: Thu, 18 Dec 2025 00:04:35 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUO1k06T3YUGX7kV@hu-qianyu-lv.qualcomm.com>
References: <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NCBTYWx0ZWRfXzOW7JFxuS8/y
 9esu5B2VpgVhLoL/PSevjfXkMHrPh16EwcSgRG+T5VGFJDH3btTwo4WcEHVqa0K+DDHcn3cIVpi
 8tyNwM+F2AzPW7dkrZHyAR8UF01lCt/KKJ4Pa7Akbuzi0rp/qZPnlmRLYeGaxzdhU6wFdLEtcXG
 mn5Xf1noCHC2IeDjmgXL7xJ5s9xylUxJvSwPKtoZqU4hIU+Dk5STR0nrKiBDAY7mx6Cda8KxdQi
 W9JwIFIXPF/htkGyd5MtkkG84UfeMFGLicUP8a3jdDBOLdXcSWEzUmg7JdqYmAEaS99vRey5iBi
 XCVl6n/Cr9GDlxww5iOMIslzEDNhPU8vSMEOQmWGscATwCxsQcPIEcgiGjZXiXpOWBxj2xHl0UM
 a+ZTbkIlxX79C3SKJyMeGRmqjQMJXw==
X-Proofpoint-GUID: luXSUdN40OgLqUkd1ZogVsLIv3kyyoYG
X-Proofpoint-ORIG-GUID: luXSUdN40OgLqUkd1ZogVsLIv3kyyoYG
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6943b596 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7Jv5yrs01gcKwjDWLeYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180064

On Thu, Dec 18, 2025 at 10:25:08AM +0530, Manivannan Sadhasivam wrote:
> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> > On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > > On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > > > On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > > > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > > > > authentication requirement.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > > > > headers in a single binary:
> > > > > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Download behavior:
> > > > > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > > > > 
> > > > > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > > > > 
> > > > > > > > > > > > What is standard about it?
> > > > > > > > > > > 
> > > > > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > > > > header and WLAN FW segment.
> > > > > > > > > > > 
> > > > > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > > > > tme_supported_image?
> > > > > > > > > > 
> > > > > > > > > > Just elf_image?
> > > > > > > > > 
> > > > > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > > > > contains elf header.
> > > > > > > > 
> > > > > > > > upload_elf_image?
> > > > > > > > 
> > > > > > > 
> > > > > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > > > > used previously.
> > > > > > 
> > > > > > What kind of ELF image was used previously? Could you please explain
> > > > > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > > > 
> > > > > 
> > > > > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > > > that was a non-standard ELF image and the new one is going to be spec
> > > > > conformant.
> > > > >
> > > > Previous image format:
> > > > ELF header + SBL segments + WLAN FW segments
> > > > 
> > > > The TME-L supported image format:
> > > > First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > > 
> > > What is the Second ELF header in this context? ELF files usually have
> > > only one header. Are we repeating the same ELF header or is some kind of
> > > an embedded ELF-in-ELF.
> > 
> > The "Second ELF header" refers to a separate, complete ELF file embedded
> > within the FBC image, not a duplicate header. The TME-L supported format
> > contains:
> > 
> > FBC Image Structure:
> > ┌─────────────────────────────────────┐
> > │  Complete ELF File #1 (SBL)        │
> > │  ┌─────────────────────────────┐   │
> > │  │ ELF Header                  │   │ ← First ELF header
> > │  │ Program Headers             │   │
> > │  │ SBL Segments                │   │
> > │  └─────────────────────────────┘   │
> > ├─────────────────────────────────────┤
> > │  Complete ELF File #2 (WLAN FW)    │
> > │  ┌─────────────────────────────┐   │
> > │  │ ELF Header                  │   │ ← Second ELF header
> > │  │ Program Headers             │   │
> > │  │ WLAN FW Segments            │   │
> > │  └─────────────────────────────┘   │
> > └─────────────────────────────────────┘
> > > 
> > > > 
> > > > As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > > 
> > > pointer?
> > 
> > The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> > ELF excutable file, I can not point out a specfic sentence or phase that
> > tell us the previous image format is standard. But at least there is an
> > example we can refer to: Figure A-4. Executable File Example. And I can
> > also use readelf cmd to parse the image.
> > 
> > > 
> > > > is also standard elf image. But it doesn't meet the requirement of TME-L
> > > > because we need separate elf header for SBL and WL FW for TME-L
> > > > authentication.
> > > > 
> > > > So the commit message stating "Currently, the FBC image is a non-standard
> > > > ELF file that contains a single ELF header, followed by segments for SBL,
> > > > and WLAN FW" is not correct and standard_elf_image is not accurate.
> > > > 
> > > > Can we avoid saying anything about standard in commit message? Flags eg.
> > > > separate_elf_header and tme_supported_image are more accurate.
> > > 
> > > Please define, what is the supported image.
> > 
> > The supported image refers to an image format that TME-L can authenticate.
> > Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> > format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> > authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> > first 512KB of fbc image) is loaded over BHIe and also authenticated by
> > TME-L.
> > 
> 
> So what makes it different here is that you are now sending the two FWs
> separately as standalone ELF image to the device for authentication by TME-L,
> but those are combined in a single image file in the host. But what makes you to
> combine two images in the first place? Why can't they be separate ELF files?
> 
> I think you can avoid the hassle if you could just have separate ELF images for
> SBL and WLAN FW and say that the TME-L just expects individual ELF image.
>
Yes, they are two separate images combined into a single file. I'm not
sure of the specific reasons for this design choice, so I can't comment
on it. The WLAN team provides a single file for both SBL and WLAN FW, and
I don't know whether they're willing to change.

Baochen, do you have any comment on this?

- Qiang Yu

