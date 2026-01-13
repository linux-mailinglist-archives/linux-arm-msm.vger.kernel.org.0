Return-Path: <linux-arm-msm+bounces-88872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B5D1B0BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 20:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DFE63021E79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 19:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7FC36C0C3;
	Tue, 13 Jan 2026 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXCh/ax4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6pYtIhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F86C34F484
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332514; cv=none; b=sz7DQV8z3bAIlTHvbGhg07ozY2zIcLx+NK64vwG6eh/3/4DEOT4g25YSqUUs9MBzUKAneybISOoVF1GcL4r11H9ogOYkGm1kmglkoGKrtVDQ+TMRnTiD3FSisYdu6UzW4LoC/UWSZLjfn7o/0hbLZvVHurdUxlx09pevhj8rjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332514; c=relaxed/simple;
	bh=LY8dT/L1Ej3Dno7DAOoADrqel59JBPCp2Ms2bZM7la8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=At9c9a99j5uyxehZKt9KNAZLjaeXl+IeQNvnXSG+PzcyHTCIXzl6MRb5Qh85YdzxBEMJjPmJ6dZNQ6Cgd9BATJ5A4WODSK5D/99ikzrxU9kcjHOLhVsOuPTBOFnm0J1ITJUOqGJ8tyi+R2J6hpVXVZJmqAOvCZuSHipc310/LFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXCh/ax4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6pYtIhu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DIISQP4164889
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 19:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OfKjFtHX6I3K9cKNlKcgeUA6
	KnuB1sEGdEAkmGkuR+g=; b=GXCh/ax47mNvezWB/+J3WQUnUQo/MjNqM1i3UwI9
	dtr0QX0UKie3aRN0OuloHoTch0+HQPcTCBvGlbOsw3QW6ky/BervRxScNzyI6liI
	Cxg5pAB6wkZDIoKa+lGlZ89SxwxjQkmJCY5U7JN/6GRsfa8siMSk3rk/kZSy0GA7
	ebzFvlKcNlfBrk3RxE+BI4nY+AQkMYjg0Rvew1Jlzbn7lvxJbIfneMpT/z5j7lMS
	LohOGsFktdciYYbjfdyA1nR49eY4aOmQDOBVU7uxwKsH4i/kGFv1JwdRAoBukVHc
	P9aRKFJuAUcIhbLLnK3wBlsTLtkmLFkj1gIt8CKaCjcuFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06sp64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 19:28:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9fa6f808cso2373193685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768332512; x=1768937312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfKjFtHX6I3K9cKNlKcgeUA6KnuB1sEGdEAkmGkuR+g=;
        b=H6pYtIhugN7sJ4tc7ut6NKe71S/yaIaO7pr1spezrD2SAdcL/C8KoJIO3i1BjW4yQV
         VAZgtIruIkpEPwuEM8kaIFPlYX8EPBMCffwBhbLE+cJCNWMitlbXYkyut6Gju26efYyV
         Omy1iYwtmJYEekhwIAFzlkfZJpnfRx9EOw5RubKxT1flhdQY6LeaRCZqQpGrKuZMxSa8
         OIqCCNM4d4AXfVJrL2l6nyb/tUF0znapZU5MvCXjNJW+fCaa/A5hdwb48wi01ItxT46c
         Mi27FNJdNxID0vMYv6zQqS4E4gNKPjnfkvlWmw2GwXtF0hQVoEZqw9PT/4wU2UG3Srd4
         z/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768332512; x=1768937312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfKjFtHX6I3K9cKNlKcgeUA6KnuB1sEGdEAkmGkuR+g=;
        b=jPK4rbz1ZQ6kuVSYs8JrMg/pU7oAg1qkk8peou24+FMCNG/cvsQL+G/RclUsmMDaU+
         IceUlXYpvNmoGT8HJIBxpVPhT6xHypYu6DKptepk310NPoD2HgDQVRwNa8JyA5p0mCjl
         5mNKNbZIN5SxXWHVhjnA0+ViieN/flhPCuqzks3/a74LBuWBUNAl6SKpZgWwl9aU7Hfw
         TsSv59Ovk7g9nLAs/cXkzG3cGMcc5QsEhJyPhMdlWva07SqL0bqvhv90Ln9I8OX+O1fC
         TrRCMSQWpg4J+SGu9QwFJJQmq0AUgb0r/5WM4zZ1Q2COCCjZ6W2UL54pykJyH8T8dTIb
         zwnA==
