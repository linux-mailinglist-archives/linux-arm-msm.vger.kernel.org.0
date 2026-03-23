Return-Path: <linux-arm-msm+bounces-99201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDkBFqAcwWlaQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:57:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB02F0ABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F10F30E1FA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777E7395250;
	Mon, 23 Mar 2026 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmI1fSy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErNTddbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA1F3909BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262874; cv=none; b=Sgn2AsVJfJXaXXCblCq4D86riXQT4XOyy/tRsEXI4GIi+2G/zVesUDgnpS3jPchWCwgyYMzyecG3I5xtmg7m15vTXGjbZJEDt/vdi90bin2eoydNje1vP53gNSWmWGBXz+A5KZGcxbuAMCINGb2F68JYlCv/Zwma27Czk2Ybkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262874; c=relaxed/simple;
	bh=Fw85m0v6Mph9KZA5cy+74jSLm3vBvqqJoAfIxKRwDG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R47OhPMRJLmZUoFaWeXH3QK6zg7oZTvz7hQlKZ9aD9Cwq+JMBWCLuIt/qIz+2+6ggVMAo8oZsZgc+lCqMzL439gTS3xvFh4ZtiyNP3sAfQ/75YDx2iLWg+OMdCtY502xsy2vQ0Yq9fO525f5rPraTYV/vBU1CYYFdQ9FmGkXJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmI1fSy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErNTddbN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ABUm3588156
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jBS5kZecRx7sToL0JGFpxeH5VhmJZeSLtK5muQXggYQ=; b=fmI1fSy526bTBKzl
	VOi4K/WIBstfPV986+lm4kKJcBAHr6oG+Fo4P5jOab8rk9GonY9kXr81zt5qXXrt
	stiwtAguJYbV1v6z1hAYEBkcTmOvsTojAepY9VoIvg/WYqyv5YsR8dfhx5CUPmGc
	yClfyRN0kZdyOn2FRnf9DO4RaLXisoJ60JXEhuwy/8I37ssaOFtZa2CnIH0ijUCr
	sAceRnvSF7Evj5YTAXA9XA3ZrEQBhOEsL8dAys1o/quDyBWSOE/kdtqZ8PwNJ/4m
	1sCPNixmls7c5lJ08Ovu/CDY+HYlhj7IGADK/pgt6z1OqEFhzY9GCPS74/6e1XKR
	bFHi7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jxg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:47:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b68af943eso1304091cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262870; x=1774867670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBS5kZecRx7sToL0JGFpxeH5VhmJZeSLtK5muQXggYQ=;
        b=ErNTddbNyL4VFd6YptN22GoP7ZxydHBWG3aAMDsLmSLx4Ipldk1unjtKVFWxpbRSsk
         qPo5/Ios+aZZSCoekBrBAJh0SeQZBphlrEj1N+eNZY3rtYPd8seuA1PPl6D+mBmktKGp
         3lvdcMEVkoaLEsShOIEXcumVpP/ai78Arm/jGn2z1BhNFiwVll5AxGozXT1SHBNw1M9F
         7qnqLjF1Ol9eYm1eXpR4DsnT2sqKufkcdeuEE5TDAgk2S56lT07lF4iYz2Uu4aE2hYEn
         ARFAWsmVxJh+U4ihbMmf2eoISSLCZqGX/ODYTzTnVfzYavwGPoPJ8FJuGwyQGi3CqXtg
         YJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262870; x=1774867670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBS5kZecRx7sToL0JGFpxeH5VhmJZeSLtK5muQXggYQ=;
        b=KnVAKIFnDDnUwLy3b8YCHkzn5Wl2qy/6fJ7BuvKu2k8ELgUGUVp6QO7d6h/4ZiP0xb
         12Whsb7eBWPxy9JW3uLvIpfFCw81IAXykVEY0iKvphhPf/yofe8QqNiE26gmFgD/91H5
         ZCEPX165ZIYJOdstTnrodJxITETYwOtQY1BPyISYcCQiDTvzRw/Zyotih/kIoPpV/DDw
         qWELTSD6Wq3Kf+RJut+WfWnoVbCsnQ9dFqnvEXjGNqPtHcsZ0IRf3hwaZ/TI3Zlql+Z4
         BnAX3e3Apm1AkwtCF1MrRQq13T8jy1uSLj94pIb+qzngjpxYrEXSmaJQlgK2w0JpfO7I
         qWUg==
