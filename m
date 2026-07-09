Return-Path: <linux-arm-msm+bounces-117894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2gKzHa5WT2r2egIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:07:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7574872E101
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:07:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TtGf23fY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cyKgMy86;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117894-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117894-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF45730285A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D0A3E6DF4;
	Thu,  9 Jul 2026 08:02:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3CB3E6DF5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:02:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584175; cv=none; b=KK3Mmgngcp/qneXYXng+2Lcm24sWDNO33L6xOaDtrDzeFToRcMN0TZkSxlGuP5PrOcm1xP9N3AE9+ZzfZ+UrkKum8c9i/Zhvvsmy0HXjtXvuLNA2x27zYUKKPxXMbN9/+NKgII0wnc3+SAA1YR8+8vj4iFepTXEem+I9fu5ImzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584175; c=relaxed/simple;
	bh=th6VsRmCyUWpAmJ6vtGjWlM3bSzksjN4Y9QWKTFE0q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XifcV+djdpsbJBCD8XALtnw4b2CjQ6ANe1jt/a95VPNDH8ws8HBt5rhLACl95j0+uqWDTR6QylabkV9SB37/K4WNvaXEkTQ3TSGai6cI16f7g41I7zKPXVV93NqyGPpNfVrgu4lPG8mn1fpPtiDcbomTjuuUt6HxGrrV5nwBKMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtGf23fY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyKgMy86; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960PC0784605
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	th6VsRmCyUWpAmJ6vtGjWlM3bSzksjN4Y9QWKTFE0q4=; b=TtGf23fYdcbuF16l
	lOCSusAEupkK6SX62JcK0v9HKkdBGvbR1oXD+Hx4353WNsuESNTBNORWBflM6LFU
	zG3RirmQcW4TpSYRok2FNvqyFdkTkwZyluBSKYdpokRwPw0fciHH+AXfr8Uc38Y4
	XqrBiuhWHMzGWEvwaVMgv5wW63AMKZQB+W+xbRWOjatlVTK9YykJnJNlO2DsgilL
	LYn8l0StSooS9GdgcMZa4vR+7eHkq5QohMiHxPRwHRD9qor/zRWWE/QorbpccVT+
	asQi64Q1FwMShDIrdhZkBEpwxYPpOMkcP2zW7U7N9bTTuFHsrhATYNd76TpRMJhs
	OpPHgA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u2jv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:02:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so8905301cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584173; x=1784188973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th6VsRmCyUWpAmJ6vtGjWlM3bSzksjN4Y9QWKTFE0q4=;
        b=cyKgMy86Fnm860kKX9X+nmdNv+uXxL4zJZHJPBPUIxtSk6wGj03Ta0/G1eo69seL0S
         yvbsKLo6snzf+DcNDkJQWsrb7Og2/rEVanjmZHFi4b6HBub1jp1nOv8ppHeNE4L3AdVh
         H4Z5nYf8yycO+8MRCuvf5gthf4kf7rAVgrCkXs75b91AIzrhV7tO5NILPTbGJT+e6C0H
         ZI1pbatcrSHyg5mPMS5HdRNx3+TO6TpXAaSk8FE8uMm2nhpi7pEDCjEsysKCxDf/ILmE
         USk0SBLnp2+hwUdfzo84wyKPOtTrluyEkAzUyaqUozg7Qt4VO5WLov31DXQnBuaSAagl
         lfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584173; x=1784188973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=th6VsRmCyUWpAmJ6vtGjWlM3bSzksjN4Y9QWKTFE0q4=;
        b=Np5rBgBdvo0Sct/ltaB7m6PcFS/6BzvunCdcUHYAW489326coWUN16FTRzonlwUBVZ
         ZQbcLztK1I67CfqA8QApqMyNcdYqxWvClaen2Gc84E6485kwHXJMJJ/ETyKWWP7+yldz
         jhd5rAvj5FCue0vV9NPsxK248klbHZoLGW60OOPILiS+M7KAPUbG1C+tpevVikuU1/rP
         C079JUkY529Rdf7B44bNOsl3g5TpUKOKN/K4+jjCp0obFssvZTroADyMkVR2bFbOyYrw
         wVdQ1z1exILNsTIahIarM/vgL7NGB5i8P2HiHvq70ib3E/CRSLxsXM1wJPnMY/8JL3dF
         LoQA==
