Return-Path: <linux-arm-msm+bounces-118651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6MO0CuySVGrGngMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:25:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0B7481CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:25:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EuZVA2il;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WyvRPsNn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118651-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118651-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19E933022A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78632369D59;
	Mon, 13 Jul 2026 07:20:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3782136AB54
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:20:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927210; cv=none; b=MUoWFCvI14HwQLpTDX/y10Rjiwj/z021cgUBRGXi5NFA9vfL2HxSczflJZWLMurTRyQlBzWVXBTeoW5qP4Eg/g7h93e+78ClW2YrRCpCx1v5l5taWcnavTI82uCEidyG7KwPh7SgTOxaHLMoXdMuvqwz/80/7F4NtPXjPUXs5ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927210; c=relaxed/simple;
	bh=ymGVgCO6OEArl2cJNNpQKOHAWyU+qbKaglywmHSbgp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KkbFksdgxgz1JA8fkPpqQGIRsrZTmDc/9/8bVLLv4tbNcyckakj0gWeZZexpl2KatprVUGmgEmRplllMmwH2SpLUO0D8JzTpepKR5t4isofD2PPgrK2cX8GeRWYIiQ2sf5ek9poSLV+IYtfAwepV6TUJLPogFRyAG/0Ky2XJTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuZVA2il; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyvRPsNn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77Tol810602
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCDChNA9Xvl37VAmNthtfzvgdA8yOF5Co/p3kft3pP4=; b=EuZVA2ilIJ7W9Zfq
	0SzjCDO/PcAiEsx2dRJnLfsG75isPyitJGsGwVki7RRBBvH3J6JhjaDnrfuGG/l9
	0xp1RN3OBZ6pM9pqbQGEC4oI17VutZUaKtKlZnQz8s+xho4wW42C1X3Fly/Dn7Nq
	oZGxU2E/BLHMTMF9auRqg2vehrPYQUFCDaKsOFArerxEKzFt5npuI4l4+lUYlnqq
	f65nxCgn6L7AEiNocbfcDp40Xema3Q3auYRoZa5tdp13VtQREGjM1bOAF7xAZ/4j
	EjizrQfJHdl+CW+1nUwLkFXIjUQQ8vjSu5EFXGpU+GrBXQAzQDF/EpjU7MLiyvBo
	QLBRsw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsr1d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:20:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so4492215a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927206; x=1784532006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCDChNA9Xvl37VAmNthtfzvgdA8yOF5Co/p3kft3pP4=;
        b=WyvRPsNn8Hqtjt6nR9EeVWzXa+PgXPQzYrLPqtUtD9ddWyQlWKh7yS6aSeIcRzK3Oo
         w28Eu3ZZuNcCx6Eh+JzBEDExxg0AaNiBVOV3uvhs9HLyZRXwKYztxMpGHlJ5HV6HjQYX
         BsLZnh2n5Rr25dQ4EGOSBz/wpkOvWuRe3WOyYviTdJm52zpw2LTDhDDvtgtb6DlT4o9r
         9W3nCkBNykY9CS5JRHvE4A0h713ByUfdY9svEzUi2WkN/c8480OC9jZANiOOB6NHcA9n
         rdxHhDO4Sg/nOGw1+kfCyluJ4LLEPHO7El4inta1ndOiBTyOxaAhehUaYY/5BSaPQnrU
         I+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927206; x=1784532006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCDChNA9Xvl37VAmNthtfzvgdA8yOF5Co/p3kft3pP4=;
        b=BRu9tj+k4i7b5os05JGsuesKDRgey1oXy3h97MaF+n17kSotzBuVSFJrAZ63fgGFtG
         hGw60LsiLIJKTU7MFCH89guJZm7PvyjXriTn1JEJgRFT634OFGDsgOoKRAGK3a7VcEpl
         Yxo+L7HaCgzcefxZ0DM9dJEtyRRJz5SYtHEcMrEw6Y2kGEE5ddzG2+8bqpULl8i2cRkx
         x6twT2zB/M6JbxiLFQPVe3vSqRGvjdM0BqeYO8O+S6gOkuMsXjotlIWpynCO8CfMjxP+
         ZaX2Cg417yhc9dg/vceALuPgAPvVFwcU2Y/KIsuIg0XynfQLv9J1hl46eNXH3Yjj3SOl
         MrvA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4gAEAYKuZbQocAo2mMefIEKmVr3g0pl9qDj8D+sO+4LxGu0jAHfma3TkpRAiZwAc/A/SbipCsl+rK3eOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzA6t8u1py9qEY2VXP8tIL5sKPx8Dd3RsvmAPdaAaj7AR5jU+hw
	atudNSH+0GLkJ4fG5iz6tw5xa8kAIXX2xI1sG8WefL7YOfQqmg2xiIVuUHHvNfPQ8OLqoFmmOfE
	uiFWOnC8fDBQtAJi1A5Yjdbj39nce4QxNd9AF/p7A7UrUNn0mNnYu/J2/pevQlOjR3zQL
