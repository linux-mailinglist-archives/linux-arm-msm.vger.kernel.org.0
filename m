Return-Path: <linux-arm-msm+bounces-112639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hGu9OahvKmo4pQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:19:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846466FC97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:19:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oeCin4d3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NqBwL+Cz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112639-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112639-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAF4B314E019
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C912D8DC2;
	Thu, 11 Jun 2026 08:18:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC97372B32
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:18:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165921; cv=none; b=BXlV1OZbAml+csYWr8f6XIP9pwEyeCj192Vb2OGWxJ8DE1lw+p5BhbhBVSqGJjn9Cozj/SxrBYPAF0gblGbl57cTMBJXR7+2Kx25P2/5HOog8vd03U/1b0EyXfqtD03yaNQbvO1uiOeJBaHb3sR/UWFoIvcR3+Xr4y6AqZ9ID0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165921; c=relaxed/simple;
	bh=0UB/RaRy1ouqQkebbPEeOz036DGdJa1e2gX31mDIAA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GeCGfSq4GgDID1X4MrUPQ1ABPqRYPdpKQQD27FWV5TPD5modAvGmJgWP+nt1zWU7EQzcf//0/P2FPcCsNOOhUu0gaaq6oqVGXjKzhXCLDa2qpDnryLvTg1bPG2MqzP2SyJly+vWkn0g+NWqIBchaf/wipQTJ2UnxX5KMf4RU3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeCin4d3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqBwL+Cz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GXV33812600
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq
	9FNId1gw=; b=oeCin4d3RJTpFfK//LqhiIMeFeKaCrfvdtlTTIQq1IwUnvIdOUv
	+X7xKw6J49bF7ltUIcAOZTTbPu3NWQYm8ZUScTMIMxnmvWpvRHovWmn6sFrJlgGi
	B9zh/S5iEFUrhcZ1IhPhIcCdVW3Q0bgbwfUEarajKnZ5Yskd0Azy0UtIyTDbdIHY
	OVhNAvslbUh5LqZgqTxtFfPCn6OUj+hzhqbfVehMJJ2WdD3L7dCOF8ymkMLr2NlD
	pPTRDi4ewGLgx5jiH9ujFDlD828eaoB/kSp5lDijScAALIq5pLdpt8UVJ1ZiSQcY
	S0vJ+mNUxrL8GVdX79el7uCYa2FJy8Qekyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71jggk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:18:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f6247c6so8729579b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165918; x=1781770718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq9FNId1gw=;
        b=NqBwL+CzWATlM2NUqin8WETAL37SDvB8+g2eykH1TbBbXMxCpIDrFkcplM8VC3DxMi
         ZzMeVBn6z2mI2WWIaselcP/E9vQvR3cIt/Ju0d8Y991B0COHPwem/SumwxDm+cAXG4Hr
         60HZjm/811q/8EPvkRCaJkbUKZYui5epoE2wQwm/jBBUzCh0HpwR6g0tzbKVPeTj7Swu
         uNs16xVMzBANqI2bG4488RagUfRPYAG+SHrqKwxebG9rB2BzbPtyJ9iFRuuoJHNRNorb
         Og+Jwh7msSpBkmlIQAJ8iaTAb20MPz3DPo1Bg/7jQ82+uU0GBddKEI/7EPXlNrddgVHU
         RJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165918; x=1781770718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq9FNId1gw=;
        b=grigyf68mZrGiBIV97Z0arezJ/purr9zOXP2TyNyvveaF/ZQtSfB7hEVMVVBnes8eu
         B7snCA95v8bbzzNs32y9v/doEEChUjqHCXTsj2TW5p9b+v0rzneulibm+lYyIWwsWlgi
         hMVE5p2eBARG53TSYkZtDYBKrEym/DWql7LpRPerpAMbctTRYrsMytKlXpyUmXZLNxN2
         t6bgLfBJ//uw001oX0K8RA3FePFRozZGXk9J3s4oFskVkX7akiQE+O6/aCvMdhmF11mh
         nkSXK63YWU5tLP7jh3jDmHHqLEnSJSh1JtgY4CZ215h+aC+fB1y/29tU0qH+8SZ0bENu
         +aRA==
X-Forwarded-Encrypted: i=1; AFNElJ9FQuyqtMCf8NMsSWO3O07fAlZdIJ56vSEUrmQYkakPHHF0rLcu6h0BG3VxaNLSsB4RFTeP3ok1h88kzctA@vger.kernel.org
X-Gm-Message-State: AOJu0YzAafCJ/jgiRmABMNAe0WFE3IHlhL3OBoesqZNbPkZUIZEg6qjj
	3/nMHTpQkI/C/A8nNIwBvW0Tq9/gJGx+mk85IOYpMKesLr2mbbhM3kp0pxsFNpVaA+t1w3vhvma
	faP/q+nTnnnHP8Q7/jJt8A3KgEDKjwfz57pNB6wVTBK5YMun3s9PK/adFeOzsNJx+uB7B
