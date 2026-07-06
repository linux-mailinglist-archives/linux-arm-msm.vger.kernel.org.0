Return-Path: <linux-arm-msm+bounces-117048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RHBtLBMhTGqyggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:41:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845A715CA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:41:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XpDozFu2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Zq/hzRF1";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117048-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117048-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27F59303206B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2084371D15;
	Mon,  6 Jul 2026 21:41:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA0747DFB6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:41:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374088; cv=none; b=uGOf/qBvtobgYV+JG28q1RHj/A1tg1gHr6Sul0MpSlTwCsJvOf5o8bmV/lGY9C/akglR2mi02lRImRS2c+SRExIJKXAOQUqsgh4ncjXue5Wy3XE+UcaMB4bEM9ajdujLLZzwADvif09lexgff6nnMg6dSHRSkWkCe7DCjtHscQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374088; c=relaxed/simple;
	bh=SVqkbnuVkvWM2bjS/owUid2P0T2KJfUcSYVpq7Ga13Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhhbnZPJoWjFsT05Al1I7abbR7bQTNejgdnsFRNFJ12+O0DoeGDbaBVivqrGNm5X+moo1b5XxTAR6An1+gAX+L0AQEc1xidJKdZiF/cWaXfi1OsfxaGeqFtuiWqEsawiT9DjHlx9gPxkdrOU90Fezx349FtmaoiP+oHXBkoB5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpDozFu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zq/hzRF1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDuIY1566451
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=; b=XpDozFu2LWxD0NRF
	QZAwx0qOAUTH6lndolSEVkfRt/n595rpztqrLrOuI6nsRg9//N6De1vFyrM1T4LO
	b7WRRmMzebi0hZmRsyHdfoMHK7W56FgClPjLXDyPlbP9V+LgptESY5iJgxJs3XeM
	smV2LG49t4ZteKBBOiNOrOuI/7Nl93I7ME/lJ7kk7rPdbdUow0DbkLUAY1O5ATxy
	wasw3XWaXBKMA3YBuvzd1B0EfKPhp6ptaBAagivk9zdlk4IvszFVLB4Kmu6RWybd
	Lx4VnLep/XuW+/3PYc3y1MPFtjD0vkg+sU6XzQE/eLa1kaM617t8pQF6joPn71Hn
	Jfx3bQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7kn8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:41:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88fc985a65so5840047a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374085; x=1783978885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=;
        b=Zq/hzRF1oK8JNj0/SiqY8XqjPx/36ftECEI3F9guty0nL8/PfzXalEqk/Vvq5XgADc
         j5LV6bFNwy+WWyibQdFaYDcOAyE80oXrA2enR0mFndPBAkAXaSb0Vn1PfnEVD9JZY44w
         7GZTneBJB76uc3DiKxYHfTJlME71R56bFZMVTYPqewvj9Zl+4Mpuvmx0N8RnUmz0lZ5a
         AlReMbAoluM9enqF73wB+MB26Psg9K+HyWs3AldDGId8fMRNTvBFnf+8kE5Khwlvr2hG
         mFcag4Cs/W2fQ970Fw5KeTv+l9yF/Og7L07DHlesmL1SOBiGIhBlUHewcGEc95dJXqea
         EJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374085; x=1783978885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=;
        b=kgaq+QKieavRiQye1NmYBwh5Ssj6MkWbCdkMhN13Wtq+dZFuL24+wbXtBQmfFdQVFv
         KXBVk4eeXwy3XUSZd9Z97pKdR1aEsRMtN9V7iUflfDTio2Cd2AbpWqB/wqQdfSoe4brE
         ft7gxbLxft+2uayCUv8NklPXy57k9WZqZBn2JvEOiAWeazMPOW7WXxypnLOZABkPho9p
         ZcqqDWgkd5BJFy9hLNx9HwimSh+RXWsesabOeLzkZrZrz33/A4h4jYSQOcq627P0U9KU
         CxJ9DIIocRqQ78HYpqXoQNp0YNK29xGE3cBWSBSLjGAJ1auIC/SXCEiuw0t6D5oZx3Y3
         I51g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+Wpl+yl7HwB2rTPnkDi8C6ZN8PRVrAV1/XC0Z1a6E3vtWg1MVwteTAaZJXk26mhq139eigx0APMg6oqEz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8J8zkv7jGjdAXBv8LjhsKLWitWOLLQzIJvAnIOophCufegTBg
	MDkguObCcmLl33Dus1KZ6xHKRpxILewL40wlEoRyFXdoZ3S+JX2puo65MXW5pFzSWx92zC+PDCm
	g53SGHfNDbK7QhRfiJX3k0xlLJIuKtQJpSdhMSBZe5KL+XJsaeXK/Uyh812N1xUDB/Z2g
X-Gm-Gg: AfdE7ck5BlPxzKB/Ygdvz2abLbhpvFBFkETecOW+WFnpcolDkjvwG5bgj03oIq2xIFG
	Aec57d1BrSgCGZ35xolDBYbLh8ZOca7y2AkgCv0qlcfJlfGXrjPKDT0VPHqhdsD5Fis/YQGMZq6
	mkH/8QxI2naNRlA3PwbwPKs3d4O/dlOHr/TNdAh0HM5Q7MrUHvpUSiip6PUfd8OgPs2Aoez/SLP
	YkOvxKv2dtZnjtrJWNJNFJmLZkJoLxsRd2IYjynwl9HP4G1kw2MZImp0LZ8KMRkb3M5QMgzPZ1L
	HS+S207vAHckhKmJEJR/dxWlT9bD6SzJjbwvPQeScCSn8YsCjjLRaBHhRJ8ImV702zan1FsLgTi
	Qdnc+QaZ9wX9lgFEVp57bhG38K0PgxU3yAVM=
