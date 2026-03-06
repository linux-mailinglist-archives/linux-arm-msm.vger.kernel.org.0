Return-Path: <linux-arm-msm+bounces-95925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOIXMtJZq2mmcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:48:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF04228647
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F0ED302CD18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 22:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE752F361F;
	Fri,  6 Mar 2026 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpjziD1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/i3TZ5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF373502BA
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772837319; cv=pass; b=Rbo+nFGZM0e3DlxEMVIKCabLqURi6ude1Nc0SxDJrvjvJ5x+S4ouUidqbMceXxoNTQzM5A9V6/ymnLeQqj3B8uXpzZl24JiwW0A5ycGoTZK8LO+NXjyPBe0vrbl9N8dYRT4w+02l/M15LoD1edRmPkkXWVO8IrhV+T6G0ClHyDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772837319; c=relaxed/simple;
	bh=Luy6dvXR+xnBIlbOJqIQMsOjqVqJyjIEq+QlO0Ylu2c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oyw1C++U4wX/kSx4ofn0uXPYHxmXB//5wkPM+xNeSrEP3t/PJ6cOvErIZF6pdkAbCYPA+BTb8OVubFt6DN1OWzC0k7lw5CnRQ5/bJBFkWiXOh/ngWTPcxkNO5AXXJUOqKSWe6xYifqOhizFte5Om7UfM2EScZDP20PapdH/12lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpjziD1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/i3TZ5h; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KXJRV2625875
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 22:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to; s=qcppdkim1; bh=oMUaOh6YZEwrJ
	P6PXRf60XJBVPb36qvAj1oolI33MWk=; b=ZpjziD1qM2MB8Z7mx4oo4106BiG6x
	EgiujczrfDPgrCv5CrY43YLSUxPeDNRwPb3s9b5ZsLA5U+HaQPJpQm4UT7qc5V3v
	HscwjdyVfi7I6JKzGqYQ693xSzSZGrPaDpo7GiqgHOGc3rZmSK2iSOIOx5Q0AZsu
	Gv4nEEzLhSso4cFISEb0iHOWGxKIkkCeiznqC49cFhRhdWVw1eLxDWKXKrKLLJZC
	FfylnibA5QLXDLSTLH/TCU/ytTqNdDvPFa5SYD3w4DvakaP5tt9IJTdUSYAzIK06
	c2SW10BPd4DkHMuq950rNp1j8n3UJlhOGURpQAcx6PUlmAgZG5FMM+WQA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ajfe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 22:48:36 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d18d6e6541so43551012a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:48:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772837316; cv=none;
        d=google.com; s=arc-20240605;
        b=b0m5L043RdMGTOzKb3Lbq+3l1Q3GNCbwm7XD7VzG915/WUUs151b2FyxEX148nOAzm
         zN/0Bo9N4/6f+YWj41Pse4lb/Hc5a/zz2LGwo06E4//6xWNxj8v/g5Hq0fyTHNGtCPik
         kzaje3ZiOXv41pOg1rP8Xs4SUBUkWWNAtzi94QAsEiBJAsPOdQZ6a/Bco39mYab2V+mB
         KWovW/DB95Tm6AcQfOMuGPKT3yKda3NnViPjjk7WJ4LcuIbGTI+J3vdSefBTMbRpuvrv
         15Jdceommvq1H/ZBMt5jIV0/fnkZiTi898/2N9Yap+gWzin/Kl4E2R70qzpslvmmhf7m
         JjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
        fh=SumuqpcoX1e8TzwSMLVg0l1zZZH9DcGjajg78ZVhHXA=;
        b=hnFxqMzUWch+KfuyRZM9Z7As/uYf2/beY9sc56xPnYj0UAeYb+w2uXRrxH/KAFgPs6
         7hJqcqS2YdJgyNS7YxyvKki6/CEu8T7eDZE1uhAJXkLj8MJGZhMh85aNm5TrlcAOlYdI
         fPXOPKcU/CjVCRT42p8Go3qvknrOgFJUyP827AyiYbirP0iTf3v8GX+9nlRfA6EBIjp5
         GWIwycqL7omK1ccMVs/1J0huInDyzfGdh/kvSTMEYgUSjnmGLRVDmu/53T1YGn2tGVgL
         mK5oq6GD5w62Pn4+q5hIAn8WKsE+o3GAPUtrNlyPCJ7HbP8ewHbjJD4tHunB2z2ZB2+W
         FvgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772837316; x=1773442116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
        b=d/i3TZ5hRcwDPW3j6w5XfnnES0sSZCfKpkzOiqrR22hqFu/PU9DziOcp/ZC+ooJYOn
         9Do9AyM5Cll0VohA/1ROw9TJJirQeK5l2e73gA+tS6+jc+gqbSBo/+r0jSO2umP1Clu8
         XTv2YmeYHaIaOZP+7z4cjKgUI3BAU5NiEy5Mrg88dENQvcZrbbYnddYqW9jRRuke46p8
         /fG31zRtIg6T0maczmKgbbMkr6HtTLMMdKrVNAlbjPgigDdZVfdAY6OCPxJ/a8xoPgRU
         B/r33DOYmtSMp2yzuwSwkczgpHiosgSyOgoKO2AIOMXBC32m+lcjk6Zgt5oGfNglmEha
         icVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772837316; x=1773442116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
        b=JRxzyCMHm8S6SncM2V6xA95uhDOuOa9hdMp+tFs74CLJWCb/PZOQRp13J+3DGUWjgU
         /cem1efiLR9tSErZLJ20M1Q/arAQSo75iMLXTKAJ5bxGkA7ipD9lgkAv3sa8h/qdDbII
         g5dZs5dU9M+o91So4W1Jy14/th6KyUpAymSZljhkUYdmn3ihpTZF4DpyvVKNXVnLzhQb
         hb5Aj1tEtYP3rDekd0jFHBBNrjVV1PljTeoctC3pcmt8CmQpiV+caBQVZA03M2+jACjf
         vFwCUqW04b25zhXah52s/IOzBQYEHpFX7ie/UUu6xf3BjTGvfQbRKNnOcXMreohVsowE
         ZnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOacvooKElMSCFBWGT5HXUla0CNhbjMs8FVxTsvFssU7OpemC1Wc+OfrRrBSz6heOqhIQ1rq7G32KW0+al@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOnvYVSPyqa2eFfPo1JgqxKP7eJ343ecUGCDx78g9iR7gvQSV
	/xcf70fZjPtlP7Wlwakx/gikj1Q4k5WSF+frdeN1iWBm2Jmp6R2jm5bhqMXzlo5ZWBlj4NvWpKJ
	UkuKvR8V6CW5lWKWTI2zKITsNt+DfVr4M9MSu72kurlCUneJmIAYXvjuzYggloUWcXZonb1H1QH
	MfjwhRtAZ0Cl2Oa2tW9bVL8Fix32RqtdJXDqfKLek9Rn4=
