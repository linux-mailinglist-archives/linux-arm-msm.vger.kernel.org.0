Return-Path: <linux-arm-msm+bounces-95071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHtVIMWkpmkTSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:07:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0E1EBA19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8BCC30247D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402B338C2B5;
	Tue,  3 Mar 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI/W+FBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvhKw/cZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD5388E7B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528545; cv=none; b=A9r5hkraxAvKLzHZXY3ttSLx4Ky+uwNVKU30jc8R8UpAYnXri5vGtux8yt6pfNB2N8mToCNbKv84evV47FakmdQblxrrcrrdXUT4C6oshFbDVQWIzeKYcDwUYdZR6b5PQPO7L7Ki0l/ZZhpBps/Zc8j9flq3bGkd3Tj6kyUwPOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528545; c=relaxed/simple;
	bh=nF3allrJaPSurlBTOy+OjL88YEUKbGJ3Wzw9ZYRFU8w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tfPIHo8IFIdkrnKBWH+zzoF5zmGBbdwBsYetYWVkIS4vlraRIRRtCw9J1KkIJHxhh3s7RFF2gwSyaJ2iCKX3C1GBO1ocIytoe/4k/qbgaRPgjpv7i/3jUhaZ/mKxEPK8rzSmm9kuF0V9xDYH6I0QZuls2uM0dzEBXhPFRVxCxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI/W+FBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvhKw/cZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236KVrv1675548
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 09:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x9stiGj0JIZWulRxQkg2eU
	PltuECBDP0mhJ66zEg6Kw=; b=XI/W+FBkv+gkS52+OMQ1NsihkMKe14F2OJLlJK
	ylY4EC5jMGceRtr6ulr0rSMS3xT+eMosVCNvvCYZ+zQjwxgQrbWbFUG6wklgVArV
	4338jO2z1k6fgKOGMXi71GVUc+8t0i0499DmfaZljVyptp9wVuAXgj9VDcub1JdL
	Nokdv9Jaq1cklzMqGSJE6nJwkP3gCeAjFqnv3FDEzNLn6brFLDxLwE8dvII/LL2R
	7afxiL4vRp6AVNysqP7pqe8C+BhB4GkEl19Zs9LP2yEM11d30iRmzLSmtSlnhVoa
	oTncC3ASOj8vcflMec9+OtZa4ITT/uzfItOWkWOp76TtLoBg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsa3ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 09:02:23 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-463a1cee56aso55431091b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772528542; x=1773133342; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9stiGj0JIZWulRxQkg2eUPltuECBDP0mhJ66zEg6Kw=;
        b=fvhKw/cZaEdqiydBjbk9WT86fqXHNpn6dmq1tYfam/f2IAJaat6S/FWWwAAkxJ1dyu
         SZlkigavo+vu/KV4Wbg6EfqzdNqw6SLMl0f7ksxiMyvUfirgvVHbq6TSnalQ775MspcQ
         a2i/fQ16e1neW73G2pvEGL9l9FfnB9Wt7mbqN3r5ow/kVaNByGDoN2Aa+O7p5XnNHthf
         phjQ5qE4dMxWLohxl0EKG26zBr2/9fNJGuX+6OlAO1CIazCoQB3SCRAv6jvRu8zHJbXT
         KJ/3RjZGPol81cJtqfUnMRvanb/jfqlhoU1vJqZRNZBV67wA2fu5INa2ZGMxPTRYBm3/
         3Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528542; x=1773133342;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9stiGj0JIZWulRxQkg2eUPltuECBDP0mhJ66zEg6Kw=;
        b=sSlChXPCqgyvXLfnJYZtwUlO7TwPSeuRYWiQdwzvbczs34e+t7TWmudJXLUNVYH1OZ
         rzDtHUPXlpB7Iq74tGlygWOV5rSgnWGMkAGH2dbBC2SnwjGwDj290+nNfDZgodqtui2A
         ENjubZMC/raLD8FbSXurVkEHz7gEr5zz5gm+8cZv09OE8JnhPX2B6jqauo/zfHs39mq4
         1rxLPGkpHGKTbEEaxaHpCof5O6uZEuEEp+xz0tqm1qyBXLqeGJ2KUwKdGeIvZFdUCWpz
         TK8NT4JYQLhIjXRoBejr62giuctpLMVc8VWKJrAp6nwkp8DUx3fJMiq0iXIois9gn3fW
         HH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXSe3E3l4qXe4JxXKJrdhr7W13Jxs1JAr3YvdbykOUSkGgXkKnzyh75rWQQydMSofLW6lKFCSWUNra5O4O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vqvxmGAKK3V8FnGXsUu2gr0dfmPtMcLi5N6+Gp5YArbd0LGE
	EXD7EYaeZF+ep0d7zJoV/nsS7e0K53JZ1psro/wk3qz9WYq2N9cmfqjj+t3RITzrxUMHRCkn/uu
	LZCSCXkfeEquqOIR4uAW/Q7LArrkoWDkRwvROsCILBaE9BNUDHksbqdYOWWQqBwqgd68M
