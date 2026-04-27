Return-Path: <linux-arm-msm+bounces-104738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL0gNUJh72mHAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:14:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 527064733AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41BC930160F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA753B8D76;
	Mon, 27 Apr 2026 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocBGaHMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoTV3oEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C839023A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295678; cv=none; b=YzKeF3Vxd5iPdKgydt2MU5cNejSoZ7sUsXf3eeAaFjDwkp+TeBb7mJXNntR9b3bgeUglKVG/J5qVUeTt0mR8D6Jje0OWR3qs5qqrWVIbHVR7ewPIDNFzuw4txx7MBobj8oZYhtUno1iUrKu+OUi1i343grQ5RndElow7d9mK0uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295678; c=relaxed/simple;
	bh=vfSDJ6gtbN3z3lVkJVbWTfmhrpUp2ibnfXP5RLPWscU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLCBGITBcR3lM7CShhunUs/9cOPRwAzUDcCTruEMrzGIgSewBglBpYD1vU5SeMe5Te0MY3PqR/pe8uUwzZhNjOk2q31e0MiICenEuZvkAM02lkGonYYjDuhuMFT05plqsZZEnbqCmcCHSpp0Yof7qHHn9l50tZO5zlCZyi2lRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocBGaHMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoTV3oEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kLM93962022
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oTwfVDw7QNHQ4l4Eu3rLR/gbCz9lqfqUZ3HQYe/v6Y=; b=ocBGaHMS/3/QPLyg
	oEGnWfC5Vui0NY8YtJukeSHGWm0KRUnVp3x295q+rRZghnSznYG0larhcV1/9WBL
	phs1q9fhY3Clwg9rbpXXNnQSTGCc2hmzNUhTXtc2bwnJkTlR8zmrIngMSrieNMz3
	L88M1/nRcwpF6UtIRKGMM0R3t1fwfXg1uNLmjviuoSqKh5A2F5k1aj/0DIALGEdY
	Dp7WpzraIj77ecGonTKp9/kZk5cGPuaJ00vWZ/4WSckWBrljPKsJUQikMlZG8hTF
	VlV/4N1/r7nZOQtqbnD9gR/EWNcRqkiJXOF+ANQnbzfthr3SGaUrYfSwsfGA+Rzp
	DqVklw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k317rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:14:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95687296dbcso445563241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295675; x=1777900475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oTwfVDw7QNHQ4l4Eu3rLR/gbCz9lqfqUZ3HQYe/v6Y=;
        b=AoTV3oEbf8MizNPZ5ADTTVVVA7P8j0SoP9pngybI5B4GVwKgtoezx2UPvj6RaOf6E8
         OvXbb/Rt8L4JmG/+LIPmdL+nphrOAGgdZT34wV9xbJBaYPDmN9UMqGH4cu6ps2gjqZ52
         TVARYDD/ByteS2zM3uKNhZVPuj1156095faQw7faAlhmOcIEy2aC0lPXTBAUD/8Q9eBc
         R6ALgN4kVA9MxvqdPSOp/v5K0+abwOYCRz1QLfuQhP33y3R9RV+teZh2H7isLwTVGpzp
         Ra9808gJH8PNdWH+sHpzQPzwJ3M1MTBAYretJDkTv41che+ZocFKV6AhGbOV4GaJsyIV
         1TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295675; x=1777900475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oTwfVDw7QNHQ4l4Eu3rLR/gbCz9lqfqUZ3HQYe/v6Y=;
        b=lcQ79abaEQhZCLXLBvAVQAOwPL6pVpg5MQBqkT6vbiImL3RsLfEf3Mrma0P9PtCtyF
         KGfjdcJ4FCaqf6uecBinvSMQaz9D/61hzbO/vP+ZfefPtvYk+kckqpYpYnj3+0tDTRBY
         JFOMrwChG35+oZEOFPgF/lK/GK0t9DhIylQcTY1z2p/DjN0rnDHKglRlQQ9HoAfY2Ab5
         8YG5q1voj29+9I/wxd4MXBLz0+bWDsTyqRMA5GJqODGX3yfFvy1FTiz+XJz1rcK3hJbW
         FyE0Jd1cGApDO80MF9ZkQh0ChVkEEuPwlssYCnrt5Ln+iTyyIiF9IbFb4ABL80Zlso4W
         n+Ig==
