Return-Path: <linux-arm-msm+bounces-92489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC+UHm8gi2lBQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:11:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707A11A927
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C20D430117D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0654A328B43;
	Tue, 10 Feb 2026 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZ22dP46";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eL9uYyMr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA313328608
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770725482; cv=none; b=UO6390KX3YvBZLBqOshiZcjgvbqSiHub5hm7JXhTrxeG/nwsFgpWKSRoNrwzl1FVOiAy3FPLrFeo8EhoNw1i0SN30mzI7XQfbXA0C+lpCGlP5QyHguw0IFIFzc9BJ5/g7OgDoW5zV+a5KU1HddOTKN1Hnim4fmyHcRMAeNEv42Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770725482; c=relaxed/simple;
	bh=142drCgTks99HM430Xd8Lb3C78zqfH13zuJmV4x4yyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQWScwMBI827GAtNq2jJ/Rqbo1scn7SVzXjJSaN8viA3zKmatW4pCOPSXBxTiBC21ksvwHBEYU7CMQVF+jm3cNAPhzNBiFKMf+HfFLinCjt9nk5RbLg1wMIouNBs/uz1Z0TfPYcI3FsK1+e8e2GuwQCSngKDW5ZD9awKVcIbw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZ22dP46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eL9uYyMr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AB01ZW1940314
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLIqZx4pR3vXekB7QkxU1CKhDizraSJLDhVZT3DZtRo=; b=dZ22dP46UUv2Gghl
	r1Ja7SlBT8d8kqDyQCX8tji/YlhrKjCuVJhL7GWxclGSWhXJamwBH4eWdbdevKVj
	yZ90BNb++Wecw5ZoOgzl9APp0Eq+CRmXAGiUMfvl5kdsujmNWbtHydkZAy7S78LM
	E7TDH3aOd695/se0PSM+ejkPq9x7faR5iysFon7ipoOVZ92HggS/YxCS8poDcGsR
	9KAbTEJueJkL07uPTXadH4W4ad1dxCUyU5FiYsUO3OfVuEa9Cq5ncDoJF3tVdeI0
	Wq0OFGXuBxoDTBwu3ANpBjdGA4/gYDP8CwcrmXG3A2aM9dLDdT8kJ8O/wg6bxnbf
	u1vbWg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7w1jsgd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:11:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12721cd1a2aso4816626c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770725480; x=1771330280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLIqZx4pR3vXekB7QkxU1CKhDizraSJLDhVZT3DZtRo=;
        b=eL9uYyMrS9N9BiQMbTxK8YMLarYOegLDCyhDALfpcWA0PDr50QQDlybMRiw98Q6CrO
         JKnBX8wUe0yuG2RA6DORIsr0gVnB1ESyaC3Dpyhv4joQ+990Ruv6g6uVkNfPY+JVwgNo
         WLggreaUEzMzavEwd8kRH0k8W8O324iqwjo0SUTKYgjl7Mn85JAcS4rStOeH8s4bdh7z
         jzg8YYWmUL8uZWRn30t6L/+DGdXeT9W8NpayUNTYRnmqPoVA1WfIMSVEHM0p+BlNoyD8
         BvkqWgCJ8ogTTlWj8P5cPzgEHgW9LcuKbqPH0P0BEdIv8WK8okdQEHYNEBOZXZFIEZvY
         lPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770725480; x=1771330280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLIqZx4pR3vXekB7QkxU1CKhDizraSJLDhVZT3DZtRo=;
        b=lImygzD5VnocQSW7PG+CNpb+TkK1FkqsQJTx43J66JtWupNl/lH0NHckgbhDJhhdpS
         jInvzj8BxatVB+oU0n+zimubkzlxGHjzuJuGFEV/decrbPoQVXgS7MfnjSHmw5o7hSif
         osyIQ8onyLEj565FKF6ZkKwGdqv+w66nGTYAEmzlXxurrM1CU5x5EYDVp5r47AHF2C1N
         TmEls2X8yX4G/e6L4gqWt241dPPf1PKxwv+iOeoRqmpNtCl3IxRlaecH7TcyXX/E13gr
         rx295mW8TzOsRgoCYffbp6PKk0b/PCU7Y9rpSYopsWLzG5m+Q70MCMmpFD83tsJOlI3d
         S3lA==
X-Forwarded-Encrypted: i=1; AJvYcCU899AmtFMKFZP6URtiWFyxxPM3gS9DVddcQENYTUAXtB/OG1euVawNBS3ANcXuQRnaGD2wff6hOzIwYdf7@vger.kernel.org
X-Gm-Message-State: AOJu0YyojLGO447dN/eHeX72fYZWmSiBEvRV5K+FfzusEyPZkqNTQn9O
	7xYlQQJ5cOv8q9jSq9g5yhgBVjCAD4l6Fgz/nh1fideoLsXNfDr/wnTs1whECdxTx0uZDGrqOUD
	l8CkTGsnEYIKBTo2f6xKYGZQ0wwZr5biU/BKU/6QXzqypClsjZpMkLC/uPK0ftRhniSVJ
