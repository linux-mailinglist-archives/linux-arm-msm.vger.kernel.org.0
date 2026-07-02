Return-Path: <linux-arm-msm+bounces-115882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CGOrA9UzRmrOLgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:48:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1336F57A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:48:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d4dTigox;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZvIFYof1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115882-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115882-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF0AF3200591
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4CE47DD7F;
	Thu,  2 Jul 2026 09:34:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23B47DFB0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:34:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984879; cv=none; b=m+YH7WLCcLnq3xnZa4IYfZCeUYRURxauSYCBT/u7LSV6ZF34UlE/f5kD1G7DTK71eRivuRwDhISOSIBmmcR1ZeatS/Lf5hRtJAldpe5igqTE36yKnFQMOJUIKfDHLuKhExjxu9Tnai4Hz/2y25CFFaK1cBVtNKZC46/xu68B7P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984879; c=relaxed/simple;
	bh=n7l+5jzdQyiCyusjj8NDrxlzevGuy2iNMKD5LMtnzQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6C5W9iTGce8ZOyK2XRZiRK+Z9G8NmMyn3Ekgo0zm/urFRoxNC7roS4GPSBDCxjUgziq4r1RFC6xtL8mzL1gNkNRGYG9VLXgUR/z+XXbn58mfL5uMnZnF5HPsXNmfcsJYqvBx0FMUNljyWx46Qo8u+dx5CQ1KrkyEHrPejsI3uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4dTigox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvIFYof1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628ZaOi3046363
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gxx7zK9/R8weBQXf0t4G5EGLWcX/GGlVzWsYqCxWD0o=; b=d4dTigoxGqVrK/bn
	Nd/9QdNmeqvLO5jFzpNrsf0u34kFUuuy5LiAaEQJd9A2Vl+z0io0/dXiejJva6KB
	J2x4Tb5VqGI464Qo4/XB++Wjy4WnwRvV6kn8De4ZT3MAxYhra4C0Rj5GPK13fldk
	3AMbKTFP+LGC7AX8eGLbGErspBGW7BEq7w8aRAWqmQOOh4LfeanTKGIVLiA1lwjf
	TEj3UOnezz5NA+4eicGytK5YLgxDvMy0xMrJ2p6VPGmuBhLR6/njSNU10Pv5Sgbu
	1+BV9bgVx0UmFRYMe/GX7SsjEFWWfGUXs6yAEBOfaLxbAx+ZWXZsYo9KIFZwVdUW
	JBPYjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k3aubc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:34:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c15c77619so3238851cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984877; x=1783589677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gxx7zK9/R8weBQXf0t4G5EGLWcX/GGlVzWsYqCxWD0o=;
        b=ZvIFYof1/FkdbuKdEU8YpxuKYrGUWHB/CYZehh/GtRpOkPUuxuhzN2frQXZAqSb8AZ
         ngvsYk+ZU8l8kyN0lDPzm/aySBzyDEsDvqRfD9nLyydeSa/SFPZkRz6hVUy9nd1UHVrs
         KAllv9wDt1Ufdi1Dv13n4ky25iT8agm6NA0mH9BX0LBUxZ7/2/TcR4VzFuvlGTIwSwga
         2DQOaWOb50qPc0qTbZ7Pyu45my8dnoojzTfKSpZT2xLVQzSWO3IabqFQVRj33jaT9z6W
         AlgaRjt0kEqNZWPwkq0ZsNxqIoD4Fk23uy+b/F5aGjESohF3RPGAC+evad4etEmtPW5x
         lSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984877; x=1783589677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gxx7zK9/R8weBQXf0t4G5EGLWcX/GGlVzWsYqCxWD0o=;
        b=W/IaLlCv+TTs2vqHSDCEIFFHMx0t2AceqdccZPJzP8kadR6j4Vtiw91QPdWEyze4AU
         bir3v70naada3QPCmJG8fewrrjiT9jKghQHUV3HrVr7YrM88r/XAniuzw5dABS6EIe5U
         yB/EK28h63D5/WThHWsY9QMHAsjIYw2UQ8cu4y6jvfZ39xpuXwPykVGhPcej6bLFWHLR
         /1dAQ8/uBqs1wYc4OTy7icZ2wc39r+ZkIPHJZDwmczHt71Ezhx/xnlEnjWSCq6mg98u3
         /G4/3Mg/rZpOUuN2X9VHNIgrt6H4nAfZyW+pD7vTGWn/TuGVKSpRiUcjfyArBui2EWqK
         CFpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xon9UUYNkBQhuWN0H8D7ZQCxPBCb94bT7lcVmETQD/i2Er7SkSasVIvd5pT62qp/8/o/j1x861cmhPjMm@vger.kernel.org
