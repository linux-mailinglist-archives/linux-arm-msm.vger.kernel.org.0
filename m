Return-Path: <linux-arm-msm+bounces-73314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E950B54B35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B7117AF3C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9A43009F4;
	Fri, 12 Sep 2025 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CI5F8IAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2782FDC22
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677182; cv=none; b=MLFK9yeJ9HtCJmw7rLpV4bJvGaJIJUhUr1jLPB4EWiDF+AzDkG7AFl2GizHWbYklDz5bSZXK32C0ct2vRG2nGRQ6TGoTmZcFfQ99mRIWwDfU00hqlP+XB10Kgwo4OQg1sssGrzoNZ60h27cq0mDAqXA+6U0+SjR/mEm9A4TB+7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677182; c=relaxed/simple;
	bh=jJaKwtw9u/RInTyEr63Le7/5O1dlIWRXoH3wFolu9pM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qCLfiuS86tJvcSZKUme79yqWdvWsdCcxxSQXhaBe2SvLg/hw604h4iMiBolFiYhjbb3Zbw+G92GNgdLRRpcG8iKQNN6Y2lkb6oqin5rAcYi7uts/7Pgy0rZnXBYuZrFG4x5PMOTaL0Ez7OzIUkD88/Q0ZJ6J5a/AYRZCjixkXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CI5F8IAa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fWPj014362
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PykDANlSk4R6a44QfGxuU2
	LMLVLao9uUaS064vEz4Rw=; b=CI5F8IAaL22LIdgNCh3lgNbXuHEmEpZaJXQnch
	vBiVaHRyO2gUOQGShiQUNnMZq4NdDrgTH/rpLi+ld1luFBxQ2IgoimrrbsEipct6
	KXu7AUVD1F8smoYOLPSEXJcYEYsG//E4OP2+5oBuHYnikikwLzuOM4fqLr6utxCB
	rdKYWOscNN943Npbxid8X1WV5+3neX39cQkGWOPSujNG2E7VRJLefrQ7yx+WseWq
	FDzCnkb2X8wclmNwEC/0QX91ArRRT6irbgqZW4el9eU8v2MsCOoMXptNGhsx536e
	m52cj1dw1EZTAVxswKZA0tR1ejDLVvuY0y+Np95Gv09b3A4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphw6x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32df32a3644so56294a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677179; x=1758281979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PykDANlSk4R6a44QfGxuU2LMLVLao9uUaS064vEz4Rw=;
        b=ZFTsFg4BVMDI4fDxmeDp4MXHAL1LKIo4fFh2s7Y+pS7VMbDEBYVP9BVJC0e61pE/6w
         ZSNzE8jgZ5fLbSSn+ynsu85Li5WST2opS87yqIt8f6nDIQUkv145okb8oAk6v58t2TDN
         VFDdtSd3iqsfsSMR74NOfwB5ag9WNjp0ar99So3tCkk79MC6UpjSQ8z0qrMUxOByAu3l
         Ujsaiw7YR9O37g7eL47ZbF0BBTi/izNz4jD2rVci0GRIjZVKqOe9JF9Z75o3L1SUvLWP
         6BrjEzTSOhusNAFWPstuXm5sAxN8eJ4e1y0cwa22/nSTGqF2uBjLIWbqSdQy2glI/t49
         Jkcw==
X-Gm-Message-State: AOJu0YyVpWWibxnGY9CBeGpgkNAZPsg4ZZnQMYZ9e1smBq4OkfSFupzG
	NdgmLzxwlHEljV+DXdkmxyVqkQeuvwpINlOJLLXXFCDUovwge9JXu52X5mEMvuEzv3HnEU3K0Kx
	NcQWs67Xd1tsw+narv9pVlpq0jbDzIXKexItnwclKL/mxe0pGCFJHOhdWGEJyHL7AHz8L
