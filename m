Return-Path: <linux-arm-msm+bounces-118118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gJ9OMu9bUGp0xQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:41:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971E736BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:41:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Kj6kZy5F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UMtrYiuC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118118-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118118-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC86E30417B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889FF31F999;
	Fri, 10 Jul 2026 02:40:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8931F997
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651210; cv=none; b=UyHh24lmvCtow4DFN+y9bWIuNk0LSr244Nn49wzWfrf7AjSZko0adOv/RfqstG3p9GS/AaeY1ghz5vNsVeLJP1P9km2KxWTiOULP6pcKdNMcyWDLg/YxriQeTEzN2tsItCk6vwbWu4RENtVMd1L6CQ3r6cyw39hiE2PczsNgD/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651210; c=relaxed/simple;
	bh=/VrMOAI7RMTSpCjPO+MrxGESmI6mgxV1a4rVfM8UdWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdUfeB1uyK9Op4gxjPL+H8b4xhY0p1Ki6sKk3SGqiOkPaRylykQ6QChkEc9V79cP9D/O0F7km0gGUW6nH9hJ9u9zWGpbpzl+lsKwwUw/iYyIe/pKsphumpoOy+SRt96I1VtYDk6PBIPDLWqSJKSHVafsA8Pjzx24FEHNlCsexUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kj6kZy5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMtrYiuC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A2W58j2374378
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=; b=Kj6kZy5FuHVLnZ8t
	YufYnucsng3n+1HWl5vfM4wLn9WIVMJE3Vz8C96eULHsKBSio1DIHlM34OmEw8Kv
	gPTnrByXiYXcWRWAyKUsIBhTZxe0UcTlPBwTvSOto6wNQpZdN9PNyiz9zKmwrFTg
	xLLAKpFn5X2e/sJ2zDsFmIk/JDqC9wPz0pMdZVrTxhjDa/U3dag3SyoTSWvGlVgj
	46BYg856Mfi5Y2r40ntyIVa3kOt7MkTmqy2MwK3nG6c6pxfe7ZwG+EC+hkJiJbqC
	t5QMfOlOABuGHCxoEfij5jXY6zh3PF5I0tTXTyKuR2IEqmGk7k0MXyL90c9AblFQ
	wL634g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5jc1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84877b362f6so333243b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651207; x=1784256007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=;
        b=UMtrYiuCwSh9nhH669kn7zSwlBnnf7kHUoVIS7iYipSvy0IFNF8CkqaNM7mD53Mrha
         ZTeuHZ9i/9adxN2teLpJ783KP8T/IsYQqqIftOClroDOmTtEGftzRU1kacZYdhy7VC64
         322Jdf/yi5OEq/1C4y53VcJtzQiee0EXmdnFQVzfOv8+jQF7v2SaUvnIVz4f12mXE1J9
         pyL1cBXyoxUn32AoP1Quy1CTMp2kqPpJ0O/AYgm9Bko8CGpZRPLkrlydNi5k7+bFG/JG
         9ymiVB1vPTgD+PW0KpyDBntZjRj1rxkdax2FnjIm8WAyLQA73zUqmNOavu1SkC2ffgeM
         oB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651207; x=1784256007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=;
        b=gpCZedeLwzjMbXtQ/aWiupjg38kZIY+g074JTA0dNrdN3kB9WEoNLIOQcQmz5fj4wR
         Ot6+rxZps0IbGz9OSn9mDPggjqQmbsA7V+0UiufqNy9VGfiKNJeaVetLBLHBVg0FQeSv
         Q/2xtlMECLd5Zn5nnDy/onhubjyH9dTzlAeFdUgxDpVzI3B8C5fE+lOwXrDyoHKA/Pfc
         8smbPD0VX8j/9btLo2JsMe9LqGZ3DGdtb/1JFuyx814PcqpGkrSDnqvWfcOFp/LlAm3Q
         ejd6T49SRrZugFjduOObUMA7sb/UAyyIyOesqPLKLryttfI3CpNzloE9F5eUHXiA76wz
         n9HA==
X-Forwarded-Encrypted: i=1; AHgh+RpMloT+1ABii9Wz1DWb0W5eb2+SkEFMQ2Xi6MsHxdMMHp4FpbAOXKitHtSfD//BZeLJggRruPirhGNNe+iz@vger.kernel.org
X-Gm-Message-State: AOJu0YywJqnCZi+to310hFJYrumcJqL8+hJzIxsJDlhvs2e1tOXCm9Er
	NjommAHQOd5Q2Kv6oDDHrwUYDVsyyuIxUczBSwnes+RXsO0wzozeyrKNmuhgmAVFQ0NiO1LOgZ/
	mmceP1+P7hfsS7WuM0Ov6sifXv2ooqMydqdLPVGPsYtY+igbD5aw5CoJfJa8yaAGGNqfA
