Return-Path: <linux-arm-msm+bounces-91183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O1YLuJme2l2EQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:55:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1EBB0A21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 14:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9AD9330022F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E93B341660;
	Thu, 29 Jan 2026 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYsHGx4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZ8ggeaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CCD340295
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694942; cv=pass; b=nseEzJ0UaVujV/X4SElRAm3hOKwmxuHLJ8cmupJKQ6eSsQt4XUPKsvYaO9GiAOKSTS3A2hNmxq9e24VAlskWk5cxmVzg0jSXYXbFAtmUfioN0ok69ugtnLvYv+abeMFpzzW75ULhvU2tm0gRrjXDgtJ0ZMRRiHDZOelLnoLeyO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694942; c=relaxed/simple;
	bh=x2kcQCjLWvSwWoGbTSYAJLl1+G4WgE16Ma+wcFoZtYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPVO2ILT6qDcr2zYmjASTsldkuwcJJIWkghh8rk7LRfaYOj96dW/JJGEHx3666cjMtRcebwl+ekDZZz9HHOQ9Ljxq4nvuM09gFIwU2uVWp71J1ZPqu2/fm3iBdlcDgy1ltkIQOj4yHxXOttMMruehAh8Qikcp+AYE1K7JsfoTa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYsHGx4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZ8ggeaB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAP0T63900266
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UdkNENK4MfeAhXOjhlnGRinrez69eCWQy+/BgYxeifM=; b=GYsHGx4kx+/nF6jA
	VdNBL4kyaeNiH6PSJsEvVUZRJUXCy43UudeZ7yaZRLaV0suT8IC5lG9BSUf5ykVa
	RC8Zhe30RTdogxeZpXijMvevG0tLLG/vMdRh1vMgZ7XZ+E7vbiAi3LBdJ71ir9Vy
	ZKiHBNHqNnT0aSLafme9+/n3joWzsjbKBTDIUrIWV5fIKly20blCnNA0i5iqfb2z
	+fg251jwE2Iah+W/j85Ce2IwWTFkTMzlPZtDC5dR4LNN23J4IeumBPUxv8KInTYi
	9vUivSzqJcNKkl+QrnG9AgpluvnNncCWBC7a7P2L1I+4602d1r/GO+CXPRy0OsT3
	JiGerA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05se8jg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 13:55:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-503915b0a88so41183091cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769694940; cv=none;
        d=google.com; s=arc-20240605;
        b=QIuh8VjeOJpA3GatMYGHq4rKn+vRg+xkG5CT3KRyPJ6mw2M7hqociNKW5Bcus+yJDB
         AUX38T/X6QJGirfoKZQQYhDDd/AYzraeaeYf7M4O8xu5L82J/C2qnos4G+PK8Sm/sZDz
         0MCZf2024iJG4Z2ylyB7LksE1ZtHSEb0gdm0gGsW1SJ7j/oLh2YexuumE73IOKzmD7Z6
         ByrmzdV8scFnrgN0nISNpEgMyPiMKsfl408M+c4xx8tbmWI45CfUaxygzGmFko3ah+nY
         gL0rtQM2ldpMp3VJWGC4Xf9eeWedyrbET8vHwUWEkCG1wArC6kSLRJzS046dnWcMV+DI
         Sx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UdkNENK4MfeAhXOjhlnGRinrez69eCWQy+/BgYxeifM=;
        fh=YRFd3KmZpRoyZl+IKTanwc4C2ySgdbu2CZUU8wy08EM=;
        b=VOc5mnhjWxKMOoGCrO7JIiyodkqxX/JWzHnhOgHSOHwL3+HDEnCxKWTU0j+tX8fzKu
         /C8icQ9UD4XU0qKwtYes3mKmdT7kl9nCW3mBMA+o6soKl0xNKX5y/tHbMiv9r/AEfbzC
         5rC7lUGBnaLTcSUF4bxsgkf5XSMWpuyyGnNjg9GWMTSUOBlZTKrkgVXlbyvrGNXeybml
         BSiDcYiPAeYYan6356DVktSpHGcxMvx2ssJg9uD+9HO8VEsgYhaxfPArHcm02zKsWeUF
         /yP7YgjmJjIAkeLfNZpuH2+OM1Q4H1nfIgaRIEjI7zmP7F3D6nFCWy9jx6EHuEbOW/+O
         pOjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769694940; x=1770299740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdkNENK4MfeAhXOjhlnGRinrez69eCWQy+/BgYxeifM=;
        b=hZ8ggeaBupXSFTTWTkNBARJOXXpn+3Js9bSY6wnlkkgN6hqT0LSnSTpD2LoQl9fwvw
         TAKIrVYxJ3cU4Xr1+1VLxTTS31pAU6tBU2BnWBlX7qKj+PEh4/m8QFmn3sMJ+RgcsOzM
         LxSu6FsTI6RyCM+xArFRoQLaVPnTTVNDf9fD1tE16Go/mJ2AiKbGvhTn0XMKnVtyD6PL
         r1HsF5Nmq8sEY16kRs+emvF6JQqCPzxW5WAooH4oNKUb+dwCqq1iPlabF8ldHICHXuNi
         E3cDHoUDgQm9bG0nW6A/cLZp9PNLfh0igulH3ssj/PUNYYFU0Pqzj8xY3QCD4IVnvpIs
         LfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769694940; x=1770299740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UdkNENK4MfeAhXOjhlnGRinrez69eCWQy+/BgYxeifM=;
        b=FDipim097Nw/waj8TiN3d/jg1ASpQvxN+uRoY30aKDjez50dlh31AHmEPtZjIA1nBw
         ol8rlPm6F24YoPtjB1lpkThWUoRHmrXtsuri/ero6LO8cjXylXwyrbmbwXN6xNZc+b2B
         zxdqeggJ4NWIwSaMJbX75vCohOgfuJFQDEz+ozYuWO4r1fntkWk81jnqv1jNr+zsYfPV
         iUR/tIHrdZNf4Prw+0nfE3f6Swvxn8cLQDL8A9mmKoYhbpCQthPu7GrtMCYEgaBVXPLG
         jMhw+tdpLnxWPwdv/o78TzFCte7q9CDRsAQ/zKHtroAkbJgkJzkfs8t0WnIYQ2wEA3mu
         LrLA==
