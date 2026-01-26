Return-Path: <linux-arm-msm+bounces-90484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHpANbQdd2lDcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:54:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC0851D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B902C303C89C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307F33126D7;
	Mon, 26 Jan 2026 07:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q54uyLx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWmfISSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96258311C30
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413716; cv=none; b=kqSnp+tQCuDzeOO/T3Gillik0MXAdo4wlBfsdZvNdf7lLcBIZO+T5Kk3Qy/DpInZ5vWuVnZld6lrgbEbhJgPMQZqVfte3tT3TgRAao0qbfT1jjeKMPTmHfLezfp/muJGynJmATDvC4DcYhvp8kGE2wQDcTwKoUjjNKLUBoAX1Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413716; c=relaxed/simple;
	bh=ZaOprxm+igQlpDv+uMYUMoteyMudp7AZ4eQ5176LnhE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oc3u/zUqE3wHisiDcY1lFt8Op3TsOHl9SOjG35acUGX+sed327JqAL6Xz+LF3Ns+djL2LSKs9hsZNqm1XBxfnOJhz+H4XSWKlCE4njl8n4vVOP4hKo3RnUG++3MZYHvPwiu7iP0JwrhVtw069xQAn5d6oR5U0tyrdvbeXRx6HgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q54uyLx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWmfISSP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLaHsO476471
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sQKqVns/Die+3pCYhE6oYh
	JiqMcHOY2cyLGiHjio/mM=; b=Q54uyLx7xneXmc+bM2lrrAdSCfTm0+cERVpoWN
	jCmrIEZ1XPuho0+n/tpXwM5kvIpkbCdm+L7lx3R42gvkwxLUipdRMgno7dSR05pJ
	9d7X/YnM4bja/6NDvW4ttT+HWqsAW+PAFzoefTDoSM6UeHo9AWAFsN9H/jaC43dW
	nvuTGsZIdvxCXCK0HJwJ/rzEuLH+KzRJqRpeiJ7/TGGE3gr39uMWScQEzYmuIayC
	o4jdp+AbGSBkb5+MD8HSMM6MntRsNz/ezRNwPB3uQU3VuubYzeZ6ENkAHf9FESj7
	TF7j14/OsS2f3KIYD9/bzONH4bLcmN4Ip3Jhb98PvY3GwqKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uus4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so3617261b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 23:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413713; x=1770018513; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQKqVns/Die+3pCYhE6oYhJiqMcHOY2cyLGiHjio/mM=;
        b=gWmfISSPc8FzuoYLGXPs2vmbMaNb+x2xbIY2mzAVS+NhFy2jMlqWpuaX7zvQjSCYia
         muC619ByWHQPBc0/Ltc4VG5f+4WHDUW0ISPQBO43pY+kkjdWzvlvRiZvgKMjA3gKNBKD
         qy7l/9UG64x2JRVk/UzCJzi+WA+vQlmRei+B7Y4YHr0rvwyZsvFDMIOQUGSgt9WeNs/b
         HAVqh8s17KmjuhmAsQULAPt07Q8bU9xM10aukqk2mKojI0MmrRXYITckBXFGmbl5NGOY
         ef+pJTsqcJ7NtImXKe7e8T/NL/nokxge4kUaCD2Ehaex5SHGzIlyEffMRJilZpD5mAzY
         6a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413713; x=1770018513;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQKqVns/Die+3pCYhE6oYhJiqMcHOY2cyLGiHjio/mM=;
        b=C76HyQJdjD2DByLAzDYrowVkta4ZwE71ZPuXJye6KVVxDqDyMiQU2RfM1/GYjAXGgU
         xn1/0PCZ65mtJjj8rsQ03n1ZpS8uzUL6qhtSI35HCyqSRs6p5T5wY5Uafv7n9J8HBpU4
         sAsXtvFFHXFYl9iY92T3o5goIap+Fg8z9BiYMB9zXctLscEcJeWL9y09Q95RwQ7M4J7u
         Q2TcyInnvrrO4ymR98Npz7wK2s5Zq8f6AiBQZVCtF52lPIN5N+o2nKx18M5p3dMynX4h
         Wi3ICga4S1Ero9V6GgJdmmzZaOJNhJMxEQsrrtqlVuoQyET02oCSDgPceFKG9la30Anz
         Vs6w==
X-Forwarded-Encrypted: i=1; AJvYcCVxhxzhw/PTemprkBAJKiUDHnH9KLEy5C1QEAsUM/ANBPWBaXA2qECEYPEBMD9PU4tfAhDU0vcT54GMQuM6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8/AIemuGXuuUHodYVkJz6q2WX2x4VKKC0iuoG+lkDA+MsBQXo
	Ttac60kx2OmVdzQpFVyp6VWxgBs/W9FJyz/VurPMbDQjuJs3n4HArmz7GXAKn/2nVWOtB5hfTzN
	B79zbZ1f3ycmyzQsEMc+/g+54CyC/BnXtumt6aGoSX9FKuQjCt4xeDv2Rd9CkuUfYZCNd