X-Gm-Gg: AZuq6aLb83it7WLaf/vL74FiqWDk1v3cO2m04cfQVvAerpMSNTzDJIJMqh2rsQDeaOg
	WjQ2m+rW0KEQR9ZzkFOM96/FH/RG6CH07rVlaTi1v3PcdiGSZF3L0aX9QkWpVSvn0mbtNlptmqq
	m0sv4wamO88tnZI0GHKXNKVbW6hJaB1ozbGzPrTMV1NkD28WvMVBs3J59zapQZ6zn1vc6/UtDE4
	sMce9swBQ159lsn6KQznWQrGewv8HCdgyTiaY+j+VSdijgxpkvwo2/wKjHw2AxCh1VIjQVBI/hr
	tIXRT6sgbgO2etE0YFVcVU32yISPseqXjK3PuEaqhsX1MSQUTxWHIK3AtVQZLtSok73nCy77RNQ
	Rt7bAZhLeXAokG4kfK+T+/U3dg5+mvshkODxZgNX3VP5W8k3e
X-Received: by 2002:a05:7022:910:b0:123:3461:99be with SMTP id a92af1059eb24-127040153ffmr8274122c88.21.1770725480344;
        Tue, 10 Feb 2026 04:11:20 -0800 (PST)
X-Received: by 2002:a05:7022:910:b0:123:3461:99be with SMTP id a92af1059eb24-127040153ffmr8274090c88.21.1770725479713;
        Tue, 10 Feb 2026 04:11:19 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm12883089c88.8.2026.02.10.04.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 04:11:19 -0800 (PST)
Message-ID: <cbc0b42d-fb5f-45b8-9074-d0bcc64a9de1@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 17:41:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] Bluetooth: qca: add QCC2072 support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
 <20260209080613.217578-3-vivek.sahu@oss.qualcomm.com>
 <CAMRc=MfT7ourMH+ShJpnBAjv_uOb_ds0rxJOYaz_HsoT45dJYA@mail.gmail.com>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfT7ourMH+ShJpnBAjv_uOb_ds0rxJOYaz_HsoT45dJYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QCs1COwXPmqVqKErgp-eUt4s5NOk7Qwc
X-Proofpoint-ORIG-GUID: QCs1COwXPmqVqKErgp-eUt4s5NOk7Qwc
X-Authority-Analysis: v=2.4 cv=YrIChoYX c=1 sm=1 tr=0 ts=698b2069 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=HN2rxSbq-rsLsfjk2icA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwMiBTYWx0ZWRfX0xhYOFbBiwye
 qjwQy7aK+HqjYp8Ut+/hPTkXHy+PkhqQdCdhk+eE/NHCzywIwQuFp21TKvv3ujh5kWHPHhMGn1B
 o+czmiS+vVE+q2nCm+Zh1TLvFS6N/UWiTEwEOycrKUt1Ub5dN3ZqlOoIDgLbNh5S/nfK2S8lhmr
 SHw7L9JrR1LuWHqtJUKqUB+yQUx10og4ecr2nhBqQSEKC/zIoKTyorn7vRZ2PuBXVYB/gOop9Dp
 SJHeVNKK2E8rKaDksWy4MvkChkkaXsD07ifFUHD//ufYuqkMB7cmn1ldmJH94h8fqKX9SQpXqDx
 y49vSadKjGAqnMIQifRP5v0w9tli8VAC/hZNe6NpBcGPwo/H9n+6013jmDpuLMuABFoxjrQ+X62
 y4ZS7kVegR6DlYzcJUTTgN6WDYvT0b7NEPcDScqiQ26f9fVaWpj8ME/wglOQadJlpievQ3EtR6c
 iPDaV80HKXF+T8JTfqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92489-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[quicinc.com,vger.kernel.org,holtmann.org,gmail.com,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6707A11A927
X-Rspamd-Action: no action


On 2/9/2026 5:04 PM, Bartosz Golaszewski wrote:
> On Mon, 9 Feb 2026 09:06:13 +0100, Vivek Sahu
> <vivek.sahu@oss.qualcomm.com> said:
>> QCC2072 is a family of WiFi/BT connectivity chip.
>> It requires different firmware files and has different
>> configurations , so add it as a separate SoC type.
>>
>> Correct the sorting of other chipsets for better readability.
>>
>> The firmware for these chips has been recently added to the
>>      linux-firmware repository and will be a part of the upcoming
>>      release.
> Something is wrong with formatting here.
>
> I would personally split the sorting and support for the new model into two
> patches - without and with functional changes respectively - for easier review.
>
> Bartosz

Yes, I'm now splitting this patch into 2 parts, one for sorting another 
one for new model

support. Please ignore this patch.

Sorting change has been raised with tittle "[PATCH v1] Bluetooth: qca: 
Refactor code on

the basis of chipset names". Please approve it at quickest so that we 
can raise new model

addition code changes on top of that.


