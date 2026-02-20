Return-Path: <linux-arm-msm+bounces-93508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHD4NKBumGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:24:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 378631684EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B35BC301186F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6A034CFC7;
	Fri, 20 Feb 2026 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeVOjfak";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYQ5JGAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8C34AAF6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597470; cv=none; b=l5java6mJzCYXL5dzUP+SgkTULf3TUTtwQzZ0xwZDF08FgRS1qUURdmXtHgtUfqaN/IydGfmFseqL3QPwjqedTcE27UKCVRHdcHTkD+Se4IZ2pHzOAc1bdQ4IBt0zuev/6LWZjA76RJCtmQ5twgkzRfepNITMIAh9bL+hs2wkac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597470; c=relaxed/simple;
	bh=dRQoQ+oI3oyRa1YUmaxTRkAhNFegC5ZJ8ImhkpuMUWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klmTqfZlFn/suAaVyP4uzp/u2zwbvVBUOEG69+hpe4UwwjGSxSkIAOPMDHpm/f58C+QZ0PL9OVB9MxYKXJXah+kXZRCrIJ5O7x4dgDNndR6MLS6D8ZYPTgOVPwzX623/OCPrsGfEjPIE0ZaHqgnW1ayXlFrRysks6nRUm7Yy0DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeVOjfak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYQ5JGAk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rp6b3034285
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0//Dxsq1TVWMQt7xaqgkecNvssvh6Z3gJ5xg3T+XqDc=; b=aeVOjfak11yqwvPm
	F5HIGUhYGzS5DRtMjdji6G5HYPbfXNj+EVzDp/a44OQLDtJfEAMnprt+6BIF4dIX
	dwUMWCBCDO8SECoA2INiM+5TEuRM65hN16rBGqlSUkrvUvU4BW8mdCshs0e7JWi/
	/XTNcj0FMuvUljzrwrikEbJ35fptw09FbEd7p3le7godB4leAUxUIb1naRi3JQnS
	5LrzfY8//JDmfFy1dOkPFrxS2CjqsMXMmJxS/5pPcr77s0lC2Dj2c88eX3jlg9PC
	rpc/FoCTyTvkfqBomojgrAYY/GkMFh5YWg9+ZwnIyXNLWanzOBrZrswsxkXf/QkR
	KGL1aw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce6k031vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:24:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-356236ae3c1so2078103a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771597468; x=1772202268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0//Dxsq1TVWMQt7xaqgkecNvssvh6Z3gJ5xg3T+XqDc=;
        b=iYQ5JGAk3oawulznLm5F94VIzmcDd+p1e0wuYGdP4pK046rmvqr67F726jaOwocJf+
         lEwW/xR9QIG/15Nj+ozIwzhTNynwnU9TMo3s57FO9RUXwESQ4M4gqHR8bfUtEZrUVy0M
         mvGQqiOuU8S9YKzFBKi5N5d7q/5whws2LcR0rx8W30Hhb6A3x/SnghMqFP+E+E+8REXh
         3iApqCuu8j0u4ntxhaw3KYqLyCSCcEQRHMGD4GUh40JBvMSDVUf/tEotoEodlIJ3P67l
         eGPKCfYGmebVK0K+EOokPwJ03LVxj4pGgxZ1+IElNO4JvuD9/1Lx8LWTXnCKpfOG/AsO
         PArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771597468; x=1772202268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0//Dxsq1TVWMQt7xaqgkecNvssvh6Z3gJ5xg3T+XqDc=;
        b=P2b8NkWOq/aAfmL0LhOMMbvK/eem3wOG0OjJ0gY+at3cyKUyQeD13/KEixvBnArBpL
         L7eEnyCZNJQVGY027ZtkHoqwmw2oxGF6CDyH61HMhS+lqlCsJt/ZxMOCcHRwC6t29ZT1
         /ipYT2wOYeu5gE5bw8ZHZ6HlUVPu2AKmWA2lwBnPYKFCBjrdjmz+eLuC5IKs5W9g3OcI
         o01WkuBhrYI9+xSuUqWNF4KRMVP//gKJvOSRgQPD2afGSupZX79CRxffl/fRk0WOt7Rw
         3r04q202kaOfUppGJhi13KN6Y9R46HyIDxVEfsh+SEkIHU2IzMQhlebauI0ppn/L4VrD
         tbiA==
