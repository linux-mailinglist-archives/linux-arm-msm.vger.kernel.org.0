Return-Path: <linux-arm-msm+bounces-113815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yJunJIbKNGpShAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 06:50:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3496A3D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 06:50:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mHaACCYD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hw+UcH5d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113815-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113815-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96BC130275AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 04:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40342FF15B;
	Fri, 19 Jun 2026 04:50:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4531E858
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 04:50:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844611; cv=none; b=CDVPykmtDIxM68LphcLG9nWomMvcJ2eQd31JVHYEO16hKacjl2i4211h9+KlVg0L7j3tpMhXptyoYBejoxc2WKI2glqUEFFd6UCY14vaMDGVGBojZHeZxRXhUAHNg1QWORbSitIxFzD9NchMiMgaaVff1w0aAlw0nhdJkoqcTK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844611; c=relaxed/simple;
	bh=YugYfAkvOMN7Lu3THxpICZ57NxTRL0Hv3NO1YWbWb28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYNJoLxVmXLZF/Hhxf9Zxn4jfcYqJCD1WYWCTQ8BiVmrmFa2Hjc7eVszuik/0CdnWjrBT2TTGMgjUxZjCGv9CQF/NtVL0k8Zk3hu3fQz3fP68JEbQP1y33qpkk5R6aYiwm2WSADv5K9V5QEHnE+fXot01dEL1w9rTOOa0DX/UMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHaACCYD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hw+UcH5d; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2sWP61675516
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 04:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRq4CDm5HHOyBzLGqHqksbLK1NWzm5I/iyJtd/2glTg=; b=mHaACCYD5ykn3FeL
	7szb1xWAhO1lDBfEK8JCyP4kY+aKDslkUvWniUWW1l+xNkmBfHu4m+j3K0wYZM/w
	uXZtWrONAEhqHJiI4gxirhUerDSSaBSRoFBkyPOX+eMIT1w8rSrpT3skdW3OdwbL
	Syr88hlMK9lBBOkxd4cY/MYfpfGFUNBJkWeV8rRtXLe1n+Dx36OySHGrVDjuU9Gg
	ZJTZ2rUUl6Ied7YNTS3/j5bwaRJRYKxHzuvFTF19/6/4v2rKophkxsTEKPHGewb8
	ugdZRSVj07CjZ2eeThNM7ulVgfwF1gy9iCtVCLXM9lu4wX3itoof7iIpPmF9My2y
	dQUv8w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyra767-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 04:50:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422b544a4bso1137348b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781844609; x=1782449409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRq4CDm5HHOyBzLGqHqksbLK1NWzm5I/iyJtd/2glTg=;
        b=hw+UcH5dI5hinUNM0IA02FjGLQGz7W94U7hjxZnt9e8/ag5PNIOGJiS2R232EREkIA
         Xy+CYCvkd623uzK2SoHYqC+9m2aPOtlXvRVSvrbRTDrjRH+Lofm1qTIQ+BlFf3uPvmac
         LoinnJrqhC+DKq7oUAR7GEw05FLbgRVaWsQ77mAKZbqmP+0BMGGKeyq1an9BbZy8pMSt
         EhnGKNJ9Dq8Yc7RLjUCvyUAB5KBjOwAKEUvoAip/2sENuJxIFmrk9s2TWsfojlPYrpIU
         b/AWeW/N790qhY7WA2v2f7BDJn/izZViGj53+kZ5VLnmLtPfpH1/8LqvPE3lc32qzT9d
         Uj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844609; x=1782449409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRq4CDm5HHOyBzLGqHqksbLK1NWzm5I/iyJtd/2glTg=;
        b=Kv2uszHqGpJPrWn1QvQT84RYNSkLHxx5fmWQKoaW7Ats7o0htm1/0n0ZKJ64XZY8y0
         d/TIqQDmyXoxUkeSJL34ZIufAzcYjI1hzELqsn5rU0H6T3pXXzf9pAFTeKPV2h8V1E8C
         GScMQ/AOwo0TjWJXf3dt7hn+46E3kiqIlHbotu7K6F+8PmEl1LMhqZMPml4x62dI0Ps6
         /d0Jz1RO2rCpVOkp0tjKSYj3Vn+5KoxZdPWy2693xcuWYpUDktTngm/puX8OdRDUzmZc
         LuFMowVfE8O2gVpsDFhRZgGGaex+jVsxpqBVcR4SjIAERcB/VWQ0mKkVh3ObHiS3T5Ry
         NoHA==
X-Forwarded-Encrypted: i=1; AFNElJ9AuwWQNFXcOCQOl+YVZPvARaz/DCVbqAim8Z0P06+zyewnVvyMPEtzps3CDn1y+qFRjGYDkXzDFeLOr3En@vger.kernel.org
X-Gm-Message-State: AOJu0YxI5Idp2E/vEkEMtTzYwYhq9Ww/tYi8ZImT5PIg9bZLk1EZ2kF0
	3Wqr2wN0Hn84zb4G5pBAD4AnsQ3ORL+e0ubyfZsRdjSxPn4BHwPiNWRkeBxxCnCPk8H65/hZ/JD
	iReeDkbqsPyDFPYboKKtYymq1YINujZhrBwFjdPENZfjrSOL5vJdYM0RwgA632qjdqUsj
