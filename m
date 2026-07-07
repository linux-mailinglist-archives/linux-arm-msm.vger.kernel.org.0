Return-Path: <linux-arm-msm+bounces-117214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eB3BKMnETGq5pQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:20:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B5719A92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:20:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EJXnNfZe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Vuzrx8/m";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117214-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117214-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7308D3097704
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662163914ED;
	Tue,  7 Jul 2026 09:09:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE3B3909B5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:09:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415386; cv=none; b=WFwZD0vA88EFrmC25OEgBm3UoFWVBwXFpg0m2HHvNwDSfQt4Q40XFgWAlA71SqvvES3PkrRaQ7+ZrKpCaUOKCYGS/oq5p5azZb0FLZmPGdOGG61IGTXiqPKUZAXMS9n5Fd1mNhhPMZQ7hn8vobD1dzqoGp05wxZSAyc8uiI3OII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415386; c=relaxed/simple;
	bh=YJ2uuXHSIbJZT0Fdwh5wizqsLop2xEM6VasKhhh4eMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dt59MqLHxePJ5fxMsE4QF5t6ot+Ojf5wP8dnlVNlRXc/jqevyyEfkODVrob4s6IpVKT0sr2/IBU5rXi1CSszZrxKbatsEwKbwWf51XShP+Etc7zo0F+1YJNMUcpQnPejdp+zK45ggIVSgzsW8kap8+nMMfUWEZDzoyIy1xKJncE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJXnNfZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vuzrx8/m; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DjjQ3050550
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=; b=EJXnNfZe7oNzsWqw
	w/80DsVkc+biROTiGFwVObI+Fhw7ibQo2u64eSz5IYMLYhVYy0kRtGARQfd8amLV
	7piH/woUbrH7F2OOuKbFP6nxq4kvzlw41e6+OBsGXqUnxfESO5wVflpWDfI/JLir
	xlsZZuP46nh1h3I2LYmYfilWKETR7PiZJLWlT+fKqMMFu9Js1xfGF6T4NknRh/sf
	otjsMomessu+GqLucLjsLNJ/jfZ05aR70R/7yinm/3fPGJvLO2VXZ/qy731iwKdU
	ctInXv8BtMLs0Kx6SSSM5X9sxvUusrPWraW1MKlRCLRcxTdQHfL4+cMNhQBoQ5RI
	xGwX3A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u8d78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:09:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso6187155a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415383; x=1784020183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=;
        b=Vuzrx8/mkjkubNkYlNgLrXz7SST+15Y17rzf2kPhM6dj+jfz+7MwA2w+dIsjXGYY2P
         V6XJmTz0RjRdOS1zW7NvqpkLfH5o2YK8eMs5o4++VODHPGtpPPa0cJsDUe469u1+X6lt
         tB4w3yMkDQmQF+xz3dP9m7WCwIh5bqEaK5mfvKTHuQIw/h4lPs/2GQIIGfe4vggzeQpw
         DGoX73phiHaNnyhsDTSf8JXwBg/18ezu/2XkqH+PzObW70o/I15gZtf7S6/cXOkxe6mk
         Yspl1tmgIo8WtQPvlzFh+DivbSeMcIxy0zs13zErISq/IWz0kAWpXzjLzvqcUaI5Akel
         pxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415383; x=1784020183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=;
        b=Msz+2hBFjF1N240Q8NxZw1j/ZCVkf9d8YAkVuwctPhh5ktTPXdLOLqPfJBCHA/BuPX
         Sgi1ub6EsUnGo28j4T/5uXpCky4rkFN5oo2mrea65mLofVm3k8BuIQQJZNjjzHZ3saDr
         D24ec8N2TPXvidA6ciufZVLl/DAoaOFV5vd5kiCXuHtDYIKl/PVSRMXhUlL9lMi4kThH
         bFHC1FyyQlF7txKb64STLUEL2qcsFTbRH6ORud0GJjFctWhIqbxF7VNdvBSsuPwptne+
         eXcqjjLcvSgcYI3kjKIBg2LCppQFliW8DGGxC8E6MLrLIR2W8UGhw76AeJ6U7VpN1acW
         x+AA==
X-Forwarded-Encrypted: i=1; AHgh+RqopAWnrmZr/bjJAYh7FumYFqNrjOVDS2MImpTF+r85crGEAMUCmCKPPzUYELpGTliZIgRMz0jwTQJ1BwZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YweK2pMcrzjoJTUc0NbSttgVNXEvjsgNXz3bafuFELsVraIfLI8
	joE2Z5qaOcbbATI9xhyQVn7bq76nAp7M/3tWClu7ozADeLaSYPR/PY/zqDCfPb7ykmLXQZjLGgs
	TFZL+kGuYn/TTT/eOaGU+xo6AFBFRlNpqQoN0xTvegP+vVJiDveK09tfLPufIX9gw49lD
