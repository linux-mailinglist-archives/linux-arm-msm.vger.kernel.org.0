Return-Path: <linux-arm-msm+bounces-113493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ORwKN48oMmqYvwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:54:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1269687F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:54:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MzFsKFqy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XoOyujLL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113493-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113493-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 294BD312C64A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BBF337B99;
	Wed, 17 Jun 2026 04:50:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF8A329C48
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671839; cv=none; b=rAEof6ypv+m6el71eBGmhrFscBavW+85e5FFeFbH8Xw+I3R7w8YWie9d07gyO98JPGJCEdH4YgvVdH37fz2EeTRfiCsOykqIM2+KO7+yV4Qwf0sjXIkMpoapWEtilmohK/jpsgz8w+I4hcfOeb7cfKcKEylTswMxWrPWSuO8kGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671839; c=relaxed/simple;
	bh=spKFOt2uQRUmgzg6z339+CqBW8ZV0D7qW+BkRQNLY4Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mLXdgT3hmyh1L1QeaXaQ/7aUldXhvgzVBQOr/HQH/5c/5tOLVEoTcF708WGlcQWno+1V4RJr185GnaOKdK9pmwgQHgMUHlBd2LxOAmT+NXO6CPV9Zuq/qqvK76aAZSjITsiCrYp457Ko8F7Z3x0uWEMltfU+oRdN74yt/1AJ4gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzFsKFqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoOyujLL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H4iiWw1761894
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wLUVYnlfKmcir+ZX5+8Uen
	3CpnqRprkzNTALqEG16T8=; b=MzFsKFqyJE79frU8ZCnO/ZSMbru2OzqI/NwKq7
	XYuRxg34Fs4ebr/o3bC4bqWKJQbNkLw1RoFq0UPYBp2DvF6ezIS3+VEOpcqVfcGe
	EcBw15glot8F0BXirORDhPB5exXCD4u8QpK7d2fqO+8gB/jxNCt2dMQQpAkmU0ZX
	+NXFBzerllDhkLIXhUnI7uNptsnVG24mpaOKJP/q/H5sXAlUcFQx96iiBO7pX4n6
	bCDhftvHy6xkMlBFRuXXprqUlRaMEhex51/DM91Piht0/fzQxD2BzYWeersB1v6A
	cnj1wYvsEWVsfk+YswsPOhMKKnrMEO4RlB9KccmHetBrga1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef29e68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240b58211so3573914b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671835; x=1782276635; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLUVYnlfKmcir+ZX5+8Uen3CpnqRprkzNTALqEG16T8=;
        b=XoOyujLLxfkCuC/P6AGBE1WcpU3c33MSnPak/64VBNEs7aFDR3I9e+hE4KiSPwLE87
         VK6bTcOvMUo893WTyDcoywuLwi21peLSzr+s6FaMssrsXVemwqk42fPMji/JjiJRm6If
         7hjtMUQTDxGpBv4w+baVN84dhgRZgNrIASZec5njnKJZULKp0GJICrtu0JNd+UTPeuc0
         OGk7tCXWm23AP65ryXpNo/YP3go8aSYf8NNJs6vJBxSXIqO/u4q7zzU4qzS4ropR1WmA
         G9GPUYuAlyyXyZqXfmj4Z1iyx+VB+hUjEAhRJn9B8pd/q3qPxUfFdsSWJ7fBb0H1gyen
         2PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671835; x=1782276635;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLUVYnlfKmcir+ZX5+8Uen3CpnqRprkzNTALqEG16T8=;
        b=iyBPwfQ56v2RtXo0WvU3zvABB8+WnBpUxUorzvS2QH9UIhH4DbVNbI6ZxnaMdkDM9V
         kEJ54btf6374gY7RrGuUMeoz0AtNJn7O+/EmAUWP1FLFRUMQ79My74wHzHFdHNDOapJ5
         RC/kTHyJ8Mbb73Peb04fYZtYtUoiYHs6/lgl47RKE3MMgBgcfbJg00XL4G4HbLaM2yMY
         WGkHK2km0Z0n+2GGkc+L13t85JAsXF/LnOrd166X4PmbqAKWupWAspd/TfhkVn9jP/LH
         K4dFoDL+qpklMZ5bR9Vco3pH7Pf7PtFGPBcsPKtz+k/sHB8G7FQ3U+cc8fOSGkmRqD8V
         oKAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hJ6Mf4Txzm4lwa+Zrzv3FlRinMrJBRy/pvPdQT8QEPunIGAX8Ss2nfi86F7dfoTkesRXYingrVjdv6utG@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcLKRGs8lBxmbWfSZa1ooOYvt7otsi0BD13z65YpmaVO1GZNZ
	HBE6YFRtLt1esSa5m8RLzhm51etWXKP3AGW93umZvp+5AvjI86Na9iJTiPD81C5AtgQrsO86uvE
	hKo71yxoRKiCR8+nqZF/z9n5M7aHk9hc4WNMGZIGrX2JpG725CNT16oy/A403jxyN+/9V
