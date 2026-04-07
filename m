Return-Path: <linux-arm-msm+bounces-102115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJBVFQTb1GlxyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:23:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 536213ACBEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01A3530131B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A943A9018;
	Tue,  7 Apr 2026 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzj/N58M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZXRtoGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445453A6EFD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557363; cv=none; b=ZbqvO9ThU7QvWK7MIjIvdq3ybj64xaTU1G615RwPUSRk5trXWl5BIyo4t2Y5/2+iNnIGZCp3EfodynynGJXMwkuTzXvhPNwR/JO3jmc0q6eWhNpmmEAopWrWUYs9HMxaAjSeUYBBmE4uaAapoz4tRwyPZHn4qGQbnJb4RjWAxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557363; c=relaxed/simple;
	bh=3tkcCMkbL7f7CzwQ4dRdoV0cOFj3dvD69MI1Gp49SdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtXbbfAalP8z7e4/LhRHvwTJ9+ZZv/xDv2Pg8yyn5xz/wv1fd6FosHD028CLXBCqa6lDMub2KG61VP+lI6pTTzhVyNmFexzUOK5oPbRdYumxIl44jMJ399JUzURWVbwImF6pEC0b4KG743b4tz5RQfHDhmtvKzUzqTpbhf09ajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzj/N58M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZXRtoGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ZGJi2009903
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=; b=pzj/N58MQB/HDos9
	kcdyH4GCyrILdYTIiEpM2SiOffVT03RZYIGwTC1/kPZWttKjzCrzgj40GHxloO2c
	uhKd920gHoZQxKnNJmH9FUek9THHHTIQkjGRaj9u2XnyWDX5xUtu7bdO03T2GDfx
	N2vCT8HoTg6xQHpbUmnJs+gxWFLUf7O4lpjJPTgr9vLo9XcR+I+QAdoWyZHywAdw
	/YTl/K2tsZj4kN/baEiq5KDttBbF/qFn/iVAhOmE0JWxzf1etopWJyT84SGYYaUE
	Jfz/vYZK9avSyL32MJ8CnDuUXpPY71LfRrBjb/MTTGtq+jYY6gWFV/t7AaCVkQcs
	V6y1/Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrt8wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:22:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89e9d327913so19461826d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557361; x=1776162161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=;
        b=OZXRtoGGmnW9FTuPUJ8texOwPwYbYmDPCuXGxfsIDAxTHbZMn9aaZIbBqMRtdSf/C7
         odUJZR/F8+Ne1DL/SqLvHjIXhpscfxJeTsTNtwnNJ4jvcsmE1lEzBpwt8o2d9Jn52l2r
         C8shLEFGGHIjSsrJBgESBxvUfoWwD05KMKXsOZ1ueQn0IUvb4OcOnbOxXKFU+busDVc5
         1n0miScxL38Jv/cysEPdC/KZ6zUEVVf2MWbc5CJNydnVI40TgeDpZqh0x7SA/noF1/h8
         B+iCGfSod7JeB84WLbZ4a/StzQOsZ9Fxa0SYGVamihm1jqE5G/3vXXVzDf3blp7IFtQJ
         Kzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557361; x=1776162161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=;
        b=cJvEz+ueNNAYIMqxnmv8obhDEAtuwhAFA3z4qReq5ZGYX66SbHXSvPs5d+prG6sDzg
         +C7CQ8IbVTfwUp15Rl0CEtrXePNQjM4NT0RrTZLR6fBdhrUJSvqUcYvOvYG20Lnu3I6L
         vZkfmY51G67HX6BkbvqRPDn1ZQbT71POlIl6nEK7VNGil8J3doQ6cq5YbokXb3bMb/4j
         2ayTWgo/V5C+HoCZIAvhUIvkMX0L6vd12W0tO2k7h0ghiaszCOzMUNzd7ToTE2aP64yj
         vL8cs+2ZcpDS5QlgvEi5Fyq+62TPRRzgvvGp2I0AqoNVOzevLAwu5QPW3VfriuI3XE0e
         wpTQ==
X-Gm-Message-State: AOJu0YzxlhbWMW0XermnFgFU9Fp8+ju1E1w4NYIlhBc6gx4INJPEFMMj
	xxZ/tbxzLBYEZ2SyUbTD5Y8mZnBmG6LfBT5VaDctIZ5l9SJB9OIY6FZDcihtINUm/U/w5VtrKP8
	AA8HQnBKprKrhAVSly6WFlXB2/3c2Q9JeNMCn46MjQx8EN3QBMqa3FOo5R/nmWfUpUM4w
