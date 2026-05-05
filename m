Return-Path: <linux-arm-msm+bounces-105840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIrsKgWW+Wlg+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:02:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 487884C7694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AAE973027FEE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709743D6465;
	Tue,  5 May 2026 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQx1my3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sea5bGWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA013CFF42
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964433; cv=none; b=fRQhdaYglYNN10HV9jJFPCObSgVuwjWSqKA/lMOXCEariysSjaOqiItuE0dgqjFh/DrDXQa5dhDE2odc/GA7evq6QXFzaPPloInVbaCk0HA7OMVz5HlLNfSsliGFuu1jnLfqNRcmXIpgVn+ovlnPcxeFsRFsqWb42xKT2C6KrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964433; c=relaxed/simple;
	bh=k+mgc0YlocndbsIrFNENydiGw8+BvDwFkR9GLztH9c0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LkAaPsMvWwBiuW96AEcrhtoRYUSgST253uFoMbevOtDxyvEgdyNLx8bMdL1/DGcCIeNg/BlhIbNuRWzbdQRKa87VA9FXVHdUz7ZnqdLb+QoVf2V4nS0VjD24AZs3ZoU6BFSM30N8wchzy81hRMIo1fyNls4OlGy/JBcTa9f4lZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQx1my3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sea5bGWv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644LkRfe1430674
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NBuu5nZ3GlsO7rEKTfFvdQ
	JvNWK81v0uf06XV1Icjyo=; b=GQx1my3WtZwO65FfDzPxxAIrLhhCcJLdQmh7FW
	D/yYAtAQLaFBHHnDKIC/hbyV0WOEBYVU+jFxpojyWQ1K6TWi7TSqySNlKd2d8WO+
	nVWu5s+jJX6fc/rRds0IA9/EV+FbFNwMIhQvTwAGGk7GQqWp/IcTbjj6fuSE1Cb6
	v9tTshBwcjWUGBFqHoPY6bhIn3berkZIQwq9W9eQ7uGfk6gEJcTWaIKPim9Pf8hv
	/Abblz6GaSXGaXXE4Gt06Wf8j2Wvgj8ZIFx6qSRcNioDSPKtEaeWldghyF6LXdt+
	hzzagtcv/J6qwDXNDTy4ssjtTdnPz4ux4AEKicFA3J7dOLSw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6u6ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:00:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3650a4eb60dso3418168a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964429; x=1778569229; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBuu5nZ3GlsO7rEKTfFvdQJvNWK81v0uf06XV1Icjyo=;
        b=Sea5bGWvaXDofH/IXoed4Q0F0wnxueYY8vSsVqfi3MkPbnpxdoQiMAT3fon/I/GQaa
         3aoYt8ATdypRDUjRVymR7J1JaIYsMVg7F03q+pw29VIQ/cr5jwoE4Ewwr5l8VETJAy4G
         UH9Q0iZW+xwils/G0uyzrSiWLZIWavzm++ImWvKOjoPOGJ9ZOkSRF15OEJLWfowdYdpM
         C6J9WsjfsrrfkEAlru3mfsUAli0hgo6EALyEtcTSB+ru/S9ZxhyHZGPAyY+tJWTFDaIM
         acRPEgOgIS853XUnR3hfITz9BlgyP3zQtJKsIy2jHyeV6ehjiyUnVfAeOdPtgIsCTv5x
         nUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964429; x=1778569229;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBuu5nZ3GlsO7rEKTfFvdQJvNWK81v0uf06XV1Icjyo=;
        b=WT/onsQOXQDAzPcg2laydxjKIbUTLG6K/+G5r4gg1hDOYFGbX4OyWwtYgwrcm/a9FX
         bo0nynKD87NYZ+4It9UP5gQIlolumylVfR2RboeHFvCc5necQVyl1Xy3s9ah9xgTDg8T
         vIRhj6KNpPZIDQAd2gB8lPLcq5CjKZ1R/5Y9OwJ2B64sE21mjJdM9d9+BJNliznOa7cx
         MozNFR0soI3ttFUqH9bH9kRQK8RrU3oiFBi4DFvyldw4D3VQflfKFhXs9GG4Tmljrcfv
         4lHf2dSDBxVog/OGDoBsyTYJNFApqkwQDavCErL894YQXAz/9IDZcYbK/lZaYXZWa80y
         SLYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZDb31UhpH9Tz0PEAioK50QnCohwtpeNJDeaw545P1Ouq81srQUiQl0OObds+cpFSJjli/Dny3FgakJBec@vger.kernel.org
