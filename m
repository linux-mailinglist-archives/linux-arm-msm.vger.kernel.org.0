Return-Path: <linux-arm-msm+bounces-68024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0777B1D968
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 15:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608013AFE64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FAF25E47D;
	Thu,  7 Aug 2025 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fL+ZZ/nQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B625CC66
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754574741; cv=none; b=Qh4eeb99ffp0JvZyOPUpX0gtmTaimhsPNSdqpl1Jc5PTIijdZhEOvgCNiQ386vRt5OP6QqCpVnruE7cV6p0CtxvjwJ1V6/tYLwzEvCO7b4q+pxmVWA+ZUlG9nvvlkSaycqQGD3E9++b9B6Q2V8Jc3YZYtK5vLi2yL752nK+oGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754574741; c=relaxed/simple;
	bh=3RJmbFyaEI/2Q7w0DwSZjNnb3wdVv2MTkMkwaeC/i14=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdBfmHLrYApL0KfJYtOBOFzlQAr4bPSll0x8g/tKt5Msb4nNxtCtDN0y5BrVMZBXql9Yyu0nxGevoRqlxMrKt760IHK5Ka8jLzlu9YTuqG/Dn+hI/A06eOPZL/kniba29ckZnR1imRBEGl9g9ZznWS9/9Ijbd+S8BN5FYuZ0Aj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fL+ZZ/nQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D4en011818
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 13:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rx2HlkhZ5XkdhRBXb9tvkQ1L
	h/1Dq2jL/Wn7+DWmLHM=; b=fL+ZZ/nQQyDavnPSVlOqAFsFopj4WqOMip1q3L3z
	KKhq2DQ3WVJg2G8MOLXnT502V1wrxmy5HGTxs1OCW/VSlbA1H7bNyqtl6uj7+Ga/
	MGOvBTmRBE2dsy/h75ql3hnLQfmd2KYjFiK0M9f0VGR3YA2dzOdFb11w4v8wr5/E
	ifrYNfotJa9YAScxKFO+XwxOEcpiExapssaYQzkct/E86XoNClncG/4h2Wvh3mTa
	GBHsYJxpFBAB2a4avfUIxSPcwNO4hgn3iHmotKNVlIe7vxvyihii++g0GubTuyYi
	+X/ii7mDBIHkqZNEuD7dE+wNOMk9vqxch1rReb5zCW6gsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy16hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 13:52:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06908ccacso24362671cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 06:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754574737; x=1755179537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx2HlkhZ5XkdhRBXb9tvkQ1Lh/1Dq2jL/Wn7+DWmLHM=;
        b=m62G2HdQIc2rc4eJ7e1vALfztTaizmqc2Ztav3MD4qDBY+Owph5Z6yUzeyrbPEc/3Y
         ikeOBUrt6cGRwP5yVsee5uZgl0TxiB9rjeam4EustqSsOk5ZVi8HgvPS4YQY6Dbv/zrn
         G+xpoY24EookSM16VTUqel2dAjScaGquyDuINw5vLgnUqucqSUiCI7QWvorklRuMnAli
         XT/3fm41MuLNHLETXZebNL+3bVwj5fSjTSVQZjPM5hg5T6SgtGMaFU4ZLj9C2pjfsq6d
         XMKl3GBRsONX9RycrTUEm1kXqUYhrInyqZIwuEQhWOqupK4b/9gJLyYoVt7NsN2nOPzC
         o3Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXbbXEtB/JuQRfn3GQlBqNGgEpUGUCCjI8UOQG/8NJxGI9EZcPD/X0n5sBiJcGitjANuMTuhNgUu5eISPLe@vger.kernel.org
X-Gm-Message-State: AOJu0YwNONY9PnkarLA7B7ylp1HaqdKhoZHIOCkOpg80f1hitibLvr1L
	yNx45V0DLiOjoKDvmub5Wdv/XkjP56saJdgeQPGidUL3BSRJwQEdBD4bNsxti7DmYjDKIiMDLyH
	ETyzRjqN8z/zkMLmD/mrZHJnCabdBhNeEETE86Rty50TzumvBxGVvLEYt37ESh9diTSMK
