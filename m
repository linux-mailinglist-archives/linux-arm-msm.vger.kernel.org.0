Return-Path: <linux-arm-msm+bounces-105303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOGUHN0Z82nNxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:59:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3D49F8E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB7BA300D164
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55E93FF8BA;
	Thu, 30 Apr 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCOD7gsP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dd/BVa4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2CC3FE675
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539545; cv=none; b=HrDZ8Xrq7/VdbhJ6B+HqdNUzcoG6xYkEzOBXKG80a0P2JpNEJ1LG6lWr8pGBtkba35KSOI3xrl1hnWqjkG4SnWwFCn/aGAQfMVV3irDUDSauHepf4TaMUVOa5ybO9B8KgSiY6UIbcsGkZvqco77nGPm9xUaSgMUSHPBvPOfNruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539545; c=relaxed/simple;
	bh=Zs3IMLtqAkbwUHAf/QdAsoBDB/l+4Bu7+92+/AwBcA0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mYy8dYBqPd7BbvUpl8zO4GzjAlOXzUY0iQEux5LR5GUuL+7TYVVxSQeJK3evOzH7rKIyOj0u7CgSs1HCMC17Vm3ofDrMqRq2//EgQK6IkHUOqnkZ2lk69jvH8onQCIFQElSjtx/Mho1CoaDrNYxJI1GkVuou4+9noP6G+lt1CsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCOD7gsP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dd/BVa4s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7a2Ki088765
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qyhAeQg1B8d00qwgB1zKLT
	aXgj+2kYZznOQT2W+FINs=; b=oCOD7gsP2jIP5etYAsoVl/Mp8S97Mew+bNw7lG
	dGM8nqln1Q6dnVvyJ7ZaE8mi3OfNaGLmM4TwDEAXGT6k5a3CmLk2P/+ndnc4kby9
	NKzXGrEerJD7XZqVXDk5xjLUVXDmnUNqlbrA5srt714GErJFz1NPYwN86R7a5s5t
	j3Wm5FPdzjWO63jNfY2vyhBX8EJgh6LbdVP7K78QEFozMIgZsaOkRFNBVB2PBrx7
	Htt0hzbJiCkJS5wuBIpB8a3uuscp3kKxjrTmxB1/hHUzSXbAxjd+NfhyWGC9Yai1
	8OtbY57/HCNRB00VgpdrC1i6lVSz35d8iX5H4RGT0053qhXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u40arm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so921990a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777539542; x=1778144342; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyhAeQg1B8d00qwgB1zKLTaXgj+2kYZznOQT2W+FINs=;
        b=Dd/BVa4s87APnvSHvg1ZK6Q/1mObEYsWlwg+ityoooAxpZRfRbinTA6XCVcFvl2dKd
         C0pn5mUSA2oTpqbGS5DvGkpC9rOYMtt5x1FICRavQom6IZuhX4JO1ny2QAklvL7Fpp3b
         ZwOKCFPX71VE7es46e5mMBSqMzjAe78GJj7D+LRL17h/Vy/a/fgP5ZEAT36FWqiyckf9
         VDgLBtd2mt+v6E6vafpfMibHc9r4g0Zx2o2pwB5odNjQsYZIhOmn2/s5FzrXIDdcc1TO
         Y3NOlbL4z5x+O+zqrGRc9aKdJtDlhR7NcbA2o5zw0TEyzGnLA7fy5oAFoUuFcD6Bu+J0
         gF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539542; x=1778144342;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyhAeQg1B8d00qwgB1zKLTaXgj+2kYZznOQT2W+FINs=;
        b=EpawF8dqq0SieQxKKkPP0B7WD8//IRb+b3LIdP4n4Ro4XQDBxZ7aNqC2KW8waO/v9x
         JzDIPAYoLYOTcqSdHdQ/HRSBqXFxhxdHLuViR83cKHYTaVX8BYdDHfnzUkGKERU8+pTY
         xMWyAB6i7IOdVbpi8sDtk5o3u0vgMheQthMvCQy2XyZk7B3h5gWAYqVlWTFgXzvt4WOq
         /EnPgA1982eRcopOad0ALYa56JmSDGtS2bnra78Yy3M7ADgNeOVNGLHMgP9P7ncPGHmf
         wOggpKujiA2vBa79zaU4CHwZc66l58CWzuB0Zqg8aYKv57Q3lvJyIdslYxM5LfpWycee
         +Vpw==
X-Gm-Message-State: AOJu0YweEiyIgk72o/p9jj81gQOjOE0gCKqqjYBEpKPFG55fdBpRQfIh
	btqYhwyhwLi99VXh0pAyDy6GDpfkWZ3uBx2FUnuSUvK090NaGkmFC5qWnc0BUqiZ/uzU8IMfmrI
	b0mB75hpD6SjOsjUxBcLz4zibHiCpXmU28FIiLhXHu1Y7QDWy7XvrVnXhifIoSOFDRDNk
