Return-Path: <linux-arm-msm+bounces-99887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNfhJsL/w2lXvQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:31:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE9328031
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AC1430DDD88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0AF3E4C68;
	Wed, 25 Mar 2026 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZAEc28/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeAw0Qe/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F5B3DB64B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451472; cv=none; b=P853o8bPv0ZqMr+/1RJvmi20TsTopi3qJFZsUeY/HtvAXeAvaCWlyZCVndjlb+hyHSFCtkPHhTrXE1I1g3Nu0H4t/K1SeyknS2E8////lroEcH0qGNz2/MhLJZhADmFPXl+7yffMpHgjKpHbrSYCmsL4OZ3hE2WC2glXHhVwt4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451472; c=relaxed/simple;
	bh=5YXZAMuhAv9WIGptBrNb0UA7Uho52stASuF9QrHVfi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEuf3wiU7h+rRFqgE/sFO1Vp4Qenxp8s0H+b7RRvsavZvsd1B432KZgg4qMQRzYrBC4FSf0Q+f7spP+amhhRUxC4XakEWdEaZSgKdbuU+0VTxPbZtmFs1oHdh1R7G+pBsFviETeGNbQwh76b2/a39OM/dbyQOGPdtTvbaU8v2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZAEc28/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XeAw0Qe/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGO5A3922622
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=; b=MZAEc28/Fylae5kh
	ZHAzIG6me6yMJVAHJUesiD5+qJyLvYqOCqyWf58Gj4oG4Tqh5gsC951JO8BWY8NU
	mBfbiaFt7pGuJ3oiMxGPpWP6cKOaMF/FrueH+AEULVu96axtmAj/r07QSgdxHT7l
	hWlcNS/7jQLUpu7XhVManmrODFllkSo16XIRtbT4UBlC4OGVA2YYYBZW/MEkcvN+
	/bIJ4jUZqqKlryKg69TXUjVMmTn2sxPGq4wuZYyWS2tEKZXnYvPrYae2TSUFIX+2
	TD6NcoJWePs8B+rf/HRyFDSGE/hjfWvbxh3og7vvayWacCVJudhAMMSEI0ENapbm
	yVDV9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40raupjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:11:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c0cbe0f64so4746345a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774451469; x=1775056269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=;
        b=XeAw0Qe/fa10T3NwzETQN8AVO2qbCLGCbk3qSdvKUavkWS3vM8I3OQ47Ra0RHFK4xi
         nUguE36/dmck/sWiKSvZG8mMZTBdvI1fwt+hM1r+pZ+XSftvfTTZBpgFPcflzp0SdjfB
         Qh6XVn7J0dvMOR9Vb6vL8Ws0ux7nbSmKXEPsS19yV4R12Hg7jV/gl2cDoBw3VyTLF66X
         L0b8mWE19Cr9Z0lsV71UnRzSDwL8s3e13rqbHtGe1pspctfvjljdwMF4mZI2zMlVPQR4
         n7LjgxZ1MfGej0THYHHZsnt40ImM3GPiUTw/9Y6ABcnyd38hnqtQeXYQ4GcGf9uaHxtJ
         /58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451469; x=1775056269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=;
        b=OscPWbk5zB4eWPKTPRx5mivOtWT9TjISrWkUoZGbg7jm9qKTP9TP34CA1P29t5U1zK
         2IgNRUscaiW5ThinCV/4X8FHd0C7WS/FwLaAbT4BoYQg7mPrqoZMWLMo9WYcmOINHxG7
         blJR+cpEZwWLbTs/6+oxNXcEq7m3dcwGzIqJY7WIHtUI3Mk6MhKSQW/rhpvQOx57z+0X
         qxkkdXN+pu+sG4rdd7cpE6apwmMtqDsH+FpJM355C9LCUQsW+fx7yycKwtRv8DkbHE4D
         p9fEj2vxUL2/yGnyDwOrSXK139/OtapSyaGSFuz0sQlz8/jn4TYRtKIidZhPPpGc/7KO
         48OQ==
