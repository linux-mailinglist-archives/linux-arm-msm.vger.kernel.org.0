Return-Path: <linux-arm-msm+bounces-75680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D710CBB08FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 15:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6625194685D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 13:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721052FC01A;
	Wed,  1 Oct 2025 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+WQA5md"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40512EAD0A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 13:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759326504; cv=none; b=uKBdT2cmhL4Tw5x05IABjONw3vRqnWHNGHKqYRjsVC8n9w8QX9uMOCwli7Gq/69c2SOVjYLi8s3CADmwDmcsgt9ms3K40ycecv0J6y8dkEa0M5rN6koWqGMIfAKtNesV/yQ6UbWFYX1NN3BncVLq8rlryNpw75ZNkkxZTSIkxAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759326504; c=relaxed/simple;
	bh=fp3v57qBuLEjj+J/x49VyV5FvxQeWmOVI+OPPyz4H7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJvfxq26y+joOBFurVQDl76tZH6NtfYKTcrnEnAz/m/KxePvq//vC4K3ALSWcqET3cuoCo0PeK4nE+N1KeFwkixtDrgj+BayU7TegCmwF9Z4bdesKDvv43RdQKHvsRw+DbLeJUoQuski5tGAfH+DtzBKaqLK8P719Q4l6THJ0RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+WQA5md; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591A4Kj4001106
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 13:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fp3v57qBuLEjj+J/x49VyV5FvxQeWmOVI+OPPyz4H7U=; b=n+WQA5md74ejqI22
	weutqrqOSh8bHER/YgP7ORqarjnx1x7Q6u2QU+m0t3Lgnn8Hr547sOFtCtOpdVdo
	VmzJNle/CIt6lSESTN5+mnCqR9WmQ6qEVGXOSctw7w9fDABsyH5X5YlBy/qWGQ1Q
	wFFvroYetQDlqWXwFB7GeRHuK8p9JNqCZkvr0znuzjODxrwLfd5D735ii9598kQe
	bChngM/JygPhnrKHpyQZUoSHS2Q8TeJQfkVvVvVcRn5i4g7NhtRgXbf/XQTBTQBo
	WUxTXtxv1872zW77Fjh3QFjVsXR+UInS1z7367YDXPEF0hlFF5wmi41WBwq7m0e9
	QD+cbw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr86ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 13:48:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b588fd453d7so4780239a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 06:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326500; x=1759931300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp3v57qBuLEjj+J/x49VyV5FvxQeWmOVI+OPPyz4H7U=;
        b=PBZY1GmhRwgW7bWOw96jKTcA2hmc7zoCDsluZ9nh+xzvPVnZKVGiumnU8QaZ6lVNQ2
         vY2UO3u6AHZZJvLCRJPwJhLkuiTwfHLJeu5tVQlURzwRmRh89UcgeNos0faf7bA/hrfR
         Tbj9ooZyZHotB7CDsky9McI3z1uc/j7yGAkKzrhrRqxNdtjd+isyZXUPlXOktHKpag+m
         WaZ/IorLjhzYzbxBd6TVbCoDhSCo5gkGuG5fyM1ily/+5Uy+TTqHC+gJh21c2H7bEVe9
         xnNCnVIZikZi75l3t9WWcr9RvJov20ADFR4mB2lO+TuoYnW3QxlG2/c2Btm6wviUqlj6
         pezw==
X-Forwarded-Encrypted: i=1; AJvYcCWb+oNAYFLOkoJTY0lBk76dx2i0/oZh0rCT0TjgWm78iN5/aPP7wSMaYFtgb3fRzW2Kt9H+OzAW0WcwGr6u@vger.kernel.org
X-Gm-Message-State: AOJu0YyZQXRGeflUPR6WIDk39mJ1/fvITOAFxsDGAr10LE4JBcTcR+Oj
	2Vp3AnQtV2cuKVfgBp13JJEIdpm4rSeI/evX/P0vZCGC/ik4UncaD52xuYw1+INssD8lPDTctOF
	DdgUX5n5bMipzT+q73vAdKBBC7h6/HCR4cUjm2APSl4SiaD6LsL48GB9OfB1AFHRSXAgiJv2Igp
	A8filAOrdmQcUykyXJAU56dauXEBKJ94RTANVDC9awqYI=
