Return-Path: <linux-arm-msm+bounces-107022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N+dBwehAmpwvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:39:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF9519605
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EAD8302C907
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD8227FD4B;
	Tue, 12 May 2026 03:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyygtP7O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxEyw2Yl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD4C28505E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557079; cv=none; b=ldfWycyjbd7MJNToRzlgHRfHvcWgqkZP8qQeMRi+s5fEJpXUOkBHK8AlnCnsYLe9meP4ILsNvgzioYzszOv+Z3zYezVIifBS10oZvhc/PWtAGWtlpNMCth0+j7ub0BbMPTllD1wG3rGg01bZd2yUswV3hYzj2OD7qklxjAP3GcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557079; c=relaxed/simple;
	bh=osXmgGSxSrKx3zpZtjMg9bkFc0mOhov0B774lUtqcLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Nepq/YS++3EoGYj5qjuPv4nyDcMvzIT2onXvjdvvG9AmOkNl5Bp84BNgBFDR01ibSX1R8VZP5pd7BSRYMnlZh1qejVYz8ooECiqcP5jGIMqfDPYHtGFJ6ieuSnrujInD+hFz4Xdn+1K2KbrvFQ6iBjB4SIjVtqtyKmN+5ZVp0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyygtP7O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxEyw2Yl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6hxN866134
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TnhnLrL/izdip9S/qBfDLn
	OxhSE7toF4Nmjgx76c9jA=; b=YyygtP7OoBIOBb/komBX3mkcS7xYKREvqNEU2L
	RqM9/snkpNGfOdArpU4EczKZwLiLa0ebAGkd8btYOLNKz2Q9oEj93ZQ5VffNcXjg
	iyX1DJ9Qyiemm01AYmfUggIkm542985W1egzPlkPyfsm0tZ2ord2MQx11Xb2Zjrv
	a0R+e05y9ugLA4u3dlS0AjXAd66O8XQnX0V8HEIisoGUu7AWblaxiNRmy8+v5xdZ
	j1O4iuq4a1XoieBCJftyxo5vT2tGXhLH5o0YH5KejmNvd7kQzC+owX7buE89OzV8
	gehw1/+MXwfJPHat+wA/u4Ryg9H+cQaABmfMBC6nVIgXKKxg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv292w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso6639455eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557076; x=1779161876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnhnLrL/izdip9S/qBfDLnOxhSE7toF4Nmjgx76c9jA=;
        b=RxEyw2Ylx5akwyX7ZmaXQhuUI6iE5vkBkjgfoCGSlOxceMwQO7sr3Au9AQd14dj3Vo
         8pG6uqEnRe9aT7NUsvE7KJDTGd6Y2Kc1eyc9xuFdhJN7hwjBBh0X0tJI4ZcrpFbE8ZdN
         ep85MT7556G4gUVkJvfx8EFSRg1tA2c4tFnlDc+fNyYlqFFZbj4vskyyh9ADmeDZW1QH
         17cxo4thRUgshf9Fnk65U2yjzLp+1tFN12IlZ1NU420xte2MsnIgq8HtBv2nc/nLpsV0
         zBvl0VJiHoZo6xYZ8fB1VPUYG4VJCAQre0QoKliz6uZFuMuqufwkQn2KizLJdUwQi77G
         91Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557076; x=1779161876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnhnLrL/izdip9S/qBfDLnOxhSE7toF4Nmjgx76c9jA=;
        b=LqVXX5UshEkKxZiC528lrjr/64Y10KXJfjdnQaxgXE2KyclIKrJLSSQnvp3GbiNo5B
         tRrLRc29ky5Hq6/12nKD0VS6uCEsHAsRTndbrC233ifvlQJcD8r97kVVR6DxjbdeZPZz
         n5Fbo8jJ1xpKO0AkaT1Y76/kKlkHK0gCXbPa6kI7E3Lvwnm2qbVfRIMyK2uJ9SnEgbtD
         bVnfGTKMl+9NmpGw4zADBcDnmXTYyBl99++AQ4AsPGutKGYD1L1P5XfCpiUSYAZGbR86
         aGQf6SlqbD7+DghqQA10JRaWQRSPabcwlt9qANnbOUR9wuC/jma4EvQir+gMWRiHpJeh
         QYDg==
X-Forwarded-Encrypted: i=1; AFNElJ/8ZmEc6E3tITjPWcvItQAPoFu7owFL0a2Bb3JcLCEk2e/0QtfbajZb3bevJJGxtU/XSqwHT/Zsd7QGEZi1@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9ReGrf7EMcuVwTYdsLaku+cLwCPOY18QyXDbPkb7LuElf/mY
	jhlRbFWjLsq8IgZr63KiG6PSziHyXGD3s6TUE8fCiGVQAQJa2uu9mdsALCZz/Vs7CdbPsqBRbT+
	HN/wEwJYBTBOhb1UkkO2wgGh5RV6WiCCWwPnWV4hsCpgsud+pRsz+nblzFAslD0dvzNLM