X-Forwarded-Encrypted: i=1; AJvYcCUXanfXY/y1aKJUYT77DeEvdazc+YRVD4HaMdPpkO8mTHM8jKbJXCkzb3gPyPk/CRnJnxmsuHsleLGUi80F@vger.kernel.org
X-Gm-Message-State: AOJu0YyNrEC4Ttdd+0h5q9r+Z5baA6cORADKxBxydZBssbd2Dz0USh7V
	BMAP33dujYBgkmEvodv8IUGjFd5PTN6eq0SAU/r4awVQqoGItSPdPc/N0dlqXwgOceoI2OmqNjx
	L8f4E7h4vMdTpyBjas1wACwIKSLH/2zYn4XYMpu2pNd9gqF858CduJ+/t33pcHWQD3esD
X-Gm-Gg: AY/fxX7SiAnof0E9iwb0JD2VQbSdZtUF0HaaySsyNdFMeuWBe6W2Ge4oftuyG8pMaHO
	8/4qisalD9TwoVIfYwu19fNnK8iM/t+OjEs11AdGGKhctQUddke5bCHZilg7Dbb7YzNO0UXpkRr
	gs3rDC4hF4gqVSe2FQdooAqhDDFg5FWfX/rwJDiqA63Ne9lRZAsOiRREyqwMEZ+oNwAlk8ccRcB
	ZpJovhpUdBWh4xt83ebL07iGxRctXdyGm1jdx+41ESdsx+DrimksE8nWUfonKgtyD2nWtAwswc9
	7wfMCSI2OH0tucHuhkUyUfyzDKDMZWGcQgqKBhgvvy75icBr8lEszb1a6VSuf/9MbEeX82Ic0sN
	YVFmZFw+xoG1/hCYlgO+DCLz7znnsHtvGVncCDPPtZG9I6tDkL5tSYPN6q1j0IL2WVZWoh+Rmcy
	hYHDWEA/tLLibVRUlh1lixF0s=
X-Received: by 2002:a05:620a:489b:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c52fb236e8mr46319385a.14.1768332510285;
        Tue, 13 Jan 2026 11:28:30 -0800 (PST)
X-Received: by 2002:a05:620a:489b:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c52fb236e8mr46316885a.14.1768332509815;
        Tue, 13 Jan 2026 11:28:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b669418b6sm5769427e87.20.2026.01.13.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 11:28:29 -0800 (PST)
Date: Tue, 13 Jan 2026 21:28:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yedaya.ka@gmail.com
Cc: SzczurekYT <szczurek@szczurek.yt>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <o4eu2db3y3wrxaxtxcbxupdc2tzemqvb4fupwfkjfjqmy5qudd@v4umeav2oib2>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
 <20260113-touchscreen-patches-v1-2-a10957f32dd8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-touchscreen-patches-v1-2-a10957f32dd8@gmail.com>
X-Proofpoint-GUID: mx1uoVTIO_i2iLYA6JfHNV8uSGumiVVr
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69669ce0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=ECEyCYeL1hbWFqLZ0VkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mx1uoVTIO_i2iLYA6JfHNV8uSGumiVVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2MiBTYWx0ZWRfX8kWj5t7GKseU
 sN4sM+xR0fRFJnOMrbXWKCfMQ9vIXFherKzOjjKeD9DZs+H8Cl/K/OmWuC70RRVlmZzW3zZ7ibe
 /qS1ZMBF17FUkVisbW16esh0AsiFHbuibtGCAA0rcCQzO9eco4tHXvwSSNh2BIAZlhSzQsOd7/C
 G57ehvm/0/j8INXsPbVEfEuyzT5V6PvIDdy/2DTgIlVG6gV02ZsjmXq+R18iNVXoKSM3odJlsl2
 dXPc0EXpegIXQ+Q7gh8SfsjBXTupy3rNUophYGSwSfN7UU6Pv92HjOa8owLlju0gZb/PvY81Epa
 ecSXiR9xXWWS09VxuJVMsIjCVgo9Nof9G/1cvYdpnfxIxco0pwbsDeUvxI9ewPEKKRHpJrlsj2U
 MOYZZ8OSwNAhmfc5TiV3ypesOGqhONcPn3EwQnjF85e0tLaZGCZmwbcXACvQpHcRadpWGT29Kp+
 SSKtQtE7l9nrH3lX/2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130162

On Tue, Jan 13, 2026 at 09:12:36PM +0200, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> The driver also works with FT3518, which supports up to 10 touch points.
>  Add compatible data for it.
> 
> Co-developed-by: SzczurekYT <szczurek@szczurek.yt>
> Signed-off-by: SzczurekYT <szczurek@szczurek.yt>

This doesn't look like a name.

> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

-- 
With best wishes
Dmitry