X-Gm-Message-State: AOJu0Yx+FST5kAduSYajmZFgmbFpqm3QC2kmEUBcVNzWuYyCekPlPpF1
	4BOdN5e63PIBptvCy0Icy3DWxzFQHO0bsGGDPPE/7GHnCBdnfdwc1IQozpx9JShPPGfZRCyX3Z+
	gzaAj/PqIuH7Qd01IrliURwjz1TzXlVmE1fNhXbr+pmkRRPgWWwpl2nglI+CmVBJ9mvg2
X-Gm-Gg: AfdE7ckPcHiJbcFoo1TMySAXOjBngZMLD0tyGNQi7o6Lw4aRO2nnxQvoJMNkgHkhAYT
	lNIrTuVhfTf8ZcljsuG3qLvW17K+M3NNvU8Yl0fMZEDefLe2sTWRIXSjmKWwvqIwFmMJIwUoTJT
	sLwGOH4hSrDJegjBv+X48eW3y2tf13SnWUQ6LUr4+9cPwOQ/mMCkPWqa229E3yJQXi9CJDsCsu7
	t7qpzZVXbFOMWnwTdHZip7gW6B1zu7pY5/LDNnH5QFKHmOdW9YkNA1uxxZDyyPLZfsBqJcYppQA
	CTWxhge65FFH4ZiF+2PQKCJcnmdjLYhhipUrMHN+cCEghnfPRgqZd3U/XailHNnnU+CwVGOAcjO
	XmvnQdWJXUmAByiFT+nUbpVUMsLphis9v7UI=
X-Received: by 2002:a05:622a:1303:b0:51c:857f:9c1c with SMTP id d75a77b69052e-51c8b53d07dmr50481491cf.11.1783584173076;
        Thu, 09 Jul 2026 01:02:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1303:b0:51c:857f:9c1c with SMTP id d75a77b69052e-51c8b53d07dmr50481291cf.11.1783584172699;
        Thu, 09 Jul 2026 01:02:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15df03dccfsm114326466b.62.2026.07.09.01.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:02:51 -0700 (PDT)
Message-ID: <7a378b08-f157-4f56-b938-258b93af02ca@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 10:02:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX8tSeoF44wTfi
 kZQktXWo3ta04kLZ3a7tPXHOU3h/YMSGs65WRx32F/ls10/j75cEOSjssITEPImOlBmqFJkUk3p
 DvNtJ1Tz92OV/0BBdt7fN1/TokNRb4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX1Ibxk5EZdH2z
 Xv9m69wLBv5Srq7VhJfOkES+mlNHZFsSwzEQe2V2P1f57R47mTdLaI3pX9dBv3bHOfWb2bqc8VK
 CEgof1HuEglF9U3MHsHz5QaMJSZM+KUgj3jZ+dBJFdRjtVWSAigBUV5CFZKlsfouBBy/GQd5LzU
 7dSvTkd0XbmQaS9mLE9LqYuMBfYbH0UTNa1ixHWGN1BRsaCf3n2z7ZydqxBI+I1iQrx8qGGwlhn
 0bzuXRIurCLJS0GleXO1Z8FQIqtM5sz2o25HbL393yeYfGMhPoRO6Yx2yTfQIIQ3DvmBc2b1nJy
 r/veD/Nh7y9fUB0Bcb6GPOPJ5pBKDrn0G0BK6IlK+voWhbcJTc7OEdStEB+1hPkxBP8xqyT6jlc
 TdW3GePo+0SWDDa/j8aoHVbRDO2m0UiIMUZQUncS4WOFkHtYQjb9EzzSZjMXyDL+L/m+YZL1JzI
 /VajjvtmEcXYcduY7jQ==
X-Proofpoint-GUID: n2xoPBlpnZeNyh-XFG-BFLSLZBb3Ux3V
X-Proofpoint-ORIG-GUID: n2xoPBlpnZeNyh-XFG-BFLSLZBb3Ux3V
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f55ae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yNdCUKxxWRXvyAEpCIcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117894-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7574872E101

On 7/9/26 12:30 AM, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:

The splat is huge and most of it is unnecessary but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

