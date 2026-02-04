Return-Path: <linux-arm-msm+bounces-91750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB0GK3itgmliYAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:22:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D0FE0C7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0456B300BC70
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F061B299924;
	Wed,  4 Feb 2026 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mezqnqfr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BG+hE9dM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5128000F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171758; cv=none; b=RSc/pCFwJ6B9My/0zas5X5kycNX9euhf2uYF8Pg9wDgsEtPaBnZuX9CJtqHM2uCihXffFJuXhf0BhODoa+eb1SnvnxTU/KDmRNzUfIJnv9kmissbn13KBoumhV3duGI1VEkGhiSSTRID5v/2f3y1X0XfmHmSIf653JPsodNNnHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171758; c=relaxed/simple;
	bh=YLb/XR3/x26pgocTpj6GhcAmxicZXGqUhPkjHb+2r5c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qY8oriCSU955Wyj0paEwilFrKRbgmXvRPs3IWUcMJPOtw7hhKtjQgjusQo4zfrSVDaqvjOMuOGRG/40xsc9z/OHOOaJhHL+ELbTC8GtEvBW0QmSsmMNIhdHbqyEGpXlA9IEZigaHnnvrQ8TAuw+GdUnGMwlMEGCodP8R7WrYlic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mezqnqfr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BG+hE9dM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlmIU4122735
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bc3EyfkdPUkMHzZwZH/NnA
	I4VdVDvHXvneEpxKHuMBM=; b=mezqnqfrBhYR5EVVFTYWMVepZsGF+Wf+yJ7ET/
	jAHcaUs88M1jUWdG3o4NMjb+DVfElSZoILcYW8YECqj1dezDDBfC3eL/XLzgc92x
	mcKrCPz/6IK24WJWQcq/f05RGvpDkYROlLjk3vJByosK7Ii0O4xD93OSnLOzMWKU
	b6spbO09XXRHNZGuU9MZM0m3+dm6mGjcQ4Srp/XpCz8naQmYl9TWVYjteeUON9NB
	mCeMgt2yLIR3keldJ7peeFtK4F6MAE8pDHI7vhJRydr2dvFFU4v+cELcx7CRPZUs
	0uwAlHJazPXBCos8NH58A0qsBSS9tuzIMBnJSvc61eIUQkww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkj5q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:22:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81ecb6279d9so5675882b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770171755; x=1770776555; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bc3EyfkdPUkMHzZwZH/NnAI4VdVDvHXvneEpxKHuMBM=;
        b=BG+hE9dMlRF00pBXeY/i62tLoP9U1w2gu3ndbL36+/lRHtGXdRO4PxK7pgLamxygTA
         eyH//mbUp0pZ5qeuRpLjxAeUKqaCBr+DUzNHI+JGEdOtWLXACQ/XgXYYweXCecBvMGNB
         +9Jjh90S4+2UkN/hnKqR9Oe7LRTCXaPAID7fWb8jmM5MP+RRscMfYJyMHdW9fJiWpZIs
         0CQ2vHHvB4bT/6sa5YOhUGY74HeSbUJCUgbZhd6MdQeVIj0/lce6VVn1rtSnZeEevxHp
         t7dCS81pRHv8/sMFG/0E/hcJ5QJwmzW7zDAcnY1hDdtt16+dfEXhwbyNNpF3UY7l7DzT
         gebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171755; x=1770776555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc3EyfkdPUkMHzZwZH/NnAI4VdVDvHXvneEpxKHuMBM=;
        b=UIeinBdojKiFRKwGya4rkQ3Olvc0D1nvHCsqMJSPtyLMiz5KvOt/pxXhqhSEJn7HTg
         LxpyRpdCHYlKN0peVd/JrXyE8zwYElLLR8EGFdLFRJiSDMCh7nSWriDMD3WCP4VLnpJN
         Q4q9zgB4xHE0zKrW9elfbOtuWixJUKfDB/YoYG4i5LoynpTh3t1GpJSySeDU2+y/JhlK
         ofs+gj5bD+tqACgsJu57c4nRTc1Pn6n+k0Q4czF/8e53c/jsJBZoDxpzob5WyoXqb14A
         cgu9K630m2YkTrpuadjOdA8Z6a5uhwUy667jDResYi6Kb03a2Lrk+9mPMxa8mACWIG4G
         QlPg==
X-Forwarded-Encrypted: i=1; AJvYcCUH+TwPpJR8Sp2uD+tBmcM/ykZUaIrQlQuWqZ+HeEw/TyhLycVUSxDz77t11EFN71vrtyJECHEV9UErk2yL@vger.kernel.org
X-Gm-Message-State: AOJu0YziPBqvjIKvfO8lrqADbCh0jrs5zZUEqdqNreL5sxO2WkigxpFI
	N3YUUfKIc+RjVOcDhb6Xr0axyusIXlIf6mbttC/TVTRjRAis1IvwayuEJpffDk4u0pImwXTCGx7
	Ju95jTVU7donfZTt/vzATOeVsgk50CtOpni0v6iDIri5Reqc9C8a4vzIYhbY6JlMNqCxAdwWWCk
	yP