X-Gm-Gg: AfdE7cn8Md4DGWHiTsE4CjmqIW6NQnaXvOh7rCjngH1fHqSuVbcwnvaTpPpOatgy1+Q
	GbZTNadJRVeP+SOYdS0y75d1FA06BMbJ+wPz8m8C/KIlM1nJAYGaBFmJ/bj9fS4gKXMvish4f+A
	/lZwopeEotoFeoW5gRx+oMTiyWV6W7OvyqIRufC5b35LyOmpK/cCkPqF9MuJT9LRGKZ32fBxXFR
	KbRwn8NzE2GS9vwj5foGR2SVskUJbyp/x3daCjQ6OrUryQjc7K/JIIL4m9+9eCN27Qyl/UNvCPK
	ThrfCIHjgZG/kO9vtwNJqEV4mJPQNtoPgwfghOk1bJci9Hv0/Lnuyjthkdkr0LChsKeDYIJatyu
	DKLifRG/R4yunEY3WlW+MzbvqxBsXQrXHxuiOI20o9s0=
X-Received: by 2002:a17:90b:4c02:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-38dc74c4b29mr7787322a91.4.1783927205730;
        Mon, 13 Jul 2026 00:20:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4c02:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-38dc74c4b29mr7787302a91.4.1783927205229;
        Mon, 13 Jul 2026 00:20:05 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a583a16c2sm6071162a91.13.2026.07.13.00.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:20:04 -0700 (PDT)
Message-ID: <05af9d4f-ac6a-4a7d-bb7a-41fd50fc9935@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:50:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] Add documentation for Sahara protocol
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-1-3a78362c4741@oss.qualcomm.com>
 <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a5491a6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=s-wG5dvStlP9jbJ101gA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 50-a-v_pgTRSeixW3IGoMX44qYWgheJP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX9OeIkAnPNIjN
 js9doJwGNKIAPsUda4wwAyKioenNBRKiihNy47kTu69Pdcc9leQcUV2k6myC4RS4Ed9m0WGGNsP
 4cWcgxbYUlAutIej2m4i821SARqjdys=
X-Proofpoint-GUID: 50-a-v_pgTRSeixW3IGoMX44qYWgheJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX/Avthdo1Vmyx
 UEfMHAcxs2ATG39v+CrVH8rnf02Me39FQhP5NX0ZOfWkU+g2xy/i74CI18FfU2rX0OZE+JY5TAl
 eZQwveq3mZsJwNk7qZ3+5+OHnLsd6IyIg7UGqet/PSVRbdKq3bYg2xtVKq2jS2HiWtJdMhFRaJg
 dk2CntfvcmnAgIeFotsW+ouGWPtC4N1VoU1rJlPybvplNOvSerz8pZgieyuS/8TO0lGJZMX4QGr
 Ys1g9jXwbK9ODHn0xE0tBBuVd7/x5zlOFma0wKpp1dzl6ZTUAhMHSlXybwoAr0wT1XdrjTYcNGj
 LSLH9PuvQppZidux1qRS3xmPggo5M4ONKTcL4cp9azhbhNcUriaHNXlMMW7AOQD5ngq8zuN5x19
 yX4zQZBM3V9uSGIctot94xz8EAJQDSVrQWP/3zZITTJJ6mwhhZwyfFg/EmeqJGhIRt6rJEHUX0F
 Z32jBO+XzUtQ7odQMwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118651-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8ED0B7481CA


