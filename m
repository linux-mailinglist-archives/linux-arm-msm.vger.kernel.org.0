Return-Path: <linux-arm-msm+bounces-85065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A2CB6269
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1061B300A28B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBF02C3247;
	Thu, 11 Dec 2025 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymb/ivhY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqftLSFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BCB275AF0
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765462232; cv=none; b=UK9yt4IQ8kZ5heYYVYtTWOi1+n3PB/+EEZSENGMCjpUiN+0mPnb0qIEn7vVWU6HzNhXZcMqB/oS8zCouxbqaiK5lybZBhUTVxLAl33tXYZKaSrKk18GrzOxAnXECt08wZqdpCpRKsi2W3GbCWa0EWPzd2BLiB5CUp5vEkEkYUtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765462232; c=relaxed/simple;
	bh=FE+b2HfdXqzbpYEZlRyq0hMzIWcbIoa9iMvYzIypYow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpBSuUKJgZrrNtPbn5+9p+ChViCoYGSSUcVAAhBSabD3zwwdQjXhFWkNsmV/gizc5BMrYZCtNlIgqFjZBks1ZIIqh2C16GO3182uC4kTDt/jO3BgKG5IYpCfCpRMLV03tElMaWzgnULSFHBfIWJ9SkUxwWDcHE+yNhAAZiPKYYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymb/ivhY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqftLSFl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBBlRWv1687207
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9fVE8csb/uWNk+XFFad/gngGb7HZwjYc98wjxog9gY=; b=Ymb/ivhYfYsV0nLf
	1mI3lBoJMov9gMRQXj5/RSDopv0jvNF7LuqBWwkr/6cosvyHE11U7O9Cw6soevu3
	zNA1Pc++xIkozEBC9moLgiOjQTxBjKyu74zBbdI2mZd/LduMVGwS8mDAT3igvtcx
	q1OJSl9D6f55XX66WXaiZRftvt7wxSBlLZ7b4Pcad3AomY4KiTaS+9pnEQ1ypnZf
	I3RkaqcVNIqj7vviZ5H6LYTQXeSKmt8cT3pz5QCUmUyJoHttsqKzGKW24uT+JQMH
	M1nCZ7pSx1zJ+TLo3xXi32mwhW50abBe4QtW7Nn9uG9mFllzAcNe/uPpRbOEF8U3
	ioxF5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aywcxrd7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:10:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso3125561cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765462228; x=1766067028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9fVE8csb/uWNk+XFFad/gngGb7HZwjYc98wjxog9gY=;
        b=YqftLSFl0NAea2N4bF+Efj/GI7W+VpCwlrHeunK1chzQHrhTkVnAQYDw+GdT++/h6I
         5l8GA6t2/m2LZp3PBnNjRFdLx1DA7s50ira9uveSTlolbUPrT/7IXpP5S88ljRFiNBXG
         u7TS74S1UDZ6dRr35RQrIdnSCVp20CulVHIA88UNJARdX1xl9683gWdj18NhTQ+qGbR0
         oH1JqroTI4GmrUFDp4a7nvlO41Njr5gUajEg+5t3NWmbCwNwwvQhmbnZlI5FQa++KXi9
         S9B/ELrHKKcltAE10fABrnyOz7IE9s/YTNDSO7sEoMUN//bWWywJqdksyIkM67wNU066
         mSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765462228; x=1766067028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f9fVE8csb/uWNk+XFFad/gngGb7HZwjYc98wjxog9gY=;
        b=V2XqExqAK78K2ZzYA1EIIHQcTRz2x0LnIO0X5on1T0PKCJ3cso11afuDcTujYzV8P+
         NK0mIvwBF6BYLNgskk7RUD9M3XhTWzQ3lLmnxP13hoJI3LBMSzKbsnu5UAEw5FJqjvLd
         +NHvDz5PvalkBQn8MFPyj1H2C3B7CGpQCgN2FQR5pur8EhxYDInnkOsFBcYmKwJVaD/0
         w97UFw+l5rmUmKdN6sqRj1PGYBGnNIxvi0gffI7IfUWL8E1/JW0JUIbfLgEt/LKIsYoH
         nsosl35ApaIQpyK8IN8k7vK+OPEsnYv09JMtFI7FlLj34V5aoYOnx2eQzwsZ8Q0wgQJX
         jymQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXDJEWhYu4M/1mbHahpX6gbXnGNDt6t9KsAbDspqVtQrfyNz2CPCqlXXu6YctmAuWjY6zYI/RTnKd9zKfu@vger.kernel.org
X-Gm-Message-State: AOJu0YwyWXY2CXHPXKGI5OCsv9fa9aeDgVFWH0saESk8xbt6riRA+tTq
	tThhMVbfcI1aVlz+KbmgXWNGpKY6Dql0Q9Trl23rkGhhFBexTpUPV5MQk8/Du3y1EyhZ9P53e/Q
	SHOyHgGhLqOqlLhOixYrRyI5l2qIsFXjqLzuG/AFVnDuvvOLNa7QiIuKE5JHdME+JEnFUQFTCuP
	yezaP6Wql1rbw3cf9EJya46LgZNCYs1oetAq3WGtAXctE=
