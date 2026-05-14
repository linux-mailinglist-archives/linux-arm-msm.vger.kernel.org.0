Return-Path: <linux-arm-msm+bounces-107563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDh1CUmiBWo1ZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:22:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 631AE540545
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AE6930131EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8378D397E80;
	Thu, 14 May 2026 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3kn8es9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ek9mHEeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399AF38D018
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754118; cv=none; b=Hviv6hGIvh8ysoT26/Mxh3MISVAdmFqn/2OcWLV6BC2zWBbA4wAX5Qr538B/poHIRlk9m4OdaMzXkqsMus69PmkC7Pd+2y+0UR9nn62axkSwfFUc1qsMsjNJlXPdzufk4NndXatmP0DgBhD38f05Cdjppc+loJlwGyTna3soV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754118; c=relaxed/simple;
	bh=1tWjWC7ZSSRscsQRvfhjg48DksDTMwJ/hkJJZxDsIkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6+RHpt3kiV0HQ9a3ZWzm5LASoKyRGr/riLCbw0/2N+TmtrBByWFfwqKNgpOgNAwxVv6KRvDhzmLB1JS5YBSscJ3SBZ/Wo4zWbP1LbO4fFI4/KD4sUgQJ8v1k0nD+uQ3RyJDCUbtPQopMv9/8xXqlGjjvyGJIuYHjg16Oy/40p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3kn8es9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ek9mHEeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kAgH2305163
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=; b=E3kn8es9MXVd1/Gj
	4rFSCZB/DNa08vAsRs8ugWvy/fk/LBgTjPynLqVzu/PEOOF9XfS5Aa0gE/ntqkSs
	5D/SMScTaPW8f1oMOmz03Z3yidtI0gEHjWQv3zM9tQsyP2iC1V6v0mJxrVNOAvY8
	dBx0HB55nwv8cq9xl5Tp57WiCwafKGVLV4XZIdXMPNpasMh4Yi+y4QNKMST03dEK
	PskXU+myOmA1UZndCWiLrnpqtWuIaa5TNqi45vMS+us9cfrReWfAmG0uf9Gqa5Pr
	HbCtifSoyZAEWtCYs3poBC2hlWo3IxklHdiyMbZTCkUUlxenog+3E7+R82zlJ3/X
	j6PORQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0brcej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:21:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828cee4fcdso2819523a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778754115; x=1779358915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=;
        b=Ek9mHEeR5Lj3E6bc3QmGrmePb4O7H3m9y3/AsigZLvCoRsd+V1bi26BIwis9KXSkNC
         +0kPd4PJA+7JyvVmTFGKHIdGhQuRvxTIMJqrP10XkGQyCj1XylMqquLjPeFNIpvddJVs
         Dz+IHX1E8UBeulmBBsCQDFIw/mfQKW/2ys6Y/DNlomjoTqMYH6f36L8iF9Nf8oOTLN4+
         tE6S3qiES1abgt9WNU8Vp8usGXz0m45ETxBQDAG2xHOn3C/mYk2SoCiLY5GfEce5MirJ
         fkYVmHFJ5TupUcHBS+LOlWPYr9woLHcD3C6zOl4dYUwONP/cuFMNfvz2u5bv/QV0LIKK
         wxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778754115; x=1779358915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=;
        b=JRCOelS3dprkAVSI7vmcJG6WcKKzzMYDuT332DRGIkXZad+ZLV9IWruA3ho/TDNz5W
         xY2zDgWpBcbCtpyDC8Vgj86ZVMFDXQcMzBhC9T5sJY2of7AkYtDzq0NbbykTAPOS88vG
         9G5pbSjALFwtAF7kjibwIbaRZEAowbg9V/0akFTNyamYfyOVf2EmuUK2OOpfGmEn7Mb9
         BuW9uD3uFLtK66dW/Hp/KbDZ51tQB62IqPqk92kQGoa+G1H/o8E0bip3HyIKreHKyU5Y
         wNe2kol24ZZbquPScB6l+MBf6u71OhIwF08o0YlFHR408UjjkKiD/Ui8qi0TVTh8m9ZN
         5j7w==
