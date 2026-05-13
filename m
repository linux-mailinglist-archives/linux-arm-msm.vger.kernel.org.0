Return-Path: <linux-arm-msm+bounces-107384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEAIIeWaBGqILwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:38:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997953649D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07481309F3EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A8447D95C;
	Wed, 13 May 2026 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgEkMAYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtthHhKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9C47CC8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686243; cv=none; b=dv2JRS7pnsMv+LyA1AsD7FgifHgVlkTfkFUTl5NrZcM6tnUTxXFIhhFacqS7dkdkYfgL1+Vuz/XrR3pQkNdFQtZfZSn6C1QeBC+YkE0UDpkGvECVEZnEYMDpoJhPe7Yg8MLgvLbwBSgUTV5qX5rWiBzuIXZMoI6jlM6lS4gRamw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686243; c=relaxed/simple;
	bh=luAq7DXJKx8vBvfT2bVB1S0HU4SGbPOQLpxviv6b5Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIeI591Z6U/6o81RwVH6Y0fyQBhGGP1/7DLPwbB/6h6GN29btbT9H24PK84m6McMLqnIc4t+4unA+ozjsUytqqINuQ3gfj4WTLWDRgLDr6mgqJJq55k4xsPKmn5isFfI6V4AZYXmd+OcvHOJoQ4eUF8Raz34Be5BGQwPrOg7xZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgEkMAYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtthHhKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCc0GQ2965290
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXTDSi1x3zyTbG7iudpAT/EqeU148nb6obfK/o+r5aE=; b=QgEkMAYyK2rJqpvn
	xPIVDK2TwGPj0gVti7Iy9lq6cowwpGTJP5DAwSiPWd/BRqL/cK3c6tSXhvp/f5gC
	BG57BPtmLHOVbKwzo1rVevWSTRr3+G3wAh83/zR8o5f3yosZOU8H3ELPeldS/eMg
	mf7ue56cU+6TZptCmQoUKA40rGcIM+5Vf/Yw+TDJetUIfvXYDiHlEgWyDmjckOXT
	g+g0sQXOLJvTrL7g2yYTn86caczXE9M57DAfmcwQ+cyqNZIZ/zMU04KMB5CLhKps
	MK22eOR4wKjs68cJWMbCwEQ1aHEYApwAeddPDmiDdujN3THi7Xmg7iOFyrWpk5EY
	8aF/WA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5a2r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:30:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so8749095a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686241; x=1779291041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXTDSi1x3zyTbG7iudpAT/EqeU148nb6obfK/o+r5aE=;
        b=RtthHhKfw2AJAXoKl7twWc0IdwbfrS2wih1xUjhRplBgMMbbJwmYhZZApMmV+WDrlT
         Hm0m01FZ05kXz+QA9bikOvFzHzXtnCZrRoMCBnCGDaEMgiL66KG/4pr+03Z0iEGTP/Br
         6/oACrA7P9OTFhTR2l1LjGcY5zeyKZmDDYt/szZIaqTSXWxW6E3uKydW7NxXcOfyTPu5
         dAsp3D0MCr1Drbm3BJWpERn97Q8C+g8/RaliLyaImjW+9lunEoRXShIFeZgeIWZhrshN
         8zm4I/3E8sYJnh+vQxQ7EXoFxpYs15v+UII2MLE/tjNKSG6JAfvEJ/A4kdfMdZcKMPDY
         TFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686241; x=1779291041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXTDSi1x3zyTbG7iudpAT/EqeU148nb6obfK/o+r5aE=;
        b=stwgx0ELN4h+R85GM2t8BCUxxENX4nx3HH1RqrQG8tXn4QTCFO9SEoIYu3rFcBvMfO
         jABss3KRWXi0B0EivK+bx0cJPkw50DQCyM5ZtDqg7a9ADMEkTgEsKM2+sg38A103CpU9
         a5E5RiGX3/3yd3ENLjFKDJeXuS4XjJKPZeutCzKZnyCSzT4DMapkWcCr6zfUkOBIINW1
         PoVzeeWSGhShhtjz/Im73FMUdnhx1hbWkPmPkInsyGM+ffQJzl0ZjoIWHAW5YQ6t6/Et
         0sE+pFYEvE6WXEqtdiACu+nGxBoTaUaBuXf1OC4uIBIir/3Uh6CgPh9ZvKChkZHwnOdr
         JZLg==
