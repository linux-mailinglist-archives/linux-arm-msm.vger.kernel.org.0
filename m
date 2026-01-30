Return-Path: <linux-arm-msm+bounces-91304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BveEtugfGlkOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:15:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A807DBA605
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62E31300FEE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033AF37475A;
	Fri, 30 Jan 2026 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDohdtrj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYYFmmdi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD7336CE16
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775297; cv=none; b=RLnSGP0QVrRt6Ejx2CRqC292uNZ2XpzbCHclwW8EVkCZP4nqYZ4uuWFf+mEk8SBvvZtEqQKVArb0vPpYaDovqFgfxzfIYbLTHhSiyoYEMrID8C5vNkhX2GcVdeM8nY48yPsPhL50xgU7K2J1OPgd5Ksk6ctWE2xDTV1tOEYgP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775297; c=relaxed/simple;
	bh=7gPLLuo0R365g0WwMVl/6Z5EkvR9fQXTSs5UxHQKnH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuizE0eHIHKbr++tNMQQeMMrEYl3auxlxC9a1aLcnWZPZPLGFIgzflftq5rJH5TcYZ4BYt6FwqJCmvDw5A27RK0sDBbrDnTKqzhFFe4OOLZ7LDkRYr6MPetTL6tGaIbTpXZhVCIYq3eZ3hm5ZEILfLIOiBRY3ulhWwMxI3qG5y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDohdtrj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYYFmmdi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAUdOs1488321
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMOfBtvkC4Tbp14kDL4VSSBI+wSkYFqvD/3VKpvDmeY=; b=FDohdtrjKZ3gpv8K
	6w3cgpMiyBnVsfO5Z6edJ6FfjaF/FVv8iXGvoyDYekssKwKNDMEblT7pHPrk2x6P
	gKdDWSvI85ICXlmoZiWMr3x+nzp2ZU/XJZRgujCHQQH/yKRcg5mvcprPTSn48YlQ
	lUl/8OzUeKmJgYJIp+PqNVzL12llk3kMg67Y2lXPEALEmIl3xkRnCJEcZhc2nzRy
	0/DuMi4/MprBRtq0QAu9E7fZL4fJs+BuvPnAGKsCRpAUqLGQv3vo4CW9nnJUzv9G
	LGYh/AvMQ4JqvYSySbRT9On68KbDIf2HLSAuKR0hMtFidFYEkvjiXSjaeMImH0Ry
	OEcDaw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bp3u4e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:14:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82371886e58so1112574b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769775295; x=1770380095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMOfBtvkC4Tbp14kDL4VSSBI+wSkYFqvD/3VKpvDmeY=;
        b=dYYFmmdi3eZIMaBNQnzgNKTuf1RYPhjGmQvC+mrvLDrjR5UoQSBepZevrwEZB6NR5O
         VUxhSuA3GOjWfc3xQ8/Jy0QFY0plmhhoEjmKK2V1ZmZAjHvU5dEmQtFxItUcKa5Z2uCV
         NIXs8k1u9e8pCC9KX21iHWBi8Hnim5VPkY+v+nPM3v60oavgrg3tcXA0Xsp2vqKSTUwt
         jf/RhTuRud7Gja3JPq+eXSW852Y6u6LtBFVa9HRmp418xS91t4LcXFRwGLJPSs1RxOlw
         tow7vleR3OXD49uD45p2lmQ2hwoXxs3xednsFkE+TLU0Im2pe0pkIICVwAYyiYBjRdDE
         9DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769775295; x=1770380095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMOfBtvkC4Tbp14kDL4VSSBI+wSkYFqvD/3VKpvDmeY=;
        b=PTJJ4Noy8m6R2gfw0fpeL0nSx+Cwu6m5NIeIFG9nOBXgIi8Qkdg/k8lYZ2KNpS87Ov
         ecw0SArVRrC6KAS02GK1jVGidap1+U67rt2RS7qyukDFo7Kbf/ZAJzC9H1OoDtWT+KSY
         oqfkOfUXPaww5fQ4kv5Tir66foxoYpabmWIgjUNBN/6/as+JUPqhg/tpTNIKqagcH8W0
         uE6n69tWR4z6tgP9LE+oSAwfqz2/QmeuYSPCBFCN3aCwxHUL7j9nLfXPB1kmyDeIkHOW
         4xfx5XKZcicCROzLGsKSBlNB61vRHMyZtDKpy0smuyQ/We4XfK+dKbRbuPMGr1lE43Hc
         HEPg==
