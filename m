Return-Path: <linux-arm-msm+bounces-53056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E085A79537
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 20:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A0341706B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 18:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8881DB92A;
	Wed,  2 Apr 2025 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESY+6x7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE05C1D95B3
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619170; cv=none; b=F9N9PK+5couPmS79zA0JZdlJ2r3pgBtRHs5hXLQcObVMv0xzWAy1UXv112AnlvAfkXFgfNAAf0Bwb6Xaa3JuEa5ZHd85lJjKjAXcXBhgYaKjx2Y2ZuOHKRuFZeiS+dkGgGZt+D+WepFF05IwGsLnfoaUgGfnd2Ehy+lBHnvkv4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619170; c=relaxed/simple;
	bh=A3khaq21uI6D+hNfec4Redi3mG1fNskqHWFV9FCWlUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijtyj1ECnFlDHt36GzDR4TDN6A8dT7IBS31VAS7oESdr8eRonFqb2nmMLCY/ZF05JYASU6lA9ldIOO+fBCVzZrYUk+34dKXFYRJ+6d9Q4q24zPXbeA/AEEgsB0yNveyNZKcqRP+PTcLxWncgvHH95NYaw5v4rjW6cAfTn6tMfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESY+6x7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532D2pRA007649
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 18:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLRltPAW2VT+osyndq8xbNTAaaTzvicU6XEHnaTvyEQ=; b=ESY+6x7scCrYx+nG
	BrnUXYp5lICXjecsq2AXoO/uQpGAP95loBcQcLxRTeLSEwb2eidswYei2oMEoyc5
	aoP4uSPj80Df2j0dk3523XVXObrAM93Z6SXWy620jysZlLFSd3FZCd2+qQxXf/D3
	DWkGujXDcuc6+i9wt2WXm21X2NHrL+l12ECJqSNiOp/rWmtXLCZOyldDsOX/QxVc
	wk8NJbM0ZOGS9IfoSh+8pnnA42eLn42rAhN0A+fpDwgAsQtThrrGbucwVb6nSKZl
	/8NGadeGi4anVSQRK9IB5TkEoOEncnCdTqZufa2lHJ6sfkJfH6mhJ+nSkQHypFm8
	42xKiA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxb02c3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 18:39:27 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72a0de193b2so194986a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 11:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619166; x=1744223966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLRltPAW2VT+osyndq8xbNTAaaTzvicU6XEHnaTvyEQ=;
        b=DgUe4s+NXwfau/dgSHSlV3M6RnuBC8HhFjTHkDk3FLiv9Mh/LAacJXPkjFvVw+kiTu
         n7/UJkAjehfdLUWqiQk4zY0qvSHaM4wxIsHa05saazTQIRxUO4I6O1XERdkeevGvVree
         RuaK6Wfm6p1l+8xnDVWAswdofrhvDGh05avQjLjJHXl8xaYbdsRz39hk1sWV60BbrS6H
         0XdLzZ3SxoC65rowGATpFdXRa8Aw3GMSqJb4eMRMpEw5mVFhX2mkBMGfhqL+r0IPJgwn
         Ck6F3gcvqWo8s+kZIAKsOyQ3Qa3eiLpVabj3wa95fZcQmcRP7uj2HSbK+CIyyiA9/XDm
         dRJw==
X-Forwarded-Encrypted: i=1; AJvYcCVVfQVroB0OhRaj+F9XDYDQWwCrorz9SxwvsV/RIWTdX6G20FJ4QmvTku/n7d1yuc+gXXJZ4GJo0JNhLu5D@vger.kernel.org
X-Gm-Message-State: AOJu0YzPgKHar8mcMvyRXQjEYYUMWX8GoS9XlrDabyZ6gxH9namCh8Uw
	R759q2MHc/eV4yDjUG5GvYjf4tt/Lvyemse9d91K9255Y/8hb4WPBKbc13v0DVMIBj1XnqusQ2/
	SzHCCiqw+Rf3np1/ZcBYRj/mDzH0968jOAIxxefyRSIpzal+RyaSwUigoasp/ygL4J9omS2PgHl
	nlDxjj8CKG4A2UfBpJ3qJI9hv8WpjhLlD8vyVVDig=
X-Gm-Gg: ASbGncvu09CXQoq7iPUYvlcEGEYjA6/h5JKtZ2Jj+uHwIIO48m7NqOqlDUafFiu8prT
	3BASIHyW8RDjvMl1haHfhGRwdfaVQycN+tzPbrVe3a5OIvxFLlPg2rduxC54mW9uMEMBC1FLB0Q
	==
X-Received: by 2002:a05:6808:6c82:b0:3fb:2e8f:4de5 with SMTP id 5614622812f47-3ff0f52ef55mr12164475b6e.17.1743619166141;
        Wed, 02 Apr 2025 11:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa8ubrSd45uaaFhCFxG8RPmNf74FF0t82olgtZy7cR4JA2o8Zjllf8U6MoEnTSrTKOqq9YmFW/PnuOLXRUna8=
