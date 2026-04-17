Return-Path: <linux-arm-msm+bounces-103534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN3DLRQ14mm13QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F1F41B9CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EAF330A1F88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36263A1E66;
	Fri, 17 Apr 2026 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itKE060T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjkMn3y8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE2238D006
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432383; cv=none; b=qji+d+lVyRtNhAgIbxczYWoIo16NVoPSBzEk4HxX4hOPozeLZDcxpYA9wfQv2ZHBxrwk1NZ9mItJQ0/mprZcdD3C2ZA/ed2HBj8NqtUEomZQ/TiH/ERVkJ8t+5cGotCRgVLWFOqBoMlpYH/+lnpD707ygPY6U+OwVoBl6z/JSu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432383; c=relaxed/simple;
	bh=nvWhLmAQi51tXuJddhdJovPsNujCVheloktZiyA7yz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etRXk9j2OUK6nTp3EuYKz/NzFHbUUh3I1cFe6rBNZKdcVgyQt7Fw/wCGmkTEqM09dHPYgnHC74rxi/iVi9bOLA4r3NPztoPUp5yDIEvbUPV9DGHq1fibC/nFB9Ws+FgsBjvk4vK8ESfOzjZViSVm2Ff+BhGVguTD/eXqhcuSd+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itKE060T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjkMn3y8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HC3cNJ727574
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P48LtR2etTVmogsXtNHlRsIqcgXE6975LXlWnojI4Os=; b=itKE060TqrdIj+Vj
	o/EajHoxmHICIh8hy5y60TML+uBCi2qQrxujM9lNnRqLKEVgD3tloLNw6IWAbsAK
	ObNDLG8H6pfeyj5RmCeCDeY5CP+X/Qq/EGYY+SqIuxVOpQRq1KDanhxUNYP1V/f+
	SbuTth8Rhmj47JOpJaIEHKcQLXhJyFhq+X8nVciQjWhJEOYka8qEXov2vDSB0Ick
	Z/S/lYvJPOfBviQzL1Nguo9o5lLugzCI0SMTA1loU0wdR7rWlnQUjB1B0QCeLv1p
	I3TtRGyeZl1Ybos7qhw3VusHHqId+LGiAZEhY5hWQBlKBWXg+6rgkkrY1LvGJZF9
	gxym7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkfyqse6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:26:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso1720033a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776432380; x=1777037180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P48LtR2etTVmogsXtNHlRsIqcgXE6975LXlWnojI4Os=;
        b=PjkMn3y8EiVs9A6KALpaHVQieGnL0CNqsGki3lz9SKGuYKmBW1RocD+87VDmpjeE9o
         Y+kSPmG2c7wMB3nvzfKb3ODktj5sGqAO+90dyPSGJ1kZS/wgu14OZ/+eeXANR4HB/Cz2
         vZ9qBojbSqUkw5lcZ5jDWKaEd2bIoP4plVNJ8UDAvEo5lJTXqOQ4VP4UOFMSYtiknA1N
         Y+sUBsRBnFI0g7tDgu9ermYRUbbgSRsKVJhUiuCyvn80ThpqwXIkku4ROkuiprBQwnnL
         4ai8ChZ0cmEi3oSTmB6rh9Io9PUpPoHKc9TpJdAVXwi3l3uge7RKjZLCDAvfkvwppzXk
         V7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432380; x=1777037180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P48LtR2etTVmogsXtNHlRsIqcgXE6975LXlWnojI4Os=;
        b=LKY76uRhlm3jIR/bHs4GuCjJ/5kd1m/lnHXAA2gDFISBZGMMEI6TQV6ulGsUtjdKgq
         YZqFWnIpsPHpJEICGhhLRjbaZqnhLRhxe7q6Yr18JrZiuiqLlbCJtEiGsitKPdzAEXwf
         ONMqsmgND04sjW7ju+XZCS2D9dAbv/9uPyBpWnzxNMrx8EajvLT7mgb2EUhrrz+/VHgb
         zo34zHKEeTGQTxUmjOzyAEjPWQ14cBCImaGSiUh1JPWOcNQ5AGPl0hmLpV8nbBgv2kzl
         FBq2DpdDnhOq+QvZmFphWshQbZrimwWghRLanMY6jIy5gBtcBLzNHn4OIQIRXORWvYun
         kZHw==
