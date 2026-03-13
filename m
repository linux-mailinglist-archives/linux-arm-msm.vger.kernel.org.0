Return-Path: <linux-arm-msm+bounces-97492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GgONm8PtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:21:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50120283AD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39E8330719B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3F323D288;
	Fri, 13 Mar 2026 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyKV/J3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRhg+V55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A65C40DFB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407880; cv=none; b=WMZ/hDLMDItLbwhj7r9LwL+lft0hBjjsZE+BIwzns/I4Hu7G+xP7ye/+CyHXcF3KDR09gp3jpRth9kbN7x6vdBvJWh09NgptJmli1L1Q664fZdxbhN/7RDb/0eM5o1vxeh62quddx3qWw5B3uPbuQQ1YGgXd4tv1v8XTq0w3wkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407880; c=relaxed/simple;
	bh=S9XZxqhIyOU1HoZkSIT/EcrWwOrX5DcaP7niMINCiD4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WL1LlLKvrD4WIwquIX0ZMrLprUG5yDWw2yZSluqYA2tJtkxeOSB5OC0Z6TJV8I6NJWcCydUJrGyY8fgJxgo+5gxVnB5tVRWOWx8+0Hlczfz3kgKeE3lc7nOtnWhCqinjgzZAN5/xM/CTYGi9dwV9zJeuB4YXkVQmo1+FudVBka8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyKV/J3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRhg+V55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA843R1749407
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bii1WhtiSZWR6uwIUf2lsQ4fMW2y90ZYcpM
	bLtxoyVA=; b=FyKV/J3Sm2yZr8PlR7ZcnEIIjO9nKyfRQ0QQcgNfxacZpzaMnwF
	+zQLlPOydfDV60nX497Q0IgGxLqB6tyct4sAcKugjpZOXHWdB8a2ojbqxwELdV8q
	QRgEB1FiJKeFl969VV4Y4wAagTeRrhngd6pdtFSeoOEDRUXhncojXvxyWda1EFDS
	qFStbhAXFR5WkN30pbYteB/kW1lpwHFGcHQRuBlcrBaLJKF/LwLjr1hmHyOuF1iq
	+baPpkIkLkD3Z9R8KpIi9WSbzYbHzyXXaWaZloyFeUNILCiwFa5GEr8OWe/bi45W
	Xb3t3Mcps6nWufpai+/NNeS3vsk2shNowdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gjx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:17:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77e5e187so1185181485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407877; x=1774012677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bii1WhtiSZWR6uwIUf2lsQ4fMW2y90ZYcpMbLtxoyVA=;
        b=RRhg+V55zLD7VkfayO+2O2wWTKb6tOKd2XfbhaocUfQX3bUEfpxIyKo7sgmbAvDcQo
         H6mBLK/vKOLERRqJP7RIHnvQLje3u6ldyM1li1DwZh/F5Zt3AQDQMpaYv9TA3mbnjPR3
         Kiya2FlZtmWs2jryLaoDDOp29HnJZgvTTtBQUxQ5hPtQIbn/wffKRJbk3/fnpdXVOx1m
         o2kBnxzDT8fpR4sGTDIxS2ZcYVelvEIBsandkLJQJonMsSYAeiwGrD8ytf+YTZAGt7XA
         eiWtEfaw/fAAyRZ89Tnb0DLaJrbfZjFUbkdsPeGhnOfS4CwTuIuiOAjKiUMKCH6vQELT
         /q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407877; x=1774012677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bii1WhtiSZWR6uwIUf2lsQ4fMW2y90ZYcpMbLtxoyVA=;
        b=X5Va0I4LH7pO3nfmW3crtV9l1rVE/0Kg2lnu+rom+RDi16RE0QBRdDtNxAEvtEGcpx
         BkLx147sUtZedctQWsg2RSNB+nx1BFbZ0/5y2eppRLUhGHwPzb5SJBjSgan7lg2nWHup
         ooGS/ZuPt3LGF9QUXknGjF/BRSKJUY0bB6qPngpGqwx+Tjq8jSVQ2gM7Vq/PL2fnkSjf
         oCc4X0IcH7BwvGvAaNFRLOwhyaRd1xvAOcUg+H6oEDekSBQ/QMEwlqCo4F8VZs7jrGR7
         dO20DtkgZ++VZht70hXvdtkpickhVa9TcUqyZr9UUoXWiY/8frixO06S1YbipKlQKzWG
         7xtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCDa1S8LaOsdQsWgS1rQUcAoK1RIwWyoJARk/Z3PHpj4yqjYJybT7VJZnf+/qpN13/YGZV4Qr5zqoP/2wW@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUuvy8VBdidzlvGj+flplFmjfdXD066xBuVLRVIUt85hUBiHN
	cM+VnK+juACcY0OFVVfNRHq7Pv9Ao3sERVKaRSs4G/7QCpSdwf9KWDJjlIj6q6/Ce8jZHBnWt4Q
	EezUlvDWGwX3dax9RVa160ztaXHVv4MdB3TqqmfOwg/8OIm/rq/wpPu3leM6dY0Ol8mMD
