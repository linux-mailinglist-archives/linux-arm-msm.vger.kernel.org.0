Return-Path: <linux-arm-msm+bounces-102711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AINiLqYu2Wl+nAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:08:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E1A3DAE3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8188830038EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 17:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB9A3A641B;
	Fri, 10 Apr 2026 17:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMMvkIPb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hkp5hKfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100D29BDBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840928; cv=none; b=EeAOf+KylXGjvZboDMm9UMNIHbx7Mmkx5+5xmjB9ncjRbs6n6QtWgxTR3lNaDGBSCPT2ychFj2fze2GR2QGYQ2t7ECFNz7ig1zJCn0w/aCOgHeNbt/LcV070kPLkd9WPOv/wae8YmqCqZovlp2b7DwKVHyzyTCGpPvjjW9DnC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840928; c=relaxed/simple;
	bh=gM6dgO906P6zs/1oRutKa1rCbR2doQV9qF0Hsq/ej2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hr7xzVzj/rw9+m7Z+KXvPZCRN+LV/eTV473Wnm+Ptr9iDZaK5iT88WjnfOoGnof6EwIH8fIQO0uWVoUeUDPuMkFVFTvoOC2YXVtykA/Ug09K792c+BKpANdXbZD1qWflyJ2UrIEqIMCnQ6exCoyApxIDqOXUzRPO0IiF6l3o3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMMvkIPb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hkp5hKfz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AFJOgG3118612
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZOxmQZBEOeXvhjn2YgqcFwzqbzGVvP4E9vnaq98S+Q=; b=gMMvkIPbjfraVc7k
	lzHsqHWRGylCZTg+gypgOLgoLjcoluVaAZvoRUmJf2qaOczDDJdQBDH4m69wcwBG
	ge8eKFh0i/Tse8glkYs4sCmIcgvqcrsY/Uc7aErrOitbqRPSMwbKpfVyl+4TCSh+
	2Q7HRZ+/VO22l+WXLgZ41sF1wJWPysKK5m4k9WbKnAF6ZWW6WL1FAPajOics46Y4
	0qJuwtFCaE+QmnKvkEIA/oxEG5xiNf5VPOYx8FsYuJFVu22fJca1LcWXQNHCMcVk
	uL7Q7mGYb0+ms8ZXrKzp2lSAxnKtd22h9iVMSrlN1C+W1chf8naN+cHdmFaKKyPf
	t+mnQg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3raraq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:08:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so3086285eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775840925; x=1776445725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HZOxmQZBEOeXvhjn2YgqcFwzqbzGVvP4E9vnaq98S+Q=;
        b=Hkp5hKfzi7wvbQRES9eUV9a/st8rws/2AIKIDMUMnmu+Ko/cvXkjjNGQwHjO5OMieK
         HN23YAMB7OwWeGBL3QR+7VoKnu0EScp7X734k0TlggPMoKSoujPL/oMa7hKge0lL53a9
         Yr03h9TnV01ATr2rhM/vAwkGw9TpB5uSvtAj9so4Y7QmI/AgXDKOC496X8gMnlGSnbB4
         EnSbZ6AHNBCqjKndcpPu6fGPy9+8sIvYYu0YcqWox3Yd/FedCpTOllMe0iFOk9BKPHEU
         iud/7O5gVmx79hWCtcN2R9ndBSByFBfKqMz2ZTp0VAFlQRx9dNjTOdmF4TYh+x7dffNF
         bq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775840925; x=1776445725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZOxmQZBEOeXvhjn2YgqcFwzqbzGVvP4E9vnaq98S+Q=;
        b=D0iOyGr/XwMRJzfyLFHp/mzokG2wAfVlem1vDb5NhXXaQ8V/UjdJLzUVl416xfwCzy
         E5DBLONKuB5/M2J4mas3wqlAbh5MqwSklRpl2tek37TOUT+E2OZgABqJgBs9vorOLUnx
         aQnB5r7J1OsVPnt9H/yf2sgf2Vk8QCsibTtfHP2jNQmlESM9T5oelJdcCXd2TF14MgYK
         0iAJYdqydnB1H/EKS1EmIiJOQquPvFtWbv3tKwxCyIPj0N1kIrr1n7fRPBm2xagzriEm
         3/TqPqfOcx78iug2itmZKfIyl84az3aFulNgwUChLk9JBVxh8HAHFqAAVcQnmnPotmNU
         MIbw==