X-Gm-Message-State: AOJu0YwiElZ37dCRT2ogQR5ZBBC90uJ9EC+cuDbajRsi845iZ32RQpzW
	EgIOuUjQTmJ1WEL0qGxawjv8ZCgM00mnYi99eH7RoSLUcShMww6nTsJE9AvDdxFQjtPLEf+vIHY
	t9aYyqLAIw9tM3tx9WI4WJyLrK1/UxYzdM8Sk5yWTOEsKcwsUX4TdF3EuYDVMubAVMDxJ
X-Gm-Gg: AeBDiev6P6+7atyDMiL+1E9fMRLkQRd4fRymALj7XF1RwWPSEU1is94y+GOjdzo5oLT
	0asMq1KOQBl8XFxPUgiephBFSelpAn69qyWhwFjVdeGmUA/QTZTnmwkgNo6T0AOOaPUY2lD31eX
	nIpHyCsBR7rtFFaQDvNHNqMi4TiQUEILnqd5e3/ey5AI0LcTHtRmng4/IOA6TbGPnO+JLl1wV2F
	WqYvLN3E4dNRSsQB9jjxal/8jAUWLednnOObaaWzLB6/eGzzowhHnEa270h5ESucWApq3jReGIe
	lL1xDP/1aGwq22lYrTQ5bkrMFhCrqydiRSlaT4elmC6c09pbu2zhZvvYkkr3j81BPOtaLw261mg
	vlRYH4mAmluJ0vBKLF5xkXzSH9xP9Ybp3qQGLAuu8HmnXfP5YIKkfLORJaT+idnmVjw==
X-Received: by 2002:a17:90b:2584:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-3650cd4b216mr11524699a91.5.1777964428601;
        Tue, 05 May 2026 00:00:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2584:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-3650cd4b216mr11524661a91.5.1777964428115;
        Tue, 05 May 2026 00:00:28 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:27 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v4 00/13] media: iris: Add support for glymur platform
Date: Tue, 05 May 2026 12:29:21 +0530
Message-Id: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEmV+WkC/3XO3Q6CIByH4VtxHIf785FKR91H60AQlE2jIF3Oe
 e+hK+dBnbD9GM87JhS0tzqgUzIhrwcbrLvFwQ8JUk15qzW2VdyIAs2Ag8B1O3a9x4RDKXNVgiC
 A4uO718a+1tDlGndjw9P5ce0OZLn9JAj/JgaCAecVq4gyx1yS7OxCSB992SrXdWk80FIa6E5Tt
 mkaNVCRSaWkMFz/0Wyvi02zqAtDC8HA8PiJH3qe5zfMZ2L5HwEAAA==
X-Change-ID: 20260409-glymur-140ab7ca0910
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        stable@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=19927;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=k+mgc0YlocndbsIrFNENydiGw8+BvDwFkR9GLztH9c0=;
 b=GcPlkLJC7pdh9/ztc07MBLg/iE4eLtSdluiwV+/AH5agu7/3Mj69hbxNFOasKNsMfxzZxpigp
 vAoa+h9A/k0AevZ2tf4z17U09TTAeAztIQIA09svqEFDMfwq8uKcl2i
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: ar0UgVrDCjwm-RfYmSZaMS0BtQMhAJKf
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f9958e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=apL-334RAAAA:8 a=e5mUnYsNAAAA:8
 a=_kYj45sWfqhTmfv7RfYA:9 a=_2Nj3zHkznSfVjmt:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=eWIHaOtA_ULHaMmHwLHW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ar0UgVrDCjwm-RfYmSZaMS0BtQMhAJKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MiBTYWx0ZWRfX4+6gJgpvnajA
 M7imEuB6H1ccp4DI44oSsVOLApv33JtTFonjQ0BMfjgeRvvtOdp6E+HiWnueGInq1LEsGejm7CV
 2tOfO5tMHqRhoxcVBdaYvN7Bnbl3hk/o8NF0qbBp0ph2Aw38wbgeJz5Mx0iXT483B9JRYjQ0wRy
 3g+9i7h54rK9PgjzPEkBzp88nMj8n1FNGZZqRPSWS+owYwouqMMOy3Sk2pvKFtdvyMhe3rC7zu8
 wzuwv63wr61KqfICxqvcuqc0pC2AIL6kWdWoOEH2prItVkQe+xt32wqgAD75L3kcPqeOpLqnTrr
 UCEHFmUOIjfkc1blG94Eax522CmIzE+SbLWFnS04aagV/DlaByBErLKVC2UTaBMNN/AxqpRHs7J
 9H/Mmt7YNw5Vs6xwEY0h+EaWo63K5np1e/CqT2K7unrif0z8aoztBo3SuM7IGmnRbW2QFS3TJaN
 Tm0VFrp6Dl2J6hvvPcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050062
