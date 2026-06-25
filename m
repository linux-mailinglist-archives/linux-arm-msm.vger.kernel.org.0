Return-Path: <linux-arm-msm+bounces-114437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v9XdI62NPGpXpQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:08:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F09346C2522
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:08:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FjHklYfA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cU5sxb5d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114437-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114437-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE9A5301CD95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 02:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211D13A8FE9;
	Thu, 25 Jun 2026 02:08:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE67324705
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:08:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782353323; cv=none; b=MLS6uu0xyj/lHy2c+DRRuhk3SyP+83ipc9gezquokVxY+wC4GwIvA4o6JuGz791iP60wyvIhztwP19bd5KJUmnW/VR+sgnbgbl/g6C+fc1n7In/Bt3hIvBBCfgrmaUgw5Dcf0NMvUg72lkCJdVrEJChGmyxd0gqPE3rOdc6txN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782353323; c=relaxed/simple;
	bh=2ZmXQtki00OVDs26cp72st4xSOWl+5jurCzLVi+ahfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYd3bsHxNeimGPzep5atzdwxoTCRjmSkXf887FDaZwWjTW9J4aL+W0N+SmtgByRLdHdZoSIG84HBvRDOZyiaJ/Wd/kmXTfU4gun3XOK7QbN/LhlHed4/wju5YtsuDENqvycYf/aDO8q4d+Wo1p9CHaaiguCXESnD62yffkMhwzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjHklYfA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cU5sxb5d; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P25rVH985273
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9O3LqEnWk1hcXZHFecyP2k3xenALgYADP34G52NT1M=; b=FjHklYfA0K9RSFLa
	OTei3cXDstjXL1d4Hmahd9pepTj+OtSDiekco8TXhCkp4NZVLB6ueRZFxXiuDt++
	1Ca7izHT/torJQRVzOtfV0TOhhtL+zvjgDW90UTkMLFRmMxl3rlyh+2OAPamN+VV
	SEyl3X9HUbdx0O3tgRYNh9mS/MZsAGOmfK7cWXWD7XMQKZTGqUprT6zIkQHTv+de
	nqaI7ue2Mdetn+sJNgF2FAX+FeZlrLKRLz1+kbg4zVRxNpQyUb3NtjX+LaAt0365
	pU2loPGhlmUa4O/tS0EDC630k2z4E5I39tXLkQOdP64nDCS8jP9ypeoSitEjdOuM
	xnY1WA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajn2sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:08:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37df35399dfso31391a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782353320; x=1782958120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9O3LqEnWk1hcXZHFecyP2k3xenALgYADP34G52NT1M=;
        b=cU5sxb5dfAYs908pOnZ2RgYn9mJ9qGkPeXCwBK0mF4Du2sIWQSkxUfUnHBVMfpUuar
         +DYzQlO4SFoL1SoeIRzRVz8XOnKB+75v2X1FIRn6aJwW8E6KmvVLQzWedwv2Oj62H25C
         omJJuwNocfn8eAGnLc603e/6aWdwbgPxW4zTYLv7G0JU5LcO6o9I+EnyuTx9kq0Fv7Zb
         DWzPob5bUvtgdsJgP4PS6hmnIGACI0qAmGd6A7Uzb69+kv3ufX6mXOVQbmUFKMc77Di6
         MQR5nAorJL+XgHib0sWY2mfHmD3jNQUGplMib9KvKJcZA5/cbSnjPNRn/X0O2r0om9Ks
         1UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782353320; x=1782958120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9O3LqEnWk1hcXZHFecyP2k3xenALgYADP34G52NT1M=;
        b=kfVrXulwo6gu/wTXVv3qE5OrevACCwFmZVe3FIJnVNiogit0RIeR2JXHR1GVfEjP8l
         e4zS7dw+s2B4PK0/LzXwPsvzW0tZfFhpGOqEe9c95H7maQGGmlB95l20sn8UbQZpv9uo
         k3su2VDGPAMcb3u0XrfCv5nOFoY7UOzTw4aZYhVVS54C3Fp8xoFhdAQoJgCxuiYEgAhE
         M4WFcpJJ8z025EyWV9zyLgZnu+Mz5P5GnEvFLMBOPAOllnNJuGYJAY8efkGc3FT7HTTx
         rAs+ImGpf6/PCID37bgvS6qgkyMqRTRM1FtdvaAWQi0o5/01bz2tMsEbLkOWGaiQuqkf
         9mnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+GBu6UYyP4h7JkLeXglz7X2acCInMsQ1rrJ7EhmUnQ0Muj6wBxIXIleTUa9WVqjZlKQJB9NpQUN+9Cacu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe8AJfhdWHqH3KIHrLZVO6AM5AKzY1zmMPsWotmYLSaBHLeNMS
	syr0HyPUUX7yilK0URBuwGT2s9f18HS1WGdO4NJDC5tjmhfYUXegXxivZO5yHCq2YJPTmHbm2lf
	BMmdErGpFuwBlYVKGmrN4CAG17Gkwx4+mzfngCE2NnHti3gGF77EZVeCGBvs0HU7JOvY9XQnwom
	it
