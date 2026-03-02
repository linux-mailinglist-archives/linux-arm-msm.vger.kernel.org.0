Return-Path: <linux-arm-msm+bounces-94844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNcRDYRmpWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:29:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A03341D6805
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A96753033E6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A38A3BA245;
	Mon,  2 Mar 2026 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idQ5aVp8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LcDRFEsl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D08B3BA23F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446754; cv=none; b=rvYQ2MwRLURSf9BpLAJxX/yC3drggNa0IyLssz7SCsBqlKxhlY7daYzAmMQrTj3VWgt+38GlhUeCZ7fKUX4rm5cpprJCKgGqbAo+hRA5eQcb+pZwBwcl7q8tPFIWE30KQ3c1xaOzzBc1awbAZXke3+qZ6ipTnXbHx405tvACoko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446754; c=relaxed/simple;
	bh=PfQRBkCngjkgAyv5OvC6CZE+GMh0n6EWRbZ+V/+EGC4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6l/q+M4YMScEp19JayNBZXXOKHEwWEjWAzpm2u+zZSaKO9fmQIYD/ggpP3/TQdEntMizDeh8tQnyGOJfbAkAXVwTm20oUSVTVUuCymUmyERWsWpt6yDV1olbLPgansxghQKMXz35Y4s6T4Xt6QnvMJ8+neBEpg/8Wzk3fKnbVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idQ5aVp8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LcDRFEsl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227nFDj056160
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfQRBkCngjkgAyv5OvC6CZE+GMh0n6EWRbZ+V/+EGC4=; b=idQ5aVp8H+/ed3x7
	ZlDRWA+6WjeHMREo9SQXYqNA4HL4uCyAnFBDG0mo7V07/O61TZM8vc8nY82yzb90
	443hNTnirzoWPH4t46CG7059pV92d8Wqc7I+jd7m0/jwEdkFcBMi2WGYw1EOkr49
	UVwsupNPCUp8dwLv2gx0674LWt8+hEsNbVLOov38urEPlnXfJsZ/GXfgXyNxghat
	i7+KY+QoioZhSFMpSLvCmbRtPT37MH+YXv8mxxaMTS+CYEVs5CCmTHSYutq/C3xT
	h3Bw59ejNnqiWaKiC+EorRlD8HXOKuHvt1PBoji14F/jiqJG2ufGVwnlT52311cE
	/myo5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw649x3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:19:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fec175so174374485ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446752; x=1773051552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfQRBkCngjkgAyv5OvC6CZE+GMh0n6EWRbZ+V/+EGC4=;
        b=LcDRFEslZDDL52B0Yx3l73KrjoeUjmPohOgtVNQeAvDhOv3/iWe8/a/lUg40Gs8Y/A
         rRq1XAj03B4kxb9zr+yvylBU+WxwftwpRnJQEAW9Soy3iBP4ZoxCI8KVZK2vE26gG2Ol
         byoM5+MpWbzaEj+dWqgEEdbANm018jGtWigpOkD/2zYkYwmcyGPQwUbDqdHM5lklKoJ8
         BfUV1G967ZhmTPEh9WN+/B+bSCfZkAQI6MeFsza35fAZLVR/xx5HQu+ur2ksQuIfXOAI
         pNR60Gya054rOcC1AX31MhKm1//K8NqK+Rjj9DTeVUGEXG3OAYd2bNvBQoUtL1lYO2Nt
         Mk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446752; x=1773051552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfQRBkCngjkgAyv5OvC6CZE+GMh0n6EWRbZ+V/+EGC4=;
        b=b56ctRt1C5WrEC1KbkdPnUJROBSiMInuT13c89WEGb8Lm7oX5i1jDGh79d4xX9Z2t/
         pfJVLJ72cBaGrwJXDC3vyY3lBkkdhQgxFKKrizCVWXAKwvrluHpBVhAMtUrQjX8Khn99
         zFMn42LG38pQNRH3JrtB9PQdKch5zskJUV66k3yShAcaVpHTyW7001o5eTkb4CchLsY1
         sV9RbuoYnK3anSEIQLq5sYaLrojh/Ou01TYLO7OsUMW61J9WCfGGdzKEUkqkYwrGzSgM
         DRwxt2MfSycf/shChF1jMBNQ5D4lL5PosVFWgcVDdmuFYrJO2VuSrqeQikLw01gvdX77
         ixXw==