X-Gm-Gg: ASbGncu0Br4k5o+nuS7fiU7AX4l0Nu542YdTU5x2U7tqnh285JYhEnprKGgfgwxuV4d
	4LNzMSzZZZjnuUGShesDwgfPJvHe2SMoaBcihvtT/blMEIf33J2Yx6fT/UnWpzEzycVPCV4OO9/
	rudED+oSC68Nkvsx/gP3cowk7P9dC0Z5MDuXqCnDxZnEWV1aKlHZ1kS/Nl4MU=
X-Received: by 2002:a17:90b:17cf:b0:32b:d183:facf with SMTP id 98e67ed59e1d1-339a6f66d48mr3342745a91.28.1759326500219;
        Wed, 01 Oct 2025 06:48:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGEoqW8Gg2lgK86qxAwu+nfXe3G5OJ2NfYflPendMDk34x4Ydw1dWzOJ1aSl3n8ThNvGAbpRjrnFNtVgBSIzw=
X-Received: by 2002:a17:90b:17cf:b0:32b:d183:facf with SMTP id
 98e67ed59e1d1-339a6f66d48mr3342716a91.28.1759326499769; Wed, 01 Oct 2025
 06:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-16-24b601bbecc0@oss.qualcomm.com> <cd91e7f2-72bf-48f2-891e-4e6cd36b1e24@oss.qualcomm.com>
In-Reply-To: <cd91e7f2-72bf-48f2-891e-4e6cd36b1e24@oss.qualcomm.com>
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 19:18:07 +0530
X-Gm-Features: AS18NWBhYwOecFTI7PUFOxMVtEHAFfH7cHQ1cCOcmiaMyYqMB14HKhsIE_TTwpI
Message-ID: <CADhhZXau4EPEvf6Ngo+p4Jv=NPF6TYxcWtt2tV+MyrmOxp7OOQ@mail.gmail.com>
Subject: Re: [PATCH 16/24] arm64: boot: dts: glymur-crd: Add Volume down/up
 keys support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfXyyFdQZUkm7+e
 yuGxAyEw62kRet3ggu5Ib7HhogWqIOvlXISVc0cjRcfNMW8qLV7PmiY/NvDlco8ANm79oQowbO0
 PLDpjDCiYhjl0nkFwj03X3dnvZMQ0dsfGRnppig64/mUhxGq5eXOIuBWjhZSW7c9tZjKqz1qyS2
 3T0KKkfcOHQNI0p3fXPEqhLysTWCbg2UtzC6LcFvLnbAo14WnF4a2h8w1xf+UMsPKKQUgQJZjFW
 iQyV83L+qmoYCl5QRh+HpdiMjHTl1HCTcYT+vTMosaqLfB1liippLqYAxsD0qGsbmQwiI8yuSud
 sXA3gveXVLBBNB5NZRiJMjFrx6Mn4WPn25kyORIhYAhiMSpGiwftW8lZ1Y9kyUlYn3FZf68bj1q
 qdZy0E8d07AHBb2qaMbrL+l1zV89WA==
X-Proofpoint-ORIG-GUID: Y75pHU930I3cBOXv5IS_VYyjPueGjo71
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dd3125 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=QrdbydHfbqU_mCGI0rsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Y75pHU930I3cBOXv5IS_VYyjPueGjo71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

Hi Konrad,

On Thu, Sep 25, 2025 at 4:46=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
> > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >
> > Add Volume Down/Up keys for Glymur CRD.
>
> Does the CRD have these physical keys, or are they routed to the
> debug board?

Yes, it seems to be routed only over the debug board.
The keyboard too has the vol+ key, but seems no direct key having
vol+/gpio6 on CRD.
(sorry should this patch be dropped then for this reason i guess?)

>
> Konrad

Regards,
Kamal