X-Gm-Message-State: AOJu0YyMxQcXpKyt+SRp6h0ZetUtxmYmm01PBEMTYpusIGL3GSfnqZ9t
	ZlFQLkWksMcULXZVSbVZt+TJoFcC3IoYvUPJmpRwpXQK1hccY1CvT3wU5N3MAo9enb4LXdATPsV
	wW0rPfJDZKELsMZv8hP2Td5KLPvFtmmkEwErckpaFIcqhhP6p7CXStzmLGjhc6C7eDVdLoKer/8
	I/
X-Gm-Gg: AfdE7clmBTg9gPLre378LBP4eyiYUVnVGJ+3fratXBDxjWVs7fX9GUJWV2sqQkBb6UT
	IuwUufJ7m/U3JLZNR7m4x/lb1wteXGP6oHC8HoEy7eEaiC/LEhZp4zjUrclh3P/RkyOHkyRTqqq
	b+5bBKkftUdyz5nIoPQsFhYS2xzH+tppJ5EqL0yrdOoGT20ciIMbj+Srze+nhtQUSwpgIBfoa1y
	2pFRxMakXwlSVv8ReC9DP/ACozLWcwzpBEsz5RJjzMB6bs0N1z/1NnOemqDala+UOB304a9GabK
	3bd94Ln1Wqvd1TAwr4Mxj0pzCmYC46qJA32aWXRzMCz9suFSsQdzkb9z+y2SBXHTNVvx/9S/pTa
	zAcqdb9SWGRFvlP6GAb3ofmbBhlkx8weLdD0=
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr44626031cf.2.1782984876917;
        Thu, 02 Jul 2026 02:34:36 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr44625911cf.2.1782984876551;
        Thu, 02 Jul 2026 02:34:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ace16548sm698758a12.3.2026.07.02.02.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:34:35 -0700 (PDT)
Message-ID: <df15f50b-ba43-4b9b-9894-576b9d2427d0@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
 <20260702-xo-sd-codec-v7-b4-v8-1-d39d0fdb7859@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-1-d39d0fdb7859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX8vTgRsKWNXd8
 Y763VWqwWSRaZtPoqogYC8hcufLN/2cSuOfNWVzQ5QFbAdvaqv1dk7h4uf8OFGLH82GqXMtwJRh
 PUF95ZQZ/WexvId6EXc7v8nPoT3grqpnD6EGrwnKlzaw7ooFglM7r4BWZU7Q9V830qKsarxJOFm
 VZz72Nuo0I+So94t4mthf7kbfmKwZUtNVLAoLt5bM1kS+J2ZPZFhuEAWnuiIUNYxeAYxmsgyLg+
 Xg25UsDUSk4dxxybrqWM1sfUUpNwX0i9QVJLs5w8rkS//bykYNOTR55e+5XRYGuyo42UkKDKMtK
 CLqZIbfio9+dQ+D2Er2WaK7YSv28df3FBbfUoh1mj891J5YkCUUSsGUF8uRTE1VXpFXFQ06Dw8a
 o1W//3FMm3VN/KeEzZkI3gT9QYMp4cFgKv6FYL1o4i3sr0OuS9WZXxACRQFSLEdrWohWFVwx6V4
 peem02jVQTa/+IuXHBA==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a4630ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t2ZNzEmchGV416yE2bcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX3LD+ncd0Gv8/
 5XOlsH5JY7d9mHoVYIxme9mw8z/Bg6eOcB/pZFc+8GeEZ6FpRh35IQ9OzFl5oz+SVsmxlcLOqrm
 9s5yweo9RrcPKCYSVMopBMUhAlhW+4I=
X-Proofpoint-ORIG-GUID: vH46Gi2Y1FvNycwHOH3hWlYyvIFFUK8t
X-Proofpoint-GUID: vH46Gi2Y1FvNycwHOH3hWlYyvIFFUK8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115882-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D1336F57A5

On 7/1/26 8:44 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to runtime PM clock management by
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
> helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
> from SWR clock enable until disable so autosuspend does not gate clocks
> while SWR is still prepared.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_WSA_MACRO since this patch
> introduces PM clock APIs.
> 
> Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe and
> by restoring regcache state if pm_clk_resume()/regcache_sync() fails.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

