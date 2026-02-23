Return-Path: <linux-arm-msm+bounces-93577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PL4N3b3m2mp+QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:45:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D71724A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCDA83017254
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101AE34887B;
	Mon, 23 Feb 2026 06:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDEZEP23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhJXvpMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E386347BC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829107; cv=none; b=H/zrzzc8m+pIP7jvWT2zfbiB+q9uLnqoYCAYv3LSwmi1tkEL/GJFWgbHebmoAO4QB7WT60ralEDffNi7JaqXcFqiquZDREz0EIS0VLivIf6LK3OqmGXnaDv/UbIxognMrbCIBU5MKt+E9TmaywY+qhmidgMMdfOQ/bTP1T+ZhHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829107; c=relaxed/simple;
	bh=mkDR4OeLT5TKDRiAp9do8VKz/w5SpnyLF1bhRCG3lOA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ay39ystg+ZhR/D1p4342wWj/w5E/SU7H5jASIbHvMda0q4Ebtge1eLbVWvSE+K4MUHnuqyt2EubwCaFmShaDse1d5CVZ/HndWuJTf7ehCvP6qbVE32hzxm/bwLGRw9JSy92WUftwDSgA7apnnmKssFOYE+6uvPDdBW7vsyq6K4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDEZEP23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhJXvpMa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMNgT32211942
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I08651udBny38XHqapXkmx
	5xZpxZ7PFZzX6KyGr7ROk=; b=hDEZEP23cXRoKOQLlgy3pIXYB7CJuo0jXAb+6o
	VKqQAM6cHjPbd4IJoBFUQjQwjEW0iOuz0m6HoUUYW+pPc1LA65CDOTO5eRx9lkgD
	5tdMltiJLm65Gprs+LrLPmQsea83fcJWcQfPlNPdOKjKpPZcFMlkiCBDg7TuvAyc
	2izHjeh0DuG3nADoFNjOZqutXybUi5xlxO46qzH9eE2kPLQTbFsHtcxk+UMAgxEs
	Dp+o9PonbNswM5cHlLkU8hbR0a+HNIsNCZmi5b4Mzhi15She9roIBPwhEgz4G0gs
	OQqkaMT8MIMnRiZQPaAqVHRmwS9fDErjRIB7GHxccY0pajJA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3un9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824f7591956so16710587b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829103; x=1772433903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I08651udBny38XHqapXkmx5xZpxZ7PFZzX6KyGr7ROk=;
        b=BhJXvpMac61ZPKq1ceNAIrAdGuldRJ8hiWV8i6eGyB3GjXa1QI5lJdLSeKBTqjdUeI
         fNXEpbbd9BGBgMsv0kkuzH8mZeAIzOoUCYCeJqAq77BKZvWc0NnDvRbcMWQoUoj8qtm2
         ACZMeW4uF/DrMhfY5g3JlMHmo9GbA/5O2IPncwwWM0frBFXWAhJj4jZEPNEFzNAvvWAy
         Q1MTGsOn/MSCyT/lEQa0OTbHB8L5ipgFenuDhJXQsOigMrxa9GDLAWokfkOx+WlPeiL5
         Fcor+BqvAP5WCiu6bMM3ibo+H55wppI+8vERggdBbB5e7HOxRw3l4vCcaE1YmzOkbNsr
         rdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829103; x=1772433903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I08651udBny38XHqapXkmx5xZpxZ7PFZzX6KyGr7ROk=;
        b=jtdgS8djfumq/g89Z4muB/TQuaTvrOu/ALFxQIXAQcSEInIpZf/UlPG+csfw5sjBxn
         lLG+KY8c1DwW1POoXOvX/QbCkCn21e8+BFHHegaY72FvTA5BXie47Y32/lLW1rbj0qaQ
         FfSTRIKRiQjCyxLaDAPx8cYTjdBKz5mPzt1VW/bF7jN1b5/+XtRu84SLFQ+mI/K9iGz5
         5fOPMxaco3BlV8N3tTSWL2fGxjYkdGuh4VLLWEzL+rLadD3vYP70zTJNPL4LEyq2RJ/j
         2G+ISvLbLGDAzz542wh72Tl4xqPQL7k2xzUUHA+zAXqwz4NUD6f84f00WsdtwbaPtGy1
         hj0w==
X-Forwarded-Encrypted: i=1; AJvYcCUkfN5QE2KQb/zhBBoSrf+Ya8Pug06HqlMrl8vrxJaXfLmSO4EkWYF0Ccb5jL8hTAw4oce4nRBmrwm72+XU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd0Y2TsspQNbAWKHCTSuvGj9jNs1k6GSxSkNIPEcLlHzdeJPnN
	gymSFvlO1/UTOoPWOirRIDUvzD8Ox07mNSgR39jjhYWVgIP2qUvngGKVfwmgoeU5K15UU6dOLO7
	GLn/ZxYBqA8mPY0PwMCPCCLo1qG24aF39mGRARWSIdpZjTugrxespyuDCVgNOkzGSqEt7
