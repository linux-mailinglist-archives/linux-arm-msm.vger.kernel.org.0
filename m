Return-Path: <linux-arm-msm+bounces-94129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oANPCIMGn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:26:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F21D198B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FCF7311BC0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5643AE70C;
	Wed, 25 Feb 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCLZuHlf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kY7oHhmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE403D3012
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029228; cv=none; b=lp9iKnA8jEZpN1lnaUe82NT7TrVMOtNUnvweWtmeWT76BNVQk/aBqERaooStBRWIcJT/2ov0HJRtoSRbxTZHkJ9AqyyHg0O1MEiUWTR94wOHXwZg/qgtolYsKSM3XB4hq1wly5h1pp7QFS7/HVuxWiCt6Gaw9Nldf4CZgpF9oQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029228; c=relaxed/simple;
	bh=HoX+77Ou1KVRWuj52NLOpoMqo5t3Lt0ZrveaYtMn2MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA5GcthYaXdbxqJl8BVq2nKAkRY/vzfTkjj451UClP6iFZq5uGl1MR/x0yM6SxLG7F6fsBFMO5lPW/QmbMDy4dflV2UujIPc8DbAf34MNsfmSpxrq7KUdLGJsipeYJ1WNCvLRwnIRGVGzCOP8m42L9VtktfxoQi3hBG8IqExl7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCLZuHlf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY7oHhmE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TB6b2365333
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=; b=lCLZuHlf8TyAjJm3
	u3rme9fFAEMEi7u536FDPUL5nlAy5jiQp4VpF1GwY2/RJhELgyk1DwwPJRciUo9f
	G6UtslgOw5RylV8+vIzZxzMkscSgIcWthwhfKep4VCv3qiZH2jlFNOMtWoa46lcX
	6KcSkfDa2N+ZoxRrbkVfKOoXzCQaocEd0HhJDFA+sXLsHChPj9nrDPFepT1nqWVI
	IZ36rErEHBHfnY7GWhBi1tYt4FOiBTs7/fvZPcQLxGXvO1vVknuj6NlwUVlasWB5
	3wFujOQ6K2RIpoDNlYCvW7z0Q1Es0jss86QZ/6e/PluRBy/m1UvZ3r/40OqsZ3/M
	2XHL/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cherjbtgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adb1bdf778so17976075ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772029226; x=1772634026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=;
        b=kY7oHhmEVfNKnl2Ets9P9vugOZO24QTV9ZW+gUYqGvz9rPMJQYeTDaPW8gCyQhT5oX
         kM1eciXC55RcKkfrgz5j0X8PcKzDzlc0EiV4xc21488ryLkx0xZ5sYyfN43v6Tu531Yq
         wRmK3xov5ROrDgaFVlnmGeURzJKgjSuv9/ghY6/s9/3xeTHecSGoyUnhaZ8KdC1QSJUS
         huraSwqyLHE18EPjXfzAm4JMJqYA6GOe6qd37ja9GtijGvwyuHQ4RFl2dCxh8DSLEXOR
         P8Tgv2BreMhHnnXG1KBNcvn0eUBntXMwkuRoFhT2znJ+8GczSN2UDjpoAMKH8ZRmhkbN
         vCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029226; x=1772634026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=;
        b=naIMYHJFY2RDQqtujP1AqDM/eVnXoch9KNv9j9yQtREVDZqVoVgNwbWh4kKSuCN6Nv
         fPyJC9PoN8w63uCrRoFz1b/zwEjg9ldjRI3xk5tPgbU2DffLAnUIcDSYw4Sv1nJldBGA
         nU7DeuMdcyRcpwRW6xGNgid282VC0iwN9ciFtxOf276nT+uRKo3SX8bJa59p3zc2xpBO
         oUxZjpq2TwK9f/L1F836RB63/ADYtdXAE6aXV1que9hvEQsz6h4anOWhxwXPPzVpciv+
         bDKRBvbZiOJLa1967A7qFplYz6w0lT4shqjnqiSuzszt3Z6KVKPWKgP1xxK/8RhU/XDm
         UFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0c/uvR2Ib0vlC4kOD68zbtK6/cl8+salyW0usa4Hk2XFUbSurJpGQVlZDKdZzA2Dt+gmBYyzhdpsDikEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMSadish5zXfjABnx4IO92guVwFdIHPfHUcAYvy3Bwh3t1c5/
	1yowOZ/Ye2jvUP71Eq2o+B0y2ofV+F6FYSNcBTWXd+Fd1ZZiPvxWGah0rswTYYyBeYoq+r96TiX
	P+56lKoNAn3U6n4ExTeV9gAh4FO0EzoavN2i6COm0g7Z3Pn8iZXpWnDJ1t+lHw5n+Uixq
