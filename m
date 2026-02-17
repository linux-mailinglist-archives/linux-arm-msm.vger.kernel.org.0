Return-Path: <linux-arm-msm+bounces-93189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBVgE8dvlGk0DwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:40:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B666914CB3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9F1302BDE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DA836AB5B;
	Tue, 17 Feb 2026 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QR6T7LZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUKHStn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCB2356A28
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335544; cv=none; b=ZVic++00yETrNaN58wm9oZAfxLoucA4auVFvjPGVhXfF/pZVdT70nLW3D/kfAfB7n9wSpTLLUT/l6DAftnLB1hmut2+/7CRE53lv7dwh+zuPgZYuWbo0APXrjUeFAHKMRD0ZI5GWYl5x2MdMCq3t5qjU387J+ycj9fI3RL5Xgmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335544; c=relaxed/simple;
	bh=rFqo5/1B8OW4FXE1gAWa3KqljMTcG1/mrFo7ySQzgro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vFiO2ptmcUlABk2YXmgBHvu2wTMXgR5nz/KRahNhZ1wdm0dmCdGlPiX5KG91VigDVUgxkyJChIT4vuVVso/iNFntOhB4JJyUaiVxp446gD82zGsA15u7+yUT0DqkmIa1WUOazyPcRN2HUDWfrpJD1BilygWsjZl5BZe2khhui3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QR6T7LZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUKHStn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8qnhl048727
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wHG/p1ZM90B
	prQCvpdYjx62U8YBuCo5FIk6XXtohUYY=; b=QR6T7LZqmmcJgr4HNw1BqizfsC8
	9y1yW0XDkj9VHdXAQl14kia6aFEt7dG40MlVO1kBiaNVwfh5FC/7hxx6JUgfQ5UA
	VgWUEovq43CYxUeRP2xJq4vO9fofWydydSATunkmu6kNSGaITP8kRgwODKLW2pdr
	XGXv2kHYLmi7yafJLpNlQ7IfB1yHR8QJsXrE+F2aoHtBTeFh8NcdtBvWp1zP3L3i
	Ky7rBCAPnuhdoWkhjOUULTZ2HUqsiUWFXAptb3WhZcClM/Ss79hVT+BONInWgfoj
	BytkNsEf9wN8Ly+9Kkun2n5ILpCe6oNqvvUt4y6NGLvuHsh7+nTDwEQqMEA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82hum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824a02e4d29so1902927b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771335542; x=1771940342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHG/p1ZM90BprQCvpdYjx62U8YBuCo5FIk6XXtohUYY=;
        b=EUKHStn2Crt+e8yBzSUExQDxWe3MFS3D7ElPzbiL5Z1SrxtpLaGHVcsUhD61ZmP/tu
         aN5+649ioLq2pJHm4jViwvvoEMcnxOqz5F9DTtleG2aRPT8KIo5Cnu0PDDsldL6y3xvW
         BzG4DN54Bu0ZwvjwFaHCvqRvoFaT6wdfPuH+J+ixrMHZNRhwR2QjrNrjoAfriCDBXUih
         NE3TL7L31VoaIUJ6usszBuRHDHDw5ae15feg4fHk+74M/ELFIQFcjHx7EMi5uzefWpRq
         E1fOkYxBuJ8+rwIfGhZRFsSgn45EhmXUABx5OhcggVyJpbTLZEvlQEqbputLmQNPxl5k
         5A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335542; x=1771940342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHG/p1ZM90BprQCvpdYjx62U8YBuCo5FIk6XXtohUYY=;
        b=lmPfKeg6Ul9VIfvu/la/HKKwKO3m97mF6OfCjZlLoN7r6bc44cn70l5djICdR8mPI+
         Ck4RL0wp03U9bihXLcN7l5TyEAfDAcNkB1mIAKQfRfO2quboWFTm5DIlBFzpxJCpLJm5
         YzxyVj+vQwwRWcmUFY4nDJW4oBmnZw0qbG6TFQxjmSJczQnyBUbcZxoEj7zTKaN5uEkj
         TjXIuQ84l/MySiNEEWGjMd3mFFpznTVti1Sk4aCipbtctdp2P46LsgIJOlUvZqwFEa+E
         OXv8YQc47f8r1E/QdwBsKRSzl4ww1fFW0ALuRJSyiZxq4ZU7JbmtWgVc0BjnCLqDYHDG
         JI+w==
X-Forwarded-Encrypted: i=1; AJvYcCV2tKPnasjUMlmSN0f+jdL5ERpPSoJhaf1D3O3bYePQn3xJXdphglctjvoshViSRvFn89Wi+TT3gHb51q8Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kw91mVMwcpZ7Qtf9DByDYT/NUg6uGjPVfen8cuQLCr4sz6qa
	/JE1ChJ6h5RCRwathpdYGjv3LxkjGOPa3dTY9hGC9/+g/YEdpu+6x7A/j7f624yU8JFwZ1xTTLc
	Gmz1fvKT2Idj8wBn89vmW6IF3x2ffL1m40AVmJnWuB0PxfyFveVS78aTPcjOXnXej2MxA