X-Gm-Gg: AfdE7cnyYSQFGGvYigPZduyhjFBEZCelLJjPDdLXfy4loFZkxYSCsx5fNqa4DJTDixN
	EJ2oRGgN/gR32Eop7qeBrX7ntBKTZIjAyxjiKzNNCVQ5RRuz1MYRmolSdgks9O5EzlFA+UO0NEH
	SAWfDDXOc+peQv7BMJ60zJaVt5i68wtgbAl+98g+3RkU7Lnquf6pl/472sZXLLhS1uD5yObnDAM
	tkIq/4cvQ1/yiX2ePljVR+i4rJNiGGgSAKod1pyxdfK2+mjPiXtmXJ/JkpxetDRwKo/F5HrEfwP
	rhVUe1dDBfhmqXVRkhZZ7JUKTvcad6qla47fCd5GiHQfhiU16k0v1ZvAnr4yrERhmsxQr+AxKyy
	g4bWDggggcw2m13fTAuIH87nSn26LO4heZkeLoFq9
X-Received: by 2002:a05:6a00:14d3:b0:835:4291:6975 with SMTP id d2e1a72fcca58-845508cce6amr2238496b3a.39.1781844609259;
        Thu, 18 Jun 2026 21:50:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d3:b0:835:4291:6975 with SMTP id d2e1a72fcca58-845508cce6amr2238466b3a.39.1781844608791;
        Thu, 18 Jun 2026 21:50:08 -0700 (PDT)
Received: from [10.218.19.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364cbbasm901324b3a.1.2026.06.18.21.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 21:50:08 -0700 (PDT)
Message-ID: <a7393eb9-4e5a-4795-b499-761eff129291@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 10:20:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] crypto: qce - Fix crypto self-test failures
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org, stable@vger.kernel.org
References: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a34ca81 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8rAcuamgrkKAINotf34A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: UbdsiI2p0lQEmGJdslgse6GSmLoqbMRk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA0MSBTYWx0ZWRfXw2LSQk1ZDkgr
 Wn7IGKh2qaPnIhGIFI1d+xR8Lm0LY70hLkRkQg71m8JjQi9jd6h1fkFxXtGOhB8OGPsfpZf7DyQ
 Jq8VB7dsqtsh/kALXmsB5qsjLQXUoW8qBMRVLFPm2ZXXu0CXGzARiTV5ZWwkFc6ohulFj45xvWp
 nvkn0gaKfnw9BKng4IK/UN+Kaljc+zWwZV95/K8s4hSAvCx8Fc1BQ63w54zaVIVGtCe33C3FOKi
 pjw6uK2P1sgxS9xjtGUG+1cyt4mD3Hky6zvJAcBf+dEK+4tAfCFK3BxAomn3RFiX2BplUpKnxcL
 pIuPOsANq0+HClRYH1nENM6u+xd/Dh8UjsHJWUytZywLa+mywwPPA9KB8SYg7oo+47QQX9nuKoO
 07B3DjHoB2JxNXQdDpbKeKK3BvX0FgsXewfn+/XxiFePHlYGRTt3PFzCi1cfMs7GVVdnFP4g13Z
 JD9/PiuOCJxi2ZaLzsA==
X-Proofpoint-GUID: UbdsiI2p0lQEmGJdslgse6GSmLoqbMRk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA0MSBTYWx0ZWRfXzoQ+20DT5tww
 seyueKnoXtBhImyu7zC0kB6udxqRCTJNHOQtMxMr9GU33TDwEXwqNI9Gu/2+o1r5K5WZCjzqw+B
 7HGUZ/QDU5xvVwL4P54I6nvmnxBoEY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113815-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A3496A3D6E

On 17-06-2026 21:19, Bartosz Golaszewski wrote:
> This extends the initial submission from Kuldeep.
> 
> The QCE hardware crypto engine has several limitations that cause it to
> produce incorrect results or stall on certain inputs. This series fixes
> several bugs and adds workaround allowing the deiver to pass crypto
> self-tests.
> 
> The failures addressed are:
> 
> - HMAC self-test failures for empty messages
> - AES-XTS returning success on zero-length input (should be -EINVAL)
> - AES-CTR: partial final block causes the engine to stall, output IV
>   derivation was incorrect
> - AES-XTS with key1 == key2 is not supported by the CE
> - AES-CCM: partial final block and fragmented payload both stall the
>   engine
> 
> All fixes were tested on an SM8650 QRD board with
> CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Tested on sm8750-mtp and qcs6490-rb3gen2 with no issues or stack traces.

For entire series,
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


