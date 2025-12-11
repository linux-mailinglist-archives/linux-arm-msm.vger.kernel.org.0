Return-Path: <linux-arm-msm+bounces-85070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DEACB63FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5C943017869
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CDA217F53;
	Thu, 11 Dec 2025 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIFGs6JI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIBLZNVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DDB291C33
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765464602; cv=none; b=pe6FRR5r+zBGT+zwjEx8Fe0x8E5YEyPFvtBYCo/jTe5KntUHzL/3KHb7C/lpRHVrGqh4zXphCcvRn7dMuBTP2aHrqo/9/joPFNYBniQ3ZViTbNNJOMINlVULQ1fbnDH8X3vU9HFEVh2rZJe/Ro4Ehj+vw3hECgON4ZxK2CkquMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765464602; c=relaxed/simple;
	bh=9h61RF8LGl3rDMgsN2IZObu3mk7lC/c6J0WPUl8klCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uW1Nx1Sg6donrH9WUnhCWdrd5z4aBgUNnkBS9EUOilsrncEJ0GsWgejvzEWurhTqxfLWgy36NWhO5TcYzQi0rsXjI+ftZHAktl06MPNOoTAVvDtgTfAkXGdlXHO5wDRQvSN7VYzk86cvmS28gXvxbkv0F5m42kLtM2dG0D/KT/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIFGs6JI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIBLZNVA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEPHu31525444
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cItl6ZftIc9q+FLw5nVHrhmMNF4rfgL+kWUbqIfMBOQ=; b=jIFGs6JICdsRnIBz
	DJgfW96nvka/FEorSM2C+bAvWXVQmPIs1GyMe+rWQdIQNdUHkmypFM5PhqkG5uF2
	g3z65NQ8bdptEtbrC+CJChKIXtTaWlKfQDEPkE5NLyUvtEKiDwp5ledF4miqgvb6
	Ckk/kKwu6VL4seizye9BY5dmmBviVWXPsXLPJj06JyBAW7LHwLY6fiHzj18Y0AHJ
	1fJFWgZZVwMhKFgsutQy+mbSkSux7Me2fSK7ON4saa38bWfDw8GsCeQGZTTLONhw
	/2PdFeZgwydICnnOQGvCE6NCfARDarRujqDvOp8ykAmo7vrdq3Aitw7pQ/KW+cAc
	BiVtKw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpahkfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:50:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so2875411cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765464599; x=1766069399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cItl6ZftIc9q+FLw5nVHrhmMNF4rfgL+kWUbqIfMBOQ=;
        b=eIBLZNVAcLP7hxbRP9LEdZC1Qk91hCOgJg/OpjFiV5OdJitgUHYDtwARGDnVZZ6TFB
         5W36fRE4Ow0E/GoPTmj3mJGIZr2es7lLI5ZUjMtjugn3DLKIgF0mGNfpMLxA18aDX4O6
         VkeWh72LWApXu6Osy9f6PCaHGLlJqgme6YrOFn1BIPMuRF+jc2O6MnaTI9/U1RWv3Sk7
         jNiHNZF2Bcazks8rqAJXlGhlED1xnIjh1tf9ZzP3AW7BBfw8E7fiduJlYobw/iuFtrP0
         kOaHfUN7nwloVCcEgg5voIGsRvKQyEhjGVn75atGpm//sgu+gfvV1R8sJ7amwILEiyFd
         Fhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464599; x=1766069399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cItl6ZftIc9q+FLw5nVHrhmMNF4rfgL+kWUbqIfMBOQ=;
        b=SNKXKP/PRyJO3sC5yQ+9a8qce8b5F0d2GYu8e9Gix5sg9DhUZdU0pOGhqbnW9HpZb3
         1tsLgPnC3fsbMfvG0PtCEqDDQzgwgyWeG1RPunCXKLEZPaHZg/1GNPKOf3kmvZympBRy
         /EqJptrJ9RW/n+SK+15rA/qA7mRN4ogR6AFPv49zd4/+kOhygm2F9prTNUq65qcecLIi
         ee+T90p1jiPB1+4yN/JeTVuiNdjSCnrpw9bAXN3E6ugPQ3tLUOqiolAuoMR/cOg2M106
         QrUUbqP1sR4I2UpAmUcOEkYU6hvQDajdWABc09p8yC0jZufbIrkpbtaKmkq63zbeDvUJ
         UxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8Y7X35JQOfbjDGfeuZR9woWPCVb6R2amzEzAbr/BcHfxsRFX1TyODriO+mrvZCuUXcC0U3wCyGzjVr7X@vger.kernel.org
