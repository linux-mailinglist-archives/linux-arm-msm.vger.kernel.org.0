Return-Path: <linux-arm-msm+bounces-87385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA420CF25C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 09:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4BEE3002FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 08:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CCD311946;
	Mon,  5 Jan 2026 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbB9k9Aw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzKjKviT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4DB311597
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601017; cv=none; b=EXtuZSzukWZu0sFS9QD5rF8/nqlEzdTFGCvYuYZuilEw1uxbz+kQkQULuyT5T9Pp+9V2ZhwYDDBuZLP6it2gr1URATsx9OR8Pth5GagAHDi+BsDunlgGuB49B6XKFUgswP5VtyVr8O3p1WA3hy/i3V4sH6/YO1HFFoDBm1+bzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601017; c=relaxed/simple;
	bh=H9aUv+PLL/BVXBiXpLMoneeBQKadXbm8uYfCo/k+wKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aeEAxefLrQTRmo772neSv4elgp8TsPEMyXuJZpuat+pAFlrAsdSuJl4k59rHFR/GHuthdSaB2+iaEir/uLZPQPTNKkOL13SEfPeCQ2MnYg2J1GhlQPzVkxamQwKaW/qrDsu1NgCIGoeFpDM+b9weaxZSLh0iNP8F6r9w1quXXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbB9k9Aw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzKjKviT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604NfAjv3735858
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 08:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18YCrzwPnslDtu4eM53n+j4KlC4xTSp3NlQu11JmA68=; b=XbB9k9Awf9GqhO4a
	z6V8XueCPy1PhrktQj/sYEz07Mu2xic3Upzyht/H3t/ZYzp3OfNA3ugaIxhEJ4Om
	ETV5bSTL+M8vFCHMU+B/wRBE9T4KsFgFN5YQiTjalHc1Ykg7akzukbnEjLPiw1G3
	wvQy4sakpoPvKT1E93Y+yafUS+Zx4zJhEUCDw4a7TCvLnbQJuIW7jA53fMwOIwtB
	lt+G2sL0Mko41/BkLMP697zl1byKBAQPcehd+mL3rMWnyH6eEhfa7wmFrYEjtJIH
	6OAuMF1Ilh2Qazy1GnqOOrRgqqZD+MqZ35+6IeqcJyv9QRE2f1Q0ukmcmYanAMt7
	7ssw8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2quv2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 08:16:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0dabc192eso322928485ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 00:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767601013; x=1768205813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18YCrzwPnslDtu4eM53n+j4KlC4xTSp3NlQu11JmA68=;
        b=TzKjKviTEV15t3XeLltleVJu+ZYu1e7V0sJ95hkcI4ru2nDAuH7ouC5kPbjkxw2O5n
         Zlr8FVNIfHM87WiLcpzfZhh18yfb/U6+o4AQNrC85Nmn2kGXE2LxYbmt1b2RBI9M+NO8
         /nVf7y4vkgKznKA7ZJ9qk0E5rOne6jIdFNzB3+OR467PihUMCRFnuRVIO8+yFIgFtXBg
         mWVWZvXWiAW1cw+Obh+FTN+MoiK9gTd0xQSO/dVB4pqlQTuQ9xbwcLLdX36pu9G5NP24
         vxW5ZVqbGMxtS+MgCotF2ZuOCZKpulhehOTF9eZNfq8yexvFEBEiEI2XbZJKDTTXN2DJ
         Ojzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601013; x=1768205813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18YCrzwPnslDtu4eM53n+j4KlC4xTSp3NlQu11JmA68=;
        b=q0jlwmOkpIolhGuiqXZbU0nWzWLoem3/+WJNSOq/chhYK9Rq8be48f1iz7roaBZk0I
         56/3khUG8k9I/a1WWgWZqZHBcCz3/Fvg8VfnLupNZfaAdb7PJ/vGBTL8f1BxzF8riOjX
         Y7WXBisNYiSmCsqfQ+ESXNvp8363MHyP4XRsGBL94frW2M2roLPPG2tZta6pYomRf+Du
         iYJQ++M2tyXX/EPjbUd32Y5ZKyI3N+LP+uOXO+LYV6GorLVuH0Cc5B/T3tiXjINf+IRv
         Ob24vKblnd2DYX7KXZVwfs6tUImcEsdXAdI6vlrlZn/WrVsIMkJpVAySxBg3pEDYv1pe
         Ak4w==
