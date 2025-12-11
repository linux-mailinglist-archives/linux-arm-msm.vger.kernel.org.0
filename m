Return-Path: <linux-arm-msm+bounces-85066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F2DCB62AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 554CB3005AA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4FC22759C;
	Thu, 11 Dec 2025 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuJJ+PQt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvApN66x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A669F224B15
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765462736; cv=none; b=LHtaztiLDngpJNyCX+N4yr3fmZlB4uM/cckRfCU7KYAYhQB53ryAPBEEIlLQiIC1gLSfEgVEKXxTNJ+/6N7ib00Kx+zXAYhV3LSc7/hE34w2UL2mTRGNJiz7fXq7307JIb8sdsD4mFxXe60fHBL5yH97kVFXAcj4IkHQhsBEtLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765462736; c=relaxed/simple;
	bh=6I3omNMbe+XvROV/5zVQ5CKmptdHrMMzfbwQxxdqE+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkiC0UOGjwtZxi+p+VDIkNlWS2LIyqCUxvVdKDpnQqg9cG0heGlsr2Zq1UjbKbSvY37vBm3le6EsqM7fBUcs16+azPd8MlyHb++gjqnOXeQCBUenxrnYK7+bOircmHVyYmhOStXU33aZdiNDRpiVTnw5RAztGarqX5ecvkuVuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuJJ+PQt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvApN66x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEGKwV2003605
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jYZLtnDIBe6UB8fryKWEukvFJ81R6dqUxJIBsQ+Dkp4=; b=BuJJ+PQt02s0oJx+
	c2MFszQqv1A3FoOTEM9sUb9V7dsXPs0k4a5Sap3OE73rH8wTo09a37R0SiR+vKwm
	7nfe7cOeTt2yZQIiUapDYIn/HutAhb5WRf2e9bo4ISW873pYan8pCNOy0KNsDTMm
	H6c8ens6+qbZ/3qEmlCHC+uXwKqNgyymSnrU7TvhCXyF1nl//E7h40MarZjcqJf6
	Kk64druSoB1n8JkQbO8TtWjEFzLb9VyKPAB/ZzFTzrgmoJyu6yA+6vMp20IatNYZ
	sN8GpQIKOkD8I/wdMufoaRWgpbonaWa4w1+8RTBdsAr3oDwk3XD3fMkvtq2alI+y
	VHRlKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aywcxre57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:18:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso106713a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765462732; x=1766067532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYZLtnDIBe6UB8fryKWEukvFJ81R6dqUxJIBsQ+Dkp4=;
        b=hvApN66xEMA8Fmf1DfQqZyQZbZQiVFSg/AOhyrHZ4Ib6iUDNlDPYqPbyXfupg9GgD6
         oEvtLp0CT9DvblO+pA4JFdSDYoNOMpMJ4O4CkxCRF6YVeA5cavPfJsgiNJggL+dX9tLh
         FSEQfjuzG7/a13jlNpeSaFvLS/dR3dUPR1KN7SmfltO1js+OwHolvFtzKvu33huZKHXa
         4MGLnkylyHV+N5nxpJ3tAF2IiXJVg3e86ZqqhT8DUq2lcyHRukpDCCIe9Rca1Xanq2aF
         NUnYWzcHZOfuYTTDUsaXg3L2Poq95rpwMW1iBBPJJbcQyJQs/luIOEOsogNZv1RPQHL0
         1ULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765462732; x=1766067532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYZLtnDIBe6UB8fryKWEukvFJ81R6dqUxJIBsQ+Dkp4=;
        b=WvisOzikY9TXwD9cUj64vTcS1Rub90+XCmElXFgbSDcu85ycwoJbtqDwQZQyicxrdx
         asIR2xKIfAHNg5Gt42k0wS5XzSfABoh8N59G/ETLelj5J+gzeVC22j7xc6uVvssn/Szq
         i+HwS/DDUvZrPqd/Bo3ML1NfP2DQwJnqA94ZaiH60bu+BSmeDvRaKNgIYM/w9vs8BMAK
         M7vZw4yrsijHRg/eqSNmeSfKsYR6Hlzeapxhb5Qb/XcpO3vkJshC8Gv304pU6my9aSQP
         uer2nBdQ4c1QVzOdXQY/5OfPW7rXcierqNZ6L71CxoHKOsojGrTbBJBdxjHzfN9FsLkI
         y99g==