X-Gm-Gg: ATEYQzyTW6mT99/Vw9tw8gAV3n7a0AzDMTaIp2oJy97ai2ajFoF4U0+fIQ4OO2rPVXN
	09dKVYXz9k8whkGPkxUnizLDA8/wiYZmNMQ2/QtNVTZCaUvJF2R48QL2I2Vgi9Q2NxqzbA4tgy3
	gbA2uatKbdZ4bVFWVXKEYH4mtQhcRgGfpEveOofANcxMMOtB1fY2LikIWjLnMQM/JwTif3oYfUv
	yW5BcnEfqWZoTfxR7ZPRFMe2BYw2cBRE+MUDqmvLybHVA0kBwfySAPprOguV11nLXROecj6q5iL
	sJZxpFypnuYQgMlbWHbv2qqxwZJ8clyhtid1SBTz/Vz/tBotNgBRKuN+TsUb6ZWcs1fqn2x/6xv
	rRMPWVA9ZnJxhD+m6flAvkk56GyxY8w9MKaYm7MAnvmje1mYQ1wfQ6eoO9xdP0wY65X3psL0BEc
	GcgcZug+FI3jo9
X-Received: by 2002:a05:620a:6cc2:b0:8cd:972d:328 with SMTP id af79cd13be357-8cdb5a692c1mr450009285a.24.1773407877509;
        Fri, 13 Mar 2026 06:17:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:8cd:972d:328 with SMTP id af79cd13be357-8cdb5a692c1mr450004385a.24.1773407877089;
        Fri, 13 Mar 2026 06:17:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:17:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/5] media: qcom: camss: Add PIX support for CSID/VFE-340
Date: Fri, 13 Mar 2026 14:17:45 +0100
Message-Id: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX2kbqsEWt8Agl
 sPWjWJx5nlV+Wlm45wnTrQWEAJAD/KWMKyxcTx0VUCLziqd4kvC7VJDLKs+F5lYDSjIVrMrJHn7
 ptEZ4p8/RG2uGU+mVhrKBDyGNHB5Oe/2iH8XWeq9BCkOJy2N6zY4Rzv9P8Hek5Y9PeM2IyG6Iau
 EGzmCskdyVyLRAiDSEMNaCZDLNxDcz5rBdZ2UiFA1FfYDPnPZqgF9VbZ73v5iJ2yr4HO/w6xAHA
 lCM4AdsuZzH9GsYPNwtxwsHx2nMld9SClDls/783kvJ0rP8K9+u3gS7Ptp3K6f93T0P6VR+69Wp
 OqBg0w09h/mz0oyY2wT4Wd1DwfyIJVEpcOBhUxLVPhJjQWAmp5Ch1Yp5FcXlWpsGFke1b8H+2lf
 a2ICO7KJo/baZ33F7ujaQa+SS8Q3YQlqKySLJbNmnkZ3JJ7fqwliAnE75uzu9MG5n9hnTxzjQ5C
 /dpkXpu6ipbJkSifLaw==
X-Proofpoint-GUID: Qzydj12Sx0LE82ROYa0TRqq9PIIvdpHb
X-Proofpoint-ORIG-GUID: Qzydj12Sx0LE82ROYa0TRqq9PIIvdpHb
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b40e86 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QLs-j7ecQSDb903mvAwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97492-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50120283AD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
allowing frames to be routed to the VFE PIX interface and exposed
through PIX output devices such as msm_vfe0_pix.

On CM2290/TFE, the PIX interface includes a minimal inline processing
engine, which we will be able to leverage later to export statistics
needed for proper 3A frame processing. This also fixes the PIX path
not being usable on this platform, as PIX routing was previously
unsupported, causing frame capture hangs.

Changes in V4:
- Remove unnecessary boundary check for wm-to-client
- Remove stray \n and fix commit subject for 2/5
- Add proper define for PIX pad index in csid-340

Changes in V3:
- Introduce what PIX is/means in 2/5 as discussed with Dmitry.
- Fix patches format/encoding (proper ASCII)

Changes in V2:
- Fix various typos, extra spaces, and reword commit messages.
- Split the CSID-340 patch into three independent changes.
- Make VC/DT-ID configuration explicit in the CSID/PIX setup.
- Add the csid_vc_iface_map helper to retrieve the interface offset
  from a Virtual Channel (VC).
- Add cropping configuration in the VFE/PIX path so that it
  respects the crop parameters defined in camss-vfe.

Loic Poulain (5):
  media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL
    registers
  media: qcom: camss: csid-340: Add VC-to-interface mapping
  media: qcom: camss: csid-340: Enable PIX interface routing
  media: qcom: camss: vfe-340: Proper client handling
  media: qcom: camss: vfe-340: Support for PIX client

 .../platform/qcom/camss/camss-csid-340.c      | 109 ++++++++----
 .../media/platform/qcom/camss/camss-vfe-340.c | 155 +++++++++++++-----
 2 files changed, 187 insertions(+), 77 deletions(-)

-- 
2.34.1


