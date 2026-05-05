Return-Path: <linux-arm-msm+bounces-105928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FxmFerI+WlhEAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:39:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C214CB9D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23DD1307B070
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C36D3EF0A7;
	Tue,  5 May 2026 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yzq+Au1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aop1vf4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FEA33FE1F
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976603; cv=none; b=hq+YgDH6ZWVDjGR4kJIxILjPH93hZpUpGgZdZXAr2OgLMfWGJ60Q8xrdrouYx0dNzPHStbgbYFD51AcuvIqKK1EFxo+8T51R5jiI5u0mrt+/ZI0M+IF1IseHV6TqZlrEilhCMu3GjbRXLyvrIDNMA9Vj3nCsEihaAwfxENLIz40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976603; c=relaxed/simple;
	bh=Oa67ll+SfGJDvCja57/v8Qp1QHN/7PWaCOW+/qBBsa0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bhu5KZ+5RF2SNfH4Wa7hrgXf6Ll39dsUnc5K500lAQFV7QaMgPRtgFf7Y7vnCu+TwqeQZ7E20TRNEALdy2EmXiWoOcl1ocKC+5YPdLbREwBxb5sf65CL1GQ613lQkg2H+0uy0YA+d859JQ+FGEsiQy64E0R9tluMKXWyPTPb3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yzq+Au1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aop1vf4q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456lir63187548
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yHFW2G1/sOkMmms1N9d6quiB/HsNtRPth+f
	ahI9w9Wo=; b=Yzq+Au1eJ3IlO8Y4jj8Ed1eCcVpeHgFO+xl6Gbz1J3kLJpjRiRm
	YfYEqBwoiRzlVjF6v7lJGsvcTySK/ZEzxl/cuR0ev9jcNS2HAxx7obp4KunYcvgI
	SJnhOk0h4VoUnUN96IawQptZp85OtmaCxTUjM3cKSIzwcF7GSaIKEO8TSqbIqUUS
	o7ENUGAdF4f9y06PpO1J2VqtJjB9jqXH2WhkjU9OTiKi/pu/EuQUWT7Heu3FFoU4
	TAMmHjKhj6A/nR6vGrT1TMFlFUvQ817xv8lzaaCGcwzRhUDBKXoTnJHhBrFCg8kc
	nVf4YbQuivgLpvcX8HgY0g9Z/AKL4qNfQQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkk8sf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:23:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so12110285a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976600; x=1778581400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yHFW2G1/sOkMmms1N9d6quiB/HsNtRPth+fahI9w9Wo=;
        b=Aop1vf4q4ybtvgbSfOaxxoGlDgpVtaPJ+qN5LSCr3Q1OP/oqMkVvv5x06SLberG3bR
         6oXhd20xnMm1ble6Y9TOz/q2xaScrW3P/6IO/S0dIN2SHMZuBtwqpa9JrY+62Pk8nGiN
         65pF/4ZGOEAywzOEgRl4ZVOZBdaiphMVrvHufPD+jmMbBwMx861SqXk5U+DD87PfWg9F
         V6xYlWH55eHEX0KSUnUqBaNjdFFYJ9F20btkm2/nw4wDSvf/rDBGrDZE2bT09cHcJLan
         j+BRiv+J2odvlc0Ls5c1F6fEJLyUlWMZhwakx6hBo+J4i/bgtP4EqqgUBVZZCkEylEWK
         53Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976600; x=1778581400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHFW2G1/sOkMmms1N9d6quiB/HsNtRPth+fahI9w9Wo=;
        b=Xl5uDpZGWDDgYLczd/+6w3n7qgSvK9eYjZcXlawSHHkZtm7xOB67rBYsYm5OBQTUgf
         WRG2Z0SQ29lGV41li3HI5HlY9ydrfOZw3ryV/0Fn7rwQ/8lRBMo1/ZjtZ2b0q77PP8Oy
         lyavcggOjzbnfUylmBuV79aL+/2G3AM3NULnHvRq+QID9EqB1TESYJSE9mL9/PZDdS9E
         XZ3VHdKqJwxYlWSnKbp/E536pheNNkA+bqKFCvW8gDif+dNR0JhRIJnNYXHx+akrlzNc
         7RM+jNC8odWUQvITXrbDrS6iSisQadKdaqBeMFiVWfJqTgTrwNDDJK87hl6qqYTI8eYY
         Fw9A==
X-Forwarded-Encrypted: i=1; AFNElJ90pDPzcPOug8ornTj1N8Krgv2OG+nW5+yaz9lbs/y64iO541uYJ0G7GotGl06ZiiHa1ImAY2dHXGtgBXv7@vger.kernel.org
X-Gm-Message-State: AOJu0YwA7zo7Yqyw2CfjL2V5VrA40IJetuAiuw7YAOWaQY9/YdlCn+rg
	LbH41JdRN+qzmPZjhMBi6H45rAp7h+elVyn/PSxMtPSh7obwzTov/IT6MIUSMd4D1qqdywZZXKl
	AlGV7YSAnnOBq+nPqvXnZ6bgsJLhGhzzJz5Xtgu018HZt/bA3/KelyKgsjzw4XLF4tSNv
