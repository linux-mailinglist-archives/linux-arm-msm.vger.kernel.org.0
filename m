Return-Path: <linux-arm-msm+bounces-85325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58128CC1D5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 10:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE9143004505
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F4D2BEC2E;
	Tue, 16 Dec 2025 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrNAbpQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1kV4Aga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A72C2374
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765877830; cv=none; b=OYP0FZ4aSeY+FQph6W4GfAE10yS67t7d6h/hztPsqErqHi/RDbcPTf6BSyNoerTDoHZxlq0FIagr8qgIIFAyoFjKHkcfI6yiRZnn4xsW0JtSPbNi1p1RwNWn8Ka8bmF9MVl8gnoWLJhXR+Ad03FBR27gq8vA6nhTnHv2v3XgaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765877830; c=relaxed/simple;
	bh=W3NayckAibqGm9vvce3CLzVjxyuCBqJQ7T6xAcvtPlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rW5LAsmUL3IOm8+S8SING34Wgc47OMZkIaoG6B0Vl86+ktscuYoTl0lrosxHQ92jcF+Ate9w9MgfM4Ph+StGHVQ8ly3lK9BKazJm2ZKtsLgyIuPGwRrzxpjBzKdkELMMd0kS9DqmrBqEnNrjDGXAkHSZYevYjwJWlrY1RArSHfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrNAbpQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1kV4Aga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG82IAK1824346
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 09:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1CTEU7VE95vXn9BXK2XzIHYYp5cBBqguTtER1oe9NY=; b=GrNAbpQg4T/AqGEr
	8cp2sNwxYJmp3fpkwtYmoLwvVU8+U9RfKY+zdg/uIcxMK8pcG8knoxK8vy/9xakH
	2ov2qLdHTvT6I7aQ3nZmtqgQgE+bmCMvJpFDodi+krazrij42E/oIDHIjIM2K6AR
	sncmTuWekKIYIqPqzXXBLi40zGJc1NRzy/+4n7Ab3gxVobSZxsOZv4ppjpDWhYPq
	olTDLdyhO+t933Ei15wOqjV8GwH5+n61f1K8tKrcaG+Orzcuv6decD8FCxN0lXx9
	qNqEnchVYoBioIu0ZXLTlV1zu1G2+8lZGBvNsN1iqQlWiingekrkVFmQmzALE4ok
	jXL5oA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p4f37gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 09:37:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b8738fb141so968742685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 01:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765877825; x=1766482625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1CTEU7VE95vXn9BXK2XzIHYYp5cBBqguTtER1oe9NY=;
        b=O1kV4AgaxvnHnk9v6+Lzy4BjzPJEeWWbCaumNg0enUMFf74PJOYEQKuZpCzOMGg2wu
         44ITUJWnPutN8tvt5Niv23Gza8Mc/zKERe0oA6+M12sFTrnkPaO29HojoqzVl1U17iWl
         C1xsf0B23fK8c3gmvy/5HgFJ/XNu2kU+wC8aC252viBfYxL0LWImO3jXgBhRQFMPFgCb
         2Idkmz4sHaAnwLG8F2orh2H+MheBPbX0/tCgB4agtu2y0gh4u9fhe2ezTZcAC977JUvH
         z8Px5aTcMlS3UdIFCs7r/Fly3hndOl7uTSZnc6jLFT3omH50TOKUT0aPYqJlMKz5LmGp
         87wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765877825; x=1766482625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1CTEU7VE95vXn9BXK2XzIHYYp5cBBqguTtER1oe9NY=;
        b=L/gm0jBkK/EaFEPWEYjpvdZ+ye3N8+bBHdujPzg4NQAM+vss4WGyGCRrR38ZP3EkL9
         5Uqgb1KgFYV3GUsE/ccAOQgBV63XySHHAbn9iCOQv4PbKYRJJmGUotqpkcmQPj3jXUmN
         vsH0+ouM994VXrSv1NMb+2YqUlLp3Vg+Z6BekcaRXgg3EFTD2XMR02aazKterlIcclc1
         fzyM5JyRGC4jcDIj4jECOFee6cbryDrzqIbqWS5DbM1R32hPy094XIcAJ91SmmjRa0lG
         etFx44GeloojrB3a12mBlRgD5zUPO22cbc+/ElHfNapX1wmtNsDVix1hcEr3pjNEjAJy
         wf2g==
