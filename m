Return-Path: <linux-arm-msm+bounces-103076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNsSJkP93WkRmAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:39:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC1D3F7737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1D883010261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5CA3B774F;
	Tue, 14 Apr 2026 08:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fh05gK9Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSHfdmQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4B33B47D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155949; cv=none; b=DdwZUxPJCIJUSU2HcNboDuKi9U+ChN5OHhpuoCB1G5GLUSV9uQBwMxTDwkKVahC6bPnG35WCIbYtvklwlfDbyxOMfEeUbJiOmzFbP6F8bLmV3k1W5sOkXpzaI2pkoIqneI/7ZErdCRUiPiGYvjjLBpSjL4m4qaoeGEoFQp3dhGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155949; c=relaxed/simple;
	bh=2OM0Bj5MdJC/WW/lvYXymofwjCsnlyzXjNUwgtvtWvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNQknixPp/7nEpOhdhUV6vHC3sQQdgrH7xrCpkSp9MzLi3zqqWrYIrEr1zGW4+HPwXamGTir1V2CFTkvCzrJpJxsU+ARSHADCi04fKnu95TzJtH36mPIGfX+Z8I2taRgTkMQzpFKYPPs/AdvF6eG49L9Xww9V9nyMvo6+hM9zgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fh05gK9Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSHfdmQJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6dL5X3424949
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHglZFOx9lNBJSLn5k6IqHh65sPfy2JLY48LcxRXXXs=; b=Fh05gK9ZTOAAKx+N
	+HIRuU5AzjaBQoWUKfh0GyjyiP61ilvHbjrbM2OCdc7BdRZEdMFWCNUHaxzfai9C
	MkowhfReTY55qoq3HMIeKgaKOLeicZiYOmQ1QmLJ5O3y1KqyBed77oWAzGIxTDmL
	NHa1s8E1J4WQmVyOml6cFUpwnwDissCHfq5i9A77BLhn8v44WrikSLbkxoKev87Q
	2mHKROmeD5kAr68V6jkh/vqSeM3uq4aBrkVOxILa/Xjn0GK5cirNUpvEFBD8g4Kv
	eGlPN1X8fwenm3+kOczaUhFsWSJCdB8B6okOl8cp68Z8QaMYnQa0jOqt1s8Y9V5T
	eYMNMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f9u8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:39:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfc0719a1bso32515585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155946; x=1776760746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHglZFOx9lNBJSLn5k6IqHh65sPfy2JLY48LcxRXXXs=;
        b=gSHfdmQJKyVlkOKZv+c1qLaip7VEzFlSEY5iOR8d/HPxmJSDQGNuwPRPJjfHeCWETI
         J1M2zuOxjlxTER3MCoAjdAD2g/LTG2wPjKyvX1RFuViG3yfY8SSNK4o/ZQQL+gClRZI0
         68jOp93Cm8Y/kpyZoEejsMGsPuxQ/FAIXknkl6QlmQOmV578SaoetkoLCqwPz7ZaHGhJ
         LzPXRUhkKRz1sQbX+ukgB0D/7N4Dq++lQVPGN/S8J9dHNCUSAMpp9ceUtuVD2yU+1CN4
         M16DwnvJOQYbOz0b20676IFplfRGCcQ5lhi7P/7NqayxXvNwWujdywo7m/fIR1Yf9YYv
         Dj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155946; x=1776760746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHglZFOx9lNBJSLn5k6IqHh65sPfy2JLY48LcxRXXXs=;
        b=rbBn0xIRhfcK/LVaCTPsasveqGsmnGsnn2NEuJpJaWKdhQmcLSFUB0XucpClc0fSx4
         epwuTX2ZQIij1MRpDMorgxnkKlNQePYHGsaDPmTfef1h0LvlnMgo94+A+PIsP5ZpOaXq
         dOXmwyCYEyOIirbhbjSNK08VD3rmXsL58KlMI61MUQRYUt2x8MGB1o1rMZOJS164SRrh
         vIFvRznYdxHZ5kJ0Zc/UScgyIwjF+7kaY+cSG91UNZKgHCF1jkQ0yghOGNimoWaL0EM8
         Me+Qfl8TXynGTEc0gNB0DKU5VmkqPTLARpijbR9cqFi9GlmngC65Ab24/aVkDZjhLjib
         Hr4w==
