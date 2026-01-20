Return-Path: <linux-arm-msm+bounces-89896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP62D44CcGmUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:32:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1F4D032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5927676F28E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489CA3D6466;
	Tue, 20 Jan 2026 22:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBQQ8f0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlwQDHLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E838E5CC
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946780; cv=none; b=SMSVP0YXudxGy0NgWNqUA3uIcjP3Y4GaNTINNWrY/UtF0E+/Pn3mLaPG1W2MDj+iaNIitq4W9hX9h9IRo5QnXaeVgQsQuSuv4gCao+syG1NgDcZhgAOcn9s54edLEIciap7qXOh+Xm97dgR9Wn0QBxLnkbtQJ8W8u9ER2wqnh/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946780; c=relaxed/simple;
	bh=9qFuBOJpVm4NZ5jGLP9VDemKSpzt4dZj5vBYO/y0ZNQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s1a615TEda8wBEdRSD/FS1to2qigAI8ox4zv8nq4mJnde4NisNfrYijBSC2pirc6rSiyDH5LZq5fw+6ZfcbbgRVaYQLB5QkJY65TwX1i8rkeNmN8mKGbN19WqToBUgCYPon7WZDfkXfymVkVkvHuW+hJFlVHUj4ETgXJCAuhUE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBQQ8f0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlwQDHLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KK7tkk803730
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y4GljF2FtDKElu8MwDlEd8
	tYfMNw95VHPGCXbVyVaEc=; b=JBQQ8f0oU+K7TYKOy5GgG3cUx0J7ZZi/I44vCH
	3EXhBjPeYR1MqTsge4fJONc1Sz/lgplglxtV0zvBaaPBgnlsNFsfs3X+GWX19kXT
	g04lQADJIyO8dGZ+YstRLjX2jVAkZVmWj8SXi1rN7PA7vr4sda/KZbTZ+/lOpHnN
	TiOPjGqAmcZnBj2OjUCpwqJIIf6ZQI9pIX8WPJOk11wC2c8NEUxBnh4S5oboDYAK
	ni/BAt/BFZ7rIWwSR5cnqAbBWbH952LgS4nYklYiTWfEftvIMDAy+G6+6017TvaW
	5ik2kweD9sM8oALuxXsHydejEowGp+4Gys83vQvY7d/DFEeQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q1tap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f3c36dd2cso4428578b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946773; x=1769551573; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4GljF2FtDKElu8MwDlEd8tYfMNw95VHPGCXbVyVaEc=;
        b=dlwQDHLahOnQkPStfoIVLNeguVTos2b/oLpg/lhauKKffbGuNFf6j+KTy98pZfMSSa
         l1oPw3tg4M3mL1ozds3pzO7em/74T4XKNjjK4qeihb62afSKhSyei03I/1g9ZsUQnQ2n
         NI/0ABi8ZjI6Ee+zh67fpnK6Xz0oWrboev2SmWT8wjMoXMq8SEFH1R/nCpw4mWL6hWJs
         vHGW8rWCMk5hz06Tzc8GJJFURIhH0zxoOU7GyT8UuHJu6E+qenDH4Rjw1+mo5c2v6725
         f44iyKetoA4vuKXGdOI6Qvkbf6y5L3e0eFiSV/9NwO8D1EGZD0OhdDgQ1NPH1gsfUU6j
         Qatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946773; x=1769551573;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4GljF2FtDKElu8MwDlEd8tYfMNw95VHPGCXbVyVaEc=;
        b=EKPZGEbTdleqI1AxBOkSC6GWlWO3enu8dqbSUR+QXMdq1ZQHfwwEySke2ouuWi23Gk
         hDg6Ym5oZqAhjxdeCsjC0b8umyUbJ4Q1no8z2hV3d8wY3mm/y4IxpAfiRVFl2Whme2l8
         U3nCBCVtQAAZwp+BP85EjblYzqt6CzssAHi1A3BIhIKy7vX2JRcuik9YN0f4tbPjZSzf
         rmRcSxqCMMqS3Ktj7N5RFtSqusZBnhxXEIArGy71OS8+U1q6qKHJI5mmte15twjaToEN
         lhCfGB9KSppy5fRx5jEla4eabduxZaFhrQ4MdJHWBMxsvwtDPpbb6DFsDb6bhrjxkU2o
         /iyg==
X-Forwarded-Encrypted: i=1; AJvYcCVcNxO9Em/o95BpYzy/TE1SsMoTYF4iR6zQpkQiAgNj8ELIaK2gWIPtCLkKTPVzHYeUbZ09mYjZGJ9ZFxd3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9O4arpTSckUhSRLHoJuJOvqJykitwW3kfZC5dIFeDAnQKYR9F
	+ovW45+qmFkYJv4ehv1RrODRPzIGz+oobRhKU96+4aoIEN4iTBRSphQpm/SLRWSfGextBk315a0
	6UZ+tW5euLU9I7nPWP6vJvXenJhJdG3bQ3wMPlcIT/kv2C6Q2N6Yho2/pQvglTfeGARlN
X-Gm-Gg: AZuq6aK5N4FqBCBr3PH8tKUb3vg4EM4/X3Qc/OmI9mwbEsdj/FULSuYF+8TOImlH5yD
	69yakbqsL6QFslafv6Hnyd0aPsDE2/pMQdcWF9ezqhev7Cbh2RORzOQz94Bz+WrjAJZIW7j/y1J
	fzMfaYXqU8Ohy37SZMl8zNLI63qOPaS46PjnYxGjQpF0EOLomzW/Em+5xFD7u3Swg4ZoTsFXTrI
	JZROs2Vqu7k/TPolcde/nCFeANHkekixgTmbbtxAJZI/Y2V+tbEaI7BwvnpTk7eFIyAjO4aDuHD
	3dNVxpVwIQlxjg5ehRUlyCfd8ebNpvicgDffxDONZTHvcnndSYp6p1tF2+K7g2sh2WfeAIvzkxG
	eoRbDDTnmSVM18z2T/vehxW4RgCVxEm9n9A==
