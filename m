Return-Path: <linux-arm-msm+bounces-81134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65796C48E45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB7D24F5E9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BAA2D7DCF;
	Mon, 10 Nov 2025 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoxmVHy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0m+MXPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD43338599
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800906; cv=none; b=Ui94Hwp6E/jaXY51geQC7YHX6wb9jhT3/N2A1XgC0yyxWK8Ww/i/TIJUxP583WLE8bjbkYxzL+kfNGwO8zVLBOFAr/lb32C9jyawXl9+OnDxI99tau1oZI3a0oJN0oCZGqZlgTda5nzC/1kcWbD2cfFdgeNvb+zbZY/UQb4flIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800906; c=relaxed/simple;
	bh=fhQYXLG6Hlm+sBQoct4GncbxI25NofSYErr+AmzeIA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iU8zlKX82M3+az8vCu18F+qbOrWWWJieeDjQIkmMwUph24+J9FFSYV9Wo8pGhQGmniwhuXWI+m30wbbMnxtGUyTjVNJTIpPLKsXBEnV0EREevM9vxVRU7jwDRZglQKrPurpIpAoY0OT3TPf3i0vLEpC5cMp/cZ15qGZrQ+snAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoxmVHy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0m+MXPB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGs3Qr2992495
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=; b=DoxmVHy8sHUsyfXl
	x16aTRAi8QkOU/MwP65F9EIWy/DHQ9ggCxUp444rIxeY5jMHj5o/DloMJVLLEAmf
	kUhqg5zzq4jLbnorwH1/9JcYc1D6TRcRUyoK3g+/ISBDP+t99jDgt1zRLO5riNb2
	DOtgWgr5vIUKtgrRR5Q4gIMr2buMb6AzA2K34rtU+9s3VmAew6sx9jfejHy7SuTf
	N5DZKoF0eZSYdsVoSA0wdDB/P9g3HQZhUf6BFpo0HrreZcp903611NPStd1QwfHu
	xJ5/cAVkVHyxiKysqSrLl7fe1UlbUtZMrhEgph1jhr54M/F/EFqhvG64uy3tzk3f
	eiGB4g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88srp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:55:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b57cf8dba28so3024851a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762800902; x=1763405702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=;
        b=i0m+MXPBE5pSSoBswKab4ogQ6Yab3KXS+whWVEcYdYBBs68yKxkuDwe8FLUOMagCWt
         lK64SwkwdLhjth+vuhcg4wyYhU7utr0Wk9tShp/Y+6HG+SdHxrbqA9ZrllbroMfVt+q2
         Ng6G6/6S2NXbHf1P++Zm5oWYJ7+e58LDx3DDG1t216O6jERv4nTxDmwSMiOsqRbQdK7+
         9cywy/22NQD23X4R/X/8nO7MwurrGtWMEaul1V6Aw5VhnIamxhZ49XLexUCkFKNw0IwK
         ba4V86Jknwi81wWHSZ2H6tpso+okMlurvuNxhwPq+xdBh+5tqvOd5BqU0Hn7Q2mbjD6z
         kw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762800902; x=1763405702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=;
        b=DITCE4MY/xqBlCvuATw/tK5J1uhCFAHgtfCte7yTfw/UyprnNojFEg+ZcGox2n6Sc3
         1bqguvdjnWg9VA8bloONQiZ8HbpHuTzBz2WX/OlofqjKpwY36uirQDcykYbXszzMRgm8
         R762owsVOwNvkXtolygSUxXt46TFBSCz08OTgvaRW0TlqF1bJuWF4c2B1zSdnmYklQRW
         i+YZM3gX7sPcXokfwZeJJBLzbdw6pFuHhg9vgUZ0FPqgQR40NsESiL2msUoAUdYSUd0G
         qI7B1jRgESWRlFM6T6vS+XqodPYgII8bAg3kZEBAUMMnB3sOPEn5WKLasyK9RcV5d2+I
         EjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUUD47WkbfF/B7FmDFwtPZroHo29gh5QjXNoGnmmywbvGFOODs2YI0YSvw2YM3P1+E9SWWll221/J3Ae5L@vger.kernel.org
