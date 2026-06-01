Return-Path: <linux-arm-msm+bounces-110564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPOAIVdnHWrqaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4813F61E0EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9F18301B4E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710AA3932F0;
	Mon,  1 Jun 2026 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4RkX+J+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jr6pql9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A7631D72E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311690; cv=none; b=SG5pzHEKYVlvkaic1GX5FXSWOFT8Rj5kZgGjDvcD3LkYykmZRQAmxj4DIwEonfHPayUbfdT5PdRV8Gk3gQ0sO/UjmTzLMB4RTkkIxXNgmW6xycCk17s1fNtDNfSg+odv0SQrlVTVBR1tr7YalHFjCvrerycULtNGq21v4807aYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311690; c=relaxed/simple;
	bh=zPhGhaxgIP/ykoIc8bmxAEn7Z2Y6uZJLeMVj4YnpUL8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TLqMCRKPXeZUrh/1NT9PURmO/xxZ737mBpc8vXpBtWmx+IIyuPSclV6yUdF1R1feyvfYMQ9hkBKHLTU3jjDs+z/wjDnICnZsDj+RdNX+B2bipgV45XXfLpTnqyfKxx9F22vom6ir/C4r7zlUUDYjrY/1ijJl5OJw1tq8aL50lvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4RkX+J+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jr6pql9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dnhY4110823
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+pNvkCmcFOTvEpSG5W0JyF
	mCsUk5a9WiJCwuvo1GWUs=; b=Z4RkX+J+5lYBRyqJiJOWN1BnLaapkIWT3mhmo3
	JCDsnYQ7Pg9H2CfvhmtV8e/tC/d4mBCOfc+UhZEQjfeI9nyn+WSvM+KIDd2XqOas
	eFbRn1/CZn4zaIwe7YAMEFjpNroX1ju08/jyby7RYU/tHktvpQ5htGZ3BW7EuCDp
	2CO0uavp5jI6Zmq9RV/EMay3OyWA4LMKFefEmvDo4ZgGxbZh7YS76gV0vpgAscHz
	oweHfxTIMer8sRNk8uKTXlAtJoJxfaDhxWkx2mtJjhKrKdQjSKKqzMw2kkSYpziA
	rIt1gfCVXwowEYJ4b2OnaQumOS0YAkmii4+APisa567yUIlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3rhdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:01:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso157161765ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780311687; x=1780916487; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pNvkCmcFOTvEpSG5W0JyFmCsUk5a9WiJCwuvo1GWUs=;
        b=Jr6pql9gYoC4XGXqnMtgFg0OERhyDvOe9RVU3xF4F7CskkNNjNYE7Nw8k/4OisqrWp
         8yTsrtCK6jPdJ9nb2eb6AB9Jo+s+GDqx+C1hFZDhGsdewgVwbhqu5wKd/QvdUxvu5vam
         moEYC8RWxvs3llCJeO6TKN43BUrxcpoP/Uy4PrdYC2hYx/knTZ/k+rEAPdLYqR7UReod
         3JhfpeO0Ngyyuj16eKnKVt/L7uWn/r3xiV+D+oR5sz7woKL9WTV4TZv6tdj8hg8UrDtb
         h4eSAY2j5jVAXvwGI2xd4++W0k2cey1/uXxVvsZ2SZ7I2qZIx6q/Hi9ApwpXQ4GPiUns
         nzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780311687; x=1780916487;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pNvkCmcFOTvEpSG5W0JyFmCsUk5a9WiJCwuvo1GWUs=;
        b=PlvcTliOLvt/CxQFkonMf4Q5rqDFK6E154fFcNxcH8JHw9/jPjxAlrYDltUkthmUHw
         qfGvKX2Hl1K6RNU7qhUEJAizgsI9/W32s2K6PLNsDQUoklFG6lDRExwInhtoJj8AgAkx
         UZZM4F9PhCaW1hmZGrQUfEOK9gtldQSIW/wte1CIIwdqctjSc2ZsuKB4Zn+8ALtHAMUO
         Gjz4KE4cLbsiYxJVNZflVmEhAjelXaJe8brg74NK7y7bW/SDqSbZn9OiRuGfX5yfPt1S
         Th6cNayvf66lLkEOJ/EOHqZ8cv3Ys+h6SsYbbohDJyHNDbFKG/4n6eqUQp/ywDEg1Rkc
         pFcA==
X-Gm-Message-State: AOJu0Yw3aaYjZR7VpMLUpH/AChne/mtMCT+802R8NCnnSrI9yMfVNI/Q
	2ORAlKwWqbQeLr+fu5zMK/+2uvyH1txKG5Q3W2tog8OlbbN7E+toCBtUOqF35li3LAC83L4CXCu
	kdA6TGAw70Gg/WnQTIwVXo40g31bfmABVvd6Z7fIQOBjObyPOsonNmKXyRXhHYeRsAVUyYY/zNN
	Bl
