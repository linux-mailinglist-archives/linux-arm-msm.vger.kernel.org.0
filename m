Return-Path: <linux-arm-msm+bounces-118115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +B/0J35bUGojxQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:39:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBED736B73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:39:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="m/Jq9D2H";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O3S9OUR4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118115-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118115-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABBFF30059A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD664313E2C;
	Fri, 10 Jul 2026 02:39:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9081FC110
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:39:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651196; cv=none; b=OKoFagZoNa02Go+vRJcGRFoycOpLNDSz8XIGO2SxNI3/nzBDmD6PLmA34JgmHzmS1MebmDguRx48HCeSawC8F1m0OlyoeBJ5SEvrcmJHUzkGS10Dq9v32HZ0gn2MVMRZiEIU/hqf5zBRNqYprYjvT2BP828HNgV0DvgaOLSJhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651196; c=relaxed/simple;
	bh=xvKnn8xG6ZPfwD57jd8SONQvv7hlfRpKuIOQb0FuU0w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=usEf6yrkzYNIeYt8XV4CyuP8QMuvTE1illP2/buqYjB9rIXZ5rcp36XcHpHappg8E7h4fSncO2Z0iDO5L2uEFSA/0xgcjiS0v0yDumC27tTXRIyk95R+xjPxG2lysUKQDNsZ9tLor6+XryhDoC407vCyWH19IIc1VHXHbYt5UkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/Jq9D2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3S9OUR4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669KZKes2917939
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ogfiyANGIl+cZdRVADkVZg
	m+LDhUR6VYbG3snsLbxtY=; b=m/Jq9D2HjYUNwkTHpnxE0nhPb5Nf6kSiAv+dum
	834OR7J9tZ7z7eODykntCWZsUfokm6PG6VCAG7IawYTfV7sDkAxtWG9ia+rqHauD
	hp4dxxUICfyzAVieqNt8pb4yA3BlmmcnfOHuIgzWcsdt17WR0fM9VAQ0bIEsn9IM
	AcIKG13s3ll229RQrDGavco6SD3NbWZ5uQPnoquhOWQSgX3hRPEb2c+WiaLU1wmu
	x+GxBkLRzwHuLm4iulC1nyjCvBnCZf9QgJuLVq+jb6dQfx9+ofGdUOZh+QOa7edp
	srmGkzGNwXyeiwMGKxrv/X9EOC6LDEuhLdGSIeGy6/vFsZqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte0yq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:39:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so654007a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651194; x=1784255994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ogfiyANGIl+cZdRVADkVZgm+LDhUR6VYbG3snsLbxtY=;
        b=O3S9OUR4FR6Kmnyn0QtmvGH77Bbca9RfeBdUQkFaXI9j4QWHlVL8impoSv/cDf3O/P
         2MM3MPg7+rfhyW+NUSaH66dtAz6N15zpYBocJ1Evtc18XSUJ8vRM9AW0trAiwphYkACE
         F+oO46RAt9f1VYg1ltrzD623jj3VScV0NUGloZfM2BfTmH7DzO957gYzxcKjTPTyvxg3
         ECiP2aO3Sp103mxk3qsGVG5eUnm/E7mY4WGjaGxpLhxbABvRDHE8xuY+UiqqjwSC6buN
         pfbdqdA523F7hyquzAV0xdOkunncEIpQMaF3oi8272jjyGfjIfbQn8rwiKkO9WKVVpnW
         JHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651194; x=1784255994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ogfiyANGIl+cZdRVADkVZgm+LDhUR6VYbG3snsLbxtY=;
        b=NUP3s6KrlADtye7QOdyjJrdn2yNNr3y6ne4Pda1rdzsH991J+ScwxFt30SY961U8+J
         cUPCj8nR/bKOUkcmChTuT+VcRzo23bDLQQOdqDkNu0tIYxSKvHQjBqa/Z/qICU8TnvHQ
         pXp6LzZXmhaTJc5Ll+ABQqqmL0PVbH5qPazC/VtYttxAtJQWkC4urVfI6z8XIgGYuNQ5
         i0rY9ALDoul2CwDrEl12KhxS/Knq8pK/X5ghEZ3to0+9ETcUj9Zo6oFMpLB7OWd6JA6/
         V1Lfll/McRdJir43d2pKR5JpLRZzvd1sYwX676ZC+b6JwRVH5deh+X0qfdYefqCmYJrc
         CKlA==