X-Gm-Gg: AZuq6aI1pdpuU3ruy8UuKpk02ArQwfETAm1ut66mql26KLaT3TkiunvxSOHijl/tAlB
	kCN1RaY5Tk6Y8EO0jAAsN2gqtFCEqCfGINh9K6foG3J3MGfLMfY/mCOcflLbXcGwjPTBQIEGkbh
	iQ4cBm1xcwJGskflAvl2Y8iCQDySl8lXRfeE7M34t9QYqr5Z0gl4PRU6r4dZUrUYVeg3gKxZoc1
	8pBKVnLuuCRbFpYqOqRzFmvtKyyMpoyVMavvgL12EAH2n08vYFvr5T//hxqhyLkrDs929hUW6cp
	XJd7HFRN8vqmt65b6iAiyO/vak7kC6f2kQUa2tSYA+dvPXBLFIpc3usRSmOtm6EGv8RK7fJiSc3
	sxTwkuIAL3UXsbiQpf9EUKWxpWbjksdsL+hoUURoDVHwftiusW1M5
X-Received: by 2002:a05:6a00:3919:b0:81f:15b2:21ea with SMTP id d2e1a72fcca58-824d95faaedmr9250198b3a.42.1771335542033;
        Tue, 17 Feb 2026 05:39:02 -0800 (PST)
X-Received: by 2002:a05:6a00:3919:b0:81f:15b2:21ea with SMTP id d2e1a72fcca58-824d95faaedmr9250179b3a.42.1771335541524;
        Tue, 17 Feb 2026 05:39:01 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b935c6sm14633207b3a.47.2026.02.17.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:39:01 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
        yang@os.amperecomputing.com, dev.jain@arm.com, ada.coupriediaz@arm.com,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: kprobes: fix XOL preemption window
Date: Tue, 17 Feb 2026 19:08:53 +0530
Message-Id: <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69946f76 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=_07oBJFWSMtGKjIRfaAA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExMCBTYWx0ZWRfXxO83uP+Yeg3G
 3Cg61dwJ8x10KOMt1nPGQAcwS/uc+b2qpuOILa4CKBzSO91JioOIgYZpWUnNgEugJrRHdMv3hgO
 +oCST5I9P1PyMsr/VUYS00eYs40hWU80QtdGRDoELjupvNL+KjZ3MjKhd9cEKYYBruWa+oL0nPC
 /JN+l/phvps2KfYath4tHFdggk+r4rSeq5zH3VAkA94SRmJ85PBYKba5b273NsExK2v01e1eas4
 9u2CPaPl1PVE4b7Jbf0e8oPIhqMl9O+/2YpNDTnTb1KFv4qEWe1uUvYZO/GFLm561vyKQz9nkB6
 NDOzGNW6/TEyziGh1+SyaWDFfD0gtC9rpyDRb5ZJffTQ9FDxMyNYOlmspHQ34G6EsVFDz2mvk5A
 bqJ7p7rFM8Jni78t9Dwx3auSOEJ7tKkgK8+Ec22dylM5a4eOSJAsBbwYAOs/olEnEYjAjY7tsAY
 Xb9F5HwhjXI70DcBhvw==
X-Proofpoint-GUID: qeGD2_qIKDe5NxZfPbCToqr0VKlfxuYp
X-Proofpoint-ORIG-GUID: qeGD2_qIKDe5NxZfPbCToqr0VKlfxuYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93189-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[khaja.khaji@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B666914CB3C
X-Rspamd-Action: no action

Hi Mark,

Thanks for the detailed analysis.

You're right that this is not BTI-specific. The underlying issue is that
XOL execution assumes per-CPU kprobe state remains intact across exception
return, which can be violated if execution is preempted or migrated
during the XOL window.

This v2 series addresses the root cause of kprobe crashes that the
previous BTI workaround addressed only indirectly: disable preemption
across the XOL instruction and re-enable it in the SS-BRK handler. This
ensures the XOL/SS-BRK pair executes on the same CPU and avoids corruption
of per-CPU kprobe state.

Regarding triggering: this was observed with kretprobes during long
stability runs (800+ hours on dwc3 paths), where XOL execution may be
preempted or migrated before the SS-BRK is handled, resulting in
incorrect per-CPU kprobe state.

This series leaves BTI handling unchanged and avoids emulating BTI as
NOP.

Khaja Hussain Shaik Khaji (2):
  arm64: kprobes: disable preemption across XOL single-step
  arm64: insn: drop NOP from steppable hint list

 arch/arm64/include/asm/insn.h      |  1 -
 arch/arm64/kernel/probes/kprobes.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.34.1