X-Gm-Gg: ATEYQzwKwaFydoSvDizgSRCIspYyrPaxKtSxGUQJR9f8gwxtjtkehGgZ1GtQjSQ++Wl
	TnNoeMyB/3dm4WRjM3zkLVTeCwRjvhN8QGBTFmYUPu0JH6FFzJVcJkoahwX1mR5MyW+i8u5jAdH
	LIz5/c9iPeMT5tYc5Exm9tM00WTR3eX7cY05jxLG0nGm3CA0CAUuSc6rOvirWc3N11kViwLRlW8
	CagJ+wIz59l1i62+FahQP68gcG/H8+H+qUsGw==
X-Received: by 2002:a05:6830:438d:b0:7cf:ddb7:8823 with SMTP id 46e09a7af769-7d726f574d8mr2889538a34.11.1772837315971;
        Fri, 06 Mar 2026 14:48:35 -0800 (PST)
X-Received: by 2002:a05:6830:438d:b0:7cf:ddb7:8823 with SMTP id
 46e09a7af769-7d726f574d8mr2889524a34.11.1772837315626; Fri, 06 Mar 2026
 14:48:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:48:24 -0800
X-Gm-Features: AaiRm51AYeoEkufoXsxcQxnfri5PKTYQMm_B1RWY1_hpBCsJBI4B6OiBJNeEwpI
Message-ID: <CACSVV00wZ95gFDLfzJ0Ywb8rsjPSjZ1aHdwE4smnyuZ=Fg-g8Q@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-03-06 for v7.0-rc4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: NrfiTfiwCAfNNsu0bgs6eDq584s3Ws97
X-Proofpoint-ORIG-GUID: NrfiTfiwCAfNNsu0bgs6eDq584s3Ws97
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab59c4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8 a=_-K9eTw_oR7D26KFscAA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIxNSBTYWx0ZWRfXxgSFd+pUc/I5
 a8drbz/m6wqhls/xO4bj+neT0V2OoJQfAGnpF/OqJNgbIJ+UNylr5cCbVkZaJCtS9JMRJ8I2LeG
 YPJ51takbv3AqPCazAfeW+4XATdoWYHsgNOMGzq26mE4YWV7qJMq4Sr/na6azfBmIOAESUCyg5w
 9qvET88isPEy010Fx5tZ3S3tIWLzyTWsHUcvF0UyEUAP17A/LyiT6hfMygPwYggx1Ty9OHNla3R
 QrQ/CXiO49gZOspm3xxhqFog/8t7OigZ3SOdcZpsBqHQnu/z+5XqEEXpmL/Fc7JYK4mYqg5mm6T
 pYw0nCGa24r0ee4DgINcnjh4aPNTsFB1dkrbXAC6wyJ33Z/GH6lRgo0Bm+4cvDaUfwHZBirSqaN
 Tns1FoKMpSRe8eRy4gOJcet5qss9LZihE3ezyafSqjUplzJ00lU18DO8wrYzXx9vd9BNSOB246q
 GTh32cjTKFaPZJakuRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060215