X-Forwarded-Encrypted: i=1; AFNElJ/qdGLl6beTi+T1KYCNkxkunfR7F2mTxPCt1zYz+0wc0rcTaNpwANg5d5JT9FZL+dFsiitRxrsRD4mzY/3S@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4Qpb3JkaQQLaWnU8IAlMiCsORSBwIfOjONbvMJlbKpVO2oQQ
	dqkDJAHR+1KHQ4F8c8YGEQCi+YYCqPmT/8kSfcH+vCvxNt5rrhmZnq/i0LzyoRAUOlnNpQCMkY6
	TJCxmfP3eIfFmWoAjDGPRloBw0No1tnwhuXwjk+O4WhYza93bgZ5omSnBqHAiognKgu/t
X-Gm-Gg: AeBDietjXTzknHzaB1EQP64fGaCM27TOpoDyypTUcHoQm/Dw437I/9H0h76Ae6IgSge
	iYcZmOr8o1tquNlXBSwlMn9n+TuVhpP0CpEJxr0XJRB9t2WoarmdIJMGFpQuomdNkbVFhfecu1B
	SRYcQyNdSB50kiP3svCvy+YQ/5ZP9Kfdm9zVx7S4nshOdUYoUWe/jyTkt17M97j1iCyKW/YdhEQ
	0dnHNs1BZU11Kl9UvnmNF6D1AVGaugHvuKVb60MUaxMgv0EVP07z80cjkFPOZPiZMwK0pSxyjUT
	V3NoT9Y48AOZ5w3I9DGOrFjInqHXz/Jiw1JFH/0xlRrCu3dLKzyxmFE/frCOeAgcVs034x7Z7nj
	5QzjC/IXDcUV/rfeESA/TEOQDCoey3ZGYQf/SWy5jG4s0WGDEcLf4eqpcovImKu5jqTz0/OcqNP
	/frGHrBzQ38U2Uew==
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6569919137.3.1777295675208;
        Mon, 27 Apr 2026 06:14:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6569906137.3.1777295674654;
        Mon, 27 Apr 2026 06:14:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d69708sm7043728a12.28.2026.04.27.06.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:14:33 -0700 (PDT)
Message-ID: <0314b78c-cd96-473e-aad8-6977b47cf1f0@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:14:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
 <20260427-gfx-clk-fixes-v2-4-797e54b3d464@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-4-797e54b3d464@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MCBTYWx0ZWRfX1bzgi0HCeLHe
 UHsnlZ1rNgMUnEww6+dMPKWAJlooaT/SV/DffLmMN2FUykFVWCmWH9j2omHP6103eKYswvbLzrO
 B85We2huxp26bRvG1yNeu1KtNy0Q+xMb7/dE+00+juHgeb7Vs4iTceqIEnoUiGIRw1l4MmU5V1v
 Bg49dvA9Mvs1NSNG3s21HcX4iQSWu7cwhF8jCl84Cc1cuf0Z8Dybn5iil7MAgbJNIiBl6Sn4OC5
 vBsFwz01aBLUWkqenXc+nsVf7dRPO5y3a1HEwXaGcEVshULAfDYTQfRKuJSJmTosMa/+XfZZw1Z
 shIyKHKplQfaQmgkno9By1O1+BrbuJ6LfSsaO2xUkAl2wZ4LwpSOArIXDzkf6IDi5LCnMRj9Cqd
 3vP7/PbC2i41erfXsPE3hVeGLM1uhpX9mBOmLP4dmOPHPoRQIDnZf3Ab4UGHFIiHvGe1qkvoj6L
 1oEnXyqzVa9UM5npZiw==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef613c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IGZpXzwkV2I0bIdW4VsA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: x-c99NBNifseUDBy1GJ9EZky7jY5hpUA
X-Proofpoint-ORIG-GUID: x-c99NBNifseUDBy1GJ9EZky7jY5hpUA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270140
X-Rspamd-Queue-Id: 527064733AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104738-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 8:38 AM, Taniya Das wrote:
> The GX GDSC control is handled through a dedicated clock controller,
> and the enable/disable sequencing depends on correct rail voting.
> The driver votes for the GX/GMxC rails and CX GDSC before toggling
> the GX GDSC. Currently, during GMU runtime PM resume, rails remain
> enabled due to upstream votes propagated via RPM-enabled devlinks
> and explicit pm_runtime votes on GX GDSC.
> 
> This is not an expected behaviour of IFPC(Inter Frame Power Collapse)
> requirements of GPU as GMU firmware is expected to control these rails,
> except during the GPU/GMU recovery via the OS and that is where the GX
> GDSC should be voting for the rails (GX/GMxC and CX GDSC) before
> toggling the GX GDSC.
> 
> Thus, disable runtime PM after successfully registering the clock
> controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

