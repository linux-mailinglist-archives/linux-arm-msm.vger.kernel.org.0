Return-Path: <linux-arm-msm+bounces-89998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLoAObG7cGkRZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:42:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 403A9562A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 958759262DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B73340D92;
	Wed, 21 Jan 2026 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jegcwNq6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYeyt3Qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A12C3745
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994857; cv=none; b=clSE3QF5XTXV0g0YGU/95b/C6nb5lgu0xbzuNCiQjWC9fHt2p+ogjikzxqL1MTL1uMTcyRKN1U6Cu6fWy39+k/DbkX8KubLlwiRNktXNI0Ay74qu5A+bClzVh/7UrcKuj+6vc0bWZd+cckDKhYAANEgagvygAp/SFlW/p/6tLQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994857; c=relaxed/simple;
	bh=0ecdY8lGt6ySO9KqFnLFozbx3S0bUDStmZFPxDGk97E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pE92VNwkgIYQVRyl8zJ2gIiM19QBBR2DF2G/0xq9q8+OkpmbtU4FItbt47ZeQK5l4zPQv1QLdYFQ/0O5ofLUePZ56v1mz+6J/QXOLLcHmSJQHOpPjaj1KPavFSBzS8kkWHnV6EOel7acRS0uNlkS6r5P//n6jOcI+SFHoY/fzL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jegcwNq6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYeyt3Qi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8vEYK2946280
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsVllfuYwH8uEYQ+GEK0GRCIxlfSqW46I4LIzUt6ASY=; b=jegcwNq6OjZ376o8
	3ARwaDIHQYqLaceKW+H16glnBPKUdrejzp7k9hRrS9fadfMHmFV1wLRJFHfvLGhd
	mAONdCcLtpnCMPtmJOSRgA0fU+1MjaH+sBJK2TqUNObOLEQ5zYiCbox6gyjdpw1d
	p0RCX90opOidzXRqTkVcD0yAfsgflsPCAgdm8OL73Ozk/XVXrRZ7Z60eC+HgVZWd
	acCQx6x0isefsfiwPjEpFLvDeTnDwvzUKSpXC4lgHsS1c7m3Y+dv231QVUGLOJhc
	R6QfEqUSaHrDWn4c5jdUZEc7hp7fO6u3qwhFGm73ss6T7k+1Zfvmihszn8qvx4Sb
	gZzxeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btur98rek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:27:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c523d611ffso67920085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768994854; x=1769599654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsVllfuYwH8uEYQ+GEK0GRCIxlfSqW46I4LIzUt6ASY=;
        b=OYeyt3QiL9p8/THnjECUvBYG4lpVZhYyAejC+HPqi5eKKUXUt+iyu6rrcNjR+XKl2O
         f4T9k/KVK4ZoS6DuPe1zl2/+WF6dePk/2ECUl1T8nprGMCV+BTWhEy597d43hAWXbXBU
         dX+AYKuFj6wCfaiVXvfZgynvVdpPrHt1oEIUWwf3pi3L5Z6isjG7Qv0NBE81GoDz5WDS
         wDWsgXkDgYsjtb1/xamuzle0hBtbLcZZTfaThZIfyStiRCIPX7O4Of/orhM6swXYYbww
         uu7YbRlrUNNeex5Ehk08Ok5HrggmaRd6YPKUzXrxWlu15WinBgAgztRIyLs8H1hU3T18
         T6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768994854; x=1769599654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsVllfuYwH8uEYQ+GEK0GRCIxlfSqW46I4LIzUt6ASY=;
        b=d3PGFLe76mF10wclvbGphO/0Cqq+2odvql1j3udoeXA5SUv6qZrlbkfiTdh6J2saqU
         kQd4sqhEcKjk9qFPWYqOwCw3KAdflsxRkE5JHpG6haRB7uSwDQ0dLaPRFGBcmRb2lLOL
         kqqQQ7hRuP8EdFN5MTIs2BMjBhXRr4tk7BdCFGEtjdyFoJho1sPk4Tj/5XfB20160HUq
         qx4u7786mdSmDF9mvHvGMTpQR8hACvfDH/j43SYSg08cniG5P76ORjc6JbjwQ6S52r7n
         Hdjies5cGTc5D85WKPQ2/Jek/wpCujwm7cQ1tL6l+G3EF1BfgJU027Oj6p99frp/nseG
         At0g==
