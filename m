Return-Path: <linux-arm-msm+bounces-100953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGGvNFx6y2k3HwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:40:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 690583655B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1A5E3006837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579F53CE487;
	Tue, 31 Mar 2026 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRt3G/HY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cti9EzHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE13CD8D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942808; cv=none; b=ua5iih7FWtqDg4wN7nTHRhW0Gw+S9fXktuOhrZej2L1Ky8AWI5NDTn/SsoMztOsHZqrqFm7z2XnfZVd9iAu/PfO5rr9qeJeYzxRyLhNRTN2JD8qAqPMJ/AUeTcld3mCsyYwBMpNQJWDPq0g6BFO1u2SABp8utWtpN2Rm7bAE5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942808; c=relaxed/simple;
	bh=KcPFjMC/FNXOUA8YFdhq8Ae18GJIAuzw3HutE481J1E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X6obKNfVKltwePwI7o+WzsIwSZ4gElKxCkBUot1jxMFrvf+m42hEvwv1M+5BqzZZXOeRZ6RI+u9DU9Wjzkjh5LR1ky0XLslSFVzMmm1ipGLDu3U43KVv7P9sT1BsohrKPbJllp3tNQRapISEgGZak04iPJCJ/xyuodlDUxj8Z7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRt3G/HY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cti9EzHK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V18Hs4430871
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QJ463nXZAr46A6gUsUe4hK
	mk0arjPW+G/qVxoglnSmA=; b=HRt3G/HY6ymcZ+KgPsGaDd362IYjLdYB04EAHX
	hMVlnewfG6cNg1H5SkyOdDbdw2b86GOFx3DpuvEn1JeZ7kkDucGHaWeqL0QxPjc7
	sGOV6kXQUfjycFsJPalaB/BI7/XdiyFMtqaJ2jFZrVp7NVHYWYraSSSPsNfllP9v
	W2X+HH4cPpqmNikqhtceLNlIhNN9KnyJyhqaW3xjd1F+P75tgBgf59caOMUiMj5R
	YD+6x1+p9VznlmQs67t6gYDaape59fKxqmf1PM0fDUkc5zgKgo2Vhji1yLaY/7qj
	wdiDcw4fuhvGUuZBV41uTmUSA2zIHwh2QJjgHaZUiaR/bVSA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfh7hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9010602bso3847801a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774942801; x=1775547601; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ463nXZAr46A6gUsUe4hKmk0arjPW+G/qVxoglnSmA=;
        b=Cti9EzHKBnDqF589guqbTvQhLhq9itigMTtRoAz48qWcYEu5oRAnBkCLle+WfBUpoB
         eUvDtr+STlSHHO10QTZ//B6yBjhRf8al4AC73W55X+qFoe1a3ohVKOSfXZK+BoeBGfiP
         BEllFNqrbZ/1Oxk99y62s+ybbMt+DbSNhyoUN397MifUcoC/zE2IrwJFBYuBX5ZJaYrN
         DzndBYieWYJ/A8z5hVOkOj6VUu6vuNJ02Id7YGlGWSy89uJSfo/Mm7N4RAk0i8N/5U6N
         Q11RjQje07HIyq2Px0SrCbfjDW9SaSFcDUhCa8BiYAO7gzPpcwgcEfQMIBJvw73tAPov
         b6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774942801; x=1775547601;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ463nXZAr46A6gUsUe4hKmk0arjPW+G/qVxoglnSmA=;
        b=Lo0fxDXBRl/64VF7g383FCyC2Abg9IyH0l8pO3da1g8U0jlCAu6cLnRvIemu/CsZ0l
         nrmmQz3SktrNiVbKMXSUN92SLrcbYQvR2WHtRrD/vKQle+bi0+ksg8F9koWWuSbP1vlj
         rONsNRB35FxBuArvDADQ6DhcsWx/QDLXZjRjbNHY9Z0KQ0pJgdVfpZoz8XdNnlKA01Jk
         Hc9AeaUxYDnrafvE9gipVkcp9HiwamEY/IrS8ToZezHM0NN7OwmM3fxcife4S9fEf590
         jChs3rnvdT2/vaRD4IiTZ7mDz2rc49u2X9YrtnRcUMRHA4aXoIbpkZ6rI122yT6vaQNK
         4yzg==
