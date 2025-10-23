Return-Path: <linux-arm-msm+bounces-78566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B81C00CD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 366AA3A813D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086391FA272;
	Thu, 23 Oct 2025 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJsZoqip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4362C325C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219300; cv=none; b=IXqsy3mCkSDk9aWG9lh8/9k9o00nA4Iug1bKy+wvQrrf90uhFjqF99S7d442qNeWgScgU+5GSTz2cCitUmt/e7FFR988PrM2c1dOkCnUsTJz74pVs29CjCu9QI7zUK/AjZrYeq7FcX0WWNO1MDSNTl34GfezdXgZQh7MAvq3DqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219300; c=relaxed/simple;
	bh=f+/NnNjzHQpwza0Q5UTb3bp/OkbrnhnjOKHiz2Go468=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAII5G8xL2y72N8QFO0+5oaj0supLfNaC8lafmCFyBDaoVInCKGOqMlZ0lwJmju6Fa+BbvNCq0WFbHg17c6h99qj7ZrIPUskzvkdfe8hGtrMD2b1mTRpumDWySiiDZMs4V1Ede22/nBvR80Osz7Zst3YE2zGtiYn4PYE65mVILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJsZoqip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6xYFh005790
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GsmbhgdWrGJ+GimrTjkaExR
	9bUmFkGScu7WoG+LKrE=; b=nJsZoqipaUVAIV7XnpOVhcGP1Rn/u0Zql4bOCl7A
	gtfa1c/6ECJEerPws1u3O3TPsWDk/8c4ynB1qABQlFlcupys0doyDROXbIKAfdaG
	Nx6UDeCTGhP46nzH3J7fPlXXLC7IyrIi4oiZ2BT64rJHK2W7eBDbz8I5RTQUGgGZ
	PU+ANNbTtYwZCUK9WrRvOrIX+UXMc3+9SA6fUCb6GeM8NJ+UX7H/4hGHj1D0i71I
	1guf3/78ZWMCUgOQsv3VNVzPCJWAX+fxZrG5QRov9LN3tYXLInmxymcCm4RLY/Du
	S8v38lDolmoSqbsLMNM9OdrcDvbUSNW4jdvmhVa2LJHukg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j8524-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:34:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so9617741cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219298; x=1761824098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GsmbhgdWrGJ+GimrTjkaExR9bUmFkGScu7WoG+LKrE=;
        b=ltobb3kIJgEz4X1nKqfggiIRr+QimdO7rNIzwDMpQNpALbtOmwzF0Yw4+5R1ArRr7m
         AtRBDjxkzsUYt2czufR3NdPJUyGYpnD0h/FdElOn+Lc+wYbS6yx9p5BKNe8N6SNIhnbN
         JXHmqlTK4NID0cXiOOeyWvrk4PftEOo2OmlwOATEteYW4Gn6+TzpGkVu7YWwh4CH0FKN
         keavQovv1yk8tGBqhUOx2EMMNmBwnuhd4RiPQ7jNgrjrU43uiRDrKBaalPaww4D4F+ba
         Nz2MuDIw+tE6bda+hgCiKQKozY6xymqziSBGdAEK9x5dR45RXSejHqQ94OmUwBlQ93zA
         KJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgwUgh3+6IN6TVIfCeZ4drVSlSY+wHmhH9TAmTMvrWp4ky+qAM+CBiPcwmuaDTgp0TjK9uZ922DvDkBQtY@vger.kernel.org
X-Gm-Message-State: AOJu0YxIRdu+ejQtd7NOhU2jxVvN63wSRDcYZuvIJVMdB8EHQZbbxKoW
	oWahF339/kXsTKHQF1WBzB2pXY9+CMsGW8VTDrn5eRcdiQmbzWAFOdG+qmEGXE/+LvBbn8gk/ac
	nmr2Ly3Vl0oHvO1thkcObOfEb0gYNMEs+b8pPqYgpoPCbhEQ0E15mh2SZR5ahDddJ8YVO
X-Gm-Gg: ASbGncunaOd4GiVgtGTan6CjX3TJyiZHvSlXFSfTCvnt851bS0fqN2WVvX6DFqfTx5f
	L92DLWucQj8IXC1bwEzpZa8yw2tIPUDertFongG7lpgRjYB9QwQmmH1XkYlv8OijZ2sYO3jMwII
	Y9LIKBrHmIc/T9m2AnWGAFoPIj0S7RHgje8/bDy0zPiMEY2h5ih9E0CbfdjJfVrrJEFVnyKVfzw
	5EFo7yOagMwXNgYIM+aKAr08bqX0kRjlvo4yFMZ/waXemNnj9OMS7x37jb/4k4QV2Er15R2QbHq
	zvOHP2IuVZlg/NsrjJ0Pn3QPrSMZSHKeR+5OdQ5qYnprGu8lrsZZqgWoH2gaw2k4S7EKpSSaEcL
	JkECSFlKVd+6Bi1BXjI1iO5C+9sE1bIfYnhe5X7+6h0WWcPJ7Apj4A3u4Fd2Hg1au+dYganBjOi
	t7OGtTBNaZIqmg
X-Received: by 2002:a05:622a:1488:b0:4e8:ac66:ee4b with SMTP id d75a77b69052e-4e8ac66f3famr247774691cf.50.1761219297558;
        Thu, 23 Oct 2025 04:34:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI3toh2FWWacCWixWtLj+UhejuUOALAkx4auCsoA9mdYJd6RmpJFsj+n/JRxq7WMt0HM3+Yg==
X-Received: by 2002:a05:622a:1488:b0:4e8:ac66:ee4b with SMTP id d75a77b69052e-4e8ac66f3famr247774281cf.50.1761219297099;
        Thu, 23 Oct 2025 04:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc592sm3822231fa.45.2025.10.23.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:34:56 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:34:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <f2y4aposu5ddpwgue5gskumo5mjwkrod32ecbvveodgxrysg6u@zsq6ftoy4yqg>
References: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
 <20251022004554.1956729-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022004554.1956729-3-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXzXqxvNz/itbj
 dHPpaQfo96OA0ZqhFQbD/PbWteehGnmQEL974ldhedc8HR1yTXvGtm9EY2xP2zw6i8JC39BSaWJ
 m2TJ/gdeeoCOB0eJv58t0hseKdB+RDh0uO2A/7ErKdSnwv3Vy0vljGoFhAcCGvaS1p3kdsgOCNo
 jFkm6+miG78ENvjwD8gQB0uSVt+8mtKLu8uVvmyQHxXGQidokvxqYaQqApTIUPR/1yKBQM9pcGF
 sa213E9t0YE0Ek8S2JWWPrqtJLt5/FXbJPRBlDEz4iTYO3122F4NHbXqYmQFlS2SSjFoluRe0nE
 iEdVm3P8ctLAASuzI7V88Kn18njhRwZ7NT/GdbJMl+HUJmG9Dxrpsd15pWUYSsvH6PnLeJ1P7Xa
 +ztkB8NR6iR54lsUxpNh3ajm+JTsQg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa12e2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WG3W4BPXNB2T8y8KjtgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: fKIcGaTfzEp4SsQ3CHtC5MgmDgNj1uwj
X-Proofpoint-ORIG-GUID: fKIcGaTfzEp4SsQ3CHtC5MgmDgNj1uwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Tue, Oct 21, 2025 at 05:45:54PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 80 +++++++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