X-Rspamd-Queue-Id: 487884C7694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105840-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Glymur is a new generation video codec that supports dual hardware cores
along with additional power domains and clocks.

This series adds platform specific support in the iris driver to handle
the extra cores, power domains, and clock requirements introduced by
glymur. Add support for firmware loading through context bank firmware
device.

Dependencies and merge strategy:

Patch[1]: It's a generic fix, media maintainer can pick this independently.

Patch[2-3]: DT binding, DT maintainer can pick this independently.

Patch[4]: Iris VPU bus, media maintainer can pick this independently.

Patch[5]: Add Iris VPU bus to iommu_buses, IOMMU maintainer can pick this independently.

Patch[6-11]: Glymur enablement patches, media maintainer can pick these independently.

Patch[12]: Platform data, depend on patch[4] and patch[5].

Patch[13]: DT node, Depend on the below patch.
https://lore.kernel.org/all/20260410-glymur_mmcc_dt_config_v2-v3-1-acce9d106e72@oss.qualcomm.com/

v4l2-compliance report for decoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.1.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.1.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 43 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Fluster test report:

77/135 while testing JVT-AVC_V1 with 
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1

The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding
is not supported.
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CABREF3_Sand_D
- CAFI1_SVA_C
- CAMA1_Sony_C
- CAMA1_TOSHIBA_B
- cama1_vtc_c
- cama2_vtc_b
- CAMA3_Sand_E
- cama3_vtc_b
- CAMACI3_Sony_C
- CAMANL1_TOSHIBA_B
- CAMANL2_TOSHIBA_B
- CAMANL3_Sand_E
- CAMASL3_Sony_B
- CAMP_MOT_MBAFF_L30
- CAMP_MOT_MBAFF_L31
- CANLMA2_Sony_C
- CANLMA3_Sony_C
- CAPA1_TOSHIBA_B
- CAPAMA3_Sand_F
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMA1_TOSHIBA_B
- CVMANL1_TOSHIBA_B
- CVMANL2_TOSHIBA_B
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
- CVNLFI1_Sony_C
- CVNLFI2_Sony_H
- CVPA1_TOSHIBA_B
- FI1_Sony_E
- MR6_BT_B
- MR7_BT_B
- MR8_BT_B
- MR9_BT_B
- Sharp_MP_Field_1_B
- Sharp_MP_Field_2_B
- Sharp_MP_Field_3_B
- Sharp_MP_PAFF_1r2
- Sharp_MP_PAFF_2r
- CVMP_MOT_FRM_L31_B

3 test case failed due to unsupported bitstream.
num_slice_groups_minus1 greater than zero is not supported.
- FM1_BT_B
- FM1_FT_E
- FM2_SVA_C

2 test case failed because SP_SLICE type is not supported.
- SP1_BT_A
- sp2_bt_b

1 test case failed due to unsupported profile.
- BA3_SVA_C

131/147 testcases passed while testing JCT-VC-HEVC_V1 with 
GStreamer-H.265-V4L2-Gst1.0

10 testcases failed due to unsupported 10 bit format.
- DBLK_A_MAIN10_VIXS_4
- INITQP_B_Main10_Sony_1
- TSUNEQBD_A_MAIN10_Technicolor_2
- WP_A_MAIN10_Toshiba_3
- WP_MAIN10_B_Toshiba_3
- WPP_A_ericsson_MAIN10_2
- WPP_B_ericsson_MAIN10_2
- WPP_C_ericsson_MAIN10_2
- WPP_E_ericsson_MAIN10_2
- WPP_F_ericsson_MAIN10_2

