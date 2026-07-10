Return-Path: <linux-arm-msm+bounces-118241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v481C3fGUGqe4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:16:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3B7398C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D7jSSXxD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EX7ba5d0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118241-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118241-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A8E0300693D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148AC3F1AD1;
	Fri, 10 Jul 2026 10:13:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E9D3CB2FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:13:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678400; cv=none; b=n8tRqVM+kjgVJC8xrY+HsUuPCqoW/UMw2QC74lER+ajESWwUVtkGKIHb9CeRxpTzc2nxpZ0BFBY2Ws4v3wfHzl5dBlKVEXuFoe3oIohdIvz/mfpl7ZZpyos5/bG7TEUCTXzX+lL9moIqDflRJ7iSthhC6mP+IjrvCDFLY2ADZmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678400; c=relaxed/simple;
	bh=jBBnW6WFudmvEPdq0uOwfkuZMk72McbQneZaQOFjN3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvtHOz58ipNXQxGSP9jYRfUVdlV5Wx/yVZOlV5qiVUt9v3by/3VYcIXIymO7DWRS6EQqeB8qlqtWb7cQSIMmudjwyg9h/KVOCdUX3/jjxf10to3eVrfVAIPhco6BiDpWw6lgrHkXGT9+0JNFyDX1L9wTnWCttlJtq7LjdE8RQ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7jSSXxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EX7ba5d0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7egDR092390
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bV8KvWCZd21k3Re7nM7YSXO7CD2b03uTu9SGUiG6fXI=; b=D7jSSXxDPyx7uc6c
	4aut/MjSt5s4Mzo56LBaDDp/ojDd+7hkhupviKT2yW+Y4y5ScIXedvmacZ5cOLVu
	Hl1D7tmH/lXOq0BJDf2mps/LWCqQwZjf4K9dHtBamo4Piozxf0RUCBCO1n+OMSFr
	c6vlLOnhnRlFs0dX/yXT81oKdGcygN6KOvBICbI2oyxIeuXEDg2nMZBCgFZvqVHl
	bJJDZq5MYygMRpLo+5rbFcc/QAbYLEDK9Aa4eStt1q2XWBT3cxaoC6l3X9FqbfNV
	B9akTnIkKADUyl2TcaLz/6yYBGRw35WELJtBv4T9pRqdi84DHrmRUhw1UPPEjmqb
	vEOhug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjc5u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:13:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so1708322b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 03:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783678396; x=1784283196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV8KvWCZd21k3Re7nM7YSXO7CD2b03uTu9SGUiG6fXI=;
        b=EX7ba5d0lh+AuJXuSRr2dHkerCjYAaFS2qPoC0XStpO6YbeDQpdl7qbgTYGVF1aJUS
         dEHZQaDnXm+5YQAtBI6Uy0PEmShToJlW7+nfI09JMyD+cgE6IdU2JGa2eDLuUeewx5VS
         rqxF7WZ+9L755FIiqTvbav79k65U8I+xxtrGFaO87ULworj4GX+86DlFZz6Rlc/NKNZI
         nDHlXehm6gyagcbjgQkYeLpSKMqdn8A4oKiMmm6iPW9wnTJVL/CrG6YwgNtyl8MBF+Rn
         CkBVlKN+qbhu0I5JsG1viVnBmCxUSDpgnyUKjxu8GhlUhjjcHSvcUXeKhdFvUhBgD++v
         w1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678396; x=1784283196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV8KvWCZd21k3Re7nM7YSXO7CD2b03uTu9SGUiG6fXI=;
        b=CU5Tok580IkJg98KsOEIeX7qAfIY143vLQm5PxtN6hKVispahknxFfZb6nqSkFXypg
         h3lpM7eE78w7m8GKwUs1GeOiU6PazyNmYYtYbZGZ/DspIJ+pjoTLq0BSfPtCxNlTw9kh
         sNTYMTZEi0jsfMF1od5W+pWdsOp5MWO7YGhLN0jEpDR++k0JooVfuzaLQfYROnPJwEex
         j/4Eak3jo4bTC6offKCGFCuTSW0yB0f5u+M7boLVcPmNUxQBD0z6su7iRb5Q5SCMsWYJ
         nVi+HRX0tw3WxrYKEvREPds9Q3cWUmcZOW+bOSgBnvBu8BFUdwxb3/bd0NDrfMMxPA2F
         clcg==
X-Forwarded-Encrypted: i=1; AHgh+RotgYX54OkjiVmAfGDbJH17lc0fxAfZnp7wHb8zRKh2wTGj8rtR50oGhr4Bit8CMsTbuqcpDkJyNxnvyfUQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwCwPeSyapDQkENxzdP3zEGq0uOzrsoVoJZN3CM0FOTsaOomLws
	kNnz000xAy8WfuhkC4T4WH1oM5fub74T9JutJVUwl90PS3ua8EXm0o8mFWGAICWyo60RRkcpkEp
	qnqCVwkiVbIcGlCydiKRyusCypi8Z8VzVSC3xeO6+Pxmphmzxsv+VgSrvmWruTaJc25UU
X-Gm-Gg: AfdE7cnSo00ba+/XraJLc6OMpfEs4p1eeW6BYC+DeCeiDpwtuH1SSpoNIDzGCR6RzVt
	XWa/gDLKTb/ZPMrMxzT8Oi0rbf5cSc8bRd2cfer90+dZFjcSZMzWJyTJCEhEL7dLWs23TjotpEK
	Tm8wROfwjb7tBrd+7/tmoXSm4J4RoJezuBuCXBsNu1iwBlpgsmtWHn//I035d9hjzjbrs2ArmBP
	x5+mkUnVRVb1OEVoPoH5qyxJUJHVr723D03tyCAjmMpzzOzxmLbg6rhzSDdrCF2XmTcg0B1iH8h
	tZ6ZfqpEm4CzX/tLG8LsbPG+0fzU+F4hCuBXVChAu4qjkR7KU2yBLePW7R7o7m9rBqbkRWNgR2L
	LyWZ9UKz4sGEXJQg2IhXDAQU2H7ZomAUAXKM3hwCGa2LZ