X-Rspamd-Queue-Id: 6CF04228647
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95925-lists,linux-arm-msm=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.954];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim]
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for v7.0-rc4, as descried below

The following changes since commit 50c4a49f7292b33b454ea1a16c4f77d6965405dc=
:

  drm/msm/a8xx: Add UBWC v6 support (2026-01-22 01:23:22 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-03-06

for you to fetch changes up to e4eb11b34d6c84f398d8f08d7cb4d6c38e739dd2:

  drm/msm/dsi: fix pclk rate calculation for bonded dsi (2026-03-06
20:41:08 +0200)

----------------------------------------------------------------
Fixes for v7.0:

Core:
- Adjusted msm_iommu_pagetable_prealloc_allocate() allocation type

DPU:
- Fixed blue screens on Hamoa laptops by reverting the LM reservation
- Fixed the size of the LM block on several platforms
- Dropped usage of %pK (again)
- Fixed smatch warning on SSPP v13+ code
- Fixed INTF_6 interrupts on Lemans

DSI:
- Fixed DSI PHY revision on Kaanapali
- Fixed pixel clock calculation for the bonded DSI mode panels with
  compression enabled

DT bindings:
- Fixed DisplayPort description on Glymur
- Fixed model name in SM8750 MDSS schema

GPU:
- Added MODULE_DEVICE_TABLE to the GPU driver
- Fix bogus protect error on X2-85
- Fix dma_free_attrs() buffer size
- Gen8 UBWC fix for Glymur

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: display: msm: Fix reg ranges and clocks on Glymur

Abhinav Kumar (1):
      drm/msm/dpu: Correct the SA8775P intr_underrun/intr_underrun index

Akhil P Oommen (3):
      drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
      drm/msm/a6xx: Fix the bogus protect error on X2-85
      drm/msm/a8xx: Fix ubwc config related to swizzling

Dmitry Baryshkov (1):
      Revert "drm/msm/dpu: try reserving the DSPP-less LM first"

Kees Cook (1):
      drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation ty=
pe

Konrad Dybcio (1):
      drm/msm/dpu: Fix LM size on a number of platforms

Krzysztof Kozlowski (1):
      dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo

Pengyu Luo (3):
      drm/msm/dsi: fix hdisplay calculation when programming dsi registers
      drm/msm/dsi/phy: fix hardware revision
      drm/msm/dsi: fix pclk rate calculation for bonded dsi

Thomas Fourier (1):
      drm/msm: Fix dma_free_attrs() buffer size

Thomas Wei=C3=9Fschuh (1):
      drm/msm/dpu: Don't use %pK through printk (again)

sunliming (1):
      drm/msm/dpu: Fix smatch warnings about variable dereferenced before c=
heck

 .../bindings/display/msm/dp-controller.yaml        | 21 ++++++++-
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 16 ++++---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  2 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  3 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 14 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  1 +
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 12 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 12 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 52 ++++++------------=
----
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 43 +++++++++++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 22 ++++-----
 drivers/gpu/drm/msm/msm_iommu.c                    |  2 +-
 19 files changed, 139 insertions(+), 109 deletions(-)

