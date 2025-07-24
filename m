Return-Path: <linux-arm-msm+bounces-66417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14497B1010C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31383543772
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 06:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34251A317D;
	Thu, 24 Jul 2025 06:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tsoqm7Lw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC4F9E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753339738; cv=none; b=SXkHNAj8ui1anbTVs8Y1JRhES1e7y4Afvx/6D6V6CTMpGgqiZu1beoqoceCRPtj6B/rj9udp1cPuojrco2sBOxaTMIDeXS3vjDQ2j5CiAiwmQvtc+EVxrkTyN6q75SMoLG0jnt1TgXqQv2xycQVhAE7IzDMWmiHLtbq4O7Nysx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753339738; c=relaxed/simple;
	bh=ZwOgqpp0TA922ZxVHkvkKqVmiawuN8p4imOgbFKOPBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdg4mG/TbnTKq/9ajEvvWwzTZ4SXn5P+l5T+lq37lcQb6oRQrQ/uWX+zNlcsAvtVevBKTL99XtuH8i3Qa0ShuMbVKAVFj+EIN8We9+/8fpj0A6EcW1p6S9qX3+SgaKosVxRzP/B90JvEy9jwk4w6OwDQM2ikuayOaitK5+5n3YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tsoqm7Lw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXRmD031246
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OuVrG+45gCM1FWa+u+ZPmx02gMR2aMNnrEKOLRKSX8=; b=Tsoqm7LwIeRbGxA3
	rbxgXEJljfb9VY/xEmOlS/eWulvghmGX+OSjhOG2O+hEc+16rNka6kFpx+IztWrc
	V0npdI4s7Ftp/A8esD+q6curovopd9tKoTx/Fvdn1nlYQmMFQPXNg64dFPKdc7Hm
	hBOjTi50q7l/i2pD22GfMluo65GGYRLMoGg/JbqS4AXBJ94uOt918G1filfd/wUn
	T1aWfji6mPOkCvHz3Nwb+rLII0W7Fv/LVt6iNoeFb216KVf5ASPqGWjVSVgN0Kta
	D4U2zMcCgNbf24TZyktR/BKmgffM/KevlHAbYiX1AzI6vE1Dve1kIUAw0I9/jgMT
	/osSVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048ve2dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:48:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so1124296a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 23:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753339735; x=1753944535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OuVrG+45gCM1FWa+u+ZPmx02gMR2aMNnrEKOLRKSX8=;
        b=AaMkV3E1ZIfyIweTl+NbXf3U0Kng7A8ArslbgJaD17AAib1cYMi/8pmWSGcDARJmLv
         sHnRJPG1BUmMDe0bq+BCWSgeZk57047zCpn4lPmj7tHGQjlSEIuZwwKM5fZ/OvRhJ0el
         kqGCqUAzw4ao+ER/7mDrpjROYU4UdXrFrvyChPsqO8/oUzvRCL7pIjF7f1SdpjZdclxo
         CGTl1swf3buCTIE8l1exZus/K2SJlMSxp2nylefSKe6QZ5a1nKTFnDxu1KOzZIXrb0pt
         Ix0PVP/np0NpHLe6/HySKFgBOJwTQV46iBJD179AlRi83sH4sfHO5LJOofaGZa1N4Jpl
         dGoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXkvG83iMgF7vY6POIKlz5lFt3pmQ+S4+83qjFcAGHohv4UvWw1OHPMJ5iAzvExBZKKRYn3H48rjsqJetU@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQNXUEimfhjAFWE2GQ99mc4tFxsYWgHA0PI+vHL8CyNA8nZmr
	FniQK2H/7Cw4PwFK4Mq1LGMNMbr10KwNDBco3BwTrUUa42LUEV6Ev+BdB+3rDYgydNnvSpxGWnU
	n6ScqPuK6DMZmh76jKhuhjRgP/lks2nqu1h2q5FLf3RKKUQjq8+U5V5wkLTR451R9eFfwhjUY+p
	ymibmh3MPfB/rJHte0DiYWB6foA3GWBc96Gaxfl3lc2z8=
X-Gm-Gg: ASbGncus/e4TgxXC+qUNQtRQZ4KAiYcVWGPngB1hTx66/SaAkvotZfmNIX28WeclUf8
	ldxnRQekV69co0de7pigGpOgX9d7KA8+QySixTubwwSrxOCUtWli1zjeCv4G3Y1JGQUoN/ntUkj
	i7521KAibjQSgbTsJk4l0B1g==
X-Received: by 2002:a17:90b:5307:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-31e506fafa1mr8454161a91.3.1753339735228;
        Wed, 23 Jul 2025 23:48:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0xuFhsTtHteC8TAD57Q6joOJlox3gIguYiF5oWLxTsosMaMv5As8OkZUmubTakwIre8e8nQ05qXI+LuGNvhI=
