Return-Path: <linux-arm-msm+bounces-118732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FxJNAn2/VGp0qgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:35:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB1749E02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:35:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XiZnhiXp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CbSGZRW4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118732-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118732-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F65C3003EE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628DE37756F;
	Mon, 13 Jul 2026 10:34:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCA53368AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:34:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938881; cv=none; b=vAVJeO9zwNJ2j71TGAH7G7yQ8+Ei7f6ZOvWnVO5HDQTc3xXC7vURevVxb+RRrTIROzVwneM31q486EeQXZGqWZrpjYS0ThObvbelFC657GYOh5T1Q3QqrLcMeMNIgFm/TxD5ACOkW068VOvsWCTeRNtggO7AClhJG4LoDmkyFQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938881; c=relaxed/simple;
	bh=a2ns7VJ1cGEf33swZ803LYzM4m/USCko3oPVUeKJ0KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mJjETlXcgTQk6vx9ohoRXN03uj8pvPJ2Kk40KeJA9GJ26rswX4JuNqQ6WlPqzPsDpRPfgVatfIF05aBZqAOIdNofrrgxQescV1B7H7/IHfqO8v988Df8tLIrJmvYqLft5hdJeFJ25+jbIGvtJOnlSMOPW4j0wXrpY87arIPbeKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XiZnhiXp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CbSGZRW4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkOQ668646
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FQsviU3LabeSh9mHc1aSHq4d7ML6OgJAdel+fkcW8g=; b=XiZnhiXpEI/1l03R
	1m0V7lE2x3Wnf+rGk2dtXKwrqGE4oPK5GJOdu0bO8t+7X/7h/9vIafx1agA92lvc
	U/WKNNZTFCMruVa62RnpxQLfl7TtwfiKPoL/LLgUggJ9rZgXsDkcNcG8soH95J7o
	K0b0Wjs6Yt0EYt0lksu5VeDG3jKgM19E9X0vJahuvZexwSgJEnyf7YZb04DcKxiU
	MiEew2aJ2LAVT2Da0gZg98cLp6LePtnP6/U4jPVxovvH+4oOyPON6N2hmCG4TGB1
	Oknq9JPU2UJeftVqiDD2MNeKj9IUB1VPoSBB5LwLW7ig/kR6Q+eeUJY4F3Jk/n0a
	wteJgg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm23t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:34:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so9520521cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938878; x=1784543678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2FQsviU3LabeSh9mHc1aSHq4d7ML6OgJAdel+fkcW8g=;
        b=CbSGZRW4DhinwWn/iCQo0+Fv9rCeo1/Abnm1LfzbRlcFKySfbkcCmsPUp+rmiJpPxr
         mzZ58m610JV8xUbJZzKR4S+kWK2z26rXM1cpweTMERmPGNK6IsZjvlWB8JLAwhA3FH/3
         H7GBPq8YVocjDhTd2zLgrUfh2lhKncLsO53coL0SgFTWD8w+dr6eB9gYDDjE7Sdsk2iz
         zT420jYlxg6A7zglHtxdvH7PhH/dTskGzTi6zZevtf1ykOKsVZZJYhBjN+0xQklE63Ab
         xmi4mFPTe8Cvn5DYJ/dLOa25R9f8ZTGOs9RHh0epcuvNK6iDbCXd5atQGEJI0ZhOltt4
         gtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938878; x=1784543678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FQsviU3LabeSh9mHc1aSHq4d7ML6OgJAdel+fkcW8g=;
        b=RWsrHW7KxhA67D2y64qcVkEeaP2mJX3ukoHXqabggANgwsjfTPE5T/mwB1IcIOsY3y
         Wd7fqNNV4V6LLQ4FohN5Oz/tpiysbgRDutTnUyYSu5XxXGNP+tw5muiZO8SYNhxVlX8c
         QtsMis1gl1r3YT4lLmo0KAOqXM5lr3/Ls6tcZZvxm/ut2RloAYfQlbQ+IrPaW8+PYuC1
         gmSeqPeL/0FYmw1Z36ePhzmzAg9+jPn6RFzrrgIc3U2/z2YgB/nWzPUNqJr4stzgdIKY
         i6exx1rae8m/XKcM+jQKn+w26neIdZOKCii9MCcqsd3dsz8Cm7ZpmDTcQ2ClNnmPLHRM
         Ux+w==