X-Forwarded-Encrypted: i=1; AJvYcCVqRGqEIrV+5iX/MWIXidIyyhPaGKtYNdZi69r57QfCJ8SR/vfr2HCSJ1ZQJAF5BaU6ArPmBgLuZGFuj7Lp@vger.kernel.org
X-Gm-Message-State: AOJu0YxVMCRNRkgsQe9wPuZPfTYZWda4ScRsp+qm3t8lRBxYr/AHXYXA
	MSow6rZUvCd2Nj/5JiHh59jzczgkeOp+j3yJ9de9rGkAmIDu1tQXcl6gEt+MeaE0GbHf+F84+7i
	f7Lw2eM5P0+1IqM7C2wKX/9JMY7r4toc25jabE/73bS1RwrZE8ZhZsdrDbXj5Tv3oJEbPLHrfmi
	68pQOuAbQgU3XDHkLCpyacCc+1tM/9OwUrnEoTVeu+OfI=
X-Gm-Gg: AY/fxX4ctFvfiXYcM2q9lDuii36HdBZe24B44gkIDdtvht2hUrwM8HxR7yD/02YNrsq
	JZx9t+VKd7Pi7zt53wYSGMh10rRDXKLwAhiBWoRa1LPe/IhxVzi9y9QnUOqlKN+k+lCd5CJL/AI
	AHR3KNfYVv8zqusk5qzbJI0qWR2V0Xezg0/vyOX9ENjVOERvoZtiXe8AW2U+HeEkRofTBXh6l1c
	JG/+gJv
X-Received: by 2002:a17:90b:2d45:b0:349:30b4:6365 with SMTP id 98e67ed59e1d1-34a7288be9amr5718440a91.27.1765462731983;
        Thu, 11 Dec 2025 06:18:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwvpG48xYstpfHh3GhJ2BS/7o7bI2+NbKM9Dka4IpfhS7AKsTOm/qvR3udIlAZvNo96akAQcj2bvEPawnq9XU=
X-Received: by 2002:a17:90b:2d45:b0:349:30b4:6365 with SMTP id
 98e67ed59e1d1-34a7288be9amr5718412a91.27.1765462731396; Thu, 11 Dec 2025
 06:18:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211134836.1777897-1-loic.poulain@oss.qualcomm.com>
 <h3jx5drjfg4xa56lrbdu3xxic53hez35jotkrznozawjjljfh3@kwo6hdccfkus> <CAFEp6-3vvudXm14QMtP=nD=N5Ur415JLaNF7HnBkSfiZMa_WzA@mail.gmail.com>
