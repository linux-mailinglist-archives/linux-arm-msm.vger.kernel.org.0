Return-Path: <linux-arm-msm+bounces-70290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B443CB312D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747AC561DFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD702E2F17;
	Fri, 22 Aug 2025 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbQCAlpl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D813A3F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854481; cv=none; b=kYmChkz1TtjcH0IvX0OLxF7YgosTJa5O0/sM0Hi4aTfekXPe5UKhzKA3biNvSClgNxS3PrQHoZHwDGnKfsvmFe+F3H0EKfzFtTJMbhon9gFCsS3R4nfTR/HTnkQ05Xi748awsiHx/pizErzUZvxQU09HDh/BAkBpxwBaHarUpdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854481; c=relaxed/simple;
	bh=yNbdXORajyB6uUaMUAhu4mOLFE93vNT+gPSj/d3fJCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtsGsvm+KmJ+IEhsKdJa4fGu0ASP85RFMlHBecnk+A9pMipOPj5yUt86pKOkW/dq2TPvhcUhV0ZDCUxzLKvhRuDTUr2L3tzJZA6fAabARAu51Dp3xUTtOGpHFGfpKdQF340XcIjYm+5G9yKKkYArA2bitDjkpy8X9fL+xzOneIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbQCAlpl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UKA4005632
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IOCyID8v1JmSthjeoZP7YK+Yq23g9nLuF93nvuZi7jg=; b=YbQCAlplt/Wpi/WH
	yv8oHte/mq+ndlCMTemNruW3G6tGClfh1ifyy+t4UpBCCHg9R9JD6yNnm8kwbdBP
	mcPiwm7IdZ20ccYQtS2157zT3IKtJKjVw+RQXhcNjwuLbQYaEVUSDKhdMYUxI43g
	m58D04oOshRGrTnQerRdHHrctuYKyqKjNKwrC311aSmODdKmI9CTbo1zrVLeDfj3
	HIgFto3NUdgILSn/j3M3r0G6ezuAGjV4Md3BSXmwpf5ROC7G9r7RF2Pj6LLzI+9J
	8Sp2rnR2i36m69BE9wj29OYoZRQMjWJlc9ybt7ybp42KRfCSRjque6ZC3CtbB3FV
	Id1uaA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52drjm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:21:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e60221fso4091793b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854477; x=1756459277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOCyID8v1JmSthjeoZP7YK+Yq23g9nLuF93nvuZi7jg=;
        b=O9c8KjfPwRClMmIm0eyy6XxgvuL+hhnFQYPaZX13Kgm/Sms9lD4z9BjXyXurvYNugD
         Eqnlj3geEnWUnIKSgYQW58xhMeVpA2zSfrUQuAAUz0Sx6/ATpwAQ+N8GIx0UFoZgjZ9/
         hweVIfXAsiSpMO66YuaCUwAgr+Rb8sUlde4YjSYilon7+ZJvdzZTbMJok483oLgZpHL6
         +9NCR/Q+lYIc5X9wjyjMEH+fDIsfz+cobDTrUvIb9bgKBtKwQE/kUT623Udi3fn2L03W
         CeJPThVhwZutpPZJXFJXjofK1YvMQ5EQcB5XtUShNltM+AGsRVrU1QYMtnxzK336ePgG
         Wb1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6g/hvEZ38mU0JFrdhIY1O4klMxb7NcN883VdUvG/HGHy0ul3wNvL2D2yfmEJ8+lDDOkB9VftkRoGxIb01@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBroYknlAfxDx1mZDnBcG95SvHB8Z2qO5r449GqtGec3RBrPS
	jd1FPNmFPpOR59GORl35NMQhZB9xRBVAF+AXtVfcS6u0VdVAHDJ76G5iMecdCAF1hHqoPxkGBVa
	0gtx+QYQQUSAzwGPhpL2YmgFDcO7x9WYV8DVPjZrUeyiYKcO+CxBlNqPKtckf2bl6pm8q
X-Gm-Gg: ASbGnctOx1+2XJDE1lgameuu5dsQWOAQ1VJdPpQZ4WcBXuetuxXxCrXuk9ANsWuq5nc
	7fXslLBohvds8QfEk/bPtNgw2A03dDDBwUUeN/rgOxFUVHC4q7R/3VH/a+sVB2Jye81joQbFcI3
	H04pcEhqczrtOTFY05lcUu1NIrZQSUH6uVjsIG/flqFpgZsl1o8XLEoTp6I46wVWjkzXyoPqzo+
	lBZxi7Cyc9kh8AjS+4JEVrfjWPIgwW2W1pYgOejxtiQYgE095IC88CdRvPIi38p7r9hr0R9+Xwn
	muYq0Jln6/EgDvpM/WpQwFI9j7zibR38AMVtYJY+9734wjSVIINpAqqC4N6PznRs3nY=
X-Received: by 2002:a05:6a00:1ca8:b0:76b:dedb:3048 with SMTP id d2e1a72fcca58-7702fa0a9e3mr3338305b3a.14.1755854477057;
        Fri, 22 Aug 2025 02:21:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE169SwcjAeKFg+hGSDS6nNE0NmrbfptvokZy+amX2UJ70H+B4WuVrskBuZjtYUqvzfDL1gJQ==