X-Gm-Message-State: AOJu0YwZTgwH/BAQD5xVc4WdWF8OsOOZDo2rJb+1/y+aQkqPQn42eeZ/
	d6qvE1MfFRfLJS1+7vpWLYTgY7g6U7lBirIyzRpDrNU4ouMD/G7hEu/N/5IwvL3QreWeWE0q+tJ
	i2C8qvH0NsMQ88bvrTkqB3T3FtDu8tLTQAmCbGM/2jqcXBnSgppDS3PymuS3rJ32KWUTF
X-Gm-Gg: ASbGncvVsFq1f2dqa9ac7wZhienhlLp4U5iqo06bZ6ngchO+RXFsRsjFecrA33bVExJ
	XOagnCF+p0Ea6/z+YQkoXmQOXkbqW9vo86Sy8lGZ8DICX3GrcgWBpJdZU32dzo5uLxz61w+e/av
	OirBJac21lsZ3IQfwyg3hWa0I+DKgUCd59YgP7LMsZyMzciVxyxUkNA+lU/VZiV270dJza/SuKi
	BC14r3rfZ+rfMbnkU0fy10jeirqV+HAWy5+We/F5rIiB9XNF1L9dsLavvOQN36lO/JlqQCtjl31
	RLdYGdq97ed4hGtDQUE992rBxbOf9RFWhKCPdSVmPK0pDU8X+Ow9fSpGekdkwEZoSzOM56DQhsW
	8uJoghWaUQJeFrIh20pIKx33ZmULdkdTS3N6yK6tevyPARK0leWT1
X-Received: by 2002:a17:903:244a:b0:295:bba8:3c4d with SMTP id d9443c01a7336-297e56ada4fmr110965815ad.35.1762800902142;
        Mon, 10 Nov 2025 10:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnoi8L/6S2oVVbU1pOEwmq5eJK/vJw958G/hYadl9mjrBUKeaV27bhmZWcoacrQdwz6Pv+FQ==
X-Received: by 2002:a17:903:244a:b0:295:bba8:3c4d with SMTP id d9443c01a7336-297e56ada4fmr110965415ad.35.1762800901552;
        Mon, 10 Nov 2025 10:55:01 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968602sm157045745ad.9.2025.11.10.10.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 10:55:01 -0800 (PST)
Message-ID: <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:54:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] accel/qaic documentation fixes
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HyklDJFxEtFMKyYIVsQ24ZviaqYyh8xN
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=69123506 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=wQdz1tM6fslYZEmrDPIA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=MP9ZtiD8KjrkvI0BhSjB:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE2MCBTYWx0ZWRfX2XRpYfOKZuqW
 3LXqMZ+ZmI8s6YxLr+ZOQq434bJ5drjPDOpe4YFzI7A7CjqsDVwu7P2hPHK7Sx/vyfOF892XjZq
 JiTUlk6tUvFDA5bTxjCkJwjdhRKIMn1/deUdjEYaO7TAkOWvaLwJER+Xxxo00s7REGcoxJwH/Eo
 Bpby3ByaobOWS/lihoYzyQTr025Mv6GvYoUrjZcntZKSmmHKF7rg7PHbu6PsUWLCOL04HSx9qeC
 gYmAKjjEH3DqBKXwaxBR00Bh2QgvcC88fVMmvnr7Y1P6VuTKZHNWtLq98DLqnQb71s3opRYmwri
 1+QOeho1rr/dKz/99QtL918lhGL3PuDc8VrIc9hB0V37pVdAsjry2mtfzr+9lGsqFbV6g/LCdm4
 p+S7rB6o6Zs//z74Kd0/LSpehNVasA==
X-Proofpoint-ORIG-GUID: HyklDJFxEtFMKyYIVsQ24ZviaqYyh8xN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100160

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Hi,
> 
> Here are two documentation (indentation) fixes for accel/qaic as reported in
> linux-next ([1], [2]).
> 
> Enjoy!
> 
> [1]: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> [2]: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> 
> Bagas Sanjaya (2):
>    accel/qaic: Separate DBC_STATE_* definition list
>    accel/qaic: Format DBC states table in sysfs ABI documentation
> 
>   Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
>   Documentation/accel/qaic/aic100.rst        |  1 +
>   2 files changed, 11 insertions(+), 7 deletions(-)
> 
> 
> base-commit: a2b0c33e9423cd06133304e2f81c713849059b10


Thank you for the fixes. Yet again I am impressed by having your fixes 
in my inbox before I even see the reports.

I'll get these merged to drm-misc-next where the offending issues 
currently reside.  I anticipate getting that done later today.

-Jeff