X-Forwarded-Encrypted: i=1; AHgh+RrszcnpEPq1/ngRlEZYwmYMtoRKQPnnolHtKMRLKDDFToGrBi2Av8ywq+PpveTN13MtblbC/FoZhOs7zcl0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dHiGfyKoKYPNI1a38nCe9ybCO6ydYE3hk+o3CqjHgbLDYGkp
	bxOlMLTxC0eSEZy3wJrQYjb/BHPDJvLAovOPRsDdxddC9GYeBomBD0w4UM1UL8FO6teq5lN1bMb
	NpdW9Jy1BE754UjUhyJZUYaSMBMlyCFW/AdTCb8OXnF5lcsIxzFnwSICr3zyCrCY5f0Ob
X-Gm-Gg: AfdE7clAfUNXCVE7ejqt4DXSmOCNIRYCNSE0pfSZq61vN6P4oOiO3cJft/7U165RClo
	V6Vgk2fKNuMh/Vnz/5kCANlZ5z6uDB6gm+1A0T5oe5vhx+eVVbmYbhrHeqj8B8zqi29RBzFSDRX
	lRMXi2mxeONOMy0wmaVBtM65kexCX/IOMNYFRPi/ZJyiLzvR7OfyN2bYqoZFjR+VeynLqpM8xR6
	/hDb2NnQJKZ7kcQM9sNNz3Hu4Kbb+EjHuydDoAr2AI+ahlzGQOsqI2D+SM8Mf/VEDpLBVkSNupA
	GjcSwDynJ2zL8MAgLUfqy0Mbtv2WO7fxbCwPTGxmiFYkzCx9p/mIypqRMENrZp+uX/NEy93VhR6
	NMfxg4rG2gcVQ5Da7qjT6qgj+gjDIuv3nGyndFIbxkcqbvUwxAF6CqmZuB4KIG09syaKicrBeAw
	==
