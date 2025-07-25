Return-Path: <linux-arm-msm+bounces-66711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2BB11F06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 14:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5781A7BEBE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD901D54D8;
	Fri, 25 Jul 2025 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABPYm67S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC482ECEA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753447783; cv=none; b=Bw2Yn5oOxey+4dkL00cipE23uyupU0GsEBDVmt3O4t09qszGZTxBZeDrqbNlq1PX20m8+eL3NOqTQja8hnPmQH3LicmGsLmhBgRZLdEN4Eb7rU7IENdWDrsD8fSYikU9LQ4qo3yNbRBGufLtofnRMTMd3a62UAE4oz7q9XUt/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753447783; c=relaxed/simple;
	bh=xYpnLtBmmYFoV2Wf0O8DUo26fff34+DluhVeQud508o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnh+k4R8beJBCXiO9XSiSUKxBfi51Y45UzsqeV0gvrtTSwKv91paNDeoP7nR1FfZjqVXkV7OvyI9Epa1Mymmn6kIAZZx4XAQt4L445D9GB0TS1rh0y9YWpAJPzciVR1v1jispBdfEA8gUR0JX2sid3WrZC1hoXyX5Vi3LaqnOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABPYm67S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P92n5B023659
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 12:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktB9Clt7XUZb4vphTZxcSmXCe8grqlTXO7tGnfUfWKA=; b=ABPYm67SexCdXRE7
	rcMnk/on0toglwEoaYQKB198Ypn89/FV8NC945mpZLg47U/m3vFEIhmwQm16SrcN
	lPf4nBQ0qGIWkPZiLoO8WTB6+V90LSfOgD1I0ftRePM3lW/KFJdrfgqlPy+FmG4y
	yZaFV8afFWKkOXqsXdn9SZ4UUVXLR1+REpRL8gPD+oBvE4g9OvUdr/D9vHuA/rhK
	tv37xQQGdloIw70oko1Co3P51ZjLS6S4cOMTcmipMdxmITsNoDArGztfbj8F8UyK
	TO1NkwNg8m6Mtadzc5i3TKPydl6xk1VtS49qxFPtbp9RGjuNWa+NF4yj3UoWHu+l
	vsERoA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2ra48n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 12:49:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e623a209e0so319103785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 05:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753447779; x=1754052579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktB9Clt7XUZb4vphTZxcSmXCe8grqlTXO7tGnfUfWKA=;
        b=hx/jzWs0/IXQtPjNbzoLpGBw1TMbA0scTn14kOudJC/bgGlKyVY1I9sFPCJa8NdDkp
         YP6l/4SLa9R+fO+jP3RXVIcg88Lo+Fj5nogf5HM6S156ImPSf43jXho6J4Pl7wM9vHOu
         /vD37BdvqUprCliSgA73NKwB7Ctkn19rGOk2KK5X+UJq+I4ML43khQsSJ7oqKoUZiVMH
         NPSXbDyDH9hfKjAUw/+wh4sJJI2ch9B+5eAuSgHV0AUmYQ1XDJzUAJfP6gcSymY7vIku
         BjgcSOVZHF7o+XIS6T743WJZnf+HonVc0rxYm0z6vcCWTArJEbfnH4wiikx9p9bNIluH
         X05g==
X-Forwarded-Encrypted: i=1; AJvYcCUYaQrkXc9ie0GSEwKoLnwkG8PEcpv/fy5hlQgjJ8Uc77aN0r6fkmPMJuuFy9lSeFevlSKiMYat9yBjNPhb@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdUi/tjsrnoVf/vOE3Qq11aHcnWnQvjipSyA2gzmLuIa/O3IM
	4/OVB4dLtqbC8N/JVniG7IfBr2pzR74v2UNRMAwBUQ5x5zLYziN2ncs+5rW/AcEnTlYwOkZ8SlR
	adTl3cDQli90pqxJKB5Kx3CAeOpdJB9MUZVOIfCesExNZma7VZeLAChY+H3bCXX8HoZCyBuB9Co
	GyGiR+PIR/TY9inDme53hUdWc9rJBGAZskHmeB5qS5Ht0=
X-Gm-Gg: ASbGncv3JJ8AVaDZ7Jmwqg4fbu+8tmuWyaSFDqpR2Uh5TKzFfQeK8KYfZqROSb83Mrr
	Ww3L1tE5qi7S1+gqkmmpvflQZYogKdWfR30ub8OXQKFjlurTXAig9g4i6EGxvcb9X9AvRV6CAfJ
	fzwyHvIlk6pNwrRf7UBvB/Gg==
X-Received: by 2002:a05:620a:390f:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7e63bf95349mr242130685a.25.1753447778780;
        Fri, 25 Jul 2025 05:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3B3Slxw3dmstEGvQ2lqJWGYuHcRhehYoPFna2fVt6rcGfPvfJfwPkWozxxa+WwxMVWoB4203Tnjs2zKJO99o=
X-Received: by 2002:a05:620a:390f:b0:7d0:9782:9b05 with SMTP id
 af79cd13be357-7e63bf95349mr242084785a.25.1753447772817; Fri, 25 Jul 2025
 05:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
 <2025072446-ensnare-hardhead-12f5@gregkh>
