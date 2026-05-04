Return-Path: <linux-arm-msm+bounces-105634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDNANZkO+GmVpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 05:12:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440C4B8299
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 05:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53DDB30071DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 03:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB9F1EA7CE;
	Mon,  4 May 2026 03:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxiaRGK3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jil3vgi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF8417A305
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 03:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777864342; cv=none; b=ONxAXgisOXGAKtfQtzP7ACYuv1DlDUoDBuLjhK53Glepo7Xk0H+haM3TrfxdOOcw9TG02lZmtyphlqzQ/N7SMIQPOxiweLS3xiM4O1Mk3t0GIXUlmUrE2MV9s96iiGNP5991EJnZ8f9lZ1SToaLlsUl4bC9+5Vqfa326W+CXM5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777864342; c=relaxed/simple;
	bh=P68befhhxhqcTzhcRO7ofjaz4zEoUjfNa4QebSgS80E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGzpzC08ptZGoUvxwtoeWDLY5FjFTWITYb2ygoaMqeWpKoWVAYxU3S1cK3a3GQW0LwXYuWNlnFjMl+mmVVD/8ox+i1JyeGNYk7HhllRr6BHo8bT4gVq6eUhfNOiahl5lvVJzDB48jiMl8/1xLfnt+6/MHlym4YRiZAN/Xf4xJ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxiaRGK3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jil3vgi7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 643MQmpV2520860
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 03:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BGVcsn2zQo2wT3xqfjcUl+aUiGrUOA4rifEuYnlFm6s=; b=SxiaRGK3/1KidHkw
	vSJf5FbwtMACkComTtQpHYaM4D+W3qIEE2aa8xke3npFHbuKhA3nadryqaYd6Gui
	6RudaMp5V8tUOseIMJdJzmu3m5wC/GD8U+7jqduseyG0t4/0QSTYLCw/XlrcwDZE
	SbfUWcBi3XTnR1pVgkrf3L1/AVe2qh+8iLdZxRXG+lLkuZiat1k5QQ94PHCR3xn1
	tvihEjUZquZD/OpBhKbtJU2DWrC17IRayq/mXFTgt//utcq3j7P1XBjwb6WL7JOf
	bqfRo0JXgPu3PeUYyVsvzttzal5ikZJcXuwoNLiz8DZpqLibLBpcaBPk4fuaHP29
	J+Fjkg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3m2ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:12:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso2125134b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 20:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777864340; x=1778469140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGVcsn2zQo2wT3xqfjcUl+aUiGrUOA4rifEuYnlFm6s=;
        b=jil3vgi7u1dsQM+LmMoG1xN9sVNDqF1KS5Ha542rMefX0eGLYyW4ujA/tnpd8jeYW9
         0B1PFZjIoLXEtCM78NzfRpAnIQbLk7O339ufv6te1h5z8ZAkGyGo4ndWSycrH3YIxVQs
         cVtoGKuUc2T5g/2E0XBP8ceiJJm6t3vlsnfhdcZXdgJZPE3BhoVIUdedGjBJGey5BiZN
         NZdulvteMw5VUKy3/lGou+W1sdlgIHOqjLo7htQ4xHSwviLrJ1BcZDCRHUmU3F37eKH+
         xih21b/j9rkK95lIN2kB9JpDq6lUBOOHsS8lS+FKaYVTLmHhi++3UJHnV4uzNSrAbbFN
         ouow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777864340; x=1778469140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGVcsn2zQo2wT3xqfjcUl+aUiGrUOA4rifEuYnlFm6s=;
        b=m2uKpLE4LHJVwjEKwwgcAL2x7BRXO6VuAnvcFl4MBOmkRXi+9zr2XXd8x0FiC9Zg6p
         N7QuKHaA17/G0sprrqZfKwFQRpV/AeNn2tdDje4jQA1Ep325VGpdyo6xjwXqKjdnRhE1
         0cumGIgrHWDfRs7EykxT2ghl25bWL/6iNGrCzvP/4K7kbe5GQSYQkPjjYiHJ+89v4pld
         ihSc/9or0DSGb6U1PdLyNMRRN0Eocpnwg3y0IbZOjeBCYDxPLSnzwRjDkU4TloyLLCAc
         hf8H/w+aSGsrft36oum5wMsz4WtqlO0gNKvWvfow1tbuRL9diEQ2UeZbATln+hlgSkPz
         asUA==
