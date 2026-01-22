Return-Path: <linux-arm-msm+bounces-90100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG7fAaOHcWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:12:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21560C19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A29A3C379B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3096035EDBE;
	Thu, 22 Jan 2026 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyfHjI1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNhGPYDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3AA362133
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047726; cv=none; b=mD64E0a6IN6Xsla+s+q3PO4AVgsDbvJ9yn+VoV7X3JwOBabnNDVq3EXmH3z8/VFxi+e+QOOL1MDtKqTZPDr/aWU+w2++Jy3fzLAfILZTYlm0FstT7+G/WfICklXqDY3DhdcP3YmJVJbkTGRrpL3XyFb4eL7mVMYcy+m+vRvSpig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047726; c=relaxed/simple;
	bh=wsPMFRTGVtujrwEckG9FwibRpPp8G9fD/l0bRmCc/xo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oZXvMBXlkZLuqJBXl1ZtjvZ6a8IwhB8iaCg6J2ggtGZavbFWV0nan7ZURdWzPC1vs+5ResSfyq08Mt63nF3dCMDhpTSLoM9yxhQgqKOtDp1lOkYUClCEL4zHx1BOi297Hz5tSpN04puPOAYCD+ZWT8OvZpiFynkoobSMAc9uVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyfHjI1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNhGPYDh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMUBx34057304
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w6PObcjwIg/Fosc91JX07i
	vYl/s0K1Jex2A4JyQ5NLk=; b=OyfHjI1IU/5DBhyr6u+2+uFo/r/tB5mGP6CSda
	/VbVCMO0ExMfmx48FAVklooV7MYgox1e0V9zxpfpHUi/9E6aONKJG4SthRW5D4nv
	e5wwgoT0j81apwPWsp69OJmGciVuoFbjqbfW7RXaFuFymeN6XSC5ogZY2gJ3mAas
	xZ+5B+LNprQy+oeUj7PKGhCbMfokBESQ0cZllZ8ggkoHy7Lt8G2apLBTx8ZzEcjm
	dTkywbZ0VzTRvvVX9QLRoPn6q5MKpylUv4nGpl+2WEbc3SG5O03TAuTYvqTQo7no
	hfbRkM2/R+Qboe6wkzU70xQxcuJ+yFWo8uTbV4p37tYXx9BQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbrg7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:08:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2381ea85so10523545ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047722; x=1769652522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6PObcjwIg/Fosc91JX07ivYl/s0K1Jex2A4JyQ5NLk=;
        b=WNhGPYDh6rQ2xtI+pmXTkg0+xYWcY8oWZFDLmqSmndb8tQUdjYL13oDfxl4gyuPPia
         VssGRdZ0VafQGwi5i4ZmIVKlySP2SK6QetnkqKAKphOZ8w04SnvGMo9JJrregptkZPzG
         bnRqCFW84bMAahEO3PVTcbamGwI4JnMCU/1wl+Y4FxRbttFqlRWcNb7CBbZhGf24cXUE
         mRrtbBh2A0mcRtj+3beA7e52E2zeOOTLQ/KjKDml0DWhlRCRYJ7js3+VP1HeI2RBSb+L
         5QVwNWVMsnxuSy2hxdATP5Di5RglZGd3k6VpUjfsl2/23t2JKrkJzoFtmKvxYi5B6r1U
         BAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047722; x=1769652522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6PObcjwIg/Fosc91JX07ivYl/s0K1Jex2A4JyQ5NLk=;
        b=dU7RboWmlL2vBH8OCEHpW4hNgq/26mB6YWJgJW7RVpljwfNajqksvUk+aSbtgEFjUe
         xlZMPQRZf9oKoR9IlBT4sLwUaqGzQaEzAyHOtrXzThmmazzrrzC8p2mB8ZOs3K3JrP0e
         9j9mE5bLvgLS7hT6UssKi9HN0r375X5mtAhQG7j95kjZYKmMFY9FBw18wo78a7pyjjH7
         5kj+H5nbHbTZDIFbRdZYoI4srqaE/OIwRNcqgyVJem/GdYTDbyDKk/05IJIg+hd/PZgW
         glCxcnUvbBxyOEJiuLYfNbuG1CMN840hKxmSLbdOPd4oNu0zHAjLHwWGXK3+zL/r6BZD
         6BNg==