X-Forwarded-Encrypted: i=1; AJvYcCVK217q379UJqyMVKjPCQBS9SDt9mTcWA48PwvKlQSZZsO1aTXrbXH6uqh120z9rOyGeyJW3X/TKScuLGnf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qOae+IUc9bsbBDtB02cpJUxDOKiVJ1QGXl1OO605tnMHZzus
	IxzWCaZj0XMnS+vblJ79xMyfDybbHhv4pPrWZ1EQBV974rDnL8Js2M6r3wTiZp9OG6rNHcn7Hid
	gMFrIWbnjrBo4tnFNIeVNEuZXUHI68jZAprZTuzVhKh930igZYkIuQp61PUxYZBAJzXnF
X-Gm-Gg: AZuq6aJ1vK25j5YU0Ui+WnaWHdl8/p5K5umrsILTDW1zUJe1xORMEfgJH4L6dWOLqwW
	8BMtzWmRthf5cDwmOsKxhGG+GUoWwukBnCmgM8Hg0Q07c8hsXBD/hZgX78wQKRQ2vXg5Kre0FCZ
	Esa7lsXXV6cOlGCOciuy+7gMgrP+j1QyACRcBRrVNIqPn93pf2HhWAgQdrmfBkHpAgao6IlmRXy
	WEOtjWtAJTSA9xSeuGI8T9ZzUU1wx9U2M82CGMTvs+ZfnEv931IJQJ7eikuRW2hgbAr1Ehi4FRA
	A3TEGOHEH6ANglJmn03IKPKM6CE73HbtXSUHNsQunNCp6LM7LXBONMmcVRIdCZIg9MQce8hyimS
	hGRXxr9VffRWY2pnf3eHtEhfEA+Pw+uL10blCbON6Lla1N2qaXg==
X-Received: by 2002:a17:90b:1802:b0:354:c452:b2c7 with SMTP id 98e67ed59e1d1-358a5d4c710mr1671272a91.16.1771597467821;
        Fri, 20 Feb 2026 06:24:27 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:354:c452:b2c7 with SMTP id 98e67ed59e1d1-358a5d4c710mr1671252a91.16.1771597467297;
        Fri, 20 Feb 2026 06:24:27 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a1a2cb62sm1711507a91.0.2026.02.20.06.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 06:24:26 -0800 (PST)
Message-ID: <2e0cb980-3f19-4bb1-ab10-349085d455e3@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 19:54:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Glymur clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com>
 <20260220-glymur_mmcc_dt_config-v1-2-e0e2f43a32af@oss.qualcomm.com>
 <db6b5e85-bf19-45dc-b536-75512096a5f9@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <db6b5e85-bf19-45dc-b536-75512096a5f9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDEyNSBTYWx0ZWRfX7jLHs+y6G0dK
 l1/+w/d78YSZZIArd50JrB8BY5JiPxdbr8PbOTKeiP836AQbAWjwMbueF1EcMVhegoq8YZeyBBM
 meqBjtFKu7zOIjNDXkb+Y9Ci5Etl3dErQGgY7DO9Zs1JO7WxU6HkJLgDQgLgPfZoisMRRrmLH+i
 i7tT5HVivDeCrhwDtQ3VsdmCKLPi1hxCpY5UIHRG/YVW0YB8ayFmiYuhnv8xfjsU2rzQY3jzg6o
 aGjtwg8fd6YcOCUGHljX4zgqlqBjm8UBa8NLbLT44jpVx5qBLeqhp2/Ng+7WOyTHmbhslSyGEfg
 vBlqIlTcNercng8+RIUnYfEC7jS7TFsRQWfObiYMCzDW7sOQERibVjTV4al55PWLCFP/A8+HPXZ
 ZSnsbILkLK4sbIjsUXzzJIvI/ZfszVvp+Kb1Bic9t7KAySK3l+loA1sS3tGAI1YvSXB2PVlLwG2
 w/Waa3K2e0MLKxj8+IQ==
X-Proofpoint-ORIG-GUID: qGFojLCuowScPuuJZDZCii_cyHKcavZw
X-Authority-Analysis: v=2.4 cv=K6Ev3iWI c=1 sm=1 tr=0 ts=69986e9c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Zk7Ki20fgETz0Ru4rw8ykQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=kpr-LFZNc17thhI2UQQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: qGFojLCuowScPuuJZDZCii_cyHKcavZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93508-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 378631684EE
X-Rspamd-Action: no action



On 2/20/2026 4:37 PM, Krzysztof Kozlowski wrote:
> On 20/02/2026 11:16, Taniya Das wrote:
>> Enable the Glymur video and gpu clock controller for their respective
> 
> Qualcomm Glymur SoC
> 

Sure, will update.

>> functionalities on the Qualcomm Glymur CRD boards.
> 
> Subject: Qualcomm
> 
> Again, you are adding commit to generic kernel to generic defconfig. How
> anyone can figure out what is Glymur when going via shortlog?
> 
> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


