Return-Path: <linux-arm-msm+bounces-93416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIVxHQspl2mXvQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:15:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B565F160039
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3CCA30514A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E63F34252C;
	Thu, 19 Feb 2026 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b215ZAX9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOtwFAro"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3CF342528
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771513794; cv=none; b=WSrp85+gHY7mZU2/5r2XEROe4y2ZU9huv8jNGZmf9G9JKm9EQLwqbBdbSQ7T3hKC9AhyVX27afkzjnjtM5uubNsiOZzTiKEapa7YyleIyMVon6ZDz+th+x/ISkVfpVbZbWUJRuNg0Crs5QuXLDLOTgivR3uXSJYFH0XvpgB6OHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771513794; c=relaxed/simple;
	bh=S7jFEO9vRalxfn8fN14C5MBAiFQEw81uWfiW74iDBz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKj5mOBhhlveVhYwL7dG4a40j06qQdRJXAcSI7uU2uJ11lLxk4AXfIexFOZSrpCkP/eXJ4joSZsQObhzQ0foet3+EB0FaEWKUBGrLb1bVTeQkebyDMJcRzqkI5d2d+defMEeMRcAWrbRrpDxrLb61BuDoSxMflb22DjoSZYdOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b215ZAX9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOtwFAro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCllBr3077775
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUyHppmBsynyA0S3gPBnETmKaAVRk/FMrQkiLXcFO2c=; b=b215ZAX9CHQTqCrp
	0FLBfdFLG1j54aWI7oFAgKf5Fw2ntokl2b1+aFj8GGP6Qzo0G8ZoPrGPqhhnSYeC
	QdHJh0FPE+KGGsUhygf+XDuR5YW5PgdV28R9JxymeMZqYJDLpO8+oP5OephS3sQu
	2FkVpQWpx1N32M2XbZxlV/Dm5J+57wE0ys/NY/1NASiMsQbhYn8XAJlAaGoLx4rh
	EhxKSN3b6ozfqAo0+mAXKwAzaEijzBWLX7FFsS5sihnw4XprOfY0xzneXgNTc1Pt
	avxubJYSdJ9U+hnbD1bTKShA7tyCaKEbm/7qoD7Hv+O0Sl9Ds2lDAYDFfE5Wrda2
	TwbPjA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk81wqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:09:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fdfed76606so209213137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771513791; x=1772118591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUyHppmBsynyA0S3gPBnETmKaAVRk/FMrQkiLXcFO2c=;
        b=gOtwFArodTrhgelyOsTkvXiwp2rHXPewTmqwHlsPnRyU0UnG9dpTs4UVnXQHgjvuNV
         YQ+2+EIuDKO9avQu0qvd+pkVS/N5md3TWrh1Wbhs2cybUL1eO5OgFepbhkts9hZT3eI3
         9oqe6/8R+fy5W/e/goMP+f4CbQ7dHHpKj5hnSamZ9V6Ci70hEFsFlQuL75XlkjR7KVk7
         UeQSs/C+yaxZQ1pG40CVgKIpY/9knCyUtTf1sg5VpHs0hVsu4XhX3Fb+D3HK67choFcA
         CluCl9siPe3IXIIHzhEXQxdBbB1E+VOaxJQXiyjjbd28QVrGx9P0P7O6aL1HwsX78tTI
         qSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513791; x=1772118591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUyHppmBsynyA0S3gPBnETmKaAVRk/FMrQkiLXcFO2c=;
        b=Q0gZ7S547uwAd+8VEct7sTl7ITz3o5PEmInK/nhgxQiIVodMEjSrQx1iMqPoxB6Qe4
         L9SQu1ZESr/ZKajbfgsrWz20G9vVwnitpfn6+oYQ8TeNuIlSpK50bvhN7aIIMuwOOXLO
         QTkLXBOIY2awu5pCm9HZAbXSzayJ5z9L1K11Fg0YTDU4lBAOIm8FZ1HVnJH1xxhFzow/
         cmkCkNQHZhF1H42blU2QdDRgSuGLEElmjdmOyrmY25QcsJNtah/Mu8x+W27nEKlbG6K5
         Ia7FNsUNckh7/lOpkJ2ehaZPcG/DHOi/I+0HS1mSWRSWcgGs38ofL5nLbZKLrxaOrQFL
         eMoQ==
