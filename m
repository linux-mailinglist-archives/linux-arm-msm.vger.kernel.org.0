Return-Path: <linux-arm-msm+bounces-90778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AFyJyu+eGn6sgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:31:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F285694ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEB7A3027B43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C6F357A30;
	Tue, 27 Jan 2026 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Imolsp0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NegDG6PT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F331EA7CC
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520556; cv=none; b=UfwH76xGQEG1Q5VklnXtI5pFdnMlil3/ooHb/SNdOQDI+bANzeokmpK/+AOeR2p7nadkA44mm9rBe0LsLaaw7pS0BmJeyhYtCgl17p1SYs8D62NkTcw9/CjZwb9/QEVdxVehrxOoUwPKXJVfx7he5U1CYDGku/YX3rzUsm/2IsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520556; c=relaxed/simple;
	bh=QGIJZ8FaZRMVdxqfBGe5GcHGD9EL/ZFCUvpscTH1TzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tez0XBiRqI6FSTL/mIVatmDUp3qT4DrRh3A7HNVhS7K40ANsldEHlOGjGygSPlr0bDoxzqc80Byt12DtACd0FxxC3vi6p/edHjEPTJMzc9nZ+8G+ns9xf/kTmrFj7PmKb4AV/65UGcr0G5tFCKbUsigUA9mtUcz56NpCXYREc7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Imolsp0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NegDG6PT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA0FoJ3857785
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OcOcQASf3eCmjJT1kaXQ5vCkOujdJRRo/eHqa3XUUA=; b=Imolsp0Ce4eECuRR
	zZxrtdoMVDUmWm2Qx5GgaBtpZH8XMlgX74pqCPxOO5dufD8csps6lYfvek+cQPJe
	O2Vedsw/w0D7rG6a7ovQG0IXvpxoyxOw/UW5ZLkywahFq+OZk4CdD2sOOx6Yz3Jk
	Ao8qcGbeN9hCWts7eSXwpriBRYM29JHDpOvn11/xsNIid3H1tXVkhyS8DRBbeoUh
	Jx7UhwjmAKeOIPUrRVN3zdRW3X2pA1pgyXCd38pM3qOhnS3nzcaF8gkwQ+7OCnuu
	YO9M9DEgpsq+tM52ebFLdJsl3F5NV420b7d/XbuFUikyjP2fPARp0NsbC5RfG9UJ
	5LBKjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs2tc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:29:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c710279d57so5427185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769520553; x=1770125353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OcOcQASf3eCmjJT1kaXQ5vCkOujdJRRo/eHqa3XUUA=;
        b=NegDG6PTKV8bn3ikXB9MStTli4YsYLCeeBkU63p3kW2PNeIAEDwWZOeGZU1qzSGi9u
         44nzPnwJxnNc7I/7RcVlEuQz9DwvoHkUxHY9bE2kVtltk3z4tz8OzJTKn5JhDDvDY2/v
         EKkRC4k/V5yc/SVMZieoo2qtyAX1d/cV6qePJwbuVBxCS3mt0v6joxRr7mTsynOdCkrp
         jUC9uHHGYTgZgqEVOnb6YaGsN4uEJxkKK7tKKfRCgVIjAKt8kgPkXKCa8hdSedgYtTBQ
         9tb2YPCRiM0262zdjhntSFGTii5bqpMUCswnZhhHWUh3nV6Jb/OGoXFNdCn4fKRMd5y4
         muBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520553; x=1770125353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OcOcQASf3eCmjJT1kaXQ5vCkOujdJRRo/eHqa3XUUA=;
        b=hTlEUw49IRy6BmFIbeN5mvPP48RAAKjRcyu3F0hRwZXbQ+IVff08yh62GDpTH5LNwm
         f0ryTxk/f6gO2NkAczF8HzpvZnttD5H3k/yLTLTh6oRbuGtX2lIj3feRWPKo6nLvz4cE
         KFmp1gsJEp3d9TEB1xXmzI7zFa3wkPI/trGDfYtCdXIGlqiJqOuYADgzCtPMHjbgVEEF
         2zUsTiarsEJDR6QsoQCDXwVD62bzAbGagtnutgBIGWmezl8uJUcaRmIKQBjsz//5K0Km
         mD1wB2wTdUbmxKPgcU86rRvK+085GKDB9nMPoB2mT/J76Y2H6FRqqqPe6qg0DltsxrHW
         b9Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVND1Dn1IpV72wvhgtAoUPl0UuxiKFNoHlk7JvCk/h4k/rUE+SkJQvofq3hwBQwhj2NVEyXJwLMxGBGjSPz@vger.kernel.org
X-Gm-Message-State: AOJu0YyTRmZ4Jj9HFs24BP1/9Rv869z9XJSHVqpd69GqU2lG22BT3pm8
	YdPyw/qr28TyTwAgujNkktd5XmWgTeE0JoqJB7jyfT9WvR4/+/6XLW80rw92zZxBY9Vo0HX0tlE
	Qpr2qdiY7/Diy+nhPWtjaYtZxDn21CWDYNG98GvqsxSr/CE2LXqzzjiTlKSZ8R98pwdNT7g5QvY
	7a