X-Gm-Message-State: AOJu0YyvsDKXjlfclm+9OhkCtB9kCJ/FG2UXPx7kSGEZIn7IBG0qUdD9
	4A5GudN5ly7VaIMeVNnL71EpCAv1YUeD3H4onk4NMtBUHTXpfHQZKGE3TqcRRb29iPEYZq25QWj
	cX7R0RZr8i8ij1PXTWL7pM+VdXcoeJYkxsc7GfZsWUYwgcVn6UfAFSNoWB1J4Trfy1EbT
X-Gm-Gg: AeBDiesFRYTboJMdp6XxvL7r9l+J3ydgWodM3q6bu8QXqCPVZ5YnqdU4OR3BeSzyMip
	MlvQDgAbT+zzV0CHk/oBS9vvbwbrZDDlpcs7h5eu01O6lZ/fep27aWxbjLmGQ2cdtkykOVvu2tI
	xQiRKVse9Qz4xPggIl2PyPDqAdpBST1ZUm2nPz4p0rQTNIOEY6ITiZk7wlC0SNoPb1w3T2aVcHp
	v1q4dSH8y+bNWbZqvwCe4Anpn/JlnJpzYmRu/WfnabCQ/d232UuOKPhxvZEXLztoHvLHkQ6WrkS
	+wSu3N7q4NPkHRMDVPE8shC2EZ35ZH4Nw+g15H1AXY9JGCbbdHzfXJ0Q5Id16WLMW9dV52BfL5e
	gHlfuHYj574jiMyTELh4jerVHxDHB8I6bY24w2afhWSJR/Ah31GZ7ffLwtHJjFh6Dh78UFLWWJG
	hcbHF1Uzf7VImXjg==
X-Received: by 2002:a05:620a:1721:b0:8cf:d68a:9a96 with SMTP id af79cd13be357-8ddceab5d14mr1619128785a.4.1776155946513;
        Tue, 14 Apr 2026 01:39:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:8cf:d68a:9a96 with SMTP id af79cd13be357-8ddceab5d14mr1619126885a.4.1776155946105;
        Tue, 14 Apr 2026 01:39:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671d70c9656sm350209a12.31.2026.04.14.01.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:39:05 -0700 (PDT)
Message-ID: <c73eaf9d-2ee3-4d18-b1f3-061711948688@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] pinctrl: qcom: lpass-lpi: Fix GPIO register access
 helper return types
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-3-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413122233.375945-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OSBTYWx0ZWRfXy6zX4y4FyCbF
 juts0DMFw//9HHwwJveYh7Tkg2vt7nJnfXC3jNIwkteHSN6zeY1x4i0lRpFXVTGpna0hXSnFet6
 f0R1KPyuJpGq2cCaaJqEC/xBo8mPbCALDc/yT6d8Y+vUXMZBoLrxJulOji9slodLcZs0jxUQ3ZO
 LvWVZGE0lIwD4fX4fcSABQzPh/VwugIWuI3rTVYvYWwVy+Yo9SkwB2AEPqXuxzVhqCka3nLkcUL
 WFwTW2cLFGbW2wy2STuji8to+t4AlRi5Hutm9y1jutpBICARgcBkLsfQ18B0QKZbDa/OIeVH+Ia
 0o6329PlGCbf1rDtV2rdba7k6rX7/hYSTjEot64aNWxpQS2U/cbe6Fd+khbSnYjWd3gClTmFURp
 aP7pKXDl/l+HpUuVdZlbRszq8MUdZ2iAJLiOO+MxLIQsNDj/7s6HFWr97VTZQbRplN3Ru+VdhQF
 7EAMMsg22AodFGZP+4w==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddfd2b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=lehnMraD3ed_Nmqd2dEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: EFsFSbU3BeVEh6MAQr4WN5fq_oucXlus
X-Proofpoint-ORIG-GUID: EFsFSbU3BeVEh6MAQr4WN5fq_oucXlus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103076-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FC1D3F7737
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
> The LPI GPIO register access helpers previously returned the value from
> ioread32(), even though their return type was int. This mixes data
> return with status and is inconsistent with common kernel helper
> conventions.
> 
> Rework lpi_gpio_read() and lpi_gpio_write() to return an int status and
> use output parameters to pass register values. Update all callers to
> match the new helper interface.

lpi_gpio_read/write() can never fail, let's just make _read() return
a u32 and _write() a void

Konrad