X-Received: by 2002:a05:6a00:3a02:b0:81f:4294:6080 with SMTP id d2e1a72fcca58-81fe87e9f5emr2873027b3a.20.1768946773445;
        Tue, 20 Jan 2026 14:06:13 -0800 (PST)
X-Received: by 2002:a05:6a00:3a02:b0:81f:4294:6080 with SMTP id d2e1a72fcca58-81fe87e9f5emr2873000b3a.20.1768946772893;
        Tue, 20 Jan 2026 14:06:12 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:06:12 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v7 0/4] Support for Adreno 612 GPU - Respin
Date: Wed, 21 Jan 2026 03:35:51 +0530
Message-Id: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/8b2kC/3XRTW7DIBAF4KtErEs6YBjjrHqPqgt+W6QmjsGxW
 kW5eydOpURuvQEe0nw8iTOrseRY2W5zZiVOueb+QKF92jD/YQ/vkedAmUmQWoDQfPAVaavHfOC
 Sx6C0gxBd1xlGM8cSU/6avde3Wy5xOBE73i6ZszVy3+/3edxtBjrwMD7bskfFU184biWw6+RHr
 mNfvudik5hHfzu0iw6T4MDBWatUMtCBfulr3Q4n+3l9ZkvLDE7yjgj4g0hCrAytV8kljLiCNA+
 IlEukIaRLKihv2qRFWEHUHZGglogiJGkL4LVDbNIKoh8QiUtEE9JoFQwqBO/dCoIPSCOWCBISr
 GnpfxMa0/yDXC6XHxUpNRVEAgAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=4503;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9qFuBOJpVm4NZ5jGLP9VDemKSpzt4dZj5vBYO/y0ZNQ=;
 b=SFJvj/OwQhzKaZu7LBOCkLayme1MJ1wDmFGR9S15KPB11NXSJCyo6p31ClGL7lTlUFU1wME4S
 UItKvlbxZMSCICaElyGGY3HnlOLd87FjUIhei6gOPPcCZuKImJoaiyl
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=696ffc56 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Vfy2LTQACiyTdmKGC14A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX1siXa0IzjK+6
 Zugtfu2g8rJ+SN7cupAHelnVdw3iAhTsmKTJd8hVZLGJRkur9QIyCf4shFJe1J5dOVKI7rc5wT6
 B6DjzwY9PDo6KC5xr5jCIZwdWcWoMickmi06aTI4IGWmmB6TCeQUgYDek5ZmGUTk/Wb445lZXE+
 lATpekmjwaJD83coysVq1oA3kVQDendNLfWb3BbXLHIKdYRPiXDoSs6nLoxndCdKaahJb/AqZLt
 iYaLrKj/rv7lPZSFqIgn5WoL0DU4YW5QcCGAZClQydHjo/ZcGeVUhh2YAwIPpR9EwC7EHo2R5Cl
 vCUA2i9NBN0p4oj1sS7AtxpGSI9xe3TZQnNLyC7Bh34Gz+wdaPbxfphzXjljh5SunJoR5pY4d7Z
 szM93pifrJbE5bK0NwEAFV5p7NL5W5XApzTYPZ4B7Qv7cvTjXeUrYsblsF0wOSuvaBx5sh8L7+4
 9AvnNENWSPVM1/QOkWQ==
X-Proofpoint-GUID: a6GRw84hMIEGSH-VGvR3b5Wz3pXqisin
X-Proofpoint-ORIG-GUID: a6GRw84hMIEGSH-VGvR3b5Wz3pXqisin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-89896-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4A1F4D032
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Bjorn, I have rebased the pending DT patches on top of arm64-for-6.20
branch to make it convenient for you to pick them. All dependencies
including dt-binding doc patches are now available in linux-next. They
are ready to pick up right away. In case you test dt checkers, please
use the latest linux-next tag.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v7:
- Drop msm driver and dt binding doc patches as they got picked up by Rob Clark
- Update interrupt property to use 4 cells
- Rebase on top of arm64-for-6.20 branch in Bjorn's tree
- Capture trailers
- Link to v6: https://lore.kernel.org/r/20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com

Changes in v6:
- Move the rgmu register range update from patch#8 to patch#6.
- Capture trailers
- Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com

Changes in v5:
- Rebase on v6.19-rc2
- Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com

Changes in v4:
- Rebased on top of next-20251204 tag
- Added a new patch to simplify gpu dt schema (Krzysztof)
- Added a new patch for GPU cooling support (Gaurav)
- Updated the gpu/gmu register range in DT to be more accurate
- Remove 290Mhz corner for GPU as that is not present in downstream
- Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com

Changes in v3:
- Rebased on top of next-20251121 tag
- Drop a612 driver support patch as it got picked up
- Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
- Remove reg-names property for rgmu node (Krzysztof)
- Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
- Describe cx_mem and cx_dgc register ranges (Krzysztof)
- A new patch to retrieve gmu core reg resource by id
- Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251105
- Fix hwcg configuration (Dan)
- Reuse a few gmu-wrapper routines (Konrad)
- Split out rgmu dt schema (Krzysztof/Dmitry)
- Fixes for GPU dt binding doc (Krzysztof)
- Removed VDD_CX from rgmu dt node. Will post a separate series to
address the gpucc changes (Konrad)
- Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
- Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com

---
Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (2):
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 149 +++++++++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
---
base-commit: ebd1eb365caef3c815cb8a041d300dfe4263faea
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


