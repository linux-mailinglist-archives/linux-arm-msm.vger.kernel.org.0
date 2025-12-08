Return-Path: <linux-arm-msm+bounces-84669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E186CAD2AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43CC13035263
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFC53126B9;
	Mon,  8 Dec 2025 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfUN3uZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9xZa+JC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27BF2E9EAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197602; cv=none; b=q5IWrdHdJ/ofknaN9FK4KJKH+rW+DA5lE6oajloMV0qaOxQIjzTSWUIg8jhpljq45Is5CCmRINN3Xim+0OZ23LDKGSbR8eYeRWkeSQH645Po3uxEoRdYWzMDodDEH5TnoHUIi627sY1qzD/Ch0AbEb0X+zWxajr1w64LHlJLGlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197602; c=relaxed/simple;
	bh=h09LMR41yVHB4J1L0Po8rjp6ZNnEgMepTaZhyCkbny4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dAs55IpuNFfv5pFlV7tGlLiqHkOBBiW81maDXReKfeJzQeheB8E8qPD6c2ZiojSERq6I0/5DixY4u/XCFz2aXTVaahJfqviw4TREKxefRc7XxN2FwwOUhtutKx5ZIYB6afy4a6JstFH6swoCI7WVPlyyxIZerNgNeDMp+fKkaiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfUN3uZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9xZa+JC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8B4ZZ51130862
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 12:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FuvIU0TI/8CJcpEi7UoMwK
	ILqR/r+57ikEpc/rTIFs4=; b=OfUN3uZe7vhji5z5RVqz5Jvw61fWnV7wspD60D
	iBHzuW+XkXg7EGEfuesPuAHoKiJl8qFgij05BkRj4CsseqzrysQjdtkD1Cisbj+7
	IIPUWZqPo41o03X+zQH90osNSHF+vVZSPjAFEFXTGmYQKz3gjUr8DGWl55fiCNDX
	SKBPBIiX5X6LLqywCN8W06If+JnwpTcpBZB18YGVGVcZPYosuz1p52t5SqU9dPM6
	VIr3ehzTIwVi6wt0g+lbvBCJoUWfYqAEtgqhnolvqvn+9Hqh1So/RHl1KEpm2/sG
	KbaKcik0wxrq3OCnR5yBIi1OUFHFRcc3t6yl8UbwAgbVuzew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfr888y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 12:39:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34188ba5990so10334901a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765197599; x=1765802399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FuvIU0TI/8CJcpEi7UoMwKILqR/r+57ikEpc/rTIFs4=;
        b=e9xZa+JC2QfduzXfalgaL0/3R2AK38Cqiie9D2tk0fNfhC3tMprYaj9Y3s7NvDfZDl
         XGzlu7uZ1x5DtqCwjsCb+zOMvza2El1ydOnfCsSLxtcIyYGaTHvyaE+mQ+3jz+joG7eG
         xwfEy9hr0PgkiYLpwkdcISF9VpVPRseUx5nLORbmP3WVFsssElFVHTzPmUneymeU4Ier
         BIWehh1xrkPPd3iJqhqQT2MGkcGX4CAo4TR92cEXQ0guC5ntkDlaR545uIZoA0qBsEEO
         YwcIszixpRxHT1+/ii9lcIMnQipUNHc41Qwn8zucnWppu5yCtJZlF9MrzWrC3UmWhrBL
         Bt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765197599; x=1765802399;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuvIU0TI/8CJcpEi7UoMwKILqR/r+57ikEpc/rTIFs4=;
        b=H2Jj7kL2cPwrbEMJ21HZ+UVbgzkJMX/A965TyKZf+mXTgMEhQRLFL3ZYYT4OPC6tFj
         MlltJupJYK6a8kyIqMLUTfEu8oD+mMAGhd+B+JxL0vN9I9YIZJlsVdOF/yzxjqn/OOqB
         0HVXslxwG7hOPuaNdyFY+J3pDEWC6fyi5yMiSrVoLfUZWkoNzlwQZ4pDbkzA5zE05qMD
         mUnrE4xqsPCb7+P8WgAme7XW46VQ2pu7/+FvZMrgGYzTKwjhpcesjYqSSYWMBmlXUKHC
         4x9vazY6Xt2Ux/h0PuQLkZcjzdm83vWgwJIZX3C0elSWfAg3ffllBS5YLU/Th+AU7lDG
         MKiA==
X-Gm-Message-State: AOJu0YyW7wF0ngu6eKE/VWJw4dZFLr1+Fgq52/JSz7vtlA9+LXhgotAV
	BOXrKW4TzlIDjEfprh2cvtXP9J/JbS3NFtwDXgBeQC8nvWv7613o46fiEviw+A0oGFLMhyUwY+d
	lIM2ALKdknYRfi3+8QU+zZA5fcsnwnPJbfJMhroLaEbfifxPHbR0pxnWUkf6DuUQLMYu3
