Return-Path: <linux-arm-msm+bounces-98774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFZMHJsMvGkArgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:47:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 117DE2CD205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 182253205FD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5293D9DC0;
	Thu, 19 Mar 2026 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/Ew7Usg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpdPwgLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D11E3D812B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931535; cv=none; b=mE3JF7goopmgIu0lFNb88R8aKfu6R4mmN6LSEEWWT1hTrvcidx9m/LP5cYwK4XCyxvSHa42holhVL6Svm0P8wLyo4DEYY4j5u585U60aCYbVr1qxV2nWzulFkrR7Neqv9v3ZBLHlepDeVgm3eT7MIpj4Ara2KQqaP9h06hjpnjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931535; c=relaxed/simple;
	bh=Mzcg9iGhNsu/y2fOj+RRyQYTdXyNml9qSUT/osKkUgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xkv9Yu0y6DgByVkKSPyXNY/cUeJ2H+dq6SiRmdhs7y1M0b4PK6HLq23FxIJtrWFHcO147/+MIiLy1JVLIn0KS2BtE79Nd4hFD6vx/KHrU8x8fmCowXun+HuYs+MCj6bm5Jf9UDwwJmIDVZWtHMOuUeFKfDiwSxApK0201JVfg1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/Ew7Usg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpdPwgLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J743xJ3927432
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XY5v6F8rPGscn76B3hyt9Ef051HgBM0NA8ksEqCL9Wg=; b=K/Ew7UsgX3do3O2X
	q91lxMJxq5fSVm2oZVPYnR0uySRGOBJRRFSWxIn40tvadiwo3WvFDDLqMWGo65FE
	E8EuKXwOWo57x9CDRNyu36oBeHxskMrcwzVk1OH+444747kW03++HSWktNu9m5uw
	zBJQ7CCVzjiPbWRRaK6On0UDXbbN8HRPvWqW5W+Hz7z+28BxZ65aU5ApgM04TIoR
	212lxl08bADseUWRXLaCsAIDEZw6ChWkpR3rV8PcOR3FtONmz+rxZwvtjcTArjzd
	A2hhwTyy7i8MaGa/K2q+Rt9dU4SxQ23hORHnu14FHhiTEjA+S98pIrouFp5xEyml
	70JGEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1csja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:45:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2a1f123fso4601251cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773931528; x=1774536328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XY5v6F8rPGscn76B3hyt9Ef051HgBM0NA8ksEqCL9Wg=;
        b=jpdPwgLxQu/GVpN11XUEwIPVCO/HbfBY5DcmkfJELfyHi2DmgyHwRUBcvmWburcHjR
         y/o6ERldMxtY++ooim+mo+X9pMko8bHyLpWyQ3ovf/ILZNc4Y39XB0akZKrNjYpvybni
         4TlFHp/c7sYzdN9pANuZRdqzg+ZX8IUHvnObjb/e82ZSKSb5lFEC+u3lueZxpfDm1Shk
         EkRgiYGQqyGZunP74cYoojgORkVPd7iGX4bW01maAL0JgiJHLRWzzIBL3le2LwzTbukq
         mG9F3Hu8Nz2SBSSGozBvuDKbiACrMDeX4GcMRLZq24VMgxjQMNQUOyLjaTm+PnsfR+QQ
         yJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773931528; x=1774536328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XY5v6F8rPGscn76B3hyt9Ef051HgBM0NA8ksEqCL9Wg=;
        b=JSAHwjTV6sXzfkF50YrsJK3PxZ3L69PQDPYjaXXA8/TxQP7fo1P3eNY9dOWEcJ6J0w
         ZbL3UEsSKvlPTnGoK/pkMYDrHscbWuX9IxwRQYfYQlOEJ1SCyGnZwDWznDJKVEOQeEIo
         6tCi9IC+rOK5BOs/zL5hncrt0z9d0tc18OJo4S6qS6FO5ts8lA5ZlepRZtn6AIKfQxhh
         TdH4adA33aTNErsD2DrLy5LKOYQjUivVo+eyJ6K3O9r2Y4vr2WR21p+pHKMTL1fKv6Py
         DqS2pHoF+zFxM8iTcBV+7SK5pX1L1yK+ucvZ4gyxMwWXiwtGPsb82J3h8AMRBlFSS80S
         15aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/f2WEe2IUzd172EhyqAt7Zm75/lBfMAiFa2vZ73W1MCIbdAKxDMWz1BcYNscVR2nkSORqDF5W0hFD8y8t@vger.kernel.org