X-Gm-Gg: AY/fxX4EPRnPa+2/YDdmkk/WiqkvhnOHKg15OzPRMo/BCFT3QMlFplvSlhUK8Y1ee6P
	S8gCpWJq5OzOoLu4VlSH2wuosAE/4LMu/nqccUWDGv1do13ipYpELIY1WGjwa+/ZMwztWSyUOgD
	YZzTHSGD0NXUdT9n6uVELk9l2R6HKb8KZfcOugu4sp62w+RuI/I3r3FIuvOk5gwR4KX84tRIgMy
	PIkKM3UrjtGsRYftMYUMsL9920=
X-Received: by 2002:a05:622a:4c06:b0:4ee:15af:b934 with SMTP id d75a77b69052e-4f1b1ae8bd5mr93069051cf.79.1765462228517;
        Thu, 11 Dec 2025 06:10:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpK3SYJe2XpZn4Hlqo3fKfakuoYUXzuu760MXQIEPlVA14YYOM3uy1YLCEyd+ZgPVNELIHDXaPMSvOh6cCCCM=
X-Received: by 2002:a05:622a:4c06:b0:4ee:15af:b934 with SMTP id
 d75a77b69052e-4f1b1ae8bd5mr93068561cf.79.1765462228119; Thu, 11 Dec 2025
 06:10:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211134836.1777897-1-loic.poulain@oss.qualcomm.com> <h3jx5drjfg4xa56lrbdu3xxic53hez35jotkrznozawjjljfh3@kwo6hdccfkus>
In-Reply-To: <h3jx5drjfg4xa56lrbdu3xxic53hez35jotkrznozawjjljfh3@kwo6hdccfkus>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 15:10:17 +0100
X-Gm-Features: AQt7F2rqhr4nk7eHsSkBo4hLVWzwWEv-Xv7NwNXcidV-s9Bn9gPrd9AbpErLr7w
Message-ID: <CAFEp6-3vvudXm14QMtP=nD=N5Ur415JLaNF7HnBkSfiZMa_WzA@mail.gmail.com>
Subject: Re: [PATCH v2] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S/rUAYsP c=1 sm=1 tr=0 ts=693ad0d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uUKr9bAsF2V2gpNUp6kA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UN8qd38_kv00hEL4GIEqkH46JayedJE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMiBTYWx0ZWRfX8B0UM/5MVWTf
 nRSn3MCJc+W6FVUnHAEMCYhHUc0RkAwlqnOX7+wDy7qA5N2ofwQHfGSVs1uh36pmw7xke4wAe+l
 1w1/+QG9qii00cHjBiCe2TqNzsY/zZ8Nh0oBVqM0vc+BLdPj+FZs+RTk/wvTT54mBIKC0mDcbSA
 LF6tAG4xAhxbrYER1WMv6Rl+UwqzW36ZlUvMoRzV/8mxVfEx3tf+Gbps2oJidNJPjvf/zKQMapq
 E/BJSNC/T11NUWO0vo/yTTBUCPDFkCDlffJmMNlovKFhkIdK3Ol/1P1wWsAK3CjPMGQZQVvakT3
 A9uekE1G23iHzG0+maJLr6ZZlrJ3rKKGBZfPNosb8+Tl6HpgArZ20dkX8mw02aQtISEZFvAWUpX
 BpyVyucT+BTcII2FH2MAPM+QjtOjzg==
X-Proofpoint-ORIG-GUID: UN8qd38_kv00hEL4GIEqkH46JayedJE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110112

On Thu, Dec 11, 2025 at 2:57=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Dec 11, 2025 at 02:48:36PM +0100, Loic Poulain wrote:
> > Enabling runtime PM before attaching the QPHY instance as driver data
> > can lead to a NULL pointer dereference in runtime PM callbacks that
> > expect valid driver data. There is a small window where the suspend
> > callback may run after PM runtime enabling and before runtime forbid.
> > This causes a sporadic crash during boot:
> >
> > ```
> > Unable to handle kernel NULL pointer dereference at virtual address 000=
00000000000a1
> > [...]
> > CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMP=
T
> > Workqueue: pm pm_runtime_work
> > pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> > lr : pm_generic_runtime_suspend+0x2c/0x44
> > [...]
> > ```
> >
> > Enable PM runtime only after attaching the QPHY instance as driver data=
 to
> > avoid a NULL pointer dereference in PM runtime callbacks.
> >
> > Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> > short window where an unnecessary runtime suspend can occur.
> >
> > Use the devres-managed version to ensure PM runtime is symmetrically
> > disabled during driver removal for proper cleanup.
> >
> > Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  v2: Move runtime-pm enabling after dev_set_drvdata
> >      use devm_pm_runtime_enable() to fix unbalanced enabling on removal
> >      reword commit message
> >
> >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 19 ++++++++-----------
> >  1 file changed, 8 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualco=
mm/phy-qcom-qusb2.c
> > index b5514a32ff8f..c496acbad0bb 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > @@ -1093,19 +1093,10 @@ static int qusb2_phy_probe(struct platform_devi=
ce *pdev)
> >               or->hsdisc_trim.override =3D true;
> >       }
> >
> > -     pm_runtime_set_active(dev);
> > -     pm_runtime_enable(dev);
> > -     /*
> > -      * Prevent runtime pm from being ON by default. Users can enable
> > -      * it using power/control in sysfs.
> > -      */
> > -     pm_runtime_forbid(dev);
> > -
> >       generic_phy =3D devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
>
> No. phy_create() checks whether the device has runtime PM enabled. By
> moving these calls later you've disabled runtime PM for the PHY.

Thanks for pointing this out. I can address it, but is there a
specific reason why the child PHY device should conditionally enable
its own runtime PM based on the parent=E2=80=99s state?

Regards,
Loic