On 7/8/2026 10:16 AM, Randy Dunlap wrote:
> On 7/1/26 3:37 AM, Kishore Batta wrote:
>> +The packet flow sequence is as follows :
>> +
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
>> +
>> +2. The host sends a hello response packet with a success status and sets the
>> +   mode to image transfer pending after it receives the hello packet and
>> +   validates the protocol version running on the target.
>> +
>> +3. After the target receives the hello response, it initiates the data
>> +   transfer by requesting the size of DDR training/calibration data.
>> +
>> +4. The host sends back the DDR training/calibration data to the target.
>> +
>> +5. The target decodes the training data and does not find valid DDR
>> +   calibration data, target sends END_IMAGE_TX to interrupt the transfer.
>> +
>> +6. The host sends DONE after receives END_IMAGE_TX.
>> +
>> +7. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has
>> +   not received all images.
>> +
>> +8. The target executes DDR training process to generate valid DDR calibration
>> +   data and prepares to push back to host.
>> +
>> +9. The target initiates protocol by sending a hello packet with COMMAND_MODE
>> +   to the host.
>> +
>> +10. The host sends a hello response packet with a success status and sets the
>> +    mode to COMMAND_MODE.
>> +
>> +11. The target sends CMD_READY to the host.
>> +
>> +12. The host receives CMD_READY and starts to get command IDs to be executed.
>> +
>> +13. The target sends CMD_ID = 9 to push DDR calibration data to host.
>> +
>> +14. The host executes CMD_ID = 9 to get DDR calibration data from the target.
>> +
>> +15. The target sends RAW_DATA with the payload which contains DDR calibration
>> +    data to host.
>> +
>> +16. The host saves training data in the kernel buffer and exposes to userspace
>> +    via the sysfs entry. The host sends CMD_SWITCH_MODE with the mode set to
>> +    IMAGE_TX_PENDING to continue booting.
>> +
>> +17. After the target receives the CMD_SWITCH_MODE command, it sends HELLO to
>> +    the host with the mode set to IMAGE_TX_PENDING. The target and the host
>> +    repeat the packet flow for image transfer to get all booting-required
>> +    images.
>> +
>> +18. Upon successful transfer of all images, the target sends an END_IMAGE_TX
>> +    packet with a success status to the host.
>> +
>> +19. The host sends DONE after it receives END_IMAGE_TX.
>> +
>> +20. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
>> +    it has received all images. The process has been completed after the host
>> +    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.
>> +
>> +Subsequent boot scenario with valid DDR calibration data
>> +--------------------------------------------------------
>> +
>> +The below firgure shows the subsequent boot scenario with valid DDR calibration
>> +data process being loaded from host to target.
>> +
>> +.. code-block:: text
>> +
>> +                        Host                       Target
>> +                          |          HELLO            |
>> +                          |   (mode = image transfer) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          |   (mode = image transfer) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |         READ_DATA         |
>> +                          |   (img ID:34, 0, offset,  |
>> +                          | size of DDR training data)|
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         RAW_DATA          |
>> +                          |(size of DDR training data)|
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          | Subsequent boot scenario  |
>> +                          | (valid calibration data)  |
>> +                          | DDR driver configures DDR |
>> +                          | using valid calibration   |
>> +                          | data                      |
>> +                          |                           |
>> +                          |                           |
>> +                          |          HELLO            |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          | Boot/Load rest of the     |
>> +                          |    images....             |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          |(mode = IMAGE_TX_COMPLETE) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +
>> +The packet flow is as follows :
>> +
> s/as follows :/as follows:/
> in 2 places.


ACK. I'll remove the extra space before the colon in both places in the 
next version.


>
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.

