Return-Path: <linux-arm-msm+bounces-68380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E618B20C00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070091884F65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB9C25D558;
	Mon, 11 Aug 2025 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/aRL8Ut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E62258CD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922787; cv=none; b=TDNB8NuNssgPqwwI4ik9bh4/uXkXfKeT9QPMDua8FHg5vADkr7ThiOYfqAXvhP76aVN7RnqNtn1LMipoS7sQvU0jRDEVN4G8zD+g4n4tnEz15Lm4L6b3JF0sfphMSPdfREBefhzisH/dxS7sS8SOBhF++1saXq+WqpnhIJ1jtpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922787; c=relaxed/simple;
	bh=MMoSzv/Ppnp+PyjyWrFH8yUcQP0luZYiajrhmfSLHvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4ORyJ1PnQIz/QNWT5N9lF+gnEVAI03Tqxhim/RWhQG8Jp3Kumfa2ISjPAwLLxGzgl6HoHYWOnwUPokkXk97ri3X0Rh+y1x9zvVxkfUdozexgJJw0BOmvPe+/ezV+In+mbkOpHmvEQD/y87e7Sl/TgoH535MltZ7/Kg1fUII0EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/aRL8Ut; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAnU029203
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pIAf63LpCjEtK5+tOINf5iV8
	E0OgSuQPvRRqn5n3Od0=; b=N/aRL8Ut0L1wO922JSGqfkMJ0xq6k7FAE12fivHe
	BJB3Vuk7T4YmdMRPu1GBZCSpk3KJmfex08yv08v/7EANYIN6s5sKuBeYPeTZNxDa
	ZI0EYA790Lflx4kSJy+BVBbn3gxq8ma8O5p1k8ldJNxG8wyvJlZp3fN2QlWLrFDK
	ybpXp4ZSnCoclOmLvJJx2DYtmPzTFSvz/MlK49EvDjulerh6bPj2HOqtVf+30M3c
	yJu/takpCQOvpw1EWvxuCxJT9GYyV+104z4XQAzdJQjJzWigzLRyfQJdbeWklECs
	JwtnRzJeESHUiXUcVABoq0wFUtPrUbcMOik4grkU/z2+IA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmcq0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:33:05 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-741ab0f2e82so654579a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754922784; x=1755527584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIAf63LpCjEtK5+tOINf5iV8E0OgSuQPvRRqn5n3Od0=;
        b=nePckLuy+tGInbURhguUVsM7er8qkhWRLqyFEeqQfn70dFWAry9te6aiJ0OU1mnqqw
         +DcSebFt9pgGUCRc6dcXz018SCtVRdx6J6QaD5S9WK7nEaoH1RaPaWd74yIRwuZ8CMnX
         T1BOBOuKVDt0LJBEzERVb3mqqY9TRmEyGqNK9A1pxK8ajbi9+udItAngsOdH1n6YySPW
         hnlO25lqX+fvo3ywFtSG1TFNmc6D41DfW3Mt7wq9qDlz1CuZs5g9Ff6X6eyRSzgOn+xm
         uk+k/B1wcRRI+YoOrEuIasQ6o8huolHuyhDozfk7m2xbXsbNINSei28jmDiYksuzLOpX
         3Rvg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Op9tKR+gLUUs/pX0ExyFK06J2HRqg14EqwDxivlV5szSepKmxqN7ihx8FpOxZAZJ1T0j9FPnfcz8IAv1@vger.kernel.org
X-Gm-Message-State: AOJu0YxJgNARE0AUG6Wlwox2zOXmHGE65GDlGG3pzJOmh/JBA1zT1+ks
	H04DSdlSfOtEYAPyKKa8SZSTQVhK0xBcQGSbuyptyLFJdWU56jXcNtmupNAJ3vpmjW+1KwxQ/4N
	FE3TbKjr93l3+4gOBafpZHiFSDgxGiJBfMlbVqaRMOGLshXw0Yyd4fnJGoPg33IpaZOAaic24zW
	kN
