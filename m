Return-Path: <linux-arm-msm+bounces-104705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLDNN9dL72lO/wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:43:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88641471E55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D53793007514
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E9A30FC23;
	Mon, 27 Apr 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJ2IfnCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBHvqZEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4B30F548
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290195; cv=none; b=r32vBamKUGRHYOdD8tgkdSUq0chthF97TU3VTLzrmjSqsSpU04phOvPGSvD1gQpcL21rM9EvuBnizvYv5Bk0C+Xs5V72TK1jZudmiHG4RnQdKWjZWHTDCT78dSn1nZeN5dxtXfxkQGFSBodxQ44dOh9HAIQjMkhKXVW031l72pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290195; c=relaxed/simple;
	bh=G5RUyLgIJK0StdQqxCt6rJ32QTdyUmfptQjJ8okcTvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCvv1bFo8DX0wsMc2hZ6BEDK/2VlvuWahgCwcH/biEV5qTT+pQb5WzD8kN29woZIQkI7LRskAUcUfJ5xnhsAwKo3a09tSTWODCpobvsYNB0PZt9vXq0xae3cVItYGvoaBYPWwIRnz+DYVGrR58PIAqh4Rd+S3fjVLv5R2IlhsEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJ2IfnCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBHvqZEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TGZD3682681
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ua7ycgRvwIZDbc9nwX1KfGg9u2x0xaBDwDwKsygwWIE=; b=CJ2IfnCweOKNz5aP
	fRC8HHsl5dxMGnz0CZU0YcJ1m6hR3rLst7lMC7iZvnMHmIXM+0NLzul0SnOLwI5P
	qq7yXWAtCkwcaG8sHhyfKMsS8GEZ9H77C1vQMvemkxqCZaJEg/+0dIYkkSzAhOcq
	rFbttvM9m0i8HnLu4OIK9rMjf+yC+RQSls1SU22B1tm3ZGUKgvMORk3XRfgRsvN/
	Ee3gEPeopAdVcpLRc0xWA+y6V7LfC95vb1O9CmxdSmqND1Wr44UWoMDxeTW7BJ6W
	NJho7RsmJytXLkpIGB+wuryEtakIKxwYZsJyD6/O8dpLbxGcNz+Is0tB5ZVS9Z2x
	qpb+hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr5wdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:43:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b047093195so18702956d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777290192; x=1777894992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ua7ycgRvwIZDbc9nwX1KfGg9u2x0xaBDwDwKsygwWIE=;
        b=PBHvqZEZv5cB9Y7/f2AElrWf2YqRjVwPEmy6xHhu9qJ1DXgzIUruW53JIxDlbTaUPa
         1BDk0zVhHnwDHXV7nbsCpCiV70ju46Cp6peGjyqzkh5AyPK6nGwsbJvXmNBdgcRpE9Qh
         Bjd6+U39TQXsO5rBqBxo8MO/gzCEpWGx2nya+dnsT6IcJOXpPXcklsxDqW5PmKOQWqMR
         9iIrO1Y83Kql5PP5fexKW5dNz78uokGwmNSqOkpJsTWOU3YeomXMcV+RinUNtPvFxmYp
         w+tVsUzvYyZPCgFuP9uP7oOYhoqv6SBdk4nHE5qo7kTcgapBCS1MIRNCM7sJRYDiqCPI
         YgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290192; x=1777894992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ua7ycgRvwIZDbc9nwX1KfGg9u2x0xaBDwDwKsygwWIE=;
        b=LL46knjxneuSl6da9wJVtEq6DJZdg04u8eQkvoWIubniXOwLVWccvSCImZxCx1985M
         TYWiXPk+/AOS3CxZow42mRt3SVycAyORQ040T41bX7giT/zBerUriG1F+pbK9Vnz98ce
         uL7Qc62vOE/sxbLejBh6wxCHZWWDtewyNsGqcmb4CWnO2pltydhLko/oPORvqcXDDEx1
         aoyzK+hChYg9t6EgNWo4LrFJdWNLedcFUVS0JC/p6RaEqFOZ34T2fbrBoY7TjZ8/W56t
         Dy0ZNZBlCYGeF3r2SG8GhZA6yXoA7vUhHae9goR0uKobAKM3kEHatyaCRfa8Rjdat+mZ
         F1wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VGgHyaned4j8iDRdsSrza+LkEuCcsbmBmbvn3uAlvkOBbJAjw1wXyGIrklzyOgsL2ojguj/8Te7IH3vgG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+oYQKHZBz2I1d0wdnezXK/fb9uCAvsX7miSlU62us/4g3V/EE
	1SUmC5rKCL+8rcvM/hRVKmTkx3YzBBYVgGVUJnOmeofcQjL+f2WuynjpxzV5qJ3hYatge7Mf9/1
	KyUgOmOr5cR/u183sO1ag13ns8vb/SHuCMmE5PRsoeOCtyrLM9j0+/3eDzixb1/0NtXqW
