Return-Path: <linux-arm-msm+bounces-66037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF73B0D6C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FE2E7A4311
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 10:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70742222A0;
	Tue, 22 Jul 2025 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AK7xyzVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2A62DFF04
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178426; cv=none; b=GuklnOuiJLxYFoYsJMxqF8wTUZC78uhFzDCXCEL6bNkDqSUTctXIImykhlnSl98UmA9bK9+2q6z0TxkW0+va4SKCYryydMa4ugjg0H11CQ9nvuldlyr6w0Tmlx1zKWGWuHdViEa87W77cufe52fVmuw8ffCHE6N4gtc6VQFOo4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178426; c=relaxed/simple;
	bh=ZFUos+Yvil8dSKOPIWe/qIIyl/GJfQwWc76Kh9pE+Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXd1Hw7xLw1/gYMo/numqjbD6ze3NYllidkAITMaAR7wygNt1QssLLWrtME8lpiXdKE1PQ+eWBno5onoSLb5554COD/yH+69JcZm2mvdSuvHsbfn76kh0I6V0aX4Y/b7/Fuchcd+XNW8mqTwVHr6yz9VUzrdgMRDFkb05/AHgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AK7xyzVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M3UgLe005655
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 10:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFUos+Yvil8dSKOPIWe/qIIyl/GJfQwWc76Kh9pE+Uc=; b=AK7xyzVGs/M75xcM
	7HScBwdSKjWDXCteKO3Qijnnm6X5oKWJGNH6gmYAzu/OHpaxpgs5UeuuMFCbEKux
	dIAWqIdMH3rb6IOSjOr09BtaCZI6bxnoWDsO8ki9M6nTdxOPVUsiNzzBlqF9Dzss
	LSQZNJijCVFtLfJa0ODUa6LMN6/DSU12JlhUsnKZBxpjYqdG/RNPOU+g5YsNN3G4
	/s14+QMbGb/rhg3sMCviiq0rpBkm0jMcZ+6r0Db9zaM1az0c+2p/sdQRCaw119b3
	JYuqY9/6xKkV3+Lpt4FktOqkxO7HfzBqzl3oR2FoAulf20zfsNGGtWHTCdttq66n
	KlTKWA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q92gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 10:00:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-706f8cac6edso8496d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 03:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178423; x=1753783223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFUos+Yvil8dSKOPIWe/qIIyl/GJfQwWc76Kh9pE+Uc=;
        b=wnoZxumkbl9tOLB65k6P21zhTNQrigQRSsZNYEAO3IQm9zviZ86BLXET8na2MwXfad
         QHkVKGfKGiVsBW7anjz/hPOqyuSTj1dU+zp3fSaWTKa1q5DI2kpf7ZQYCh/JOKQRv1YM
         GZSSP2+x9dabMJ7MSQEoeyWG8CuLZ7PknEqVFTBMBECXf0JET5GiSWVZHI2ZcSbuza9u
         xDTjkw0xOEsD1vE9qanIOxaofOog87YaRfXm8zTRoheDLM20wcfk3YGDrg0ydOEAwYXw
         K2LdArm0Dj3b9u14midkmsX/FwFTPaz00JG7kB00UUdUy6iVLtD3qSJXvOcWFUrt9Ug4
         lWlA==
X-Forwarded-Encrypted: i=1; AJvYcCXLh0DLcqeX8MEk+Daxa06yvoGljAPQF+EcigGn6g8B4Nei4zYtJ7/oadmmx4A9Y7V2Io1otOX9+xBpTHBm@vger.kernel.org
X-Gm-Message-State: AOJu0YxnIOC2E2V6jjdT5zBHUuoDRkpAJA2E/Qyso+8qE1BQHPlnLj1U
	rgEBN2gnoJhvGDwPHNsMq4NV6MTFeJBBFmV+42o4FOV4v+O81vv9S1RzDBEd8kU1kRjQxjWdy+x
	IU6o+8654sy0u1bnHsxhePU8MEtO2XWIWFr3AhSKc4Hdawlh4VqrPEZ0I/XSMhPaBrHvau3KN7P
	spryWQqq+ddQ4Ib9wz6GBUQlcsMRj35AjI6QZHkKBf4IM=
X-Gm-Gg: ASbGncuXG6e0nP3cHHd2XEkdmiNktRBB4lFX9sNITbtBsxkk7eJI++9yuvgZ7S07v5V
	lFNWNG0uSmf1HGkycpoTnuvh0PXvDqf2XVY3IOQExUB9RmvTBqL55HAMaOIKWUddML/OlhLFIGw
	4kD51O8d8yubSnr/ZEQkeE8A==
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id 6a1803df08f44-706eb97e401mr41624856d6.24.1753178423050;
        Tue, 22 Jul 2025 03:00:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnslX1INMW1ZcfY8C65651NT2OJbOZR/zoQ6vqkmc1Rh6IlkIlO7GZRBmqwzeh82/rHsXodp0l07CU5wDGjxc=
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id
 6a1803df08f44-706eb97e401mr41624056d6.24.1753178422401; Tue, 22 Jul 2025
 03:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com>
 <2025072141-anointer-venus-d99f@gregkh>
In-Reply-To: <2025072141-anointer-venus-d99f@gregkh>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:30:11 +0530
X-Gm-Features: Ac12FXyseMee9ZgXxpNxNQGaZuoVfGDn4Cm07lYWSuBy4v2nvFb9hxkyxtZvFQw
Message-ID: <CAPHGfUOsk4BjhvGiN-b0UP-JZ48UvGeKFU=dhb=KOAvo8NCPZQ@mail.gmail.com>
Subject: Re: [PATCH v6] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4MiBTYWx0ZWRfXwkVoiwBkPAkL
 HLvIYJGd+qmu9DTFm2dxXdRbO5WvlmtgFiPo96gCbaaWRwwV66a1yHlK/m+Hq08xbxFELgM2vze
 FRGVTkVm0QEKp3CC4f7qeHCovq8fkEFF8tpVHhLG8X7XQBTQ+LXqxAhqC1Rgg8EnGYV09B8m8nz
 tQ6+mDa6CvGMN/2sFBvoqArMmZNaQpQU7wF2pGkQjfDrQEjomrMGvPHf4dqHasW4veDFGjkbAzu
 ehFdLVaBF0sQmtHLxEC9nkADut0Eoq9I6L765lN0dO94SlMcNehQc+p1UTnl6Ckvm1fo4jqzhhh
 9Wm5AJbavnSaNIuuQo+lRZ5YwVDdaCeEA1WVbEtBYG1s1tODXaGJczGANbRZs5J/UUwcWdGcyrM
 xzY3RaqcRafd5MYXAqjGf8+OwFBJ+DKx5DtYFrVVqrgcPndc8SvaZUBLX3XoWdhj3J6XSYhc
X-Proofpoint-ORIG-GUID: tettLkUcGbHfFyH6dC5cuYWHAa21BPNy
X-Proofpoint-GUID: tettLkUcGbHfFyH6dC5cuYWHAa21BPNy
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687f6138 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=ag1SF4gXAAAA:8 a=HSf_CmxJb-FKQ9LhJsQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=774 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220082

On Mon, Jul 21, 2025 at 12:23=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 21, 2025 at 12:08:41PM +0530, Komal Bajaj wrote:
> > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > as read-only for HLOS, enforcing access restrictions that prohibit
> > direct memory-mapped writes via writel().
>
> What is "HLOS"?
>

By HLOS, I meant operating system running at EL1. Do you want me to
change this in the patch?