X-Gm-Gg: ASbGncu5gaRm3mgrys2P4yU0Mj6FVTn+uvaCP+KcVSOk9JNnWf76KKY7mZzaziyQRRk
	FJ1KOPbFYQeZYq1rRF9ISkN5CxQ/LnzmkoQnmiYCnAZomchI11TH6S0qFqTzp43leiKZR2171NX
	ogWTF5vOEZSQNTxq8vV9tt2AvMyEo1ySxBTkmA0/jTfj55HZ+ooyfqJeKdL4y4j4nfxsMBPWxHx
	1utQ4qIL8/5y9gzvoUjsVpuRTN4wn4p29LxHNKiprbHdDFcnzqOxeWjLfMqqcpZX1+y1fBicolt
	I0ase7gZWaGtGw906vmLVm+e5bCAxpquA/IQM6MSLFOwCtc/+tFAlRbID4GRXEVIdU931t4YwhR
	TAVVCnxH4PHdpaw9fivPw/0Nbngw5lEOnr7jonGuLbT8bYsZ15t/LSX56wnhetsNN
X-Received: by 2002:a05:7022:670e:b0:11b:9386:7ed1 with SMTP id a92af1059eb24-11e032d4165mr5997612c88.46.1765197598532;
        Mon, 08 Dec 2025 04:39:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6TYkYFlcAlSzDWAEYJ16j4oEkj16gJ5sBIe9Dv4TWQcrmQgV+7LvwaZk9bo2cVKJ4VZVAtg==
X-Received: by 2002:a05:7022:670e:b0:11b:9386:7ed1 with SMTP id a92af1059eb24-11e032d4165mr5997575c88.46.1765197597913;
        Mon, 08 Dec 2025 04:39:57 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm34902515eec.3.2025.12.08.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 04:39:57 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v9 0/5] media: qcom: camss: Add Kaanapali support
Date: Mon, 08 Dec 2025 04:39:46 -0800
Message-Id: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLHNmkC/43T226cMBAG4FdZcd2JbOMTq6rqe1S9sM04i3axC
 QaaKMq7d9hECVKLxAUgW+bz+JfntSo4dliq8+m1GnHpSpcTDZpvpypcXHpE6FoaV4IJxRmz4No
 WyjwMeZwg5hGC60uBnODqXHKDu3WAyuvWt0qwBiuChhFj93zf5NdvGl+6MuXx5b7nwtfZO88aI
 eGahpWEhQMDb0SrW0THlPyZS3l4mt0t5L5/oFe1Uov4/J0zLo9UtwiSozJSeSfaGJsdud7Ioj4
 k1yQz4XxoHGfGxx1ZbuVDiS6SZINeWhlso6zakdVGrtkhWa1pWOTCo6tbJnZk/SVzfiwNTTJHz
 WprrHIWd2SzkcWxmg3JLQoTG6dNQL0j2418MA271ixrZ4VWqNH+R357v9EjPs3ULdP7tf5qlvP
 p4zIKmAtC78aQYcpUb8oTLegdLfNzjDhCmntPn+AxMMO9lbU+U0Nse2/DrfUn/APhlsMVugRLX
 P0pXLr0CDdqKhAqeo61sUE2H1KPpbgP6vtnFr27IoTSDZcXKJOb5kJTYcxAD4Uy3NxEEd3bkEN
 dS61l0CEa9k8gP9ZNvKOjrjPddD4lfKZK7g3NDeX19hfI07VmZQQAAA==
X-Change-ID: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEwNiBTYWx0ZWRfX07OTlg8FaZ5D
 5sCVr2XLRL/YUZ2nFiWEzrss+3S+bHHSJWLyNusrON5ZMuq85wb8kRZkmhjMdsX51PjvRkOOp8h
 roc1ln9qFhhCDemktdxQ18SZ4zPf7tvl8TsWtDMDVEdvDsMenTwjfmlGFuZmDvtutCj8TYxjaw+
 2xTV36a0226OHafbuHRcFdcJ8ejMtwH1F3QCEws07VXA/K2A9x3JKiDHsBxyQsP/vwIwF+rQ22s
 Z1d64bVcGgjah9IFqm5VCxZ5m8P5apBtgjTCzkEDFimMXppoQbMGFD2hP0vgsIvZFr2reHSBC6H
 ZZUc9zxY+xGEjLveTz/8SAm/ZxpZuiQklbcPhUVymwJYgIYaMASfOTZVdPq5LUc+ZaSAnWnHx1Z
 uIBunXvWhxu5pJsPP6jycs+Tp/9/VQ==
X-Proofpoint-ORIG-GUID: ivfg9YUUqLKIyB5VaD4-iHwPVSU2YvJB
X-Proofpoint-GUID: ivfg9YUUqLKIyB5VaD4-iHwPVSU2YvJB
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=6936c71f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BwhbExv1iWKvBhASTEsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080106

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY
- 2 x ICP
- 1 x IPE
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE
- 5 x RT CDM
- 3 x TPG

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.

- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/all/20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com/
- https://lore.kernel.org/all/20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com/
- https://lore.kernel.org/all/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID gen4
      media: qcom: camss: vfe: Add support for VFE gen4

 .../bindings/media/qcom,kaanapali-camss.yaml       | 646 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   4 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 376 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 ++++
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 12 files changed, 1718 insertions(+), 6 deletions(-)
---
base-commit: b09b832c719df5e10f2560771fd38146f2b3fd7c
change-id: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
prerequisite-change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436:v1
prerequisite-patch-id: 3ac5d6703a9530eda884720c146b9444f90cf56b
prerequisite-change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49:v1
prerequisite-patch-id: aacb03b359fdf95977805f42918c0b6c39889e32
prerequisite-message-id: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
prerequisite-patch-id: 27c2ef96f0e747ec6b4bcf316d8802356e4cc3f4

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


