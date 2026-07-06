Return-Path: <linux-arm-msm+bounces-117044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c4GSKu0gTGqdggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:41:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B63715C5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:41:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jCWKeDBi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LjgLFKKz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117044-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117044-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F01C3022B61
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C1447DFB6;
	Mon,  6 Jul 2026 21:40:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36293803D1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:40:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374053; cv=none; b=UwOzq11TOds9Xm2aBd0fGP1n/MVTmOMeHx9Kyb4fB/OFLw9W+QuGxL34fML+ohH9ilFFsEbmIDAJgwlLFrA1Jp3QpVF4S7Bh9e/B+rNh6iRYHs5iy+iAngWO90fnIdMa3zrDKWCXMjJL9Vnpg8gQN+4jXH/aema/gAbR48YbFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374053; c=relaxed/simple;
	bh=lgLt7qK/jqQ9CHjMSFFe96pTIkCFyU2Iu+KakUcKLvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkGrATpvc6UMjtYkJP9g7ReyP9+j2uGk/DVtCn0405t2Xcv37Z/mc8juKEAN0Yh9BBxTc74MthtMZM7LN99kaZ8RVoK7Hp0vIJcvojzHsQEwe5R6m4POzlwUCjmZllFcka+MA+unA8EbX30yRK4EDd1ZFQOhJQH87FXXTvbDTZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCWKeDBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjgLFKKz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE8kJ1654886
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=; b=jCWKeDBiSZ4CNpz3
	UHG/bXB08T8jao6zLEqscXBgQY420HkAGU5CSdqRZHoPcUrRFtKaQJRqfG/PhdR/
	8Fyqd5AqqnT/XiPCqcFt+xHVl50PukrTPOmhiYNbjp56e/dSBVlBYzoxSMGOhJrU
	K+ieZnB1mOAdpwobm8JYAzR4i7LN/o8vIhjd7hNCmqNYLh1+YHNdUf16uZBXhxr4
	OOLNrKtiRzXFwzOJ19BU67H4AV7t5DIBbYV6yuoNLgs4Jvi6XhnXYL0iEH6aJTVo
	eB977Hv/7XMDbFnf5bi5yyA6+P4MJvDH8GdPNc628lR8JYpI3v6xrKEXpIvtp57R
	N0Y9OA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpk37v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:40:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so5766614a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374051; x=1783978851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=;
        b=LjgLFKKztv0w+smxfm9w0/1IJ7sUexSYUvW+WPbAx5RPQaav123B4/caKcdLoc4i4e
         uP1COsVIUYw8Q7tPU0GzXuNjvTQivHS8dsK+Cujtn5L+R7kQZwZPRLNFND7NSnJa9CAX
         Mk5JGkbAZXULJn/s7QxO/EZvUpnwz9I+A4x0dDVNCz0wbP0vJCXWaPAUl3AiPM8o69q5
         UpqTt5Tio3e02KZSmScV6AiJhD/Q7oZdwpuGtT9sxlko81qg1EdOolr7Joi7E65jxmw2
         AllDbgWIzqPp3JraWHTUqIr/L4oUX0xDL0rc1baL7UNCqoKsdBzNNJZfq4pi3uFAYfSy
         TL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374051; x=1783978851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=;
        b=bryvuH5u+kop1s8/WFvzfWh4mpddh1fHezAC6MbYumOMg/dHGXSHB5b3Uvmv/5ic66
         UZ4ppzXXrsS10pp5DuQ3SK1KmwYtecVdIxkXoGPEVjKJkbKhvdkO+9YqIy23mleny4Ux
         LHbN+uV/nNcasdSFzm290L2mN1YEVwLzPeS0pXyvKOsPa8hDCySiVV3zs5DpMK9Ai3Jw
         oHS/cinG6eamLHn0XcP4FpSrZz1802vODXd1+SagYgDziiRDABP2/kKPsmqcKnyuTTqe
         CWx2UiJqYVAm2Ypqod+y5MB4MY4CDZ9Ea9VKeAnA+iHt91uCKxZQoN7uMMyYhmdQkr86
         5bQw==
X-Forwarded-Encrypted: i=1; AHgh+RpnjRrfNSMSXxbatGonrxAN+W7TzBlV9MBrG+wGIc6zds3D5kiRiKYlubZRahqcYaSv/ArK0G1Qc/r4KHg4@vger.kernel.org
X-Gm-Message-State: AOJu0YytHtVeLm5AatpAfXpScznIfO58zBHqyG0F25bsgBaxPTrfjXHt
	jMA6J98JRK9o65OVsRkBQDLDojODfuTEnbGY2WX3XZ8ek8WEP5n0Zm2JsOy9k4nFRRhUJecIA5y
	9QZXxSatSt6oCqwugmO0irhtVl10bJQ5fyQhQ2BkEUC/VcZ6tk4pLPvT7RzKYuGcVDlQz