X-Forwarded-Encrypted: i=1; AJvYcCX6mT4SGlDNiwErnNxvN2yxiuo04JT62D1O5pymLp2zQIZNj+Gi+hgPTtTo+7UtB5sL814hvlyvm78X9xUH@vger.kernel.org
X-Gm-Message-State: AOJu0YzzCvu2Tky5X3Nk7fwvYhVrwzhhOF31crh821G9CXqcCk8/aFdn
	hOec+ETUHyy/CwQeglpGcnetKhpF8ohI7gh4grwgZ0WIYTNDAkjd44sv4w+tIIrF4jPEdCMnBvW
	dYYGsiGVShOabBOyGVMN1Djyg+m9QZA8CvrPU5HJrx+E0zt66l2QNMvMz6nlBeO/UlWcN
X-Gm-Gg: AeBDieuJ13id2xS9gFqoZqpqbmMtMBrRcmxRAYNv6h+IvuYeAolhC3xWR+KfE231l6Q
	mb2MIKm04AZged8iJzvNEnvJnumLREEqtBvOSaukvpE6qJ9ZKuTtJs033EmZ0sBuwBwdWdkxOG3
	Eucd4UGx/yXU2w1N7240W2G0JheyP+vgT9s350k4FCTWghuJBCTMrUu9KEea6j8fIE8X56EIWRB
	04Tpc0HOHxbdJ3kRDeA0DCQvUcneC7vLUpvn+POQkGEfEV9It8drf8Vl3hWmbQwTFieEVWEea8h
	kgCd2tXMGQOHHe4ze/okU0XwLBPHLeskCtmwzB7abMgPKlsNP+teWYbg3tj36CV3RY0kFXdgsu3
	AvKj6yObRL+zoF7owuRWsUBiKIsr4M/Uom8qFMj3W1vmRwrmWjrLhOSro2Gy2HV4OfZHVvk8Pap
	E=
X-Received: by 2002:a05:693c:3116:b0:2d5:432f:1569 with SMTP id 5a478bee46e88-2d5891752bbmr2332809eec.15.1775840924845;
        Fri, 10 Apr 2026 10:08:44 -0700 (PDT)
X-Received: by 2002:a05:693c:3116:b0:2d5:432f:1569 with SMTP id 5a478bee46e88-2d5891752bbmr2332781eec.15.1775840924302;
        Fri, 10 Apr 2026 10:08:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde68bsm5089493eec.17.2026.04.10.10.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:08:43 -0700 (PDT)
Message-ID: <aa92c999-2d0a-420c-92af-92540a27027d@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:42 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: fix incorrect counter check in RAS message
 decode
To: Alok Tiwari <alok.a.tiwari@oracle.com>, maciej.falkowski@linux.intel.com,
        jacek.lawrynowicz@linux.intel.com, quic_thanson@quicinc.com,
        carl.vanderlip@oss.qualcomm.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260410112015.592546-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260410112015.592546-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vs4Txe2n c=1 sm=1 tr=0 ts=69d92e9d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=yPCof4ZbAAAA:8 a=EUspDBNiAAAA:8 a=kkqwuB-7APtATm1xqVgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MCBTYWx0ZWRfX4x1wnSFfi9Bm
 mMpTVgBiGpxr08tz6UkGmhC9tnjduqaqk5hbbnC3fbVA5+JmX7cfoFum0fidUDPnz0uj95UnKQr
 w/3L5RPPi3n0Ccu9YGN9OgMeTqRnS5DbGfKOdlvIB+jZ1q3WW58H3QtDkkwMUBuLLNKBHkSRCWI
 fRr0AR453hVomh01dCyxUaEY7Wtc8qtQCZ5lrmi+BtAJTpKpfq7HdEcT+0o2XdYG0ZLErXv3lBf
 ekzFqJE3YfYhN0R/feNQqIcvH0yvpMIBBZXfvKT24vzBhwy6B5YkTAKOtbHLfiGMQjKUjm3SxsS
 zGLBgmh7mLYmsSeOBPqI97fXHs1rH0uBbdnmLLo9OtqKId7jN5L0UfmXr/2BA7gZz6loACAaO2X
 Kw2hEUQeWFkauMLG0ZqAewaI7qbXVdIr8+KJzlevuz1YxrMvvb/y/0b/cp1tV5KH8vVq5MEadIS
 BOWMLznFps48eIPYKeA==
X-Proofpoint-ORIG-GUID: D91-o56JjpS0Oq3mvVKFAby21cIZVVBo
X-Proofpoint-GUID: D91-o56JjpS0Oq3mvVKFAby21cIZVVBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102711-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,oracle.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11E1A3DAE3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/2026 5:20 AM, Alok Tiwari wrote:
> The UE and UE_NF cases check ce_count against UINT_MAX before incrementing
> their respective counters. This is logically incorrect and prevents
> ue_count and ue_nf_count from incrementing when ce_count reaches UINT_MAX.
> 
> Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