X-Forwarded-Encrypted: i=1; AJvYcCVbLUjcUinBxyp7E/n7nOmdOAjRlU9fra2/vSX+7CYJWFyacPVzD8phO5wKLyRe+1c/0hLsHeBz9OCdhEX6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SGfdk3gd+OlyjWliatMmmoThiKkH7rwbi5ksmiIRG/+d27m/
	0C1vGFBvXZ9/CO+Ceu870w82ejzEW+UFuPpOAcqCfpK9UgzsLiCPT5vaWpxN7hC7RV8jo9Eu3/g
	g7R55yfhaHY7BeMWJA/4+hRarkfgGKM8Dq+3P/Z7roqlRlsb3JZmKaiiNxvXExSNE45Em
X-Gm-Gg: AZuq6aIXuqe6d+izYdLpWvyB8udgiGQmeH6qk2NzGaXoJruKsOAZq7asHyS/FNLzGf+
	dYxZQQpIquKen++bmSv1AHXcYmy+SstHdeKQj4x11av2+p1dGSXs8hn12ZqthIk5Ea+WzD1Vyg6
	1V6fnVbvO9PWi2PQbOKUMYNXdJtfjnEsFR6p17gGgUhc8VVLmyhHKIqlcpoXe9waufI6GOggfQE
	mZpwzWhROoeA+v2+fxLr4lL9UhO9I+J6DYRpKS3I7lWi64Xo4KksXJTnaLzWqzuJKfWN8Gf3BUG
	JtWF8oHWBXC+cvgzw2CMrgBOwWp5ogiMiNgsHxv9rp/ZAXXGB1OFdroz1/XljUXrZo9hG+Kc2lo
	/hsomIm2TUBuzOCA2vylW7qE4AMTHvsXNB6ZEorjCqQXbNypjtCFTRvyTlUMmB8c3hmJ9bolH
X-Received: by 2002:a17:902:d4c7:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a718894b9fmr176740685ad.23.1769047721852;
        Wed, 21 Jan 2026 18:08:41 -0800 (PST)
X-Received: by 2002:a17:902:d4c7:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a718894b9fmr176740265ad.23.1769047721212;
        Wed, 21 Jan 2026 18:08:41 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:08:40 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v10 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Thu, 22 Jan 2026 10:08:13 +0800
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6GcWkC/33NTQqDMBAF4KuUrDtifpSkq96jdKFxUgNq2kRDR
 bx7o3TRRXEz8B68bxYS0FsM5HJaiMdog3VDCjQ/n4huq+GBYJtUEJazgrKcAw5V3SHU84igh9G
 DcR70qCcoKlFLaZjBWpG0f3o09r3jt3vKrQ2j8/P+K8qt/aqUHqhRQg4cKTOGU04VvboQstdUd
 dr1fZYO2fCofkAmjkCVQClLLYQqDTbiD7iu6wfn3lWgGwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047714; l=6693;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wsPMFRTGVtujrwEckG9FwibRpPp8G9fD/l0bRmCc/xo=;
 b=RW2TC1pv1lh0GmYuJa7Ycm5bYI0F9NlbbS+/OvQpzyn9KNe9HymW/na/+8SXRCzCPVoxTwZU/
 7IVYkXRqlhKDO60lFuBBWd91Vo4kFejtBz0btjJk31vXUaFM6PzZqkG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: ofqhx8sXg6K-LVAkTQLWcGTPJ5Uycd8s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfXwfcDfR3SV1ev
 mj5qlUoyMWOd8yD4x7mU+VZV7lnuMBSmnrCjnO1xfWvf/A+kTH0taS9F3XoVGyNbNKSNKG4lHpZ
 Sp89WGkl9uBv9Kxo46Wk35GjeK7tO4lq8kr0P2KmuIwuZBp1X/LG7HSEw69YBmt6JVoRwxN714v
 0XiAjiKJaqD2ASxPlEuZu5kHw6SpB264NASYvhdpO51huKC4VflAnjFBhumnbseC2NGYQkXeYcC
 b0u3EvvVdXYuPxsgWnXe0fGgeHSwGFhLTYAduN/n0BSgdiVDgpCKnzSRdfgVKvXKCuLGUoPTFtM
 ZfcSLNyFtNRJ+CjE+KRLjFq+oXHd612owS71vg1sr0NJeMe3k8LMl3Z6jlUDvXGSSUcs1ovW6Pi
 D6rzvDgJNLcnwIxnOLzy2SYGHzTJL3c0PzJ4FQiScEIKBH/PIBZK6WT0nOydYoj/8bSUdnAucEy
 Bc2zYpHqJT1grK+7SkQ==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=697186ab cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VhXNoj4JT-yUwxqwOhYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ofqhx8sXg6K-LVAkTQLWcGTPJ5Uycd8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90100-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF21560C19
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
      coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
      coresight: etr: refactor the tmc_etr_get_catu_device function
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
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
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 144 +++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  40 ++-
 13 files changed, 833 insertions(+), 72 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