X-Gm-Gg: AeBDieuZTcWH5LZtopQCvXWXpX8KsnNZ9o53GivRgKsPoh4usptuMXj3FUeA0qudxBg
	h4VpLXuMdXX+1d1D9vYC9XcrcET/+mhV63Fe+zybve02MKeBIvg6kidWdkrBSwXnRiXmccDgd+f
	jDdqAtcLQVI61AIYxKtDjh+90TjHuq3x90d31pRgmzsn1+cDAZRwMX9e9XHr0zFPOx1ztILrYqk
	cRGNm7JhPGnQyaBUn5vPHDVWCv4NIpzmrWubi04XohCo/PqEEJcZBJRqHF7xRwSxvdtOkmbpyJb
	+AaoO8CGVwlkc+jDe92ZHyig7iKcN5udi/ZEvY8Z1BEiJirr9VFQ2lI3v3Zgfao0o+54irl1U0y
	9E/zaoXW7ud6ww3qgxft64BJQuvLfhC6kQuzNm7ZS2J3u2ufVmylLkcIu+bapjHSP6cQrFbVXqi
	dDXumqhJFZTirVUw==
X-Received: by 2002:ad4:5c8d:0:b0:89c:d5f4:7b34 with SMTP id 6a1803df08f44-8b02818ed3emr485060356d6.4.1777290192157;
        Mon, 27 Apr 2026 04:43:12 -0700 (PDT)
X-Received: by 2002:ad4:5c8d:0:b0:89c:d5f4:7b34 with SMTP id 6a1803df08f44-8b02818ed3emr485060036d6.4.1777290191679;
        Mon, 27 Apr 2026 04:43:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba523a90fa0sm1032592566b.31.2026.04.27.04.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:43:10 -0700 (PDT)
Message-ID: <c037803d-d33f-47a6-8db2-736c7b49092b@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:43:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb2210-arduino-imola: Drop modem
 support
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        bsatish@qti.qualcomm.com, akhiverm@qti.qualcomm.com,
        nicolas.dechesne@oss.qualcomm.com,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
 <20260427112833.1160332-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427112833.1160332-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef4bd0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EaRx9XN6qIJLkwU4gIUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zF69yAOI1zh8pUfY8J9nUe97fmRBt1zY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNCBTYWx0ZWRfX1GT5b5xz8nIG
 yiiIeoi5+wBYeyLaYiPf+dGnp7UVc9byJsjYIhE2Pha+Mzpx0XQ1kgJ6U+n0X7HxP0vUPOIL0Wx
 4nBz1jMnFNxfnh4fC2Y5yXbhcs3RKN7s1z6t8eaOQdEy2/uJFkSEdabntIL7IMoHsCFWknRyhnN
 j/3esJXDvF3jSyGptNPtoMUYKN8pPo0QLYusGipj326rF+UgT8qoFGcZKnNsz85bLMSlRJ+5Wnc
 CCElb2bHcFkRBTTb3iL/EOWiAK/pnLQHFMBF7hfgaYjA6QcWUXW14wf1T4NhzCWoTgYwyX/SUyk
 +BHZXv4bglfvOPmcgZ2r6vEmY/OQ3/mXOs4uXIlLo7GZlP5wiD7VudqHH7UlpwnclWJXFw7i1HI
 JI6r9HaO831ullofmGnydkR/qO2l51Bm3aCC6nrpH3cezxzuVse+KUP/GJ3+fz+XrtCgp+pxvug
 0c6yxx1VTLFSIYkmAgw==
X-Proofpoint-ORIG-GUID: zF69yAOI1zh8pUfY8J9nUe97fmRBt1zY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270124
X-Rspamd-Queue-Id: 88641471E55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104705-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 1:28 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> QRB2210 has modem fused out as it's only available on the mobile variant
> which is QCM2290. So let's disable modem support from Arduino Imola/UNO-Q.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

On previous APQ-y SoCs, the remoteproc was still physically present and
served various functions (among others, GPS, IIRC). Is that not the case?

Konrad