X-Forwarded-Encrypted: i=1; AFNElJ+qsq1nDBP0LrEDnEaHYZbG6vWD3vYZ67vxIEJbT7rw5sMlq6Z1MGm3ZpHHcG6MJaoEcWz6dX5r4Geca9KE@vger.kernel.org
X-Gm-Message-State: AOJu0YylPvNzWY163vNkJ8c43lDELle7BJZ3HSLwgYd4UHvy6QRVgZhL
	dBVYX6Bc6eN47ulFGhqPJOOD4HKLuoJuCNfnG+H8mgFq0Ae+VLIm9RerYq3Zjmm5NBpFO0o/ncN
	f3kkaHBMmTWL6MYxsB9EY1+iHZKfU2ZBRa5SpiOjIOZqpRMjUj8zIerzcxT6KQwkK8+FR
X-Gm-Gg: Acq92OH9rDSfltjdOlSdPvRzxHtiudNPiXRPHESD5TKqXAeu5dbObf3iH20CLS8pqi8
	C0T4gydYxu2MZRNVYpzEYEUmabuCOKG5Tkt70tpFLgAvrYFNhCbyrFmwfsI4A8lU/wInzny8PyZ
	4o755JSHZ2ViqYSm6km76+IGm6EX3g8jORSVf/Ul+YrDwNo1rB2yfHkd3IRYjeclBJ6qd9nRIZO
	qfV4ZBr0fDQdNgO90ayT9+GqUVrSLu6J6SD4nBp1axmpSd57qZm6mDSFdVDwJKO2SdnePsop0It
	Qxd+AJEOn4tlcXvPSVFhVKBKKAOZfiBXTPdzVF8PDOrZcQdyrhBA7uRVULrrObU7s3I4TsxxYxT
	hGSoyNLyjmB8zF4gGfwJCaQAISHcwNLj8AiQnvPsgseS1iNvyTg==
X-Received: by 2002:a05:6a00:94d3:b0:827:32de:d197 with SMTP id d2e1a72fcca58-83f05c4113amr3522072b3a.40.1778686240942;
        Wed, 13 May 2026 08:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:94d3:b0:827:32de:d197 with SMTP id d2e1a72fcca58-83f05c4113amr3522016b3a.40.1778686240258;
        Wed, 13 May 2026 08:30:40 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682aba01sm27002322b3a.55.2026.05.13.08.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:30:39 -0700 (PDT)
Message-ID: <07247629-68ee-4a4f-be1f-7fc44a9403c5@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:00:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8750: Add camera clock controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260511-sm8750_camcc_dt-v4-1-eab4b6c3eaea@oss.qualcomm.com>
 <agOHPTif98-gTk8_@baldur>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <agOHPTif98-gTk8_@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX5BjpXTxfozlU
 BuIGTuc/ZB/ce4bf0T1lkcn7+D2f4cZMWxzD1CyCp+1BXoUFELbssCTgBGC3GfllcyYBFPpzuju
 gJG0Lxa+288E3KXdsHt7SNDhzXxQix0txjCgdz6oI6ac6QKZvCJsUPR7jXl7dxHE2Cvh5K1KtGE
 9AnxSs3hi6cGtN2AKAUhfXfpcVelbysxX4Dx7aR++d9e+G9vBHBtrhfk55v32DvYx6UObz9FPCj
 ZeqWEfKFVu8GzxP6ko2dFGhPdK9T7AJPADxroRxwhbj/5hlg0zTukAxq/9+1WP8ks3osQ72xtNQ
 Bmn7CXpv5DWwSQTeCF9qb2pUR1E+Qnmg0CMlnEEA9HtQ2aorXxOD3F7uTq6QCJHcP0lJe5/ymvs
 f1gG/wdPBN546TIJDWZO2znWIo1hUwCzuftoAkSJnqj5VgkemoGwupV0GQp/K22KiLGbKA2Pr55
 YYH9p605jwTOSTFUFJw==
X-Proofpoint-ORIG-GUID: wPjUS2xJWRV5GiNw5HAGaSNVZrf0PnSg
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a049921 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=QCtv3gAnLEb/jX3y9W1wMg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=HJv6DiLbUnBpThDv1aEA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: wPjUS2xJWRV5GiNw5HAGaSNVZrf0PnSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-Rspamd-Queue-Id: 2997953649D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107384-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/2026 1:43 AM, Bjorn Andersson wrote:
>> +#include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
>> +#include <dt-bindings/clock/qcom,sm8750-camcc.h>
> I had to fix the sort order, but the merge conflict tells me that you
> didn't rebase this on v7.1-rc1 (or later).
> 

Thanks Bjorn. Apologies for missing the rebase.
-- 
Thanks,
Taniya Das