X-Gm-Message-State: AOJu0YzSFninwEB/04glH7/UnCXKNP7YJ2cYh6rZZLOI+ualh0bjHHG3
	xPbT97R9FhR8iKXKiLuNcg+DUnCsgvuuVEvhUCJ4ULe526CUlGAKL5BXdUCVoBbAqL46ipfbg5f
	KE+0iiAErwqt47+k1byuOJgS+OqRQZ/HCoOosyMcFA/ePqlKYxh5BnLo/H00Y56N+aT9w
X-Gm-Gg: ATEYQzzwfkkHrHlNLA3GRdvluFfSkryN7thcIk1Mt/eBmiquP5rf3pQr7qztBW/jhQ9
	TYlQMy4Wex0/hWvDN59umZ963T1Frjg9TZvDBissn8Ub8UveLf/OOuKcfrheFKLiS8HeUK+H6UR
	uMcC6L3NZsvoqeEHvUe0g5hU1ST9Z1VPyuzXeYx5rgcYZiHEFIlJ90YxJr0fbdOqHbEnl7NBDH5
	/1VXAmVu7+j1jr+UVZFzhzPyKgDZf8J+wZo7gDrHdNAt23CT7XaNu9EGtj5dyu+KyXdgmGLcbKk
	I+DZgwL30m03Wd/yBdxp69YNxMqj07ILArHtfXT3SxJ1cJrfGVQ5ITKtD1PvvYUx4+Wkv5g4tsC
	eLUGuZ32eD6nF1Wuy5hkuIN11IDHOK5Q5oJJri7r2f7+TuNHDXK1wOQ==
X-Received: by 2002:a05:6a20:958f:b0:39c:1f90:284e with SMTP id adf61e73a8af0-39c4ad3a74bmr4220685637.53.1774451469047;
        Wed, 25 Mar 2026 08:11:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:958f:b0:39c:1f90:284e with SMTP id adf61e73a8af0-39c4ad3a74bmr4220627637.53.1774451468518;
        Wed, 25 Mar 2026 08:11:08 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c766e9758easm1193710a12.13.2026.03.25.08.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:11:08 -0700 (PDT)
Message-ID: <39d765f7-ae0f-4ae3-84ce-55b419ba3969@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 20:40:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
 <b4115d76-d3e0-4f0f-8ec5-697e116c6584@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <b4115d76-d3e0-4f0f-8ec5-697e116c6584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c3fb0e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=DtSqZenC8O3uiLbdm2EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: dv7TVevrGMr3Q85isxLfcfRKSe35xmUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwOSBTYWx0ZWRfX+lyVfKxT7fMv
 2XvJpUfL7PpmCe9G0tWgmQ3t99iGhereoQVYpIdZR/4ztLN+2NxktxYuWB+//L0JSHkm5RSxUfN
 iqQ0upZEdG3U//zMnAUBzC2lDR73EpPTb7RBKhbpEbmIBmBi3Z/Xak/Lmth0jg3zrtVGeQDW/y7
 J9EkGbnC8tW7h0WKgmotpZ/eCuXkjNrIcxw1WEkDVgtvX5OtQW8KsXArIze2J7PjSJ/49SmOW82
 M871cauRXzG6lD2R1flXXaaNCwWrGz9I530BjUgpTw0bnlXZYQ9ywEI6+q69RmnnrLwAU2DpY2N
 Ofw2nULTUtHK7HQfUO7eNa+MEUCOkhJY4R74HuHG4PgTV47hQYik5VL3uh0w9HuBAmjqWbNJriU
 hfmTpJQdgGe94uZvCkpeWoWN0nVwHtqKkMnZkmqdkrowBvYltbcqc+ELERPz8byIBI9HOCvKhrz
 y3k8f47qU/1YqajdOJw==
X-Proofpoint-GUID: dv7TVevrGMr3Q85isxLfcfRKSe35xmUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99887-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49DE9328031
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:13 PM, Krzysztof Kozlowski wrote:
> On 13/03/2026 14:19, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>    (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> This patch depends on
>> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>>
>> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> If you actually implement my feedback, then you don't need to keep that
> tag. The tag was given because you were pushing your solution regardless
> of received review.
> 

Noted.

Regards,
Vikash

