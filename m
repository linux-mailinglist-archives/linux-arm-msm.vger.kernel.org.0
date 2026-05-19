Return-Path: <linux-arm-msm+bounces-108378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPrHFMIQDGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:26:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0B57905D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0B6C300E257
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5393B4EA5;
	Tue, 19 May 2026 07:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkVcxoaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c590TDHf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FCA3D16EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175469; cv=none; b=DLcOfos7x5wvPfIpXJTQl1KkCI4Bj9zgLr+ta+ljOgmhiY8XNfgZCv5UMN8pbympUnNoTyJwOoF7eRycVZUFBWv3A0xKPKm51awaQ4urQctB9FPa5XYWPYZFH0DCbP6JfLmpPQIAid7gOBbHlFsuxY4C7gG1qQ3d7PX5llrEqBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175469; c=relaxed/simple;
	bh=TRdZJGL9EF3Ajo6Y98unsizaJ1+MqHdtyxCFx35XUyg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FGIP4I4+GLHFv6M/kjynnApQnDGlApvX01c0QxFp/qbIhX54ldp4cTKSNr6yD7vISKdTt7pjwsV01HLHWti/WgspnXtrV2Vtic+PYlW5EQgPxf8l15eSFH5UP3RsJy7+JswNuzn9G42Hr9x2UzhRa3IFecPzd+maviEpamkLwbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkVcxoaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c590TDHf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1Tf262975727
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vI72ozYDgrs1FdXLZkGrWA
	JtfR6YM+4nOxk99e5pYXg=; b=dkVcxoaR3hnlExcu+2niWKy7H9HUKdKzViV/Xw
	qYzTtEzhu/tAST3DQZCKv2Ph3qG5/ZNWK9ccRnEBaLqwbOH3U7iekf4YY4xlRmB4
	d/x3M+Z7p0eW6N3TnFPSJ49Hq8OF7H1bWx/vWmKhTqwbLxfPMhBLc31IAOmOm+vh
	2nFJS7il9Mtmp01Iy173smnwY68Qxe2qeqbhxU5hCLDfeDMCQO9wlRVShMJzpskt
	przSTNiMmRMqsUHvEcu4jWiY4enL+U2F6dXHbEhiHcGfWtflCmvOvk6LBJgVkz2z
	P4DK31KRVpMLJ4WmnV3TqJNhryov6hrGQ9arGKo3btTFmxSw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4b6e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:26 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dece274b1so4599183c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175466; x=1779780266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vI72ozYDgrs1FdXLZkGrWAJtfR6YM+4nOxk99e5pYXg=;
        b=c590TDHfJHQxPrAbedH3nQVVIWPlB58qzCH64Scq6Pi9ChwprR9uxSRYYdaQ6CO/Uf
         pu0U0XjGkpK88cn3K+rnTGlDJ2aAp0NT/1RXkaDdTufQIpkdI0wvZpV9LWbHpFkOcJmP
         mJqA+AaA+T6KTgl6oZx02YcnsKt4PySXT6PCoPnfZMY4rdF/XEYHImrV9OtLD7PlRTvO
         uYd5WEVr5xsQ36ZJBEMujrxwS6lFcnoGTpNtKc155GFZB/Ln+BD/wkm75YiC03WI5ILD
         cOCainOA0BQUvURVHLmp67Q01GekbgEDF6IxMergLMzqYh5M2ISa+XaSZVjJKqGuSizQ
         nvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175466; x=1779780266;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI72ozYDgrs1FdXLZkGrWAJtfR6YM+4nOxk99e5pYXg=;
        b=JmSs1Hm8lzjbc9r7M2yxsnzfl9VCJu4tWoTCMsyqHtGV7Yt31+p4JTVd2DQdZArf1Y
         8aptvmNUigMKJuj9ORYRar3HtFpK3/C6Tsy69Ro0+33rZ1cOI+gg/uvwrdZdqG1cjY8p
         s0Ok1aOQouG2nlUh1Qgu92dPiwTUxdstMm4DmQ83lONA/9LjpN0nGoFY1+n3JvxPswDK
         i4qljrdJm+cjj8QWigIoWUlqw/KKJGF63ErU7LGcgp/5NOkyVA1DR+hjGN3RgNxvb+7J
         KFRlmKzMH2HjMNOJo2Z7+vZoJDMvYGC7l+q/WwH52hcGdsVDdL52jEaa5VwTMPTnAhri
         7S+A==