X-Gm-Gg: Acq92OEeTcSJbUV3uFVLu+aEx+e+DOp8OcUWlKAMHh1bJ95hD3HU0chTwdJOUekCAie
	2lTtivYWxTbQwphjI4m2Y3mTaj9IEC9HfZ5bf5rQrvCe8kYAIE83JHk+4YYSWaasqSOFHSK4hb4
	X0Hz3J2AO36K5pVHXmSAjNkRpC97wMwGAslZYpXppl6GTgj+dVWgg4V8Zd40uk5gp2DX7hUJ/rR
	jz0LrnnCPZBA2p39KKFkWY2oItV/iCdOx0wS1cyGX02EObsB3QuClnYMXQwMP2s+E0LKmPvuza9
	GegMO0uaSMbgq0rE1IG4Q1n6bWPv1ZLopn4gB2Qz50yeWJCwqaXD22c8DDTgxzyK/wS3oljuuky
	DtqyWaZ9vmuVNnmZyfae9X/grzWqxTIZU2MC4Zq4wKf5b9gnbwA9WW8Dv4vGj
X-Received: by 2002:a05:6a00:1f18:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-84336908cbemr2281715b3a.12.1781165917648;
        Thu, 11 Jun 2026 01:18:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f18:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-84336908cbemr2281659b3a.12.1781165917134;
        Thu, 11 Jun 2026 01:18:37 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8433831ce8fsm1188753b3a.57.2026.06.11.01.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:18:36 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] usb: dwc3: Update nominal max votes for qcom usb
Date: Thu, 11 Jun 2026 13:48:21 +0530
Message-ID: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RJeB1t2OOTB_fgf1nDDu1jKMmnbyNvfP
X-Proofpoint-GUID: RJeB1t2OOTB_fgf1nDDu1jKMmnbyNvfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4MSBTYWx0ZWRfXwx9kb1PL69ls
 IDF1z0m3Kfd1Y1gQ+/G+60lqjdssZlBmVyUMG7dr4X4mMTld+zV4DBl/0Qx4sUtRj/bhtfQhiBZ
 VsYw7cF6p5Y+WDuNUgrVxhtmkE9rA5mtLpjk/vPZwyJmysSVys5tuA9StoML86HuVbgNiNbh0Mo
 hDEhkbB0Ppo3AttJp7g5CZiITa/lgSm+i5WG9jIQXmIk5au3mLjVxAK0/ZYT56VK/Jb8k3S4BU0
 ypCbFdYGpeDsdm4C/6YmiCdMxAfGuniWDl8EWDa1Umd8lvGzqTJRb5PvusGVA+1u3q61ImwzeB2
 0yNQD9pyOFRQyLHZ9CCXeMFK/XAuIh9HDl+VAmiHybpZFB5VzjRo/dLyQtEI7OIpM/08w6gIK1b
 93bQXNuVh5+GqeFVCu2WpgNDZFn/swapBpeJPGeiIUJ8/lX8FNbNNR4QFbTSmlsqyZxdjvWNr5t
 k+GFBQTf2BRlQUJu68g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4MSBTYWx0ZWRfXxiJPRcF13JJA
 iprP9m6z7y70EdZObO0wFnYYAeZda9Pw1uG8l01WfGtN0OI6VHEXwxyP+A5yGru+PBcL8Gn9ps8
 6avvTBwUPtEa9gGRDTHKF/Nihf4Jagw=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a6f5e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=g64AcZ1iVWnUTv4HF3QA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112639-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4846466FC97

Increase nominal max votes to improve DDR performance and USB audio
use case handling.

Currently, Bandwidth vote for max nominal value is set to 2500,
requiring DDR to run at 1GHz under normal load.

DDR is allowed to run under nominal range at 1.5GHz, which is
consistent across all targets. However, with the current nominal
vote, glitches are observed during multiple audio use cases over USB.
Update the nominal vote to allow DDR to run more
efficiently, enabling simultaneous multiple USB audio use cases
without glitches.

With the existing vote, throughput is around 125MB/s. The updated nominal
value increases throughput to 145MB/s.

Benefits:

Enhanced performance and stability for multiple USB audio use cases.
Improved overall system efficiency with higher throughput. Slight
improvement in the audio KPI from 17.9ms to 16.6ms RTD-USBC.
By implementing this change, we expect to see significant improvements in
both performance and stability, particularly for USB audio use cases,
leading to a more efficient system overall.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..aa43a03f3c7f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -46,9 +46,9 @@
 #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
 #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
 #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
-#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
-#define APPS_USB_AVG_BW 0
-#define APPS_USB_PEAK_BW MBps_to_icc(40)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(5500)
+#define APPS_USB_AVG_BW 40
+#define APPS_USB_PEAK_BW MBps_to_icc(80)
 
 /* Qualcomm SoCs with multiport support has up to 4 ports */
 #define DWC3_QCOM_MAX_PORTS	4
-- 
2.43.0


