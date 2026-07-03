Return-Path: <linux-arm-msm+bounces-116152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wA+XLTRGR2qmVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:18:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A36FEA29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:18:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tfu0MG8E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LsROdTFK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116152-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116152-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 043E8306A53D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF99344D8B;
	Fri,  3 Jul 2026 05:04:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25983546F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:03:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055045; cv=none; b=pyk3q9V20fyh0tR6veYUV4MdwCtfbAZwnRDgIQFlcK8cR+8yws2MejSJlfELGWPQ97wGET0OVTvyLwnWmeSYBV8wJd6/M+5hTQaXuFWtNGoRQ5dU/Ny9GwKuc2yUXXAuHjJgIBWTaJwryxCZ5fAfkMddHNXrRvm6zr/kMwGwVd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055045; c=relaxed/simple;
	bh=Z/WKNegsFatsDkLsxVMEZ3HsqNDu3wLrVIGJkYC/vDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmizKbsvvlFL8rkhM2A5iwuKekWAuXV4uspNdpj9orleO5QcJZKimsuDLHXjVCNbWEfPhd/Ih77ZezHUh9/6Y6dZgP151Bj5YUNa46MKQjWlzeqoToXtwaRo9LesJY2gKnBHD3Ex9J99UHsle3Le7gSzkOrO/Ak8N8YGcEeuRsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tfu0MG8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsROdTFK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6634358T2825847
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZk/vWN/O5F/ZDLqPE8QMw1fE1YoVN9Nf7DQqyExBlM=; b=Tfu0MG8ETJE7D4iT
	uEJssPb+iZky/iJo7Quo0oveYgdgvaMU08mTQfgH8FmVX0OdTrKudsKIPK3OXMMr
	xHXP4kFO5O92LGX7YEQJAaLCVFGdpej2o7MWjmpvQXcxLTudZGh7omqo6HZb0RkQ
	ZpTscgnmX0NxD0Gi7lTYgJ5SdR1pbTNLBgwLqoyXvXE2ZiofeX1P8gONhrMVGH/O
	L3Qvv0rE6ERxjHF7V4OwZjDJ+4kfO0xdyhDHq4wrSDt1MhpFg7Q522RV+R9uq7Tc
	6ruzztQn0zOz/30W/fAjAxnqci4zuJ6D2orYD+Z0suEMNxUtfZC72J75Qf/e1xbk
	u3gt9w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcg8mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:03:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so169652a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055029; x=1783659829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZk/vWN/O5F/ZDLqPE8QMw1fE1YoVN9Nf7DQqyExBlM=;
        b=LsROdTFKp2alb6Zt5orjcg4a2SbRtYbHKKTQ2yc+f1ZzIkdaJ3ogfDrFfeeZLpZIRq
         m4kN2CJJC06elcwbg+BRj3rcNvA6BPMW/Kj+dxFzgLGIwdz8VsZA2wwwTdIMSJ3WZF8I
         w7+QtZkMgNzW4I52YCYdPr7ekonxL/MPiNW7mL+i/Rd8gCqDL7YC7etGk5Vm545L2Z+l
         kUItNuSju+snavAe4mOmH9oqSn90ue0ahOzDOl61aRLcsglfwjuWX5m1O0U6wAJZjxuG
         aOsMqduQ1wtwMO9lWZIc4P06j1lxrU7EO0qKlM4/ctusUXqE2dlXZQVe3DcqCefzVw3w
         A/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055029; x=1783659829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZk/vWN/O5F/ZDLqPE8QMw1fE1YoVN9Nf7DQqyExBlM=;
        b=s92WHGAK388vVbo8qeaBoQodNM5o71PkiMxiWn0fQ7qW5fkVQ1msmiixt8UjEaxClg
         44R3S6K/jK6nlC9X2yjwQ/F+Iuuq3uef7GnKfS/fmpp2IjtMFvoViMpfgra+3FEogqdF
         H4U8bkpKM7kvyXf3sxaGqfHVXQqWbuHfR99iOgqGhOKzzQmcOM3MvosTgiEooi5P+RTe
         mselCuCpSbZKkH/TbCP/SgD5sICuRsCGq05mLDZ7OlIyClz2ofPfkGXLcAVUKrU6wqWx
         s4e6SnvadVI4yeFqb1ktOGROgvqu0PYjvnT+Kb6dTXBe4WiOpqTJz98+zyDulq6AEHba
         cuVw==
X-Gm-Message-State: AOJu0YwVZPjrRf3Wxr4zM7KCid/2mwWKqZs/98BeHo9c0PIsw/K5Xw1T
	LHzZW+DhcNKszbT8++Oft22uP6thfC6aaxDHBnaWT3AvlMFl2HeYxTVt8Sb1BZ3FDAh8yKLIJjs
	+qHoZijGJCSbnWV9jJfOmHHAnLdOVDCjXMq/CjjYG+2KrHQBLu5+UYhh2Wr0db/7CF3ZX
