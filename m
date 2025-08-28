Return-Path: <linux-arm-msm+bounces-71119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB1B39CC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B36CA5E24A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A109B30F7FF;
	Thu, 28 Aug 2025 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joJzk8fP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC9F20E6F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383345; cv=none; b=EIX/32cAOtvVduNZd292JWk/LBfNqWTO3mwsJp8zOXdYsLSe6sx6tcZk3k23YVRalSAd44FtphwhiDr9nz88LKidREROPJHM5+MNo0uObd32tAsNWLu+QOHmRjGyqkSTaKs9dKDHEBIbhlwSk4nlZnQkeHsU5t5+cad1VcmMzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383345; c=relaxed/simple;
	bh=2xhCRHRTLxjuQLGzNqN8SkuqvNwon6nBw35IuX6DRFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pm8nA/YBIfYhjPUiuZAd2IJhtumcY4wHV08rQxeNv6HY5NEjhLry4vTRV371WYlkslk5znVVlzZ0aGbT/ew8lhBrIixE34PMxalhTihzX8fG9hNWCN1FCoJrnYD4i7ZtsTxEq+vTaGrqzcMLaCoHJiQT1Zeu6j0b0bS7K3jJu4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joJzk8fP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S6AIUP029088
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOlqLjJ4+85L5pngv20TDeHigXp7nWgjBGPjqExbJGw=; b=joJzk8fPNrb07kV1
	dPOO5dApt8wVm5oGGKgWCtdV1DFmHk6YUQr/vY+qBY/dA8Yp4hWvEQoBbrOyffgC
	BGUsq0HIo3yO1faSCFveHXeFtNtrfvVejrq9dSn+Dkmb3XT1d5HU0z/f8zK+OAHl
	ahjtbhYx5A4Xg6LJwcZOM8UpLCihss2TAa6A8jBAhImd87Gh8js3+Wlzs2uiBWK6
	ptDkBEyTayINCtjYnqoXXdfgiZNvmjbEPj8Z3fWZJuNy6HVOS/kjpXptsxpCL6hI
	/KDPt004yUYkMVNXtjmtXJwa9NZRbA3EPFR40LhwZrTpoC04a9IvCRhmsoGfEAWz
	rf4YAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umga8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:15:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3251961140bso898176a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383342; x=1756988142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOlqLjJ4+85L5pngv20TDeHigXp7nWgjBGPjqExbJGw=;
        b=dZq05MZQkJ9S/7Mk4/LuJLfqUZXSzkbv8k4kDpB/OL3AVGlxGuss0fqpP+nba+wzTV
         +UZxSj3nu2JQ70/FHCnyrn9h9nEkJHItXGetLjoU9BQ9ptMHUWCl0xiS78b8IDtoA84W
         rT04+I+ymK+0n4aERRtAh+HgDkjI6EfQyHv8Sbyflxxbn+DffowXJlyTOWpMVfyWSt+q
         kmfgyOYoDoNBm47xbFCJClCVh5Ih2JQ/IT74xIK97n3kQt+QJwxjJIVpRfr3ZE1tK+Lj
         vrCJZVNC2qeKRFVJKojL4jDbLGn4Xn4Jowy3bGYRGFDSn65KfLIU8QOK5jJkzHHawoil
         pd+g==
X-Forwarded-Encrypted: i=1; AJvYcCVuqAPIliAO8sXLXVAMbK3KhzbcGw9fbE/pxmaza/kjyBhFM4ouUo6QJavfSpqxGwEYiHp8uKM/SvA0nAxw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx30NL1JY1aHY0pjTN9EZSQp0ieNtoOtEY6YYCj3tmyreTaCe1m
	Ztz8IFvibbZJWA+B7qyu3PUaLBm4yUz9Wa7bx1grtWkctwbBs4klJQmKyYOkp1WfquDkfpZi9Dj
	dMiXlFLvwR5djVaCbF0caOm3OOluJ3PI6RILiTTsmg3PQtQcfl7j6OD2QolG9ll9RoRPhhsW+M/
	StvF+bG5dZh0R/I8J/FN0A0Q11mTvt713qvQj8YEw5v0Y=