X-Gm-Gg: AeBDievfPy9AHn1UbLUyzCmgrutJ6CkML6YxMk6TjbmkUED7L7C+L/LOiUdKjLyEFxc
	qgwcc3Axy1LivMYwUxhVJo3xFeRx3GKIZ1CSTv1lg6PMXY1Y38eJLPpkExo78IcCSG3eoSmHuiL
	UvNFrzr1plvK7rt/+8Rcnx8iwKeDb+hR8pvuTgX+yQ6XYg/xCkCP4Oj5U7ArybmaFG/FfORqaAW
	Ms0hDJdIPHyPrmWYAgogO8phjAyX1/B0ZGYZaWecpSUEION3/bPO3XgH/H6LFY8frSeL2MV5I+t
	PFVX9qptQCxvennLUjwr2z4KWQnP4efv53HaO+DfgKGJH8mwYeLN/QCAUEwuqcDlBu38nrY2TfH
	e0OPYUlVIpsRrHYpDxtQNK5xT52fe4FoxdXHGmNWg48bm0ohyVWWkNx5iEwHkmr3PLqiUFPvqlA
	hrhCZfYC8BDc/79TXaxlJ0doEmz0S40c+SiBeG8bQtm8o74aI4DXsglwy/TAfstQ==
X-Received: by 2002:a17:90b:3952:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-3650cee0ae8mr14028032a91.20.1777976599493;
        Tue, 05 May 2026 03:23:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3952:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-3650cee0ae8mr14027997a91.20.1777976599000;
        Tue, 05 May 2026 03:23:19 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:18 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Date: Tue,  5 May 2026 15:53:04 +0530
Message-Id: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX+ejmfDKPDRQd
 vqvscXpubqN/9yGRGaAj4Ox5VGcQU69p/0rsEa1yOUyfdEZK/a8dJO1+i8Hyg3j9RmTdpV+DTaB
 CoktgYR/Bth3CKzke5fIdWvHhxYKgrjq8Utnm6gVq4FuG1DfcR6dsmDfsAvZYoXRRVxTJQ4pWcw
 kzNErWEDGAtHtk24lJd7UE9RjDDJ597YeoH27f4l4//Ki/CcvhDGRsdDIXTrMKR2c8KnAqmo7sd
 N7AVq1U2o0BApr0rb3NFEjSL64hoLWCS/Mwwr43Pi3KyjzwSxFZtRsmtOT53HoRBNmzEGyXw+Zy
 Z/c8CK+vb3EOS2nwWOA3xYaz4XNT/CQNlqIoyF/WeYHAhZH9Z5n7qQlN7uwjv9uuQ4Xo1een0tY
 JrpXG0kkTCs1j8xe4OwMY2XkH2nz7BKJrnTUirQQ7nXzph/amPhR/p3KDHSynk2ama37NTmzeYF
 ydTEbTB48NQVQc22nkg==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69f9c518 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=RJCUFTRzgs7Fj7gX-CAA:9 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: knFG80EJPnRxdI927rQRlFRfNzTltRGN
X-Proofpoint-ORIG-GUID: knFG80EJPnRxdI927rQRlFRfNzTltRGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097
X-Rspamd-Queue-Id: C3C214CB9D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105928-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,qualcomm.com:url];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

As discussed in [4] posting this series after dropping IPQ5424 support
to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].

Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.

Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
I've resumed Gokul's work as the last submission dates back April 2025.

- Secure PIL is signed, firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

[4]
https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/

Changes in v12:
	- No code change
	- Rebase to ToT
	- Change quicinc mail ids to oss.qualcomm.com mail ids
	- Link to v11: https://lore.kernel.org/linux-arm-msm/20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v11:
	- Add R-b tags
	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
	- No change in other patches
	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v10:
	- Add R-b tags
	- Remove unused fields from 'struct wcss_sec'
	- Remove glink and ssr subdev if wcss_sec_probe() fails
	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v9:
	- Add R-b from Konrad for dts patches
	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
	- Restore clocks & clock-names in above yaml
	- Fix DCO on two patches
	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v8:
	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
		* IPQ5018 support added in v6
		* IPQ5424 support dropped in v8
		* Updated to use IPQ9574 as example
	- dt-bindings-check and dtbs-check passed
	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
	- Dropped changes to ipq5424.dtsi
	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/

Changes in v7:
	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
	- correctly sorted smp2p-wcss nodes in dtsi files
	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com

Changes in v6:
	- added patch to fix IPC register offset for ipq5424
	- changed phandle description for mboxes property in dt-bindings
	- updated bindings to define the right clocks per SoC based on
	  compatible. Ran make dt_binding_check for validation of all
	  SoCs
	- use of more descriptive match data property (use_tmelcom) and
	  added a condition in wcss_start to not error out if tmelcom
	  isn't used
	- mitigated potential off-by-one
	- adopted use of of_reserved_mem_region_to_resource to acquire
	  memory-region resource
	- added driver support for ipq5018 SoC
	- corrected size of reg properties as per Konrad's comments
	- added patch to bring up Q6 in ipq5018 dtsi
	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com

Changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check
	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com

Changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts
	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

Changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.
	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com

Changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com

George Moussalem (1):
  arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bring up q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
 drivers/firmware/qcom/qcom_scm.c              |  14 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 723 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c


base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
-- 
2.34.1


