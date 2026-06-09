Return-Path: <linux-arm-msm+bounces-112090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2WhoJ+ffJ2oo3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:41:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 265E665E707
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:41:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mtOpoQ26;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eWvXcoql;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80DAD316DDDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276804071F6;
	Tue,  9 Jun 2026 09:25:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC0226CFE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:25:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997104; cv=none; b=OQRV7c72SFXnLufckC1MvoO2GaC+Av96fwMB1+w84ELdmLWxCfma+JWyOv9hhuTLWwk4r91J8ViXhBMdpCELXpEsrGYi4t67fAr+OrcpGGrHfcC97rZiYeXfQz8eZ3QUXCYx499sQtUyb1oceTjm2IdKO3sC5K99XZImBOzRQb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997104; c=relaxed/simple;
	bh=1Uc0kX1/3vX3z8Oj1M3cStKT+Ox2ekhfaIbrJowIJkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6+1fad2QvYysvkimiTthL2ymbtj5nq61b8hFs2zEVa7Lt0IrzwtXM1mFCPrFZhObVR31iM47n8pF70Po+7/z56nHl+YxY9KhcfHeQe1J/91jKY5b5dF7FAFAyYJ5gn5mNcxNP9coxFuhS+QfB4jmoo2fQoSr5HD13F5q2qF8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtOpoQ26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWvXcoql; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rbLd2034541
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/I+g36BXwfvLsFz5BGL7sHl1r0FpctHV8PV0utNTXoE=; b=mtOpoQ2685OL8tV3
	W2eoZY4qxUsVs8+TZQ9Lf84A/Bfqm4yisZbqxqEHJ86+tmnzXnUeLbSEjzKtgxBE
	t61mMu3rYz0esnICaP+yDUbW+zyEI+We7fpDJSh60KlXoSB15gwRRsOkmK9sRsyt
	g7yIqfKpcHy34IbsvQhDaQrVXOvG93pSKK3YlePIaytbRQI4xKKKqyJ0nSKtkUK0
	Qvq6lcSpktoiQ0NyVvLRm6fvKz2zxfmczbS49GQLBiooWYB6JYNDypcFkQ79Gu/0
	cOUSOMG7BKLfjzr9oTAPaaGnsPX4/pdxqNPXNhp9pX8CgqBN7BfrmrckBCYjoGz5
	OFVItg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearfsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:25:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91550f68e7cso142750685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780997101; x=1781601901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/I+g36BXwfvLsFz5BGL7sHl1r0FpctHV8PV0utNTXoE=;
        b=eWvXcoqlESO7QyiSotdQUddcSlPXKgnjaT2wGa5MH8YgjjjmKbUgeaaP5piSbNiHjr
         /lFP9tS2QZ9F5kZihBuEuavhvTRCAMH0qU7YaFvP4/Prk6ndP+caQCQVzQFmZFZcVMjs
         Xbh4HYhA3lXXQRDf5b92dgRDRKm24Ed7ujy5BOGUgdVh28nVVlGxxnJAeQ5K3CG7qGir
         XatRSNFpZvC4ysxunUXFbjW1pdPMRMv2pPGRZLSBjI53RE6lXdubZDx5Jon8Cd6HF/GX
         LBAWYg07zNpSZWMqPIp4AnShH+NtPZyw6Av5RWk16qwravKWUBIjKWHMGv9MV0sVU21C
         N+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997101; x=1781601901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I+g36BXwfvLsFz5BGL7sHl1r0FpctHV8PV0utNTXoE=;
        b=Ij/Usv0wu6f4CZ42ZcdKT36E5gf/rnUFLChiHK8x2h8gH5LpYuvtC1E08DuZCsal7/
         TIwVn9NULLfHfPEFDVUuJDDSto9lSi9xDFTresF3zap6kRdeDVzsH2vuXaWP5hxh2eqi
         fkQZIj/OxZx+a34s8T7tToEwin24mt9WHVK0BFQtqXY3kzGL6reObAr6r1GE+BYN5vZ4
         VMDI2du62We5q6//+cAYT7chNSDO2T7oXNOi7t3DjHmOvHtLrmnaVxk1HMGirUwf5lmb
         8ZmX/jOFM6J0vlj+L8+vlhH5yUMdkeQ9nT9zDwfqocCCAkafioYID/IExad6QFaYz9ef
         DUgQ==
