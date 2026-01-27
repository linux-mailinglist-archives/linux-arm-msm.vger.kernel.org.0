Return-Path: <linux-arm-msm+bounces-90751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFMlDcSoeGl9rwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:00:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F993F16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3822302836B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563F134B678;
	Tue, 27 Jan 2026 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0VQpZXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ej2mbv26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057CE34B42B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515199; cv=none; b=g+NLidoonVu6PXeEfJOQ80xzB+znSp0YxmzkTwG4zHYr1BryjyihaODwl+hLUs8IAPNjhal21ofQad8OdEZERRKFE3WXZRwVHaj9tLsB7BHAIb6l/al01JdIrgTqHtbtXdPIZr68oZ2KCmnIzQB2+znCfKutnw/bnk2Vu9Ud+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515199; c=relaxed/simple;
	bh=uvwuvYnGonatQel0fK9gL/WyHSq/F9I+fp0Rr546Ldo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E6Kxj30Y/IYvnauw0CHPaxug/NPh5CQRRNyCbCgHd+NIggzHeynmiYPGPRMKhEEVDkDqLrFxnooX5OkrKerTOXWJErfUaf8hUgT9nKXnsBrxuix/fMExrmI8GqCYwS53bZ+/Q79pDer1Cy9p6KiDdE0jjl8ydU3B/zj4IX2X7WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0VQpZXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ej2mbv26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA5WPp1268757
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5s7752vUzCunnbec8GK0Hs8A9Mnfaqxddy+qpoUA+5I=; b=g0VQpZXH1OvXxPhp
	Gxon5ZNi0AWu60p2n+uz1R5AQ2HvABZmVTpMP7b8J+6VORrlh/yvIjwRJaAqzrXF
	9lYJiudegStqXaxjaqshy0J80hP3HtceGHEwfuMu2ZqiRB3IoQczqLWuZfhKAguK
	XYxI6Grfwsi9mVU4RnVYwB/bOWJxoP+wlqHyJAIpg1GkbIxzovVTBSZX1Mw9ToqY
	5b0MOAwcIf2MVBk5ZqODlK+SBNb5DnWcvs8PEaR+mVPNWgC1waASqH2dtuiP4tbf
	TgIWJL94z26I9ciQCpB0oxBlp0o0TCsKGxpZstETGDk5R2XK6narYAPrYKAUJFXg
	P8aikQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasj90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:59:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52de12a65so115017985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515196; x=1770119996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5s7752vUzCunnbec8GK0Hs8A9Mnfaqxddy+qpoUA+5I=;
        b=Ej2mbv267/dMM4RA4dBEO4P1tXyStxoXNhc/9Y4iQ7vmrEV0wmJUYlsF79C9Fa9Z4L
         vHSo9mGyC1CpmAvQ9P2S0qR0B/+MYNAMYptzCsk8Q8r/BiuYgdMlM6hGcBG3YG1yA/tG
         PerQrwIoxOFKL6JAs3xwiINC7ZbLoICQHJI/pB/rIMxzl+p+KQqHXhrV0bcIARUssC33
         qcHoQPoUEZ7JioqlRgnzphhpgOQkwayP6Wy/i5+JtxLvKpztz2RqIh3oX50ZTLtuF2my
         FCHc6u8dp2As6dEIxwOdI8ANnG+QmPBl+OcuUx84+xzI0F7PqP2rOBM/7akApWo82+Ua
         7oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515196; x=1770119996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5s7752vUzCunnbec8GK0Hs8A9Mnfaqxddy+qpoUA+5I=;
        b=H0LQoa1yk9NxLM7dKp6EN4L7jwObjEKRrTDUU3kClSlHDL+BUX585HXWPLi/kSYJOY
         eIAyjfXrHijUtlETmgDzR8VZB4C7vVLS+1LqQP3G6V0Gq4IdVJo8yDJPASbdg+USARGB
         V2VnfWSKbiabbVJSt45h4rm8vOBNCrZLYrKnblh4YbOhewdZ++z1VwXBG3p470Qkzfj4
         HuRucuYIzgvamo3FqpoNtiAABJNxFpbox8US9JYLT2mz/aQHVB+oVAHAt8368Iji8u7L
         atGfG/an/QBNkHkjWTArxfXyeVN7jeSvjQKhSdQmDc48Lsf+HQqdMUZny/K+jCI6iDSv
         VF/g==