X-Received: by 2002:a05:6a20:43a7:b0:3c0:9c18:d5a9 with SMTP id adf61e73a8af0-3c0bd1cbb17mr12737949637.70.1783651193817;
        Thu, 09 Jul 2026 19:39:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a7:b0:3c0:9c18:d5a9 with SMTP id adf61e73a8af0-3c0bd1cbb17mr12737914637.70.1783651193328;
        Thu, 09 Jul 2026 19:39:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:39:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Fri, 10 Jul 2026 10:38:59 +0800
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVbUGoC/43NTW7DIBAF4KtErEsEw39WvUfVBeChQWpMConVK
 vLdi7NpFrWVzUhv9OabG2lYMzZy2N1IxSm3XMYe9MuOxKMfP5DmoWcCDDTTIGnK3/RSfcSxRHq
 uJfRGa1ekUUtwgwc7JEn6+bli797pt/eej7ldSv25f5r4sn0CnTjlNMRorOLOpqheS2v7r6v/j
 OV02vdBFnuCZz2gjBqrFbCkIQFf8cSDJ9iGJxYPGEduJUcnVzz55xnGNzzZPY/JBymdl4ateOr
 RMxue6l5IRggcHIbhP2+e519yVrroBwIAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651185; l=4545;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xvKnn8xG6ZPfwD57jd8SONQvv7hlfRpKuIOQb0FuU0w=;
 b=0z5kUo8p3xEnhRrNursWnU9U4wwJwwg8oa11GCuH2tzEXwMqm1AzrKUKv5EkbA/XO6EcA6Y00
 204f2jXiTrBC03u6tpMQHI+a8N+/1qGiO3hEQU5DPNyYIJesO6Y4161
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: DpLqr9r611UWY_JnS6-3FG5bEl1PsZpv
X-Proofpoint-ORIG-GUID: DpLqr9r611UWY_JnS6-3FG5bEl1PsZpv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX4Qt2/RrNcz0x
 YN9DRqYli2rEiBocT3mGoXxLU1gmD5C/FOkljXm5SwL/lQyrBKkSMKNMf6/tmymGgs+6/PVNFPh
 SvyQ+e0/ax6D5VHkgcEcysepJ2JqSCKQ4e/NAxrUyk1UtruH/TvoijZicozJscXUcL+Tp7Zoboc
 sLOmJWJFUcXqoSPCWo72vjntT81suWoYj094SYQl6K5t0MC0IGpL4NMwfCjBdsxbEiJuY7qnVUY
 UWyLG+xXWgkfL1DVIeIm7x9jRGGe7HLGgwwkN09h7OCDbGFF7qc4JB3B2EPsBys29oqiHBJnRZq
 nmf7nbDB/SgiLLUbX4oE/BvUNOzaQbTfxiPqHWrk6pu71lxfFh1wWr8tSKZGI1yUcvp5uMVeKhx
 gUrRFDLzeekIkMNoMLaHCktyhZfpqaL/xDYzAGcP7Ezqga4dIzzq0NFsesCtI6ggrGDvaXjehbM
 C1H1QqbcmCP2ULDF+GQ==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a505b7a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eJfGDJWfQcjy8rMVS6kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX6G+ss1aG/PtB
 Ial96Gv1gOqXpk0HcxsJwQTcFZ1Y2Tkx8jn7CGGN40KfhuCnteN8QUd6xqHGpXArPi/w+z/A9H2
 7iQEWmjqjuCLzbtnMlf+NxQMCm6h3Jo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118115-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BBED736B73

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series drops the "arm,primecell" entry and turns "qcom,coresight-tnoc"
into a standalone platform compatible. Without "arm,primecell" the device
is created on the platform bus and probes through the platform driver by
compatible string, bypassing the AMBA peripheral-ID read while remaining a
fully functional Aggregator TNOC that allocates a system trace ID (ATID).

The series is organized as: binding first, then the driver support for the
platform-bus compatible, followed by the per-platform DT fixes that switch
the affected nodes over to it.

- Patch 1 (dt-bindings) drops "arm,primecell" and makes
"qcom,coresight-tnoc" a single standalone compatible, and updates the
example node accordingly.
- Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
"qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform bus is
no longer wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
fixing the probe failure on those platforms.
- Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
"qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v6:
- update commit message for all commits to focus on describe the
  hardware itself and the hardware issue we are facing on.
- Link to v5: https://lore.kernel.org/r/20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com

Changes in v5:
- Drop the separate "qcom,coresight-agtnoc" compatible. Instead drop the
  "arm,primecell" entry and reuse the existing "qcom,coresight-tnoc" as a
  standalone platform compatible.
- Update the binding, driver match table, and per-platform DT nodes to the
  standalone "qcom,coresight-tnoc" compatible accordingly.
- Rewrite the commit messages to describe dropping "arm,primecell" and
  binding on the platform bus.
- Link to v4: https://lore.kernel.org/r/20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com

Changes in v4:
- rewrite the commit message for the patch 3 - patch 5.
- free the allocated ATID in remove path.
- Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com

Changes in v3:
- add standalone compatible for AG traceNoC device, allow it to be
  probed with platform driver.
- add fix patches for sm8750 and Glymur platforms
- Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com

Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (5):
      dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA
      coresight: tnoc: Bind Aggregator TNOC on the platform bus
      arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus
      arm64: dts: qcom: sm8750: bind traceNoC on the platform bus
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 16 ++--------
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++++----------
 5 files changed, 27 insertions(+), 36 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