X-Forwarded-Encrypted: i=1; AJvYcCX9lF8NeV0kISH8DjkdDaoWqBFa2HrMJQ7jtFg0UBAg/F+pJ2mH0lQeda5+oB4ZYmZDa17hrhwvOZ+EuYNg@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHaW/xj76wCiQ1dUREc/ThxY2EtU2rC0FRSZlxOeESSF146zT
	rMsmBT1qrvKvhO/J2sq6X+hQ0Jh5liTj4E4h8evyZhkzLAed7xFu7n7Wo0uJsbAXmxtc1jCYIHg
	kYTZdnTnGolg+AK5VP+fnUPQhG8y8t0SxKJCqBfAeWS4bD+Y3fRrNZJEDjg9kYj8d5gn+UaTCa3
	AU
X-Gm-Gg: AZuq6aL2fCCa9AEbvLu4KY/WdmPytTmnb0LPw0G0CCpH50rlI08N+4c2abpkyHXLREV
	QcXtIV8QNoF8Z4asolfnNL7WX9lIVLQNeVA2PtXbVbDO09F42q8Nx1dwgIPOuThoZrBmCoufFSi
	yRgbWPP93NISqKd09XqcU16L5lpHbaKxo9E0QWtlJlECHFzAmiyISokQX26CWtZDWwIDrZU9Zd2
	zJpXvm98hwO0DaE2AeoCvKczLX+eOFH/h+abtQtXrvtaoWFkEiLDVK+rMBT182WgPIEeQSkuWJk
	b17s3I953CG2UpZ0U9BTzaIojqB5TiNAXqmQvbIWv0lqgVzQNmRxxxNk/2ccw/z6nIXkaj5cnzl
	A86faMJNSgEtnmZx29IPiPU1Beg/l2iZ0l1/dO+/+/wThXUsTrkXotH+1yZ/XZVFq3xk=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1803053685a.7.1768994854051;
        Wed, 21 Jan 2026 03:27:34 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1803050885a.7.1768994853416;
        Wed, 21 Jan 2026 03:27:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8791sm14573015a12.24.2026.01.21.03.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:27:32 -0800 (PST)
Message-ID: <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:27:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix
 regulator and SD settings
To: Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-4-morf3089@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120180052.1031231-4-morf3089@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jU59UKF2zXL9DBKCQMASJ_upA2lyLRBP
X-Proofpoint-ORIG-GUID: jU59UKF2zXL9DBKCQMASJ_upA2lyLRBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5NiBTYWx0ZWRfX/ePdSF7wNSBc
 y5hdnZmg+CXobjPkthPjhTPV9W3pTZYfz3dN8TYs94aHAW0YRQgKR9QFk4HO00FOdq6gSCV2b75
 k+wp2u6cLqZTUTXK4v4qRRCatdPkQkqteQur5NsT/1177E0vMRvheEqKWgbLohv+pzastk7ap3A
 21u4XPztgKtIxP2RBq07Xk9FTDwP+Xp3fNK7W/ZlgrSUvXy00yns+kWeyMS3nQshRClzgBOTOfB
 wXXzOJaMor7kXjOnOifCoNX2cnAKHOgFaIxtyyoNqLZ+cQmxc3GNISAMI2/wi+0etORvK0qq/gx
 BynPrpQEh5C9zsGp/9Xd696XqI+ABMI8kL7UD4pnV7CxflKGu2xWSakvJu6fz6NFGi0lSNjlta6
 YOH1o3h055Ff8bbddhzVbJqTAkSIMMYI2pC5t/fsFJgnPTKcAKGO42cO9PckYaj3y8Gt898SOqo
 4LheT2bDRKIP+SOFoww==
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=6970b827 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xCWKIhNVW8Ay7giyioEA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210096
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89998-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 403A9562A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 7:00 PM, Gianluca Boiano wrote:
> Fix regulator configurations to ensure stable operation:
> - vreg_l2b_2p95: Increase max voltage from 2696mV to 3100mV to support
>   proper SD card voltage signaling

This makes sense

> - vreg_l3b_3p3: Add regulator-always-on to keep the regulator enabled
>   during boot

This may make sense, but you're not explaining the reason behind it so
we can't know

> - vreg_l10a_1p8: Add regulator-system-load of 14000uA for proper USB PHY
>   PLL operation

The driver needs to be fixed instead, as it should perform a
regulator_set_load()

Konrad