4 testcase failed due to unsupported resolution.
- PICSIZE_A_Bossen_1
- PICSIZE_B_Bossen_1
- WPP_D_ericsson_MAIN10_2
- WPP_D_ericsson_MAIN_2

2 testcase failed due to CRC mismatch.
- VPSSPSPPS_A_MainConcept_1
This fails with software decoder as well. Refer the below link for the
discussion happened for earlier platform.
https://lore.kernel.org/all/63ca375440c4ff2f55ea0aa4e19458f775552d88.camel@ndufresne.ca/
- RAP_A_docomo_6
This was discussed on bug report
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
Based on above discussion, the initial error frames need to be dropped in
the firmware or driver. Discussion ongoing with video firmware team on a
way to handle such case. This issue is not specific to this platform, and
its there on other platforms also.

235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
64 testcases failed due to unsupported resolution
- vp90-2-02-size-08x08.webm
- vp90-2-02-size-08x10.webm
- vp90-2-02-size-08x16.webm
- vp90-2-02-size-08x18.webm
- vp90-2-02-size-08x32.webm
- vp90-2-02-size-08x34.webm
- vp90-2-02-size-08x64.webm
- vp90-2-02-size-08x66.webm
- vp90-2-02-size-10x08.webm
- vp90-2-02-size-10x10.webm
- vp90-2-02-size-10x16.webm
- vp90-2-02-size-10x18.webm
- vp90-2-02-size-10x32.webm
- vp90-2-02-size-10x34.webm
- vp90-2-02-size-10x64.webm
- vp90-2-02-size-10x66.webm
- vp90-2-02-size-16x08.webm
- vp90-2-02-size-16x10.webm
- vp90-2-02-size-16x16.webm
- vp90-2-02-size-16x18.webm
- vp90-2-02-size-16x32.webm
- vp90-2-02-size-16x34.webm
- vp90-2-02-size-16x64.webm
- vp90-2-02-size-16x66.webm
- vp90-2-02-size-18x08.webm
- vp90-2-02-size-18x10.webm
- vp90-2-02-size-18x16.webm
- vp90-2-02-size-18x18.webm
- vp90-2-02-size-18x32.webm
- vp90-2-02-size-18x34.webm
- vp90-2-02-size-18x64.webm
- vp90-2-02-size-18x66.webm
- vp90-2-02-size-32x08.webm
- vp90-2-02-size-32x10.webm
- vp90-2-02-size-32x16.webm
- vp90-2-02-size-32x18.webm
- vp90-2-02-size-32x32.webm
- vp90-2-02-size-32x34.webm
- vp90-2-02-size-32x64.webm
- vp90-2-02-size-32x66.webm
- vp90-2-02-size-34x08.webm
- vp90-2-02-size-34x10.webm
- vp90-2-02-size-34x16.webm
- vp90-2-02-size-34x18.webm
- vp90-2-02-size-34x32.webm
- vp90-2-02-size-34x34.webm
- vp90-2-02-size-34x64.webm
- vp90-2-02-size-34x66.webm
- vp90-2-02-size-64x08.webm
- vp90-2-02-size-64x10.webm
- vp90-2-02-size-64x16.webm
- vp90-2-02-size-64x18.webm
- vp90-2-02-size-64x32.webm
- vp90-2-02-size-64x34.webm
- vp90-2-02-size-64x64.webm
- vp90-2-02-size-64x66.webm
- vp90-2-02-size-66x08.webm
- vp90-2-02-size-66x10.webm
- vp90-2-02-size-66x16.webm
- vp90-2-02-size-66x18.webm
- vp90-2-02-size-66x32.webm
- vp90-2-02-size-66x34.webm
- vp90-2-02-size-66x64.webm
- vp90-2-02-size-66x66.webm

2 testcases failed due to unsupported format.
- vp91-2-04-yuv422.webm
- vp91-2-04-yuv444.webm

2 testcase failed due to unsupported resolution after DRC.
- vp90-2-21-resize_inter_320x180_5_1-2.webm
- vp90-2-21-resize_inter_320x180_7_1-2.webm