X-Gm-Message-State: AOJu0YwQSn6xzrCNNaKBrZ/S2rlGkDqQeEIu6BdFQm02FuFJ6Aw/VmnT
	f4S1yxIeabnysBLVYIwGl/jol8cb/JvZR9bMkH5z0kzRncOm+PGtDvfLAJZxY+U6Rkm12gJE0E7
	WL1mpGg14pBlAd9a5Hvci7BHKR+bajEIbdMYT7qAHVsblQThZ0wwZxF5/CM8LLhoGQSvz
X-Gm-Gg: AeBDievzT/vDFM6OJfTzOjq9Xtej+jLXbI2e4chy+89G3VqkJqKDeq+K9H0wBwHu5kd
	e8jJ3HXmW0qNa3TGY0iUNy9OflyuHBia60l0nYmeZYi2eKikRnDGcdQRTcuFVgNbL59IIOo28Uy
	STHk02+aEJw60i9EU7PIVY0hv//mpo+O5+o5HGDGUZi/fwWdqUk9Lioc/tWETf4Qw6q3wgrQSgJ
	AZj5ZkLbsccjSXI1Ox3RB2RF4qAcyrffMWGp9cHdebtrx3Ngrlht6cm7IGVzK2+fxNdYKN/TCfh
	f4KL4Uidnh8UnguaeEVIuEHypI4ioscE7xm6yLmtgnt6SGEmm+zzVFyKck8R+fKvpSK3ctYHdHb
	bZBcHHOkGgMcqbK3KEO4o0nnvz6gY/VzJxjq7ygNsKg9n9qFOs0FZMO9Kq0h2pw==
X-Received: by 2002:a05:6a20:94cb:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3a08d934591mr3536969637.48.1776432379831;
        Fri, 17 Apr 2026 06:26:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:94cb:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3a08d934591mr3536923637.48.1776432379243;
        Fri, 17 Apr 2026 06:26:19 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9da4esm1482503a12.11.2026.04.17.06.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:26:18 -0700 (PDT)
Message-ID: <73928b30-a0e9-4e94-9273-9d21c6045079@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 18:56:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] ufs: host: Add ICE clock scaling during UFS clock
 changes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzNSBTYWx0ZWRfX1TfBX1pQJtnK
 qMTCdYZEsWm0rxSnZWWr56pcisTncP1ZVvWJub/CN8kVsgCIVeBnZt/ajbadIskA8K2L3oHhf2Z
 pgY22G9JwXimMKUTjyE0RyuKNeesl5+0AWxwYltpjTYBd9U6chSSt2gVohMj+uue17lkz/UNDk/
 bGaHewQQdZE6Rl+yOxI50FfFas99VcMVJsQ+ozrpaencHaZR75fgKKzW2+vi+hESW9h6TlbirwY
 i+wjxGT6rJgKG6O4ruv4lt7D7U8FW2uXmAl+DhPRBzvpXQzu1TTae510PmL/fZNdBGv8gK+ECuW
 CD8yABFPLNsL2up5IrSH5OPK3LnvwsfwcxQBQPqNLb3ahcKvxQr6HOX9Ibnhb6hePnH6REy8KPQ
 1SzU8zmlzQtKNfSVLalUTkarkJGFMa3lgE0wLNWLuNicP7/dLDx8opcbaXjsZiFL8emXECYuYCl
 Z0rlWK6vC9dfwEvZq3A==
X-Authority-Analysis: v=2.4 cv=BZPoFLt2 c=1 sm=1 tr=0 ts=69e234fc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=moC-RjrLiBHrLYWkWSAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3w38XCqaszO9KWCfEA-vFUTFJpiBEBIp
X-Proofpoint-GUID: 3w38XCqaszO9KWCfEA-vFUTFJpiBEBIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170135
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103534-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39F1F41B9CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/2/2026 4:19 PM, Abhinaba Rakshit wrote:
> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> UFS controller clock scaling. This ensures that the ICE operates at
> an appropriate frequency when the UFS clocks are scaled up or down,
> improving performance and maintaining stability for crypto operations.
> 
> For scale_up operation ensure to pass ~round_ceil (round_floor)
> and vice-versa for scale_down operations.
> 
> Incase of OPP scaling is not supported by ICE, ensure to not prevent
> devfreq for UFS, as ICE OPP-table is optional.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal


