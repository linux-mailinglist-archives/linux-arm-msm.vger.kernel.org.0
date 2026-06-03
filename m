Return-Path: <linux-arm-msm+bounces-110939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O632FdASIGr7vQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:41:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E2637279
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:41:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QfkMf92Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AdVDilt0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110939-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110939-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA8F53044092
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D66643E9D8;
	Wed,  3 Jun 2026 11:26:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011D63ACF1C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:26:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485981; cv=none; b=JgKWlhFLJArh7fGL/a/f8dFukuVqJW03seZzycQZIvQQpLtiTrWIgp41tBactt6eFUOPufPRVIfQNwAGZeLj1XKE0wzK3MOf+1GAsFKNUgcp/2EdzEeVCiVolZNgViuBCA1dxVeM7ya5eKXF4SZmRHNVpG4kaF09As9c+C4ml5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485981; c=relaxed/simple;
	bh=P0gP3G/IWPqITK42jVKRXDA25rwoPd2omiKXW4QQQFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mUK/O/XSy8fHqGBtJbPWnq4nSdsRcTj+oN1j9v9MfhDYQaBfvp3LAtFoiwfvTWeXW48v2yqVSs6DWY2v8PADbAhHdFbs7xlR0Iox9stAZOrFenN88La2nMgqqGt5PZP4o57X86j+sRXDv3pdyLHaxVPR0T9ff5JK6EpTe0VWPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfkMf92Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdVDilt0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6537F1dn1956647
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i6ZuTkqLJTr+Zb68NOePOg
	D5Ckp3vOH2IUNNiD17b6A=; b=QfkMf92Z8LYzDOd/Fhtm34KDgwb4OzrKTpqATN
	rSp27mdf+vNni+iERepy+Byle9smftsnMz4ED+BpKlO8Jbcev6WCv55QMwJ1v91S
	//GoVQcpKWlAnU75+4+z65M2G0JEjYCk3ng7Ctt0oqcoBlMCUrkZXzydcaEC42Ed
	zqdv+Wx//5BDVJca5782DI+/sZShXHu6zlCyBo0v6HoyjqZKIjAAogcfmSsYvfuE
	4mRV/ksWVtmd6bjRW8KmPcnHXCrEOhRWVFXV0ywNommbySLB3ZUO4fNIoy1ToTbS
	7UJI7ks/PP1tT9/Wcbz9K3eu5RQfV/LSntfRJBQOOMRSlzVQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc110u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:26:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a81c1738so26086705ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485978; x=1781090778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6ZuTkqLJTr+Zb68NOePOgD5Ckp3vOH2IUNNiD17b6A=;
        b=AdVDilt0/5158MAcsCQ7xG8XdrBfYqJTJSsuH8RWyJBT08VYLoi3cjTV4fgDK9yxvX
         8orYC4IofGy/rYh90ZnHpINlk8njXLA2EzuPQje0iOm/c2g/PX7VOdGpMNHqrJ57+inZ
         VS8NyO0l6RwZzaE4S/F8NRBXg/hWr1zmjy7xtTaj5IQZWVk16L29SsdSNxSvpqy1lZ09
         feC/34GnZkEIelY9zS4PfGuss/UUArZF9OLWdYUTpXUY77tbEqa4mZ5WsxMCH6IknKt6
         gO+ADHlzVV4yFVc5bogbEAjJ7ySRRWSF18sAYgseMWsaVSDXyC5AyiMhtYdMFqyuxYmv
         1utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485978; x=1781090778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6ZuTkqLJTr+Zb68NOePOgD5Ckp3vOH2IUNNiD17b6A=;
        b=V8RXS1sc1nwzBKdWdB0HDUtN9mPrjq5me9o2QqJwmD7wlVnIOdxayJo31ILnKefCfm
         c5Cf3YCTjVWMULEKNRnlpIIMESOdZ3dPMDMBSnCA/ATcYcemsbuOCO3/lVlkzk63+7kk
         eobCoBX6bv/N2q25s1VAIXA5b68lmhP0/1tPze8Uan3y5D1stVTa2+WaWpnWFiQyBP5n
         +ajf0OXxFHKokb3KqNsgIbQW4qbZg30DWM+/Yay4oqwvDzvpIqgpDJI+U0TQQWEe9ZwL
         Q0OH0eOlmc0/9pPlSYg/CTu8TvHJablEPtEUY8oOOppl3m9AVPvjfn9HvC6cPZiSBxzx
         rMVA==
X-Gm-Message-State: AOJu0Yxta2CbDSMAVanmByO1ymJgPgzHgHOtzAeWlvr5zgLVoO/JgtkF
	9oFaSxny1lnbB7kPBzIOnqPmyM+I3K+yNKNI6FXEaG7Bu8uL+SLTk623dsXrsDWWGVSYQpbkjx6
	B2JBhCxnqxjH4brlp+bLer+R2XioZmzbgJr34a4AaHPUOewMFujSOt3XQvEK+aDltKFKx
