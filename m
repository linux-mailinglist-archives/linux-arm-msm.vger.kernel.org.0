Return-Path: <linux-arm-msm+bounces-116515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j3M9CJoSSmpU+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:15:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DC70961C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:15:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X9dTxtoQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NtQ+wW5R;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116515-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116515-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0DDE3006B30
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA8836A360;
	Sun,  5 Jul 2026 08:14:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477FE369206
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:14:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239286; cv=none; b=GmNGtQLLJXfelZSvm5M68tbsyMjbeJ5KaPRusML4bl46Z4clzRjJaK1fjTW3RkmyIaEDbQDO39Cz3Odej0s71Y+5dQru90aIe7HZIZMGAk+EfapLS9oq2WlTTD95qmGQDxeumCjThMMU6h5qQwUww4r02yTWbjuUpteOt7yZuKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239286; c=relaxed/simple;
	bh=HZVp9+yu5Mjb0F7vgiRaX5z1PEYeaeliEtjK5AzdYdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZKBzXWtsFfHfdwuDfGoeaHJEs30ue4E3+7Swbq6Q/9/1zj+psjtmQrzBqVSibjLK2NS8QfhWeIrNBMI/1HnvzSsRtGjjsOZX0v0MbITpW+c94OVokCivxYRfl/ibUSGVmPSeMkkEQMKmZCu94jtB01ApnLvmfnaQnKfBmFB4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9dTxtoQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtQ+wW5R; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6657xhV01156948
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=; b=X9dTxtoQsWPjTwA5
	Gj50OTqt/zygM17ti3yhh7M3q02i2+/8io4M/dCZWKo8aDCDbJFY5L/6IXNX2FtX
	sJ1GN/oXfqwAOrhE2Vv1azlgdptslqSW6CDfwwhWzEtDUKRRNWfACP485i2RDt7M
	HCiCnfm6A82Qix9OrxwmJhAoOQ1ZkGVQJQPaLn6kmdtnMNoXcjqSk/jgt3zgPTFp
	yF3F/SWTe3k+hCZcLnPHb7P+kyBpq92NIfUaY2YND+as39H7W9QTNw+GFpiFBODU
	mK/j76efBSjNZyKLMXsKvt7gXvPupnQYXWn3/ZKgBGUr9iD7HTIvTKawfHZAFp0y
	nzXvLg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3aand-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:14:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c892143db7fso1406824a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239284; x=1783844084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=;
        b=NtQ+wW5RbviHS6VkH8IPtFTKtOv7yVI4rxJIR7eEM1KF1P0tPYz9yuuk7SXp90u4rd
         aa4illiHgSqKCvA7100JkLwe2WbzcY//sJISlrnkMMUTGsil9EpgGcRBw9cQlu92AqOt
         LnvVCDtpjUAZwmEsEUG1cf41Ak+kg0tcJZfMAfn+pySIQrKom0NjNCVUe5NL899IdL/f
         jp0srFLOkkfVVSFdqnaxhaRsOw6RTM5d/F5cIt/xEqCCCiSk8q7MQlAtWIaPwylio8eg
         jU88+yvapQh9hey+EsSqQb0/hFr+61QWpYDOkAlPEtKY3BE9kybXTaD9i5Csdji8BOA+
         FSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239284; x=1783844084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=;
        b=B9F4dWI4Fr0SErmHDSyXrJtpjZMKztiga3sgIB9gm9pftTr2w5GNERPyG6KsA/rhaZ
         hINQSHerR/pm1sBaRbvSrs1JIfNi2nnXhYlIL/WJkfUi6Np1OaFnDZdTahlC0d9XIOFZ
         QrUwi6iuACVvisBvPsORs8tvrMMPYxbn+7WaYfBdxXy7Srwp0wRnY2fJ7xPxoGKMr4ot
         aWQ4eQKca5VXxa9EICBwOLh2xf5oUSbdf1JV9SPueN1KHNt/20Xbl5e5dU/g624HSL/7
         u26C/yQenEBpKdmQXQj15Mdwpl54xlfRf1BoHcDRI+z2Sb+mAbcfppaiendUXOP+SGjD
         Nz9Q==
