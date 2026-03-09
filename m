Return-Path: <linux-arm-msm+bounces-96176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OlCCG6XrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:48:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5962367A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5108C301DED5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EEB37B3EB;
	Mon,  9 Mar 2026 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zf6bgdf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZu6+L2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF8B37C0F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049699; cv=none; b=Vy7M/YkZGk674NWZisaDPDmWNVEG0p4VLh/PHHsWABSEokj4kDTmbk8dNL94ZMrOo5JfPFTwXkawOU9I+TC0dBtiSnZxykVZgQXEEyjOzSzJ/QwK6YuKuBuRW8QjeoA9YEb3vT4Xc2S3AfIRrGLmmX6q6OPQdO7sKjnNpdN0t+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049699; c=relaxed/simple;
	bh=Ur9ZbyPYZ2bHLgztSEXn2DrTgZoj3F8nnYaNdGKTF2k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uX7t7Rtn5AsoT9csWhPlqZ1shJZ1PQ38S+3rjOrmAq84YZ4wmyzcL+why06aTHPhK6MbY+rXLVmnd9YBAxP8eQRRrC4XCsLAhBE3AoXyyI40I6LPSWYY3Zxi5aCIPjDi1XGs4sEl+lxN0uM7rwkK+pa8SuqiKYwczvWJCXU85cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zf6bgdf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZu6+L2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297xDeK200749
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8MyYHMdqwx9jeWh2ZShYll
	z65zXkXeQo7KoCbCSjLgk=; b=Zf6bgdf3oVn9Xt4tVXKbWt/E97HHvSTcTxfBsY
	nk6CAoHXIqfAr+EURaRzwd0QoEudjScvjeB15wwkhhR+EPkP2Pa3xXJrLE2zqWvW
	ioFS9AO9xOQfv2pO0Wirjbyao4kN3EzHk3EPoTMal8+Z9Ie6yu92Od1pheh88dqg
	+PtRu0KtNBd2jC3SXEAu6v3vF0CtuzjYXm07ZEdO+PB90kHgTO3JhVMllPvBR23v
	JdiXcjnvRInZuOnWHTYU6kEXdN5GaAloo6bClSzy0UMhOTC6/NmznKc09TTAkYOG
	MGyQe3WoSgzrSuY7YSc4K9A230RXAJsdiXxkl3hIzD5WqtBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vctxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:48:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4f27033cso80707965ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049693; x=1773654493; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8MyYHMdqwx9jeWh2ZShYllz65zXkXeQo7KoCbCSjLgk=;
        b=MZu6+L2qzALq5+PU7ec5gXg5opIwjSpM/8fAUPy+WJGdXSoleW+XRbHhpwdMBAfjtP
         QjC6BL3m4ruj6UGXiodn09J/vIHcUf3kQTazQIRSpUMsuqUlDgbaSIBHInnFndBMZADX
         JDtOnNxT+hDCTTE3GkTR+HMzjY8hOHBsqyBJ4h8ZeQoD39xWUmwm9PAFvZ64hefBOnby
         7svx3/rhHvZSOYwS/VCvqYPZHjrCtjrhk2f9z32+ZET0TKMYSe2MPjnNkPjwWPtlMHal
         7XSdhOhQSTraKZpuZ/5dpAJai4C0mTPn0Idlyhs9eHl/JAAdeRXAPDFAUXh70NsJk93+
         8Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049693; x=1773654493;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MyYHMdqwx9jeWh2ZShYllz65zXkXeQo7KoCbCSjLgk=;
        b=G4kKhuoXLlMUYRxSzd4Btjx+rhdpE8SZQt1XZFn/NVwcsCiA9oegPtPvpjmeholXoL
         wqlGpAQF/Nq/OoQZyi9Ex1B9keGlEifd0nWNgP6iBrae6eg+P77qoEjHYhUxTeZe8HRZ
         ASGm7+n1B87h0QtZtkFNiPlLvCTYm2pxL1EvIqsAXY7jfLnGkGYKQlu49SU7VT+nDGUw
         8YDwV3wBGs4h6GvgMRD0rhiNV7btd43vfU2XqLGWFGUE1vbddQrs8iyoWGe/O5pqd0jX
         0zo+l3hm6kboiC1k7m2JOofAZZSyJOGUDkIGyndmjgvn4e+p2a9dYW53u9HtteQ9nYVJ
         wbng==