X-Forwarded-Encrypted: i=1; AFNElJ+SbILStMLy1eCJxGxR+/M830Ff8JOJeD1UxNy9nnSTi/nrYjkUrZ/FVC1aJgrDVBdw2P4BHRDNqujonoMY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw90pLIcqM05yEcHbhwnp59EHM2owCIbpuki2lBxYVjjLu77w+l
	4PnxZbGCTHPZMe/CRDhjKVB/6+dp5dlU8S+PwkC1eHeokZo/QeXJX8DzwAAjDff2ddc8aGm5m1i
	GcFRehXgKwBEG8HSkn43uKqUPu41rn/bRuXvF79lku9QrTb6VR8chpmZ4HmGlA1lD8RT3
X-Gm-Gg: Acq92OHEBWkKbmv30KErUqxFd/1mF3sfwDNMZoXqSEISkL7YUmJpgdHRY3JpFuJiC0j
	z1buFvUTeTyJr1MJiqhzC0OYoRPjc7eFz96RhEWHOMUp8ZzL2P5bI/tofme5EVoUkJZSBkdfiJ7
	4KQ4DXh7aM/E/HEgeCpATxJTAd2WBy/RN1KmmBHYb6dLxQRy/Gjx+KHNWNk+TdemnTJpoXFbJzK
	nMwHK+DpS27livHX1fNR4mGbrvop+BMqdaH1kNlWF13530NdI5eQylLxLIE/s1eqDprfLIbhluv
	AZwnibV4mjitPB9H5WBKrB2LmshYMxZI7JQnMUuqtC31t581bLQ296gFtZz9/kDOzoNQhUE1oLb
	sGJEWhdoSvL7Uz95xEMy0oD9SChiGf1likWtjnJmK/doOWb0eJ3J6YYj9ngk=
X-Received: by 2002:a17:90b:4d07:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-368f782f7ecmr6252249a91.11.1778754115134;
        Thu, 14 May 2026 03:21:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4d07:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-368f782f7ecmr6252211a91.11.1778754114516;
        Thu, 14 May 2026 03:21:54 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee6280d0sm5974990a91.16.2026.05.14.03.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:21:54 -0700 (PDT)
Message-ID: <2ac7dcb3-6dbe-4967-bde2-10811597449e@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:51:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
 <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
 <20260514-obedient-crouching-bulldog-7d63a8@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260514-obedient-crouching-bulldog-7d63a8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMyBTYWx0ZWRfX/mvV7oF7R3ln
 zvsIeHIoJjySObVKsZGMOvzMSNsBi5IGqANjm+5fm4BS22lVvf+8lR714n7c5n66ltZjAXBWO6O
 6MHefj4YWVuBdxrq9oGVFz5ZHJuRBvq3dmH0r7nY+z3MFr0kEp13LFSJzsx1/0RLhj3gczw23WK
 PmiKit5Jy8hAMYorTDximZls+1lAubnsdH8/xaY03U88NS8R9YYg9MIa+6ipwKlhenVknfDBo95
 0kpAgDnUh9lyjCfJe+CBpMJNN7c4SXRoWdOabeb8p+Q0hguOLcfcMXRw1hG6A9yn5qAHDDs5QIG
 mbdVTz0B9jQZ6bzPelN0PEhsCxLhq1MSE0LjoAYmBwHbwgx9MxPaC7dRhBx0SQJd4f/yT/4erw4
 KysvoTgLJYpgQVOaYulFCHadoZw+Dz5r0H7Ru84cnGtZjBVoWF91jFers3BrdvU65x8FethtY+A
 /k4OCLjhrkIGhQv17Mg==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05a244 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uKGqPZ-g_1yFZXzQAvAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: I5wsUrQkZq2WgA2ptnponNlzoEarxizB
X-Proofpoint-ORIG-GUID: I5wsUrQkZq2WgA2ptnponNlzoEarxizB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140103
X-Rspamd-Queue-Id: 631AE540545
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-107563-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/14/2026 3:48 PM, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 08:57:36PM +0530, Taniya Das wrote:
>> Eliza Video clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza video clock controller to the existing
>> Milos videocc binding and add the dt-bindings header for Eliza.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
>>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
> Please allow others to actually review your patchsets. You sent v4
> immediately without waiting for v3 review.... which did happen. So now
> please address somewhere comments for v3.
> 


I have put a comment to ignore the v3 patch comment as I had missed
change in clock node, but for sure will address the v3 comments as well.

-- 
Thanks,
Taniya Das


