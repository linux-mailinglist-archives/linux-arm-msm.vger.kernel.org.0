Return-Path: <linux-arm-msm+bounces-92977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K15KGIpk2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:27:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50823144A56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EEC83047050
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1060F3115B0;
	Mon, 16 Feb 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjE5eqyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhlEXJh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71863101BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251828; cv=none; b=MAIkz7Y4gDLWDgK8bx4u35trMYdPLww1vKxDBVOnkEQ7LEmSTiO6Bu4Fa2SJOzhaH7KcTKje9+yqAH9nVd5GfWQp+cp0qoEUawnFMHPU1D+X3/zgykBYZCrEGM5+I0p5Xez3ClSk1pg2apFvTwq2vtpx8LxAwPqY3KBaNN+l03c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251828; c=relaxed/simple;
	bh=YvHUR6N7gK08eKxShQvctPUtKZQeLYTOdOG8n7wEiXA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JqOJfk58N2dBG8bRVjObPHGkR1CzGYtbR5c9o4ZeE5pxHF+/ybE2QUCX1+It5a06VHlbP0Gn8xIg8urng+CKQFi1w/IagCeEr2bivm08Rj8nC54DOl5XUvYos1POBG1r+mcSomfy6qMLshcIlfgHYAQpQYGyoProNnrBR0uumEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjE5eqyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhlEXJh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8fwZg2802096
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jGHdn8APQ6pV6nNdWuaL3G
	0Nal827F3uVMKw9j4frW8=; b=HjE5eqyyIgIJl70OgJ4HC7Z20mGE8+TnMNWshz
	5Zj3P6Z1Fz8GTlsTV196z6F9DBNL9wAXQbxw+h91ThIK/TTfMhwYJug/d44aZgOn
	Am1IactGC8tffqMOe73mc6PFlL7boNgcC62IsQxHebiXkbO4qC6DE2CK6WupGPJf
	SXW795CYrmNjZPVZ/Z7oDRlr0Ydmcg5P82iqd92Xal36IP4HdGSR/FOxKCiCkzVP
	3pheRbZ7gz0bSgzZldU2+9IWzhEx/l/LiXzqra/Q5Z2U8FD6zi7iO6UF5ndRMPQQ
	YHzi4ub4fvWm6LoqH+l/dryWRrOVpn5g3y1p0fmBwfEskqEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugtye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:23:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so1829144985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771251819; x=1771856619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jGHdn8APQ6pV6nNdWuaL3G0Nal827F3uVMKw9j4frW8=;
        b=AhlEXJh7CmBFYxI1UooKOm3OXTR8Xvuoh8+2hKk+SV879/uM9rcrEsvLdDjp7z/4Nw
         abdLygFtlDrvqFKNAgx8d77RCCaxc7dsJuKfLJR/T7arzU0PzJSyTVBwN2uz/R6DHWcv
         tGtUyCCxaUp2epjqhw8baEjMOPY/nlTeFHkXhKuWRPQLZSRaMZuenokVGwQucqL6CcpP
         aTWnKTpJ1KOQ0RwdnSv+DLM3aKP2GFrKxqS5llrqK5VpOPOOPVGD2wtLCCUtxEJkqQPz
         grf/XZqBpBtkb6+6DoMLmu7sNxO9RGzNBvFXCRExYzQ1cQN6VWvibIDXmtCKpM7WXFLm
         Lz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251819; x=1771856619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGHdn8APQ6pV6nNdWuaL3G0Nal827F3uVMKw9j4frW8=;
        b=hbW6QlvKEOv6hb9CGiuZOwFY9+vNfUQh7I+uFFVh3zkagj3QUhIOkaabme/FpV191h
         0ONEm5FmdWGwHdlUZvTh8tcqHe2wcEkerGORqzqtQfcFNLoTFbA4VtdXw55ZZmuVmS8I
         uQNh6YvjNrZ56z69Zv4/Ynb148YSeP8yt7UFiCZilS6Pv3UcZm8w4mfU7sRocN3Jfx2D
         62d7NccMlkQxOQ09mAONsf7cE3AymP74kLUcaFtLUsfGsFLAP9OTBflPQ6MPfD9hRCfV
         0IAMoXKvg86oa9GezyjB+O/Yyrh2RKiAdaLjQphERW/RI2pzFWNf151cS4LAQf539HUo
         lXbw==
X-Gm-Message-State: AOJu0YwaeVmYqoojQQUnMG/JtPi94lsrFBPyYSenEC0Q0aCMuGyscCEF
	evC/OvtuqpHemWcOc0L8UwDG5yoCSd2uXdCLXcvlrCAR3OFpSsqp8pzMkaVFh8dcjvm4WcFi2Kg
	Oth6BZmeSq/gLJ9GD4MwnOKkeyP6Hk0cP3bzM6Z1FnEvF1KUOYEqKB5yoMn1O0Y7wlnzJ