X-Forwarded-Encrypted: i=1; AFNElJ/oAcHUC36GW9PHhoiMXHKoVgPcRMwtT/A+uCIFYTiMRPVQ9CO9Dn/k9PKY+IQA1dfSz9mHg0+wx+zCvDJx@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDU0SqVpTu0V5raCfeRipKEWH4eAVQqjDBLkvlJZPk7bZQ6Gs
	SdMQVqara5kbCALAGVcQsfEiwe0tQxAy1C7hQaehvQ132bn/6wbYS2jsfaxOFG+q4dJeJtFIkE5
	WndTNu3dkj40OwyThfiUINHpfifSgjodEoW3I4eVi5Vr5LR1yN6qUEtsR/L3rug7lk1TW
X-Gm-Gg: Acq92OHfw2kUEut4m1r27tkiWfDOWARLS2Hwm/lpoIJxgY4w5KrJRAs+3BNwmA9oxg/
	HVgSWaOLlgrfvnxdl3dbxC20KLodbqSbQkcl86ye2IsKCsYLE3YqW7Kw3Bi7Kh4PeBXsKu71Uja
	Ou2ygVBLxP5HPL2n98a9xfMCqp3Zob+oQmhlpLdkRs+opu8fP4YQp1Ki8y4veH8HDyRX66GBTAv
	19SOT9f5livkcs+I7MRcn9fPejcOBv7XKw5Gbp4KwpFI8SYgG7boWXtSb9f3n7RO/7N8qkyDvS7
	rLS5kvll5fpFO/vjN6PVamd53ThCxDvv6ni1qkkjEnaS3UjrVUgEOeq03n472/hmU6IQAnpVua5
	sz2TbhrXCwGoP8Qa8EKx1iUYZ3jFOquy0WQKT3n07V/u7SAGiQZf16SbzGUUU+2QnEX92hGE+
X-Received: by 2002:a05:7022:f9d:b0:135:46f1:6290 with SMTP id a92af1059eb24-13546f16347mr4761307c88.25.1779175465995;
        Tue, 19 May 2026 00:24:25 -0700 (PDT)
X-Received: by 2002:a05:7022:f9d:b0:135:46f1:6290 with SMTP id a92af1059eb24-13546f16347mr4761266c88.25.1779175465385;
        Tue, 19 May 2026 00:24:25 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:25 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v6 0/6] Add binding and driver for Kaanapali SoCCP
Date: Tue, 19 May 2026 00:24:18 -0700
Message-Id: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMQDGoC/02NwQ6CMBAFf4Xs2SVtQyt44j8Mh7ZUaZQWu0o0h
 H+34MXLSyaZzFuAXPKO4FQskNzsyceQQR0KsIMOV4e+zwyCCcUkr/EWJqRo7YRHo7gxQhnONWR
 /Su7i33vr3GU2mhyapIMdtgKTrN60wdMzps/+OPNN/sUr1vzFZ4kMayZ11Qguql63kah8vPTdx
 nEs80C3rusX1Za2U8AAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=5017;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=TRdZJGL9EF3Ajo6Y98unsizaJ1+MqHdtyxCFx35XUyg=;
 b=bWdmRcv2ZnGM/ClnayZ8xUQ2Z/ORTkRBRqd9VK5Wxl44J06Izr/FyBOGaGcoJd3AOqvrmx9Zb
 ecrXPMbnffoBLfK7+S3SBOLKLHU/EsJ9dSysfFxRgBJtlHXOVAyrwHU
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c102a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WeUGynHAJ14ZQk6zy-QA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 4d3fEaFzYLne--wdIJ7pFs-hImjQFEPO
X-Proofpoint-GUID: 4d3fEaFzYLne--wdIJ7pFs-hImjQFEPO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX8D3Xejhaz0ek
 AjswAtTWBBM6cf8myIsi4Ve1oTaGV27oPqxeLNev8su5PS++9j7JNZBZkOLSCZb/zonJ8jY/dZ3
 +aHZ06p8cR1P9MMbm1SFHim/WB47qDNb++3nO8x/t/mgE956Kkw4ZETiNtluTH4HaoaqaGFQ+TH
 U5tHHotNtS0o4qWtXll5xFrbML6rtGaAWllwAPrVXbl156igheFj75kr/hzeeSbC4dx7biYNq3C
 0buqVbWP8IOuxXarlJklO3X+0Mj3/N+tYRuPRiOPPETE8dqYeYJ781HOR8BRbXX1OH9ZjD1fL+l
 3CitK3yPddfzLWmCo1vb7+1huzR+xkgcGZE8u5S6KCaxPKhEI65EU8XC5bs7xHSv+0gGGfd412H
 wXzmlsg4zMLTdJefMglRzyq4Qi4c1uyzHrc15kKzQ7CflU99Wg9hJlicvMFE9bAr6eiUOa/bp0V
 xOtSg1gKgwpLQFN5g+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108378-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFC0B57905D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial support for SoCCP on Qualcomm Kaanapali platform. SoC Control