X-Forwarded-Encrypted: i=1; AJvYcCXuM5nXx6xjPycZiTXnCZQNaeGtbvHVhbWQxfDZ0rdQ0f5pJZLZxAGnpu5GoZB/XSYqI8WQ4mxdr/fQubxI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3prEKStwL8h0k7io6DO/5GWzIt3XMM8hj2lu7Pgrlu/gEL4P
	z4JLrJXx4i9HJ9Y1eLbMaoJTxS7qmz1aUxzXLYs8X4DLjzlitLmbmEMraprVajequZl3wRVPTw8
	zOwOA3uFvSRbvSFJURCa5hC0GWOzmJpmXhqEwWc+uXBHYmDTPVt9XeDPYphV5HcLw5IQPz7H35r
	bvVQyHozGVe+Sez/l0n/AQCLcqGWGc2/Le4OqlhxTeJn4=
X-Gm-Gg: AY/fxX50q8zsmGPJ5AkfqcBb1eaoGzgnzf/D6ymdg22/dF1ACzEPWGOmqp7QxjGuk3X
	EQz+LUVh0k8YjyqbHpMLDsLeYvg22JgF5PuQtJh8jUPQqleYoN1WRv549GbvCN+U3Um6e/R6/6P
	WWzbEatK43QoHabrfEethEPn6DwfV+8e1sDi/G/4AHoUAi8fhPAk4iIupqpj/CUDs0uzU2WYpxJ
	h0DMERfzRSlr49a8ulTGm76E/w=
X-Received: by 2002:ac8:5fd0:0:b0:4ee:4656:54e8 with SMTP id d75a77b69052e-4f1bfc3630emr228648871cf.26.1765877825364;
        Tue, 16 Dec 2025 01:37:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF40aQv/vCjzaAlLKXbivtURqZbxdmEvfbkecBCsD0jYy4haDh9ZsncsUAvd7ll2ZvVewkoQg7bVPgfbeZG2Q0=
X-Received: by 2002:ac8:5fd0:0:b0:4ee:4656:54e8 with SMTP id
 d75a77b69052e-4f1bfc3630emr228648721cf.26.1765877824880; Tue, 16 Dec 2025
 01:37:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com>
 <aktk3ofvgdusfo33kebaepfc2epyty36sltxxceaq5q2gy2kfz@6lki7itbthd5>
 <CAFEp6-1nQHUTQwaxX0TrjFuKsAGYjdMHG0018z8FqsXZQ0Nffg@mail.gmail.com> <53a56an76s3ehg6eufr66l5ch2ygmp5wmc7dfqbp3srbspcuo6@i5r4gkadykm2>
In-Reply-To: <53a56an76s3ehg6eufr66l5ch2ygmp5wmc7dfqbp3srbspcuo6@i5r4gkadykm2>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 10:36:54 +0100
X-Gm-Features: AQt7F2pI_WEWV4GWSq9_BNW_tzXyMph3uzfYEBLCjMT8mjl5XsB_U1bCLNCfo8s
Message-ID: <CAFEp6-3x2JiqermQw-9S=+73gTCVSFyNuDLr85b=Ry2TRJDhyw@mail.gmail.com>
Subject: Re: [PATCH v3] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WTgk92Soaz7gSMPqRx27AzZxBFQfXHEp
X-Authority-Analysis: v=2.4 cv=OK8qHCaB c=1 sm=1 tr=0 ts=69412842 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=f1n9FbYBeM80bOThnCMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WTgk92Soaz7gSMPqRx27AzZxBFQfXHEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA3OSBTYWx0ZWRfXzMK8WAUwqSbu
 nUcdR+ukZHqaP1mAIOM0bC3nPWv+YDfbe03SNOdpM2V07CJxeDvRFCrZslxYFVPOqA/VScrHYdH
 fxjW9469XIvcXmdR33Bjn1afIRTjZ0fm+/AxzLfKGWXCjII5OAYDrCCB/7RlnLJF68pWON2YLOS
 ihNH2DtEnjssjh2ymOPh3ySgFCIO6//8e7ySF0gtP1e6wcj1DkvNJgE3+OOeDeyljJwiKQkGpX9
 2cHzMq7rk6EbdmzGxP1YKkRosYREfUiFcZdujtY7KBv9hWTU8YmvgxSEK8L7UB+tEdLYFUOBdB5
 OLs3atGlVfwp17HfayQb57b0+8LXC1XEodCvFFJrMvmwBIjHJmFNCXF/YfMgAYNr3KdWkSEdgo2
 iYtbcPEjADF+iwkCHD3qTsq1CpRcKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160079

Hi Dmitry,