X-Gm-Gg: AeBDiesvuHPyuILHYujlHAY1szFdWtpx7d90tiWQ0kt5BEmMN/J/LuzW9Q2TVr/cb0Y
	1lLpqNV6ExKdrY4ov2TwVb/nvksKjhBaW0+blwGhCiguKHAL4EBhUMG5SjPIlwvbL8+qSryLFsQ
	pU50FodwCLoqyOFf7tTrF/DohOCGJXRgg9uZJsTFdiuoXfAZ0bknKUgTowd4JIZhzUiKrjNOQxv
	oWE8jY2mdYNCFUmJjEKWiuNKtGG3PgRnCUQFVa7sLN/FQRSSfIH2Ru5ghSvFN6FYQXO4NuNqu1r
	uW8oGJE84nsTC1uxwmRvz1H4v5uleDjOJ7nWqWyHmj2uH50PbX5MmGNMqiHg4ILPZFxoAwkq1FZ
	HUyT7LBoBy7PCZf1AeTAJBB55ZrWfU5JAFr1xa739jjhesjPVIJVIgVCU4bnek83uhb1kXUksm9
	/PkwE=
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr4543931cf.1.1775557360612;
        Tue, 07 Apr 2026 03:22:40 -0700 (PDT)
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr4543631cf.1.1775557360128;
        Tue, 07 Apr 2026 03:22:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99fc09sm545037766b.17.2026.04.07.03.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:22:39 -0700 (PDT)
Message-ID: <f6791bcf-f90f-48d5-a104-89988c2fb8a6@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:22:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] arm64: dts: qcom: sdm845-lg: Improve hardware
 support in devicetree
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <177541802142.2061229.9094394728986735362.b4-ty@kernel.org>
 <f63f25751b5db2ee5420ec4c12e36271ca22a864@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f63f25751b5db2ee5420ec4c12e36271ca22a864@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfX+x5loN4BjcJZ
 du5IFUzZMB19SYmpQbVfgptffCgwbrvlhEGXKxJvr9/Arf3fKVl6dj9WPQRTMK4dlrMzYlQuRgc
 dyB6OBn+j7QzwN1skvwU3p5Kh+v3y0PgRsQQjEZHg+/8hy+Q1mMdj0NGJSiHGAXX3CpLXB3ICvr
 DXA5aEswu0bpnb136KGkvOomzl230fImtQAPk6F/yuzH0I36YmZLLvdFzyuv8jfC6QuXdebMkuD
 pe7g2PCDCPfBxynyuwcMCFKewYT7wS19QHr/YuLUiu2GMAmGVaEO0sELbj/8RVr0iHNqv71cvid
 p4LjmEr/Vbs1VNedzCauVOjh8Bl2X1bMnI9Rve6wI1l0OwSY3UnAlJVsY7UH9AVGrPNKc9Rm5JJ
 n5COtvAqwkYvcjW1KiLIk+rO60aA4mhTn8efC2CTsKA4DhRvtWGJRpf8Tp+CcbrC6zeL87FoaAa
 w9sx8w+n5UWvLj+AH0A==
X-Proofpoint-GUID: xcVxWXX1iqlZDNB0dGy_4Xt8vAKqm_sW
X-Proofpoint-ORIG-GUID: xcVxWXX1iqlZDNB0dGy_4Xt8vAKqm_sW
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4daf1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=y76pSr6RzozYTy0f4XYA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com,ucw.cz];
	TAGGED_FROM(0.00)[bounces-102115-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 536213ACBEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 5:30 PM, Paul Sajna wrote:
> April 5, 2026 at 7:40 PM, "Bjorn Andersson" <andersson@kernel.org mailto:andersson@kernel.org?to=%22Bjorn%20Andersson%22%20%3Candersson%40kernel.org%3E > wrote:
> 
>> Applied, thanks!
>>
>> [01/15] arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
>>  commit: 6a9e8df732014c1c758bd3cd6254b5b4cb273c7f
>> [02/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
>>  commit: b9afe8581c0e14b7b56e2314dc7f9597bf23ef67
>> [03/15] arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for judyp
>>  commit: 8f4c53ae286bd6a113245ad53ce957e623374cf0
>> [04/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
>>  commit: e9f611de7ab51540c0cf246df6b7d4d99f4cec64
>> [05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma controllers
>>  commit: 4ec3045c969a326c458c53ca65bde5749e575d52
>> [06/15] arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
>>  commit: e746ed5af3084e9534135679c55e69eced0c657f
>> [07/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger
>>  commit: 995c258982429db93db103fc26fcb3a0acd6a5ee
>> [08/15] arm64: dts: qcom: sdm845-lg-common: Add LEDs
>>  commit: b49722c8a18cdd11f49357f3b8be23549f76a506
>> [09/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
>>  commit: 2e7cdd400b6a4e67c27fc3e839342824b51d01ff
>> [10/15] arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>>  commit: c6c66aa3ef33dc3076c6dac64003b29bd9515b58
>> [11/15] arm64: dts: qcom: sdm845-lg: Add wifi nodes
>>  commit: eb8fa32085261a07d763e9d616b3c206d0be82ff
>> [12/15] arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>>  commit: a5a5ad9848980e1019ca841fe057afb83debecfa
>>
>> Best regards,
>> -- 
>> Bjorn Andersson <andersson@kernel.org>
>>
> 
> Please apply 13-15. 15 is the only change in v8, so what you've pulled here from v7 is fine.

Please send incremental changes on top of -next if you feel they're
valuable

Konrad

