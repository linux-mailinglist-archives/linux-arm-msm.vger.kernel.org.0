Return-Path: <linux-arm-msm+bounces-102283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFzwH3ob1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:10:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D58FA3B9A2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EAD6307F9DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1825389113;
	Wed,  8 Apr 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDi6uJYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kX+0hl7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8EF256C8B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639083; cv=none; b=MNUYJ++sRcMcGfx7/jyHnOdr1vFY/TUg8NtlhpyBBQ+uSVm68x4aegP6hzjSNxwp0iH3NlEBNeP7iIXdYUC3RjF8D/MVffMKmHTrkDme8RYpZjaDOYEm4Gn6oekZda/fE/Qv2ZKkGMUWsze9gfkMhjJmfpfsiUpykFp4xqXr0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639083; c=relaxed/simple;
	bh=M6u+xr6VE/DbpW4Iixg2PfsnGpetn7BGbGNPST430WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdqHCQO0zIeNXQkl3Hj/bE47SJUmqOkey9Y7+JEaXCO9vVBM0INXgjUJFb7bcVDw/wBEtUsvjXCVWwdhmpXKXVIYdPIqTfO/5ecqxy2r0Rf3T57htG3/IVmXY8Nq1+T9PCzFL3JbWQACn/8aaSShfi11ItSUhwuJAbJylEbMuIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDi6uJYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kX+0hl7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387bUl71259207
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=; b=VDi6uJYu+DG03dui
	taZIb3G9mMKZCRSYTv4Z1Xac+Z8DkU9lCFmaD6WAeVlkfZdAel0wWSpET+siuavh
	01NBbXG0Z4bkHcBd6GK7zRTKQ8Sf7sdznVb8xmr1pT5gsoE1JKb6u8DDAT3/ndCO
	cigShLlwElpJQdTNnoe4eXlrnrpIDRsN3ekG6WMHc/2xTPzZjHxbM44VxObFm+SX
	w27YGbGSgnqO0j73bsCnTDBsCWD5Rn5dW/HzUWqw+zwTtHWfd50HsX6ebh+XbG+J
	gKYqrki1zGrxLIb5vfvFZzzBUGEg4i3ybLr6JFI4YQQ1hH8KErftGa0Dr3EGDHSP
	yECZKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsruv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:04:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d076d88so14106051cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639080; x=1776243880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=;
        b=kX+0hl7oDqXnGVmwXPPdw/gzUP4y6PsbxfSgXYGmJe5b2eMJPmsEanjob5IZp33ZAn
         n8kZSGQTJpU8zJU2qdKfd6l089H72YYVMj95/A0s0CnSwULEuqMcOrkXWvZx7yLD3doj
         fLi+7AUGAaaycyCslSvPSv/XeKjT3aabLjiv9tQ6/FHVc6knnpgiy/0HSxUblDcjxHJ2
         /D+Vx9JJTqlXaHFgAAE7YWDLFW9DLbB8jVNn3RWl6zP9vz11PEAN/e4JlNosuLcgBQQk
         X1phKyxzqfpMta7Le718vd9Dfz7Hdbnf2CjpkE21EoRSWi26COcLVmOCpwU3tTHgauct
         qXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639080; x=1776243880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=;
        b=sTvSPnwmQct3LxqitruuB4ia/WxMYjIWMl42XgbaXHF8Lfz1nRlqzqjVqz2kjzEb9Q
         9MyqDqprkqb/RGg/si4qhGa8ZqzyDo5BuW3kTBlUyuLGS2QyrqKizjuQko54O9/39+kD
         SZ5vqFlLt/Pjs248RqjJjrzetDwN8oghjtisPDVeVNoN1jX+a8P07gu/3tdZ0gpu1yPA
         cQW13gK0pvkEwn3fg/1EEOYTysyoLv65SiIXwoSKzB0f4Ls2tY9PKRtj7NTmANyNv6KC
         356y89EjOw8YWELlHWCyHN5ywdeExVRNEHIwfsonAKADWrvWGurn67EJT93DEZ+uzDQj
         EgOg==
