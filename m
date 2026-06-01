Return-Path: <linux-arm-msm+bounces-110631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPvgEWSoHWp+cwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:42:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667C621EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A1A1300B9DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14423C9899;
	Mon,  1 Jun 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cg2Z1sGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im9QRwUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF2372EF6
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328542; cv=none; b=uzYZDG+NS1fSzQP9J4dbc8BsW2p8IYjS+KK1odkE3hN2ni7f/JCQos+JwMxWaY3ITL9EpSITCYGVCHq9wyPLH/829PUvmlYGrTVkKcQqsgYRc8qCyzzREDyAq+VgrnOZjLFqZWPLh7LwHCTgr3e/gtidVqCb2+0pWRhRUKL8kcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328542; c=relaxed/simple;
	bh=Rh/5zPaaIxp8ZbUvRytanuS13RcsgAHtRgsm5GA/+8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WRF2dbl6mGPGHvOi7Pk352EjqzEdmr4FpXE5xrDekbsJmVKOMy/iKM6hCYeq+pjj/TKc/nUFJHAKmgbSCLg+dkevEoS0LYonmOWdLscX/UzAm52u0CEyb13xhafDq53UhZrV9ByL8vvG8+MaKu+oY7r9qpJGRStMHoh4V+Mj9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cg2Z1sGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im9QRwUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EZJAl2740421
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 15:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hcfOh5bAPnT7pihcXCpkCW
	y88Sld8qy+ZTvfp47FKLA=; b=Cg2Z1sGqGl4stZ2J6Vnw2xqB5nINH65kgvC2su
	UpRa8aHbgkZ+wYqxnJmDSvelSfbfKXvFqGl0iEaz8yMsBQaTVnakSFoF+HnHOcNK
	3O8Ab28f1yaMUs6nMqMo3hASYBISKlpq8UcaG9J6fdRzMd5FqAD/IOQqlJrOY1uw
	SBh1jCugY6Mo9irmtCWHKcyimQ7e58j7Cj+5rXmtDFrCgRikiPrF2XUBnwsGoViP
	W2URI194jRRwqCpq/vsCscT+UMJBdw7lbWbGHpYjdHWmzVk97/MQz8cA4JL17Q9Z
	vDYAGITUWJro5y5gyfGgCMrHR6j5/DSFQxCb0XGHlA6GWK6Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqhs3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 15:42:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304dd917645so3673142eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780328539; x=1780933339; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcfOh5bAPnT7pihcXCpkCWy88Sld8qy+ZTvfp47FKLA=;
        b=Im9QRwUqaE+wapqCbZ9PzrMMTKrRv+GfujCT17mNzj/GZ8Ahc6vz9jlU/NJVcWWFwe
         LX5CK/53HMacKeggmRzetp1S5zDpiRJW/N4n+hpjXuzy9v6g8aneYX576936cx9Vw7eL
         gVc/JRWPjZeMJsBqeFuiJAqqBVOi0etzJ9YumXstX0Ku4xmkuwBMzl0Deb2dCYZNy0ze
         FmCWtXXcg31jQ8Iea5/HvMxJPLRdFl6m8Zs/I0dWqJXB+OkI6KfVK5aP+N/i3crM9srL
         z0ZeGDML6XRxiwvjOqwEAFsPKZgCDgTs/hpkVgTNIu+obSddC6k3KYVYGwjZ6oA8LCaF
         QLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328539; x=1780933339;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcfOh5bAPnT7pihcXCpkCWy88Sld8qy+ZTvfp47FKLA=;
        b=NcYI2Kw661QyMyfEH+eq2/QdzqTfAbBnxOBt2ofZX0i8pCyF9eQeCOPkTDSNwMWm+D
         8rVU28UtdBq1HbSHGvx189mIPQZ7bMZDyP1/cTu+N+XSoNbVFB+4xjiOyHUN4msCgdRt
         eFLfzIw7fsNRgl+MC00Nc8Li2uw8U5Q7A+eMHAcur/98pR/hgr9/nd9Ke93sWJdSik6l
         GrqbmPCBo8YAUiZcuOmOZxJwVt9wRSQDZZjsReSaGxEix/T7kAZnvj0HaDtkUpBJniAC
         zTzQ/e9V7qP5a8xmN1ZayITiIE9XcAIT7wQ46GHS9oGNBHp+6f+YlXb5F4a9F+7c7zEm
         x1Aw==
X-Forwarded-Encrypted: i=1; AFNElJ93gukg1TxgC+yy/7W/ujXO6GNdf2o836K8ivp8jvdeYZVE7pKnNqGAPpkJIMAACl1vwzmQc8mm5++nxkUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YygM4IY7U3gA4xMd6z+GbmTeFbGnXINJD+HL0A/sConExysKXJn
	Ag73ofImyGdpR2mD9qHyyi27g5I8XhNKK/brZXA3ZtF7MAdHE8pSUR+DaMY74oqOQP07HIbW5pU
	sjuY/qNPyMkdHPR3Ej5IsyrC/H3nL+icZy/3V2IinCuhrkvO5lR6iyQGdStFWNwsKbVzl
