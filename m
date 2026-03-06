Return-Path: <linux-arm-msm+bounces-95737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFYgDcuYqmkxUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:05:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A328821D97C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71B86304EA68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D44C307AF4;
	Fri,  6 Mar 2026 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQXAEIyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URben4Zv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A6F3264ED
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787617; cv=pass; b=quLjPgWGlEmZmjx/DSn0bcDGcGSBy5+m9q+rxu3F2LvxWK0YA9LXRP3QvGICDK9rDchM7gdptKsk8hiEFpSM4ZKAVAP/m9rm0lNPoyy4q0khVMzmuLATJ62YVY1+HchPYnmAJiFMjXlbrfwarcn3ikK9CuDAGA9ZCqDc7aAU8Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787617; c=relaxed/simple;
	bh=0L16VWQr8QG1LSKiQzk1dxuu8pTEnzyJmWWHaNU5jqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lVORI++cBt2r7F73bRAPJHxTbcL2x4cRJwDnCD7HdvNqNwYKq2ktxAf1yLtTWugQP9LcYftPvxmbtFVsssywZZFdvTkeTS3rlaxpoHcAdA+DoNe0NYOBdceQWK9D1cCkL5G63w3GC/fGlfSW9YbqpM3NgLQw6wjIvtucyMa6lQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQXAEIyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URben4Zv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aUiu1087356
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0Q2OpTNsJNsKwES2aOblrfidPOydSd+/tsgWOvLO+k=; b=AQXAEIyPy0omLWNY
	xC5AkIZtvCyVzSjqALxnkJ5jaZOZbV5AmW9deGfMB7OCurlXwS6rhPDVV3np6dCT
	MMdSn3RHsUAs1YjrjEt/LjZYVwOvFH6y2n5m69T3BGCOiuNWwF497Yls9ayhkG4h
	LtuelBRmMz1QSQEp8CEq2nTuH6mOqTdcb5Ogo+JpJXVmVNe4Bnl8Ds2x976CwNof
	EJyRrTgo7DpmBffbcR9bt/64YS/xpNmoMo2NcTn/UP8X53T4UQR/eX1vtWbQEkcN
	LSOfF8PucvZTRYEwRqU+JYUBAmPArlJSlrd5vxmVg1MVEzCQBqqr8oq3DvKJwJPV
	hzPrlA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6ae02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:00:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be1bc0905bso4095370eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:00:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772787615; cv=none;
        d=google.com; s=arc-20240605;
        b=AnYi/lxWYp+oo7zstk04C3sEg1m+PKCeN5KQJThK6vHXX13B84izh/5dFCQCeZLWpD
         K/zBfvuJp/mBuMD/Y8gCN6nsXDwaWJKsIWimygni4Jq0tF4MnRCM1k0e3olBxad7bY3D
         iDrVm3A0lB8v7t62e+u8TCpyHYHVFwjgQ7+kypP8e/SeNt7GjaaNIX+cQmQsGqYEUU8i
         2U9yv3VEe8GgqvUnERKUxsdpL1j0iwcUiyirM1hTmAGMO/VDO6TRoxR/e27uExfV5UGV
         2Q6WY44NDBR4wWsNU1QYAO8BYpK0dg4KSz5xB8F2VD2U3ewKa46vVr8ObaIppApZ2TRY
         IV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0Q2OpTNsJNsKwES2aOblrfidPOydSd+/tsgWOvLO+k=;
        fh=HZXTgg7RhrqxamgdDhmClj99jQAAgi2je8xEFHXpzqU=;
        b=ckojO5mq4q34boCvTdcwuCf1ThfulGcmLHOR8iEiwwkY1FrrXzIV3dGBe4enualIY4
         8LlDCnN1zt1q+dsmehv3ESUO+WpzH7ewCqM6UyHYo6Pz2Nrqe0a6uzkIjbsutG+u7vaW
         Qq9Qo0pz9g9IL1EX7jL5Na3CUJ58SBG4OxlKCLhb1Js5UQl7tqOvTlkPFBYjtM7rjWIy
         T/7FUzyworywXGTdU2AuAzrkkP6oI1OvSI0h55Jcdt5qN99tSnwRGcfSyomMvZxIpZZk
         izQrLh1tUusCB8oOJiVngpakBGxOzXANjdS/N9ikTXfG+cKOreGyZHW/Zkh+MH/9sfCL
         r3UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772787615; x=1773392415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0Q2OpTNsJNsKwES2aOblrfidPOydSd+/tsgWOvLO+k=;
        b=URben4ZvgK/XK6SdXj/KFdReI25zCzLMo4LJf7lfGAhBEI/UpMgMcjs+Dh/E536SOm
         m5T+9EPoif2VEMLvnS85Wtg2mq40j3MhmYLC/6PNhqoKV7/j6RwwaNfmrYdrG2FxQEgL
         JTB4C8inHjayDZ5W1eU2d5O4cuah7udvupB1eQXKSr1x8/nDSlUsBmp8Du3Y2plwLisG
         8/+QjAbxRsU/Fm1pniopmKwhGi/Pxq1onmh05yAjUN+ZiHXFZXRCu0oqHRrNl5X+be/S
         mlSwoPz5aUNq79vTcQUHWAyjSOl/FHoKMY8XlpuWVSPf+XteWoOjKMzB87JisiDG52M6
         GdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772787615; x=1773392415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0Q2OpTNsJNsKwES2aOblrfidPOydSd+/tsgWOvLO+k=;
        b=GrQSwk54CU+cNcixU94Q2uY3vMaC4C5UUD7pO60DJfdIdJuPAAEBq4gS0egHgEvwmx
         HK7eCYGGXYkWq3xsPkxLnRjQQKkKcFcacn/Oph+/YRul+mXyzjy29GSzd4oRQmfF2CWD
         N7nDQHVg9i0fS8IorIIdKxBnVoPE2CcSAYEz8fnUptnWG4y7MUNg75JG4iic8YgoI5dS
         WkMx4p3egYueLZUVEtEZqEM9W8n3jhOuruWsbjCvTJ962IZPVIgO+5775PgiscB+zY3c
         Am5F6Jf28nwi5h37Jx44Ag+kJyVCoyY9K98/UEENNCXjlBcN71NI5lddkmLiyM6PuaHv
         94/A==