X-Gm-Message-State: AOJu0YyPD+RJNgiNie4h0i0NhR/dc5RXBxnAI54uQMjkWG6Ea2r38h+C
	2XuH0nMqzk/+GRloOG1T0xGdLpVbk7fejVD9KSEB6Yu2B+mn/rHPQTvmv7oaQvdBru1+z21gb5O
	1naVlcsT4mFOJ+9in6ADHSODx2CB5WCztrMp/ixio8qzVgE9/cM4VtNLY/DLElFSQmoqaQHjwhU
	4SfKNgxC5h/RRVurv0wdKO81xLCsRVUW7RNg4XbCpCGQ2tq2aqQ/quRQDq
X-Gm-Gg: AY/fxX4EHnV3j6s4TJMkxyPKlK3vc4WpOB8tK74RN9V5sLlZeFK9vQZJl9CJhyzEafm
	PwZVJozyUcFjb6oJpxl9mHvVtZRAtk52sPtAjIyQ/y5hMOXG7B/YqgvwF0PUnmFanZcCRYbAtqz
	h45CcDLSpTZIf/jp4P20vCXeSg8b0eIQdMcMnRzpm/0WyOhbFNX33BqZqtVKV5EPNrPCknfRyhk
	GdrEEbTsO0+p3qSd5QB101yHAY=
X-Received: by 2002:a05:622a:2d0d:b0:4f1:ca72:a472 with SMTP id d75a77b69052e-4f1ca72a56emr2719601cf.13.1765464599180;
        Thu, 11 Dec 2025 06:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9kHo3e788UbRVNwHDxeJAgsl9hat/il2wj8F8Hd1XJ+FntrNgL+91mSqwyNu0bHYaPVYBGq79LpCHzUQwkU8=
X-Received: by 2002:a05:622a:2d0d:b0:4f1:ca72:a472 with SMTP id
 d75a77b69052e-4f1ca72a56emr2719301cf.13.1765464598526; Thu, 11 Dec 2025
 06:49:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211134836.1777897-1-loic.poulain@oss.qualcomm.com>
 <h3jx5drjfg4xa56lrbdu3xxic53hez35jotkrznozawjjljfh3@kwo6hdccfkus>
 <CAFEp6-3vvudXm14QMtP=nD=N5Ur415JLaNF7HnBkSfiZMa_WzA@mail.gmail.com> <CAO9ioeWemDY2CxfRRH=ZUgHO4DX-UCQr7Q8+PPyBbp2JFkk5Dg@mail.gmail.com>
In-Reply-To: <CAO9ioeWemDY2CxfRRH=ZUgHO4DX-UCQr7Q8+PPyBbp2JFkk5Dg@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 15:49:46 +0100
X-Gm-Features: AQt7F2plPeHSZyzy9C_XTyowRpLAidkfuZyR_8m6OaoidV4kJazjzyUHRihuIt0
Message-ID: <CAFEp6-1yOWa7YH-aYkjXU7-F-it96TMcYwddRtJ6thcrHayMVA@mail.gmail.com>
Subject: Re: [PATCH v2] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: djbZzxksPj8rdYuYY7jeMKdbG9AXTA2Y
X-Proofpoint-GUID: djbZzxksPj8rdYuYY7jeMKdbG9AXTA2Y
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693ada18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=QLhd-hmNkmp1bChrl4MA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExNiBTYWx0ZWRfXymUs+gbrkOLB
 ooCZWJ70Rvs6I1QiGjvQ3dSiGYDAxJ1tJBiQUd78SYcDZ6f7js4Ca3lTXhcuSKJjiU2RMYHX4pq
 d2VxcKmrt0TWp9f5ze9a64ZsnceQDebQP+XoNK/L6nJ3xjriNuZCTIBbOUBEQzrzkk96wZGpQMI
 zWyJfmtxyJw+dHEqLstTriDYCjZaAp41ZB7DLeNu6UfnncC+SsZBWXU6FRtAt23G+Jq5OAylkPf
 ROSCXbNI5++tXSFEAFpSeFWhwgDU8kFikEjCBueJq3VKfIECvC7nJGoHjG5H8xqbD3U9Z69fpkr
 LoZlJx+gfz2SwSvpT2mNsmyTrbZjIf3ulA6DZAy63xFyLjf7fsyTDesuy+d9myUrPxEqGd4oUt3
 0ZVLKv8uat7duLUCMkFvrE9kJ90ftA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110116