X-Received: by 2002:a05:6a21:3d84:b0:3bf:aff8:f572 with SMTP id adf61e73a8af0-3c08ee92e86mr2157316637.32.1783374084974;
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d84:b0:3bf:aff8:f572 with SMTP id adf61e73a8af0-3c08ee92e86mr2157288637.32.1783374084451;
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:23 +0530
Subject: [PATCH v3 5/7] arm64: dts: qcom: kaanapali: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-kaana-gpu-dt-v3-5-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=7506;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Paj+Uxrzy46nVOxI8FJpxB45y1EA6N7DR+yUmwEsd28=;
 b=/9SEus1VLj49Qfme1/2sFJTqMKJoEjB2c+6dOgkvo1lNSZmEe+k4v216hrME+T4zoLSMe+JWm
 XpEGGms5RCgCKOFHbgu5qiERzejMXQJWm4xUY047q7Ntp9Fzd/QWmBR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXyKc1ud3laCDW
 Pq7uzZg9SsxuSidvAZHFGvqU0mK2IUQ310FsWODiGKANjQnfp4prAEBRRLSS8W94Toj5m+gtDCI
 8TEq2fa5o/njnIRJe1duuRuu4Dc+qFo+wrmtjuSl0Nq7xhUDptEPb9WO7mmb/tIFM6NDC8ug31z
 aLVrSpDxRgxnxR/xwW79Av1TkclFJqoWXPC7fbWhmKyikmsv+Ka2MA+IfHFrtgIVW1fAk5JALBK
 CbqyLEVEVlzPOzFpIqULxz6VjZltVc4bP7FafK0N1H2yyLTy9k7EcNaf5/ywyf13v5INS3FjGtK
 DGbV/ayoSEPFPg7eEiNJ+c/pzYG4YgeYJnm1lvL3TzqhZvXy2CWCB/iSq8C4SF1cwkzqAzvoUaG
 yjwt8gZsMlYFdAdvK6A1hqd+Syf5Ol5LMqRPAxWq2tRt/5ORtdQ7glIudMsrmx+61+TcGYnp/CH
 xOE0ioQC6nLoSB/dwCw==
X-Proofpoint-ORIG-GUID: cv9HPNbVRXgjSmAtrz6P5fTNfFb7oZaF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX9ZYe9s+JevP+
 eF59BnWkvk2H/DAZnrLV5yRX78Vf++TSA2U4PZRMwQFNGhl+8+2/8J2vxTZRk70kZfCq0hNengM
 7bYggbMHxrRRydVw+ASk2sZIGyFxkbQ=
X-Proofpoint-GUID: cv9HPNbVRXgjSmAtrz6P5fTNfFb7oZaF
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c2106 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FGf9z4Ax-beoPfFoyYcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117048-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 1845A715CA5

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when
it reaches high temperatures. Set up GPU cooling by throttling the GPU
speed when reaching 105°C.

Introduce a passive polling delay to ensure more than one "passive"
thermal point is considered when throttling the GPU thermal zones.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 166 ++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index cce2e0a3f971..79bf32a9df83 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -26,6 +26,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "kaanapali-ipcc.h"
 
@@ -7056,9 +7057,17 @@ nsphmx-3-critical {
 		};
 
 		gpuss-0-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 0>;
 
 			trips {
+				gpuss_0_alert0: gpuss-0-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-0-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7071,12 +7080,27 @@ gpuss-0-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 1>;
 
 			trips {
+				gpuss_1_alert0: gpuss-1-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-1-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7089,12 +7113,27 @@ gpuss-1-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-2-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 2>;
 
 			trips {
+				gpuss_2_alert0: gpuss-2-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-2-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7107,12 +7146,27 @@ gpuss-2-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-3-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 3>;
 
 			trips {
+				gpuss_3_alert0: gpuss-3-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-3-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7125,12 +7179,27 @@ gpuss-3-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-4-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 4>;
 
 			trips {
+				gpuss_4_alert0: gpuss-4-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-4-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7143,12 +7212,27 @@ gpuss-4-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-5-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 5>;
 
 			trips {
+				gpuss_5_alert0: gpuss-5-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-5-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7161,12 +7245,27 @@ gpuss-5-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-6-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 6>;
 
 			trips {
+				gpuss_6_alert0: gpuss-6-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-6-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7179,12 +7278,27 @@ gpuss-6-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_6_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-7-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 7>;
 
 			trips {
+				gpuss_7_alert0: gpuss-7-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-7-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7197,12 +7311,27 @@ gpuss-7-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_7_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-8-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 8>;
 
 			trips {
+				gpuss_8_alert0: gpuss-8-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-8-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7215,12 +7344,27 @@ gpuss-8-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_8_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-9-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 9>;
 
 			trips {
+				gpuss_9_alert0: gpuss-9-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-9-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7233,12 +7377,27 @@ gpuss-9-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_9_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-10-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 10>;
 
 			trips {
+				gpuss_10_alert0: gpuss-10-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-10-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7251,6 +7410,13 @@ gpuss-10-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_10_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddr-thermal {

-- 
2.54.0


