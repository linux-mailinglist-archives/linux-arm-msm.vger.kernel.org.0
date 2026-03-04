Return-Path: <linux-arm-msm+bounces-95369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BE7DaJcqGmZtgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:24:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843A204287
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67CD4319D2A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5C035C1A6;
	Wed,  4 Mar 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYbNF7JB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOeqw7mt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E75B35C19C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639956; cv=none; b=i6X2jvy3SJMn2DaUdoqZdY2T8ZFATOsmwVjXNbp48XAXMgXMfbHZZIkbB1Fal7qSw3eeJ//QE5VzRp5gboClVc/jq7ml5RJ5uF1EM68HQCArdeKbo1SRJKPfolsrfF39o9jTxyAV++z7ssbeTiHE60dYuHkD5gZA+Mfav2bqlCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639956; c=relaxed/simple;
	bh=vnBaznsUtdRXwsaoDcfLLsmORSTmwPR5u27ihsD0I0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6RNeqYGJCrzs6zlUI9kO5DYM81PUi1UZmgCBDk1+8VJgNutoWvE2iNkTYZjgyAoOMLe63DDezfzcvxxUCtve+MPhSu3CnQSO6YwEUwBI3Be49yabWRCIdOMFdW9uY8AXmVm54jb4b8/dft/wd8n8RqaM7np3prIbSrvRkJc1UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYbNF7JB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOeqw7mt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CIfcQ152532
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 15:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlC+44Mz33ya2afMC1yUGlrnDLRTuhy1rxEDEUPmn5w=; b=lYbNF7JBXFqEla3s
	H2Lu/VCqq56niEBFb6N1OaX5Frpn/Fsc9Q4A3csaHmKlwXlLdUH6m+2fG5IWQVf5
	ClUTDMakAt56hk7VXQ3o74iYQN3O+KdsTRuBclO1+nQk7Q6iCWKCnREXrjgdDHZf
	3rXXB5rNCi8B1suDvc14rnEGqUmard9PsXsUp15Bw4vDsSBiiaVs3enhoYGiBP1C
	C4ZVdJ0R3ky4rXZyFmd0gkLJlsAh3g/cLRuofGh6XSFEMY8Dxn1Cck1K8k7522lO
	rAxu62ggIrNjsWo+FSFxZ539evsKHCw3Tm+MJQYvo/AI/k1iYJAEYGd6bWDg1fjd
	Ym4FGQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvm8ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:59:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae47b3adacso35363115ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 07:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772639953; x=1773244753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlC+44Mz33ya2afMC1yUGlrnDLRTuhy1rxEDEUPmn5w=;
        b=kOeqw7mt6lfznZ3IBsLrvxHer57B2w66LQfeJDtVbO6L0loxx7laXofwDsl51hMO04
         itCyHuo3r49T2wMRU3Grobr/4aM/KT8zmXIGg6ba0ETXFu3Nf3jCM7ppQZ+mNRWpLTFI
         Lqehe+S9vLBhdJ1ESE/zV2ciOORMry52w33ZJsjE4Ukge2Xz4QESVlgVweFJui4p80G4
         mTOeNgyZLIhYD65rHNDHptM9N26vMwCmWaoL0DsIsgH2JZ13xaQ/s2cByesf/PjQPPc5
         p17neEFVlAt+FLLNTJMoCL5tN3xyx/QzSPv4RyuBWxyJElC1qaLdemIKR7pwCXnniwUb
         ECxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772639953; x=1773244753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlC+44Mz33ya2afMC1yUGlrnDLRTuhy1rxEDEUPmn5w=;
        b=noSq37i1G4Fomh3pm58KZVd0AwwOF5DW8SzTWW3Wbw8wA2Lx2nI92BktDv+PNkTw4X
         glWXZwQBuUWJNcQfvQJbJ9dgrprvdps9SGUU1/3yzobzVD4i1UyzyeAVP+uoF8tghUpi
         YFCLX/MiYZMj8MGv26QXKZ4x5/nTmlcY/PDIDAjQI/t8b72hrzPQ5hLKMxlN6O34n751
         4AMVX2h3aCJ1PLQwvuJCqep1rZzXFIDQ5Mu3Afv3YW5XtOal/rEJKqKMQzAkBKiBHqXp
         4ta8Bh5MlxEuOfNtZYWoH9c+B1rCOBlqA3t0a0w4oz9zRZ378G7MtCWQthNOpitU6bXh
         lQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV34l7WnVLUhh06Hl5lYOx+6TY0uwiK2Sd45epDbF+RjyMs03eTOwcKHDNZrFURgrHhisOZECeTevvnbuBy@vger.kernel.org
X-Gm-Message-State: AOJu0YyjX780mW/a9LBTDxWbKR3OZQRSLJXdqix9yIa0Tat5noXQK2Yn
	mv076nYWhGtINKFxlk6Y2pItwYrzD8sDUB/KbchS+9Hvheu7Rep3If7rqLNH/kEEjEJD6Gsxslh
	JRMX4k5EDXiXCDjqCkJBO/AQ6c8mX0gZWAZB7ncdlLk3LcCGSpSXFpxG95ssI5dJS09mW