X-Gm-Gg: AZuq6aL4KWuFEaUzqCMitxGs8yJ5O+J3zJrbfvX7nVbUtLJe5f+lxuWm73/FqncoS5F
	jKN6Ee+5U4+7UlpiheBUJ+bETNA1wqJWaSNiYL3eK82TNwUJCjvgj5dFtmLZOC49ZPKvShqxLRR
	Nce7uXguUVkls/tGcFUj9Gh6jqTdlwGxB8lDwUFk1N8+VlwYN8IeSfgSuvwAoFoBVMrUDk/Nm2Q
	m8FGyjVse9/ON25JxbpyNwAT5+IqvVG75GRgCbyz+FFYKCPN5kNUTv9gSav2roaUkVzMLnCZuK8
	Ulu3KJ/DJN/fSoV2ByrKSQrvXPtBpjd3S4snEFDT0is6zukZv431NFTOSPqLyhiIsHGJxxDtEYJ
	O9FoL398/mvy3Q7pQlBQ8B0WV6WJuBu29aTwyYu5WEsXNCSaM+hewzFmA2O0BSD1JTD6gKGiL
X-Received: by 2002:a05:6a00:2d97:b0:823:1d05:1660 with SMTP id d2e1a72fcca58-8241c7194b1mr1296586b3a.52.1770171755203;
        Tue, 03 Feb 2026 18:22:35 -0800 (PST)
X-Received: by 2002:a05:6a00:2d97:b0:823:1d05:1660 with SMTP id d2e1a72fcca58-8241c7194b1mr1296560b3a.52.1770171754677;
        Tue, 03 Feb 2026 18:22:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm695598b3a.62.2026.02.03.18.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:22:34 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
Date: Wed, 04 Feb 2026 10:22:00 +0800
Message-Id: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEmtgmkC/43NzQ6CMAzA8VchO1uyjyjgyfcwHrauyBIYusGiI
 by7g7MxXpr8m/TXhUUKjiI7FwsLlFx0o8+hDgXDTvs7gbO5meTyxCVXQF6bngAnnEF7CzQFUKJ
 tqLGC17Vl+fIRqHWvXb3ecncuTmN470+S2La/vSSAgz6qSmhJKE19GWMsn7PucRyGMg+2sUn+Q
 cmN0oiVsRUhmi/Uuq4f0R56+QgBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770171750; l=1813;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=YLb/XR3/x26pgocTpj6GhcAmxicZXGqUhPkjHb+2r5c=;
 b=/7aDF/h+UeR6MhTfa1L+9LwDPJotXrDQdU/XYhsJ0EkTVKm6D//Xivz9/GBoddFBMD93ctsGB
 2eJS2PasDq8BS9W7bNA1JD/bIT4K9Q/S92ZKWY4AmiUkx/LJh1m004q
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: h1M2gOzM3CtCqahmiJpmcgbNGvgj5RQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNCBTYWx0ZWRfX76PYekHJdAfE
 abIgiwexnhO2wOvaQOLrZDLruf3BTpPfURD8grfmR0Ik0pJMiMjnD7rQj8/u4E7ArXmL6Nbzjo6
 ezEjzBUXeGpARQ7a9Xg6e9JUS6+SDYdyHrqeEVNyITg+zELBUyzoDW/97amvDRrsfMsL3IunGT9
 i6rwB6GOgQaIfAPCaztg8DY9mZ0G9GcRqa/Nvj9rYjw5+uZ7O9IepYrS73gD6ikPgRIPR7bAtMm
 MQYpYyhUqpObEEKKsvs8sMn7LMFtRRV763h3bAQ+/rDNlqk7Ivuas/p/R8dGug2MT2Jy+demOhb
 bpQAb3VVpFicO+wzhGTgXuMXZnc3S93th0vbSyDP/xEEuzGUqi3EVpKonmEG+g7LjkpNfmbokO5
 eFfA0SZC6wJNCH/oFJN4NsS/Rl9+hsxkPLwGoUOEb7nIsj1KP7RHkF7hGZzngX2eA+nDN/ewFHF
 AX9x2CuFaDL52rPUFMA==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=6982ad6c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pO0fZtIvyn0UN2_VQdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: h1M2gOzM3CtCqahmiJpmcgbNGvgj5RQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91750-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6D0FE0C7D
X-Rspamd-Action: no action

The DT‑binding patch adds platform‑specific compatibles for the
CTCU device, and the following Qualcomm platforms are included:
Kaanapali
Pakala(sm8750)
Hamoa(x1e80100)
Glymur

Since the base Coresight DT patches for the Kaanapali and Glymur
platforms have not yet been applied, I created DT patches only
for the Pakala and Hamoa platforms. I will submit the Kaanapali
and Glymur patches once their corresponding base Coresight DT patches
are merged.

The Hamoa‑related patches were posted in a separate email, and I
have included them in the current patch series.

Link to the previous Hamoa patch series:
https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- change back to the numeric compatible from hamoa to x1e80100.
- Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com

Changes in v2:
- change back to the numeric compatible from pakala to sm8750.
- Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com

---
Jie Gan (3):
      dt-binding: document QCOM platforms for CTCU device
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      arm64: dts: qcom: sm8750: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++++++++++++
 3 files changed, 340 insertions(+), 1 deletion(-)
---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


