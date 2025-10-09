Return-Path: <linux-arm-msm+bounces-76582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C3BC837C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2769519E7BF9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3CB2D8379;
	Thu,  9 Oct 2025 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4WQfNsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFF2D77ED
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001021; cv=none; b=EqSTM7RnMGV63RxsqVThbyG0b4+HD9d2TuHAX3jFwlk23/G5oir5H2krZrm9w+NHQOvQrOvQ+zXvfRdWbHPQMJqs71PRrTpsmUnLdFsvCjh483WdlKcmqtDtRRP/olBRuh/jTtXsEf2kZX3Ar3DBinGnDMHjwQxr71r7cHvtSGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001021; c=relaxed/simple;
	bh=1gLto9BCDROKFQE4dD3C8sxYVc2P8E3H62tB0Tiz5aY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oa8sUJM/9ygecndgi5I5wRRnqKGRRMYpO0pBGfHAsEYcrsjwK/UU9HRCX4CQ5512ZaRIx7VCA82bOMxz697Bg2dzE758yVJDUW9VFar+J1xl2XoLdoFSsTGlkoMNelF1G57bn99VSHg1XzgRzi1a2XY9m1AVOZR2p21PXavDKhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4WQfNsp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EX9V029906
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 09:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gLto9BCDROKFQE4dD3C8sxYVc2P8E3H62tB0Tiz5aY=; b=X4WQfNspdGcNJbZr
	DSXD7I7PL3YF1t3vwZYpAGpfgw+Mu1lbIA7nVDCrIFIm1E4oZLZ+1Iz4gfCl6qwR
	+XQQ2B+EuWj3+o4fEwHRRPKu3D5zusxKR8IeO3tyCmtcXBqKKNK4gWlxi1hNM5dl
	kD5fI0QVZxVlTpS6c8Oog0RfYtCkyqwImFsxGlnDBWumvZLtuPVJS4SItj1n//qL
	2ShnL2sun68DlebdMrRZLQw76EnwyaIhpKMdaVT5kQEeSfJpvJ2A26uEDxxi9iKp
	NMBmzzkvbl3d85tcfXYgNPsvk3nf6hOZrSqwgZ7ue+MConDu1ULj1wLbk8J0QUle
	RP9v5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kt6f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:10:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8703ba5a635so28092385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001018; x=1760605818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gLto9BCDROKFQE4dD3C8sxYVc2P8E3H62tB0Tiz5aY=;
        b=dyUznkar2zVJuzkciLfisTJ8xKzn8xsIU0bBUM1QooBfwOrmRXleN6JwcjFdV/Mmge
         0AUhk6q/EQk5hR4eRaIQTMTP4bqe+pI10g3EdOjHYXlErbhQc/qwlWDNwWjKVrG63W8w
         jA3o6HWTmKpWjdc/7GXXNanyXMpjQPER1HhDDs5ElpRC91sn41Fl7TAEn+8UaXYNc8mJ
         C6XtnoWJAKeufXAEGF7tN/cAf42A5syPeDwPqv8U4Adaii7nWVQ7+gsq4EfIYuPGmVok
         i5m9fmympvN0EkkRulTYJIcM0XtRF9mXAM1p07eYdY+n1sIicsgQtWmcniSHAxAR3uGd
         O/vw==
X-Forwarded-Encrypted: i=1; AJvYcCXg1IYdf6uVXqsZ26MDWzmyi3WhOAt48wMSFtU1lMpGS7zC+qwQb6sYcKohiG4lhTyklIa1dfimapCynyzB@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKB0SQf+KUhEePBhPW/20Ws7pseJ9F1C/14fcEhDzkJrfnUQw
	RqxDSP8/RSxynhtwliHB/6HKdN1qqzpbqm9UULQe9d0kx4uBudU7Jqa+MMBKeIwEGz1d5f9MLOX
	v0dFAnifTsqiXNLzLLD1+9tt5HcqbVIPfe22KgBS+dokVpcQqz+wsoskZ0mh8k8kNOku8
X-Gm-Gg: ASbGncudmB5DUkCFVvufucpc2kRZF89917ywJh5HisqWmUrdb+EW3fO+DvhSW4TFCLc
	3iQ8KZkE5oT0EBxHEqUn9E42B2DY/4K+NYeDiR6lgGC5Uj0dOYvz8M4Hz+IeIT3c6WfVlEdgHpr
	1XmDuCvc+a12vA7qFJ5yuo6d9Y352ddY7lndCk7dcd/5AqO/qmfQs98CcHQcespYrz0BzjtCJCk
	CL2o/J4ah0xvpc3VMB/1NiMIl9zyY966L6jW+Iz3nnX92Yf2tR7leTugfKJr0DXj6nnbx95oX/i
	wDK6hiTpe+uBD8ZnWMz+/eCZBPr6XHLqRMfjZUzHyJ+CvDlAMmagV77W/c2LhzPryp/nb1GBpAF
	MfEJYlFXUpvOAusKTR9CPkEqn9PI=
X-Received: by 2002:a05:620a:7104:b0:835:e76b:ba25 with SMTP id af79cd13be357-88353e1a4e2mr585135585a.9.1760001018068;
        Thu, 09 Oct 2025 02:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6MZb6QOnbhBTE/91nRDArgRgqRLTEI+IVWFn1NxgCnvCATzVRomE0Pl/cQ96//aeLXvp+jA==
X-Received: by 2002:a05:620a:7104:b0:835:e76b:ba25 with SMTP id af79cd13be357-88353e1a4e2mr585131285a.9.1760001017473;
        Thu, 09 Oct 2025 02:10:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4c83adec08sm1153029466b.56.2025.10.09.02.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:10:16 -0700 (PDT)
Message-ID: <597ae997-37a4-447b-967c-8fd362098265@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:10:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add eDP reference clock voting support
To: Ritesh Kumar <quic_riteshk@quicinc.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009071127.26026-1-quic_riteshk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7Gqh4oYIx7ZT
 tXsaoQ6d8jvHWrzkDacBpKvmqg8EqVaPWSCFHLlYvUSBsOPm8ztpKXO3Dje1MGmGlpWVP2+1S+h
 eoUZY1uz8J93MQ81j7+QMSygETCFds/mgOPqdIuznO8KCxW86Px9cXWxMZn4izSYmH2DI8ZbpCq
 SSeGcIjsWfT3BFTTq409CGtROA2SZI6kGZt4Iwyk/3nGUnHAVcXK8CSfQ65C62v2lehhJiCHcNQ
 1qEpOajtz5JFT6uhLlRFmnqODJk0jfcSHYqeqXz3AgvJ5u6M/cLNevpbRQ++Dt66Vc96zdoQlQd
 egACXvrhblYSmjB3bgaj0jMVhpvqXCYjftYuaSlwZeifSyp9qb5xk1IjHA7MWbr41/vp5izZuhR
 Pm5ZtD8AiGZ8oL8ToMdRn3VfnNGMhg==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e77bfb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=rf8yBW790zp7CXIHNmUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GpXc1syG_jMylt5KmYcQcbVnLwo6z5Iq
X-Proofpoint-ORIG-GUID: GpXc1syG_jMylt5KmYcQcbVnLwo6z5Iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 9:11 AM, Ritesh Kumar wrote:
> eDP reference clock is required to be enabled before eDP PHY
> initialization. On lemans chipset it is being voted from
> qmp ufs phy driver.

?????????????????????????????????????????????????????????

Konrad