In-Reply-To: <CAFEp6-3vvudXm14QMtP=nD=N5Ur415JLaNF7HnBkSfiZMa_WzA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 16:18:39 +0200
X-Gm-Features: AQt7F2pFqX0ckYAuVwr92kRkqudgW_daYj3_mvQmOzihBa_cb4jK4v0y7f4ONAw
Message-ID: <CAO9ioeWemDY2CxfRRH=ZUgHO4DX-UCQr7Q8+PPyBbp2JFkk5Dg@mail.gmail.com>
Subject: Re: [PATCH v2] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S/rUAYsP c=1 sm=1 tr=0 ts=693ad2cd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Dh82oV3AAIrWe35RTHAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 52pZeMure84ddcSHGuz_Q69zCDKvem90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMyBTYWx0ZWRfX27FD6P2jblHG
 ISz7hDlUmzplDNX7+uyQmHxhLrneRbgOGgU//tFkF2Ra4au0fiX7Mf1b6Px0GDK8sLgta+ZyFJ+
 slhnjTfYfk0UBRXU9eZa9gRraxjIAnQFBWmCBbl7s0ISm+LlJ6wn4vrPtGohE+9leH9g5Pw1kwt
 4npuuzsaBppkOnJGESkzEgdkF9dx2GhR1hSpoma9Nt6RzhUBnKioRyMswKUscaoE6A4epE2mOwj
 ykqi41iVMHUoh9/aStR+X8MC2ziM4N6hIlFVUITJVeT1RdQFooY6LDnCAI2NliBvTavi3o8mV8Q
 I1oARo16k5Pm6vz/Qmy4UstEnRKkA9ifO6Ll4sCmQJATb2l4cPJMZY3Wuth1BxL3hepaKCZkGfS
 4rmXESlItnC1R4W3BT5fSCd7e5jaMA==
X-Proofpoint-ORIG-GUID: 52pZeMure84ddcSHGuz_Q69zCDKvem90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110113

On Thu, 11 Dec 2025 at 16:10, Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Thu, Dec 11, 2025 at 2:57=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Dec 11, 2025 at 02:48:36PM +0100, Loic Poulain wrote:
> > > Enabling runtime PM before attaching the QPHY instance as driver data
> > > can lead to a NULL pointer dereference in runtime PM callbacks that
> > > expect valid driver data. There is a small window where the suspend
> > > callback may run after PM runtime enabling and before runtime forbid.
> > > This causes a sporadic crash during boot:
> > >
> > > ```
> > > Unable to handle kernel NULL pointer dereference at virtual address 0=
0000000000000a1
> > > [...]
> > > CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREE=
MPT
> > > Workqueue: pm pm_runtime_work
> > > pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > > pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> > > lr : pm_generic_runtime_suspend+0x2c/0x44
> > > [...]
> > > ```
> > >
> > > Enable PM runtime only after attaching the QPHY instance as driver da=
ta to
> > > avoid a NULL pointer dereference in PM runtime callbacks.
> > >
> > > Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> > > short window where an unnecessary runtime suspend can occur.
> > >
> > > Use the devres-managed version to ensure PM runtime is symmetrically
> > > disabled during driver removal for proper cleanup.
> > >
> > > Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  v2: Move runtime-pm enabling after dev_set_drvdata
> > >      use devm_pm_runtime_enable() to fix unbalanced enabling on remov=
al
> > >      reword commit message
> > >
> > >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 19 ++++++++-----------
> > >  1 file changed, 8 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qual=
comm/phy-qcom-qusb2.c
> > > index b5514a32ff8f..c496acbad0bb 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > @@ -1093,19 +1093,10 @@ static int qusb2_phy_probe(struct platform_de=
vice *pdev)
> > >               or->hsdisc_trim.override =3D true;
> > >       }
> > >
> > > -     pm_runtime_set_active(dev);
> > > -     pm_runtime_enable(dev);
> > > -     /*
> > > -      * Prevent runtime pm from being ON by default. Users can enabl=
e
> > > -      * it using power/control in sysfs.
> > > -      */
> > > -     pm_runtime_forbid(dev);
> > > -
> > >       generic_phy =3D devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
> >
> > No. phy_create() checks whether the device has runtime PM enabled. By
> > moving these calls later you've disabled runtime PM for the PHY.
>
> Thanks for pointing this out. I can address it, but is there a
> specific reason why the child PHY device should conditionally enable
> its own runtime PM based on the parent=E2=80=99s state?

Yes. It makes a life of drivers easier: if the parent has runtime PM
enabled, enable runtime PM for the PHY device in a standard way.
Otherwise the non-runtime-enabled PHY device will prevent the parent
(actual device) from runtime suspending.


--=20
With best wishes
Dmitry