X-Gm-Gg: AZuq6aIc4kzSf9TzsSyyuErDaI0rxICPrJ4w6Grj03A7HdSm7w1l51gTvnRyCSGIssq
	uVlTNJYR28hpwBORxuVLHUIhRJ0UxKWei3oYS1YtTiHNUSQllKPAMM3yIIQAKTtqTov96cn6qCZ
	+sCabSs/H4sYc+KkGdWJRub2SlOT8pQJVzGVXTRypeTRjzaAMub0KqdkETAE1lW6DVc1Meubhaq
	BKi3yH1Q+p4c7R3jvGMu72oOzGuzPPszciBUmcH1h2MiIcoVMlW7kCEezOn8iXBvrlAsV+3yXcm
	joA85J6tEXY5m4s/Ht3cVbFc6LX+QIyBi4DBtGYjRHrmBUHKgfCv1boug2HEw3hB/RVh8sTfWSJ
	F+UrVVoJoSf/S1ZLBvFb655FIriLkcTAhPiLgV9WIEMngpotePrl8iYlG4nZFRa6Skok=
X-Received: by 2002:a05:620a:3199:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c70b91afdemr130277985a.3.1769520553025;
        Tue, 27 Jan 2026 05:29:13 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c70b91afdemr130275785a.3.1769520552485;
        Tue, 27 Jan 2026 05:29:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8d89026200sm280740866b.14.2026.01.27.05.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:29:11 -0800 (PST)
Message-ID: <268fb237-36b2-4968-a099-bbddcad3c7dc@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:29:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
 <aXCXSt6_aTmoCnsh@FUE-ALEWI-WINX>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aXCXSt6_aTmoCnsh@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yMj2KtNz94f6o0WxTpW6DqZ8cJkqNYs7
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6978bda9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=n9fB6OXArN-EqZleIsEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yMj2KtNz94f6o0WxTpW6DqZ8cJkqNYs7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOSBTYWx0ZWRfXw2goqxiSwyQN
 8Nvih6sm7hvccKM8u+wp2ZPWAKBW2Tb7EOy11pw9+12vRQYAS+pN2WRtx+EfUGz6UUHbOIxjKzp
 CzKGoeB7bPiEYs96MRvUOC6FyogySXErxqJ5QyRwUSrJkrYoHWglwEvqR5cPRQO1b3INRJpy+rk
 z6mqWUd3+jInS4YDcV7QB28AOL82MH3t2QchKjgnsQ0Yf6kZARhLKnkqWEksjt+2s7zaYl8lNsm
 nMqdGSkeFPPg0wvdNJ/88+W6SsGcKUIzNhqkOHp0ggyahEVkld78aCycb1+YhIowNZDtYGfddx6
 JYgAi2xE1F8yvSJr0SHJ+rM3Hxz3syYjZAEY8tuVVHGlIbiyjGXi1PRo4gF9Flq82g6SjfV+97B
 CofxuYutVE7KcZ5WrxgvHjxS8emg8lf4F5En5fipAoBgRWuqKC+AGXQnaBfrfVDXOo2cjt+NDWT
 WkZ4o0cyfm7v65enJbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-90778-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F285694ECD
X-Rspamd-Action: no action

On 1/21/26 10:07 AM, Alexander Wilhelm wrote:
> On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
>> On 19/11/2025 11:40, Alexander Wilhelm wrote:
>>> Currently, the QMI interface only works on little endian systems due to how
>>> it encodes and decodes data. Most QMI related data structures are defined
>>> in CPU native order and do not use endian specific types.
>>>
>>> Add support for endian conversion of basic element types in the QMI
>>> encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
>>> ensure correct interpretation on big endian systems. These changes are
>>> required to allow QMI to operate correctly across architectures with
>>> different endianness.
>>> ---
>>
>> Hello,
>>
>> I recently (next-20260119) started receiving errors on Pixel 3:
>>
>> [   21.158943] ipa 1e40000.ipa: received modem running event
>> [   21.164616] qmi_encode: Invalid data length
>> [   21.168930] qcom_q6v5_pas remoteproc-adsp: failed to send subsystem event
>> [   21.175844] qmi_encode: Invalid data length
>> [   21.180494] qcom_q6v5_pas remoteproc-cdsp: failed to send subsystem event
>> [   21.187467] qmi_encode: Invalid data length
>> [   21.191772] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
>> event
>> [   21.199088] qmi_encode: Invalid data length
>> [   21.203360] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
>> event
>> [   21.210636] remoteproc remoteproc0: remote processor 4080000.remoteproc
>> is now up
>>
>> Since it's not well tested, I believe there could be problem with
>> configuration, but after reverting this series, no errors pop up.
>>
>> I would believe maybe these errors was previously hidden, but just to be
>> sure asking here.
> 
> Hi David,
> 
> This is exactly the problem I was afraid of. When the endianness fixes for
> `ath12k` were rejected, I implemented them in the QMI subsystem instead. I only
> tested this with `ath11k` and `ath12k` drivers, both on little-endian and
> big-endian platforms. However, other devices, such as your modem, also rely on
> QMI, but were not tested.
> 
> The difference now is that, instead of using memcpy, basic elements like `u8`,
> `u16`, `u32`, and `u64` are handled explicitly in separate switch-cases. This
> raises the question of what exactly the modem and its corresponding driver are
> doing at this point. Could you please tell me which repository you are working
> on? I could not find `next-20260119` in either the `ath` or the `stable`
> repositories.

next-foo comes from linux-next.git

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Konrad