X-Received: by 2002:a05:6808:6c82:b0:3fb:2e8f:4de5 with SMTP id
 5614622812f47-3ff0f52ef55mr12164445b6e.17.1743619165788; Wed, 02 Apr 2025
 11:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com>
 <20250303-arm-psci-system_reset2-vendor-reboots-v9-2-b2cf4a20feda@oss.qualcomm.com>
 <Z9QQw6BcE7IXzu+r@lpieralisi> <Z+K3uNjTNbq3pUis@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <Z+K3uNjTNbq3pUis@hu-mojha-hyd.qualcomm.com>
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 00:09:14 +0530
X-Gm-Features: AQ5f1JoIGcawwwxAneye4VDKyUquub00SsUJlDPk9-P3wh_983NTysTlWsL0c0s
Message-ID: <CAN3W6UUgacP0JZc7yGJ2Q3HYGFZ3mMHh0okyHTMiuxDSwmABHA@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] firmware: psci: Read and use vendor reset types
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Elliot Berman <elliotb317@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: W9f6xWgeYtNe0Y3uituZBFMQdIo64xdR
X-Proofpoint-GUID: W9f6xWgeYtNe0Y3uituZBFMQdIo64xdR
X-Authority-Analysis: v=2.4 cv=BavY0qt2 c=1 sm=1 tr=0 ts=67ed845f cx=c_pps a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=GcyzOjIWAAAA:8 a=EUspDBNiAAAA:8 a=ZS3UFk-b-OyYpVL8qdMA:9 a=QEXdDO2ut3YA:10 a=dtxw0mqMjrQA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=hQL3dl6oAZ8NdCsdz28n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_08,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020119

On Tue, Mar 25, 2025 at 7:33=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> On Fri, Mar 14, 2025 at 12:19:31PM +0100, Lorenzo Pieralisi wrote:
> > On Mon, Mar 03, 2025 at 01:08:31PM -0800, Elliot Berman wrote:
> > > From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > >
> > > SoC vendors have different types of resets and are controlled through
> > > various registers. For instance, Qualcomm chipsets can reboot to a
> > > "download mode" that allows a RAM dump to be collected. Another examp=
le
> > > is they also support writing a cookie that can be read by bootloader
> > > during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> > > vendor reset types to be implemented without requiring drivers for ev=
ery
> > > register/cookie.
> > >
> > > Add support in PSCI to statically map reboot mode commands from
> > > userspace to a vendor reset and cookie value using the device tree.
> >
> > I have managed to discuss a little bit this patchset over the last
> > few days and I think we have defined a plan going forward.
> >
> > A point that was raised is:
> >
> > https://man7.org/linux/man-pages/man2/reboot.2.html
> >
> > LINUX_REBOOT_CMD_RESTART2 *arg command, what is it supposed to
> > represent ?
> >
> > Is it the mode the system should reboot into OR it is the
> > actual command to be issued (which is what this patchset
> > implements) ?
> >
> > LINUX_REBOOT_CMD_RESTART "..a default restart..."
> >
> > It is unclear what "default" means. We wonder whether the
> > reboot_mode variable was introduced to _define_ that "default".
> >
> > So, in short, my aim is trying to decouple reboot_mode from the
> > LINUX_REBOOT_CMD_RESTART2 *arg command.
> >
> > I believe that adding a sysfs interface to reboot-mode driver
> > infrastructure would be useful, so that the commands would
> > be exposed to userspace and userspace can set the *arg command
> > specifically to issue a given reset/mode.
> >
> > I wonder why this is not already in place for eg syscon-reboot-mode
> > resets, how does user space issue a command in those systems if the
> > available commands aren't exposed to userspace ?
> >
> > Is there a kernel entity exposing those "modes" to userspace, somehow ?
> >
> > > A separate initcall is needed to parse the devicetree, instead of usi=
ng
> > > psci_dt_init because mm isn't sufficiently set up to allocate memory.
> > >
> > > Reboot mode framework is close but doesn't quite fit with the
> > > design and requirements for PSCI SYSTEM_RESET2. Some of these issues =
can
> > > be solved but doesn't seem reasonable in sum:
> > >  1. reboot mode registers against the reboot_notifier_list, which is =
too
> > >     early to call SYSTEM_RESET2. PSCI would need to remember the rese=
t
> > >     type from the reboot-mode framework callback and use it
> > >     psci_sys_reset.
> > >  2. reboot mode assumes only one cookie/parameter is described in the
> > >     device tree. SYSTEM_RESET2 uses 2: one for the type and one for
> > >     cookie.
> >
> > This can be changed and I think it should, so that the reboot modes
> > are exposed to user space and PSCI can use that.
> >
> In the case of a regular reboot or panic, the reboot/panic notifiers run
> first, followed by the restart notifiers. The PSCI reset/reset2 should
> be the last call from Linux, and ideally, this call should not fail.
>
> Reboot mode notifiers =3D> restart notifiers or Panic notifiers =3D> rest=
art
> notifiers
>
> So, if I understand correctly, you mean that we can change the reboot
> mode framework to expose the arguments available to user space. We can
> extend it to accept magic and cookies, save them in the reboot
> framework, and retrieve them via a call from PSCI during a regular
> reboot or panic based on the current arguments. Is this leading towards
> writing an ARM-specific PSCI-reboot-mode driver, which in its reboot
> notifier callback saves the magic and cookies, and these magic and
> cookies will be used during psci_sys_reset2()? Or is there something
> wrong with my understanding?

In case this mail got lost in your inbox, I wanted to float this up
again as this is a very important ARM feature and
its future course of action depends on the common understanding.

-Mukesh

