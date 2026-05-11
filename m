Return-Path: <linux-arm-msm+bounces-106998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOl1LAM3AmocpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:07:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35245515796
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DE5530531E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 20:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D6037F754;
	Mon, 11 May 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEU1xxLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NG/u8aRH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504F22F8E9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530049; cv=none; b=jLZoD99nQTr01C5Llztamm7NLOoHEVQJp8KFcuwrKeaZm51wzf8HjwO4yDQABbgaWf4qY2nvBG34O/H+kCyQXpX7WVrul7G03MokR2Ua1ovyV/X8TcC60Hf9mipVPMEB2tPsOxKFOi4Po6lGbkshqTBMbn+eI+3u8Obgk22EAUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530049; c=relaxed/simple;
	bh=qNkWrZGsSDaD6GrYCTVs1LnnBLeedST67BI1LcY7DLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Umd9gmR2XX/Vlw/5kSL30Ix+HckA0csUWHoGsuv3AlbYbPkrBZ9zCtbHRXfzHB07ATzYsFuNmkmzEIi9GW+ErLaLP+Vo+aE9QczT3BAUOxHJCHBTJPyNUnhBzYJ/+U1dQfl46m8tJbOJkFtgltONkq1gsgDrwKXZeGKzNLvErFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEU1xxLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NG/u8aRH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6R8f1183963
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zt0Wfud40//59YvB4eTabQ
	hvDuaqsHejQA1eTNLDMFA=; b=GEU1xxLyPdyiwXcFM3xamwzoVietPWRBRZL20+
	rJujlGDYZYpfhkLAtMPeDFiKX6DDIBRrfP105FgzBKwyHcEBggnC8FkbZeEnUqYk
	tR0Pb6/aWMzpUn4Ut2OqlsUoCFT8eB10uIjtY+OhxrDWwhvj4DanQ2MIwaaRReRz
	mpbveFghUbcn9QWcwW+cLP5XQqpDt9aIuHxPB3Jv/STo8Ot6bmRucju4Cw3tpcUK
	aDd4gLCLIZqV2vnB3UI46NRCxMEagQqJpwklflf/x6UqhBmAPGZEiGqXt3axbGCQ
	bpXC6nGeBRYuYBy0BOPtYqMe7KjpFHml2DB6+qqpcQrRMHzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuy803q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso5551347a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530045; x=1779134845; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt0Wfud40//59YvB4eTabQhvDuaqsHejQA1eTNLDMFA=;
        b=NG/u8aRHN8IoWCfcII4g28NBUO74d67vkZGpW1jKozyBc/4DxbJb6Sf/RHyACM0SfW
         NNGgxpbbYBuoCS93NDme/uerfKUbTotqUEw3EVWs14t+2uRP7g4TWS/AqQaxXKwIYvZa
         uCrQkNlTfznrwdjWWQJZKynU5t4A7onNoGhAjB8YbMOi4eJNxEjFDVfacWWsGy63IzSg
         M9mYvz4hMBVqN3hw0ObI58vcWusEKfSNb87lHMbAqd5TUj3SRBTQ/Kce/1n0DxRy9mYu
         VF1A0x2WNk3FDxpN/l/UnlwDF9XrCIzLaSW/t0dcVAIMDsQeEIGwcifVAO61ah0FrgI8
         oMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530045; x=1779134845;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zt0Wfud40//59YvB4eTabQhvDuaqsHejQA1eTNLDMFA=;
        b=j3f9FXQQZ2MxgDYzBUdHYKBixp7VsnrPwSnSorJ69xsBiFqb8cGfcJrpyjkEZoPyp+
         +M+ADDqxI6SE7hT8iRfsnzK2ul1/yZcq8tHwl5anQB2I3U2DlsdAchzxuDAPTeE43fO3
         GkIYd2l7Mms9bmOxFyST36NISk8BC/TD/gyoRTnixQf3m49V6J5g05esXI/3hjwuAQvd
         vdRNXbla5ToiF4dQtCPVQBJttczi36DDkeR/OJh4mvf2csjBrWVLSYp3+s5gQXwSFmwn
         l28YxdZ1Vnlev3Y5PexsYxKqz1TSwfqBzRSWI7KSy/gvy9bzqiEfbNas5kgK+W1kC6Y2
         ta2w==
X-Gm-Message-State: AOJu0YynacniQcuAf2ZnLvxgRjS9k2SGydYHOFKjOCYDlXT2o3AC1mmD
	urFqJ4JnrdspnSxvfPdt16FySKxRq24D/3i0c69cp7JM1mxmLJ6LEHau2w480r6AGeUWbOpUJAv
	06d3ivBev3sFdyLhhV96lRrc2jZR2+1gZjWnNYefhuG+dMj/MokyPu6skBExI/JEJbB22
X-Gm-Gg: Acq92OECFh1fs8LxJs29OsJdLZFTB7AD1ybgr6B95FINUiCTxwUWGr4ZY1N6DLwIExT
	+2bYq1cINqvY3BBeK8DB29W+d6sXW0MGL0xPYLmgHag75FSU9/Jy65tg0iZlO204nPzyirE+gRw
	BGcCTXwRe1RS0JKpDvtyazhccOJ3l0ZXDMZ2vx3teALXVp5R5aaHog0O43AdGyjshPF0FKzzZkM
	7SowVHig0009/C0Mj8nUHDViTb1p5kSIH6y900V1jFyAWG1PreoMuigojK33+EezuZ4iS1QLf6p
	nYcaFDlkIRgWHtQ6V776UUZ3qKZoM1KXQEfzLH5XZEOO6CauzfUMb1cSrDozMHpkVEsoPomx8N1
	e/2Kw+TkAPDcyyugZAsFhBH44ray0ZLdeD7qLo+frwxKyKA==