1 testcase failed with CRC mismatch.
- vp90-2-22-svc_1280x720_3.ivf
This VP9 bitstream contains 20 superframes, and each superframe consists
of three subframes in the following order:
• 180p subframe
• 360p subframe
• 720p subframe
Each superframe is submitted to the driver and firmware as a single input
buffer, with one common timestamp attached to it. For every such input
buffer, the hardware decoder produces three corresponding output buffers,
one for each resolution (180p, 360p, and 720p), and all three output
buffers carry the same timestamp. When these output buffers are returned
to the client (GStreamer, in this case), the first buffer returned is
displayed, while the remaining two buffers are dropped due to having
identical timestamps. As a result, only one frame per superframe is
rendered. Here the expectation of the test result is with 720p, last
decoded frame in each super frame.
Discussion ongoing with firmware team and gst maintainer on how to handle
this case. This is not specific to glymur, and its there for the other
platforms also.

1 testcase failed due to unsupported stream.
- vp90-2-16-intra-only.webm

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v4:
- Update existing venus common binding.
- Update glymur DT binding required properties.
- Patches are rebased and resolved merge conflicts.
- Link to v3: https://lore.kernel.org/r/20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com

Changes in v3:
- Drop generic dma context bus and moved to iris vpu bus (Greg)
- Update commit message for platform data patch (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com

Changes in v2:
- Update the clock and reset names in DT binding (Krzysztof)
- Update firmware device names (Mukesh, Konrad)
- Update the selection of core for dual core platforms
- Add new generic dma context bus instead of own iris vpu bus (Dmitry)
- Add patch to get power domain type to look up pd_devs index
- Update glymur platform data (Dmitry)
- lInk to v1: https://lore.kernel.org/r/20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com

---
Mukesh Ojha (1):
      media: iris: Enable Secure PAS support with IOMMU managed by Linux

Vikash Garodia (2):
      media: iris: Add iris vpu bus support
      iommu: Add iris-vpu-bus to iommu_buses

Vishnu Reddy (10):
      media: iris: Fix VM count passed to firmware
      dt-bindings: media: qcom,venus: Remove clock, power-domain, and iommus from common schema
      dt-bindings: media: qcom,glymur-iris: Add glymur video codec
      media: iris: Add context bank hooks for platform specific initialization
      media: iris: Rename clock and power domain macros to use vcodec prefix
      media: iris: Use power domain type to look up pd_devs index
      media: iris: Add power sequence for Glymur
      media: iris: Add support to select core for dual core platforms
      media: iris: Add platform data for glymur
      arm64: dts: qcom: glymur: Add iris video node

 .../bindings/media/qcom,glymur-iris.yaml           | 205 +++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |  20 --
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |   4 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 118 ++++++++++++
 drivers/iommu/iommu.c                              |   4 +
 drivers/media/platform/qcom/iris/Makefile          |   5 +
 drivers/media/platform/qcom/iris/iris_common.c     |  10 +
 drivers/media/platform/qcom/iris/iris_common.h     |   1 +
 drivers/media/platform/qcom/iris/iris_core.h       |   9 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  72 +++++++-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  19 ++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |  33 +++-
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  24 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 129 +++++++++++--
 .../platform/qcom/iris/iris_platform_glymur.c      |  97 ++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++
 .../platform/qcom/iris/iris_platform_sc7280.h      |  10 +-
 .../platform/qcom/iris/iris_platform_sm8750.h      |  12 +-
 drivers/media/platform/qcom/iris/iris_power.c      |  11 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  31 +++-
 drivers/media/platform/qcom/iris/iris_resources.c  |  44 ++++-
 drivers/media/platform/qcom/iris/iris_resources.h  |   6 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |  91 +++++++--
 drivers/media/platform/qcom/iris/iris_vb2.c        |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 159 ++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  68 +++----
 drivers/media/platform/qcom/iris/iris_vpu_bus.c    |  69 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  45 +++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   7 +
 include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
 include/linux/iris_vpu_bus.h                       |  25 +++
 36 files changed, 1198 insertions(+), 173 deletions(-)
---
base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
change-id: 20260409-glymur-140ab7ca0910

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