X-Gm-Gg: ASbGncs94Y4kkbFuns3xK3NQBsmN4J0titAxzcHHa/1G6lM6MR+aTV90xmGyyqf8OAh
	ZkL5gGogfirvpqxsJiEGR97boLqqPRK7HPLVe5sbvOA26HYXFt4AwPz7TDvjPGUSSw9My7roK3Y
	A+fydckQuDtWv8y8aagErNbz7/0hcApHbBKzUO/tBjleNOCMw1VLxJeDbAUi9OtrE8KIah8hGnn
	6iLYuUxAdXFkffdsGZvhKGvquz6ZsUyndHhsR4eJfp8URGoYX7+m22YOzJb+DUJbro+1PhfySQ/
	vc2+qxNXXC/n2UQ+V5xzIr8JAtnPCaPzmez8dSl1Zn+t+EEWUIGrb0VFNW2vvHVFnvMEig==
X-Received: by 2002:ac8:7f48:0:b0:4ab:aa73:9600 with SMTP id d75a77b69052e-4b0a16adddcmr44580741cf.51.1754574737242;
        Thu, 07 Aug 2025 06:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8h/LmSHvY2xjExIpWEd1N45JRbMyTF9ezrl99kb/xqJfV6y+UvYKQinxMnY+ofhU4FWNwBQ==
X-Received: by 2002:ac8:7f48:0:b0:4ab:aa73:9600 with SMTP id d75a77b69052e-4b0a16adddcmr44580261cf.51.1754574736758;
        Thu, 07 Aug 2025 06:52:16 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b501f22dsm145939755e9.0.2025.08.07.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 06:52:16 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 7 Aug 2025 15:52:14 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJSvjqfQw3kNrVVH@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
 <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=6894af92 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=FCMjqHPL4a2t-UUgg6oA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0WFRFu7LYZ8ETdePgqKqXPOxZk2ifc-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX78eTaeCdrxVO
 DWZH7xPCagV6YFeLSUzrEAAezbZ6Xr9FwcnU1dP5LHOrlil1q/jPNOvoxOKB3v2gozqLDUimvpp
 72d4k/ON+RMLeODv+ogboTz1JsRaRYS7RJMw7udTejUoK089sT0gj0quBO+meBY6q522kJHI/cy
 l6KhDUv576JCTmQUtOBXUU41pwY+On7oDbaIGeQHOEFkty7+lofVg1/wC1mwxLFlqi3u8YWp1yp
 Jktr5lJZ+1wEZzYSKZnL/B29NRyTtCI0iItcf5BQDLQzYzefejMQKZfmMv68XNfpeExNGdbaJ7G
 ReqG+EkL71k30eW7jKRQeddapZkzt5ysfywWcAkGERV9huUUqCULmdgnyw8YUdVeRr1FCjxF4GA
 nsV9Obb5
X-Proofpoint-ORIG-GUID: 0WFRFu7LYZ8ETdePgqKqXPOxZk2ifc-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046

On 07/08/25 16:36:41, Vikash Garodia wrote:
> 
> > It was agreed that this complexity was not necessary and that we should
> > just drop <6.0.55 firmware support (which would in any case only include
> > video decode).
> > 
> > And so on v8, I removed the above.
> > 
> > Now I have v9 ready to post it, but Dmitry is asking why cant we have
> > the v7 functionality so I am waiting for direction.
> 
> the issue is in firmware for both encoder and decoder. Didn't like the idea of
> driver carrying the hack for a firmware issue. Just because, for encoder, we are
> unable to hack it in driver, we are ok to have it enabled in a newer version of
> the firmware, we can follow the same for decoders as well.

if that is the only reason please do explain what do you mean by hack.

