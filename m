Return-Path: <linux-arm-msm+bounces-107692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGGRIuYwBmrhfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 22:30:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5452546B86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 22:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED268301589F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 20:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658CB26A1CF;
	Thu, 14 May 2026 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOSGp+Sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QW8b9F5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9439B97A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790626; cv=none; b=M2MbIWVHWq6hZ3cLWo6urorJnomAamb5TjtSoTYyBDzD3/4ON6wT1PfkNnr7EEXft9eH4f4kh20EtG+i3HqnU7MasYYGs7m5vzP4wYfVAwgBKs4F/xhci60TeEk1+YyGxFLDcJDRs7huAR0ef1KFBGf6SLlRroyPubH6wsw2yWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790626; c=relaxed/simple;
	bh=hBUEdU4gtKk6cuED59MJsN9YQuh0ekZNAnrR3Vh+OK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LGtpTXMGJeJxg9QT+udeV9hGkkLnCPR/DabgYE4Q0uBa+Bnte+O+Q30oV4aO7YNkrWCNt2viIADbFB2V8WcZ7nx2k1gJk6BHBkjoRintNiIk3SzoRQeR005j2CTo1c/+lZ/VbdZ0WvUOlx1IAkgU6JHQElj/QoEjcka3buzpNdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOSGp+Sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QW8b9F5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIq7GB3797495
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vy4HqHBCl3ieq4x5BJeO/r
	Gc0+4lnXTUCuMn6y7ah8M=; b=VOSGp+SbOMvsBs+w9+tYr4c5v0kN3YZkG/J1nx
	LSxwWVNuoRP9trDM2Rdq+Q8WfyogGYHnAYsvFmr1lQTsKMgSTMR7nznXj0L6wije
	Giau2uoI7ZL9Oerd+FJah4y1Qr6VMv3f6lu5luf1Bc8qnnj7Tf52To4kLvj/B5Ls
	mis9M8J9Tbx+X7SUQdg3YdGZB7amAfGk7UPDnEXLJMP+vb0YL91b23Q9pQW8vskc
	SmLCuYSkijL1GgaWk+c+4NpQRJ7rSh+6sEB4JhAGKZDu+LsE4LAsH8jm3irfliMx
	Id8K4W21xkFknukfSpL4Z68JJJzm8q5bhYvkh+uPqpy+TuRg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sr9np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 20:30:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so4961303b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778790623; x=1779395423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy4HqHBCl3ieq4x5BJeO/rGc0+4lnXTUCuMn6y7ah8M=;
        b=QW8b9F5V7Xdwe23X3rFoDXtLzJPqCGz8NQ8mivsdZiepK/NAdj2YkuVmxncUNyYFOv
         ej2rvvetbUprh90vzPErlDi/GRxnO6+I5x7iQsYDrzFYIO8ffEYuTmhuTcRJGRNFsc8C
         yYKWsGvnbvyyT19WyzflsjNKOkWb3hmxumP7fsQADMi2iKELih4XNPROPQHL8FqVDb+S
         RdxiphLOVHNC1/plu6nZCK9yB7tB8nrKatCVR27KW/dnlcFKxq5pFhnNf7XZrLMDTkfH
         F6XXLpd2SlyjjgD1Gm3G8+3fWjYoMt0nWgcco4UsaKKqBQuaFLHEsgQjLrsx1hcS1Afp
         TJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778790623; x=1779395423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vy4HqHBCl3ieq4x5BJeO/rGc0+4lnXTUCuMn6y7ah8M=;
        b=M2aB6MLinbBLS3vDw6VZgFwpi8SgU4mgmggqP2T2h0OW7PKErOlu/VQPcc6LK305iM
         j5ep5DlVYmZL3SMA3bsGnYGIvpIAJO+rgkky2j8eDwt7ij/xp/zZuTGM9hPJ6O6jPgiG
         V12ihctQe81aEURGgy9K2DvyBNjmmNMALRZ968leUl0X/5sQ79sq9GniwKQ+pQMs8Kf3
         tCopmCixEGPcYETv8WMAp9FnDGi8RlxtcZYJHuqLsrmjWewXUPwzMNBg24b4+9Mb7/Bu
         9ewTvt8zgR7RE1Jlkg6OmQ7mhUpV/g7psA8ItESyI+axqJBtXYUhCsWzPw4hNf9aO5YQ
         8JXA==