X-Forwarded-Encrypted: i=1; AHgh+Roz79mpJ1p+qJZ8r39FPqzu7jks9UU+CKOzJ2c5D6hFwigfcbDGMn5NiPXaQ3Wr2ZsdkOJaSQn/RjGjJf/w@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gDJXVGJMSYSmEW5ZuHWhtezpFQTjYh7HlPKG7e5PZ7ejNS+g
	uUi4pCVQiNJjriW1+z9MuPV2MZR8vLaJcUoxbtDWXx9XG4Ag2npyLCDpi5haLo708uBEIpue5yA
	wmED3yR9gwZDTfPYYgaopmVwTadZ3Iz/NanN3FT39UGEcUXX2G3LpHvljH0p4pLaS6rmj
X-Gm-Gg: AfdE7clsGV9OKN9Lz7rDX69+XOUv0UT/Wcg/Gw2wmh+i4K6KSYF8ZoImlmltwaG0dcD
	OLqXDTtAz8cR5gKAF2UKZigcjxN7U3vp+cuXBLVrqfjyAKxxxuwksOmdprdwO9grgcB0zgq+e5D
	abDfR7M+6CoHzlAnU0YdyhAtxyf1wJfBnkmxgCElrorG5WD/VhRuYJS3m3AI2gzsUe1nwVtdLnR
	7G0EkjzEBHh10LgMvJqOxecUtxu23kQeRokRjMegRKhYiZVGEa6EraZU6wot5N/faJxcO1DX8vB
	anDiV/h+tYYDv+cTlzAeCGC6NSK66M3UFVmdJiqnDkf41HETX84qZs4QwfAr9m+70WAkVRAp4Hc
	hxW4LwUBS5tXvrrIXsstD2SKyGYo5I99Z0k8=
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr61841905ad.8.1783239283820;
        Sun, 05 Jul 2026 01:14:43 -0700 (PDT)
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr61841665ad.8.1783239283335;
        Sun, 05 Jul 2026 01:14:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:16 +0530
Subject: [PATCH 1/8] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1238;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OoP30nq6efDw/gDTU4tVQRkvylV9nMkq0P7LwxjPzqc=;
 b=K2483gwyhqLi/J7WvjgvqDh88wJZPkPUhmFw5qcCp573LO6/H7fw5XIN7fLqLBDMer82FPplk
 Q5nk2eUH9PNBHF7RtP14pDCYSjIh5szSJQLeY2X1ovfJKHH8/UCoysZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX2tpO7aIrW8qU
 iqO54Nyhhp9iMZu5wGFWxwqcvqa28HfCA6NLF0XM78k/0gM0hyayDC8MmEVrFB+QUBr9C+nFW0c
 Cs4Xz0/ndC0QMN1FI3dFIta4Fgu6o2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX0oB/eUKhN41e
 brDDf8/jJRpA1EyqIi1eyVxgM4LPcRZ0pQkWrc41wQhyy/VLv+q4ysYaaO71ceUJBy8r2in8uwn
 zv2psBr1vOLfaPHMXgb1Nw3tOSYAIYNkKcTzSHk1msSnGz3omLefGowud5gmuAKNUWp3skEtpy/
 YvzN4EtAdtHXbsSUGFoG6DQ7EHeNS1pAWjwzIpPKvUZcCk2pDbj+etNIdhlywi/DetZfT/g5Gyd
 78gb+qNrO+gTIr8yR/oNuCzaLuZjuWPXvu7gVpxXa6IUn9GpFivhEd8XB20lN8GXlJj/9rZ2Qbe
 NuPlr+tXUuZvgF0YkJvXhHqdF5DybHNf4MDiGyyUqVNroCEw/H+7qxqhnSdWoAmTIlXbzVnehSJ
 5SdOofJL2hLGkB8aJuUR0XaNMXkWCP8VL13JKevp4aK5qt4leZPaYHw4EYl32uVYHjzpQ+IWSxn
 Mk9iEeCXIh0VLkSJsrw==
X-Proofpoint-GUID: NVzF5bYwTQFY900BxQv5OMfiyG1fbALs
X-Proofpoint-ORIG-GUID: NVzF5bYwTQFY900BxQv5OMfiyG1fbALs
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a1274 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Vf0ozLlH3VOCCO7dkaEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116515-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 770DC70961C

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

The RBBM_CLOCK_CNTL3_TP0 entry in a730_hwcg has bits[19:16] set to 2
(clock gating enabled for that TP0 stage). As per the latest
recommendation, clear this nibble to disable clock gating for this
particular stage.

Fixes: 9588d2f860a4 ("drm/msm/a6xx: Add A730 support")
Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..a98d550b72d0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1199,7 +1199,7 @@ static const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22220222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
 	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
 	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },

-- 
2.54.0


