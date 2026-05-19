Return-Path: <linux-arm-msm+bounces-108399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHcODqkdDGpJWQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:22:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AFE579E36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34AB73087CFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AF23E0C4D;
	Tue, 19 May 2026 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzQxOmmC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaQEH7ER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406601917CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178591; cv=none; b=Xcr3TaOeQn9qXC+Jg6bArmSRRgBApdh3r9ClZTIUyFbtAh85M/ug8yizyzgcK0wvJJxn0OEmBqZ93Hlp+df4ouR2aLvfq9dOZiwLuI+nxfqfs2AoICY01UCa73Q0pSACeHO3Y3yoz9MFKAQNeFbfH8WCFbN4UWnTanq8BEpEnSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178591; c=relaxed/simple;
	bh=FWIhwAubo735EGbBjfyrlllB/9COkfTXUu2EnEA1n1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrxdl2PWzWVLrzNd5ZYj1irQXaKXeBeQvQQI8GtZWO1QpCU7MN1POMPhFy9qEXyvv4lmDZ/Ns61nGy5puVS/NLPfVlAi8zMonBxSi3H5cCj2BFWzVh89T+x0LMBM4TEyi5AQ9O9DFbFM+zARlTFMAerGt1MDfT8UGTN70pdnpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzQxOmmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaQEH7ER; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J60Zi62701025
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EDkQT4wU588AgRAwss3zBLizqpfUvy0tHKsKwwPhZ2k=; b=LzQxOmmCCdD1i1i+
	ocm8Wl9EuqR9dQNkMWd/ZMgEpCYxoO7MRFeP8OYq241+wIimq3n9HrzY24MijoZ6
	teDWq0IDh6w1LgVePeCwJJg+HJMQgYh/Zh3jEo4dJ1ngtzT48e7z3i048eUMQVLq
	M40yVfU5KpOxvQXYeM05CXpcUXIDDsrse+bKGquWdC3iOPx+6KAOAEiJ1sYGErEH
	nT+GCM6wkjW0ACckMuRUEabI1jsgxZC0Nk5BkN27570eYByV6bVmwDMx0QncJibv
	oDbeGuGHVxrlzZIP+GXD+By8gyecVl+22IVatZ+iSXvU3vc5cghLmM4PeUgt+B3W
	52rdrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mekytt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:16:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b5cc5cd2so11234731cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779178586; x=1779783386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EDkQT4wU588AgRAwss3zBLizqpfUvy0tHKsKwwPhZ2k=;
        b=CaQEH7ERNk/am7hVEvmrnqb9PLPMVT087Jy38I9qTgsIw0utLwoN8jJRziKrw/GOvQ
         4XjRcLuvgJs3lzopo4fABn9kyxLIeUN2g43zUEtTL2oaL3Cg3Nq4DK07T+h/9vnQEzA/
         nm/KkvLeDlw2sjj+0wvkZ4qAMepXnA4VosduYtJ+M3SJjLxKCWd3S1k6G596hwdt1rqU
         BCwTQRZCzP2KIbSA6P5IMIblIZvCPVevmXRDZqxqaBYifk3lXelJenlWVc/Dw83s8vO/
         gU4uqPHxgFrfrgxO95+2MdBeLslMbsKQhQ1jJqPOVY2ovcNVvivq+Niny11WSAoMjeEW
         xVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178586; x=1779783386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDkQT4wU588AgRAwss3zBLizqpfUvy0tHKsKwwPhZ2k=;
        b=cvwfPjYOSwFLgljx1XECjfojWW9pBG/q0C7W3YtC4juGGGgiIut/mBbuEVlZjg49Hp
         NKrm3fVhg7ZGxvlLRryvBYS3OOhWmS6bc6X7j1NftR9fAwIsquzNDKyYvTHeyghimYt9
         eRM1J4ss9+6xOO6UkUsVMZH6vzlu7ErcDM8lsBa3aqTzYIvtr1rd8Eig/ZkZUYSW9kTa
         mMaBdL/dBRb5nkPGQwceqrNaiKB2u46reOf9qcaJiSgjSyV3xYA/esDkcbzA60uTIcOa
         xDABfVoWVntEmsxSPXzVKFVYd4arEpkLre1UhUfMb809ets5ychwdNB4GpWaOUCrR8IU
         ETWA==
