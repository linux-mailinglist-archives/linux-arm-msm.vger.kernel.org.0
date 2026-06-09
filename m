Return-Path: <linux-arm-msm+bounces-112012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DhwTE0G2J2ro0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:44:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4F65CE50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:44:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IY0RL+0s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dsvyjlk+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112012-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112012-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49A4030D01C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58272383333;
	Tue,  9 Jun 2026 06:40:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509C37F019
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:40:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987257; cv=none; b=Mk/FLwwjV9mtX9RjO9wJ3FJHA3Nsn2IqfsSu1eijCRKHBMtHzwH2dcbyjFN/ImAQel865tZEFMw0SwLYwEMXQ2yTLGOfih0bmpj+FqKmUvjzeOtHNDC7RXJtyQhX5r0nz17Tt32oni6rRCtBEF505/kSZQlMocZhLGOOT427Us8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987257; c=relaxed/simple;
	bh=jS6vuumUGsy5DRLQvCZuWVIjD9dQD9f0kBeu9DzftvI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XeLMeBIyUfGCdTwx4FFCoyBuic1sB8tbRKVUHUwwUE54H3oog45ELN3yD8Dnwkg8qmSTPKIDRBLnLN+yHaIH1c3I7u+ujfhK8gFbesBfChSpvJkv2XBzqKJxfzabschDcSiwRd2rhBFeAa3b5rzvOYbw+ck+3uBxqSlcPI7WOgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IY0RL+0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dsvyjlk+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593xb371478577
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko31
	92m3taNU=; b=IY0RL+0sHKiESf/npKrdTTzqch9nkX8CBNj1eKDLIjkOzBQqrEu
	ozc+wAKpMwSGFIRtbPLo8zj8OTTNU2zhZCSchDGDsEI9actbihmOb3MYTdVnHw5y
	OcB4dff24J1oGBJqmqcF3IBb954tfHvg80aX9mjVpsQZCknxTdDbq8tDrF/c8zAs
	vdS/iL9qzJ3Kz92MwsV2p3uMECIGO4Ukly6UAvMzV0KDtaBhEh9BKq3x8oYhIbbw
	RJWLPW0YHq9nmQn7FAIZ0Of666/tGk3kX3Sdm0fM4dWYzBo/WhHW8abwfvLITNPd
	85JAZAn+HembjU/DglGuhZ8tBQLXK0YBNWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0n432-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:40:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so6082311a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780987254; x=1781592054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko3192m3taNU=;
        b=Dsvyjlk+nQmxeDfv5i9s52ek9GcNZ70uSYSrPli1BJRoEr8WRfKvzGb9lxZ18RlWzG
         vWpif5WJvQeFibNiy9tE8bcCXTP0/LP5b/2fYzzJ/kyXDY/jxsR8J7q2IvTD04NZeaLO
         1RinnUb/eMj67gjEKqMAO+E44ZYOdRL4jaeRUlumXQtiZOWTs+NEg35JFez4EjbWPtG5
         GKSfiw6MHKPCPGOy4rhnBQt4XncJY7zgKCBAGMfnJLGjvs2Ugt6ji8rNtqxVFPINacJI
         XlHN3hKNDn59Nq3bhIZ0BAQ0WiLn622wl9kCKHodqc5MK9a7IAYgJ0p/pMNIIiGWKcEu
         jZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780987254; x=1781592054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko3192m3taNU=;
        b=ay1SFWISO4GZPj5tdgO6EA6eXyTwygiKSfXOFTbi2XK9wTyCEuhJergFQ6coo0nq+K
         h05/E8t2yt4sKc00eRtJIUzsUee6O1khcxa+ayndzfkviq5mto5LM0eDofLQkDdT2pyU
         A5MqZ8H4tUEe/kmGJA8pdKjwfPHzImVvzcp7EY3uuk+W18qfLhgC76hgq91uvJC8yY7k
         5EqeVzgPngpWP++x0LaTbAweGXAoF4sLA46+83QVU+DTEYdvKlR1lC0wTOQ5rdqjWl7V
         dl66GQ9h8sxvoArywGotVpl4x737fwtvtx13o3W8PYdVkw+S2JGA699Ed3Z1vfQrLFyE
         LCgA==
X-Forwarded-Encrypted: i=1; AFNElJ8YMnHNjPJ/X1nj6w1Ja2nY8ndXYtgUmm0mYDvvFRqY/udhAu7MhCpbVokbJIzE1M5SMTK5UoeydsFc+Uey@vger.kernel.org
X-Gm-Message-State: AOJu0YwACezJncKUXVUCS1Eq4dZywWc2VZBez3JF+IplMydHX69M+Snu
	/ZV0bbmwzois0behwpmFoph54rIONIIOlITBamyLA+QAf1iF8dglw2M3Ips2QMDbYK9JOIF6S63
	L5BaSuPz+pUmojsWaK9jleNBCDYN3IFlWNeFsxMvHAgXCzVZdjlJX7UJVKLCR+1uo4oIg