X-Gm-Message-State: AOJu0Yzz8l2UNdOoUtlLLA4Bsd9jZL5YjYgdU7shuLhb5g8RoQenFMgT
	h3X1i9XUrotqy+ZZ3s4puVcpuzA5MVwfFQbR2HiGjUJVNvYo6fVjniLJXKyQ3UUC5Y1RCb7dMFZ
	wXtYnwQMxZ3UU8zGg7gzHnP5ZWdsix/QJaxAJ2CqqcUZhXnf9aBpPGsEFwH8YdWxwBbMOkZhIx6
	2T
X-Gm-Gg: AZuq6aKctLmxZLhlAUDd4Y6F//03tQsq3JcK8oZWbpfOKQtydpCUcRFXOGnc9Zc69bf
	17KkcpOT42n/4E8dsFwHb9ABMafi2LfJoogWMBoaGMnmUqn4GdgaJmo7mYWMYpxf0aX5WswzfBt
	oPbWb/QeExoyvjYxHJMgXNipaOqegvST8mjvZWIXOePj/X6vJZAor6aj/3VXlPHziV/e4GAjpqW
	GhM1af1f/0oeNdCLy9fMNgk0XnuqlbQg7jrYVzowFGWEhCRnyelCzbHCqjm3KT4uIi0JxilREe8
	Qz049i4Tr/trCJoHav4PBr18KgYmTiU5lIekB5HNDdafwZFfXxkh7wFbheXGC8HEBpkQmfBH/o9
	Xf7QEmdh3ZC2jK+QYNrQenSjmMrsEm0VG6DHjd2dm9dHqJvsk0Rgz3s8W86ZBmAeaxiumlc8K2B
	n89io=
X-Received: by 2002:a05:6102:6cd:b0:5db:25d3:28b4 with SMTP id ada2fe7eead31-5fe16f17643mr4465210137.5.1771513791621;
        Thu, 19 Feb 2026 07:09:51 -0800 (PST)
X-Received: by 2002:a05:6102:6cd:b0:5db:25d3:28b4 with SMTP id ada2fe7eead31-5fe16f17643mr4465202137.5.1771513791253;
        Thu, 19 Feb 2026 07:09:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29d471sm4087758a12.9.2026.02.19.07.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:09:50 -0800 (PST)
Message-ID: <4057ab1f-494d-4c70-b5fd-8f18783ae7be@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 16:09:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sm6125: Add PRNG node
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
 <20260121-xiaomi-ginkgo-features-v2-2-fb3ee94922d0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-2-fb3ee94922d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -NtYkNw7szPHImJw6RjkuxuQvgBL-V8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzOCBTYWx0ZWRfX6kS+f5I077wM
 bx+OeGwgCDDzuzgXVock5s5jCy/k5RyFo+ZNtbg5j/WTXEmcjzPUNfd5jxlTUxGHeE5hYCLVhEi
 wce6+ROzgDgqGNgoyyk8aNxylZ5AFFUCKmjohlYX3wK/lmOTZz9vlCGSXfGEfy4vLWFjflQJ5Yk
 jmWnMXa2uQxj7GHo0FpxhYDvqHqlKLQ/AcPUJcGXxOzmMhQnye3lA/mnfuJxkRLLkx/aeARHY24
 lVplvM3WkFg4RfXRgzdud5tbqt/ltKsy6vkoXugxYnYwKTcNxcS5ODeE+xbyqTW4u0DZyaLTuSy
 GCrPCRIyjPW/ELPVhnQQeRX9vOvCbvjbPgPWfVXunMtj63OoNpi/7gOWClttoc2hSKLdJbWPCRw
 fKWBzwkprYtGr1e07OaAKjfHvPpZTW5LZ8dOEBqHswxtm1EqUuFVduLNnL7rcR/RBZ/CW8GPE14
 GdwLeoQ2IWOdnysA7AA==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=699727c0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=lW1k0sWwHEZPp6lqD6UA:9 a=QEXdDO2ut3YA:10
 a=fFR93BqyA14A:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: -NtYkNw7szPHImJw6RjkuxuQvgBL-V8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190138
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-93416-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B565F160039
X-Rspamd-Action: no action

On 1/21/26 2:26 PM, Biswapriyo Nath wrote:
> Add a node for the PRNG to enable hardware accelerated pseudo random
> number generation.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