X-Received: by 2002:a05:6a00:748d:b0:848:4754:28ea with SMTP id d2e1a72fcca58-84847542ddcmr8408553b3a.12.1783678395428;
        Fri, 10 Jul 2026 03:13:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:748d:b0:848:4754:28ea with SMTP id d2e1a72fcca58-84847542ddcmr8408533b3a.12.1783678394806;
        Fri, 10 Jul 2026 03:13:14 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm9977815b3a.46.2026.07.10.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:13:14 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:42:44 +0530
Subject: [PATCH v4 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-2-be81d6c15043@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783678373; l=2859;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=jBBnW6WFudmvEPdq0uOwfkuZMk72McbQneZaQOFjN3g=;
 b=SSyJjUgoguSeWg251n1KeZRyWrsQz325hAFIge4pglnHKXOmA/4WhEFet02HX4KH0aFHdds4U
 EjWuQGXvQiMA9czhxSLubFt5mAGm9HlMXmX3P8zySnpjyq3aMfxrwsM
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfX4KUEb4JvKLnQ
 WMJOMGOceg04CdqN4ryRhH7jQN23ivRxjYGNpc9EuoJMzgIT/bUBKmYfrRER4A92WdPD292M3pq
 9yMVod5XlsJM5dfMo024geYaXnyqab8TPie4WH+d9Sfrn6n+6RW7GCoastkk+kHI1TZoLZ2ve/Y
 lZDUK5liyuSzcLM6l2VFwzzp/x87hxG7k6g0n3MYtiRkyJiJDJyxHi3to/Utk6GB9TA1zPkQPCU
 /HHAl11SOP05XMxxKCvkqJpClXvLVGEmxzSTkJU9/UnEjZFWkUtp/djsJr1W6RGyvcwaMR8lPqI
 Ug05I06xCjfVw5YMfICxBWOkxUrW6sfnqKnECmbdIGqBU7Ghxrub1heFh3WGmRtwOX4hHDdumqv
 2mJW0aFAo4OEm87wUSXmjGTM1EvyE+Dyvbclh9SBy0opnWgaTUeqDnUUzX4cFCkp9lh4Aca3ISi
 BwYSqkputJdLggrX4Qg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50c5bd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rPJgdety-6tgKaoqdU0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 9Xk_YOD1Dk3uuwDdg-ShfyT5DYQquZEf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfX9ZdP9hyWgLo0
 TuP9t2AdwH5uhvo7OtnroU55wDvqv2qrmvkncGnt2lW4EBXRbUGXRf9dk//qtf2QPncYZl6levK
 TGTgDH/aGrhbyHvecw3bVMx4DL0xvjM=
X-Proofpoint-ORIG-GUID: 9Xk_YOD1Dk3uuwDdg-ShfyT5DYQquZEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118241-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:broonie@kernel.org,m:alokc@codeaurora.org,m:swboyd@chromium.org,m:dianders@chromium.org,m:dkota@codeaurora.org,m:girishm@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10E3B7398C0

spi_geni_init() calls pm_runtime_get_sync() to power up the device
before accessing hardware registers, but never checks the return value.
If the runtime resume fails, the function silently proceeds to read and
write hardware registers on a device that may not be powered up, leading
to register access faults.

Fix this by replacing pm_runtime_get_sync() with the
PM_RUNTIME_ACQUIRE_IF_ENABLED() macro and checking the result via
PM_RUNTIME_ACQUIRE_ERR(), propagating any error back to the caller
immediately before any hardware access occurs.

Since the macro handles its own cleanup on failure, the out_pm label and
the corresponding pm_runtime_put() call are no longer needed. Replace
all goto out_pm paths with direct return ret statements and remove the
label entirely.

Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI based QUP")
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 88ac0833351c..2914d781dbf5 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -622,25 +622,30 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	u32 spi_tx_cfg, fifo_disable;
 	int ret = -ENXIO;
 
-	pm_runtime_get_sync(mas->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(mas->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret < 0) {
+		dev_err(mas->dev, "Failed to resume and get %d\n", ret);
+		return ret;
+	}
 
 	proto = geni_se_read_proto(se);
 
 	if (spi->target) {
 		if (proto != GENI_SE_SPI_SLAVE) {
 			dev_err(mas->dev, "Invalid proto %d\n", proto);
-			goto out_pm;
+			return ret;
 		}
 		spi_slv_setup(mas);
 	} else if (proto == GENI_SE_INVALID_PROTO) {
 		ret = geni_load_se_firmware(se, GENI_SE_SPI);
 		if (ret) {
 			dev_err(mas->dev, "spi master firmware load failed ret: %d\n", ret);
-			goto out_pm;
+			return ret;
 		}
 	} else if (proto != GENI_SE_SPI) {
 		dev_err(mas->dev, "Invalid proto %d\n", proto);
-		goto out_pm;
+		return ret;
 	}
 	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
 
@@ -673,7 +678,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 			dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n");
 			break;
 		} else if (ret == -EPROBE_DEFER) {
-			goto out_pm;
+			return ret;
 		}
 		/*
 		 * in case of failure to get gpi dma channel, we can still do the
@@ -702,8 +707,6 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 	}
 
-out_pm:
-	pm_runtime_put(mas->dev);
 	return ret;
 }
 

-- 
2.34.1