X-Gm-Gg: AfdE7cmwH/ZTlmkP3GLNVdW8mdZNO1fOobJS55F2s4CE+s+oyTYMoT9DgjKwPMp/26+
	/2ohnM3gxAkTibFzlRGQ3DfZZM/S1nzL8r83SwOhw0PFi4kTyyChKdlaOwnZEv1X7+24j85+fsF
	sFar4AO9jBQjulc7RtVbAJADUhH7ZdaQZ48tKOQLvCAFWfKNF9exryDooLf/B2VyEUPt0WFAS7u
	gsKyn6hFivXBZT1e14BpjnAb3himIE/jWzFUsgioyU9tlvz5lGxSJtyueowaC8+bOXXThSvCi2o
	vmtr/cr/B8im8PNDVsL1jWCm13wrQ4XqiDLODfe+q2nPdmzPykdGfJJ9HAv1nEsR6IFafNVwLB9
	adACVeJJe4JoawvCAjKqb308+D5iJjU6U2WhZfCQIhK7qhcxNuYr9nIuO0deA1EC2kM2JdQCylM
	K29g==
X-Received: by 2002:a17:90b:1809:b0:36a:5d43:2446 with SMTP id 98e67ed59e1d1-37df9f107a7mr250166a91.2.1782353319767;
        Wed, 24 Jun 2026 19:08:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1809:b0:36a:5d43:2446 with SMTP id 98e67ed59e1d1-37df9f107a7mr250154a91.2.1782353319301;
        Wed, 24 Jun 2026 19:08:39 -0700 (PDT)
Received: from [10.133.33.189] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3dfdb99sm771198a91.11.2026.06.24.19.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 19:08:38 -0700 (PDT)
Message-ID: <08d5009c-507d-4c01-b888-e28a8c76bc06@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:08:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] Bluetooth: btqca: Fix undetected error HCI status
 in qca_send_reset()
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-12-11f936d84e72@oss.qualcomm.com>
 <CABBYNZKx3+08Ajisy7-sHi0TZJNrbgzBzdszcKfiZUiNOdhByA@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CABBYNZKx3+08Ajisy7-sHi0TZJNrbgzBzdszcKfiZUiNOdhByA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAxNiBTYWx0ZWRfX3apUvDdGHBh6
 xkLQrtsk/HIb6W0cnZ7e3eR3i5MJLPiYFXjVsKfGlzMT400dix+8vnTsbaZxK9xJDWUS2dB373q
 o7Vy+yF7R/NP2ugJiFeHkOKSon6S7YQ=
X-Proofpoint-GUID: bUi98W46q9mEqAAQ4dQPwvVHDFWtDbAo
X-Proofpoint-ORIG-GUID: bUi98W46q9mEqAAQ4dQPwvVHDFWtDbAo
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3c8da8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=reVOoFzwNVHCOTdQRKoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAxNiBTYWx0ZWRfXwXzUoTWvLKks
 SXMlUKYuSMOvN9G52uGPUV6eyS06YO1QIebwb1vTTwWqasthrqI9Flr0iLoM/IyCrwbvAdzbVuP
 UnPiWs62XRwAwQEk8C0r9LYtlU5kbHtOcg8UxZ54x3Thscy2L0xICCRAbn9MaQLsH1JkgOLABJS
 ogtCuKnqv87LrfHoB00SIB4rZo7k0zoIu1zkPRQnPmZLBzrZTUWBGEPWKhCW2qaA3BF3DvHS2cX
 iYrkAZfzufNTiuLhuU2eTLHJxMLAsCcWKEdKO9W76GZSe4jEy1cEAXzgErLwdzotzE5PUBUOxIC
 PJdzxXBOUk9x5hIVAIZd5EatHMUL80lzIsEWUu1dm3+N7xuFhMMPRlCDgTJcY7A5w/8dexd3buz
 xbEHhDvGbH9Tfnds/YulNlrjcAofe0Xjv0NNS0+c8n1EAM7zaZ6QHjHLymlYvL3kb02Mp2qebpa
 KAxG9GGcfEnoPfUeU9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250016
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114437-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luiz.dentz@gmail.com,m:marcel@holtmann.org,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[holtmann.org,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F09346C2522

On 6/23/2026 11:15 PM, Luiz Augusto von Dentz wrote:
>>         u8 cmd;
>> @@ -990,7 +971,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>         }
>>
>>         /* Perform HCI reset */
>> -       err = qca_send_reset(hdev);
>> +       bt_dev_dbg(hdev, "QCA HCI_RESET");
>> +       err = __hci_reset_sync(hdev);
> So All the fuss about the reset is just to use it here? Actually the
> distinction between -err and status is rather important. The first
> means the command didn't run (timeout, cancel, etc), or it did run but
> returned a status != 0. If you want to capture both then you must use
> if (err). And yes there are parts of the code that test for < 0, but
> that is either a bug or they are intentionally ignoring the reset
> status as it is probably a non-recoverable error at that point.

  1. Agree: > 0 for HCI status code (controller-side error), < 0 for command not executed
  (timeout, cancel, transport failure). __hci_reset_sync() was introduced in this series and will
  be refactored to follow this convention in v2.
  2. Looking at drivers/bluetooth/, 7 out of 12 HCI reset call sites in the init/setup phase
  silently ignore the controller status — not sure if this is intentional or not.
  3. qca_set_bdaddr() and qca_send_reset() will be fixed to return the HCI status code and let the
  caller decide whether to ignore it.

  Will address all of the above in v2.


