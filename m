Return-Path: <linux-arm-msm+bounces-85211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F652CBD06E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22E5B3008795
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1043328F9;
	Mon, 15 Dec 2025 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVb6c4X3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PeOH6o8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019173321CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788576; cv=none; b=YSr9RXzN7OmnvOYycKpZ/+uVQK5n50KGQYLyfWTpPcxJp6LrImpJbOfZJZHsrNY0unSZDIauKUArj6nm+iYzv6Af9ck2k66cjDyMiJi62Cejz5UdktGLl00FjBGCaqAJ8tIYQPMeggIcaM6ZO5jbYFFAdrWbbOFZgTmojCWQqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788576; c=relaxed/simple;
	bh=sv2Ek4+3tXUS6Jl7ZIAKmiGiLzCf0zYLffF9utUWfcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asE/WB2crBVkwXvP8dRLdv2GO82+jdDMNqZ3DO/NleVOfThHQeFBen8HP2oWUmrsrSUzT8SWCMyQA6SosATtkQG/mDoYWBqBKFoXfd0EDOQ35SzYw82rubzEkvw+zFKVm/Q09sKCjxhcO7FrEJTw0YgBnkM9VW4na93b3SanzmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVb6c4X3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PeOH6o8Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEN2bwe3408772
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQ5PQQnRVcWN/TdWh3HTFVD2m/1QwxYxUs81P/+/+rw=; b=NVb6c4X3Am3dSGJ/
	RTNPDYGy+q4SuuF+gCdHOV2y+aZotqJ4V9hxMyRlppVxdz5xXAMvxdHzxvlALqgP
	r5csZ7tkr2q5qOg1XntSZ07k1OhQ6wEnhzU6pZakRzpemzZtwNyje9iId6vFJDAp
	lbt942GqlFLvRPrh5iUPX6FwNIFqPfWNmwFYal6NVcohg4Ov0BR9ifdPHTR83t94
	PhM+9NEkST9B+opmJrxyz/+MasSuQ7l7Gw9z/EhHc8Aq++dMMB3cuS34TkupVj4s
	oo+VHZQXy4jY9yP0ahArn6SrNlBq5znJX+fsnNTlRwzQLmAlBz5xrijgqS6Prqk/
	MBpymg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11cykt0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:49:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee3dfe072dso86475421cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788573; x=1766393373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQ5PQQnRVcWN/TdWh3HTFVD2m/1QwxYxUs81P/+/+rw=;
        b=PeOH6o8Y+hJKXfGPAoaNhWrd7EYjVWJvZwLNYzjdxLtJ0mxajXkczzwY3YjgI6v13N
         KbhTQ6buAcMQhi/DAmeKtuVJILA4qa1BtilZPCD/DBq+lR6MwSpxs4BYY/YkN5JZ6qkr
         Jie4l74q+AWnwkPofoFBlnDBhSuTNV1upuEqHuzFFchg+pOR9DhdgmF47n/LnN50ryE3
         y2PhZ5Nw5DGLrqE5OijNqrn+3y2flgEiNEGClUC1HaTIVshtm7kA40ROW/8RXvX5/2x0
         LZW6ZzfxixtT9q3SJI0cH4hca65ZIeyHKOHBxOHOCAiaGUaGyOqHn8uYcxoF06mr91Un
         0K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788573; x=1766393373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQ5PQQnRVcWN/TdWh3HTFVD2m/1QwxYxUs81P/+/+rw=;
        b=ViylBLXCf8cI8AwVCjWuSAUeQn1OsMDFwn7FyJqhAzaSFwsQ0SHINOek+BuCSJ2KbM
         L01iRubeAbVW/KxiZ8s21jo/wSNbYiQEql/toSOCPQPF5USQmpS1T4W1Z9aQq65K0v+Z
         X7B8ztk1NwsTgmw0PuhjBkADhXutckcMs2iNlgDzC0p//n1sI+1GH1q4eft6NKpRe9uG
         VzN5t3HcAMePkV4ru2Omij5funbe7pSkLuuCZ0TZVvYGAXSn4OsTVSPKcdvRz654pxXE
         CXS48OunwdsApipGN4zMeI97hhtO8wAN/mhHKtbXUiWPuwImi1aBlVREzxIMDzv65fXV
         22ng==
X-Forwarded-Encrypted: i=1; AJvYcCVTWtkvpODyJ0DRuezh+IYZw3TIJ6ek/txfdynVEV1oUmvLQiv+i/9F5r8tkpQSI8aC9pN1aUZbZBVGuF99@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf0y75FTm1xywvv+GF92hj158XcO9MHX6HCDKfUtvZEA/mjwH4
	JhjII+BvtoAK0ZOloxoSqskdUnIxCRWDbdEh+Z0YE1vsLdE35RRfECefRKBVrjiHhDz7HWZE1vW
	kqQhM/uE76aTraa/wzPCJ55LPB3+odqM/Xd3eIHj7JS691ExrFf0tvLmXJHE4QuMAkWqE7OqNw7
	bF/FLEDuF2FTPtaIJrPsgKG23P2yIdtUj3RkTUgHlJxXg=
X-Gm-Gg: AY/fxX4e0Xde50TSnyKWqCTX68lCtkveNRXFMTVORAmlu4V9sogmtwL+E+5UXqMlg9B
	FG0kCQvq4cTQFBcua+BD+4g9xm4aTqBj1/Ue4ddYYrEOQeoi3nQpnq9sqQIDpr1teqyHD2vPQ/9
	1xv/PKduqaHT4XmOm0uff4T7V+E6tJNN3xMJ+21DCu9M8ecD1G6jGJqiPtZRNzN1kq4xXS3t1Zi
	1mmUZ14GLBDwPRS6sAZcAVdTNM=