X-Gm-Gg: Acq92OExjjkWj5JzQ0jL0N5v6hNSyd3HUx1sxaWvmvyaPpL5Jpy6jKEeCTbZvkPBjfQ
	d4cgEglcsSLHmadQ8Ygd5nx5GxmbWjWacEw0iFCnfLL5Jnrk/bXx+ixVLs9UT/jxMiTV08NO1Et
	Rd90iksIWzuMryLHDC/JXy/rtcVngU6PqODFcp/s8c+Q25Q/85KbfY8AnAqDDNjA7ypGdSS/ca3
	3SIAz/tLDiAbpxLp4cTiNM2/5fSQFZsS4QuMogWXPX5R4shV4pH6Fdp+Xil/qXtg8adi2eE3umG
	9kHx0wb+R1KlhRfbVL8F22aDrHkPyH/5jVZKCB3+str4sqqkNONlYvuUR8+4gl14PqdvNQspmvU
	swzxb+oGdLcMORkrDUy53kzyEkoec1YRem+w5oPoa0xzXSzCtt1IeLko=
X-Received: by 2002:a17:902:e5c6:b0:2c0:cb90:1e07 with SMTP id d9443c01a7336-2c163a12aedmr32539435ad.11.1780485978152;
        Wed, 03 Jun 2026 04:26:18 -0700 (PDT)
X-Received: by 2002:a17:902:e5c6:b0:2c0:cb90:1e07 with SMTP id d9443c01a7336-2c163a12aedmr32539055ad.11.1780485977695;
        Wed, 03 Jun 2026 04:26:17 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm22704275ad.45.2026.06.03.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:26:17 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add EPSS L3 provider support on Qualcomm Shikra SoC
Date: Wed, 03 Jun 2026 11:26:11 +0000
Message-Id: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMPIGoC/3WNyw6CMBREf4V0bQl9EeLK/zCEFLyVq0CxF4iG8
 O8WXLuZ5CQzZ1ZGEBCInZOVBViQ0A8R1ClhTWuHO3C8RWYyk3lmpObU4jPYCkaiqlPcSGkdaFc
 XzrA4GgM4fB/Ca/ljmusHNNNu2Rst0uTD53hcxN77K18Ez3gtjCysVrlQ+uKJ0tdsu8b3fRqDl
 du2fQE9BzMMxQAAAA==
X-Change-ID: 20260524-shikra_epss_l3-522afe4fb8f5
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: 7zaZr0NKsiPpLyM8pFgsiodfvUEptJ5O
X-Proofpoint-ORIG-GUID: 7zaZr0NKsiPpLyM8pFgsiodfvUEptJ5O
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a200f5b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=DWCbI4xYja3NA8O2gMYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwOSBTYWx0ZWRfX3t+BIckAUya7
 MA28Nux7nnjz7GLbOMmxs9WNnewiIsUB9JfghDUcXCKibmtqdnJQpCm6mZeJsz0eJuk+7ozULhS
 +el91IEvdYEDYcONH0Zx5g0cuBaMAi9PhK5CAbr80ck+8noAx0Vgq1IZbqxKdWnuHGPgg3Q6qd3
 leHt0YEf5s/PiV0s89vWmeC4BoJdgGs41RjTZ58Wibd982wvN+sIgpD1J3pXF/ltyr779zh+PMq
 DU/KuOTdgU0DuURTP/9PfVw7k6VPs8e9AeC2D6ImlSeV75lnoT9+XDg7N83rHkW9TAo/WK/MLZO
 JeOr6x4H8ThRSmoGF2BgR5drQpSFx5up8xxOIVMreX4D7g9qArGmVB0WMgSaOEkNB3Oetnzqvk9
 VBPYkzfpSJLz1sqqLN+2FNTOfAYADfCIrzKdAn4iswbWiI8QAR6z3FXWmPobOjxtakorR1ehQd2
 xQaull2/CLuq2ZWP8Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110939-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA7E2637279

Add Epoch Subsystem (EPSS) L3 scaling support on Qualcomm Shikra SoC.
EPSS hardware on Shikra is similar to other SoCs but supports only twelve
L3 frequency entries (LUT). Reading the LUT beyond supported frequencies
can expose incorrect frequencies.
Introduce new compatible to represent this constrained variant of EPSS.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v3:
- Update the commit text to reflect the correct binding yaml.
- Link to v2: https://patch.msgid.link/20260603-shikra_epss_l3-v2-1-480cdb5abc85@oss.qualcomm.com

Changes in v2:
- Use the existing qcom,osm-l3 bindings to describe the Qualcomm Shikra
  EPSS L3 hardware, as it is similar to other Qualcomm EPSS/OSM L3
  hardware. [Krzysztof]
- Link to v1: https://patch.msgid.link/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom,osm-l3: Add EPSS L3 DT binding for Qualcomm Shikra SoC
      interconnect: qcom: Add EPSS L3 scaling support for Shikra SoC

 .../devicetree/bindings/interconnect/qcom,osm-l3.yaml    |  2 ++
 drivers/interconnect/qcom/osm-l3.c                       | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-shikra_epss_l3-522afe4fb8f5

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