X-Gm-Gg: ATEYQzwch/f2p22OhK2oPTbAqjG9aE8BBumAaV+kK/mHPMP6QbdmkHS/vpnNvZ0T/9p
	Vw8AYxhKMtjeKAx8MgiJZYyNXbRENrxu5tXAjpKo77u5o6AMATiWIuXtp56+CU+GLAjbyO2foDl
	Z3vs7OFYBkgAEoobyP6gBDbQyx1xcu8M5Gs+47aI9Y2gx68MyX6BUVz2oEceELOeHENcqH7nNvP
	Ay0BzV49qk5sTLAiyubpD9nR8owMRiHn8khWhqHFWzhM2voKQyJJInpfOjzaXwX7SHlxTr1Gm48
	w33Dr/0xF5ySqHOZugbjAcY95z6FSrO1jcXdRtGKp7hByAxeGqBNmDAntPW1j9ig8EaRwuhU5h0
	WctvgWprNWjojFzHGIIlehPzaL4gmG7mnP6IMPMIoeYO6enS4oJ8=
X-Received: by 2002:a17:902:d485:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ade9aa21a7mr3608555ad.51.1772029226471;
        Wed, 25 Feb 2026 06:20:26 -0800 (PST)
X-Received: by 2002:a17:902:d485:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ade9aa21a7mr3608015ad.51.1772029225935;
        Wed, 25 Feb 2026 06:20:25 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5e55dsm142051345ad.30.2026.02.25.06.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:20:25 -0800 (PST)
Message-ID: <b6519bfc-7931-4985-aaf1-1aaf1fe5aa88@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:50:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/18] accel/qda: Add Qualcomm DSP accelerator driver
 skeleton
To: Bjorn Andersson <andersson@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
 <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNyBTYWx0ZWRfX7awQv2njHv6Q
 oAhdJF20bNiN6pKXGkc68RuUSMxGa18BpzUloagY6B1HArZlLjcv8lOOt6ARv0ZJF8xOYISUt+z
 YfJC2ZU0z0Hyw5VhXX+AEtZoGcR2t3piAlIGOvutfSHWvl4sV4lxDGCTyMTqrXeLmRm0VjDrIRZ
 XZqFr2xH+J3y6BeJKPtXQeLOH3kvBCWTDir1L0lWAU1unR62Yx65I8I3MgF85a9OQwx5IjRjM+R
 itF3ThhKGDj9+eEYXngxa/Vx1+CMipfUtxB3znsZD4hUcRmFR7Gx7lgudWfF402RRgNs511Xpd7
 ZvsMyM3CH62kttrx1/36GxMdth8MD7hdERPVW3E18uaJVMNdboT/MEwOnPq5kRaS9xwVzaxAQDN
 SB97EsvBHWPIZ/fl430xgcZc4hOv0OVldRzjgp9DCJ2Lc9kbv3LT6kr4x5R+h/PNUqJXOcZI7d6
 yQ1r45Q7IHJrVrKDOhg==
X-Proofpoint-GUID: Kz_ejrkPPuNtRvxuLRPW16fm1oChve4j
X-Proofpoint-ORIG-GUID: Kz_ejrkPPuNtRvxuLRPW16fm1oChve4j
X-Authority-Analysis: v=2.4 cv=NeDrFmD4 c=1 sm=1 tr=0 ts=699f052b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=tV0izz4fD985yFSgC6wA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94129-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F21D198B33
X-Rspamd-Action: no action



On 2/24/2026 3:22 AM, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 12:38:56AM +0530, Ekansh Gupta wrote:
> [..]
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> new file mode 100644
>> index 000000000000..18b0d3fb1598
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -0,0 +1,22 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +
>> +static int __init qda_core_init(void)
>> +{
>> +	pr_info("QDA: driver initialization complete\n");
> This print is useless as soon as you make the driver do anything, please
> don't include developmental debug logs.
>
>
> In fact, this patch doesn't actually do anything, please squash things a
> bit to give it some meat.
>
> Regards,
> Bjorn
Ack, will squash the next commit with this one.
>
>> +	return 0;
>> +}
>> +
>> +static void __exit qda_core_exit(void)
>> +{
>> +	pr_info("QDA: driver exit complete\n");
>> +}
>> +
>> +module_init(qda_core_init);
>> +module_exit(qda_core_exit);
>> +
>> +MODULE_AUTHOR("Qualcomm AI Infra Team");
>> +MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
>>