X-Gm-Gg: Acq92OGjXajeyZf4c5cfd5JxXV579NbyTV1wHdZStFWcjSFRfMnvC+kpjfRe0NKUdX/
	hfK93aVDJkJCN2swmh0vD2zs649dQH9+0h8AquZxh4mMvlQaMISthQaRlWq9vQEGwA/3a4GFSGB
	lr7EbdxmxQDY2XvNIPiaCZ89gAezE+vHBQEecgEIo8HIPsR6I5yMLb0OJUTCi+UYn/Q7g+x628a
	pBYhxMSWdo0r8fNLRiBUmtPlWbLH0tZcfwUXqeJ0ZpHX8q2VH3djIldShvqRBkX1msVFcB1aQrX
	qd90b9sWLQARLeRJvccFNKD5MpcmDMEokbwTWvMCJbi0fj/DIEquEuJclmIw+XaWvdnmLSTtoXI
	//Wq2F9LyL0r9sSR7N0vFsX98vfxm5UF84WwuUtOVUV8b3Ke3CdmCU8GaAMgBgiq0Fsx8SaTkld
	dNfxE/m2jU75Q=
X-Received: by 2002:a05:7301:290b:b0:2ed:e12:376b with SMTP id 5a478bee46e88-304fa6b75bdmr5168113eec.33.1780328538843;
        Mon, 01 Jun 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:7301:290b:b0:2ed:e12:376b with SMTP id 5a478bee46e88-304fa6b75bdmr5168075eec.33.1780328538271;
        Mon, 01 Jun 2026 08:42:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9430371eec.18.2026.06.01.08.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:42:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v4 0/5] media: qcom: camss: Add SM8750 support
Date: Mon, 01 Jun 2026 08:42:13 -0700
Message-Id: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWoHWoC/42QQW+DMAyF/wrKea6SACbltP8x7eCCWaMVQmOKO
 lX97wugaodt2i6WniV/7/ndlHD0LKrObiry7MWHIYniKVPNkYY3Bt8mray2pTEWgdoW5DKOIU7
 QhQgN9SIQBpDeVaWGUmNTtJxj65xKlDFy56+rw8tr0kcvU4gfq+Fslu3/2bMBDVhgx2z5UFn9H
 ER25wudmtD3uzTUYjHbBxa1MfnjeqPNNjG4LFx12Dumln5h5F+MUru/o+UJ2zXo0BCWDVY/YO9
 bHZHPl9TztHWiehahtec6W+1SaHgnGmikk3+kNsUSu8LOIhHi3nznJ/qBhGFZ+KnOBr5OsD1g9
 8n9/gnAv9Nr7QEAAA==
X-Change-ID: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: q2Ys2hkUb112XNRs6OCMz7KSo5m0Ot2y
X-Proofpoint-GUID: q2Ys2hkUb112XNRs6OCMz7KSo5m0Ot2y
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1da85b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZthKqu_aCWk3wB8NWGYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NyBTYWx0ZWRfX+Vj24ecOVh9o
 tw+bbBhWV9jIeJX4ZbqL//1fyMEXJ7UZEPBbboMQ2H7ynJNqT7ojifXoqBbPeLoD4BZBvFYFpkS
 0dEkuF4pAqBvEiBU8ASeoiEwtQsmK/gMsoaKojaA0EQviewlhIi3rTxdfMkbwrOVHgjrcu5KR7E
 4++B4rJV5Q+FmJGMksg1jDmQGft0BYU32HPchX4cijJDBEJHiB0kHzlLgATipmnf5ZNsNDzko4M
 UB3ayzPn0mzIV1Q6IeSkgO6xMxXQKBCNRZpxEU0pXbpIYjBSvhIoxkAvnVRrgWpL9nGu/yH+DQD
 RkVcNTnbvw2UycrlHcuwlpJkFz7d8mzmm3UDuwGA9dzx7GGVEyJ9Ppd07EAhutvDfJOogTGA/m6
 K7bUoQE8K9qSrIYw292sT/pEo0USfyOPtecdavXD0jkwdjX88SKKPG3h2oV3zefvQ8OGhyK1wgG
 fPKIZArRdGGX+KT2V0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010157
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110631-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4667C621EF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the RDI only CAMSS camera driver on SM8750. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

SM8750 camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v4:
- Update dependency to kaanapali camss v14 and rebase to resolve conflict
- Link to v3: https://lore.kernel.org/r/20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com

Changes in v3:
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v2: https://lore.kernel.org/all/20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com

Changes in v2:
- Rebase this series due to conflict - bod
- Add module descriptions in binding commit message and cover letter
- Update property names to align with previous generations - Krzysztof
- Update the vdd supply names with 0p88 to 0p9 in binding to keep such name
  style consistency - Krzysztof/Vladimir
- Add missing Kaanapali dependency - Krzysztof
- Add regulator current in csiphy resource due to interface changed - bod
- Make csid board level code style consistent and add comments to explain
  the differences between csid full and lite configurations - bod
- Remove redundant initialization for empty set in csid and vfe - bod
- Remove DTS patch due to conflict with camcc dependency. Will post it
  as an individual series.
- Update vfe commit message as renaming work done in Kaanapali series
- Revert change-id to v1 to avoid increasing reviewers' workload
- Link to v1: https://lore.kernel.org/r/20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for SM8750
      media: qcom: camss: Add SM8750 compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.3.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE 980

 .../bindings/media/qcom,sm8750-camss.yaml          | 433 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 442 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 357 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 1248 insertions(+), 4 deletions(-)
---
base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
change-id: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
prerequisite-message-id: 20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com
prerequisite-patch-id: 03f9fe5d9a18559572b9a56c3b1f0fb86109f4f2
prerequisite-patch-id: 5fbe09dec4a5448b016a6bd1d36473727bdbd485
prerequisite-patch-id: 60fd384dbeb9f837b0ac09b8900f82c42c14f914
prerequisite-patch-id: 23a9dc6e6230cb4453df4261ca37653fbde28b69
prerequisite-patch-id: 7a42e3280f6aaf17df14d5afbca9b29f34070116

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


