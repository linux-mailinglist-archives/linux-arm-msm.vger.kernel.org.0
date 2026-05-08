Return-Path: <linux-arm-msm+bounces-106657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP7fJzDH/WkQjAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:21:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E594F5AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21AE5300F14B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37ED395D9F;
	Fri,  8 May 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LH9PwYO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/pnlxOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62136392C20
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239176; cv=none; b=fU4N6Y09DxkIIrEOzxfW2nN28xlWbm8XpB6PGSXAFeOlfEAB+CEXK8VNKnkgw5v7dE3j+lPtH0t3nauO3IJU1GrVmdIH30zM4V170ta3AvwF9r+rPm08IbfvGRF4fbg9WNBNcgNS5CPT8QXh/gGJdgGTWGoWqM9wtX609olLtoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239176; c=relaxed/simple;
	bh=XIXa8EjOgez3qsla3pU5FqSnug5qtehX8v23sK1H1LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYhW3vOKyHenA/9uAm7iPDHC16xyzrHJeRZ4ipN5iPu06Iqm345rXU2ZcuycZRz3tyKD6gYUlnAjIuRllVpM4QRd10Yrw/GiUYcO4lLyXODEzuhWY30cXstrS3SEeLHbZjuynMzruQfnlNQVcvpMn9I4lv1xt7Tma9pqRBI7fSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LH9PwYO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/pnlxOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AaCNC2531551
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=; b=LH9PwYO9vUoLEIWx
	r1y3sQG7C8wXlQW/DAN9DYySbt2kNsRK3Cwh3D0ioknOOpo8aH+JZZE9erreLTot
	0WbrqaWh0FLZtBxMMeIecKZNpZE9hcgSx2s7f0jqVHgASs9T6MsTOsyskXTkAZ05
	QtEJ0Eki2Bw2OHA/qg/8xtxNExYu4V1vAxXhdJeQ8rrvHC46vxmt8t3URw1VOW7W
	dIwtEJPgir69s65jLcryrtFjkyPJbRfJlP4mAcQMCoLlj+Aeb/O4gcJrarYeGd4y
	iw//+uh4lxoJbJqMKqiIDI2+UcNVKjoCmKODxSEZy3uLYRjIyu27b0DyNQ5ypPeI
	fdch4g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9u4p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:19:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95ce849ad82so96508241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778239174; x=1778843974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=;
        b=L/pnlxOdDyWMl7UjAJzjS8TwRq8QyUtf7Xw6/pOovSOzoW4l/Pdyh6F/I7mgduVbov
         Gp7nYeoTCkKQNL9UAMpAFteAsfATw0MHI2KyUdEgfhRSDLwVbXSsGXsJP6YxEgjgbUZk
         7unWtCmDPB0/yv7ZKREEiQJGCmZBDrhTSPgitx1ZAM5SVANA8WS83anhAQWU1SFpKMnQ
         UQN0rFoT/z7LUohJlRPFvnkrxis0qS82C9djJmxr9nxku5dLta4ZZYdHtv4bZkZ/NH2c
         fipdN3czoKfTY5phK6PTWYGNsnW+AKtPA5Zyyf+nyOmnyAYJS5axLPgOnZpHr84+UKen
         TxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239174; x=1778843974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=;
        b=dO3m5zoTvqtJrJw2LkxYCLEj+cm7uAFfhcrsIL+8xvBILa5XzbULeD0V3qp40tfGMD
         NRtxmJTbB/ZmRkScum5XUcyfDXXyg1/WIOyxZ+m55HldIeBKeZgj+vGYbJIhbLRZfrBq
         FxURzK2IQb/w8I+ZpmBd9405eNk8fiHPqWDok19cvq8VRcJRQ6ROyF1ugZckq41LUUph
         V5FnD+ke6e68rVwIzH8dZvWTQ2e0vkF9GIDhISIljV9l1VV6a058ThJLCs8AOhhqSsNt
         gyCW4VilsOcJdq08KNZJ//cdLnWa+oF5Kr9Nb3DSvek3D9pgdFxeG0MkMsdK51MAayHi
         Kbeg==