X-Forwarded-Encrypted: i=1; AJvYcCWmk4VehSnIB8AciQwyoeGMbeudC+WsA+OnqhvXQsG7Wex3LzOkVMbPRygN4P4nIgQfzT6ssJ4Hs6B4PTD/@vger.kernel.org
X-Gm-Message-State: AOJu0YzY6RYvacmnZWFgz9PCfK3IrMJsxkmLZCo3LUKbUSp9RSPkupSJ
	za7mTFDTI0SE5uhg990iytC1u7b3/evX9ckFEAIKySVwsga86bH7FcIFvovq3jHpFf9c54IAHOT
	H7KayhT9s5bYpfA5WFC90wuoiH0HXv1dpZ2R52A93Sa74zvECowTzTCMRlbWU1Xtf56Yj
X-Gm-Gg: ATEYQzwAD3xzAYGzjCtV3jQj1W4YrnymUpGj1Vyh7toQ80rn/S6h7VHmfDPCw70PT3u
	t+97hjD+uOe/9KypTrYwyxrCxhkGUEE9XJkcdnSbQfagO6x8b53Nj9UdmOhsu2nnYG47tMHebTV
	Gm0gFC+m/qrPmMmuI7ceuZhAAlgai0aCOVtynFTCdrLetPQqncyk5ccB3tRo6sO8V93povZsWM0
	0gGoQt++gHnfmASvAiWMoau2ZuSzITh0A90YM9EnOFmWbdEWZfKFsLWuWWKJOe6Tof+gMF1gGtz
	MQkDrJ8YjE64wJZejcsADV/gBfURbjyem5PBrj91FGHOskXupgBJBzwCAvnpQGvwAH7W5mdd2oc
	Coqth+gHCrSIV1HxCRvm+m33jkVRsPUtVbMxoZh0hnxsl2tjf7DyxrXbPErBpGSq1beywcvSMiZ
	P+vdo=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr148346041cf.1.1774262870225;
        Mon, 23 Mar 2026 03:47:50 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr148345921cf.1.1774262869832;
        Mon, 23 Mar 2026 03:47:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1b4491sm79083225e9.24.2026.03.23.03.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:47:49 -0700 (PDT)
Message-ID: <29f85af4-624e-4610-a93a-b77483cf4ce8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:47:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - use memcpy_and_pad in qce_aead_setkey
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321131439.40149-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321131439.40149-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfXyaIUEcp6wYSI
 jd+qd3uTjzfeU/myWw2zS13yaTbq2c/Hja8PSRTSmgB8AMGAcEXQHhyaazoCvDFH+A6i3Tt5cv1
 GBrub5wwhhiHRFrSj7+gWpHFCGETDIJrJbqxfYbv5Gyo3Y/DblROMkzMEQ+wYDAiytgNMgAoDm7
 4oxOn6gXMfcNp4Y92UoVpBa7yjyU7/8x3UudJ6B42rcWcuSUHiHTIBgBDaFU4V+N3CPvHAAM7o8
 Ld0gO4v+fj7GIKpk5btW2rYHR7P/g1wNTOfcoS+6rbMS8EKRb6uwZ6VB1Zz7y3aRLLN8+K4/IkN
 ETKknbVyub+Wx9+nOSEFlskXdQFgr5sAhF1QBkXj1zSodnblChBZjdBvVP1MNlqC+cfVQnnHSYO
 TMjCg5R2SkDcJ1ClqlTxMz94o6gQAAYE5HdWErwBCMe7mlEeKuknFLARLTHtK9iZ3BVSaS0UBMx
 pdBhEmgtiMn13VMsgnw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c11a57 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PzOCrqrjzUU8T3-Ey24A:9 a=QEXdDO2ut3YA:10 a=vyftHvtinYYA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Xv1WjM-DPhXR-kMiwmWNqZ93RdgXF6-6
X-Proofpoint-GUID: Xv1WjM-DPhXR-kMiwmWNqZ93RdgXF6-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.dev,gmail.com,gondor.apana.org.au,davemloft.net];
	TAGGED_FROM(0.00)[bounces-99201-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linux.dev:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9AB02F0ABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 2:14 PM, Thorsten Blum wrote:
> Replace memset() followed by memcpy() with memcpy_and_pad() to simplify
> the code and to write to ->auth_key only once.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