X-Gm-Message-State: AOJu0YxfEDSOMfE3YL6O21EBBFz1bgepvK9f/rGjhZbCKywm+ITI9+aR
	jg8nvbaYcjaz8eUNHQXviXa6wwDyxIi442CiX/Zl00fRbxx43amGr35Fmqf++4zqQdpD8jRJ1A2
	tg6qeGSbAcqc7SRXPq4wUOaCwzbOvKfWc/vfNWW0qQv01WqJydRJa23yQdltJJitQkD7H
X-Gm-Gg: AZuq6aL7QMKGIuwTtmg5p7FRN5L1GbJKKfNmpUbOzs4Kr6um/FXmNk9MhNJyPOXwbMQ
	nCo/Lv0k7Jfv3UOb/BxfYZTXedEzDjvX+7NZCDj25cM8TJyrDJ0dlLgxLjuseR1qWkw87tsZ63J
	iLJGSYeCIpeD5a4YCBzVKQgpY0Iw8lLz8zdzjCGHYvhvwCMC+VJaf91UWWdsDSsVMvaHYMNeiU4
	7ZAZAJp0Yiw6OfH0UWTXGOHEG99zC+VYwGakSp2lIuGVzNFfXcvOX3rmo329tcJVI7/JXxJV8jx
	Od2UD/ZMX70bnv5tv5y6W1FXDNuFsZfkeL5KSYbEDdOJgIRRYHhZ6OlzA/rknmk27kiXufVZ6i8
	9Vyx+UY57I6VieQeCx2iuTFQLrFlVb0Yeb4EiNqrV5J2GxB0IyB4VI95Bs/kYHOazNIg=
X-Received: by 2002:a05:620a:4084:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c70b90142fmr122498185a.6.1769515196360;
        Tue, 27 Jan 2026 03:59:56 -0800 (PST)
X-Received: by 2002:a05:620a:4084:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c70b90142fmr122495585a.6.1769515195838;
        Tue, 27 Jan 2026 03:59:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b418494sm793507666b.21.2026.01.27.03.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:59:55 -0800 (PST)
Message-ID: <99c8da7e-0576-4ef7-a84b-547c6073486c@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:59:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Complete SDHC definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com
References: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
 <20260116214354.256878-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116214354.256878-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4n6UAIRF09lLWUQNj_sGOf04xBDUYgIA
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978a8bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4n6UAIRF09lLWUQNj_sGOf04xBDUYgIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfX7Ejuoj3ZZpsE
 3uNcQ8fNJoDqnke5ihpi6FJiDcynZhpGiFK7Wqq2OLdAi4oFieVwCspr5n4N0GBiVDjHVtXMo1J
 JZT/uxqMI3386sZzGzph60kNcC12RQzdaLb8LpoPSZtFQwoevjria1Iuqc87Zi3bDjBj1hSCTa6
 8AsHXda8/AKyN8wy06rKUcucNQa2gf+6rOW5g7RJf7w6Hb+lOMNRvJJ9dCkTdV1lOP95r4HohP9
 H35TjnwO+qV1PRMmLjTIG0dpTzYp7eNGeGVpdNytWWWjNJ7WMlNex7MNTO86RYdvvWbXbEI4R4f
 61rRMY0/I5m8jn9NEOYRaelSkg/tc9+2Z/O/GKAkTLgX8OxTTwIMzj4wAznEkgK9bUIJo9AZlDt
 +WKJg9AM0eXCAZBpCeGRDSvVRy5oSOukmz7yV2k70WADBdP02tr7Ycgw8N2+0RK0Y4BGjj+ae06
 eJ+zazCsN6dwVVygTpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270098
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90751-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 890F993F16
X-Rspamd-Action: no action

On 1/16/26 10:43 PM, Loic Poulain wrote:
> Add the missing SDHC properties required to enable HS200, HS400,
> and HS400 Enhanced Strobe modes, as supported by this controller.
> 
> Select the proper default pinctrls.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

