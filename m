Return-Path: <linux-arm-msm+bounces-91581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNJUDveMgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:51:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BB063D4D04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06F37301062A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 05:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31683254B3;
	Tue,  3 Feb 2026 05:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sr8QcVE3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E06vGFQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3EC226CEB
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 05:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097908; cv=none; b=OVqNMUahAkQ8uJxqkeNn7mBICxk7BctIaL5nWpjDeUEgoKnRS+KlzVTQs63BnB6PQj365zf8HAygnhztNmsaPXHfLtkjK+xNGivKAgBQ64PDz5oYsQsQE4BuVd0IXAV5WQftk8fsn+D7FTBLwabbL1s1xXLvdU9RzpSSLcx5OwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097908; c=relaxed/simple;
	bh=TajdE27mPP+2Kw/IFOmq88f6m5lOQWZXeP1BQhFHupI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jy9IqDIvSXExyzGc89nOIcaNhzGi0be+i0VMr5xkHEjMrpFrzHVPcizHQpF6XXkNAMjlAx8yxcmeeqEC/XRQjR+CNXGWJcOHPMEgfqQJpSTRnLBKlxnsBXV9lbCs7ZTULWc34Wg8NQsDc14wjnZ+g+qNMDzbaAse/nnfsGfBe7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sr8QcVE3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E06vGFQ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612MGt8g2356983
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 05:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kx92FTjEfxmmBtyqbWtwwR
	4Nqt7vpmhDYyQ2Akip5cQ=; b=Sr8QcVE3FoYUQUNLlnMv760u0nuK4Ki/rdXt6r
	acBlYic60DfyXXVyPcHcQi9HJbSVWLMJ4tBpszzRcNPmbILpyW9xkQr3eMIjDx4+
	GzKnpRWt0mFXivOnA7222b0RhkFQmk8T0k0oElpVKb8CBV8Jfaxgh4kXe3zktEyx
	eZbgHWInmaZcbV0hInu7f/jZoweJQmlMxWnczYCSh5dw95KOVbhV1LOB8iFSK8SZ
	pfG0egrntFsW6dws4u3yhIGHeZfURpH+ceDWWLyevrcL667ALvu1/kN/GC8Uc79G
	iHzilPkcWp3nqEz+07ybFD1pffkucV8rZDCPAs00ymFDaHmw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0masrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:51:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a4b748a0so112448015ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 21:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097905; x=1770702705; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kx92FTjEfxmmBtyqbWtwwR4Nqt7vpmhDYyQ2Akip5cQ=;
        b=E06vGFQ//KgswXdRZsIGjSy8mWB3sA0Os1LuNLA0nFsBGnl4kiIncQYK4R/7sKV2Z9
         XmCBxpT+0XlQt4qfWN5h/vOEBw8ZksQkOdrcRZOpHD47Az5x4Y1A52y4xy4K2XS28t6i
         jPnnZ/i0/6lisBnsnbUlna6btslktE9sC3E/6s88PJXahv/b2C+zQU5ijIps1UetBjkp
         OQs/CQIPcmmFSYKLxYwBgGJUA2Ma6/p52wPfJj4qRjx5+YnjfjwBUJ88jldmgijTeEgF
         XdQKj77/d7ROP4MAR73cszEZDdOnzVbV8tM274nsUDN5AnRfj+SHWIfBYcC+ImiiRzZm
         0+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097905; x=1770702705;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx92FTjEfxmmBtyqbWtwwR4Nqt7vpmhDYyQ2Akip5cQ=;
        b=YFlPQ9C0hkSjJwRKzdC9JZNK2ngu0483x1r/boy9w/Yfgjzqzi6k7gf1/af7OXSExL
         e59UIgGlZqd8vLAJP8ouUkx6NfsF65P3z7mtsOqJK0+8RQkbYa6UL3gvMZV/qnJoUnaW
         wr3gXpDje5EOkP94zKw89uaHLxbVf/nkTwyDaBdgA1JLVs5ctTeVvQGh5w5o7+mkEyCv
         tEwrDqaWBqJ7VbxxWY1pvcorBWXC1AIxWDoMmCfKfyXCBIDotFJR6Fez1DXd3fDskaB0
         WWNi3YhxRnyblOYeoBIVe6KEGrVrekgIzXrQNHTbKnYSAFg9tlxFFCVh0XLT/N85s60y
         PG3g==
X-Forwarded-Encrypted: i=1; AJvYcCW35/Y8O2mBa4DmkOs3IoezGeebRMK/zjJdA/vTJR48xOBAuxtotefb6uYNFRFGtdN6d0HyOEbBy3ISS2/T@vger.kernel.org
X-Gm-Message-State: AOJu0YxtCc4+8fG2hcIhMvAjdDnw4+n5bCUjQ+MFL1u22k249MDXmFCG
	CISpvogccA3ZFx2L0KmX6e6YWl7m6zPPCCXgBI+gB30h1RRj6jIaBNX4pd20FTWVj5NbRHoCsOI
	JI94v82hbmdmLPPM4PKDjw5o8u4xzWdu1CVTAODOIUIer93KJZXoOrW/c3dwyd8Cj5w6s