X-Forwarded-Encrypted: i=1; AJvYcCWNBK25AlyRcYbZjxbyGA/UQ2wRLhoAXcT+POhFIE8rwvm8m6HfaUGbnBQEjXk3q3qyqvK1s0Puun1dtU5o@vger.kernel.org
X-Gm-Message-State: AOJu0YyqeG4B1+y8V3l92KBzZAT7tJc5+dYJ77XR815Ur5XWsxq8xloP
	rK1GJkwUmuh0Yebl7QauokwxjXcfOWdSbnihJoWKQG2zUM5QMFdKtaui+z9f0ovW6/GGpUSitcZ
	SrYWCWDPrJxqS6w6P+6e/kN73F6Fotrj1qJISH6R2L3RPDlYYymhUOfujolHz9L08B/YF
X-Gm-Gg: ATEYQzzxix1iRWFNK1BPJF4dJSajjElXm/cLZHReR4RICIDoGoCuTY47glB1McUF4tf
	9FO0GSlpXNEyseyb1sr9VLE5STmOKi2xUWGsknd3JnSw3efAxzfIvC4bq2xa2474Pu8G0AZpYZx
	7dNFrZExwsGzHvExNUhPQE2pTgyWNNMlmrVjyoJaCknD8w+jyKvewLQ3QrospG21PFhsfKtP5S/
	a7t+m7QiJ+eW+pwKZcG7voHFHgN9JQW3u0um7Yajt2ma8HNqtcUunPGZVizcaJeBGDmm6WOPjl3
	lCfENaaZWTpwxhuP1NeOgkTAFTyaWfRzZ/ZYmlZyJ1Tw1vl3LNPcWPICwoF25j3Y6px+nkVYEyl
	K2c43/Dq86yr0MjRwzr65Rg9lqBqDTIUAstRHQSo4+WqOQgftMwsd05QDsJ8=
X-Received: by 2002:a05:6a20:2590:b0:398:aaac:a079 with SMTP id adf61e73a8af0-39c87ab4125mr17742489637.45.1774942801008;
        Tue, 31 Mar 2026 00:40:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:2590:b0:398:aaac:a079 with SMTP id adf61e73a8af0-39c87ab4125mr17742455637.45.1774942800385;
        Tue, 31 Mar 2026 00:40:00 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baab6sm8013076a12.2.2026.03.31.00.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:39:59 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: qcom: iris: Add support for Gen2 firmware
 detection and loading on SC7280
Date: Tue, 31 Mar 2026 13:09:54 +0530
Message-Id: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEp6y2kC/43RzWrDMAwH8FcpOU/FlmMnLmPsPUYPiiO3Zs1H7
 SQdlL773Ka3MejF8BfoZ8m+Folj4FTsNtci8hJSGPoc1NumcEfqDwyhzblAgUYoJeF7aAN9w4F
 7hDSP4xAnoEqQsNZp4rrInWNkH34e6td+zZHPc8antVh0nBI98N3m/WGjsBBiSLBwPyfI/ZC6G
 rWARYMAQYjK6FbpWn8OKW3PM53c0HXbfHzcL/1LKqye2gP2pzBCuoTJHVcTfdkYZ5SxWL1qStS
 rNjcXB0uZGem9EqYsydXy9dGe244nmvwQO2hpIlikzCAzmQoboci+vqsSKxi5GyYG3035KRVII
 DTUWLZCin/Gaygx3Cthyj/fCF23kpjZe6yowtpqtK60ZYlWGqkaZUq2xf52+wVwM1vuPgIAAA=
 =