X-Gm-Gg: AfdE7ckNTPeMtn++hpMxmMF9L0GV6L8sBHfQp0ukpFY756nVfJP8VuJxPB4QiuFTp9D
	Se/uBjQ3hkcfwtkgsU1KBbdOzSiGVgI/+vxPGV7KsqoFU/4guzvCftyOSfmIbGUOAFLkQtjM7pN
	KQRfg63mojwGlRnBXvKm/cf4C6aepEv9IJo0VJ8Bu7fYaEuHau8DhxOOO+yGRLtllQv1piPpLDc
	s/dK+GfPQT9N3+0PCCHEw1lgORI4J4CDBCvsKJz4wayTzmMHqGMMx/ySApjk6eYR4KNHyD0S4ac
	6YklXNUcwXGCj3EpYUBJZUwwqH8FYM60eky0ZjojV87Zs4r8ItKP9TtILLvi2kbJlv5iIf+EQPA
	ccJosiidUh+GDSbvebBLcumsv+6ewhH9wGJfLUBga
X-Received: by 2002:a05:6300:6715:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3bff422d1d6mr9767412637.36.1783055029092;
        Thu, 02 Jul 2026 22:03:49 -0700 (PDT)
X-Received: by 2002:a05:6300:6715:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3bff422d1d6mr9767367637.36.1783055028571;
        Thu, 02 Jul 2026 22:03:48 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:48 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:04 +0530
Subject: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=2444;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=Z/WKNegsFatsDkLsxVMEZ3HsqNDu3wLrVIGJkYC/vDQ=;
 b=4rAKxVmboxTEsxT7HFUBnFpo6MQMdbnmWvyZUSL6xjXKCseXH82IXoJP7DNAKZwcClya1CWVA
 a/S+elRIqK6B9a3GaJd8IrCbMsNhTm75h0rXG2Xf0nt9X2cyTRbxdFd
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: bAyZmWXa1etKYKsAGFh7J9Z7u9SypM1D
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4742b6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aPnvGIK-T0NEGnooipsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: bAyZmWXa1etKYKsAGFh7J9Z7u9SypM1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX17LcW0UVsqCP
 l75fuUfcSGIv9DbPXpagogXeWTt6OIG2lKynmK/NMxGfqsG345UNtwoTEsCjCar+AsHXhIqv2kT
 tFTO79H4n61b3Zw4YRXGwffOz6/LkMk7pSLxg8yjMwrmQcglDI/glxYgF+EJwvtOVWJ/Xo3DEg0
 UEFZb/SNUmDf+/ug3LfdaYJoAjo+UJkwPKLs5IPrBG4W1hb2WXzi2bgkS/hv5H6nE52jmsamPg1
 oBG1+PBSCHkq7avH71zmNbE3jj63X2YnQax/NiBf5V7Kdo1EIww1K+DnbDdIuq0KNFFPEkv7RC+
 /HTwqAXs61/DoxJvaxJBzSBy+Jqm32CRI5gTPbmRGBSiWg+meTKfoylEwoBlhKB1ImreA2Jjrz5
 DCQ5O9P3gVcHgKdHRZVzV8cQSiBFK1LJosN9ATanAhDCRLxuDIKetodz3b6YF/ppGPW0A7QO3jU
 02po8R5AxxazwpCfEmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX3hSosugRRY/K
 8D80nYGX2WiTT/mqLBgkmk4yDuKIGTHNkibL4mx3Gbu7Mds6iIX5waq0jd8wOMT7XiA6unWBwn3
 OBqnge4rBN/lSCg5KFZYf1bvrLD1N+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116152-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B07A36FEA29

Add Device Tree binding constants for Qualcomm Thermal Mitigation
Device (TMD) types used by remoteproc-backed thermal cooling devices.

Qualcomm remote processors expose thermal mitigation endpoints
through QMI. These endpoints can be registered with the thermal
framework via the `#cooling-cells` property on the remoteproc node.

The QMI TMD protocol identifies devices using string names (for example,
"pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
`#cooling-cells = <3>` requires numeric device id in the form:

  <&phandle device_id min_state max_state>

Define common TMD device index constants shared across currently
supported platforms. If a future target requires a different mapping,
additional target-specific constants can be introduced while preserving
existing DT ABI.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 MAINTAINERS                                 |  1 +
 include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57656ec0e9d5..ffd85fd1dd80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
 F:	drivers/soc/qcom/
 F:	drivers/watchdog/gunyah_wdt.c
 F:	include/dt-bindings/arm/qcom,ids.h
+F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
 F:	include/dt-bindings/firmware/qcom,scm.h
 F:	include/dt-bindings/soc/qcom*
 F:	include/linux/firmware/qcom
diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
new file mode 100644
index 000000000000..73efecef0f3c
--- /dev/null
+++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
+ *
+ * These indices are used in device tree cooling-maps to reference
+ * specific TMD devices provided by remote processors via QMI.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
+#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
+
+/* CDSP thermal mitigation device id */
+#define QCOM_CDSP_TMD_CDSP_SW	0
+
+/* Modem thermal mitigation device id */
+#define QCOM_MODEM_TMD_PA	0
+#define QCOM_MODEM_TMD_MODEM	1
+
+#endif /* _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H */

-- 
2.34.1