X-Gm-Gg: AfdE7clVVdah8aJDT9bvTvYPKNXrdWlafIDP7+kJ+2/XFLKpZ1h7CXMNBAmuVwub4ts
	IavoejT/UkJ91sTx85Fs/nSvktx45NdiPg9Xv4MYDUR2/uMhP6szn81ytKUkuQ2MShMQoPCw30B
	OCWRNPHz5gud24EFTRpo90dquWfIbkAT0XVvx/PGGXgSMwLLVPbuwqYIpLXU5g439m0MtyEjvOO
	hSCKEDZDbySLrqwPwqreCXabbvjki+KyTjrWt/V5yjTtJfcfkd6DJJD1FcPggVPJqBfAzK0smju
	2C2JiGQpeD1y9coJ1R0ZkLqb/Th16+EaEUaUn2S95Hf4nEYKt4rtqowIcfi93DJE/Lr6pS5HfVU
	xM+hFpSF+qXiaQFCN677Gh/xBX2uDufwNTYsNjFBFpthO2V1j+kytmQfXeHPavSMnrWjFm6m7Hw
	==
X-Received: by 2002:a05:6a00:3e12:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84842ee66f7mr8113042b3a.20.1783651207330;
        Thu, 09 Jul 2026 19:40:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e12:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84842ee66f7mr8113004b3a.20.1783651206712;
        Thu, 09 Jul 2026 19:40:06 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:01 +0800
Subject: [PATCH v6 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=5005;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/VrMOAI7RMTSpCjPO+MrxGESmI6mgxV1a4rVfM8UdWg=;
 b=6y3FHfzbxUki4D5drjaSM3YVMMezRawMOVbPyF0uw93CA5mqU+VVMTAN9itU9nQTEeBfM3Ge9
 JbnbH3GHH9QC5rzvF/iwh9LByMKOs5B8Boq5siOOZ85twB8UCsUaqE/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a505b88 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SM-CJC9rQbeaPTssbJMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX5MMRm7nEB3Tq
 ceHihgPiIUBLq90002EUETmNlLpu4AXnthGfbrBFTuDfj1PhdM5byUKVDfXL41i2oLvcpXLIRAS
 AvZBFEXHIfR7XAqXl997CMBZj7rj/2M=
X-Proofpoint-ORIG-GUID: Kz9ZdtCzHpJyl_HBrsNJcYiTeLJb_noz
X-Proofpoint-GUID: Kz9ZdtCzHpJyl_HBrsNJcYiTeLJb_noz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX6RXnC9oha37i
 uwwpFfmm6Po1qHTXfW9TPELo+NeEvflmSSOrpEoZDIG6Y/XYnsnMWja1kG8qJhdTzbuTeEvHdUc
 t2qrowqcY9TAG98QYSL9BsO+bGvUDcMoqPUKUhi7cMhgSInFvqu9QRHPDh7x6+/FLERc4FMEZF8
 5aoiea1tDHJlSLGUrs2lSVx5ZdRQ47sX6eRoM/v3Ik6lLQG7LLZm9lRHB0qqkpYqaQyYuRip7Km
 Y6WQzW9i7wojDm6A7UZYGC0hGHYfie4UK9e71EIrau3XdlltGaRRNGGKAKGOJcz6vLD+DfvVmNm
 pnnTxlC6S3HVuaqn/WZ3PFA+9/mSoaPnFeQlCa80RMjkjg2QpcxhPuTR0tVpuXDV7ArkMOepu0u
 oL1CBShQy8laf6oPhIfTgDaWNxuyHbKve8ImR9h5ECLWDJCUB0wkTbY6lwSG4mIKl9mYQt6PL6a
 XF1wNBaufLeWMgNi7Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
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
	TAGGED_FROM(0.00)[bounces-118118-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 6971E736BBD

The Aggregator TNOC is bound as an AMBA device through the
"qcom,coresight-tnoc", "arm,primecell" compatible. The AMBA bus reads the
peripheral and component ID registers to identify and probe the device.
Although the Aggregator TNOC exposes the CID registers, the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the AMBA match fails and the device never comes up.

Bind the Aggregator TNOC on the platform bus instead, where the device is
matched by its compatible string and no component-ID probing is performed.
Add "qcom,coresight-tnoc" to the platform driver's match table, and rename
the platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. Update the platform driver name to "coresight-tnoc"
accordingly.

The ATID-unsupported handling keyed off dev_is_amba(), which disabled ATID
allocation for every platform-bus device. With the Aggregator TNOC now on
the platform bus, that check would wrongly disable its ATID, even though
the Aggregator TNOC owns the ATID that tags the whole aggregation path.
The Interconnect TNOC aggregates trace within its subsystem but carries no
ATID of its own, because the downstream Aggregator TNOC already owns the
ATID for the path. So base the check on the "qcom,coresight-itnoc"
compatible and let every other form allocate a trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..737cc802aefe 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc")) {
 		drvdata->atid = -EOPNOTSUPP;
 		return 0;
 	}
@@ -278,7 +278,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -295,16 +295,18 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +315,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +323,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-tnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1