X-Gm-Gg: AZuq6aLwasvvKRzAKo4v/s1l4+B+UfeYdrDvZ6Xf5ucUNzHXBOVhDXsfdgqlnzAwgRi
	9NZSI/N0JtZRuPYe78wQdnDVcgghZFne9k825omqmRuWYyi7KTHwVVuuyPKAZ2nmftIYgItfRFk
	HFc3LWK41wnfdTt2Zlj4Do42Svop3rVOcCuw/OrOWneBAdCV34URSNk01EpGAV3KGIiNn7yvU+w
	oYMlVwdkQJ12d1io8YKLxNHnm53azzFXFNRp863txiElsI3KJMh8Qz2+Xpim60jloShLnfVzyzU
	m5c6Er46a0oBi5cSEmJiaw3oVNrAHwHptCenH0/Q2lrDJgXnx3xivrsDDBPyjdBPUQZqmzsCZET
	Lsn1Fon0XXfZ54EQa70IxURDltCjz24g0x/nfSAOBzbkU6AQKjzygc6gUtA4EMhUzI9IC48YD
X-Received: by 2002:a17:903:17ce:b0:2a7:561e:690b with SMTP id d9443c01a7336-2a8d9a6024bmr139041535ad.58.1770097904926;
        Mon, 02 Feb 2026 21:51:44 -0800 (PST)
X-Received: by 2002:a17:903:17ce:b0:2a7:561e:690b with SMTP id d9443c01a7336-2a8d9a6024bmr139041125ad.58.1770097904415;
        Mon, 02 Feb 2026 21:51:44 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:51:43 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v12 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Tue, 03 Feb 2026 13:51:16 +0800
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANaMgWkC/33NwWoDIRAG4FcJnmtwRtdqT32P0oNOxkZI1lY3S
 0PYd68JLeTQ7GXg/+H/5iIa18xNvGwuovKcWy5jD4BPG0H7MH6wzLteCFQ4ACoteQzxwDKeJ5Y
 0TlWmUiVNdJJDMNG5hImjF33/WTnl7xv+9t7zPrep1PPt1+yu7a8KsKLOTiqpGTAlDRo8vJbWt
 l+ncKByPG77EVd89ncgmjXQd9A5S8Z4m3hnHoCg/kSrOrkmguokon92rAmsT49IuCftKgmdJBW
 StTHAQP+Ry7L8AHV7dfjBAQAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097895; l=7152;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TajdE27mPP+2Kw/IFOmq88f6m5lOQWZXeP1BQhFHupI=;
 b=9FpMdSycfxhalGXUc+02GOdp7pBGiuapcrYmjrsnmD+bO0CsvZ07SB8mAOnCWYY4khctT/N4s
 BomoBO9dFLDA6oOrYultXd3VOJ9kVyP/XZ57C6tQs/FzK2uNFZ9K7BN
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=69818cf2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=3NKmYVG5dUn0lDVUWD4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rxaAHWal7gTqrsjFhSRtoVRk8zVPiE8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfXybrw8/qGnCEi
 iYb5CeqVX1eKrtqiqdGKM3psyAmOQH2filc6aaOnRn/dY+acQXHJXBASndIYRzLI94tYPZHODeH
 FH6h8crRRZnot1J+iV5tPrjxmu8HVTXUivGBtrnxPlcEk0+9ynCZCXsiKe72uUaa9xOD6KgM3un
 cvSEYK990nrAroqILiV24oUlSk+Xtfh/ClbSg2O9aKQxtobILSOT5lr+udAPENSm5ZZci3OWspm
 Af6aIlWyKFkBd4cQ987gWM+sZHrlnBpQKrBOCqFp/kAgo14xhSNnrxRLrhUlh3g6r/8Oz0+1HY7
 z4wSyhch3buksJCm7MsdHytB5rUVQ6OXUVcM6ZU7Xv2mPtiftGZ7fwlIT/WTko36ayCAUGXOb9Y
 24c0VzUTD0bARDXVxfbtGJlV3ma7Hypo4BhsgAtztths7rF7+H3Rh80VuyhLrWbpyNN3AIjJilx
 Mj79XR9vsdKMtqIhHyQ==
X-Proofpoint-ORIG-GUID: rxaAHWal7gTqrsjFhSRtoVRk8zVPiE8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91581-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB063D4D04
X-Rspamd-Action: no action

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold0

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (8):
      coresight: core: Refactoring ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: Introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 366 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 103 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 136 ++++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  36 ++
 12 files changed, 829 insertions(+), 60 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