X-Change-ID: 20260331-kodiak-gen2-support-a70a099c5ae8
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774942796; l=18330;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=KcPFjMC/FNXOUA8YFdhq8Ae18GJIAuzw3HutE481J1E=;
 b=JUHjQWKW++l5TVsSc6HxFddXOYjyHfGjPoJWGFgsDeskc2wZZ57nlY6scj7j6qO/DZrBTXZQJ
 cI/qWr3cLlaB/cQelRD2XBuwBp2o6HcECV2qz4ZT/0NsJn2jyt2/YNP
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb7a52 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vAhLNi6rj8_hoSnI:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rTZW8fraxr8bdO3-5NoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3MSBTYWx0ZWRfX9HIZaP1k9VXs
 l2nJx8BJlt4LBC8nGsZZ7Htb/x46pFIQKP+zdsfsUD38pfniiOHxERXBIqpQGyM15W9jdv+rwBr
 sB9w887SsDQeiZdZyD0jgFUUuTh1dlG0Wjt4X+jsicRSjXVDcxXYoG2x7BwfHYuyt5GA5XBDqs7
 J1JCuGH9e3hDxiICZXZpFNFbyRoD42T/SntTWEQEYYHqu9BFGoNBeZKjrCWYEndkD8XBeBadOxJ
 8GLAK22e/hZaaeFclPEz75twuAQcw+7AwhRLcVgwtuEkI4eaolWi5R6Qn2WplaZn3hQ+Z4Qa4MR
 bv3H3A/bGzLDQyDHBMs2PEHCXt6WnPnBM2uxEEtKxDbZnHbP48D0j/6AnGDhYlS6T6YsemuXYw9
 YrDThtbsz4OtAq+M8Tht3rPPqxIH5Bq4NOdHTHAWmPQiJ2t1GpTTyW1ZkE0/m03EO2AQgX09pnx
 gPoH1C39aAoIQlqXj/g==
X-Proofpoint-GUID: yYNeb6GdfVBktVWJopTHYZDu0bhA9C1R
X-Proofpoint-ORIG-GUID: yYNeb6GdfVBktVWJopTHYZDu0bhA9C1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100953-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 690583655B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for running the Iris driver on SC7280 using the
Gen2 HFI‑based firmware. While SC7280 hardware is capable of operating
with either Gen1 or Gen2 HFI, the driver has so far only enabled Gen1 by
default.

Some platforms may choose to deploy the updated Gen2 firmware. To 
accommodate this, This series enables dynamic detection of the firmware 
generation at runtime and selects the appropriate HFI implementation 
accordingly.

The driver now inspects the loaded firmware image to determine whether 
it is Gen1 or Gen2 and updates its platform data as needed. Device Tree 
firmware overrides are preserved, Gen2 is preferred when available, and 
Gen1-only devices continue to work without change. 

This functionality is currently enabled only for SC7280, although the
detection logic itself is generic and may be reused by other platforms.

The series has been validated with both Gen1 and Gen2 firmware paths on 
SC7280.

Note: Patch [1/3] includes a fix for the GDSC mode switching issue 
described in [1] ], which was encountered during validation with Gen2 
firmware on SC7280. This patch can be dropped from  this series if the 
other series including the same fix is merged first.

[1]: https://lore.kernel.org/linux-media/20260126-kaanapali-iris-v1-4-e2646246bfc1@oss.qualcomm.com/

v4l2-compliance results on SC7280 with Gen2 firmware:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

compliance test for iris_driver device /dev/video1:
Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 38 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:
Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

Fluster results on SC7280 with Gen2 Firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
	- BA3_SVA_C