Processor (SoCCP) is loaded by bootloader on Kaanapali. PAS loader will
check the state of the subsystem, and set the status "attached". As the
interrupts are redefined differently for Kaanapali SoCCP, list for the
interrupt properties are moved out of pas-common.

When we return fail in the rproc attach op, current remoteproc core cannot
handle it correctly for further recovery/firmware loading, which should be
generic problem shared across all remoteproc drivers that do attach and
not mandatory for normal bring up, a separate series is used for resolving
this:
https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v6:
- remove ping-pong in the attach workflow - Bjorn
- fix handover_irq imbalance - Stephan
- add attaach callback to minidump ops table - Jie
- pick binding for Hawi SoCCP
- Link to v5: https://lore.kernel.org/r/20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com

Changes in v5:
- squash "qcom,smem-states" patch with the change changing pas-common
- drop the patch that set recovery_disabled
- remove the 5 seconds timeout in qcom_pas_attach and related logic
- patch rebase and add reviewed-by tag
- Link to v4: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/

Changes in v4:
- drop adsp/cdsp binding that have been applied
- move interrupt list out of pas-common yaml
- add constraint for smem-states in each file
- "wake-ack" interrupt and "wakeup"/"sleep" smem state have been deprecated in design, drop these
- coding style fixup
- add a patch to disable recovery during rproc_add to make sure rproc_report_crash can be called correctly during qcom_pas_attach
- update the handling for irq_get_irqchip_state -ENODEV in attach path
- skip qcom_q6v5_unprepare if the state is RPROC_ATTACHED
- Link to v3: https://lore.kernel.org/all/20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com

Changes in v3:
- Drop Glymur ADSP/CDSP binding 
- Extend the "interrupts" and "interrupt-names" properties in the pas-common
- add missing IPCC_MPROC_SOCCP definition
- fix complie err caused by qcom_q6v5_wcss.c
- code clean up for late attach feature
- call rproc_report_crash() instead of set RPROC_CRASHED state
- fix q6v5.running and q6v5.handover_issued state handling
- if wait_for_completion_timeout return 0, set RPROC_OFFLINE for PAS loader
- Only ping the subsystem if ready_state is set
- Link to v2: https://lore.kernel.org/r/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com

Changes in v2:
- Drop MPSS change
- pick Glymur changes from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com
- Drop redundant adsp bindings - Dmitry
- Clarify Kaanapali CDSP compatible in commit msg - Krzysztof
- include pas-common.yaml in soccp yaml and extend the common part - Krzysztof
- Clear early_boot flag in the adsp stop callback - Dmitry
- Use .mbn in soccp driver node - Konrad
- Link to v1: https://lore.kernel.org/r/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com

---
Jingyi Wang (5):
      dt-bindings: remoteproc: qcom: cleanup qcom,adsp.yaml
      dt-bindings: remoteproc: qcom: move interrupts and interrupt-names list out of pas-common
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom: pas: Add late attach support for subsystems
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

Mukesh Ojha (1):
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Hawi SoC

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  82 +++++------
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 155 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  26 +++-
 .../bindings/remoteproc/qcom,pas-common.yaml       |  22 +--
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  22 ++-
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  22 ++-
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  28 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  24 +++-
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  28 ++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  76 ++++++++++
 16 files changed, 578 insertions(+), 75 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260518-knp-soccp-7b61bb26b11a

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