On Thu, Dec 11, 2025 at 3:18=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, 11 Dec 2025 at 16:10, Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > On Thu, Dec 11, 2025 at 2:57=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Thu, Dec 11, 2025 at 02:48:36PM +0100, Loic Poulain wrote:
> > > > Enabling runtime PM before attaching the QPHY instance as driver da=
ta
> > > > can lead to a NULL pointer dereference in runtime PM callbacks that
> > > > expect valid driver data. There is a small window where the suspend
> > > > callback may run after PM runtime enabling and before runtime forbi=
d.
> > > > This causes a sporadic crash during boot:
> > > >
> > > > ```
> > > > Unable to handle kernel NULL pointer dereference at virtual address=
 00000000000000a1
> > > > [...]
> > > > CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PR=
EEMPT
> > > > Workqueue: pm pm_runtime_work
> > > > pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > > > pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> > > > lr : pm_generic_runtime_suspend+0x2c/0x44
> > > > [...]
> > > > ```
> > > >
> > > > Enable PM runtime only after attaching the QPHY instance as driver =
data to
> > > > avoid a NULL pointer dereference in PM runtime callbacks.
> > > >
> > > > Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> > > > short window where an unnecessary runtime suspend can occur.
> > > >
> > > > Use the devres-managed version to ensure PM runtime is symmetricall=
y
> > > > disabled during driver removal for proper cleanup.
> > > >
> > > > Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >  v2: Move runtime-pm enabling after dev_set_drvdata
> > > >      use devm_pm_runtime_enable() to fix unbalanced enabling on rem=
oval
> > > >      reword commit message
> > > >
> > > >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 19 ++++++++-----------
> > > >  1 file changed, 8 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qu=
alcomm/phy-qcom-qusb2.c
> > > > index b5514a32ff8f..c496acbad0bb 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > > @@ -1093,19 +1093,10 @@ static int qusb2_phy_probe(struct platform_=
device *pdev)
> > > >               or->hsdisc_trim.override =3D true;
> > > >       }
> > > >
> > > > -     pm_runtime_set_active(dev);
> > > > -     pm_runtime_enable(dev);
> > > > -     /*
> > > > -      * Prevent runtime pm from being ON by default. Users can ena=
ble
> > > > -      * it using power/control in sysfs.
> > > > -      */
> > > > -     pm_runtime_forbid(dev);
> > > > -
> > > >       generic_phy =3D devm_phy_create(dev, NULL, &qusb2_phy_gen_ops=
);
> > >
> > > No. phy_create() checks whether the device has runtime PM enabled. By
> > > moving these calls later you've disabled runtime PM for the PHY.
> >
> > Thanks for pointing this out. I can address it, but is there a
> > specific reason why the child PHY device should conditionally enable
> > its own runtime PM based on the parent=E2=80=99s state?
>
> Yes. It makes a life of drivers easier: if the parent has runtime PM
> enabled, enable runtime PM for the PHY device in a standard way.
> Otherwise the non-runtime-enabled PHY device will prevent the parent
> (actual device) from runtime suspending.

Ok, then I=E2=80=99ll move dev_set_drvdata() instead and check that runtime=
 PM
still works, which I should have tested for this patch version...

Regards,
Loic