X-Gm-Gg: AZuq6aIFgu75O6p/0ZAjptAWHo0EkZtu77tpMvrJEmiCHwaUzpGHZ6VPSxx5PRbQmeX
	sxhqhb5FbEJ2Kb+KiZ2s/qaJg9dKfHgadsjI10mSaXj5KYgea6wudg5sqnjZC63bgyV5A2+ysWG
	NDSYwfHiEpubZPYRN3hjYbl8hhXo0HMGSGVrGkTG2G8PuU4Aep9OLmobRzSbWSWWTkObSdSBGit
	f4dvPkqGlOZ3Oy0EPkhal4POqjrhGPQ2iAVEG8h6KP/lAu//HGhuVdnQludADR4y//yy7AMRGVH
	vM42u0AhQA5SJvXneAHGtKch6RVkjahdvuZwzmlfXWtEF3Hq3lA5kppzLSxPHomx+XqmdaJxNAw
	tpvvEeYgbgyL/MK6OXlCCHpdlyKgQ+z6spcoaghfZN6b0XkdmJ1S599hVg0Li3/wcGZLBTFtpWV
	RdcVCu59xBh9rP
X-Received: by 2002:a05:6a00:bc8b:b0:81b:1a87:9eb9 with SMTP id d2e1a72fcca58-826da9073a8mr5972230b3a.25.1771829102774;
        Sun, 22 Feb 2026 22:45:02 -0800 (PST)
X-Received: by 2002:a05:6a00:bc8b:b0:81b:1a87:9eb9 with SMTP id d2e1a72fcca58-826da9073a8mr5972210b3a.25.1771829102207;
        Sun, 22 Feb 2026 22:45:02 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/8] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Mon, 23 Feb 2026 14:44:36 +0800
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFX3m2kC/x3MQQ6CMBBG4auQWTsJFEPFqxgW7fijk5hipoVoC
 He3cfkt3tspwxSZrs1Ohk2zLqmiOzUkz5AeYL1Xk2vd0DrXM1KIL3D8FrCkYjwvxlJk5VHgzxc
 f++AHqv3bMOvn/75Nx/EDib4BamsAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829095; l=8063;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=mkDR4OeLT5TKDRiAp9do8VKz/w5SpnyLF1bhRCG3lOA=;
 b=XlJvCLjWqFipgD9uc+l5qcQiKNmSCCj2B/iU/SKutBb1rj01hmRjeUgUHDG2hqHayFSMTl8Ot
 tmwIZIFMxUqB3cu9hJFfalywqQy3HDLamANV7SX6dDnLOKCf7NdIr0E
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699bf770 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=3NKmYVG5dUn0lDVUWD4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: TuOxjfGqo6IyspUI41BzRKYGztn-Gz_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfXxnxaRduiDnKr
 cbpkXzBEr/bJgbhoNW8+Mma8twf9XLqG4urONyJKNFKrcsV8+KN9oKqx3ksiRyJXj/H7h/UqAHD
 HwvQ4yLostnKAmZN9PFSwrxs6khqxfQ08eMTKPDQTx8NLq2Kw+ffXSeBK16XIy91YViJ6I3+3Oi
 h1mdkow/fqD8F+jMUtd3sj/1y7Q3ecReV5+Ivh0rIW4pqoCUEX3auEGRQAynDZLqoa+Id0BEBG9
 wnyUK3dQuNZsEhUdOVzlqeFEr2dxZFLIXE3jE509Q7H3ui17x1Q63gk+pWW/5VA1VOE38iW0cCg
 8WiDlMPiBtzEjQ1ycJ97icUw2z9OsgVonzC6wfnGhsxta7PPW8UbOypc3vCCX1aU7fLzpetW2Xb
 eUOW3UtlkCJZhAogTaSIlyER+QeNGxlq0LLh4uFiBxTZhV/rItJp+gbgnzfTZcr1azWaKcfKXwn
 QNzNR5JadHCWJjaoczA==
X-Proofpoint-GUID: TuOxjfGqo6IyspUI41BzRKYGztn-Gz_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
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
	TAGGED_FROM(0.00)[bounces-93577-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 640D71724A2
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

---
Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

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

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <Mike.Leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
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
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 367 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 103 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 136 ++++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  36 ++
 12 files changed, 830 insertions(+), 60 deletions(-)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-enable-byte-cntr-for-ctcu-9ce7487b3a76

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