X-Received: by 2002:a17:90b:3c06:b0:368:4a6f:28f8 with SMTP id 98e67ed59e1d1-368ab827fabmr720610a91.1.1778530045126;
        Mon, 11 May 2026 13:07:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3c06:b0:368:4a6f:28f8 with SMTP id 98e67ed59e1d1-368ab827fabmr720574a91.1.1778530044585;
        Mon, 11 May 2026 13:07:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Devicetree support for Glymur GPU
Date: Tue, 12 May 2026 01:36:58 +0530
Message-Id: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOI2AmoC/23PbWvDIBAH8K8SfD2LD9MtYYx9jzGCmksq1Niqk
 ZaS7z5jBoNub4S/x/3u7o4iBAsRdc0dBcg2Wj+XwJ8aZI5qngDboWTECJOEMYmn080tAU/nBQ8
 Jc96CIG2pSY1KzznAaK/V+/zac4DLUti0fyKtImDjnbOpa2a4JlzpZ062fgcxqjq0a972AiU/M
 3vnjOmH1Bs/j3bqM8OZY4KVMdAOlEh4YR8+xsNlUadtwqE872hb42hj8uFWr8y07rHjRDwclGk
 RGeUCNKVGyL9iBTP7RQShjwjbkJGyVy1EK7X+B1nX9RtvkDAifQEAAA==
X-Change-ID: 20260226-glymur-gpu-dt-339e5092606b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=3130;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qNkWrZGsSDaD6GrYCTVs1LnnBLeedST67BI1LcY7DLg=;
 b=Qb1B/FRS3gBmWvmRgLXggX/mx3UROYPBmpSOSybuI+G+3XRieCnKXv1FpLxhqCiPAnmGZmPGs
 76O2dUM75BVDdsCuSLX2q56jfX33hxmdZw8AMf+H3g+6x4wBUWVzGiO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: qxT8TAad9YjMJhA_N7gN7r141PJAgCn8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfX4QQFopn+l722
 pu7UhD7lF/NHVZHqgJRDIuLIkzbKz4wOt5fFMggtq5TL5oZWI/MmMkmHYJL1dNdTS2hfQneiEWC
 iTh0+GykRajKv6padJccGZdGyigGiGIbSVK4+SBds3I2T9N00B/HQ4iT7iUTQzLrFkyzF70AUaQ
 kmP8o3Pkc8YaKYt4wSX/T5t4AwwX+aRB8MCPc4ZaeDN5O3oJukcHtAo35FyQzwpUhxVeUCsGwo+
 bsZJ+hoa3uJcldn2DwWyQI7D083KwZivTRM6UK3/qJeVyWf8jRkWbk7q1PbpB5NyVv4oFYmPF4+
 RaUScGxKFxQWZ/RfdQsq9ieUYLQsM+uIPSR+rR4PoL7i8RiqprQYzuU4+ET28BGxWqAbZKELsuM
 bDGqBVQG2z2ncHzoaocPB4+V+WoxiBKQCTacYOQeiF1FPdCOxuL/h8ndeNoLltDI1kz2IshwhC0
 yU4nln8hfL7XknOHXzg==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a0236ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-08r9DDlpfC4vgu8VQ8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qxT8TAad9YjMJhA_N7gN7r141PJAgCn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110213
X-Rspamd-Queue-Id: 35245515796
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106998-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds the necessary Device Tree bits to enable GPU support
on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
chipsets is based on the new Adreno A8x family of GPUs. It features a new
slice architecture with 4 slices, significantly higher bandwidth
throughput compared to mobile counterparts, raytracing support, and the
highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
improvements.

This series includes patches that updates DT schema, add GPU SMMU &
GPU/GMU support. Keen-eyed readers may notice that the zap shader node
is missing. This is intentional: The Glymur-based laptop platforms
generally allow booting Linux at EL2 (yay!), which means the zap firmware
is not required here.

There is an update to the gxclkctl/drm drivers to properly support the IFPC
feature across all A8x GPUs. That series [1] is necessary to properly
support Glymur GPU:
[1] https://lore.kernel.org/lkml/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com/

Just FYI, on top of the linux-next, I had to pick below series [2] to boot
the device properly. But it is unrelated to GPU or this series:
[2] https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Add a new patch to fix RSCC base vaddr in drm-msm
- Remove interconnect property from adreno smmu dt and the binding doc
- Add a contrait in GPU binding doc to limit the reg entries for Glymur
  (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com

Changes in v2:
- Keep GPU/GMU enabled by default and drop the enablement patch (Konrad)
- Drop zap shader node from DT
- A new patch to update GPU SMMU dt schema.
- Adjust reg range in dt nodes to avoid overlap. 
- Removed cx_dbgc range as it is already stable across chipsets. This
  region is now part of kgsl_3d0_reg_memory range.
- Link to v1: https://lore.kernel.org/r/20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com

---
Akhil P Oommen (4):
      drm/msm/a8xx: Fix RSCC offset
      dt-bindings: display/msm: gpu: Document Adreno X2-185
      dt-bindings: arm-smmu: Update the description for Glymur GPU SMMU
      arm64: dts: qcom: Add GPU support for Glymur

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

 .../devicetree/bindings/display/msm/gpu.yaml       |  17 ++
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   4 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 221 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   7 +-
 4 files changed, 247 insertions(+), 2 deletions(-)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20260226-glymur-gpu-dt-339e5092606b
prerequisite-message-id: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
prerequisite-patch-id: f7ab29f2f0241b6536d3b0c0593f0baa0e435221
prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