X-Received: by 2002:a17:90b:5307:b0:312:e731:5a66 with SMTP id
 98e67ed59e1d1-31e506fafa1mr8454135a91.3.1753339734747; Wed, 23 Jul 2025
 23:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
 <20250623-add-rpmh-read-support-v1-2-ae583d260195@oss.qualcomm.com> <e5a44c70-e64a-47e7-8e45-3e1ae4f0ceb0@sirena.org.uk>
In-Reply-To: <e5a44c70-e64a-47e7-8e45-3e1ae4f0ceb0@sirena.org.uk>
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:18:43 +0530
X-Gm-Features: Ac12FXxAwiQob4IiIXw36QCglORhIBGYhauvKSPAlRUZvMvnNaFb-Z6bgJ7IPP8
Message-ID: <CADhhZXaTVqEcm_6w2keV42K+1uq9mruYZGp3OAWouK_4K-G4rw@mail.gmail.com>
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support to read regulator settings
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: vpu6pyTyL2VEXYQXf22RkhAsT109adnU
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6881d758 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=-AEiNET5rxD8FLx_RNEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA0NiBTYWx0ZWRfXzT0LYQq7zu5V
 0TWwDp6XfV7VcJPvBe3UQqLp88lngrBB9eTg388qvoMyvj7KES1VDkxsm80Hk5n7HHqmt/pFLDO
 KVXgeuRf+da7CIvcdHFbhIrcv8q9qye5+ETukaMn7//XfI4p56o6mnHP7UWFeNDj+zYZ1laKhZn
 /XVp0gQkNsxBfCkUIFML0PBX60nppsHSZOjRERWemKfVpR4MeSIGy20xPQ1W6SXGrp+IoEWs+xS
 0zTeXkCz1rzZ84W6vQmSJo+xTa2Gv0QLQkTFfd82ToBpiQCzdQ4VaZMMeEeNlR/gpfDmNfRHHv6
 DPYs23OthGIsjNRQvyOFCusSYizdWJSn6xt45eEASrfroUEnjX6mz6mVs2ghxPyANPpr+VxlaFl
 S4OfIPJrfeV/lz0H1pcZKDaP+GEao3AYFjwJ84EmMrZRbesiLAx/17eNWIV4cqk0ZtVBkvaw
X-Proofpoint-ORIG-GUID: vpu6pyTyL2VEXYQXf22RkhAsT109adnU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240046

Hi Mark,

On Mon, Jun 23, 2025 at 10:34=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Jun 23, 2025 at 10:13:41PM +0530, Kamal Wadhwa wrote:
>
> > To address this issue, enhance the `get_voltage_sel()`,
> > `get_mode()`, and `is_enabled()` callbacks to read the regulator
> > settings directly from the RPMH hardware using the `rpmh_read()`
>
> Two things here.  One is that my understanding was that at least some of
> the firmwares simply do not provide read functionality - this new code
> will turn that into an error if it's the case.  The other is that
> there's an expectation that the read operations will return the value
> that was configured by the host, we might get confused if that's not the
> case.  I'm not sure if there's paths that are currently implemented
> that'd have issues, but it's a concern.

This change should not violate the 2 things you have highlighted.

To elaborate, the regulator status will be read by APPS as ON if the rail w=
as
requested ON by APPS, before reaching kernel stage.  And will *not* be
seen as ON if it=E2=80=99s voted from some other subsystem DSP.

One important note here (about an exception to the above statement),
Internally all rails are =E2=80=98assigned' to a subsystem. Even rails shar=
ed between 2
or more subsystems are 'internally assigned=E2=80=99 to only one of those s=
ubsystems.

Boot loader code initializes the RPMh votes of the 'assigned' subsystem to =
match
the physical status of each regulator after the power-on sequence completes=
.
This ensures correct RPMh regulator parameter aggregation when subsystems
issue their own votes.

So, if a rail which is internally assigned to the APPS subsystem, gets
turned ON by
PMIC HW ( power ON sequence), in such cases too,  the rail may be seen
ON from APPS side. This is the exception.

But this exception only applies if default ON rails is =E2=80=98internally =
assigned=E2=80=99 to
APPS subsystem. And will *not* happen if the rail was assigned to some othe=
r
subsystem DSP (and was turned ON from PMIC HW). In such a case status
will still be seen as OFF from APPS (as expected), even though they may act=
ually
be ON.


>
> For the enable there's a separate status callback that should be
> implemented, and you could bootstrap the state.  For the voltage
> readback it's a range that's configured so it should be fine to just do
> this I think, though I'd need to go double check the code for keeping
> multiple supplies tied within a range.

Sure, I will bootstrap the state(ON/OFF), and move the read logic to
get_status() op.