X-Gm-Gg: AfdE7cn8OLFoEitZAGN1HsTBwjiMMOcol8o/95rVSWJbiDj1eMJIwaoDmyD7Gb6OJ/M
	AEwF3rP/IEsQUKrZhYyjolwxTCEtjrJ4Ar5FureeuAvMQAChEf2sPKGYGSMDM8U5IDDD/tQyzeX
	NQqRL8w4rgz1TxNk0KOVV45qBM/uiZZjoNkdzQ0WRbcCydyuv2nR6tYzMeO8Znfa2mWd2ge7SXS
	3IxVW4mcqh5fmZHlsyA5CAEs5dwwFRDzKkd2Emn7/0HbOUNCzDSOD7NepowW3cKWE6zp99hYCct
	i/PzdCv0NybwQCdPfyWEtsOkHrmwTBUfbhXjhmjfehd8pHDPJRPWpk1TvtEfztEAKaKhXrBz63p
	55iV101ZZSxLMKJ/Cq8bOMXFenFppGwkrysA=
X-Received: by 2002:a05:6a20:918d:b0:3bf:9bfd:ca95 with SMTP id adf61e73a8af0-3c08ef05781mr2677432637.34.1783374050538;
        Mon, 06 Jul 2026 14:40:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:918d:b0:3bf:9bfd:ca95 with SMTP id adf61e73a8af0-3c08ef05781mr2677399637.34.1783374050098;
        Mon, 06 Jul 2026 14:40:50 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:40:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:19 +0530
Subject: [PATCH v3 1/7] dt-bindings: display/msm: gpu: Document Adreno 840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-1-8dac9a60dd5c@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=1363;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lgLt7qK/jqQ9CHjMSFFe96pTIkCFyU2Iu+KakUcKLvY=;
 b=+P+NDR6cbAXILISO4q4L/6OEYgzU+DHpDtDOQUJr7ifwgex0pOzNyEowCA74kl7n5Srs35yDN
 PxQShTIo/yLAvA2XB1tMHqmYhhHkYJIT008pm2Q5i50KTBBYOTNWTQH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c20e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2rxQ3qtc42-NlUa7jS8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: OWSATIHlWb4Xu9pCU8B97aOgr_nowy4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX7oc2SFRawMm7
 gPr/hASwrC8Gpit4u/+63HtLdNZTRTPzNpoawYMxkmbt3xKcN5FR4elpECUc+8kPwpq5J7t4QXE
 nL9gQZb1t5FOYX8oGazTMN57jwmEf4KG4sXqN74h+4ryjdDDhxiiyXMMElJ5PGZYwWq3NwBq8/h
 BlQVXx+oFanF6//4odjhIgoMrIdbQfzQE5zCduImLVmhkN5yUxGKtzFdwc0yutWrg7Pv18dw5yD
 VC3b3S0dRPgJ01/2IL3uowIcM+xEUgzwaZT7gIXVbeTGiwjIpVSbYne34iDuDd7DkdNmx35udwL
 TIuMB1/SGS+JVyfL79zk4kjyQ4jLopeGg9Z9Ql0gQkz8KAtCNVE2DA3jkC+sR2Pyh9OgPQRMLkJ
 zLouJIrBv8BBUGuFJ3LnC9I6AWefd/8d2/HO52PP963wsN0m9Zc3Nb4RZj19hcX13fI3Y7jVVkS
 Q7HorRvXvs4w7l4MkEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXxmju8/ZZkExX
 nX9IAOHNiPKybATof2Ibeqo0dYxHat3+aBBruCNWj5xvUnwq7RtYqUObtmQrEh+M6IqnsD3PQsv
 1v/EIZV0wMBI8Ddom/Xxt+uAeAMeqaE=
X-Proofpoint-GUID: OWSATIHlWb4Xu9pCU8B97aOgr_nowy4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060218
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117044-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 49B63715C5B

Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
It is a new IP which features the new slice architecture with 3 slices,
raytracing support, and the highest GMEM size seen so far on a Snapdragon
mobile chipsets. Update the dt bindings documentation to describe this GPU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d0b7304c17af 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -413,6 +413,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
     then:
       properties:
@@ -448,6 +449,7 @@ allOf:
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.54.0