X-Gm-Gg: AfdE7cmKNZGVEcmpiigkEl5Rs8iYJJxi4NTPecddoja9GWEU7GJ1Qp93IFH0Uai5Q0B
	2eSwWJIfhiBV4S48f8NXm/h/HJZvJKIpuMfHfgFmNWnRgLQtq6Gru2iQmjkmVvG5I9QMQeqvEvA
	GD1WaQmyOujZ0/GPsfN3j2dZp1Rp+dvPFBZ/rTu/be24KW2wb0XQUfHtTnsMujHviQVxG5JhG/r
	2AoAQGKE99dAHs8+HYJoQF3KUCW0bynXRUm9LKJQPfp6L0qwKCy2zcBGfXgUDJoFYRZRJz/hPJq
	45Mh0an9LHcHzNyOoRNbFCoI6PKWLnADezxWBXTFdMQxZiRixeokbvvzOa7dzFgtRIRVXiFalS0
	Lh7n1KZ9ItyAv4PG3CJib/ucHwWVuoB/dyl/B47xWcdGTzGPtIcZ0bxs2zFZtKTsnV9hP/Z73ow
	==
X-Received: by 2002:a05:6a00:398f:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84826f0d90cmr3933159b3a.48.1783415382135;
        Tue, 07 Jul 2026 02:09:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:398f:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84826f0d90cmr3933112b3a.48.1783415381543;
        Tue, 07 Jul 2026 02:09:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:41 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:49 +0800
Subject: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415365; l=2032;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=YJ2uuXHSIbJZT0Fdwh5wizqsLop2xEM6VasKhhh4eMo=;
 b=DWkEQ5zuB1N8gnk/SVlIwaWzOxZO5tN6x4SbsmlNNyndgb831OiRn4rmGyDmHgdHeX1CLWViI
 bortK6pu/vUDWY5vwK4pkrR/zWayyKNqNdKX19/++DABsLon/MS6B1E
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX6avpNV/+hYJu
 fEDXG00X+hfoDBowEgSvSY7uqTwRVNyHiOsxb0Omaqi7qECO7YkM5Tb4zAJRwZszakyqyV5tDO1
 I3IJuvMskOA3l4tLg+lLG6Ad7NWyZEg=
X-Proofpoint-GUID: NJCsjucja3e7DO2tXCwRE570MsTwtoFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXwQKKuD49z53s
 TlXam+i8zWoSqdQXcY8CVSXLoHqNsr7OfD1DCXNqrgcgNpqXh+kbjT9M4jr3zRSpagTbxtCvz+y
 O+CIOivGCfdp8YBbL1n+NtKG8917aPhhuuTaHmTKc+PP/gU9E7YQClLGEZTjCt4O5ZUrOuS2tot
 Vwcwlp4LnsBLxLveHqsJ7aUWv3mI9pZrjXR+kwNAo/dAloETAdyD3KH8bDQaiKf3gdBKz2TOMTG
 S/9gb0Tjf7/UeoFJ0+2ny/KSlj2M7jkAH4YLqUvFTCJRWoByQcvxJOinUoP50EEs8zDnDJwR7Ym
 JwXMC/5jODzJbglBUdry2hRNkVBMB3xzA3vrK1xo2xyOBwbBt7mdfRQz38NObdH01Xb4mqtM5EY
 f1Pu6oC9PiGMiBp0wehZYGN1N2pLKzQeYkrv9uXR0tiqYViTFebuqjbLtD5ekCJA3VGQINMrjlK
 8evx67sm45IUmP+nxnA==
X-Proofpoint-ORIG-GUID: NJCsjucja3e7DO2tXCwRE570MsTwtoFV
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cc257 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PCdWZNGgF4fqn8E18fcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117214-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 006B5719A92

The TNOC compatible previously required the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
AMBA bus.

Change the compatible to a single "qcom,coresight-tnoc" string with no
"arm,primecell" entry, so the device is created on the platform bus and
bound by the platform driver through its compatible string.

Drop the custom select block as well. It was only needed to avoid
matching the "arm,primecell" string on unrelated nodes; with the single
"qcom,coresight-tnoc" compatible the schema's auto-generated select
already matches the right nodes.

Update the example node to use the standalone compatible form.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..72fb1210e22e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000  {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1