On Mon, Dec 15, 2025 at 9:16=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Dec 15, 2025 at 09:49:21AM +0100, Loic Poulain wrote:
> > Hi Dmitry,
> >
> > On Fri, Dec 12, 2025 at 8:30=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Thu, Dec 11, 2025 at 04:35:36PM +0100, Loic Poulain wrote:
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
> > > > Attach the QPHY instance as driver data before enabling runtime PM =
to
> > > > prevent NULL pointer dereference in runtime PM callbacks.
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
> > > >  v3: The phy-core expects parent's runtime-pm to be setup before cr=
eating
> > > >      the phy, so move back runtime-pm to its initial location and
> > > >      relocate dev_set_drvdata() instead.
> > > >
> > > >  v2: Move runtime-pm enabling after dev_set_drvdata
> > > >      use devm_pm_runtime_enable() to fix unbalanced enabling on rem=
oval
> > > >      reword commit message
> > > >
> > > >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++--------
> > > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qu=
alcomm/phy-qcom-qusb2.c
> > > > index b5514a32ff8f..6386d834b0e4 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > > @@ -1093,29 +1093,27 @@ static int qusb2_phy_probe(struct platform_=
device *pdev)
> > > >               or->hsdisc_trim.override =3D true;
> > > >       }
> > > >
> > > > -     pm_runtime_set_active(dev);
> > > > -     pm_runtime_enable(dev);
> > > > +     dev_set_drvdata(dev, qphy);
> > > > +
> > > >       /*
> > > > -      * Prevent runtime pm from being ON by default. Users can ena=
ble
> > > > -      * it using power/control in sysfs.
> > > > +      * Enable runtime PM support, but forbid it by default.
> > > > +      * Users can allow it again via the power/control attribute i=
n sysfs.
> > > >        */
> > > > +     pm_runtime_set_active(dev);
> > > >       pm_runtime_forbid(dev);
> > >
> > > I think, this should be called after enabling runtime PM. Please corr=
ect
> > > me if I'm wrong.
> >
> > enable/disable and forbid/allow appear to be orthogonal, the purpose
> > of inverting them here is to prevent an unnecessary suspend/resume
> > cycle from occurring between enable and forbid. Also, this sequence
> > has been tested and works correctly.
>
> I see that in most of the places pm_runtime_forbid() is being called
> after pm_runtime_enable() rather than before.

Yes, this pattern has been used/replicated in several places, and
while it is logically valid, it doesn=E2=80=99t necessarily make it a good
practice. In fact, it leaves room for opportunistic runtime suspend to
occur, whereas the usual expectation is to completely block runtime
suspend (as initially expected in this phy driver).

An example of the 'right' pattern can be found in the PCI core: the
pci_pm_init() function calls pm_runtime_set_active() and
pm_runtime_forbid() before invoking pm_runtime_enable().

> It makes sense since
> forbid is defined as: "Resume @dev if already suspended and block
> runtime suspend". It's not clear what _is_ the behaviour if runtime PM
> is disabled and will be enabled later.

I=E2=80=99m not entirely convinced that it implies a specific order.
Another common pattern seen in drivers is the following:
```
pm_runtime_get_noresume(dev);
pm_runtime_set_active(dev);
pm_runtime_enable(dev);
```

The above is typically used to prevent the device from entering
suspend during initialization. pm_runtime_get_noresume() behaves
somewhat like pm_runtime_forbid(), but get_noresume() is usually
balanced by a corresponding pm_runtime_put_*() at the end of
initialization, whereas pm_runtime_forbid() blocks runtime suspend
until it is explicitly reverted with pm_runtime_allow() (usually from
userside via sysfs).

Also  pm_runtime_enable() operates on a depth counter, so calling it
at a specific point does not necessarily guarantee its activation, I
think this reduces any strictness of ordering expectations compared to
pm_runtime_forbid().

>
> >
> > >
> > > > +     devm_pm_runtime_enable(dev);
> > >
> > > Missing error handling
> >
> > I wasn=E2=80=99t certain whether we should abort on this non-fatal erro=
r,
> > since the driver can operate without PM-runtime enabled. However, if
> > this error occurs, it likely indicates a more significant underlying
> > memory issue.
>
> Yes. Nevertheless, in general errors should be handled rather than being
> ignored.

Ack.

>
> >
> >
> > >
> > > >
> > > >       generic_phy =3D devm_phy_create(dev, NULL, &qusb2_phy_gen_ops=
);
> > > >       if (IS_ERR(generic_phy)) {
> > > >               ret =3D PTR_ERR(generic_phy);
> > > >               dev_err(dev, "failed to create phy, %d\n", ret);
> > > > -             pm_runtime_disable(dev);
> > > >               return ret;
> > > >       }
> > > >       qphy->phy =3D generic_phy;
> > > >
> > > > -     dev_set_drvdata(dev, qphy);
> > > >       phy_set_drvdata(generic_phy, qphy);
> > > >
> > > >       phy_provider =3D devm_of_phy_provider_register(dev, of_phy_si=
mple_xlate);
> > > > -     if (IS_ERR(phy_provider))
> > > > -             pm_runtime_disable(dev);
> > > >
> > > >       return PTR_ERR_OR_ZERO(phy_provider);
> > > >  }
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

Regards,
Loic