X-Forwarded-Encrypted: i=1; AJvYcCXk1XX+2lMHS9bdhE5BLS/qkDaZIfLa0jSSotWlU1uqhArZTsyBgoq4+O6e70j84cEbFFcOl+4k1pMs048V@vger.kernel.org
X-Gm-Message-State: AOJu0YxE155L3zZ0fDlfrgjCdU6yOGEmNtJEMNRScMBWEe1aVf/mzo8U
	IZBRDUvtELlVnXbsF9sKjVCGu8zMim8mpRYuuEGJyK++DjPTmCe2tVjxQgM7YRTXZXrvOKN7eXz
	c1Igw7Pe56wq6M+lPYYEoNP4dBaBwfGitDFyorY2ekhoWAZR6RuzlZWTMNsfBkG1lCZdDD9CNw7
	PyEhDDD4a21bLYIC4360leO9zvjEZ3Zn/wrh92W4GncnY=
X-Gm-Gg: ATEYQzyHO7FW/lh4JPdoqO7bsoLz8ZbXEOSLBLouRvhKvuWn67Qooy6Lbzz5a0ECyiy
	UZZXVpMzRYH8h/nfNjiesEWrvaTCAw7WT4TPll+Rg4uM5Z68yFG4N76DZO6fp5KvZtSKUpYUDrh
	U68hLAWPhmicNWaqBESy+RGyalO+or+/C9h1XqOLldATkZHBMqRujxpFZS0CszKWJmOXd8i5rkv
	DIpn+rE
X-Received: by 2002:a05:7301:1296:b0:2ba:7b63:3f4f with SMTP id 5a478bee46e88-2be4dfc5efemr474936eec.15.1772787614547;
        Fri, 06 Mar 2026 01:00:14 -0800 (PST)
X-Received: by 2002:a05:7301:1296:b0:2ba:7b63:3f4f with SMTP id
 5a478bee46e88-2be4dfc5efemr474918eec.15.1772787613896; Fri, 06 Mar 2026
 01:00:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-qcom-ice-fix-v4-0-0e65740a5dcc@oss.qualcomm.com>
 <20260302-qcom-ice-fix-v4-3-0e65740a5dcc@oss.qualcomm.com> <CAGptzHN=uiYoDC-LwmWcGc=bO6gYWmnr6DNiS+o0M_BS80QftQ@mail.gmail.com>
In-Reply-To: <CAGptzHN=uiYoDC-LwmWcGc=bO6gYWmnr6DNiS+o0M_BS80QftQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:30:02 +0530
X-Gm-Features: AaiRm506ir4AC8l0C0Le9ozBvSlNRLBgtgndnExCGvFEbKvlm59knOgNeJByd-c
Message-ID: <CAGptzHO+cXBib_cpD+GvM8riKVSKMF_1Y3DUJO6KL7HcM__mJg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: ice: Return proper error codes from
 devm_of_qcom_ice_get() instead of NULL
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Q2-n5Ni8FhXUGK52KFJ2XuK1VkBzsAr8
X-Proofpoint-ORIG-GUID: Q2-n5Ni8FhXUGK52KFJ2XuK1VkBzsAr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NSBTYWx0ZWRfXwmmwQaSjVH+J
 67/T4mThPl9JIKqXh/xQmbbeNu1ftc6JZSfJxSFjKjV8Z9WN/w+TpvOXEkmU/Tk6him3RlwftBU
 Asjp/PXH3J8lrxDq62JJ1ebdMlYzVz6NIN6tUFQTU3sZaqeDeZIMqi+kcbVwFvmTOmDHnpzgCCz
 m+hj6Z6Z9i+jslc/yxkP4vSqtxzlSRkeN7rXicc2PZm7cp+K3ozD3sRAweJuDIYrNl6UN+/epKM
 Jb1VI0CsUZtXHihmUZ+dD90SUgwaFS9KaagRXVNGPoIkzXtzsRX0MVrqf74R92BR2JJhZibdMex
 HJ20ln75LOpafbYfSxD/LEM3UmhqlLLTTDFaOJAN2fc2sj6Lqr4VikTPdS03sYqyYpIHcZS63tr
 yBrMuOOq/npzys9zd7iKbhwJQGn3i6rcJ3vqrqvoRFe1LmaS6DcihOUpGWbgLuOeDVXA0o9Gakp
 LHC1LsuN07wV+5XijZw==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aa979f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=FoKZgoKw912WVnOwPkcA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060085
