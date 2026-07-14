Return-Path: <linux-arm-msm+bounces-118955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fGnUOYrYVWoQuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:34:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 570BD751850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:34:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SgiGSxLE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TQB0XXHW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118955-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118955-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47EF1304DA08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9D53D3D1D;
	Tue, 14 Jul 2026 06:31:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6C351C1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:31:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010707; cv=none; b=ZP+QGFul2aTz7ydV4i3czAv8JWZSukW+yFWKApwcYN+7BOdngIvjdbwSWm07/9vH7da3nYrI5G66vJiJXINLDdgI91SPvZBXWV7x/u4QwhmCWC0oHA2EL6ARHXfdjcTBiDufFOED3Dx2a3oNvtE8JqyAzEchMBulBsg3vVru1Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010707; c=relaxed/simple;
	bh=M8bbw3hB1QccYW9YyMJ2o45p5E7zrrSy0cxjuc3xWXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7+n7S/+nZDdfejXF60EjiX0dQEDOhRy6UsObCvfmcPhStLp6/tu2yuCHTu8hf7MQT5O6XZUD28JE4OIqigErz4maVr577vEfZ7rIRdcOHbll1fKOWpsImq9M0p1cR/w0XI5sAxHj0MflMr3hUgOTGzm8PVpC4XESJ9cP6rUKW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgiGSxLE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQB0XXHW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SfIS4005352
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvbBLSiulMwfLH+VelHo3jpxmqAseAmLVR/do0Gwl5c=; b=SgiGSxLEkh6wlKdE
	txnd5TiPysv0zl5dieSRzInRXzIxl7ia+wjPbPDNYZsCZLkxlYIwXOiUYqlqrvXR
	U4o3UIzhLonPcrDPuJms0xJGIjvqfPbkr+c3RfPNQKqV8E9hQO4eqWw2dyuL+Mo7
	P4YrUwTA5EnjCPXr/2tP7Rqj/6m7scI03Zz/GaQaJxgJ8bN8pFEYOxLISC5fpEwA
	G/bxN5F/2IRoqpMdxpzoORtq3Tj98muC/A1zOTGu+d7qxRUfjeoKDlPGYxuckeWY
	3QizUFFCN4khATa0YvhdSyEzhasxkRCKG3HhlBr2u78iUN9+h2XsfHvyJKNoKuV+
	DdSM5Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ctbn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:31:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso69383005ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784010704; x=1784615504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvbBLSiulMwfLH+VelHo3jpxmqAseAmLVR/do0Gwl5c=;
        b=TQB0XXHWtWgee6NgEQiNkOcJZ1NrY03V+vU/H/TnRuKi/75SxzhNwuROxWYsNbm1wU
         cA52rXnUPTkScFzwYhRGrviV5ORNb1xv1zWdYqHk92Yzt7DyjcSeodriOP2jyDsxJleG
         tSLBcWRWVK3f0HrjdlV2/6dBXDSBKIbRz20YFPnpFf9r/vdEtREapha9tnySWhYqDA6o
         lFrovkrLZWaNafwAiC8IB1TVS7Xm+jdZCQjHr9vf41+eS4Sqd4ZbzsINCIN44CaU5kKV
         TznEpH4pqRUekty8L7hSNVu/p4NbUYNILH4+FRjm66iIcNdhnNfRGNCQzcH/RU/sP02e
         K5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010704; x=1784615504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvbBLSiulMwfLH+VelHo3jpxmqAseAmLVR/do0Gwl5c=;
        b=cIbKY0CySaViGxovZQbgWQQ+BrzlHIcQv+OHU/Lxf+ue1nnFPocBYxYaJ6jyO3AzAI
         wLUFxB073w9WnvYuL1xmTiOfHYTz6ymHRDd5ksmpJtLK7rz+a2UyEDnOHy3kt+wUZ97u
         bAAH2sIQQN3IgODdCVO5h6WUuOgnmKCXBztVhDGNbVCKEOmN1LrkeSm2/Vt4WFW/BiUl
         1qY2SVb8rTl+odDHfBitaDbq8m9KEme965HEYs+OTT6v9NExKgWU8PfA9Ge42q/f1X0y
         cg5dBDwQcw2kO1lZvn8XXxr1x+tMwn89sHHMPMzNtUPdOuzYBB5i3FWwQwbywNhAFLmG
         n7SA==
X-Forwarded-Encrypted: i=1; AHgh+RqGjheoN3B0/VL7L57AjjUSaV06etacpHFQY85QT7m/M6I372B/8Cvgg3Iq2AVoMfl8hDoXkNEx/8YNg2e5@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0l899C8MPfn0eIv6w3P9vpcjFP2tj2mBPQbyxGi9OGzrbmqQ
	6mgmYtueTktlFlMASvmCR6EP9KXSpIDvZALMSjeGOgKHpGbQ/F3/yCf5MLq6UpVCWFnp+ExSPYr
	nZipg/6UadpjhfGogoO1K6823aEdjUnQzn9OCjdxJkxmxgymyOYijL9HHzKx6s7YpuBcT