X-Received: by 2002:a05:622a:8:b0:4e2:e58a:57e1 with SMTP id d75a77b69052e-4f1d052e6a6mr138495281cf.37.1765788573134;
        Mon, 15 Dec 2025 00:49:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV0yyCMnskxyPhkEOErwD7wOeTkRSWmeUyBV/oan/XvfnG3tlv4JH3W5ZnZ+t/OzoynncoUghIRfRNUdjDISY=
X-Received: by 2002:a05:622a:8:b0:4e2:e58a:57e1 with SMTP id
 d75a77b69052e-4f1d052e6a6mr138495101cf.37.1765788572561; Mon, 15 Dec 2025
 00:49:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com> <aktk3ofvgdusfo33kebaepfc2epyty36sltxxceaq5q2gy2kfz@6lki7itbthd5>
In-Reply-To: <aktk3ofvgdusfo33kebaepfc2epyty36sltxxceaq5q2gy2kfz@6lki7itbthd5>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 09:49:21 +0100
X-Gm-Features: AQt7F2o38xi8ho4CfKQXWBAUpeZnh7vZDoyvRW1DlgsDL7esYEViphFIxHxUUkA
Message-ID: <CAFEp6-1nQHUTQwaxX0TrjFuKsAGYjdMHG0018z8FqsXZQ0Nffg@mail.gmail.com>
Subject: Re: [PATCH v3] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MyBTYWx0ZWRfXz25P1RxevAnF
 osU80OSMUNxqw75CTwzJjbolM527myjx9POgBnp4yuZxymfvj4GhyOUjoe7060jC8YIrJ6mdWLY
 +nj5NX1rxXdGwxnANR1kunQvYK5OYVauPSaurCJJJXoRci46QmvRbxeKp+zZWib+ELExV/8tG9I
 5EZdljp99zCLK2E/jVtBq25kbpLMbV1c0ThrnH78A0bkTEWnIY/fccULMH3BTAcN1e4YCifJsoJ
 yTQ4uHnRl5So81DDqwQr6OHeDTlpUWNNon1WG2OBalx5eLmrKIXeFAVyTqB/SAT5oTtU19LV+hs
 oV3rRnqc71I9Lz0Pj0UTWzyh2lgSFpZo+m46lPj2xz33KE2fdsHpLZi7nE0X8/a39RC717Dxp9l
 cIQlC+k7pFG2bjnswZe8gpLwuJaTrg==
X-Proofpoint-GUID: 22ZpEi8ceAm4p63sO8FkMoUbHRHgPCur
X-Authority-Analysis: v=2.4 cv=Afq83nXG c=1 sm=1 tr=0 ts=693fcb9d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=S7GYT1DHwJ6J2ODJtQcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 22ZpEi8ceAm4p63sO8FkMoUbHRHgPCur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150073

Hi Dmitry,

On Fri, Dec 12, 2025 at 8:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Dec 11, 2025 at 04:35:36PM +0100, Loic Poulain wrote:
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
> > Attach the QPHY instance as driver data before enabling runtime PM to
> > prevent NULL pointer dereference in runtime PM callbacks.
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
> >  v3: The phy-core expects parent's runtime-pm to be setup before creati=
ng
> >      the phy, so move back runtime-pm to its initial location and
> >      relocate dev_set_drvdata() instead.
> >
> >  v2: Move runtime-pm enabling after dev_set_drvdata
> >      use devm_pm_runtime_enable() to fix unbalanced enabling on removal
> >      reword commit message
> >
> >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualco=
mm/phy-qcom-qusb2.c
> > index b5514a32ff8f..6386d834b0e4 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > @@ -1093,29 +1093,27 @@ static int qusb2_phy_probe(struct platform_devi=
ce *pdev)
> >               or->hsdisc_trim.override =3D true;
> >       }
> >
> > -     pm_runtime_set_active(dev);
> > -     pm_runtime_enable(dev);
> > +     dev_set_drvdata(dev, qphy);
> > +
> >       /*
> > -      * Prevent runtime pm from being ON by default. Users can enable
> > -      * it using power/control in sysfs.
> > +      * Enable runtime PM support, but forbid it by default.
> > +      * Users can allow it again via the power/control attribute in sy=
sfs.
> >        */
> > +     pm_runtime_set_active(dev);
> >       pm_runtime_forbid(dev);
>
> I think, this should be called after enabling runtime PM. Please correct
> me if I'm wrong.

enable/disable and forbid/allow appear to be orthogonal, the purpose
of inverting them here is to prevent an unnecessary suspend/resume
cycle from occurring between enable and forbid. Also, this sequence
has been tested and works correctly.

>
> > +     devm_pm_runtime_enable(dev);
>
> Missing error handling

I wasn=E2=80=99t certain whether we should abort on this non-fatal error,
since the driver can operate without PM-runtime enabled. However, if
this error occurs, it likely indicates a more significant underlying
memory issue.


>
> >
> >       generic_phy =3D devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
> >       if (IS_ERR(generic_phy)) {
> >               ret =3D PTR_ERR(generic_phy);
> >               dev_err(dev, "failed to create phy, %d\n", ret);
> > -             pm_runtime_disable(dev);
> >               return ret;
> >       }
> >       qphy->phy =3D generic_phy;
> >
> > -     dev_set_drvdata(dev, qphy);
> >       phy_set_drvdata(generic_phy, qphy);
> >
> >       phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple=
_xlate);
> > -     if (IS_ERR(phy_provider))
> > -             pm_runtime_disable(dev);
> >
> >       return PTR_ERR_OR_ZERO(phy_provider);
> >  }
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

