Return-Path: <linux-arm-msm+bounces-116513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/ktEqYQSmoO+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:07:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E239A7095A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jYWEQSrA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jOs92DdA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116513-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116513-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49AE53010538
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E84358399;
	Sun,  5 Jul 2026 08:01:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD50C367B94
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:01:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238517; cv=none; b=sVpCURuoPILtiXdn86iIkS+B8ygtujDMkZJqF5mmr8hi2UnMqxYKOGcsUokZLR/aqTNylKGtZXQDYHP6CUuyM6ZImJZlW7QmdjIUjQMFxs9IQq1QNrCHVqs7Glnj/UpYeABxLAkFDi2H01v8442fS7zIptZZ4tmqIOastgSxKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238517; c=relaxed/simple;
	bh=wcNtHiPt37tRcLONgZr/t6X+o8Dp6m14w6rdasOzENQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBzPXLm8ex+PasLhi7jqtjj4Xq5PGQh+GsNtifA3XCwvYALrUvc2IOMEPZ9OAM7Mc3aGTFasx67O1KQanVzBZO3FCKcIBH0RiKOGieft4eXmsRTHwyv3Hj4eftIdVReZzxIdE9zL6Mgix567MQ2D+YioUvC7EDpjHitR1stM4tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYWEQSrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOs92DdA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655H9bt763184
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=; b=jYWEQSrAUJv+G1cN
	bXwUmbtQ3c7ObjQG+ukJt9DZ40VEQ6PTa/xjw1+N2e3GCt812eSCQk+dPYd2jPfi
	rdTvb6I19xcC9R/SG8craVD0o+htkVCgDwPS6emwf2k6+vSmDtvS8BKtlB5TFCwR
	2Yvk/h9+K5xpEjlQR0+3/csSwc3swKpXMlA/fFjTxuekd8VW90Hx8V3lnn++WKs8
	uj+4EijZA6e929hOWVjRvdmmowQ8eOkNKLvKPDUsQPIEsuopeRVeIE98bduRFh/2
	dfKFu1+t9kKTb9ibDwtygmTqsxF/C+CdpJ9WnMrG8DllrNmWFT6WW5Xv5wzseDX1
	gULo/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnjmb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:01:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384048e7e14so1208069a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238515; x=1783843315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=jOs92DdATe+K26HJkn1IITKJ+snKneEUjyCfZfRC1W9xSDZCu8fnmg6JP3T+NhLB3+
         zj+ZDM+6x83kkmY3epvIPDtBzTFrwbkfvy8Cm8YsIbryiwlB7nmeLgD23eZuUeu5hjAm
         +Bk3RkpOMRBXo510aX8xveWtYijzLFQlth3SLpXKKYLLz6XPuURZgKRmm5nfVg+qGfcD
         I7UguDsS0TQxaOzJC3EY27MSrygVYkAcxS7XbSNa0dvrae8QiMvSc1MMlfQyeJiuBpCh
         cBu+VDR5bnsmQ7zd2XKp5WELMkC7NR70dGfrxoCNnhwT+cfscGDnjkt5M3VG+hjWaWHJ
         T0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238515; x=1783843315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=IudxH+qyHPUDa41QxEKLSroNF2Wj+XzbXMLTTjykOghPzJq9x//6nM1kGDSoNBxHO3
         J+FQYDHJ6LQdtnTRJJNHZ+GaeeLf8eZAV5+rjW7rE5oncSBkqrMuLNgU8o6Eg9BlOGgN
         OlN2Yr/BYcA3AUI+LpuWg+depAnOcYh/n1zfzXME4vy1WXBo4LOKRZWrbtb+Sd65S/+c
         EI9uSTxCBGVc2aJy5oCMbl92T9VAaz/lsFjYvbMD4JpYimtLTHsSiMcpVFIdFqgrYc0s
         xGlz0Q75vsaX7Dn5pdta7dlwPL/3/ORrqQNaYnuSr/bjZr13pKgNvy9t2H30emc2QWGw
         9Tfg==
