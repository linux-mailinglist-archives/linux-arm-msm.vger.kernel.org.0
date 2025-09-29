Return-Path: <linux-arm-msm+bounces-75493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8974CBA8B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D86787A182E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 09:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736A6286880;
	Mon, 29 Sep 2025 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqX2erMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D61F3BA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759138682; cv=none; b=rq9fE8Ef//8j81TEG+tFUzSCb7XerRnzVEIq5E8t8BM18rooEvz8uTszBMmLSAuoBiY5iouM7wNG88w2ju8Yqi6OtS3pCYw9QzOV9/Wer/E05R0utvk/eE0zY5lQD/8NRUBpB8RQpDE6EEnUB7j/zhrHAoeMvJoQwS/J/7tSsMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759138682; c=relaxed/simple;
	bh=1titZlYiqCGea4shUB6s1SlT200aB6VqOgT9uvqDHos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rizKAX+q5C8uxpo1mabH51xvtrT8kHFmOhRj0JUTF5EkGbzWKRoW/SpQfxG35DpaDE+T6CNn6bJddbTjmPyqdrsWKOcn4s8mgmFRSIqf7JyoB0KFhV55htXJeBDeEduBvox81e6JRcs36vO+R2dU1Ylrn3KzyM6xU3nnaHjF8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqX2erMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNVTNh017602
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMrlZfYJFsa/roxg6t05N0o/
	qG4IRrmXSTCcqA1YII0=; b=lqX2erMbnrxRKWLuns06uDSLqkXVa6AirFZeCU5R
	TnlBtePDEsyiapTu8FAtXRXVRW9/9CJZfdBmZw0z6O3vMx/7Jb0ek1Pkn/wtMQwp
	FPrHN6sUHfv44RhuWAu3ZCvYhRgpxsRHJjPUpCySzID69NQN34OPGxlnCD359/6H
	fP5vo540McH7RD6VOIk35qd1fhN+J1u1ic1NhC7san93DTn3QzXNA+fYegFpJjq6
	VGOvJ4IaR341XAToGkyUdXU1KEp+xPhkhMOLd3dCk9BcBt0dN/vbGpqmWKyB4P8e
	Z5NOj+nVA0Il1PboIKseTGN5oY36TfkuerY4adQHXTqIZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5vq1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 09:37:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de23c3b40aso70444691cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 02:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138679; x=1759743479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMrlZfYJFsa/roxg6t05N0o/qG4IRrmXSTCcqA1YII0=;
        b=nGXTRfZZViAr/Z3yG1jqC2IT+gPgAhmVlQLc3Vi5hKLcxYRCAU+S5Zex6bUn9B1asj
         fe20Tagub1cNVwQ0bb2HFfPLdJeTDMS7Hlq8UOguZQDs9lwXe9LU9kKwlvmb97gB5azs
         VmFPIIIXbrmpzkrd7UmVeIxGk9dXAbzgRkwkZZyWIb94PpKujzPAx4miRC9CIu+d5mpK
         K9c+Bces/cegAfydL1roMVj9zSbw/eqqH/Pv1pel5hjMtD4LxuQ2ueFYAUy2Gb1fkDCY
         x9/rZ/VIFoFd/96OTJRFAT7SXbulUS87Gzbb5tnwSfMhVdfCR8qY3n6VEYgD5k2V82ey
         7QnA==
X-Forwarded-Encrypted: i=1; AJvYcCXg3+4fFM8XBcin00zTt26ICOsDX5KF7Q5PfLCpasQ4y8ga7/tvGzFKc9qtlA9WF4CxYal/P3ePQfDluynJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5BGR48UZq11tyma3SedL9H9+j9ZeoJXwJUDBvd7R0utlXbHLY
	lwJJdxjSn49SOrFsVWlW71Tuvy7+gUPV8d4DCltSD8gW8tphwIo/k7vXCiWlkkVI/iyOY9sPfDI
	jXcWCgKgABKMST+fKarHKeKey8L033htKi/94ng0VviMJVtzj0bnl0pg6qZyrkvaEyDqa