X-Forwarded-Encrypted: i=1; AFNElJ/wBIsVCbUq2lYedGG5Kl3usLpkMYsri4PmFXj8nhWtYEKDpGnv6YUKBRZevlkayEcM9XW0hCwLfjdvjqoG@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmSPbG/2EuEnVvcafMyglG2AQ7OOaUudgVQpsWfY5gVsYalAN
	adZkrPJY2XyTdMADc+nvlUuYGx7PrWWX1SK0ivj/eJ1H6ZgjCX7dyNu0vIs4Eg/eqxsbGtcvi6e
	0g8OP53FilOfrAxTsIUY5k6osy2jlCN8SxE+RiSG5giZetb0uX1zx5NjZBxJ5WCsw6+b8
X-Gm-Gg: Acq92OEXfOS0rCGnGMXewdEg+7EJn9573b+20nXuaPE4/5wzlenfqQsoAPxE4SyhVLU
	6Gjheg32lHONAqLmOIIyv9z6eYOI8B4BUnNzmcD5yD7TEWrC5DZFrHJ+lMb2GKjbb6KN4vZLYQp
	PAD1a3lOrtmhkL92UXYZnfY4QAuyEWvNjAouvY1xrP/FeJT/A7I2mI2ObSSwD48sMswi9Oan9W+
	a4ONZunob2izWUVQ5Tu51oiTM8IckDxS8HsLV7VDbkf8YPVcRdmJKKugtvCBZ8eUBZ9JBDNhknP
	waDJ7gHoPYjfZgYqPNOzQEw/TyjQgYnNsnGgvaFgy67k6XxsJi+iOftq1IqG7PIZuWBbdM1pVnL
	/ECCm2z+MlDehBhXZbqNTlvqlrCkDbpUGtriNm0l0MUAwpH/7gKEdZNCVleS+pRViroWDppS2Cy
	agvrTzwJuJb6uetw==
X-Received: by 2002:a05:6102:2ad0:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-630f8e77f88mr2676934137.1.1778239173591;
        Fri, 08 May 2026 04:19:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad0:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-630f8e77f88mr2676908137.1.1778239173166;
        Fri, 08 May 2026 04:19:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac398b017sm65898666b.38.2026.05.08.04.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:19:32 -0700 (PDT)
Message-ID: <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:19:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
 <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s0NZ-I5DGGHkK4s3bdcAS0_yULlRroL4
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fdc6c6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=T26Fge9w-xJM3eegr2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExNyBTYWx0ZWRfXyJT4k/7izn2G
 jrc8c6KF8fzym+5JHDzkFHWoU+5wZxUp255pFn9SSMh3iaI0PSQDhlyaUbIs12CkRk1KEZFO+1U
 Q5VmYBcfcQWift0zvhTI2JGJveM/AMzXvjnNab3THHB2dzhqtufoh8hirvIpbXAHE/HR7y7E5lF
 bkvf8kqYEfA3dckmsp5CiLGtXtrIKMzt5+BRLRSSXq6DZsh4oz64WEGh8khYcsVRTf1qFE/h4zK
 r8DFStmVzoK7tqylAC025Iva/NOehesCNVuW0UiNSq44jeUyE/L0ipDGnCSFopQIKE6244i2PGV
 ZAg1MyiQpkJDNStPcKcEYO0MbHtZQFhVqG2+/0d7CXDvmWb3iQJzoljchUfw+krY81wvGUm9Hum
 PTIm9cVacHY0pz2mmepoyRap/Aze/5btpaRJ9GhhDIrt/e0y8rduU9fP/D9g/Na+B0Qexwod0GX
 wtiQ9cTPl8Cj7L6csug==
X-Proofpoint-ORIG-GUID: s0NZ-I5DGGHkK4s3bdcAS0_yULlRroL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080117
X-Rspamd-Queue-Id: 18E594F5AC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-106657-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arduino.cc:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Action: no action

On 5/5/26 5:44 PM, Loic Poulain wrote:
> On Thu, Apr 30, 2026 at 3:21 PM Riccardo Mereu
> <r.mereu.kernel@arduino.cc> wrote:
>>
>> From: Riccardo Mereu <r.mereu@arduino.cc>
>>
>> This is done in order to support different video output over DSI.
>> Since audio part is linked to Analogix USB-C controller it is moved to
>> the same DTSO.
> 
> I'm a bit skeptical about having a separate DT overlay for this. Is
> that really the right approach? The Analogix block is part of the main
> board,

Oh I skipped over this!

So, does the media board require that a switch is flipped or something
like that, to route the lanes away from the analogix chip?

Konrad