X-Forwarded-Encrypted: i=1; AJvYcCWURLa3DToPL8wDbbmoMXkeS/Z10+ZCnZHWJ7NWupSn26OUvbsG0aroxBM3tbbALr8DSU5wSlr2L8pB5/Gi@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8d2dMmu30H4Q3SbhrL0e3FFXSId9H7g/sUkuHo0WQr22ssOa
	8Tf9gaLWF+eAvDDBW9NgDnlTg95mQJBXyMpwqN1AaBlGaGOX9v/Z+e7T/L/PbuCQU/kqtszgAs+
	AUDS5uz2PnZcqUhsyDndQ9Gd2WameTUUBZUona4QeMcfXwA5VOsOyph4SSvitdjXN8um+
X-Gm-Gg: AY/fxX5+OaCQ9lniTsxGJf8iiwIwZ5X0tWvRi2FBpUHuuHi6OjkVwZ4SyVOTZizhwLC
	TvqhZbDmzbF0VeFO2yrz3UOOTrfSPPv5fRUfNQwql5FuUcRW9JY20k1aTFFNPv22PIt2lgJ7LAF
	Wc9+rM38wxO11Gg+QIdRN+pwyOv6KBuWl6GMXwItEh67b9P85PWmK6kl3s8bl1KnpNt2izznYkH
	M9qbc4o30DaxlT2MGthEMg2UHUGMnX4qKjIuR1loKWgk+6Kc3KAUplR5jvZ/d8sX3Q3hXA2aste
	uSaxTGQx8gtrvWh5IAwrm3EWajExLgRAMXX8PUXqX6W4ARLg50EjVenCwvlaI/pOL9yOwuH6OeF
	gjPizwA6Ry+OIluWkbczSITh4CkVvzjAVDUNBkWlFAtK4WKjHXiU=
X-Received: by 2002:a17:902:fc46:b0:2a0:9411:e8c0 with SMTP id d9443c01a7336-2a2f272bd84mr472738225ad.32.1767601012913;
        Mon, 05 Jan 2026 00:16:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF47iCpRyTshsyeLrz78/zIsz21oTS5Aj3RsHakwta124JthwB46ioZMbAIB4ET4fXUvBd3Og==
X-Received: by 2002:a17:902:fc46:b0:2a0:9411:e8c0 with SMTP id d9443c01a7336-2a2f272bd84mr472738045ad.32.1767601012449;
        Mon, 05 Jan 2026 00:16:52 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c5307c7sm41443575a12.28.2026.01.05.00.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 00:16:52 -0800 (PST)
Message-ID: <336fff92-c3b5-4214-9a78-56098769062d@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 13:46:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] scsi: ufs: qcom: dt-bindings: Document UFSHC
 compatible for x1e80100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-3-pradeep.pragallapati@oss.qualcomm.com>
 <20260102-logical-frigatebird-of-elegance-8abd82@quoll>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <20260102-logical-frigatebird-of-elegance-8abd82@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZggLcX0574GRanfVhAWnp1cFCZvrRjrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA3MyBTYWx0ZWRfX78xcq2adPs3B
 rpVZ3zqpC+FllOzOgscd2UOqr7ZkqR1dYAvDXrE4IzhGwmNMZqNyJqpffvWqHqg6W0kA2uxH9sL
 ka482xpx4xnv/GJs5AOFglhtocMMndBa5D/wHoSGIndKSGOEv7o+LSzTqit/rcqzxTMXnfHgxv2
 5BAcfUE8bd7Ku33OH4pILxOlZPSkIrfNKthLIC0KeM/pbzraJDU1Rn7wUTawjEnMeHKmFZ3H3V6
 wFp8FaDvZoPPH5fsz4HW93kmOIqpildgr4ZAknPj0qD/DUm4hM91sYFM634wT4k2asYLS1ItNU6
 riWYl/6B6+d/QpcN3DcsDASr5qpAr4hxdYBa4cwtVdmyhrugHlizeNfn17Dp38YOLxmVU+od438
 Rex//Y2SjHN0Hn/KE8u9aOryGOR7VPHRQ3Fu0ga3A3kT8EpAhOOAXagOLiY/hWdRUWia59RbOqx
 uNbLfLkj+OTHhNK8lQA==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695b7375 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=TyPWlNIwSm5TisNF1W4A:9
 a=QEXdDO2ut3YA:10 a=i6qsmYmKKdoA:10 a=csto0wWSG80A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ZggLcX0574GRanfVhAWnp1cFCZvrRjrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050073



On 1/2/2026 4:56 PM, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 03:49:49PM +0530, Pradeep P V K wrote:
>> Add the UFS Host Controller (UFSHC) compatible for Qualcomm x1e80100
>> SoC.  Use SM8550 as a fallback since x1e80100 shares compatibility
>> with SM8550 UFSHC, enabling reuse of existing support.
>>
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
sure, i will update the subject prefix to directory path in my next 
patchset.
> 
> Best regards,
> Krzysztof
> 