X-Gm-Gg: ATEYQzzl8b9xvzo2EjNY4FNiTKATFOR4FF3pISgB1eGAGLBSfYy0v2YjFi0eTlbzuj6
	5TAznpCP03Rh/eo5N9TqkywvpGHcMGSrgCimuvF1VH4dar+K+t1oZ4a7U0NRmySytLkgo4UBwZs
	8Uv3bntKxHguKCifQ+WeL7dOW+luaPTLgnIVb2r0v+aweys6v536G54ZO5l4dkLsrkPXFzrYZ51
	EanRmJMQHHzzqD51uQXMLikfHrU5AZPmNE0u1E3BDOhe0aNJGZzPA5KuHqDYd9H4RSFcevuyXVh
	mCEgxDg39c9XM1+FIr03bjli10DcIRAgWeTkImy+bfq5cDh1h8eD8fYM6owFaA1MLVySEGf59Wb
	KAicjFywma2WpctrDM7xryO+hb+pcTWq+LpOoF2LBp4GzGZEkbGLsZssYvWAJ4YeqYsUT
X-Received: by 2002:a05:6808:1184:b0:463:c56f:a45b with SMTP id 5614622812f47-464beb27715mr8785051b6e.28.1772528542491;
        Tue, 03 Mar 2026 01:02:22 -0800 (PST)
X-Received: by 2002:a05:6808:1184:b0:463:c56f:a45b with SMTP id 5614622812f47-464beb27715mr8785030b6e.28.1772528541987;
        Tue, 03 Mar 2026 01:02:21 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb604f5esm9288908b6e.18.2026.03.03.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:02:21 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] bus: mhi: host: pci_generic: Improve boot
 performance and cleanup
Date: Tue, 03 Mar 2026 01:02:12 -0800
Message-Id: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJSjpmkC/x3MSwqAIBRG4a3EHSeoRWRbiYiyv7oTDYUehHtPG
 n6Dc16KCIxIXfFSwMmRvcvQZUF2n9wGwUs2aakbWclKzLWY4uPsePgLYfROGGWUhUELDcrdEbD
 y/T/7IaUPn+jb3mMAAAA=
X-Change-ID: 20260303-b4-async_power_on-9191ce9e8e2e
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772528541; l=1196;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=nF3allrJaPSurlBTOy+OjL88YEUKbGJ3Wzw9ZYRFU8w=;
 b=pFY9kEsq7rZvI/+O4GGwk6J5ndc3+jp7rMLnCJ738IcFGO9wVwMms9VXx7kt4K6ytaABbCcUH
 N+wM4jRxFyLCgEYE6MFkBoLjS9IXHgpWw/X4lhSj59h3wfP/7ndjq0o
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: sTWERJD8gpAeZFd_CTIxCVWqnH5_sNBL
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6a39f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xtHKfOcq51I26jS6Dc4A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: sTWERJD8gpAeZFd_CTIxCVWqnH5_sNBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2NiBTYWx0ZWRfXzgosQo1J54Kn
 yEEX0nXql0utP9wI1VQ94BHb5OjrY+8CI9d2Y9ji9ooqIQCvrKv0pzClcsXwQGwIgw/EVthQn45
 GoOM4puym7VXe6k5YQV2KuN4J1u0w0ndjvOtOVMVjZuuPHHsT5ExxkLUumNUQiDwlVNP5jprcw6
 CcC+WRMI7pKGJOENeB39M2arvHL5S9PvzZRfVv+H4oErQdYAVK/LnGMefElza3XX2pH+5fz6bTH
 8HC5RI/bzUtEF8LCiIYNbL4MsnkYv6377zrAregFGsDWzWry0UKMMmYCBIO/GJeVHVfLEmyFMPm
 Ds0VjZZ2ZrKq2sxAVJAtOElHEulM4JnmYypS5W0O7oWN28jj4JuZWtL1VVI2SJSuSqj2beOWCwS
 oB7McbnyhzpuzbhcFR+vch0vrDQSMYyBLYuQF6B1PMCMkz2fRPibvr+BwmxmsG8KpzbjJwtYzjl
 Czpfs1ynFJJCu9Pp/dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030066
X-Rspamd-Queue-Id: D8D0E1EBA19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95071-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series addresses boot performance issues with MHI PCI generic driver
and adds proper cleanup in the remove path.

Some modems like SDX75 take up to 20 seconds to initialize, which blocks
system boot while waiting for them to reach mission mode. The first patch
switches to async power up so the driver can return immediately and let
initialization happen in the background.

The second patch adds the missing pm_runtime_forbid() call in remove to
balance the pm_runtime_allow() from probe.

Changes in v2:
- Make a separated patch for pm_runtime_forbid in remove callback.
- Link to v1: https://lore.kernel.org/r/20260122-mhi_async_probe-v1-1-b5cb2a3629d0@oss.qualcomm.com

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (2):
      bus: mhi: host: pci_generic: Switch to async power up to avoid boot delays
      bus: mhi: host: pci_generic: Add pm_runtime_forbid() in remove callback

 drivers/bus/mhi/host/pci_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 6a7084102bb9659f699005c420eb59eade6d3b4f
change-id: 20260303-b4-async_power_on-9191ce9e8e2e

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


