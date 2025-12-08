Return-Path: <linux-arm-msm+bounces-84715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DECAE322
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 22:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41616300BAEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 21:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB0D286408;
	Mon,  8 Dec 2025 21:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYblDhBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjkwiqGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC402D3EC7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 21:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765228358; cv=none; b=dnvhKuw7+abSygEskpQHafDATT6/0P830eqaGQ/m0husU9Cak6utLwHA3QK5uH+kymMui1HtO1xFgJNQbPrmfbptFL9xSere4hi75qc5/0Rzq5qX4wmOAJxvQmWJ4VA780krVsmbVZrLuwm2DZGLZryx0fi+eLS4LrjAlmfugg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765228358; c=relaxed/simple;
	bh=s5HlksebT2SH06sIATdNZ4M/KfGgKpyzU67Qt4ExAaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYzSsxJI47dqpu/tY+eftb8KJvQYXPcIrGk7fwAuctZTpqoAClLDaLERAHCFAzhKL2y1M0TipegD2lQPLgT0RDUz6TL72QNBrrouCtbWpHotZhQbfdzmJtOrJLd/ILVlb+45bj+XJ2umA9nj0jyE8Tpf7/EOmwO1R75LcpmqKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYblDhBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjkwiqGI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8J89A81327297
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 21:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wXVxWzLB2YJyzX93iyuR7SAleK6d/pCIxR6sxGbwmQ=; b=PYblDhBlvpAedbNY
	MQN8gWHzuAvv7smhc73ZHghH/W3BxRrxCBjI6LWf6nUq+4A/MyiZEEcNeHR/TfyH
	UKZWE/jcDcZvAC1aGPXFiXyVxa++efwY+KkTUB+v/w490P37ovgZKsN7Ozstiotv
	F+YhuzSlU9tKcz0ieG6tqQM3qXGFpmQtPB5a3mm5iKz9DB9pkr/9AUXX/sFDhlfv
	H/RUmaVLgxxQVt6EEuYDmSYhkRF8NI8hxyuaDhGzC+C7aYbNtmZNGCalMViu9aoq
	MZdh04p8e6bNilU7tpq2+w6dGtRWfHB0baOH+hmZq7FlVcN14JiDgrXQLu70vOGI
	EL96uw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax4jng96p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 21:12:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee25cd2da3so93824461cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 13:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765228355; x=1765833155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wXVxWzLB2YJyzX93iyuR7SAleK6d/pCIxR6sxGbwmQ=;
        b=UjkwiqGIvxRt3g65aOMJOxrDMM/Z8RQoXMjsDNUAwxNhcJ5mETqKhd1u3hVl3bh7a9
         00gw8d3Cqj+3u2+1pVfDY7Wx2yocMDpSm3s6zLwD07Lg4udp7rtrvOje2FhdD2CF3NAI
         sp5K0kKtgAvFvEm5/RBeGgcmJn2Ta15t+RvBOguhmQrT6o9JP25Gd32n1iIjB0+ZfDNU
         Cx+6FM3Zp3zAAnB4mxdY6t9PGwC2nC1HrMKSfTN/KZSl3VzbV5gOCwmDR6BQnZWUDbK5
         DOzB9FnNttxWR2sWQlCz8K5yZ8pFrWInNizBTEJwFmY3Lw/lkvAo/vVoEiyyxryoUBUK
         Y59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765228355; x=1765833155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wXVxWzLB2YJyzX93iyuR7SAleK6d/pCIxR6sxGbwmQ=;
        b=hppXYcihYcQeFBJYiodl6dmLb7OiLpsoDokFQHLvaqYWWu1gZ+YSC7ofQ1XS+MnlNY
         GM7ND4uig4OZtNKImC/A99LPKuDbVaaGQ2LPTzja4bZ2X2W2hoz0madizd9lErQV5Nca
         cF8mklxoRJDWwGPm4TAzkEqyE4+tbavRkE+o3sacj+6q5ozGAPpZ00vidyQhL5hl7OE4
         oMRm3L+x0etB7NkWi5PKktD8Yt2eeYHpYG2vyycI42DnD/0n8x7mu+uS5AHjuaY+Tn6f
         vr3zpmX8bP4laFFoaUuM39ZnXk3swCocEo4jrXNgUK/lNZ35Vdyl2zDSlIpXPmFa1mmL
         46kA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3pkBxYyYrWy61hl3eydh3qhFaCeT0YZ2p5HP+WkDsYskT5cG/lGfJSL2192V/rNt5DKsfp7P4DAZuP0Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2NN+eaz1HCoXDHf+eL8fIm5xrszsV5EBzacqDXXQ6d998Zb+K
	LXkPZbIDkIar2gR0X7v0KhFOcNzgKZnCJgrwLYNClFtlrQguvD2qMIXyQpqEhL9dbv3NN/iJnWb
	jCDBXLrsTJWuFMAEJ5YTQZlVyslV0f73+QoroFxQH4BZe7E+06Hznq2Bp8KmyE7GABG21NATVdr
	8ZLFTTwzUFSBfxaR22pr+fdPj5so1+x6H5WGsyGjrmy6c=