X-Gm-Message-State: AOJu0YwTctiggxEX4lqnTAbpdGY8jcQJ6qJkBDzFJtq9MhBLmekSfhq0
	vmce+u3morw0Kx5TXRzO6hNRJdJ6JFRjRWpta4cbqOQPvakK/35y+VEDB2pmOLp5DQsFHetVGxi
	783hwdA5kHOZWglAYJdy3x5eDxZN8phd0QC3TUHgG5ixqzxIwbGbLYLMGlxXR5MWgjaljqaRV0S
	J+
X-Gm-Gg: Acq92OFPLpVLqdv+kyLAAy4PiV3/QAjBqIPjmlD8q6woj9oZRXtOstJS9phUzt2s2Zu
	qhanWiwymvs1lNJpHDjVqIctweqb3J+DHaTIsWZu3O/NSU06dH51cTZhdFIPXOSv1ISGV10cUJt
	A3bj1CnGRwxiOzVrQyjDpKTcwLlMnDAENLSzhG/nSpF2iad5Q28B3FxhNVt24VRKOP5bd0xKEWt
	4Lh9EIZynJAswZOk7/fiA/8sX5kuhE2ZuAMi5iqTA1zAGOlt4nMt7MNOgO6V3wz+NaBr6ImwsNx
	dwGHE7KbeoWA6asc++o1VwLcdVnlUF7URrjlg28LgasVoydbnf/gKZdk68IY208/6dovoDz9ksU
	idyKtSGyRChyAPaKKosQKjfmhEb7fvULlW60IjHpcyuh+8IWseMwR2NJ1
X-Received: by 2002:a05:620a:28cc:b0:8cf:d953:b4ec with SMTP id af79cd13be357-915a9d5afd0mr1932134285a.3.1780997101339;
        Tue, 09 Jun 2026 02:25:01 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:8cf:d953:b4ec with SMTP id af79cd13be357-915a9d5afd0mr1932132285a.3.1780997100955;
        Tue, 09 Jun 2026 02:25:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm1018106666b.2.2026.06.09.02.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:24:58 -0700 (PDT)
Message-ID: <3c28dd62-223c-4447-8cec-c7c527aa49e3@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:24:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [alsa-devel] [BUG] Lenovo ThinkBook 16 G7 QOY (Snapdragon X) - No
 soundcards detected
To: "thomas.kuang" <ks002278@163.com>, alsa-devel@alsa-project.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5fc3ab80.a3e2.19ea717f09f.Coremail.ks002278@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5fc3ab80.a3e2.19ea717f09f.Coremail.ks002278@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XEL2uY8iS6J8FK6KqXwpT2jdokmxIhXn
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27dbed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0t5lN559Mg9gQR7Lf2AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NyBTYWx0ZWRfX2hou+WI9W9LA
 8B0DhaJsq4oAHCGuIO383OwEJtjPwbuB5wcyK+1WSbrPmZbC9fURXvGL1s5Uk+fltEjlnYsTEDc
 uIgKoYu7wZU9yNwaaaH7vFCcxWyppkqFa9xgpcuf5RATNtxD7YhpjxNyxIaMIQJwcUjPbr7GwPR
 ockJafZKiWDT0Jx57gQiOrzB41gEnBCGYaAu3Y9WSknGzp7FzJMNpD1or7jhOtgYD0QtRD/KK4J
 T0wfMg5NvQQHfL49yoUGSWYAyGORyV5IjdmJ1f9zHviLzD45BV0oKLyIZqdfXVz1Uo38wX5aHW5
 NFBazT/4B+K8A9m8n49oI8WxSDMbLpDMpwc11KYwkS+8+Tos97Y21PqynMynOFp1eDDJwA1UFHS
 3NYVzbLplMCdtguNtU9VXsgZOUFrwL6byVA7yLsKURGyRrd4ju50crr0nWD+sj4SbOO3bT8KgO7
 rwp+PEwg1xKDJDHruQw==
X-Proofpoint-GUID: XEL2uY8iS6J8FK6KqXwpT2jdokmxIhXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ks002278@163.com,m:alsa-devel@alsa-project.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com,alsa-project.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 265E665E707

On 6/8/26 1:57 PM, thomas.kuang wrote:
> 
> 
> Hardware: Lenovo ThinkBook 16 G7 QOY (Qualcomm Snapdragon X / X Plus / X Elite)
> Kernel version: 7.0.0-22-generic (Ubuntu 26.04 LTS)
> Architecture: aarch64
> 
> Problem Description:
> -------------------
> Audio is not working on this Snapdragon X-based laptop. The system fails to detect any soundcards,
> even though the Qualcomm audio driver modules are loaded.

Please post the output of

grep ^ /sys/class/remoteproc/*/state
grep ^ /sys/class/remoteproc/*/name

Konrad