X-Forwarded-Encrypted: i=1; AJvYcCVwanLB5ELOy4+xPPRHy8oM57izETDxaPpkE3iN1vrpgkgtJgz08IH6pmxTckZe3TvvjK19Fj8aG8LERiWD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ebACcNvVkWxvuqLxaxUb3PMr01EdRuZ5hH9KiG9fVNsIatR7
	saW0OjlM0/duGJQ6dnj6jJmAlfoVw4YX5/B3DzOHtxnv5DX7b3FTQYv0eJOFHNNlB7JrBXx+F1D
	jatn3pKFIDEwl1HoQE6xRzCkoId1KpwA3lRqcwmWpTAM7KsRwERDxvKyGp4jWfVzMM9YT
X-Gm-Gg: ATEYQzzIHpgUDCc0LdpQyBphBCWsoQfaTDRgtYjlpOOrc5VGRsjy1Xi+1JBMwS1IvFD
	iM1UGxV8IGQ+ape9lmhyB3wI22x+evp+rNyDS9MkhBBbh9oM9aEGRDILH8DYBnEMOx7rkogCfyJ
	D9R76PFJo3cMnP1FMKMsY7mk3nm3aqxJ6a9uKtRDkswrtoifm5CBZ9l4AVNRauEla53iBB/HBlK
	s/Ge+WDqkEqvSf7Ck2++qsvH+2Zrbhgn3cPXzGsHQycOG4Bb/XDBROBjww2KPO+uvzYDQwoiwgh
	Ib+cxozuIwsifquapZyGL/Fnb5bn4LfQWz+/SekPJiUBx4GK8f0x/1i1xOnaaT+AhZYKBnMURan
	+6u2tUTHeqRodj1ULOFAdpYOsCbWvIKMXmQTJFl8GfhqhL157al30DXx32rs4I/gvH4DmqMGpbD
	R0S8C9tF7p
X-Received: by 2002:a17:902:ebc2:b0:2ae:3bb2:a8c0 with SMTP id d9443c01a7336-2ae82476ea9mr125506035ad.44.1773049693103;
        Mon, 09 Mar 2026 02:48:13 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2ae:3bb2:a8c0 with SMTP id d9443c01a7336-2ae82476ea9mr125505785ad.44.1773049692574;
        Mon, 09 Mar 2026 02:48:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:12 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v14 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 09 Mar 2026 17:47:39 +0800
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD2XrmkC/x2MwQrCMBAFf6Xs2YW0ltj6K+KhSd/qgqSyiaKU/
 ntDjzMws1KGKTJdm5UMX826pAptf2ooPqf0AOtcBXWu8+7sRkaawgsc/gUcUzGWxTiW+GGRwcO
 34xAuQrV/G0R/x/x237YdXc7UL2wAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049686; l=8337;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Ur9ZbyPYZ2bHLgztSEXn2DrTgZoj3F8nnYaNdGKTF2k=;
 b=qsKO26xH6T+Lk6enl3J9EbOeQKZfLln7TdLRKYWMlkWRP1fpdGh+qN8L9y+fn/b80tkw6eL1d
 tElv/SZHuWHAe5hB9w19w9jMUvoLAZwpZCpJ7sTTwVuq/QGS508T/iY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 3lvTD4jtlAyrtjHAebUylvJzwf8auu-1
X-Proofpoint-GUID: 3lvTD4jtlAyrtjHAebUylvJzwf8auu-1
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae975e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=6IPhZ7wLu3BbSa2q1HkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX0w2D3tZtfstr
 Cjq19fjspzn5kNVKFZxDbOvqV2wX2eO7JHEJactQiGQFiMmT/U//u2Z0VpQ7D2Apx7KPgI6EyZW
 HZYLxWnEPiF2iWKD7U5QSbdRuGawv80Ygo6aFc4zdSsSj9iHmZaPHiViC3h1QwUHGOQvi4fB9bP
 6gQdtUsw2k9eLuEptvEUjEmqXafNNBjNgVGYMFT6Wjm0vXLe+9XO2Ev3wnkyD6pge3JonSHJC58
 QU8OmtMQRAaQytZPbifzYPJCvyYi6oZ1JaYRiENzNSsR8YSY662TB0oMmZ3xx8j9vfgs9v9UYMo
 fyu42PnyKDcen6bsBDw3KCZ3/v9UZfikDu/EFxWFFdGgQPRr4j7pn2CNU4RcsFUso7KU3eQagv0
 Ada55ieDkadB3/71ArjfWAxpDTZHAsZ/jQeBhQx6pzllSJP7NxpR9ZT6kDsinAs+mI+yRMa0Mv7
 osZIbMjE63PUvSe9rfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-Rspamd-Queue-Id: AE5962367A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96176-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
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
Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

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
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (7):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  58 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 136 ++++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  37 +++
 12 files changed, 768 insertions(+), 61 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