X-Forwarded-Encrypted: i=1; AJvYcCUoyqXCBUG8JeUsxS7E8S+bNVf8Pc+Z2ExOhjbxASjSwt6VU26tCK+XjSDD3mjOZvzsuK+2lwcbaOHD4oNS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzv3wyJOv87HYGbPLhvPaXMit+tx9ldSORz/Wn4fcmSO5auYsx
	KuAQ0ZogOjpUNM3dGFC2dAEtXqtmyn+ArCBne25Jj7KhmB0t/8F/CSPvawiMDOM789bY8He++V7
	FYzwoTuIRbYdQbpH42wF+UNmQjFKquczFoJKtS1r/Ep2vSM5vxaOKlipwmREhOcIIE0DP
X-Gm-Gg: AZuq6aLVFmeihF0UKuu5l7IDQjEWw3syc2J/CGwHPN7KowXpl39TF20b/Zs6Caw4pPu
	DkapP+n1ftAKp9q8Iw08TbwQmC2CYuH0UGjMqrxaAwqADq/YQAKztKnF8CnL3bwt7cZ0fZ2E0zx
	t87pv0N0NRcrc89fxX0LmgtgQhGMshQk4KabNqJJ/hscR9lRtgIRGP5WQ4JErZIdPiPN3hMjH07
	3b7OsmBmB3Ez4ZcpqVeS7uDVyfF1EkbzEij3Gs1NNWR5RGGmACEirX5ppiBDLuhbDbR79fZuU6w
	FiIFe1innuQjybP3JEOPN94DlSrDK5KfUne32tmTdWTRwCuK2IgnX0tAxcWdNyD9M2Mjg6Ch4iS
	imB/PgLeNa3A3FTo/kyygFBOIAysLMKsSeptyiUU=
X-Received: by 2002:a05:6a00:84e:b0:81f:535f:b48a with SMTP id d2e1a72fcca58-8239201ca27mr5837781b3a.7.1769775295164;
        Fri, 30 Jan 2026 04:14:55 -0800 (PST)
X-Received: by 2002:a05:6a00:84e:b0:81f:535f:b48a with SMTP id d2e1a72fcca58-8239201ca27mr5837743b3a.7.1769775294652;
        Fri, 30 Jan 2026 04:14:54 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfcab8sm7603671b3a.36.2026.01.30.04.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:14:54 -0800 (PST)
Message-ID: <743e5bb1-d17a-729f-76bd-f097674452db@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:44:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/7] media: iris: enable SM8350 and SC8280XP support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VYK95MpVY1Qgrtuv38hb_SG3tlO2UKOa
X-Proofpoint-ORIG-GUID: VYK95MpVY1Qgrtuv38hb_SG3tlO2UKOa
X-Authority-Analysis: v=2.4 cv=d6T4CBjE c=1 sm=1 tr=0 ts=697ca0c0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iwIoCGO5DFP6kGn-s28A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMCBTYWx0ZWRfX97T7TxpDYYrQ
 4gZP23958MHlrValoThfN3MdSHaNfru7rhnFvFMc5AIBNmvlHceKCSVfaBGj9yzcUYSKekUFi1X
 0hr1lCLBw81qbXwYluRkJB37rgwRatAdrHrGvWCe77bm6WqMkwlYn7tBpi+vGNqtVcctZrj4/UI
 g52Z9TwG1JZB9JompmvYAtwjqfjeg0HS8FUhjiQK7NfN0CTQyXm7DW7clZrqgNB/kP66ATqph4k
 MCas4lHHSCwUkB3UZSTFaC0hWWdGDVp6rWV4f9E32sbMGa92NmnKZPSQ1j1c7oFvFuJS99a+IzD
 Fze34FoKAYMTM7ea3ofdLrsf8QZ/HgQqIy29UhbanfPBKjaPNXdSY5P8UsNwH+5cTHqpHsYw9hT
 M8qcbdTzLcU1MdtvG8vPriT5OBTIkc0UiewLhT6ShyatDcl7sWhVaxzAAWMg3+TPrg2w2vg8O0U
 44oCPqIRTvTTtlqW7Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300100
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91304-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A807DBA605
X-Rspamd-Action: no action



On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> In order to enable wider testing of the Iris driver on the HFI Gen1
> platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> 
> The driver was very lightly tested on SC8280XP and (due to the lack of
> the hw) not tested on SM8350.

Could you pls add v4l2-compliance and fluster results?

Thanks,
Dikshita