X-Received: by 2002:a05:6a00:1ca8:b0:76b:dedb:3048 with SMTP id d2e1a72fcca58-7702fa0a9e3mr3338263b3a.14.1755854476577;
        Fri, 22 Aug 2025 02:21:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e843bb510sm9369488b3a.53.2025.08.22.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:21:16 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:51:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <20250822092109.awrfyqz2tfaxchjy@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
 <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>
 <aKX9kO5eHUp40oRj@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKX9kO5eHUp40oRj@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1Ic6SEcwuqMe
 jOrh7vqofNZRpAfxK41W9ouD68UZRRDMO1mkQW+s9vwU9EWehzrV8cN6mtLKkySx6xX+3EXFrUZ
 IYJxhH3419Ds3BMLyO11Kc1W9At7rRjPvkU+32cVr15VN4mMqD42zlDcRuqJdKNh1A2h900Htsh
 xv3+YHMcCmuzFErAqESSIfo+Ff8Zk40shdOHyvlIqUjcW7sNWOtYGkjrm5nHlunTdE4LV28BQVr
 4mrOmsVJWhovsInw26k/X17IHgOF4ilN/rdM25xi7A5fAcHKm1iY5kZlKeHqrB3vI8UaxZf6hr1
 2mlTVKoRf8y/EUbvwe9qpbFhPtEO4zzukO2r/doiDlvu2wrAQMBwC0Nd6hs52GDRqwFG/s5y8pJ
 CMR3vH1/n4Mxd5BwLXDTS4+CcVy8nA==
X-Proofpoint-ORIG-GUID: mg34tKBYN67l28nLQ1nYX3B3Qem_Abct
X-Proofpoint-GUID: mg34tKBYN67l28nLQ1nYX3B3Qem_Abct
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a8368e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=iMW2xQpcS57KE3qV-eEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 06:53:36PM +0200, Stephan Gerhold wrote:
> On Wed, Aug 20, 2025 at 10:02:50PM +0530, Mukesh Ojha wrote:
> > On Wed, Aug 20, 2025 at 08:48:22PM +0530, Mukesh Ojha wrote:
> > > On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> > > > On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > > > > The resource table data structure has traditionally been associated with
> > > > > the remoteproc framework, where the resource table is included as a
> > > > > section within the remote processor firmware binary. However, it is also
> > > > > possible to obtain the resource table through other means—such as from a
> > > > > reserved memory region populated by the boot firmware, statically
> > > > > maintained driver data, or via a secure SMC call—when it is not embedded
> > > > > in the firmware.
> > > > > 
> > > > > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > > > > etc.) in the upstream kernel that do not use the remoteproc framework to
> > > > > manage their lifecycle for various reasons.
> > > > > 
> > > > > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > > > > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > > > > also want to use the resource table SMC call to retrieve and map
> > > > > resources before they are used by the remote processor.
> > > > > 
> > > > 
> > > > All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> > > > support already for older platforms:
> > > 
> > > Example was taken from perspective of remote processor life-cycle management.
> > > You are right they have worked before in non-secure way for Chrome.
> > > 
> > > > 
> > > >  - For GPU, we just skip loading the ZAP shader and access the protected
> > > >    registers directly. I would expect the ZAP shader does effectively
> > > >    the same, perhaps with some additional handling for secure mode. Is
> > > >    this even a real remote processor that has a separate IOMMU domain?
> > > > 
> > > 
> > > I don't think it is the case and think the same that they can skip
> > > loading and Hence, I have not yet added support for it.
> > > 
> > > Will check internally before doing anything on GPU.
> > > 
> > > >  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
> > > >    that maps the firmware with the IOMMU (but invokes reset directly
> > > >    using the registers, without using PAS). There is no resource table
> > > >    used for that either, so at least all Venus/Iris versions so far
> > > >    apparently had no need for any mappings aside from the firmware
> > > >    binary.
> > > 
> > > You are absolutely right
> > > 
> > > > 
> > > > I understand that you want to continue using PAS for these, but I'm a
> > > > bit confused what kind of mappings we would expect to have in the
> > > > resource table for video and GPU. Could you give an example?
> > > 
> > > We have some debug hw tracing available for video for lemans, which is
> > > optional However, I believe infra is good to have incase we need some
> > > required resources to be map for Video to work for a SoC.
> > > 
> > > > 
> > > > Thanks,
> > > > Stephan
> > > 
> > > -- 
> > > -Mukesh Ojha
> > 
> > Since I am not subscribed to any of the mailing lists to which this
> > series was sent, I am not receiving emails from the list. As a result,
> > your recent messages did not reach my inbox. Additionally, it seems your
> > reply inadvertently removed me from the To-list.
> > 
> > 
> > https://lore.kernel.org/lkml/aKXqSU-487b6Je2B@linaro.org/
> > 
> > https://lore.kernel.org/lkml/aKXQAoXZyR6SRPAA@linaro.org/
> > 
> 
> Indeed, but I don't think this is my fault: You have a strange
> "Mail-Followup-To:" list in the email header of your reply [1] and my
> email client honors it when I press "group reply". Your email client or
> server seems to produce this header without including you in the follow
> up list, as if you don't want to receive any replies. :-)
> 
> I fixed it up manually this time, but perhaps you should look into the
> source of this weird header in your replies, I'm probably not the only
> person using mutt and just hitting "group reply" all the time ...

Thanks for pointing out.
I am trying to fix this, let me see with this reply.

> 
> Stephan
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com/raw

-- 
-Mukesh Ojha