X-Forwarded-Encrypted: i=1; AJvYcCUqJxt2c/BTDiRFtncNxDBdLvmzxsMNiJtOTztqHAskm8SV7+4EzmaCDHiIHUBCoRbb2QPUZ7LcU/iKXdm2@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQE6FyzBmx5YTcItcoysk4LM83bHcmCjxdTyjGXDAlOgqi1KT
	0GfK5VGaqzaMzz1fwEanaKgGrrSoN49dByuI8/aX/IZyv8prdjgzpw8BU2WbhHS+FJOQzawdYvd
	+dP/m8w4bz7ZIulguAj9qeO0DDg6dVH7Yq/Qx7E8Wgbg5ec5tJ1uF3vFoIcJYa6RDc+tmIiwWGD
	hTcU4EF4OgENV947hte2jINHEwOLFwCEwtN/mIFMptXTCLqWxUnyBaJigcP58=
X-Gm-Gg: AZuq6aLp9Qvsg8+7Qp/x647Mlk+QKgXavkGlQxjL40ZgV3/neI+lPT4UDQD1rlGTaLs
	58v8Ce2ioGytlExco5YPZXMxtGxKK+Wx1o1TeTCBCqQYmKaKRWdfQWSuiUJQ6g8rBLz8C3WZRbb
	DH25sOWAzz+CW99KVZgtbVnGnmjFOQRJu6QOgVkUmhuJXy8+p0xZHIwWGSMBpOzPaTlt6UkGsXM
	The4Uz71sYAk+0/0aicrTxxsnsv
X-Received: by 2002:ac8:5787:0:b0:4f3:5889:2a79 with SMTP id d75a77b69052e-5032fc2b982mr104387211cf.81.1769694939882;
        Thu, 29 Jan 2026 05:55:39 -0800 (PST)
X-Received: by 2002:ac8:5ad3:0:b0:501:1796:b10e with SMTP id
 d75a77b69052e-5032f76d867mr118480341cf.12.1769694535419; Thu, 29 Jan 2026
 05:48:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
 <20260116214354.256878-3-loic.poulain@oss.qualcomm.com> <0ca0920a-aebb-4072-a098-48c4c9938c26@oss.qualcomm.com>
In-Reply-To: <0ca0920a-aebb-4072-a098-48c4c9938c26@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 14:48:43 +0100
X-Gm-Features: AZwV_QjKKzAWXurh-8bT8DC1CHu5nxjU1-Fo42l7MZ4s-C1C7gmIX6rlnFipR1E
Message-ID: <CAFEp6-3T1=+fZ1x3ADPpu_9P5d+bx3w0XdPzip6OBiWuk32KzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable SDHC1 for eMMC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 0ATgFctuDHKPZ-HYNOU7WKAV2GTqy38s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA5NCBTYWx0ZWRfX17ZPLaCrZ7gT
 zfAlxRsLDpdsIQhURiUsGfS5JUp6sVAtUrD/LuKuLeFhboIS1xElRKK+2zmkwc0Rt5ZbbOj8mAI
 le2Or8oRPnHj61noU1OiLJt0CktgQIaJFq/Nr8wSSK/BKqGMk9xNvbZL3UHh0lynfz2pT4R0i+6
 gxOMjhszhjJG1Y8JD7Fm+X+TQw9KhDZjfF/uJBIhA3hytoq9XRu0pjYH6I6TDNTozyq8oHbymgJ
 9O6x+Mp+LkoyCeH48Oyt06EfEzF5oAJyAuXXAgwy+GtaCJkruu+sBYqIeapjjpa5Pv9VQXX32Iy
 P9qf6EZEs7hMGYn3j4SQL4KEs17IkLUG6nPNYgb58hzumjQXooZOLJDZOByPSKHV0S/aZYDhVUa
 nQ+rGejA+2fY/xbT7JGZQoOxrZ9pzeJpb19eLe/KCrsuV8T43hsnSTtnmEmwPtH/lMdaFUj3ruF
 ccWb/t/3HU0p6qc2MIA==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697b66dd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=nKmlwK7UcfY3cOHo8XsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0ATgFctuDHKPZ-HYNOU7WKAV2GTqy38s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91183-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5F1EBB0A21
X-Rspamd-Action: no action

Hi Konrad,

On Tue, Jan 27, 2026 at 1:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/16/26 10:43 PM, Loic Poulain wrote:
> > Monaco EVK has onboard eMMC, that can be used either as primary
> > boot storage or as secondary storage when booting from UFS.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/=
dts/qcom/monaco-evk.dts
> > index bb35893da73d..c272d7db80e2 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > @@ -76,6 +76,15 @@ platform {
> >                       };
> >               };
> >       };
> > +
> > +     /* This comes from a PMIC handled within the SAIL domain */
> > +     vreg_s2s: vreg-s2s {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vreg_s2s";
> > +
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
>
> Is that the case for both SAIL- and SAIL-free SKUs?

To my knowledge, there is no Monaco=E2=80=91based SKU that can start withou=
t
SAIL. Monaco depends on SAIL for proper initialization, even if it is
not subsequently used.

Regards,
Loic