- Interlaced content is not supported yet.
	- CABREF3_Sand_D
	- CAFI1_SVA_C
	- CAMA1_Sony_C
	- CAMA1_TOSHIBA_B
	- CAMA3_Sand_E
	- CAMACI3_Sony_C
	- CAMANL1_TOSHIBA_B
	- CAMANL2_TOSHIBA_B
	- CAMANL3_Sand_E
	- CAMASL3_Sony_B
	- CAMP_MOT_MBAFF_L30
	- CAMP_MOT_MBAFF_L31
	- CANLMA2_Sony_C
	- CANLMA3_Sony_C
	- CAPA1_TOSHIBA_B
	- CAPAMA3_Sand_F
	- CVCANLMA2_Sony_C
	- CVFI1_SVA_C 
	- CVFI1_Sony_D
	- CVFI2_SVA_C
	- CVFI2_Sony_H 
	- CVMA1_Sony_D
	- CVMA1_TOSHIBA_B
	- CVMANL1_TOSHIBA_B
	- CVMANL2_TOSHIBA_B
	- CVMAPAQP3_Sony_E
	- CVMAQP2_Sony_G
	- CVMAQP3_Sony_D
	- CVMP_MOT_FLD_L30_B
	- CVMP_MOT_FRM_L31
	- CVNLFI1_Sony_C
	- CVNLFI2_Sony_H
	- CVPA1_TOSHIBA_B
	- FI1_Sony_E
	- MR6_BT_B 
	- MR7_BT_B
	- MR8_BT_B 
	- MR9_BT_B
	- Sharp_MP_Field_1_B
	- Sharp_MP_Field_2_B
	- Sharp_MP_Field_3_B
	- Sharp_MP_PAFF_1r2
	- Sharp_MP_PAFF_2r
	- cabac_mot_fld0_full
	- cabac_mot_mbaff0_full
	- cabac_mot_picaff0_full
	- cama1_vtc_c
	- cama2_vtc_b
	- cama3_vtc_b
	- cavlc_mot_fld0_full_B
	- cavlc_mot_mbaff0_full_B
	- cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
	- FM1_BT_B
	- FM1_FT_E
	- FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
	- SP1_BT_A
	- sp2_bt_b
	
./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
The failing test case:
- 10bit content not supported yet
	- DBLK_A_MAIN10_VIXS_4
	- INITQP_B_Main10_Sony_1
	- TSUNEQBD_A_MAIN10_Technicolor_2
	-  WPP_A_ericsson_MAIN10_2
	-  WPP_B_ericsson_MAIN10_2
	- WPP_C_ericsson_MAIN10_2
	- WPP_D_ericsson_MAIN10_2
	- WPP_E_ericsson_MAIN10_2
	- WPP_F_ericsson_MAIN10_2 
	- WP_A_MAIN10_Toshiba_3
	- WP_MAIN10_B_Toshiba_3
- Unsupported resolution
	- PICSIZE_A_Bossen_1 - resolution is higher than max supported
	- PICSIZE_B_Bossen_1 - resolution is higher than max supported
	- WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
- CRC mismatch
	- RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
	- VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 235/305
The failing test case:
- Unsupported resolution
	- vp90-2-02-size-08x08.webm
	- vp90-2-02-size-08x10.webm
	- vp90-2-02-size-08x16.webm
	- vp90-2-02-size-08x18.webm
	- vp90-2-02-size-08x32.webm
	- vp90-2-02-size-08x34.webm
	- vp90-2-02-size-08x64.webm
	- vp90-2-02-size-08x66.webm
	- vp90-2-02-size-10x08.webm
	- vp90-2-02-size-10x10.webm
	- vp90-2-02-size-10x16.webm
	- vp90-2-02-size-10x18.webm
	- vp90-2-02-size-10x32.webm
	- vp90-2-02-size-10x34.webm
	- vp90-2-02-size-10x64.webm
	- vp90-2-02-size-10x66.webm
	- vp90-2-02-size-16x08.webm
	- vp90-2-02-size-16x10.webm
	- vp90-2-02-size-16x16.webm
	- vp90-2-02-size-16x18.webm
	- vp90-2-02-size-16x32.webm
	- vp90-2-02-size-16x34.webm
	- vp90-2-02-size-16x64.webm
	- vp90-2-02-size-16x66.webm
	- vp90-2-02-size-18x08.webm
	- vp90-2-02-size-18x10.webm
	- vp90-2-02-size-18x16.webm
	- vp90-2-02-size-18x18.webm
	- vp90-2-02-size-18x32.webm
	- vp90-2-02-size-18x34.webm
	- vp90-2-02-size-18x64.webm
	- vp90-2-02-size-18x66.webm
	- vp90-2-02-size-32x08.webm
	- vp90-2-02-size-32x10.webm
	- vp90-2-02-size-32x16.webm
	- vp90-2-02-size-32x18.webm
	- vp90-2-02-size-32x32.webm
	- vp90-2-02-size-32x34.webm
	- vp90-2-02-size-32x64.webm
	- vp90-2-02-size-32x66.webm
	- vp90-2-02-size-34x08.webm
	- vp90-2-02-size-34x10.webm
	- vp90-2-02-size-34x16.webm
	- vp90-2-02-size-34x18.webm
	- vp90-2-02-size-34x32.webm
	- vp90-2-02-size-34x34.webm
	- vp90-2-02-size-34x64.webm
	- vp90-2-02-size-34x66.webm
	- vp90-2-02-size-64x08.webm	
	- vp90-2-02-size-64x10.webm
	- vp90-2-02-size-64x16.webm
	- vp90-2-02-size-64x18.webm
	- vp90-2-02-size-64x32.webm
	- vp90-2-02-size-64x34.webm	
	- vp90-2-02-size-64x64.webm
	- vp90-2-02-size-64x66.webm
	- vp90-2-02-size-66x08.webm
	- vp90-2-02-size-66x10.webm
	- vp90-2-02-size-66x16.webm
	- vp90-2-02-size-66x18.webm
	- vp90-2-02-size-66x32.webm
	- vp90-2-02-size-66x34.webm
	- vp90-2-02-size-66x64.webm
	- vp90-2-02-size-66x66.webm
