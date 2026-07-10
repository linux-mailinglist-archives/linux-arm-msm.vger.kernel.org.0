Return-Path: <linux-arm-msm+bounces-118239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M7GTMlvGUGqV4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:15:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D773989F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:15:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PvQhTW5/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J3H7cvl9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118239-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118239-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA271305D217
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3B6403AF8;
	Fri, 10 Jul 2026 10:13:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE6383334
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:13:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678392; cv=none; b=szrEpnx7KFU7Ew2FSaseuqmu2NMIXb61MLkGIMidRjzquHZUeMF/AdW+hZRH3v/EUPjTcKw/32XVexOA9+B3T+MqzCy4MtsXScEWP/EHdsPKjHaFOfjobxht0mR4WrV/pbJcu5Q9r6beeeYz3Ld8z+hVpXEmQv6/NmOUMFFK0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678392; c=relaxed/simple;
	bh=fp61jno8++niFT6E61fh+qdDmseCUv/upWK5jKW9rF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=px9E8yTWutSDqVo7AifeeN03Cb+9VeNqtrJjXs5d/zYA1RxwumTntykXn9cHxacVY2yDN1Wv3n0gtabycG8IleFXD85NOM9zBzMIra5C2QxuThad7svD4v82Md8C1SseiOyp8lS+0Ks19jPv46fV5+Ijf/9INEFqjOSTioGYY0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvQhTW5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3H7cvl9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dqrd188249
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=; b=PvQhTW5/4hhjrrgA
	97x8FdCr98oqEst1fYU3R2AzLlMri3EztcmjXQEmfP9rIXZSoCXJAEmMmmNk0BaK
	GgrLTOjooFFW2+YRRaQi8NENS0KwqtQ28HQQa6yGLRzQiOokZ74boC0nvUECFYXF
	W8v9oOkFArWQT2Z2HztJzl2p5NbYiL5RyKxKH+lJ0RdV1SBbD/QOKwqGl65T0Kls
	1Krp2A1+TqCq6MjYZWqU8ZryHFjAxK5RBGuvybVwiffXhnyH0QB9cLC+LgJxkVfB
	DPYWn9V+gh2Ri1TRSKhYY92rjGr/tfN70eTg6NeDflXCLd87ew0m9Sc6z+lGYdtY
	BA/0xg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesuxq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:13:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848551b54f5so1438089b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783678388; x=1784283188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=;
        b=J3H7cvl92HkhugqYBmQcNDuHwQc1kSTanpTYAfp+6x6iO/5bQV7H8w4RuZJhrAjVyw
         W2J2TMkauEbwo6yyWFY8YmdvERR0XKtSh0azooMYTfiL3AQfD3GN8213lWm65EddyqAp
         9Qj7Xt9v1S2cAy9Y99+R2WKZSEdZ6ydvwcp5u2u4M5eeiszWDMWZKNwJiYm6AvhVxSvo
         LPZiNa3YCpIg41LCQ7GCvaX4XjNc9X3DATrVX4jVfXsLOw1tVBbynfN9UM6DFIWybHWw
         iSus6LLc5vv82SAtuvsORrKx98tJ54sE8Rq9wNJWzUd0o3uNIbzSEkyPAOZeQZ20DtAo
         GQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678388; x=1784283188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=;
        b=CNeUlDw0V0Dk+sqp4HmfP0Sja/VS9uhPwu1In4Z4JIP5PrtVsHLJEVZv+RmhUPDE6p
         WtW/7hqL657FInXiP1alkIjtNMfaNOUhIx9UJHxKWwSmpc8+7CS+k2HP1J4ZYymgKY1z
         GMkSlCsr+h4PKjBZQBdAb6g6MYp540J8J6G3QZv0hdwGFkBxFWByaIQE7EBLu17NDJ8k
         pKbIKLq20bULBBFnC/HCgU2Xb38wXvXr2COl5Jx8JsN6nKyT1n7k8TrcJmzPY64BH26J
         ehyV4ATad5FEHi5uX/Idvdi48hbZcTKJkwlztmotAue8hC0EpgcD9C3Oi9VAc1Ze0gCq
         G8Tg==
X-Forwarded-Encrypted: i=1; AHgh+RqwsBh9aXtzhJWXOzWhOejshN7O8H2q7SCjRBIKQEKXSBnWfFkrWifxhKQAZi1Kq//I3XKmWFTmQHcBbbzF@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaCZTEFkZP1hjMBr+vUM0rw7qdsotVxyBaNa0RU1PVyHOOxKf
	zN7ANbmpROCKcDQsXG5ROg+rtiZPIfCa3D6RKaSC8Q57tFnvCw0FZz25AySV2M1+Ui3o9QbmJx3
	SjVgrE9mRfVjqg1B96H/bokUcj4uFkODgK1eFK1UEyjIRylUAK4HuqlrDYZO4tHv4t2TH