X-Gm-Gg: ASbGncvHjrTmeUX5gIZGOED+6qmRwDL2nMr/KtWkX7L44aHbvn+Xr0OM3Kcw5zYg204
	gtQ93DuOiy+PXdBfYndif8Hg6bi3B4ffpKp98erKfp0AVVBX7ItUQEQcW6fjF9I4dsnjX3DNLqX
	7Mq0l1pdTHntAW4UwZjRY/VK/5Baxbh65bOY/xliEJntzcOOuDjGgnF+1ehzf3JOHG5yOFJJ/A1
	cf4KH049ztIvRQtVXGPTN9B5iAL3/Mc5TgqC8R8pqJ1htiZWZtw9DSItkUMbJvg6iRSoH4XbKum
	G04UtmMGUjJPittsOjb0rRxraKz/KAK9In/cydOdwt1kSfXN03KhcXsYfjgKhormQX60zRW6kGE
	4iq3PPAlxi3Z6kDDWl1RWUxxLQZQRIIwtFL1BIXdGiiKLcVRR52+n
X-Received: by 2002:a05:6830:34a8:b0:73c:d14a:cb0 with SMTP id 46e09a7af769-74366934d7cmr38912a34.6.1754922783921;
        Mon, 11 Aug 2025 07:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeSjeed3j/kib/Z3P1RZJqE31ka97P3s6ayDf+50Yn9aD74UuHxmWDqa8+pHyEyFQkASbDRQ==
X-Received: by 2002:a05:6830:34a8:b0:73c:d14a:cb0 with SMTP id 46e09a7af769-74366934d7cmr38886a34.6.1754922783398;
        Mon, 11 Aug 2025 07:33:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bfa4sm4383837e87.21.2025.08.11.07.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:33:02 -0700 (PDT)
Date: Mon, 11 Aug 2025 17:33:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] arm64: dts: qcom: sm8750-mtp: Add WiFi and
 Bluetooth
Message-ID: <k7mw7rj7cno3con2t57nps23y7evd3da6gahyl5gnrxss7e3s4@qncnuekxr7lb>
References: <20250811131055.154233-2-krzysztof.kozlowski@linaro.org>
 <l6u4y3suv3dpylexbiiznhcuyanlc4ouizhzj2cchblaf6o4wg@fe4laxrioaj5>
 <481985cb-fa84-4b09-9b95-948ee70b557a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481985cb-fa84-4b09-9b95-948ee70b557a@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX7WgV3g1KCjYm
 dinNx4dSc2TIRbBKHyVeyJwOKlcoFQulXkkDTb0OpeOqa05Cp9FlcQuqDPVZZgPBf7zRLiHbjV9
 WNTpXT4dUi2XGtWKnkmIu+hJYDlnOXpQ2oG9h8xQvjRGj/qrRfZdSbdSVcUZxuE1w6DYYABrU21
 OQzjaLugMnRIHhOG88Y9gSs2anXBMlKzEfwJVFrdABMcEuzspfAq9+05CRRHTEapb7Xezy6lfer
 M0vVeZ9PBmgxwLyHUc7resWBNznlBUoQKMvQUZaraE5FczcjrtXMawceRhzjJNOUnMFHUfSLJ1F
 zaBe5pKQyJqI/phK5M+23Pd7Su8CyrwlnTiR8lu5wRmeS3DXlBIquumc5PjPpA/9lIudItUoApt
 23YAdBGO
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899ff21 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=LhWZ5_tqvYJhwomtTMIA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: deXl80oFvIWo7JTwCSsA5rFkSmsd7x8v
X-Proofpoint-ORIG-GUID: deXl80oFvIWo7JTwCSsA5rFkSmsd7x8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Mon, Aug 11, 2025 at 04:25:47PM +0200, Krzysztof Kozlowski wrote:
> On 11/08/2025 16:22, Dmitry Baryshkov wrote:
> > On Mon, Aug 11, 2025 at 03:10:56PM +0200, Krzysztof Kozlowski wrote:
> >> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
> >> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
> >> supported by the kernel, but WCN786x is not.  Both of the board variants
> >> are considered newest revisions and the difference is only in MCN
> >> numbers and internal codenames.
> > 
> > Are they soldered on board, installed via add-on cards or installed via
> > M.2 slot?
> 
> This is MTP, so same answer as other MTPs - these are replaceable parts,
> just like you can replace display or modem.
> 
> > 
> > Are they going to be somewhat compatible (e.g. on the BT side?)
> 
> No clue, you need to ask Qualcomm people - it's their hardware.

And you (hopefully) have access to the docs.

-- 
With best wishes
Dmitry