X-Gm-Gg: AfdE7clCv9KDtJiqbkkJa1PVuytH2eQ9MY+YE8dJbL9cKBq4lqXpJcoSAVAmlfvWpr7
	fc/4Atjg1ChePi1vvwFilltgSQsFqgj8QhGySmvW8A+Of4mebrjqr9kOna+YRMkGhR+P8Fr3JCz
	3+GT8GpmtAToT21kuuP/8taMUYq52l+6u7ZZDgqAcQ6OPo8ZcnzXxhUcEG5NkPHnUtmDKI9TADW
	dTkftJFNKBNeMBtqtegdMxV0LNpAhbZ7BPIVMf1dA459oUk2wvsCbzwr6bncmRTR21QYiRVxun1
	77ajEkWpRzZpfLfu9KvfcdKiidntWgoDQjJzNnRX9Q4wQ21NYFTp7iiRVSAstESnEe59Wxwt2R+
	BBafu/KC/6YEdiCqUNEka2GabCiA47mTirFUl8g==
X-Received: by 2002:a17:902:f60a:b0:2cb:14b3:4cfe with SMTP id d9443c01a7336-2cef14eaaa4mr12590445ad.45.1784010704396;
        Mon, 13 Jul 2026 23:31:44 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2cb:14b3:4cfe with SMTP id d9443c01a7336-2cef14eaaa4mr12590165ad.45.1784010703989;
        Mon, 13 Jul 2026 23:31:43 -0700 (PDT)
Received: from [10.218.7.247] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce95e001b1sm54470675ad.66.2026.07.13.23.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:31:43 -0700 (PDT)
Message-ID: <8fa9c1b4-9a42-4c46-9c44-520e79540819@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:01:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] scsi: ufs: dt-bindings: Document the Maili UFS
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, andersson@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, avri.altman@wdc.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260630220536.3803984-1-nitin.rawat@oss.qualcomm.com>
 <20260706-curious-festive-ringtail-dd8fe4@quoll>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <20260706-curious-festive-ringtail-dd8fe4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: idxEkSCPbOXWd09AupUyyjWrMWO-PGaP
X-Proofpoint-ORIG-GUID: idxEkSCPbOXWd09AupUyyjWrMWO-PGaP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2NSBTYWx0ZWRfX+fgc+j5M4989
 ksy4ZclRlwZPCTPtWwCx6PbnsEmeaTHb9V5kARO9y+iJDHudWz1iO1/F60Il96lrzpDecxlI2wJ
 cOOqvaAu7bbCGHhjDIeJONSaknMlnPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2NSBTYWx0ZWRfXzw01VyPduqE5
 Npape2+cm6Di0HgNoC2e+bK0F/2tFpIRa0rxKQQhHfiTnNGBZ56sdyqzINQwNsTxSqLNEH2/M83
 U3DVQgYB1fmwBc+PjFQH/JZisoE4srXTG9aPCzVtNlvBTpBZPbIPB+BKhAZtsVFcNWLx0jBTQRm
 zF+nuRr36IEDRv0tKtF0bJDpTwtpyItEnPGyQiWclHC9OwaYtZ23JOjqBiSY6FDT1uSr3ecG0aH
 8+6LyEBUSoXG/e/8x8H70Od2yFKw0WeECKo7cuXukwDeBTUZdf+AS+Wkcjnas8Yb+14EmphxVca
 copG63+NJAs9MTuEHDbpcGM0meY7moiSwSHflaDnlIYW+ZrYaY5to0TSY9/sAWht+Z3xZmjtmgd
 g7JWn3smGV6wo8R3M5CoGbWJskRC/O5JPfchcMcEvfN8uOOYi3HNtIBJR0wR0duKKRl247Qfv8H
 68BFLmuJDKphViEw7Fg==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55d7d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=E5xm5Jb5eINjpAnLFd0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140065
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
	TAGGED_FROM(0.00)[bounces-118955-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:andersson@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:avri.altman@wdc.com,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 570BD751850



On 7/6/2026 12:13 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 01, 2026 at 03:35:36AM +0530, Nitin Rawat wrote:
>> Document the UFS Controller on Maili SoC.
>>
>> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
> 
> Why is MMIO address space size flexible here?
> 
> A few previous Maili bindings had the same problem - your Claude vibe
> coding just looks at one piece and you do not review but trust that LLM.
> 
> So again the same comments as other Maili bindings.

Thanks for catching this. Since Maili supports both MCQ and STD register
regions, I'll add 'qcom,maili-ufshc' in v2 to the allOf condition that 
enforces minItems: 2 for reg and reg-names for MCQ targets.

> 
> Best regards,
> Krzysztof
> 