In-Reply-To: <2025072446-ensnare-hardhead-12f5@gregkh>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 18:19:21 +0530
X-Gm-Features: Ac12FXxPQD_LsGbXmGNASbWosoLHJRg9wgIWhieGk75R8qev9bW7u1QVAGGMa3c
Message-ID: <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=68837d64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ag1SF4gXAAAA:8
 a=PQXWc0QCHC5KbQU7H1QA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: 6vimMy_xW_i_y9Uj5wXMemCZpmFjlRSL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEwOCBTYWx0ZWRfXxqEWDySH89t9
 vC8M5VsYXxnknNkxmFYbFmqy6KDSyX53z1ViC3nJ4ppLvD4JaB9GlZD6ZSNnpfnpBjoJy4tHL7X
 kRW70ouuA0PGhGdlw+uR1WDCiV5lGFTE/8Bqu0eewR3yCVZg0+7Lmax9hsBaHQkZhaXNOGys+3N
 zcRiJ0YHMslPcFIMBsN3Kof0xsavT2Qmz5zt3TQLPhRtFggf/xs9eQrN6T4SF8Nu5JFH0uLozra
 x4NmErF6rTvqSRYdpKIp368dr68cHQ00Zcen0bbJi9eVZEs7ILjvmvFiDdyBblBHoAnHLtVaM1+
 /kfe+hc3nuphJnEb+Pi5EKhnKgbKdjrUsPgITHid6W3oLhT5mosv4R/aCFzfZDQBddID8OXnBVy
 9RkJvXxZrZgTIG03fdGaUjU+g/pBjtFSxIo7v31Pl6mNvb9e3oh+Ltxiu6coyxIBl9nQO7RD
X-Proofpoint-GUID: 6vimMy_xW_i_y9Uj5wXMemCZpmFjlRSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250108

On Thu, Jul 24, 2025 at 3:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > as read-only for operating system running at EL1, enforcing access
> > restrictions that prohibit direct memory-mapped writes via writel().
> >
> > Attempts to write to this region from HLOS can result in silent failure=
s
> > or memory access violations, particularly when toggling EUD (Embedded
> > USB Debugger) state. To ensure secure register access, modify the drive=
r
> > to use qcom_scm_io_writel(), which routes the write operation to Qualco=
mm
> > Secure Channel Monitor (SCM). SCM has the necessary permissions to acce=
ss
> > protected memory regions, enabling reliable control over EUD state.
> >
> > SC7280, the only user of EUD is also affected, indicating that this cou=
ld
> > never have worked on a properly fused device.
> >
> > Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded U=
SB Debugger(EUD)")
> > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Changes in v7:
> > - Updated the commit message as per Greg's comment
> > - Link to v6: https://lore.kernel.org/r/20250721-eud_mode_manager_secur=
e_access-v6-1-fe603325ac04@oss.qualcomm.com
> >
> > Changes in v6:
> > - Propagating the error code from disable_eud(), per Dmitry's suggestio=
n
> > - Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secur=
e_access-v5-1-e769be308d4a@oss.qualcomm.com
> >
> > usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
> >
> > Changes in v5:
> > * Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's =
review
> > * Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.=
bajaj@oss.qualcomm.com/
> >
> > Changes in v4:
> > * Added error logging in disable_eud() for SCM write failures, per Konr=
ad=E2=80=99s suggestion
> > * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.=
bajaj@oss.qualcomm.com/
> >
> > Changes in v3:
> > * Moved secure write before normal writes
> > * Added error checking in disable_eud()
> > * Use ENOMEM error code if platform_get_resource() fails
> > * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> > * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.=
bajaj@oss.qualcomm.com/
> >
> > Changes in v2:
> > * Drop separate compatible to be added for secure eud
> > * Use secure call to access EUD mode manager register
> > * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_=
molvera@quicinc.com/
> > ---
> >  drivers/usb/misc/Kconfig    |  1 +
> >  drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
> >  2 files changed, 25 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636=
cdfd756344b9ed4e7 100644
> > --- a/drivers/usb/misc/Kconfig
> > +++ b/drivers/usb/misc/Kconfig
> > @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
> >  config USB_QCOM_EUD
> >       tristate "QCOM Embedded USB Debugger(EUD) Driver"
> >       depends on ARCH_QCOM || COMPILE_TEST
> > +     depends on QCOM_SCM
>
> You now are preventing this code from ever being able to be built in any
> testing systems, including mine, so I don't even know if this patch
> builds or not.
>
> You did not even document this in the changelog :(

QCOM_SCM is essential for QCOM_EUD for its functionality.
One option I'm considering is using select QCOM_SCM, which ensures
dependency is enabled when QCOM_EUD is selected. QCOM_SCM facilitates
communication with secure world, this approach should not cause issues even
when COMPILE_TEST is enabled on non-ARCH_QCOM platforms.

Alternatively, I could use a conditional depends expression like:
depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST

This would allow the driver to be built under COMPILE_TEST while ensuring
QCOM_SCM is present on actual QCOM platforms. However, this would
require proper stubbing in the qcom_scm driver to avoid build failures duri=
ng
compile testing.

Thanks
Komal

>
> {sigh}
>
> greg k-h