X-Gm-Gg: AZuq6aJpkwl0ZR5v0NZ7psxqT1NbrzAmpDCQk+i2nHIigkIdVcbPUubRGhL2RnHyqoB
	rUXwdaIlhcrsnQF3Jt0mVv04vyxkOXZhmd6iNrKuaeNvyglqmSedYlwuy+q1p6qCP4IKxTk696+
	REirt4O1zh4SkK/shn8UO+juRoDiSVXBRQZ+AFL7gt3WkVhEkMqu+qN293yaYFoWWx6bQMZK6/y
	KqE7EmazokF5UT3gsmapiuDbZneFcY0jedFpz63WcyNKOPZepUXXwpcJ9RdF/6gw33cnHuO62xW
	IskHNqHUSxp8YCNmzYeJcgqhOGuPM7ExFA+4cWYp3bVIcvc5ySoxXkJyxNkoLJjxtoBb1mAkxX+
	q8eYBEt1G/ZB1IxCdHaEDAuNnM2QWsg==
X-Received: by 2002:a05:620a:3f85:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb547758f2mr682483685a.3.1771251819120;
        Mon, 16 Feb 2026 06:23:39 -0800 (PST)
X-Received: by 2002:a05:620a:3f85:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb547758f2mr682478585a.3.1771251818486;
        Mon, 16 Feb 2026 06:23:38 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a34d66sm101714975e9.20.2026.02.16.06.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:23:37 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] pmdomain: qcom: Add support for Eliza SoC
Date: Mon, 16 Feb 2026 16:23:17 +0200
Message-Id: <20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUok2kC/yXMQQqDMBBA0avIrA1kggj1KtJF4kzbEY0hU0Uq3
 r1pXb7F/wcoZ2GFrjog8yYqSyzAuoLh5eOTjVAxOOta67A1PMnHmzTTMnuJhgjtDTFQww2UKGV
 +yP4f9vfLuoaRh/fvAuf5BXbu9bByAAAA
X-Change-ID: 20260216-eliza-pmdomain-dd10911bd4e4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=673;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YvHUR6N7gK08eKxShQvctPUtKZQeLYTOdOG8n7wEiXA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkyhlQm0ORTrTGd273likgSPie7YF/p6pyE6D5
 Ndd3ScUkxyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMoZQAKCRAbX0TJAJUV
 Vk7rD/477qSI4dDxPeptXurlt/NvIacSZNPqSGqKOBAEUezqimagFs8BvX5Wm0udtIQ+pb6C+OC
 MtjeY4HytfahoWY1a0Y5Swlzkv15OEOaDvSHULdYrLTAII+H2EwjhOanRG9IA0CDq3FMCVdyJ4N
 AZ7mOlZaiqA6z7QZNjCA7YWsGwRaENjiqA2TAE4wiui8xk2kErHnDrmWpGdh3MjSeyzC2Q2sDjv
 ZdXgGVeRWq67vFfyWn1eWKVd9j3JvecRG97hgwoLMmJaMJuIQXNRbbilMwMUosYYyyyZzgxsGDh
 8HYUxU8IwpSpaLvwcXdoDNzUZnh0zv3qOb3cso9yR3FCwcURBHdz+fax4BwMsyh+W8TJbgQWgub
 WQ91IYUWuWc5WWPEaYF7qv8xZRc1eYDbGNlk/7lHp7zeKavoS6zM1IJOn4eJ5nalo8kaDnczXS+
 Pui4oBfDr6lqVL0Vj/qtGGYJvSxdtynZdD4PKaZ8H1Yp6n/QSTqGB3SSK9nzNszmzQjqVTlUBXB
 YFKuGcl1lXeyA2QUwinXZRcb86oz18ZKyBrvWpBl3fyW+TtjES9lEKEBFcmFdL8lXKKJcx4djNq
 kKNJg592LbPaCtXjHqifHwwCDYrsyXOkYtpE+8cNhSxenJ+GNHjPdktGWyr/Lbt1wXyonhLNpMo
 AZdVqlehnXHbzWA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: OZCnORSLxOq23LgrvyqUtqX5te3rS0Gz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyMiBTYWx0ZWRfX9qjYDcbjR66k
 57WLtGy7iAh0m/llXWwwvIzH7GAYlPMq1oRpES5zS4HatVF9LYLXvCR4KRcIRfgXL1w8dN1li7m
 YGl+QkIaKe8WWqOuN5iPzyL/pzvX6qJzy5XoT3LirKLDcJJbP59f+/NzlBTvUGpZWDfrJsJlCm/
 9z4l6raKNoNGwcqyFko6a7aJBn5xrpZyN8m6QcMqorIyZyUqatoKFgQ1UAWF3MkqaRAzywwH/rF
 gDqr8/GzVItqtTXba3WQ14uPxLl5orxNfNKpmV173t1i6fIzruVBl8UJCwDgYUTRWo2MceTdN74
 n7Z9zkdoDBWS7oKsIp100WBPputlEpzNxvcxe/myF4RkmmC+ilC6uUTtzq4spTKbggwCdEhtQU3
 MxVXdNpCcEWRES80LB+IdrxxLgxX4KbLm217YDktDVEpWqGKiVgdakpNjbrt9Kvl03yEx8VT0rW
 UnpRwceZFS1PXUt8TAQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6993286b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=WUj05zx1HR1vDs-LeRsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OZCnORSLxOq23LgrvyqUtqX5te3rS0Gz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92977-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50823144A56
X-Rspamd-Action: no action

Document the SoC specific compatible in the devicetree bindings
and add the driver support for this SoC.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: power: qcom,rpmpd: document the Eliza RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                     | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260216-eliza-pmdomain-dd10911bd4e4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