X-Gm-Gg: Acq92OGYtTCct2ZOsIhI+XAcgozWHkqUgsSY5H2sFUrHHRsvX26/h5rpWVZQaGKFFXp
	7s+kSGS+xIoxAkYnnrWLciYEWWaC5YCrGHPp7swyjhcglDV5e1oNaP7pbB6bt64+Svq+rLnPDr3
	nTeGD5cqc22nZ9PY6zSUx0zma17OBOLoMvMP8AoYuqNp000sQrjgVX+hEmRQIPbIpES8ZUmaD62
	564UcmoQyj1yl5v/RiSjM2LwquTjxFssk8v5vpIai3ydpAyaAr+ENSjxMBKoL4V+8Jkky6cqwuK
	+3GRhcqX/72JmRxlo/F02pnxe4zG40OhB4nEHKSrQIhB7gceVH3gCrtJH5ee7ElEfKeUCkR7prF
	C1ikdQvRhDVMVdT79AM8zSowleAvtruaPKQ2eG4HJ1pas6hTCs/ZgM/O8Xz3dtFs4
X-Received: by 2002:a17:902:e849:b0:2c0:ca93:1303 with SMTP id d9443c01a7336-2c0ca931ab7mr60176615ad.6.1780311686958;
        Mon, 01 Jun 2026 04:01:26 -0700 (PDT)
X-Received: by 2002:a17:902:e849:b0:2c0:ca93:1303 with SMTP id d9443c01a7336-2c0ca931ab7mr60175665ad.6.1780311686257;
        Mon, 01 Jun 2026 04:01:26 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6edsm126239185ad.18.2026.06.01.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:01:25 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Subject: [PATCH 0/2] thermal: qcom: Add Qualcomm SPMI MBG thermal monitor
 support
Date: Mon, 01 Jun 2026 16:31:17 +0530
Message-Id: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH1mHWoC/yXMTQqEMAxA4atI1hOoBYt4FXGRatQI/pA4MiDef
 aouv8V7JxirsEGVnaB8iMm6JOSfDNqRloFRumTwzgcXXI62zYJzHLBTOVixKD1RLIgCBUjVptz
 L7znWzWv7xonb/d7Adf0BjqHVnXMAAAA=
X-Change-ID: 20260601-spmi-mbg-driver-582aab5aa6a6
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1d6687 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iUTBZumk_BVKSr9I0GoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExMSBTYWx0ZWRfXzNSx+5yG6FnO
 JSjU2HPUEDXhi4AF+WO/71Wx9j4YVYH0VB1AoPClkrnSpTHpDTcyP9jjk6ape32U/Zoz+Q0hJgr
 5KreuRbM+HS05IsEqvDthUE5dHVRbpE8pabmh0q/809Ohf12diTOMOTn6kehClIjgKjXBIGYcwu
 Yq2UMxl5/wN5Q2Q6dF8tnUUmYhHIxj7sriP7mF5iwPld8fODYi2KxnLEje/ANf1AUeZ0f0jWIdM
 p3ebV3pVpYAGCv50aPsOXALVRIUlj+AV9gpkDf3Uj0AZM3DjfgQxfAewB5ixl9gpOc/oNy1t1lW
 ii8IuYbmpIkFuaECGbF6CkrCg8t99uVYUQcHcwyGHW6sv6o3E/AssiC2q82Yxl196dRU+wNy6ao
 pG00zI3W4LWnwEyKWuvnSZJdI039VeWkH8/2NsSaWB3HEgvobp4qoyj0f1NLtp6VpTGZ67PZ50w
 oLcQZWTbMhzzaDxn42A==
X-Proofpoint-GUID: udZ_dFEA7PcRvV_Xq9dhpvh2ZQgHBkG7
X-Proofpoint-ORIG-GUID: udZ_dFEA7PcRvV_Xq9dhpvh2ZQgHBkG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110564-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4813F61E0EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for Qualcomm MBG thermal monitoring.

Adding support for:
- DT bindings for the MBG thermal monitor peripheral on PM8775
- A new Qualcomm SPMI MBG thermal monitor driver under `drivers/thermal/qcom/`
 
The driver monitors die temperature alarms, handles the MBG interrupt on
upper-threshold violation, reads the fault status, and reports events to the
thermal framework.
 
RFC patch:
https://lore.kernel.org/all/qq3cggafexwpdrv46eqijxfmrdbqusl2vpbuswqmcvshqueaiw@r4mrmap4nwkt/
 

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
Satya Priya Kakitapalli (2):
      dt-bindings: thermal: Add Qualcomm MBG thermal monitor support
      thermal: qcom: Add support for Qualcomm MBG thermal monitoring

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 .../bindings/thermal/qcom-spmi-mbg-tm.yaml         |  72 ++++++
 drivers/thermal/qcom/Kconfig                       |  11 +
 drivers/thermal/qcom/Makefile                      |   1 +
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c            | 254 +++++++++++++++++++++
 5 files changed, 342 insertions(+)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260601-spmi-mbg-driver-582aab5aa6a6

Best regards,
--  
Sachin Gupta <sachin.gupta@oss.qualcomm.com>