X-Gm-Message-State: AOJu0Yw5zRBpHJQFy2bD6kUwsPhqW+k5RxiTawCnoDZlyvZ+GDGBy6C/
	c2nNuLFn6C9ISRsS3zaEYUL5Rp0w6jfj6ern6kAQjkJpJOlpXSFxoGSqjLBG1BUkhCdrowrx/YY
	tf7/A551mJT0JvfyIEWVXM5YQ7Oijc8vH0i0YjWBpB3KzHy3yCe47wAVPgtGQlTqHadYP
X-Gm-Gg: AeBDieuGhICP9szer7LD/R6mqKrtvKSY3DEN7oCZnOMWOTBVchmKqR6Rr2ZBVg7TQMQ
	SSHClWz8Ot/b9QbrYu5t7qIsi5m0yJ9YkhhnoAWeEcI8MKko0i0QbgIkxVFcRC1lbVXBVLXGeSG
	CpM+Xxt4wcu1zqgRQDhHajPLlDVp7zD+nYESQcVWtRRbB+kk0Z+jRCUt9IMfGzFxz6ld83ziqg7
	fB8ykS8AQFMB9hIjYDgVc+TEEebJYPPj//hHa3wO1lfzqNIkpW2uVJZvqPtuQ8gpkA4rv91Jm8J
	3hSU/KlwmxO5WZU0hqkpjaluhHe0UUF+1RKdJ3+2MG63+SiluQaEzG68ivx9iBU/a25mb/uEQzw
	wuqA/Pki/2lFjCp3bGiXvlSgOzGtc5ca0Tms9tXQ5zSwO7UtkQ73FPG6kKFk9MBwAXSUCunPRzq
	tyuJ4=
X-Received: by 2002:a05:622a:480c:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50d62c49d79mr217663901cf.4.1775639080026;
        Wed, 08 Apr 2026 02:04:40 -0700 (PDT)
X-Received: by 2002:a05:622a:480c:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50d62c49d79mr217663631cf.4.1775639079628;
        Wed, 08 Apr 2026 02:04:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a787fsm4910134a12.14.2026.04.08.02.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:04:38 -0700 (PDT)
Message-ID: <b788def6-a227-4807-ad3c-46515e83575e@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:04:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] arm64: dts: qcom: kodiak: Mark secondary USB
 controller as wakeup source
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-8-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-8-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4SYrs3eVypWw2gqquKJsyhLYEGSMAJHc
X-Proofpoint-GUID: 4SYrs3eVypWw2gqquKJsyhLYEGSMAJHc
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d61a28 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=TkYFqX6U-2Zjo2NPXsUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfXzBX65qgbPeeP
 sGTOVJ/7aLflbVg6CxgmNlG9aXB1cSUFT5iVry12h6m97dVLnJCuW6+dyTqsZgCqL2U670TZ8Ss
 xVsxbzkdLoIEkaAjfmdRB2LYJbkLxbdmr/5sWyKn5dnlz6isrKVR02mtN11RdjE80FSJ3TH/T3H
 +PvD9MmNu4gEv0ALENTjqfjLWE0OGhzdSlSKaYi5r5YbfURcdQJ6upQRnKH94A+j46WrvRZEiVw
 fEf4DA+/FRBj/EmpYfkYqtZjMg2SRFNMQPz3ZIb0Dmpr5PIS/3VXmU2RaRR4YTr4XQMD97Qcmpf
 qIQB328koqqVN2JIksCGJo1Fk4selyYna7u/AyalFM7hKUPAjwXfXHphu7t6tFu5Yj3AwFYeHYp
 zODRILgxQfl52tlolBs5RFXUY5ngaBuNPVf37tFOCMzCxOZJ2zkJSZLKbq5XobDUfh/xAS+NwOZ
 wc3FMvjfVmVcfIDcDDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102283-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D58FA3B9A2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:20 PM, Xilin Wu wrote:
> From: Stephen Chen <stephen@radxa.com>
> 
> Mark the secondary USB controller (usb_2) as a wakeup source so that it
> can be used to wake the system from suspend.
> 
> Signed-off-by: Stephen Chen <stephen@radxa.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

