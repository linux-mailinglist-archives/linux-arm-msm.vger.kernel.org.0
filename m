Return-Path: <linux-arm-msm+bounces-78038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78961BF22B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 17:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B9A94F8FA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEDA26F29F;
	Mon, 20 Oct 2025 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEVH7PFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8C326E16A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974871; cv=none; b=nz2QdUyXyPSCks5eZNGL5I5Nvf5BsTNv/YEtshsa5xReYxnL+gzlfN0AYQ4M1X8YgqOaEYPJxlz7/xDxptysL+IOrOP1JVcbotcfECahO7TLkckPJDfMF1YrPllaPUOA8blCUEztbxoELogEob/F1ULm6L5eyXG3dHR21ZWWsFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974871; c=relaxed/simple;
	bh=c1Ei5/rllke/BB5tHPc39QhmAfz5PU2A/xahS0I3Sc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCvO8EJMV0KM0fcZNYh0WvjuAjnAlZBnPRYeFBauUyFo60GU78/p2dTRvMGqpKFqxbQTmO9LhflO9h9MtxbCRQOFULqj2HjFF42hkBGs6ZcuoE0GSst4S9izqihQuqZejrnO0eyYzeTlqcvOeGzZK8W8WwewKVLtEZCNCEWWNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEVH7PFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBOYNP024329
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1Ei5/rllke/BB5tHPc39QhmAfz5PU2A/xahS0I3Sc8=; b=cEVH7PFrAyrBfNBB
	89sL8mNkaahBWa/8CuFH9njRxNFJPEfKgied64Yhc/H0cNA8qGq0nJyobQ0etrCO
	d1FFGTWJuRJ6nw5dH9anBQoBGOdvA+h6Oc+kRIUZNf9kSHvJJpZqd6zPaGcoIiUJ
	Rc5JE+mrciHEWUqs3FFY+l2X/jC/LcqHPHXKIoxoMAokFUEvtXgpGWZ2CdxPpN1I
	UUw0OOVVEjL/t8qoK+eONZNCuK9StXAkQR+jjBtxFUMN1Dnp9ipNjFcFuUhCokA8
	325SBJmaK9Zskn9DWmkOWoVCn2zdsmrtgAuZq+VSOsyjjsmVbzy0yyWfFM8Iog00
	F1FLcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k54ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:41:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f7eff9d5fso408640185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 08:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760974868; x=1761579668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1Ei5/rllke/BB5tHPc39QhmAfz5PU2A/xahS0I3Sc8=;
        b=sDENTt2PvSVpMaoxFWXBk/ZaZtUb9Fp1UASmmwmX/jvojgriiNlxc4n2KBfBMuyBXz
         Rf0U6qOCIRNsJVMciw4UCIcwcKpmiRAwtH2OaQJIAy3MeH1hDJmDMZUu1D3vfo4vBS0s
         9zGCiqPROd6WNfxKpp98Z+e3P/dzQUAPWMya836cV8qdW3RNfYLS/7NuiC3qZLOKAqBc
         cDM7nkY34/iDUZVS/dVBj4u11Y66JCdZxD2IrGr41nIiDVqnoHzsahQqlnUgspISLt97
         FXPMdmY1U+w/4RZQs9qvofaGj4FOYpNOZcZlk1rnd2fTEY6ETlOt03eraGJpn27PzKTo
         qG0A==
X-Gm-Message-State: AOJu0YyaA1O6KEJF86cY/a0Mjvo3LDOBWfgoWrfF/FARJr7EFme3zcOj
	gHdmW2icRX/ils37+6bMzpEbVXgh8c+ufveKfElV2qdODNr9by90lkf9GIQHLeRTlGjKDTyJhez
	sOt27PFtwK6DrL9K30C84QLxfvbikXf1UHqtcID3madoq7dCcWbg1/n55JNCzA6urYS1t5EZeRM
	lQ94fgfb2WtgMVCkW3pji2BNIuU6ylVBy7fFW6Xpb6DKw=
X-Gm-Gg: ASbGncu+op7a+evabSPAFZkMT2NvNpa7458APrt7/+37vrghQRvNJ1eEf01ohQ6wUHR
	zeDlFbomtgtARXKQrfd4MU1oOtDRLuhhg3nzzXOzajDQmpCB6cQNi1kB8awQF51revxtAj2d/Pr
	DF+RXLAidIMeey2yyHAU+tZ6x5irwjwDrm90f+Xd8mSjzMtP7+Mxc18Qme3UHrNGZKvxMLzmFmh
	vSHnpS+IoPl4+Y7
X-Received: by 2002:ac8:6e9a:0:b0:4e8:a1eb:3e2d with SMTP id d75a77b69052e-4e8a1eb3f57mr114071041cf.2.1760974868147;
        Mon, 20 Oct 2025 08:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt/rE4Clz5yURYWYruI+sLzFZs59bWu+Qzijja7BPDkLwUvNedycPfUOGPFH1/AjHcLivcbqNVMlSmVyzFg1I=
X-Received: by 2002:ac8:6e9a:0:b0:4e8:a1eb:3e2d with SMTP id
 d75a77b69052e-4e8a1eb3f57mr114070801cf.2.1760974867660; Mon, 20 Oct 2025
 08:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918155456.1158691-1-loic.poulain@oss.qualcomm.com>
In-Reply-To: <20250918155456.1158691-1-loic.poulain@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 17:40:56 +0200
X-Gm-Features: AS18NWAuS_7crH2JtntrswxMt0T5lY33ENW9jyWOHcdOBf9IRDbBirSjpRREuCE
Message-ID: <CAFEp6-0prjjqWoCQuvMJ_kvbLMsihMT=-bXaL_0qGGsAUDCWXQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Fix camss register prop ordering
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: q2s3g-GEJ8ATu4pqvPoyXet5mmaWs5OL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX4xUbcxnGZsZh
 oidsteLBt7hiRXlFnuQhZEiSFnhNApS7r7mqr+Hgkm6JJmj+2+k0y+Q4fHvD3p7SSipj0Aa5NYe
 xb5xbgoggRKR6Nb5CKrRFvi8kmm/PBfGFeQLJ+4av3nEW+8e9fil8aqJuCqp2omLK7addb34n1U
 UUmflOtFzo5tjCaUbx1v8oVAlaI8pW0JTCExv6rigorUD+idUwoY0UgXSTy4qwRRk/xDhgqEzxa
 slHPVbFKO+WL5+O+tttip8mFiquj2b5kX2qeubkxqLKSQ8EJwmfLnUYuqxF21MFzbAMvDnRuaiL
 Sidfc8VdARh5EW03BXfg4MGRIqP71ywDGAykFo11jOw0TcKluos9wyLa6WZC0NfZVKPal2lV2UW
 Tt+3VR0ag04BD647YfAAyRnnUW4Z/A==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f65815 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MXscjSYeNV_WA-v-aEEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: q2s3g-GEJ8ATu4pqvPoyXet5mmaWs5OL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

Hi Bjorn, Konrad,

On Thu, Sep 18, 2025 at 5:54=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> The qcm2290 CAMSS node has been applied from the V4 series, but a later
> version changed the order of the register property, fix it to prevent
> dtb check error.
>
> Fixes: 2b3aef30dd9d ("arm64: dts: qcom: qcm2290: Add CAMSS node")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Can you consider this fix for 6.18, as it will fix a dts check error.

Regards,
Loic