X-Rspamd-Queue-Id: A328821D97C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95737-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 2:17=E2=80=AFPM Sumit Garg <sumit.garg@oss.qualcomm.=
com> wrote:
>
> Hey Mani,
>
> On Mon, Mar 2, 2026 at 6:30=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
> <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
> >
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >
> > devm_of_qcom_ice_get() currently returns NULL if ICE SCM is not availab=
le
> > or "qcom,ice" property is not found in DT. But this confuses the client=
s
> > since NULL doesn't convey the reason for failure. So return proper erro=
r
> > codes instead of NULL.
> >
> > Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcom=
m.com>
> > ---
> >  drivers/soc/qcom/ice.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index 833d23dc7b06..d1efc676b63c 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -561,7 +561,7 @@ static struct qcom_ice *qcom_ice_create(struct devi=
ce *dev,
> >
> >         if (!qcom_scm_ice_available()) {
> >                 dev_warn(dev, "ICE SCM interface not found\n");
> > -               return NULL;
> > +               return ERR_PTR(-EOPNOTSUPP);
> >         }
>
> With this patch-set on top of v7.0-rc2, I still see UFS probe failing
> when ICE isn't supported with OP-TEE as follows:
>
> [    5.401558] qcom-ice 1d88000.crypto: ICE SCM interface not found
> [    5.419482] qcom-ice 1d88000.crypto: probe with driver qcom-ice
> failed with error -95
> <snip>
> [   18.662977] ufshcd-qcom 1d84000.ufshc: freq-table-hz property not spec=
ified
> [   18.670193] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable
> to find vdd-hba-supply regulator, assuming enabled
> [   18.737665] platform 1d84000.ufshc: deferred probe pending:
> ufshcd-qcom: ufshcd_pltfrm_init() failed
> [   18.747141] platform 3370000.codec: deferred probe pending:
> platform: wait for supplier /soc@0/pinctrl@33c0000/dmic23-data-state
>
> Maybe it's the "qcom-ice" driver failure leading to this deferred
> probe problem again.
>

Following diff on top of your patchset allows the UFS driver to probe
successfully without ICE support. I suppose just setting the drvdata
should be sufficient.

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index d1efc676b63c..a86980647097 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -734,12 +734,6 @@ static int qcom_ice_probe(struct platform_device *pdev=
)
        }

        engine =3D qcom_ice_create(&pdev->dev, base);
-       if (IS_ERR(engine)) {
-               /* Store the error pointer for devm_of_qcom_ice_get() */
-               platform_set_drvdata(pdev, engine);
-               return PTR_ERR(engine);
-       }
-
        platform_set_drvdata(pdev, engine);

-Sumit

>
> >
> >         engine =3D devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> > @@ -643,7 +643,7 @@ static struct qcom_ice *of_qcom_ice_get(struct devi=
ce *dev)
> >         struct device_node *node __free(device_node) =3D of_parse_phand=
le(dev->of_node,
> >                                                                        =
 "qcom,ice", 0);
> >         if (!node)
> > -               return NULL;
> > +               return ERR_PTR(-ENODEV);
> >
> >         pdev =3D of_find_device_by_node(node);
> >         if (!pdev) {
> > @@ -696,8 +696,7 @@ static void devm_of_qcom_ice_put(struct device *dev=
, void *res)
> >   * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will=
 already
> >   * be created and so this function will return that instead.
> >   *
> > - * Return: ICE pointer on success, NULL if there is no ICE data provid=
ed by the
> > - * consumer or ERR_PTR() on error.
> > + * Return: ICE pointer on success, ERR_PTR() on error.
> >   */
> >  struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
> >  {
> > @@ -708,7 +707,7 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device=
 *dev)
> >                 return ERR_PTR(-ENOMEM);
> >
> >         ice =3D of_qcom_ice_get(dev);
> > -       if (!IS_ERR_OR_NULL(ice)) {
> > +       if (!IS_ERR(ice)) {
> >                 *dr =3D ice;
> >                 devres_add(dev, dr);
> >         } else {
> >
> > --
> > 2.51.0
> >
> >