X-Gm-Message-State: AOJu0YxzHiv5kJNRnryQiktOAUOcwFQqzG4/KLAD31SDZb/dQ0Jn/+ap
	Ukbmx/bxZ2VBiKrT1jO/Ysl0+rmOgiuD/z3BLFXtqcf7sVOaDGsLbzklzflmZnTyF3rREPu3OEz
	/WekBHxBeaqL9p7L4zvdPGToGKEMD4GgLtPLNeYb8wJYsd7JemHhEVeR783LF/zd0X7T1
X-Gm-Gg: ATEYQzwcNeyVsljsxwNH8SzQ1VeixF7a7B1eZ45ZasTtQSDjbUCRmExd0OHrA+/Sa84
	YbTeupyoWvqG2v7ax7p56NA6qd0F9bL+zK1k2lQHhWOSh1IjUTSWpibRzwB2o1IIVFE24dYgPSb
	o5+ILxoTZTvq85heVC0FPOoVDjSby0d4D/GXZ+MASt6zxIcU3MweboYivZYSX/2LYCS6sHe2qTY
	BBsUjdcIGcF9XUqcN4ngdzzC8lPcsae2+fz6IdHo9PrcxJxaDWCSiJL+pICwNKxM+kSHvg5dyDD
	zqd0waSGc3sSLuGmtg3hAEeRLtHye6XzK7g6CrjzrUB21WEcVBsWrNOSfY1BiNiGcaouCluQWOR
	RgwLKg1ruyYqgih5kfWXBdYXPEAtTvAiVrIjqWK5NeF1V2w3nOOwrslxD0VXnc/2sefjgpxWWYa
	ld3gY=
X-Received: by 2002:a05:622a:58e:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b147532d2mr81034191cf.1.1773931527956;
        Thu, 19 Mar 2026 07:45:27 -0700 (PDT)
X-Received: by 2002:a05:622a:58e:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b147532d2mr81033441cf.1.1773931527300;
        Thu, 19 Mar 2026 07:45:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e989bsm472548266b.11.2026.03.19.07.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:45:26 -0700 (PDT)
Message-ID: <0dfed5a0-1c07-4e7d-bca4-8183e44c3ada@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 15:45:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Enable USB OTG on functional
 Type-C ports
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260313-topic-x13s_otg-v1-1-cb2e4a08e25d@oss.qualcomm.com>
 <y7sxgdmxdn6fthnxkmhs2ja5hfw2mtbdl2zfqkfocn6pwnwxq2@cuoldngtvuht>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <y7sxgdmxdn6fthnxkmhs2ja5hfw2mtbdl2zfqkfocn6pwnwxq2@cuoldngtvuht>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d_30z1aVeRNujIdOlXRRe6uh4T9CXvhp
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bc0c08 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xFAtMjX05kTKXHXDGPwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: d_30z1aVeRNujIdOlXRRe6uh4T9CXvhp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNyBTYWx0ZWRfX+r4Pq+JjMGez
 mRVhc9KMW6Fv3Gg0k91mNguXGZuHGjb5bjjJx5eaQK4Iz7fg+K0Ll6tAT8Nl1LoQVV1IfQ7/wn9
 0+S40cV7Jgvn5FJVvvKbU4OJovXYHRu9jE6u+R9eolvAX4dM2SjzyDO6RiBwsilTob44Qtw+q+L
 FzMaOdzIjnyYbSKX/DDXs2eiDHcO4gtLyWxaxJgeRtLrOZmp0socwQ4ZRLS89CTatV2sOE7Z0VM
 droQsp1myK38tYuq0z9EizBY4wBjvNCD9VTzQB899IfWVIi+geLf1R2uhaQLPCypQZgdFd5j5yu
 MiZD0/wgu8zSlnof1tJW24zoJz5rl/irVjgW3KUO3hJBE37KQlsGSflpQLmvw2UbxmksPvYohjw
 ATTXzktt/zGEIof+HnFXTTARfkcjEcMk5y+UFn0VM6nLtIhZ0ZnWKOxYvLk8k8U089n7pY1lxpr
 WrBB9jVxBbeUUzFRY2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98774-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 117DE2CD205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 3:37 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 03:08:03PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The two non-multiport USB controllers present on the platform are
>> role-switch capable, so mark them as such. They need no additional
>> plumbing, as tested on the X13s.
>>
>> Enable OTG for all devices featuring a data-role provider in one fell
>> swoop to prevent hitting the edge case where UCSI code would time out
>> trying to get a reference to a struct usb_role_switch, which wouldn't
>> be registered if dr_mode was set to anything other than (the default)
>> OTG.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 8 --------
>>  arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 8 --------
>>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 --------
>>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 8 --------
>>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 8 --------
>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 4 ++++
>>  6 files changed, 4 insertions(+), 40 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Unfortunately it seems like that while it works, it makes the x13s crash
upon resume

It also crashes there if we flatten the DT node and I'm hoping the solution
to that will fix both, but we have to hold it for now

Konrad