X-Gm-Gg: ASbGncvTKGRkXUuMK/49LzKNGs6uuR/ZVP6jk4D7pJA/poSfkEEzAaqNJxvXR6n0Qvj
	e+xQ7RhkqWQzNN0v7mEFES91om7bFsxdin3sWB4DNYQpW6/69Y269iG/rdhIYMXiOB5Se9tySTZ
	RFDtgEYHI5hM5/Q4+hPjzbFPYw5U6i549aHGcKP4Q7V0rPMn9QpVFGEBdn4BUaC+xanMo7/pRDN
	Mu4kkMc7lD4AtFvFfW8pl9J5y+i
X-Received: by 2002:ac8:5a47:0:b0:4ed:a6b0:5c26 with SMTP id d75a77b69052e-4f03fedb77bmr153874321cf.58.1765228355199;
        Mon, 08 Dec 2025 13:12:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe1M06ch7pE2w0WdG0trsE/2BC0FfpBDlUWnyfO2pFjrta0W1cdhfbmkI6SL9s196Tyya+kYXmMXOoe+362Hk=
X-Received: by 2002:ac8:5a47:0:b0:4ed:a6b0:5c26 with SMTP id
 d75a77b69052e-4f03fedb77bmr153873991cf.58.1765228354726; Mon, 08 Dec 2025
 13:12:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205160437.259125-1-loic.poulain@oss.qualcomm.com> <iua4oe52yb7xw4jtdg2n6bsi7m2aqdjcb2qsk6lrxrf57yeuxd@mseysn3kwuck>
In-Reply-To: <iua4oe52yb7xw4jtdg2n6bsi7m2aqdjcb2qsk6lrxrf57yeuxd@mseysn3kwuck>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 22:12:22 +0100
X-Gm-Features: AQt7F2oXnZhdO8_nIK2_6eMclCv5V-dyNjpk7mB2Qx5E_FfZJNASfXPIWqujn8w
Message-ID: <CAFEp6-1+VCT7Wr2Ajh+d1dyEk7yfcsVpR2zxr0Eq3bww-yt2kw@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dZSNHHXe c=1 sm=1 tr=0 ts=69373f44 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uUKr9bAsF2V2gpNUp6kA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cfNaTXp6nnKqD2Hknnkv1xYDnR7DxUiV
X-Proofpoint-GUID: cfNaTXp6nnKqD2Hknnkv1xYDnR7DxUiV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE4MCBTYWx0ZWRfX94GSRNyfUisG
 o/Xr3PQgcrAkvj0ytahtHwT/uZQB0PxKNccoKbkuIkWZENwbNDYg5Bijf/Xa/vAVRnRn7R30qr1
 xE5c4VXpyfx5P0NaUPubAx1jWGT8Ulcifgie2loOYYSzWcEMIOy/vCHP/+njC2FFLjeG7TEHmOQ
 tPSeWFwJH33OdSqs7Wbo55wMYwARbS1RL8q1RZhEskX3LPL7F8fxnZPD1qF2rrSXNJDNDWoToTy
 2d9zZbCRp2HQmzJDZ6ajZ1RytOxKxg10rduPJaNS+wu+2Ag622xL+Y+PvkP7ishdLczKqZgb5nr
 AZAAy8hY6dMNatSycQaa0AOuID3Lma1ORn7D+9mciA4DihXSkTZNtcHWwiuB+sTZA0jCOVX2k+9
 YkQsJorHpP0h7cqNAnT2qfr+8FpIbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080180

On Fri, Dec 5, 2025 at 9:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Dec 05, 2025 at 05:04:37PM +0100, Loic Poulain wrote:
> > Reorder runtime PM setup to ensure pm_runtime_forbid() is applied befor=
e
> > enabling runtime PM. This avoids possible early autosuspend and prevent=
s
> > qusb2_phy_runtime_suspend() from being called before driver data is
> > initialized, which could otherwise lead to a NULL pointer dereference:
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
> > Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualco=
mm/phy-qcom-qusb2.c
> > index b5514a32ff8f..97bc3755a390 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > @@ -1093,13 +1093,14 @@ static int qusb2_phy_probe(struct platform_devi=
ce *pdev)
> >               or->hsdisc_trim.override =3D true;
> >       }
> >
> > -     pm_runtime_set_active(dev);
> > -     pm_runtime_enable(dev);
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
> > +     pm_runtime_enable(dev);
>
> I'd like to point out that the pm_runtime_enable() here isn't followed
> up by the pm_runtime_disable() in the remove path (there is none). Would
> you mind sending a followup, changing it to use
> devm_pm_runtime_enable()?

Yes ok, I will.

Loic