X-Forwarded-Encrypted: i=1; AHgh+RooCy6444cFM85gUjm3k2f9IEa+lV0p6icjKGL7ecTNmUKbnh2C4lmmfhzty4upAFCpE+6l25C83ugcxT5P@vger.kernel.org
X-Gm-Message-State: AOJu0Yzizuz7sZFM7Wq2Qa1tS2GZKTxa5yeQmLPOJotymshCEO1OpV00
	5X/X0t4MwU/ca08ZURldfSjk2w07ywJmPuRJB0kKSq1htU7sK1RyKTD7kj/Gh6qcOlieS051PIp
	2hEr/Lmb3ddVb1bEdvt/XwCxG+lvERdo++El4Qhjp2G3ygTBGBWndd4PAfTxrIPuITPVg
X-Gm-Gg: AfdE7cl8wfeWAoPmqjifmv4zgpInFCwB0s0VSb+oXIrNCI5IsbogJz4Yd/tZznhv9Lz
	EYjmmJKY6uVeWLrrtI4LU7CSDDE950H5ivuMOjS+evyJUB8OAa1aWJoznC2dYEhZGr8t/4OxlIl
	K5psVGTBN81auokQpLGrxaKMp5fCWnxzIIKhVOHm260CAFns4hqmc3trsyuJp8cUFeqb5tMmZhL
	R11MpIEBs03dnJjCZnxVcx2XqvOfVEsFaO7DjygdF3DG358uoUKiHB30m6etMYilG576r8lMVwU
	VbFgF19lpaXq3NezRGers6Bcuy8codGDZJWXvTEsNvWhWhkedqyW1+p8AiytJJIPGEnR2wTHOuI
	VI8pPHl2erICpLwvXEPPwSn4NOh/xU/IuHf8=
X-Received: by 2002:a17:90b:184e:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-3829f0074aamr5305954a91.16.1783238514724;
        Sun, 05 Jul 2026 01:01:54 -0700 (PDT)
X-Received: by 2002:a17:90b:184e:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-3829f0074aamr5305915a91.16.1783238514228;
        Sun, 05 Jul 2026 01:01:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:12 +0530
Subject: [PATCH v2 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-8-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=851;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wcNtHiPt37tRcLONgZr/t6X+o8Dp6m14w6rdasOzENQ=;
 b=URv+TD6nyF6fnwSALrkof6UTYsZQKMpZN6Rz87h3njAQB0CgJ4EMV5S7W8k1U/tDgpRf3l9zN
 cRBp6AKKgf8CR9cghxKkqama10bv835Kb/xUKijDgF/ifhTGcqEIvaN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX2LYDV/gOl033
 BJuFk/VNJPUxYcyUKpa2Q3GrmET47edd4UtA87y2YFQoIs+nhH/WMEIlYnGsmaxg6Hwr5Rqo61p
 YxLIw0iCFHh8Dk8kQXGDAV1S2ghG+cw=
X-Proofpoint-ORIG-GUID: H1slALgfgodPXRA5-eAqspdqJD6NJboT
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4a0f73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ckKq4DLX54o5ySWhiFgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX44FdufRYDnhl
 MRK4B+vMXwjw5Gdzfb7cifKpUv0KpLkRg5tPiWIHg04CHmumdf4+yl27VFo1PxhK01gS60XHDpY
 I66spM+ESP3mhuwAV7o6CqYLbXDps3HQ18/h0Wj0fGP/zFc8nB19sH6OzWEQxkDBLncm9syughf
 Atem+TbtV4jZxzyIXU3un2CW2vunNbyodJN3lr5ELkvL14C7zjPvaIAATmZRNm3OjJWhN/Gpo+W
 DRtnipe0p8VLdK6TS+57mbTKIFjWLklZal/CxNM1RxFURK7exMtbM4cXKv//tg0N9q4qC3m+7f2
 SRYUju+jNg2zXkcPrtMGcmlQW2aSipkWsSWh1HH8C9WadLLOc4CKVXXf56k4xuhK1JVbdTszL8B
 GFU9Kl0H35N11+pvvQGcRE3csRrODv4dYy/A+PsueUq09OibjGY7qxccyM6aJzMjg0jhA6NJvgA
 yYoSW+Z1xneFft9hQog==
X-Proofpoint-GUID: H1slALgfgodPXRA5-eAqspdqJD6NJboT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
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
	TAGGED_FROM(0.00)[bounces-116513-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: E239A7095A3

Add the secure firmware name property and enable GPU support on
Kaanapali QRD device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..6bef8ec151f8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -693,6 +693,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &pmh0101_flash {
 	status = "okay";
 

-- 
2.54.0