X-Forwarded-Encrypted: i=1; AHgh+Rp5mkfLA7CNN8iNIB8jW/8Z+xt1p32Vdy3QAi0e2Zm6N9Z+eUqU4CYg/N3cuq293xjs4VhzoZDWkfiKsJww@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yGf8zkgBwoNfUpAHidYEG67ZoxoGoiBVbzdmG/2TLAHUR/LJ
	yON0dbIt7WKenmHuNXe+JxXEg3d5Tjb7TQ3b9VjTbCH7nMG/W9qXh5o/r5TioegCaoM09tlXfrx
	YxNg13NceVcWEXpFnOVXlibBOH18XaDLK1QQTiGJ3ZqFsHis810h7FI+bxXgXEL3QUzSI
X-Gm-Gg: AfdE7cm/QyJ7tm/uLfyfPqq0/WGJyTbniwistGvEFYlC3qkuxxxjdH9rm6kftRQfZGU
	j31Tx7ufXGRcDScnNMKqyoIikrzOOL6fazGSWwU30CnVIQF/30MoTyvPQDFku6eP9Hxoxtw0UsI
	qtlnRxygJ2Zq5JgO/pM9eI6xhNL33dneAWUt6mY4w6mNAdxw1swR6VuKfrNqb1cYgotcbZux/WO
	EVAHrmViFf42hHiu5BBz8ovQrJxzMP4YETc1UXFbiVdzOpKSbz9s1eVs5p4q3lPkdmCjQoDp8Ps
	hEnL8kdVd5Zh19ser4zbj4GHCPvV4DHsuHoo6YObADIU6eXl0iVKrJmCxParOBvjpOqT1p0QKoC
	CudoTdr20O/pO0TBCl20z0QmoJRfS3Rv7g0o=
X-Received: by 2002:a05:622a:43:b0:50e:6311:7380 with SMTP id d75a77b69052e-51cbf2157c5mr75175701cf.6.1783938878550;
        Mon, 13 Jul 2026 03:34:38 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:50e:6311:7380 with SMTP id d75a77b69052e-51cbf2157c5mr75175131cf.6.1783938877229;
        Mon, 13 Jul 2026 03:34:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd89b1sm14741341a12.1.2026.07.13.03.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:34:35 -0700 (PDT)
Message-ID: <bb9c1c2c-a09d-402f-9b57-feaad8e4d2b2@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:34:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Use devm_pm_runtime_enable() for PM
 management
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713064130.1681130-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713064130.1681130-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kZao4Po0BEXpvnPYPASIZUskD1JhEKxs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX9SxzvzlK4tAk
 YF0M4aagT6zd3o0oqK3yMGdO4n+/PQdhbziMEqVG9fhMJFDDekh334D7EVG9zJwtIE2q0JojMsh
 J9DqO6AnPiVB0yXggf4EklNRbaVjpKb85PLB6mk/GtngZ3NitzLVPt3W0JsYcV47ipaRagsWQso
 v9HmgOsuo72wrlOuR3OZD9/lsfROBfpkaf3cX+gg9E6gkwi3eLvs5aw1PW1dc9FB7RUXNwAARHz
 Xd0S3QZjV0L59cxi00407/vUCtBtXZGFNMDo4S5ZkT8gpRVdg6AG7sVMpbv3z5wEhvLK/UhM5KD
 bvrOtNVSrQ4fO45TIceAzWprCK698+0yPCtLmb9ovPX7EIf6USfP8t3ASVZPduSvhRTPtPB2xhr
 4AG1PelyvIcBMjrCPGM5bTkeLxVXSdmkRAZalawtFMMN6/dPr6pkKHXlZYPGJUxYejym6ArJfMI
 wLi/bYc/lsJyHq6IKbQ==
X-Proofpoint-GUID: kZao4Po0BEXpvnPYPASIZUskD1JhEKxs
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54bf3f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jculsIPVV0WIAI6NCkAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX4sQiJ1lLsFhF
 L2Fy2VHSL/cRU6imBAveu4HR/RBbCusYceCiChDCNdzqhh74yb//z+DGR1Sp/Dm0HUkX5Rp8q0k
 0qKhnN07AF46il1Jjm11srpaYJzVUGw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118732-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43AB1749E02

On 7/13/26 8:41 AM, Mukesh Kumar Savaliya wrote:
> The current implementation manually calls pm_runtime_enable() in probe()
> and pm_runtime_disable() in remove() and error paths. This pattern is
> error-prone and requires careful cleanup in all failure paths. Using the
> devres-managed variant eliminates this complexity.
> 
> Migrate from manual pm_runtime_enable()/pm_runtime_disable() calls to
> the devres-managed devm_pm_runtime_enable() API. This simplifies the
> driver by automatically handling runtime PM cleanup when the device is
> removed or probe fails. This helps  with Simplified error handling and
> Automatic cleanup.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