X-Forwarded-Encrypted: i=1; AFNElJ/pQQH6RK/LMZbLrtQkiRZK/GtONPgApy6APrLusa7XmNlPxmgAadJVyqP4FPZ6wTpk2htREvQybnxLI1Xr@vger.kernel.org
X-Gm-Message-State: AOJu0Yymbw4rpfCUt0N/nFpcQlnhF23pf1gxHubWFY2r+bJhje5pkMGx
	bbE0IsR9pXdpCYNTqs83VnLQaKykfcMvD5sqwKG3MoAnzzKCfAdKC4E1LD+bFqVsxbR2TyoV7Q2
	W+lEH7MCgaTpWCCBrJLnU+wRBD2NgR51XVuneSj607BSBbd+hw+pKZcU0AxiIUKaHhOKG
X-Gm-Gg: AeBDietqoHK0aDE/xFkgLXQkoMJDQ8iA9BfXLBOa7o7ZWu4SS1qZUyubfHKiwmKq3l0
	xn3xsokgRBfZbUyamS8wGlSnIc3Nlmuofp0pKeUaKQEbzmpTqTAf4DVjm4fhE0KUFlXCbiPPFko
	ED9fSJgkMVSSe5Z+3oGEfVHuMG7EKW41NUkctISw2Qbvwf4haKHA8y26mIjKdnSCJdbNK0rPxTt
	uohtjaxeQx160XMDBM3DSV1HZPnIa4XyY+WpAyOwWfDjca2ks6mgs5lB6LMQUYGQsrrfuuJdXo/
	/8FIo5CdiweKjlat9D3xIDcVbmVfpQ8nVMpu28qMcSCMa98cCAvQKbSY72kH1d5VwhDBOwc4RJV
	6SaNODPTkLZHHwG3fN4M/NcbAbXdMY6ksNN9wNJUMPGD/09QlK/jihFEtxPRCXpxV5964qIOfPi
	VjWulWAa20iDtCdhnQFQ8/eg==
X-Received: by 2002:a05:6a00:ab89:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-8352d02559amr6977726b3a.7.1777864340296;
        Sun, 03 May 2026 20:12:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab89:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-8352d02559amr6977689b3a.7.1777864339734;
        Sun, 03 May 2026 20:12:19 -0700 (PDT)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm9994115b3a.51.2026.05.03.20.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 20:12:19 -0700 (PDT)
Message-ID: <5c2c0f79-3dbd-41a6-b0f6-fd6b7b14b2a2@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:11:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scsi: ufs: ufs-qcom: Use quirk
 EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260501131641.826258-1-can.guo@oss.qualcomm.com>
 <20260501131641.826258-3-can.guo@oss.qualcomm.com>
 <326ac80b-c433-42a1-a18c-3979f7abf1fe@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <326ac80b-c433-42a1-a18c-3979f7abf1fe@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDAzMiBTYWx0ZWRfX0JGULsjBoCfM
 upWgq1zGpQ4UnHRZkX2JD+MaQRRS9OtzmM+7GyHeaaof+7wdOUmbijRh6nGnssSRx9vpanrHP8v
 7b5M515xlduY9AMUlrflPFg0MjAzr3KX+5HUqlBAvmIdja0121t7u4Ze5rPmt9wndayiW50g05X
 g7tsoOgEXQusOQ6fh+UUeenbkWia1kJxE3rUIL0GsfUtpfDvHzrX99UvubZxxZfc7WQgcT2UQBX
 DYJ2xtSWXKkJGdyhNEe4tJ1JyA105yFNcWvGl0LEUnes9YKQZSqHsdlnRA7ucRBZouAlwFV8eN2
 BztXDS5ydQnjSWxog8oHOH8BLNnOLqEipIzILJlWxeA2vDr2K3AKZXPaBUygwAiTQix9j4vxhb2
 FxCWB0v8N2YRcuX8HT44ysb/uFJ8ZMSpU392+M32d+zyYHlJ7nCTe44tmzFyAa5xwElJC1640z9
 K/jZ4bQqWO7LzwpKk/A==
X-Proofpoint-GUID: wvZjXKYyeurvOnGqjmG0-Vk4o55q3rPS
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f80e94 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=M61v9sag4nB3bsDLzKIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: wvZjXKYyeurvOnGqjmG0-Vk4o55q3rPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040032
X-Rspamd-Queue-Id: 3440C4B8299
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105634-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Bart,

On 5/4/2026 11:06 AM, Bart Van Assche wrote:
> On 5/1/26 3:16 PM, Can Guo wrote:
>> +    if (host->hw_ver.major == 0x7 && host->hw_ver.minor == 0x1)
>> +        hba->quirks |= 
>> UFSHCD_QUIRK_EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3;
> How about future versions of the Qualcomm controller? Will future 
> versions support this feature?
Minor version 0x2 might need the same Quirk, 0x3 might not. I don't have 
a real HW/silicon with minor
version 0x2 or 0x3 handy yet to verify, this is the best I can do as of 
today.

Thanks,
Can Guo.
>
> Thanks,
>
> Bart.