X-Gm-Gg: Acq92OFrkfhjhk4R4EfQbHmewOayYn8lLQIIYlKbWeKkV3MgSkb/zadlOk04FcXIApw
	ewZ5CL76g9eE5dkFqhaOof/yN31Ka2xj0M8g03boOQ/vOP2Yda8589AAV2IYfhOLgEO+/uMUs+m
	CabpoWFiddQzkL6S1rMO8J3Hv9loJ3PQPsyyGXO8Bq8yUtPH/4spMw1mrgXEB7kC4GAUCEWsNEj
	fHaBf7h5AFp2VZZWCdy6gWJEI5eNwhO8/Hkw7MISFly4hXuAGH8zp52lpJa80UxB2j4x2ZCBeks
	7QXpCQX1fdiwWK7CVW7UJX40CN9sS4HBXZdQA9DAYb/I0YUg8d/HFJJzXGLRC238Td6DEujtU+3
	U6xWOqvXDyU01AK1sMeiVlaTAoPcgOqfGqTm/PlRYQXckNPzFPAv4CcwKHefa
X-Received: by 2002:a17:90b:4fc6:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-3713113c245mr14020207a91.6.1780987253841;
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc6:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-3713113c245mr14020181a91.6.1780987253397;
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f9bsm17898953a91.7.2026.06.08.23.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/3] ASoC: qcom: add q6apm VMID support and qdsp6 GPR destination-domain routing
Date: Tue,  9 Jun 2026 12:10:35 +0530
Message-Id: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MCBTYWx0ZWRfXx46IQTnOqoJb
 qmyBHVSVyW7HZEcWwdUezjRDv+egHQ4FLwuI8gCBDpUzE9nxTQbuugD4sW/2huHfyfpVlL1ef9Z
 vANhcrO6A6QB0IBPWOm+5BgDEzoo0f5ZCYWmlIawpKIUj3kI+XF8Ygkf07/jKHlm4n6zJjBkKTT
 2MyPQLrKGqfocHWm8mBr7DkQDpa5DJ4ztzYlOqKzx4iUp+f04OdSEA3Eic8SrA8hcn7ROAkwUkI
 hy2eNFWDpUl4M0j0Xw4R6XlH8NRXhvn7U8pkTS7XYphQ6TaEbfYmebhtqQm1czuOTyrYhLRztuv
 I4L8rbfbSn7sfvlnEpvRKY9DkcRxm5/OSRL32+xleCtoXEeMWsO1aLkgRoUyGpDZlDsOQaNZCma
 //1d+z5L3tq7q4+pDeIgA6vt+HuLGXOsL3w630HyhjtuS7ObBCJTjbjNFbGg6uFgHT1S3Yw3TDK
 LNyQQDEMnb955WIhOtQ==
X-Proofpoint-ORIG-GUID: EU3-276UJDpa88zslvfQcVg8Buu96iMe
X-Proofpoint-GUID: EU3-276UJDpa88zslvfQcVg8Buu96iMe
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a27b576 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=g18NhSc54fSbZ7kgshMA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112012-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6E4F65CE50

This series adds two related pieces for Qualcomm audio paths that are not
always ADSP-targeted.

1. Add optional qcom,vmid support in q6apm-dai so fixed PCM DMA buffers can
   be shared with secure/non-HLOS VMIDs via SCM assignment when required.
2. Generalize qdsp6 AudioReach/APM/PRM packet destination-domain routing so
   packet allocation follows the active GPR device domain instead of assuming
   ADSP, while preserving ADSP fallback for legacy/default paths.

This is needed for platforms such as Shikra where audio may execute on mDSP
and buffer ownership must be explicitly shared across VMIDs.

Ajay Kumar Nandam (3):
  dt-bindings: sound: qcom,q6apm-dai: add optional qcom,vmid
  ASoC: qcom: q6apm-dai: add VMID-based SCM assignment
  ASoC: qcom: qdsp6: generalize GPR service domain

 .../bindings/sound/qcom,q6apm-dai.yaml        |  10 +
 sound/soc/qcom/Kconfig                        |   1 +
 sound/soc/qcom/qdsp6/audioreach.c             | 112 ++++++++---
 sound/soc/qcom/qdsp6/audioreach.h             |  23 ++-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 178 +++++++++++++++++-
 sound/soc/qcom/qdsp6/q6apm.c                  |  48 +++--
 sound/soc/qcom/qdsp6/q6prm.c                  |  19 +-
 7 files changed, 318 insertions(+), 73 deletions(-)

-- 
2.34.1