X-Gm-Gg: ASbGncsSrqrNQARtVVuh4rx80YvYai6+JKJu98RYlTYiPhSaC/zFc7npiY1bKjR2q7r
	fPxeIOOkEN39G+nun23X/zxD1gpskOIfsCbBg1zOSzfMfgwYbi/BZr0LybNhAjY/UtddqKv07H5
	E9Y+BzXBfG3b/3zaqYpVuAAiNadJ3NaFXb6guyZAuflQTrG853aNkGM+5Ik6ZsAJOh8f5DDI37V
	h/PyYi41zHHM4odVIz6iW76CCKL2i7SB7JceHFkdu/TMO+9W6L/LSBVxfnhIkikFxuOMkgupNk4
	5dQxnKKukg+KwcQ15sN6u9/5D8VWWThw7PSVd0pdRQoUTLALfcwlEq5Wxz+gvl6D3Ns2Qz4WErz
	fkkNXeb/VE+HQI143uTYBsP9pRwmZLGHSqUijf0AdC1DvlzYjfcbb+vXo
X-Received: by 2002:a17:90b:1b08:b0:329:df65:de88 with SMTP id 98e67ed59e1d1-32de4fad5c1mr1619904a91.7.1757677178538;
        Fri, 12 Sep 2025 04:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb9/qfSDeeJM4k/mSV2bhoe+sAdxJ9belpgwJvZWL3AiibRSUg3vhUglLK/FGes1kYgelegw==
X-Received: by 2002:a17:90b:1b08:b0:329:df65:de88 with SMTP id 98e67ed59e1d1-32de4fad5c1mr1619868a91.7.1757677177899;
        Fri, 12 Sep 2025 04:39:37 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607c45e34sm5278760b3a.91.2025.09.12.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:39:37 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH 0/2] Add dp-controller support for sm6150
Date: Fri, 12 Sep 2025 19:39:15 +0800
Message-Id: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQGxGgC/x2NQQrCQAwAv1JyNpBdaUW/Ih5qk62BulmyVYTSv
 7v0NnOZ2aCKq1S4dRu4fLWq5Sbh1MH0GvMsqNwcIsWeriHiyIxccLK8ui2LONZPKeYrJmv8HkJ
 PyBd+0pmJhpigpYpL0t+xuT/2/Q9oQhOjdgAAAA==
X-Change-ID: 20250912-add-dp-controller-support-for-sm6150-d7db03d0062f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757677171; l=865;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=jJaKwtw9u/RInTyEr63Le7/5O1dlIWRXoH3wFolu9pM=;
 b=GqiLToS8NHqUmFLqN3uA43qTSnAHpwgK8phMB7Q2jeQrhHoIR1sFeeVkcrDx4h37tHXsnWmsE
 dg80WW/3tZWBxK+84WBbYMpFH2B6DOuQ5GFLMgjc3pyxKybCSJ2UhoV
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c4067c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jAdeW1IC_iKJYOCu1UcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: SGhDm8EvC1p37TFFY3qi-Hx58GJa_bLb
X-Proofpoint-ORIG-GUID: SGhDm8EvC1p37TFFY3qi-Hx58GJa_bLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX/gPnP2KcOUB0
 mo+6i8tcMByFpxC0ECae6Vz36eVTvBcpuFw5+h8H2S2PH9B6SXpJmrEQbNZGvpl47BRV+5McAm2
 HAy7R94rsroNPu/A80sSY3Q6+o3a1wybNTPEtdARg0yfbQ4OM3Ld0M/GBOnt/ycdeKnKLCUS9lR
 cUevdVXUC8+quke5IBEDhYe2c7AOHhw1zKDBNVX7z9lnxowNPS4jwyXAHYGjYkK2uubzI/EHEoR
 kUGEreG5TCAIvklBbJqsbY+Pmh3dngH645M20XTN0L/Jds26mliG6hGC/BaFZywtDWScQySmGVw
 I/auejNKURDXYxZLRWxHxJYR1Mm3aoJhUeXmviIZMm25ALHDVFb33lMOy+bTWm+ylmny18Kx1Ll
 jpdAb4tE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040

This series splits the SM6150 dp-controller definition from the
'[v3] Add DisplayPort support for QCS615 platform' series and rebases
'dt-bindings: msm/dp: Add support for 4 pixel streams'.

The devicetree modification for DisplayPort on SM6150 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Xiangxu Yin (2):
      dt-bindings: display/msm: dp-controller: Add SM6150
      drm/msm/dp: Add DisplayPort support for SM6150

 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
 drivers/gpu/drm/msm/dp/dp_display.c                              | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250912-add-dp-controller-support-for-sm6150-d7db03d0062f

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>