X-Gm-Gg: ASbGnct634QjkCFY7IOo9CZKsgHnup0z5b+oTRbkHdsQHL2V2wB3eiatCzm9GbJ0i4E
	05Rl3h8oY2/bZymjx5OvlgJsT7vkqc4CLR0bAplD2uuOiwWEJoZKa1wSUePNP+w8oWuyBZcWWo+
	MoBB8I3gaB38LZdYcWjNKu0s8=
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id 98e67ed59e1d1-3251744bd07mr31170089a91.19.1756383342299;
        Thu, 28 Aug 2025 05:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSsXkSAZdNMuiuXSHYHnTqO7N+RkBf5W6xlTEjzKw50BVu/0ezesPtrdfj3US2rSF06Spip/rafkI1bV+Bz8o=
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id
 98e67ed59e1d1-3251744bd07mr31170041a91.19.1756383341777; Thu, 28 Aug 2025
 05:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com> <d121952e-4662-4651-9398-3a5446a2281c@oss.qualcomm.com>
In-Reply-To: <d121952e-4662-4651-9398-3a5446a2281c@oss.qualcomm.com>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:45:29 +0530
X-Gm-Features: Ac12FXxpoBpQzfudUCruaW0Kd4qcz4c4oR-SINclPGIyBv5ZH2lkiXCY60AdRnw
Message-ID: <CAMTwNXBM2m6sazPZVng3V-DDJP2T0aVBgh8C5d4K7Yq_O_A2Jg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for
 xhci plat devices
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b0486f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=VUFb5atXsKZqicoco_gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXwAZrBs7wrEjw
 coGrfh+ED4tVot5euT3Hy0BfMpr+kzU9ZFXfRDYMuDiMA/Rm5rW2ixlsuYAcC2vIIcLEYxFcKlf
 LO4q4Q1XqUR+timzIdwBGqN8xo32weVUUtD8kQpIMg96b+D3628XjlSYKkWzg8h4kW8IDbiCJks
 93gfetLP4UmvHWYM/osRv7N8yf+DG4FYtztL5j1e54ZF7nVSeTziEHaUb5W8EHzmnEULZuafQ1E
 6YfftEIgcRpXfihuRj22MVd6vkDtRT+AGu1CAXU2vVheBKWcRo9rBeLVuYHofrPzOvqZDPCHUD3
 vtaCOH9fsN1IKYxqBRs9jsy8fURq8nMjbGKZliX2Rd1Q46SRBWCF3Q8PdwQK07numWbKjVgc2sP
 9IK+VgiQ
X-Proofpoint-GUID: 8WzzF2iXJ8h71utPUOc0UhASdMG6WJ3w
X-Proofpoint-ORIG-GUID: 8WzzF2iXJ8h71utPUOc0UhASdMG6WJ3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 11:10=E2=80=AFAM Krishna Kurapati PSSNV
<krishna.kurapati@oss.qualcomm.com> wrote:
>
>
>
> On 8/12/2025 11:25 AM, Krishna Kurapati wrote:
> > Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
> > when in host mode, it is intended that the controller goes to suspend
> > state to save power and wait for interrupts from connected peripheral
> > to wake it up. This is particularly used in cases where a HID or Audio
> > device is connected. In such scenarios, the usb controller can enter
> > auto suspend and resume action after getting interrupts from the
> > connected device.
> >
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---
> >   drivers/usb/host/xhci-plat.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.=
c
> > index 5eb51797de32..dd57ffedcaa2 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, s=
truct device *sysdev, const s
> >               return ret;
> >
> >       pm_runtime_set_active(&pdev->dev);
> > +     pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_enable(&pdev->dev);
> >       pm_runtime_get_noresume(&pdev->dev);
> >
>
> Hi Mathias,
>
>   Can you help provide your review on this patch.
>
Hi Krishna,

I think the email added for Mathias isn't correct.
Adding the correct one.

Thanks,
-Udipto