X-Forwarded-Encrypted: i=1; AFNElJ8pmuzHXJgQm0qpEsuSQW7+vVvsa+rMgv0Dfe2NOEgL7nUoNCqLmqYr7e8dn1GOKqiuquueUvX7mL1S6+OA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/05FF6/dl6xrNUxJ4Y1fZ8Ko8howFKDCVptYar8vmhWwLcqr
	XB5BzXoujKsu6Kir4zonsJmiRBM3a3PrN8opQ12ivqKjhvXCDxomDNg9bAeWjmA24MxzqNR+anN
	faIVL4KAQwE41JZrAW0eVm2XKrwl4yLyghVLi67aPqhlcx/aeaoABFI+MnmrQvFJCx4wR
X-Gm-Gg: Acq92OGl/lXrO+eauQpoHsM34Il1A3JHj+C2zp24siQEJW2OWVXEYIy8pZeqAnqUYq3
	KhqJXTkoRcj4vtKuhHxkC3+mpROrAKTMDl5GjvcpB89ckcrD8aPYPwesNnoWcpNIz01q52XgVmJ
	Ejwxupw+Hk56MnOnRZeZeZCLbgeZDSLgk058sUPOZvZJ+/L47SlTOHZFqMO0JjauyA4mWVxn8n4
	uLF27ORfo29GXCC8TCcpj9hbSQhsCrmyXiy0FxYILNuUb8jtygzs2V+pXKUuoAMMqwnO5AYZ5HA
	tXG7SzcLBxH1CixDUoSNczAItAiCe/mRhMSE1oauBpUKxUS8+pcMxp/g1Ky88dIlhd8uUD5d0df
	znd91WxNP7aF2xzNT10a+8eDy+Q8ZBu4aXM75nW1DlSY0QjOJlR2cID8RJs6xiyqE6JKmJt3PUx
	RJqi0=
X-Received: by 2002:a05:622a:353:b0:50d:714d:e966 with SMTP id d75a77b69052e-51659e9ae81mr175416301cf.0.1779178586534;
        Tue, 19 May 2026 01:16:26 -0700 (PDT)
X-Received: by 2002:a05:622a:353:b0:50d:714d:e966 with SMTP id d75a77b69052e-51659e9ae81mr175416031cf.0.1779178586123;
        Tue, 19 May 2026 01:16:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c31404sm676900766b.25.2026.05.19.01.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:16:25 -0700 (PDT)
Message-ID: <794f1574-bdd1-4292-801a-52212dba6124@oss.qualcomm.com>
Date: Tue, 19 May 2026 10:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Fix error check for devm_memremap()
To: Chen Ni <nichen@iscas.ac.cn>, andersson@kernel.org, konradybcio@kernel.org
Cc: francisco.ruiz@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519023841.1995542-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519023841.1995542-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0c1c5b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Qy-I-MKCrQKtH4Tgk0gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: SP8xMFQocbDkQgBqys2UyEPgV-pUVCwF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4MCBTYWx0ZWRfX6jw8yxTzYy/B
 +2yj5J15Yp0lZO1XfW4KPrnubPLBiTDWuU2PVT9dnT7OB4UZbe+Hj8OJfJDmrXhsbxmLMoL5I5W
 tNvzElhjv0MKJ2f5GrYj9tGNe/U34zHW9PxR6sftd8pfHKCdzGIaXzt23l7uO25xFqGmoqlg/P4
 1kM3Y0rgjZ4QbblQHNFcWX/6e3vg5uFg9YKyrZzTp2825LEAt7aFfuK0e8CsQudIZFjQ7ZR0dY9
 3iscXz1DTHGmvX03RGphreFG/6tf2eXkosMdTqok1dneNOYUKK5BpCUg7UsYhrW7sUvBCQNREXY
 j6OmkncZ/iHRiPARUUvMU7PoyOtTE1qkrIAcPUPy2K7YV568ncd4VArZI7z6zPxhKxa2rcDxfOA
 u80Or2BQqZZ3sSvc8/p6CtnDSbiNuNmQ3mJavKvnpdrpN5s9YiwbyF4Szsr6lsWkrW2dg8gjYxs
 RNl1v0GutceLBSkeTQw==
X-Proofpoint-ORIG-GUID: SP8xMFQocbDkQgBqys2UyEPgV-pUVCwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108399-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,iscas.ac.cn:email,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6AFE579E36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 4:38 AM, Chen Ni wrote:
> The devm_memremap() function returns an error pointer on failure, not
> NULL. Fix the check to use IS_ERR() and return PTR_ERR() to correctly
> handle allocation failures.
> 
> Fixes: ac23106a9b9a ("soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