X-Gm-Message-State: AOJu0YxF3+Aqidij4tvWHYFO1h2wE6gYgycrJztgofrva+NVMPbqiyuk
	fHErrmV1RJcppj656pxl6zigfLrht/HumE2jrL7iYM/KfGE373UkYA/1ffyvxNnvj86Mx7WJ/9N
	yK3hsFVuZ+Mr+kvYJFA8rFUd8zewATxF9+qYDg5RsgpJrg/Af5r7N/gYON/FFyuZn1MBZ
X-Gm-Gg: Acq92OEUj+CQlbgU9s+Jsy2xiCpGAfTXQdVILgf4kgUDzmJ27VsJxsXwDIn+LDXfZDJ
	T266wEzsnT7MkMq17OYokPvf8rx7iL9MNbQXt7dOYbKxwTkSy77xhVARsr24xh0siRMX8Hyj8JS
	3240lMn8Z15L96MKRYtofzXnpMR2aCCfbpuQr9/OAampNfK9iZKLAXyhVaJXpgf9wFmIR0JTAoY
	8QmCbU5FIk5DLtceuyyFPSAP3oIKLWXzzP1rjqy+5AGYIJW0v30vYB2A4vHVsawP0kCDI1+A4Lu
	qxAgYEEyQzc1sky+MPZ1yiLSdxolK9KAupFEbQ3r+sq9gr7a4vkRe8Zd029m61MNAyBHPxDRMQt
	S/wxVoeIKR53LguNMslQ/Fki11KH5RPpDaWFMW8eDxDo4nUla9AK7rBg=
X-Received: by 2002:a05:6a00:a214:b0:82f:7ba2:e120 with SMTP id d2e1a72fcca58-83f33cf0be8mr1091878b3a.28.1778790622722;
        Thu, 14 May 2026 13:30:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:a214:b0:82f:7ba2:e120 with SMTP id d2e1a72fcca58-83f33cf0be8mr1091839b3a.28.1778790622172;
        Thu, 14 May 2026 13:30:22 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm3666952b3a.1.2026.05.14.13.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:30:21 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for ice ufs on shikra
Date: Fri, 15 May 2026 02:00:07 +0530
Message-Id: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8wBmoC/yXMTQ5AMBBA4avIrDWp+gmuIiJVgyFBOioScXfF8
 lu8dwGjJWQogwssHsS0Lh5RGIAZ9TKgoM4blFSZTKNY8Eiz1Q0ZbFzPIi06qROFcZIr8NFmsaf
 zG1b1b3bthGZ/L3DfDy+FWL1yAAAA
X-Change-ID: 20260513-shikra_ice_ufs-59d0a42e3482
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIwMiBTYWx0ZWRfX2VzgvCxEeNMz
 3I+K3hp3nbvtJKJKm2lp8LbtQ8XsskEDurVHLtqaNXoJjNTGzXG512eGzIgwlnUPyUEAt/1fVCY
 jQRPanITOzB0TxXt+6nhH9+fa3OqTi1vWPsGaTywzy0SaH4E3vKpjMOi6Z78kV0zMCXU39Ya8Yo
 RNJTc+LAqg+CbVJ/8QV3hqbPMk7O6AsRIL/cpmFZ8fqV3cziRMEf07BJvVuTN7onZ9WSPAYP6C3
 mbDmvmcsYeH5dzHMZukSnC3NB4iPhBgBLw3gAowy1OdsnHhp9yvHZRtx2Da1j0yIURx4DhACHO6
 ZlWlqWM4NXWBkFg29CdUOg3kz1pbG8qiSuXUXY9/AIr5Jy5rA73ckFUvzSpw/l8JoxWSLar1i5A
 ZomLsvYFLV7HoeTxkj9vq6clWclvhm/Y/FJsC3dg76TsTUI6ON397JkR9II80zdY9KC68iMFuDz
 Km9sZzCTxSbvZ3GkfPg==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a0630df cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OYeRMZJyD6lClM-JVRUA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: RyQqeZFL5vmLFSQucGUuGPEfRqfuz0_E
X-Proofpoint-ORIG-GUID: RyQqeZFL5vmLFSQucGUuGPEfRqfuz0_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140202
X-Rspamd-Queue-Id: E5452546B86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107692-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This patchseries attempt to enable ice ufs on shikra similar to other
platforms.

Validations: 
- Driver probe on bootup.

Dependency on:
- https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
- https://lore.kernel.org/linux-arm-msm/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Shikra ICE
      arm64: dts: qcom: shikra: Enable ice support

 .../bindings/crypto/qcom,inline-crypto-engine.yaml           |  1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                         | 12 ++++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: 7e247866bbe72314f68036d5171c1af354ccdbe8
change-id: 20260513-shikra_ice_ufs-59d0a42e3482

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