X-Gm-Gg: AeBDieu2uaqFRXelorAmHNTNQ1zQp9svaV7SnfLXHoK5Z4+7O5sS229QvckMuR+SZxh
	APeZj+ZcIh836rib4LfXV0IMo1PQQcKhF6mUrunYW7ybzP7oUrvBiSCNyXotmbkacp6E60kAET7
	DcXGDwFI1y+kklAIvOFI7ijE81r0zgsaN61kgXIdKxuruZohMDGC87EEz8Id3DBKJztdznYOtej
	CAPtLFkApSyrFXG5LmGnacLNKtNDWsycnCKvpo6sdwhoQFtXbkxRdFmzgfkz+Z9e+U7Me5WSqFa
	zepPhw318DJLmrtjG9EEoJbV91W5sU2/W7emwS5jwd7iCQwGz/OX0G7wFa7avFuJz8lG97a2n+O
	hmrjD0eQv+RrYqCcTqMGilSqIRo8cHgVZcCa9UXy8/cthQh90STE=
X-Received: by 2002:a17:90b:3a83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-364c49df0c5mr1696895a91.14.1777539541641;
        Thu, 30 Apr 2026 01:59:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-364c49df0c5mr1696873a91.14.1777539541160;
        Thu, 30 Apr 2026 01:59:01 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd5249c9sm1267312a91.1.2026.04.30.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:59:00 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH 0/3] Add ADC support for lemans and monaco
Date: Thu, 30 Apr 2026 14:28:55 +0530
Message-Id: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8Z82kC/x2MSwqAIBQArxJvneC3RVeJENGnvY2FRgTi3ZOWM
 zDToGIhrLBODQo+VOnMA8Q8gT9cTsgoDAbJ5cK14swFb2zCrGy4WRxKC2MQpYGRXAUjvf9u23v
 /ABgRzfpeAAAA
X-Change-ID: 20260430-adc5_gen3_dt-f0434155ee25
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539537; l=1351;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Zs3IMLtqAkbwUHAf/QdAsoBDB/l+4Bu7+92+/AwBcA0=;
 b=+KJv/AoS3GKdBpSIgZrb3it+Fd0drlAlw3uA95+37BXh7xxwR5bAvYPzjG/b+KU5qAOxJjlTG
 vkpsFnWnlK+AsUt/kQWi+boNDb5NU+xCl283kBaG8kYpF/oIwz8H+QS
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f319d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=D-B44Iz52n0xy1KjeIEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: cCuk_JTzLUNvl1oC6ZKp3MmUlLzLnaQ-
X-Proofpoint-GUID: cCuk_JTzLUNvl1oC6ZKp3MmUlLzLnaQ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4OCBTYWx0ZWRfX8OUakholQe+I
 5ppUfKXmCh5zpL1EFcvwP+mvdUWOItTyV2xHvt5lB/2BbLHISzMdVE23BgmIC+TxyuOeTUHnQZ8
 lFlUjJhcKaCwE5/7p2nasVcUkaY5Juyx36vLI8rpJjCer/YeMoRYoHHfOyaWcUZfZwsl0/0TXvj
 4LcqPeRcf6dSHwY4K97cztmhu0qQvzdXDOKrX76FFRk8jxoGTE9/9DEym2N9bTC5ajEt54qPoz1
 M6QguyinvxT94TSR/Crqs0SVwrbGggy6w0zUw8ffOwv8itDisZFln/EMK21MJET//LsILz9GcJL
 7KaeP4HRg1OjK4seMZz8moEHQdnkvasYIz6akR3hqZgF9vCmdEifo/TBovBpGUd8JewGgRb6RGM
 0CWShTwxlY+fSFPd3XpriY9Xrh/lBhBTrHQmH7hVaShqadEZBKum2elDoAO485edu8s87PQStOe
 pBW5T5L/iqvL69Gc+Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300088
X-Rspamd-Queue-Id: CFA3D49F8E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105303-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

This patch series adds Gen3 ADC channel macro definitions, with basic ADC
support for lemans and monaco.

Patch 1 adds ADC virtual channel macro definitions, which are used in
the "reg" property of individual ADC channels and also by ADC clients
to reference channels. These are a combination of PMIC SID and HW ADC
channel number, which are parsed in the driver to identify the intended
PMIC and channel under it.

Patch 2 adds ADC nodes with channels under the PMIC instances on lemans.

Patch 3 adds ADC nodes with channels under the PMIC instances on monaco.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Ayyagari Ushasreevalli (2):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h  | 88 ++++++++++++++++++++++++++++
 3 files changed, 224 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260430-adc5_gen3_dt-f0434155ee25

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