X-Gm-Gg: Acq92OHUkQUxURuV/yLulU/Fm6l3KYpzWCfRxNZFtldghQyBv4A9OcSVFCDwuX0kqfb
	Tjg6Lf6N3JwhG0aLVKU1mQ2PdeNzaYZ6HnOPpLwDJ/UwVdXifh16+qvlDcAhyR84Ip8VCL/LfUc
	3GceselkLYhYBNI8Y9pFSmvbmqINWJCpqK5rp2PgkapG7iBpxn4DnGB+/yA/MJ8rkQBnWdr8vRW
	0g59bftg1960X2hKfbqd3vUqOOuPJNwXlkL92DeeH9/xSOunaXvDvS3TAuJ/S7RzAR8suAcTehS
	h106SA/AYv13zfG3WnkNQ5zYzg44u9i4zRlXer9c+KA+xPiVO5SdUd1JSN5mRRw18uXjMbvTlSS
	li1RFg2ZwCjtw0e+j4B0sq4hy9zDQwwEMErFV9MTZcbBE
X-Received: by 2002:a05:6a00:a10:b0:842:6fec:12aa with SMTP id d2e1a72fcca58-8452440e345mr2197143b3a.8.1781671835040;
        Tue, 16 Jun 2026 21:50:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:a10:b0:842:6fec:12aa with SMTP id d2e1a72fcca58-8452440e345mr2197093b3a.8.1781671834434;
        Tue, 16 Jun 2026 21:50:34 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:50:34 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v7 0/6] Enable I2C on SA8255p Qualcomm platforms
Date: Wed, 17 Jun 2026 10:20:14 +0530
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIcnMmoC/0WNQQ6CMBBFr2K6dho6UFpdeQ/jotRBaqDFFogJ4
 e4WXbiZ5P38/2ZliaKjxM6HlUVaXHLBZ1DHA7Od8Q8Cd8/MsMC6qEUN5E3T5xQtBA/JaJRyhKr
 EBktdahKa5e0YqXXvr/d6+3GamyfZaZftjTaGAaYukvn7EVX+IauKC6XlSWkQMEazEHk+md5Ed
 wkp8ddsehuGgefDtu0Dranv6cQAAAA=
X-Change-ID: 20260616-enable-i2c-on-sa8255p-432b23838e18
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=2902;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=spKFOt2uQRUmgzg6z339+CqBW8ZV0D7qW+BkRQNLY4Y=;
 b=DikS8Znj/WZofRiWUuac6aEGo8lXrLS0DgcxgWccwAHAXsK1hzvT0Zs3P3Ufg6idqJugURIiB
 B1qwMNjWHMFD7LK5rIq1vV15qtUIoOCRHE7mAx5J5MGvNDHUxZ+BIRu
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a32279c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c5CysasVHaCf_lOAVd4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX1Bs+EHT1inyu
 MQlKLcpkrLE5wYuncxTT6Qoy3KrE/sQs5OpHErLnujKYwfzytxnW6pi1C0UzBFtSyR4s4S3sk2o
 dvCpOOjDt9XxvSJJ6KmosNTMhpdCx7o=
X-Proofpoint-GUID: 5nwTiuztNyhyVBFM9FF2GYGRkuldtXwO
X-Proofpoint-ORIG-GUID: 5nwTiuztNyhyVBFM9FF2GYGRkuldtXwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfXy0jKv8ePDwWI
 Gi3urwDBgVM+M3TGHugCgwFSYGx1iV3cbHVHv4h0ehrILA8rOnayrssJteECFIqmgbohp+TQane
 oOTd3O1FdAp4LipEElCFyvWRPAm0uRl8PiCOfm4sek1OmMLDQQwyyi3Ypgo8qWg4ejxViR/glYH
 WX+OZGLwfUbfLe905+oUV+VLp1UKTeFNNbX4al2ataI/6ThgXYLqGBLYk9W8XiToIYpCSmunrxz
 fflVEk9GQreOMbMZKdPNyOHLD41HSgPCspkhm2T7v68PtHpLUnRg0CO6NEJGKTaITGKQPLfUTeb
 K8iPLz/pgaf+ZsA/63APUSnCLYxFzXJ6HnQP+e5W3WZ9EXL/KoQNpyodeg+JQcAA2UrKPYaiyRC
 sbUCcgFwWdk00NO8s31B6in9EKr6j+mvb5kfyiyuAAk9tgJv5+ZIy2mOIyFVnEmBKcNyRA0HHvZ
 NTlf5gRYM49OqJDEYrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113493-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:mkorpershoek@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BC1269687F

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Tested-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v7:
- Rebased all patches on latest tip
- Removed SOC related patches which were merged and available in
  linux-next
  https://lore.kernel.org/all/177950280353.1097700.8285469548487310751.b4-ty@kernel.org/
- Link to v6: https://lore.kernel.org/all/20260227061544.1785978-1-praveen.talari@oss.qualcomm.com

Changes in v4:
- Added a new patch(4/13) to handle core clk as part of
  geni_se_clks_off/on().

To: Andi Shyti <andi.shyti@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bjorn.andersson@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com
Cc: aniket.randive@oss.qualcomm.com
Cc: chandana.chiluveru@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com

---
Praveen Talari (6):
      dt-bindings: i2c: Describe SA8255p
      i2c: qcom-geni: Isolate serial engine setup
      i2c: qcom-geni: Move resource initialization to separate function
      i2c: qcom-geni: Use resources helper APIs in runtime PM functions
      i2c: qcom-geni: Store of_device_id data in driver private struct
      i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml        |  64 ++++
 drivers/i2c/busses/i2c-qcom-geni.c                 | 322 ++++++++++-----------
 2 files changed, 220 insertions(+), 166 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-enable-i2c-on-sa8255p-432b23838e18

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