- Unsupported format
	- vp91-2-04-yuv422.webm
	- vp91-2-04-yuv444.webm
- CRC mismatch
	- vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
	- vp90-2-21-resize_inter_320x180_5_1-2.webm
	- vp90-2-21-resize_inter_320x180_7_1-2.webm
- Unsupported stream
	- vp90-2-16-intra-only.webm

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Changes in v3:
- Rebased on platform rework series by Dmitry.
- Moved version detection logic inside iris_load_fw_to_memory (Dmitry).
- Make Gen2 as deafult for SC7280 and falls back to the Gen1 name only 
  when the Gen2 image is missing (Dmitry).
- Link to v2: https://lore.kernel.org/r/20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com

Changes in v2:
- Improved the logic to detect if firmware loaded is Gen1 or Gen2 (Dmitry/Konrad)
- Added a patch to switch hardware mode after firmware boot
- Link to v1: https://lore.kernel.org/r/20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

---
Dikshita Agarwal (2):
      media: iris: Initialize HFI ops after firmware load in core init
      media: iris: Add Gen2 firmware autodetect and fallback on SC7280

Vikash Garodia (1):
      media: iris: Switch to hardware mode after firmware boot

 drivers/media/platform/qcom/iris/iris_core.c       |  6 ++
 drivers/media/platform/qcom/iris/iris_firmware.c   | 65 +++++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++
 .../platform/qcom/iris/iris_platform_common.h      |  6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 11 +++-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  8 +--
 drivers/media/platform/qcom/iris/iris_probe.c      |  9 +--
 drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +--
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++----
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 ++++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +
 13 files changed, 120 insertions(+), 45 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260331-kodiak-gen2-support-a70a099c5ae8
prerequisite-message-id: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-message-id: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-message-id: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-message-id: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
prerequisite-patch-id: 34d473ba50399f8cfaf583f4def12de776aad65d
prerequisite-patch-id: 5a6a2b41c9312687512db5d12bac95114b8d8719
prerequisite-patch-id: e6ec4cd9eb5e93f3443f5f496a1b990a95b5d96d
prerequisite-patch-id: 4be4bbb454444d6f314c2b6ad6a73290184e6d57
prerequisite-patch-id: fd9cd7882f2a8f1b6141f48ff5c3da708839d03f
prerequisite-patch-id: 952471fa5477280d399978c05fbc9bfe6d2d33b0
prerequisite-patch-id: 01c5b37358de833f85de1954f770fe0489818a16
prerequisite-patch-id: dd14b47d6cd8ff14d1bc78c187c061f6fe262fda
prerequisite-patch-id: f4eba0865e7f91bce3fb4b2c627ee123980e0ff9
prerequisite-patch-id: 72984784b916e2d94ede8ab7d52cc0dedfa37c41
prerequisite-patch-id: 2fabf4e36b4e4f74b27fe75133ab8ba0ec9b6e3d
prerequisite-message-id: <20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com>
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