X-Gm-Gg: ATEYQzzA6i0zNyETS8w/oDDmVtnSNuHCgFa0C6/uS2uww5hFRNMmkxQHA2nzaGkSVrI
	YCdqQUJn5eZOwq0S0cUuu1kbZrFR2BXS7xr8yV5m+YzEzFCRuNAuPAfDmubB0leWECemb21AbjR
	ZpIWKPb95OgEbsSnsZh2bxT4mX5OWplsTyuADzYWhSpxaJkICeT/lcNOKMHRIXdWO/EVvrGJixe
	JdAq9x/X8Q57qx4vWO/OPu5K45v0WSqixW3vbHdKhL1Uol2GtiV4WLAJxeDpmoTu50oveMWaw6Z
	w7mNlNutoTIpCYnpe80g4HEnMvkqnjl4iHSBLhYhkgZAdf3BK0T0UDtbixbOwuDq3sR7w78svHl
	QGI1pPW8PA44fBpMP21IJa6lqp0+rO592MDeuh3Or7iucFwfGJHXcWA==
X-Received: by 2002:a17:903:19c7:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae6aaf6261mr23162245ad.34.1772639952994;
        Wed, 04 Mar 2026 07:59:12 -0800 (PST)
X-Received: by 2002:a17:903:19c7:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae6aaf6261mr23162065ad.34.1772639952489;
        Wed, 04 Mar 2026 07:59:12 -0800 (PST)
Received: from [10.204.101.56] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae45e07626sm131016495ad.39.2026.03.04.07.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:59:12 -0800 (PST)
Message-ID: <9ba09cc5-daaa-4406-bf83-017f500a530d@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 21:29:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: fix use-after-free of fmt_src during MBPF
 check
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20260304-fix-use-after-free-of-fmt_src-during-mbpf-v2-1-b4c78d1bf764@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260304-fix-use-after-free-of-fmt_src-during-mbpf-v2-1-b4c78d1bf764@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyOSBTYWx0ZWRfX2f8Y7uoNN07r
 QpUa/2ZGQlLzfIlQplc+on3oMhmllrCBbnv/RbkfiL4Qz8hO9QEAoFGtZLSLts1sIqf45T5iPF+
 /2ladKvxZDCI3IeunoIdS6ywY4zS/GcDb7gInTMQxgDmXdibMDgA41rq9W8tYUjVLhQ2B1bITzR
 bUc7H+8LSrXEM2wj3mY+sJgeF+U5E1iBb+OJ9Zf01yWAjl0H91ApKpPLyOybLAc+mEr30lCRLIJ
 WHrflQ9vGhutdY3mhjNbCpSAjUS77vSq7EMJuhp+TGM/WlOBgx6sRbbVUoCI80ziumLgqI8C/os
 M4EPhxThmb/8U8CA5+yu/kiE9egNt053D4kGfeiyP5iIYV3IrLUn0JdhUSt/AV/uZirEFrrUsQJ
 72YrAchQKUM63kvKWLqoc6D9AewOfnE6WhBDB2NLLC4XoWTxKq/fbsPM5MH89CnDu7EM8jzE/7d
 7jtqGgqhQCOM1pkKXuQ==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a856d1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=84YHRGVAtpGMlvhcKo4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 53zSRBf9K0kKMQn7CKsODXZHQOwTNR9l
X-Proofpoint-ORIG-GUID: 53zSRBf9K0kKMQn7CKsODXZHQOwTNR9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040129
X-Rspamd-Queue-Id: 8843A204287
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95369-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/4/2026 2:28 PM, Vishnu Reddy wrote:
> During concurrency testing, multiple instances can run in parallel, and
> each instance uses its own inst->lock while the global core->lock

drop global

> protects the list of active instances. The race happens because these
> locks cover different scopes, inst->lock protects only the internals of
> a single instance, while the MBPF checker walks the core list under

MBPF ?

> core->lock and reads fields like fmt_src->width and fmt_src->height.
> At the same time, iris_close() may free fmt_src and fmt_dst under
> inst->lock while the instance is still present in the core list. This
> allows a situation where the MBPF checker, still iterating through the
> core list, reaches an instance whose fmt_src was already freed by another
> thread and ends up dereferencing a dangling pointer, resulting in a
> use-after-free. This happens because the MBPF checker assumes that any
> instance in the core list is fully valid, but the freeing of fmt_src and
> fmt_dst without removing the instance from the core list is not correct.
> 
> The correct ordering is to defer freeing fmt_src and fmt_dst until after
> the instance has been removed from the core list and all teardown under
> the core lock has completed, ensuring that no dangling pointers are ever
> exposed during MBPF checks.
> 
> Fixes: 5ad964ad5656 ("media: iris: Initialize and deinitialize encoder instance structure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

Once updated,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