X-Gm-Gg: ASbGncvTtMCjdALrC49SyJgzt2hXzdTJZiRDyEC2jR3NEX4cHankVQQgxU0pI9LahAF
	82TGmQKB9mCw1r+euR+R++9UuViFUDrBdm5xXsIZpXH5kcBIkpHdTye8SLLSqpXj3X+xVinZVAt
	KA3sBcu0tvlhhnqIFAnZN+30bImNHjOY9jvKP2I8dxjIPH3Hg1rPmWvCwC5HXvjH7W+QAlP9aIL
	GYsuMyZxXVrCLFh3U6S66BvzLQL+3mkoUwoGgxP5VBDBgyYdkvAtGoLnmk9PxHkAPanZOoVqFSk
	dp8rO/MNYM3Hi4FosRSRHsK6CoN7Xvvh/wfd7CYh9zvzfJS7zSlNOHLXefo66Ahqa5jTvtYMxHe
	+GkKv6w2wJfpQT/VGc+lwsvBIn+NdJimcrHbFYljambxirZNsQuYH
X-Received: by 2002:a05:622a:a942:b0:4e0:e01d:9b10 with SMTP id d75a77b69052e-4e0e01d9fd8mr40968261cf.80.1759138678792;
        Mon, 29 Sep 2025 02:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD5964wxBa34FImGPLm/8ZICEnP/mK7N2I+GucPncX7EMAJYQKfCHTslaPOWWcyM2ZGE+L0Q==
X-Received: by 2002:a05:622a:a942:b0:4e0:e01d:9b10 with SMTP id d75a77b69052e-4e0e01d9fd8mr40968071cf.80.1759138678292;
        Mon, 29 Sep 2025 02:37:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313fc205fsm4034625e87.63.2025.09.29.02.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:37:57 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:37:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 0/2] Add Qualcomm SM8850 socinfo
Message-ID: <2wk7sdt6xq7poqzhym742yvfvfdctq7oydhu3hdcwbev5swhzn@xxsyt2h3l2ok>
References: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
 <ebxbhaaefuoemadcef5h4lxfw2k2hwkfe72aubctqb3tk2zdmp@p7ck45rd2hy7>
 <6094ed8b-ddcd-462c-8753-06a1d58a9691@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6094ed8b-ddcd-462c-8753-06a1d58a9691@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68da5377 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=k9_RiEPCMvdJkSLYmZIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zdwWCsHP79U3VTxQ87dnZXlg0qiOmjT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXxDaL1RZFGoku
 2T5yhTbJJTsWTKUPD6JZ4BRcdZj7irwfZMX+vMzL7vYSa0Hs0skwkD/dnwnmdf0fP3OvTtO4mXO
 SbsfFFOd3t8pVYq1Rm7QbJyjaMgwS99JqyevdEHggj1jum0Vw957lWRh4u+EUN24a91rkYIAQZe
 1LYyEjWJ6ZRO3bW4OHBJtpfA7/rWEy4haBw/X023XAyebuZWCAnHpMqw2uo0B5rf0sMx7hkeQL3
 flAOTmppXrQN1aIgOc7a2Hz7JaPr2k1LyhULDpEBnFxBJU79Kl/c0t+5kc766b1eU5sBx2lDDi2
 8RHHV1X1W0sl3nVjQAVCA/x97xxa2RHurVyGVzhq3VjjPr+b86FdD7usZ/j3oZSSET7m9yw9HrP
 hBZoDFvxBT8ebKfMeKEgoLIXtWmSXg==
X-Proofpoint-ORIG-GUID: zdwWCsHP79U3VTxQ87dnZXlg0qiOmjT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Mon, Sep 29, 2025 at 01:54:13PM +0800, Jingyi Wang wrote:
> 
> 
> On 9/25/2025 10:38 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 04:17:45PM -0700, Jingyi Wang wrote:
> >> Add socinfo for Qualcomm SM8850 SoC.
> > 
> > What is SM8850?
> > 
> 
> SM8850 is the soc id for Kaanapali, SKU numbers instead of codename
> is used in this file, like QCS9100 for lemans, do you mean we should
> add the info "kaanapali" in commit msg?

I mean that you should explain what and why you are doing.

> 
> Thanks,
> Jingyi
> 
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >> Jingyi Wang (2):
> >>       dt-bindings: arm: qcom,ids: add SoC ID for SM8850
> >>       soc: qcom: socinfo: add SM8850 SoC ID
> >>
> >>  drivers/soc/qcom/socinfo.c         | 1 +
> >>  include/dt-bindings/arm/qcom,ids.h | 1 +
> >>  2 files changed, 2 insertions(+)
> >> ---
> >> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> >> change-id: 20250917-knp-socid-f96f14a9640d
> >>
> >> Best regards,
> >> -- 
> >> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>
> > 
> 

-- 
With best wishes
Dmitry