X-Forwarded-Encrypted: i=1; AJvYcCU9z1ttsBy+1PfEmr+xQTa1A28W1WkAuKUANJ+uYNCdbfh7M5BlxN9mRE6XHxKHcNiEXTm/A5hVK+VrLrJ7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4+PYiwU+K575fVootgLOOLBBwyBAnVD/YaRL5hNpB7MRj6HN
	dPThfb0vyEmvgIWsRIMmWwjcxiYAs0DxPm0GTFe4oOW9M7eQpreu3d1rj2m/JGytz8ji5SFcoJo
	ngkEinWwT1kBaO1qeQjRiGshG8+q4QRZB4t+50cA8iD985FXLnH4iMCno60Nf/FYPi/0a
X-Gm-Gg: ATEYQzzo9x5ozB4MfG0YqM0vQtAkCPjvScrJm3Ge3BQM5SBAfO7OEgChQOELA8Z0BOB
	Jc/WgImbnEFcVsGtqgkDmTEjBDajUBvqypCZZDlEQ7Ueg5Qeflu18FyN17PY0SlnBrs7/REet78
	9u6mJ+MmArxaR6A8svrDQVSTVJoRMTLfBUPFsn4PBfxLCO5V14dT1i4op/9AVPmjH+twGU6x+cW
	W/GntMZwN4YFiriceA6BT/kHW6jRIuxr6VvGObBVnMdpYy/KNfc9HSqdp6SxjkDbCiqezcKAash
	Ku+NQSK7L1e8rcHW0ivmHCDVY0uiF8X3CWHuEqdnRt87af9bt4zh8ITifsGZTqiS9PF8KEYtFLd
	0D/VlpLb5u3Uz985zj5jjymGAdjvYm+21VTtDHXFakB8YAxxQ9AbP
X-Received: by 2002:a17:902:f708:b0:2ae:4847:cace with SMTP id d9443c01a7336-2ae4847cc94mr51831015ad.28.1772446751959;
        Mon, 02 Mar 2026 02:19:11 -0800 (PST)
X-Received: by 2002:a17:902:f708:b0:2ae:4847:cace with SMTP id d9443c01a7336-2ae4847cc94mr51830795ad.28.1772446751504;
        Mon, 02 Mar 2026 02:19:11 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b53f4sm131326715ad.18.2026.03.02.02.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:19:11 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Cc: ada.coupriediaz@arm.com, catalin.marinas@arm.com, dev.jain@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
        yang@os.amperecomputing.com
Subject: Re: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL single-step
Date: Mon,  2 Mar 2026 15:49:05 +0530
Message-Id: <20260302101905.3591689-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M3AaF1nUYv7XN8hhOsyYKa0SLDEQ9i__
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfX/mmv6JIz8xYU
 WeT5pWpbAFoRa5D/uvUynQUJPUB69/VA5mfNxeOttrZAsN1JL/vENDxMeku42ggrc80uvq/DVbV
 vTMZusLTdT2TNjKhLza6/GBJTwhtiy1CKIK/rGkvSAQXIV4kdlkV+XDmoTtvMZb3B88sxjy+E4w
 W4tazNvnAGkxk1FBX+6TBI3igRk/b0HbJ16Z5APG6PjVBGlXGgscDl/o3uUHEk8a0uDfd3qlNA6
 oteVNp1ewbbKDKeR7cBaOhKYlqLyeFMv12dopqC4q8cFFwj1qk+pPRNaPhSAbgyx8Vtbl1VwUQ9
 mSYTuWf36PcXSYfdsFGopHX9M/B3Up767hy4T/i5v/uM5GcjkcUtYeOA7GxYYlZ4HWOT+dM1WOD
 D5pWGelFFVHEcXmR7UaeQ4dmRJaG7aEwiH5O3FgBk1+93yXviPqS6AXm/Q2++sQf61RogXY3Zau
 hMysaVMklwRnjt3KdyQ==
X-Proofpoint-ORIG-GUID: M3AaF1nUYv7XN8hhOsyYKa0SLDEQ9i__
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a56420 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ioe3sshWH7rKnnzZdWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94844-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[khaja.khaji@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A03341D6805
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 04:55:44PM +0000, Mark Rutland wrote:
> Since DAIF is masked, we won't take an IRQ to preempt during XOL.
> Can you please share an example failure that you have seen?
> I believe other architectures are likely affected by the same problem.

Thank you for the review. You were correct on all counts.

I confirmed the issue is not related to scheduling or preemption, and the
v1/v2 approach was based on an incorrect assumption. I’m dropping that
line of reasoning.

I’ve since identified the actual root cause and have a new fix ready,
which I’ll send shortly as v3.

Thanks,
Khaja

