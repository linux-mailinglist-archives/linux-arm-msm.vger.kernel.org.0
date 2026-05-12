Return-Path: <linux-arm-msm+bounces-107052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N0NNEvhAmpEyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:14:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E5B51C875
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F3CA303F72C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E08248BD4C;
	Tue, 12 May 2026 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0Wai86N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfSpTYjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA5B492197
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573582; cv=none; b=nsi5uwtSoE7FEI3PN62WElKjkWVOpW3aaSmu/FwqDBLo3WIN28c5mholfmZZgWBwq1geStg/f+tylzINmHdvfaVxpQU3V0z6aJQ7AmXa71PMul6wCKJDs9bX46pAFCgXj8rkcJsX5EsyvhLw2/SPZBD3rYM5+SAsb6b4CvZuhiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573582; c=relaxed/simple;
	bh=JaPz0PmMqpVFR9VAI2edYIg/te4svJhrVtK8QT4+WCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxzI3QQtO3B8yQNvTgX07hkimIqCGx2ADiBjqMtwMafJMdlVc30sKXAGoGBxUeSo2bfUnMAtXYREOtmi4INhQ5opjOIrfMvux9oyY+IQX2sd0y6zAplD7CLOUQo4XY2RTLJycJLx3GO9b18kz+6FRSKPAt/z28o7QQbAZ+K0EWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0Wai86N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfSpTYjs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5onIG866085
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ik1ROdqwKoY1UFhbn043GWEcR0Mrm+/8Wii83OHMmqk=; b=N0Wai86Nbd+uxRbb
	xh3m9KfkX+IVWAaGVZZmSIiRomw0bzUb/w+jraSiZqA/loRNBfWwJMmEZCMfU1Wf
	6EteYnbaKNRVyz/DQmC/gouzqVkN3tJMqhWhWFrUrhRSKF/mQPXYCg6nFzCzzW15
	7ZiiU+8eg8L7/9LIby4wWu/J/JjMQ5umRpUfj2bLOvn+i0HsmfIT0+hiUVhvlFvw
	Esx3l9k79jtxraDs9/AzKbb9jEDlWQi9+scIFq19JGDK1MU3B38bS6ddalLnkEna
	IvH5N/Ql6ooFN1FWnjaqy0s/jEM+x93wS4XsKgIxi9QFgzMaAUhdiKK9Y9OORUrY
	6pgY1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv29vh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:12:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4606f6f44so8917205ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778573579; x=1779178379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ik1ROdqwKoY1UFhbn043GWEcR0Mrm+/8Wii83OHMmqk=;
        b=HfSpTYjskwUVpN+PuGtTfn4lJZOQQzfybkGRytUcq0xQrcW/uauFjnYxnrP4AnBnlN
         /Q4I6NJF+zfds3z0fnc5XdXD+85jb2aTxw1asTsezzTEwGOkGAFC9RZbND/dO8BzctsW
         0pmAgs+J98ynO12U2TNnf92sxvfteOqsDydMT77htM/Dm7wQndfSWcTAyURLraUWN/X8
         aa5MC/DMpEW2SGYLO1W57JbPA9i5lwaDNpqrufBcv1qaE36OwT2HrVu4GowuG5oR+SCL
         Fz4fIJHnl45c7l5R/HxEkiVA32HlJGeUM8VlHe7jokeL4vad6YXKEcL4xYbZRt5OFufV
         EYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573579; x=1779178379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ik1ROdqwKoY1UFhbn043GWEcR0Mrm+/8Wii83OHMmqk=;
        b=I1aPAYW/nX1iK8fjHehAdbYyZQrmv6czaGgGrhl4oNVsCgqmbD9I4/AM7WY0BwM9H5
         1aTDVU2Ij8wRbFX2IUNQ9Yppc3G44pPqeJ6XcbbPnEgJZtViZ3THlYHxw99kWtDHr4i5
         YPNepW460lJl/PF5Bd6zPZOma3wAJgIxnaUeMZS7igAHW0WbXqNNAQGHD+Ht6DqiBsti
         I4aUfvqpr2kymohtEEbljaB2CZU0v3aWRfEbJqhb0kS8WLasdFm36FrhsYLnFLhX0Bj4
         LhGAu7u0xtmc2wl7mt0b//PzU7OTT6IQo29bUJXl8dnrvAJagqv+Sx6BGxCSPR1CNlJD
         kB7Q==
X-Gm-Message-State: AOJu0Yz/Z4qp9U6aZsWOGZQnaup8Aq7RFEaXlCZG5pglo6nmNg64H0XR
	bZVy7C/xA58ZFcEP1Xf7Q+iVFg3L0RaOzow5veuSVo6yqL1Hwi6+sl5FIUk5tGGuoMlPOPV90ze
	R8sZjon88mTMRF3uJHmkcxGWNApAS4oszTHsN/R56do9zfaumA/SorqBRnSHu7o1DsFPu