X-Gm-Gg: AZuq6aIZFSnHDh1Vwauh9A37KFeW1Nl6UVLhKqx6UNtoIh7a/5qYzmXfltO7ABFngxJ
	qapWqW7lIyb098xs0lGR5MAzEw2MJ5A0drRyZMHNlwuyulgKuih0x7+XMASGfy93dsmVXIz+xC3
	IpyWBgTRo8WbRL8GPuPo6ZE1+rEwxLv6YYR1NDYWPLLN6+uxOB0IfgrHwg2XPG4ZsTv2zWmP3AQ
	S8fZx/XlVbIJmubO/+FkdlRK0p+MsvVkHzQCHRL7HgPwdsgnQzg6NZY8BYySnFpVSfZ8O+VXGWb
	wPMThTd9w79H6h5DtcfE8QdaOJ9INkxa75ba5J6R7cZCsAImuSdLTzkNSoGaepz0B4A3HE5IAym
	1U4cMP58D1gMntSYyzKJ3c0WkX2eni4CMob1XnC2kBBOhBoQz0bn19tOAocJzJ6GkZooI7dQzXM
	ND
X-Received: by 2002:a05:6a00:2997:b0:822:f928:fd97 with SMTP id d2e1a72fcca58-823411fac55mr2933151b3a.22.1769413712985;
        Sun, 25 Jan 2026 23:48:32 -0800 (PST)
X-Received: by 2002:a05:6a00:2997:b0:822:f928:fd97 with SMTP id d2e1a72fcca58-823411fac55mr2933121b3a.22.1769413712439;
        Sun, 25 Jan 2026 23:48:32 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:32 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v11 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 26 Jan 2026 15:47:52 +0800
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACocd2kC/33NQQrCMBAF0KtI1o5kkrQmrryHuGjTiQa00aQWp
 fTuxqLgQrsZ+B/+m4Elip4S2ywGFqn3yYc2B8Tlgtlj1R4IfJMLJrgoUHAJ1Fb1iaB+dAS27SK
 4EMF29gZFpWqtnXBUG5b3l0jO3yd8t8/56FMX4mP61etX+1YRZ9ReAwdJKJyTKNHgNqS0ut6qk
 w3n8yof9sJ78wUKNQeaDGpdWqVM6ahRf0DkH7HkmZwTkWdSCLPWJC2Wxv0gx3F8AnNwbftuAQA
 A
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
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
        Mike Leach <mike.leach@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=6974;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ZaOprxm+igQlpDv+uMYUMoteyMudp7AZ4eQ5176LnhE=;
 b=jye/Zk9FhM9ELdxLbXwCs8xmSR6p6ima68+VW5m+/hN8cK0Xo0BDuCX+dPL9TMcIGSrecaOJs
 RhxJWOVw/3MDaUXevg/PNhe/hipsy0rsTbHiqdQinzap4B8X8G5TuWP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX4Jq1CcS775iz
 iyTWlD3jWC66li60lSMcsfS5j9b6L2T3ja9Ury3GfJyAGruf+F0Xd/kGKEhJso16JjbZyg2nBjj
 3JYAHI6sedHvLXN7LhN2CWL1gpl8f7DKRTgry9LX0H9HOuO83tS7Youxb/XWhfCzu0PoW+cB6Lr
 /wBw6Rfqtyi5Yf/pZYQdtSDccYetEUSEtst84WRc7VdCU1t7WIqaz0clXiW5XYyTl+MRf40YtKd
 Ct7NuumZm8KwWIJ/vTzRtmYwZ2O+dxsr1XfKDq5K4Sg+WymEux2M4ErFgU/8G8SD884W5FWinAI
 9aYb0WDjvlYYiaBt+fW8EA4WiP2fxnwCt4WKnH+nDtPMoFJGHC39S2iS/2adLDMV/V3XIszfLOQ
 GswU7XCAMJ1S04zDHY7AMfDlMFOtkp/p52EIceCPtpxRL9ZifTDDSxO+pZR+5zg/sP8U1rPiin+
 UB4/Pq/iF6B3HI/GqKQ==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69771c51 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VhXNoj4JT-yUwxqwOhYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -Uk47fYS9tABrciVr_Y_lDglwobcxNU6
X-Proofpoint-GUID: -Uk47fYS9tABrciVr_Y_lDglwobcxNU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90484-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66BC0851D7
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
      coresight: etr: refactor the tmc_etr_get_catu_device function
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 366 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 103 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 144 +++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  38 ++-
 13 files changed, 829 insertions(+), 73 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