X-Gm-Gg: Acq92OFmBuPhwL1TUj1uptJXhsdRDbbDTFDj4S2AbQY+T0C2Tr2y/8u6wYyMxfrrcRm
	mhbxkcM8NW7W1nezkoORieu5w10Epws2lDJw+h9KANSKcP1vKU6x5CaD8Wn58t7640MqjYjTqaW
	kzzsFwQDfR3IQiQdQ+qMlCv0yimhF5UTtCtAkf4WgygCrP5r6c/qpK6TKOTy9anrCQl5KZxRgzi
	7VkRx+NsbI+LdtotmIabPOSu5So1fwjROOmreEDqRUngn6m+llAfz7z9XLQKoAhgWw4dzqTkqAm
	+yWEXcZzzhps18L0I4v5WwjIBQDkNMtghapWZNFQFFo8UEEmOVRBNaTIf73WRmnJNTtrQBWODx2
	uDrhiFYX1oAWkcAeezJx8oqVLSrB9WC0862h79EmLjnT/GnMu0Q/VI67wb3ZofRXLFDE3D3fH7E
	W46tfZ
X-Received: by 2002:a05:7301:fd87:b0:300:255:22cf with SMTP id 5a478bee46e88-30002555971mr304824eec.28.1778557075595;
        Mon, 11 May 2026 20:37:55 -0700 (PDT)
X-Received: by 2002:a05:7301:fd87:b0:300:255:22cf with SMTP id 5a478bee46e88-30002555971mr304807eec.28.1778557074985;
        Mon, 11 May 2026 20:37:54 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm16730109eec.2.2026.05.11.20.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:37:54 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] soc: qcom: ice: Enable firmware managed resource
Date: Mon, 11 May 2026 20:37:47 -0700
Message-Id: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 344-5Z4B-Azz_QrckltuvC8VAB74eNNZ
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a02a094 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Jyhv0Gfyiw9a8mKZ3MwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=s5zKW874KtQA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 344-5Z4B-Azz_QrckltuvC8VAB74eNNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMCBTYWx0ZWRfX4w9AvzLD612d
 adL9secLwYCbksCOgwRohVdZyEo8Pq0Q6pczx8WWdzV+MQm+r3ZjimuA8EzCvaKKPt/7JX4o+np
 GNpYSSzwZQyaEoMtjq2CiwZga4jXdqxHy9Qpz9iDb/GOiqxxrJyGTMgixvevJudMdL8mCWiKqLN
 zTo7xMfDa3LcO3+j9k+b+gBrCVvDZzuulhm2AefVC2YxkhRfUxlAiXP2vgD8KOch0HGcg/LdQcZ
 unpcBo7Q/tXfh9u6qQP9/O7o/5EY4hqtgy0Vw6QHzi0jgmWMCAH7AzoLwgkfw84+wFKQEN0zgbt
 Tw1u2VVR9e8pOsxV1LWj+nYamN2lfp+XJ9KnT75LZiVHKWbc7J9NHWjqiXT3XxZgnwhhebA8jfO
 5rNrZfGL6hWhRAhaYZlOddy/TYl9pWp5z+zxonZMdZaTg8tFfR9VYndBtuav77345ePWyXabZrF
 /VudcO+JTeyQhw7b3uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120030
X-Rspamd-Queue-Id: 70BF9519605
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107022-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shc-kerarch-hyd:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: linlzhan <linlzhan@qti.qualcomm.com>

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM (GPIOs).
These resources are controlled by the driver via SCMI power and
performance protocols.

The SCMI power protocol is used to enable and disable platform
resources, including clocks, interconnect paths, and TLMM, by mapping
resource state transitions to the runtime PM framework’s
resume/suspend callbacks.

In this design, the ICE driver acts as an SCMI client, with clocks and
power domains abstracted and controlled by the SCMI server in firmware.
This implementation depends on pm_runtime_resume_and_get() and
pm_runtime_put_sync(), which are available in the OPP tree’s
linux-next branch.

v2:
-- rebase the patchset
-- update to/cc lists
-- Link to v1: https://lore.kernel.org/all/20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com/

-- To Linux Community

v6:
- Protect calling clock API with fw_managed flag in ICE runtime OPS callbacks.
- Link to v5: http://shc-kerarch-hyd:8080/kernel_archive/20260324095703.1306437-1-linlin.zhang@oss.qualcomm.com/T/#t

v5:
- Align the continued argument line under the first argument after left parenthesis.
- Modify the return value in probe function.
- Link to v4: http://shc-kerarch-hyd:8080/kernel_archive/20260318170626.3654744-1-linlin.zhang@oss.qualcomm.com/T/

v4:
- Commit and signed-off by OSS mail id
- Enable runtime PM for ICE dirver
- Add driver data to diffrenciate the clock managed by the firmware or not
- Link to v3: http://shc-kerarch-hyd:8080/kernel_archive/20251107091315.476074-1-quic_linlzhan@quicinc.com/

v3:
- Update the subject of patch 2.
- Update returned type of remvoe function and firmware flag in ICE diver.
- Link to v2: http://shc-kerarch-hyd:8080/kernel_archive/20251104104935.2752144-1-quic_linlzhan@quicinc.com/T/#t

v2:
- Addresssed comments from Badgey
- Make Document binding of ice pass for binding checking.
- Link to v1: http://shc-kerarch-hyd:8080/kernel_archive/20251024050921.3573402-1-quic_linlzhan@quicinc.com/T/#t

Initial version:
- Add fw managed resource abstraction support in ICE driver.
- Add respective compatible and document it's bindings.

Linlin Zhang (3):
  dt-bindings: crypto: qcom,ice: Add sa8255p support
  soc: qcom: ice: Enable PM runtime for ICE driver
  soc: qcom: ice: Add SCMI support for sa8255p based targets

 .../crypto/qcom,inline-crypto-engine.yaml     |  27 ++++-
 drivers/soc/qcom/ice.c                        | 108 +++++++++++++++---
 2 files changed, 115 insertions(+), 20 deletions(-)

-- 
2.34.1