X-Gm-Gg: Acq92OFAAmFZWKbabEQ+CXOM+tji7XrdfLJ4li+FJl/hLIlvWx+rbLqzcDosmsnUxsX
	9+pQpb3vLOL9jDyfSGKc7Wsl/by7SqWMvLeqyu9/sq3WTXsHP97iweU5QZ+3D+iT1DYy1wFpe58
	EWPqM4kdaXauVespHFqqv/Iobb532109xB59T56xI1XK7/TYu8CRIoVn6Z6t5OZU6IK7vjlR4Nu
	n+ok3UchabWiqjVLnn2HjVBJLmjsFG41Ez93m5aVfhU0kbj18ehNcpDkDzKqzpkFMgXYXQGAWl+
	9LPpkIQiCoS1C2BqaWn7sBS6nVakUM3inmx75kG7/f1CLM+Z4ED7H9w0YCnkn/gI6QTExL6qgMD
	MZMwrAYyiHO/EtfXI90uZ5UX42zTGrRD506ykZZyUF02SD4f/2zw=
X-Received: by 2002:a17:903:3d05:b0:2ba:1744:773 with SMTP id d9443c01a7336-2ba7b275e59mr146694935ad.3.1778573578780;
        Tue, 12 May 2026 01:12:58 -0700 (PDT)
X-Received: by 2002:a17:903:3d05:b0:2ba:1744:773 with SMTP id d9443c01a7336-2ba7b275e59mr146694735ad.3.1778573578262;
        Tue, 12 May 2026 01:12:58 -0700 (PDT)
Received: from [10.92.198.185] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e66970sm127207065ad.56.2026.05.12.01.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:12:57 -0700 (PDT)
Message-ID: <86976303-5f10-4643-be98-54e338471619@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:42:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
 <4a41079d-4e3a-438c-9996-c756206c0c3a@kernel.org>
 <f759f97f-1231-48bf-8d2f-6c13ccc841e8@oss.qualcomm.com>
 <e7c9b78f-f6ce-4f17-88e1-ee8e6620fef6@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <e7c9b78f-f6ce-4f17-88e1-ee8e6620fef6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 057A-8LprGh53XzqugHr1WmLOKUP0J5k
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a02e10b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=egGItt_2NHUHVmhs1T4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 057A-8LprGh53XzqugHr1WmLOKUP0J5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4MSBTYWx0ZWRfX/pTIWTK7NVcp
 uaxZ1/W+C8+numyuYOBN6l8tPfB1k2U2ducrNYBw5Q/7bOT+9rr1cU562/OPw1NsgoKQ8va/Lks
 CU4EO4ufybU8OebKhgDVZ0aN/C8j+rLnpLYu5ri7WTS47z3ZI/C0zEx9CmCZqNMUNOHjakdIOTa
 fQBWjBpBzuPannF+6YvguKmr1YqLGB47iPWXmlbshGdO9MwqerVTTJALM6g5+RghCPssUZG0Jo3
 TVEzOSTBy3WE70f6ntqRRp0b45uef3d6lgtyehzELIQ6suG+0UjEV5osUybLMoQlsurLgKs5piv
 DiLeMCU/4UVxaoRkREe59170dd0Ud21+ivK94fq7AvXbLE/opIbpNKqbOm00ayWhSsJwHwSM25M
 lNQ1RHa+s1w1PO13jOSsXVJniIFOOSGO+lhtV7ClOx2HwhuF3nhaN6P62kIB/KEvkyNEJrOp94N
 CzV9PFSR/rHrDTBQZTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120081
X-Rspamd-Queue-Id: 84E5B51C875
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-107052-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/6/2026 2:48 PM, Konrad Dybcio wrote:
> On 5/5/26 3:53 PM, Umang Chheda wrote:
>> Hello Krzysztof,
>>
>> On 5/5/2026 1:49 AM, Krzysztof Kozlowski wrote:
>>> On 04/05/2026 14:57, Konrad Dybcio wrote:
>>>> On 4/27/26 7:05 PM, Umang Chheda wrote:
>>>>> The monaco-ac EVK is a new board variant which shares the majority of
>>>>> its hardware description with the existing monaco-evk board.
>>>>>
>>>>> In preparation for adding this variant, extract the common hardware
>>>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>>>>> include file, and update monaco-evk.dts to include it and keep only
>>>>> board-specific overrides.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> The patch is a bit difficult to view as-is, but the gist of it is that
>>>> the resulting monaco-evk.dts is:
>>>
>>> Diff should be fixed and since this is not even b4, than producing
>>> proper patch detecting rename is trivial. :/
>>
>> I acknowledge it's hard to review the patch this way.
>>
>> I’ll rework the patch to use a proper rename (git mv) and keep the
>> follow-up changes minimal, so the diff cleanly shows the extraction into
>> monaco-evk-common.dtsi.
> 
> Try adding this hunk to your gitconfig:
> 
> [diff]
>         renameLimit = 999999
>         algorithm = histogram # or patience
>         renames = copies


Thanks Konrad for the inputs, will add this and re-send the patch.

> 
> 
> Konrad