X-Gm-Gg: AfdE7cm80G2MuERtQB6bsooeV09b/X3ZsypKZBgKNAxtKhcyw4bXa/4uFdt5k7WW4q1
	gvw31G2gCfYcY2193zuskh6RjdBOfvIGuFe57X9d0yMWk3Y+l1Fven4OhrU3Y00BYIuRXsPlo7v
	cEHb+g49x554HXYTz6/sN6To/s1rcUisV5La6dnSyIlzcuHPHn+XUxkDRdq8vOpBxaExypvPG7H
	63mgZrcdJfQToaBlRs78K3VmpmbgUNMeUWYjtJ4qXBdqt3tHMngenjn6iPuT0s8q79+dgj9livU
	+eFQ2rn9vxqMGnCnuDGKXEncoUsOozazyQn1IJIpcNHe6Vc66pxndA9ZZ1WIfXRn+4dQsMrKbHU
	UxecVPYoq2XXeDAjNG9jYqJNr7Hy14KI9uXY4FnBreJr8
X-Received: by 2002:a05:6a00:288d:b0:848:804d:9c5c with SMTP id d2e1a72fcca58-848804da18bmr438264b3a.38.1783678388540;
        Fri, 10 Jul 2026 03:13:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:288d:b0:848:804d:9c5c with SMTP id d2e1a72fcca58-848804da18bmr438231b3a.38.1783678387676;
        Fri, 10 Jul 2026 03:13:07 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm9977815b3a.46.2026.07.10.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:13:07 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:42:43 +0530
Subject: [PATCH v4 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-1-be81d6c15043@oss.qualcomm.com>
References: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-0-be81d6c15043@oss.qualcomm.com>
In-Reply-To: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-0-be81d6c15043@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783678373; l=1909;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=fp61jno8++niFT6E61fh+qdDmseCUv/upWK5jKW9rF4=;
 b=GXSYLi8r438TIXhUlxg8cHoKyYWoGVzcZUQcWC2ddFq1Wud8IbjmowbFPWlatss/e0WWZvCUa
 nMcPZtXkklCDp/PDbkouYtwW0n6usAERIFxGeC2QhTHh3bnb3YoVwj3
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: 1jsErgNutkoeEfU3IyGEYX_7KRD32g1A
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50c5b5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TpI2hjkGOM-ZtQ_OKuoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfX77wQ0c7t0PII
 T+KNJgQryFFbNi5LSUuoVO6moJ8TxV+c9v0LSs6HMjeOD6BZYFgYE1uME8TX6JpAYFgGOYrlitE
 qQQij8NEYQpi1K+tVmq/URaipfFDutw=
X-Proofpoint-ORIG-GUID: 1jsErgNutkoeEfU3IyGEYX_7KRD32g1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfXxDlpo73JlqCE
 eL5NxDSO3TLuUCSvRRIsG6Dg+WiJo6z9QfsQnMEJtKEDaHId4JuHsyt0J/NeYJjW1HN0N5Qphjj
 pB9HdENI2CpWyQZm6cx2AJ5eD3l60tlormImk4FfelbP8j8tX7L9byPZ00BxxjJESEPQA2ZIXId
 BGLpta5bgu05CFZSW8rxzkJ7/npWCUTtZrNHS/mNKKylg5bCf58SPGv7FcZPBJYAcPSQ1Zhzw0N
 Y8rode42NBcNPXX16PEAMB+auxcEDzKa0+2boshHqdhiBPz0cI3Cdjv8jgXshlmPYcadTfKgttm
 rwktQyuCUOrbtl6KBR2l4XD67gep3NjqhU6fJzRB/Iwe6XUTmsr9XMKzK3pHsUqVFo9sBAuK+F7
 X6TNpCwUmFtIvLmxma5RaOieNScbMhY3tnL/XUBKimGiraIZeMmUptuVFyF5RS2T5TnFNp+zAY3
 hIw2/qmPuS3t2V/MadA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118239-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:broonie@kernel.org,m:alokc@codeaurora.org,m:swboyd@chromium.org,m:dianders@chromium.org,m:dkota@codeaurora.org,m:girishm@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 847D773989F

When a runtime resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  This causes all subsequent calls to
rpm_resume() to return -EINVAL immediately at the top of the function
without invoking the callback again, making the failure permanent until
runtime PM is explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  If a
device's resume callback fails, there is no reason to permanently block
future resume attempts on that device and all of its consumers.

Fix this by moving the power.runtime_error assignment out of the generic
rpm_callback() and into rpm_suspend() at its fail label, where suspend
callback failures are handled.  Resume callback failures now return the
error to the caller but leave power.runtime_error clear, allowing the
next resume attempt to invoke the callback normally.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/base/power/runtime.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..fab38bc98113 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -469,9 +469,6 @@ static int rpm_callback(int (*cb)(struct device *), struct device *dev)
 	if (retval == -EACCES)
 		retval = -EAGAIN;
 
-	if (retval != -EAGAIN && retval != -EBUSY)
-		dev->power.runtime_error = retval;
-
 	return retval;
 }
 
@@ -751,6 +748,9 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	dev->power.deferred_resume = false;
 	wake_up_all(&dev->power.wait_queue);
 
+	if (retval != -EAGAIN && retval != -EBUSY)
+		dev->power.runtime_error = retval;
+
 	/*
 	 * On transient errors, if the callback routine failed an autosuspend,
 	 * and if the last_busy time has been updated so that there is a new

-- 
2.34.1


