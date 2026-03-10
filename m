Return-Path: <linux-arm-msm+bounces-96655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOVWAYYnsGnOggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:15:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC252519B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7FA53414EA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03C03B9D90;
	Tue, 10 Mar 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5+iey4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcEquvSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33F323B63C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147884; cv=none; b=SXLwjBi+qK0GZgKzTBrsctU9LzvG3ibkSLQcShRmkJAbhHwuRITjCxyRIvFo5xrn1XIk9tJqKoEb+xDL5ZcIkS5pzH+XzrlDtVAgEBb5vyaB0ZjXdZey21kVLoVgGmrJu/Esvh/xjoOLRO14qfP3nBgC7QndnuC7VKp6vv0OZhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147884; c=relaxed/simple;
	bh=PqDEdtJr5rYsWHIKMkdODRmDFBiKW6a54M5VEG7hS5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9vn5NNEmbSKmapjnVGZrGvLSPVGCIoPldHG82vji3cM1CAB35WfIyDp8SUAP3ngLZczhR2d0y98p4WHN35+kmHBd/kFZiHKWM94baZIwAvGKPTP5LPQXQ0bihsjDE2Non2dUe/fQSWJcfADhL+iMQOjQZYYgd0NA9HrWyiM8h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5+iey4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcEquvSL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaSC8024063
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqDEdtJr5rYsWHIKMkdODRmDFBiKW6a54M5VEG7hS5I=; b=i5+iey4sqaTlfIf0
	s3jxouP6fCG/yWIcXY3qQ4NIID3wIziolCIv/5pMeJ+HGhwy6hGeqyNRJBOd0/bh
	+EMOd4MN+T9JdFb/8rX0xiAiqk8+bLwJzN3B3vUl0Nef7YiPQ5b/kaSPeG6lO3lR
	8AVTUrngZk7OyFVJnvJZGmRGetSObMETuJJuYUFeS1VzSIYz/e10J9zUffw1CYIu
	joUAmNtRqiyl6OK9DRmfha0XEBJ9LuFP1DmGlICTs3uVmeuRikfYeieC6WolomUA
	lfAN0TsQZpZfqVd4FBrSUm3gugI0GtsScu7pObSA589ycACjLULtynKEbkPwAMLc
	pTmYog==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngye6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:04:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffefe2d6e5so174763137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147882; x=1773752682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqDEdtJr5rYsWHIKMkdODRmDFBiKW6a54M5VEG7hS5I=;
        b=fcEquvSLgQODGNVmsSl9FyoMIiFftM7HFrtI0Sgix6xHon/qarBoiyw25+8Fw8L/Mo
         2aPjjs/o2uQR6a8OXqPhJEPsl1CjRUWLXkUZ4TPe8vSFkG8m3DzHl5UuNS1lM/rIGwAJ
         8qVkxV6e1GJzBYaTaI61lFJgkjdS/X6h3bRKZFAsgjLSPxPIcDKRaK8xJfiyFvBcEZ4c
         fUY1VHVVVBzaqtoKpk285auDmQNu9bcZ+SzHKOfcsjJlbY2V7eqAn+elCN7FOB2LoGf7
         nfiYTf2Bh74HVkG8Eu3P1VbYQuhpE1LEdeV1ffRQjEKDDhG34voNZ4LrtsboENxqndSV
         GhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147882; x=1773752682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqDEdtJr5rYsWHIKMkdODRmDFBiKW6a54M5VEG7hS5I=;
        b=h37tBlbQgZYxd0ChTV6r1mHlw29Kh850/lZQyKRAfL8m0OOLj8RYdWAfdrBpkceYgI
         a9/7Hn4tDNObavb7UJMwjnQR0O4MZ9zHy5Um7ws7FUl0RGUlLz4TQ28cG2BcCvrTgrzK
         LZ50C0SYZrL7q5QEpZLZ/gYyl6D8/4vVw6np2e/gvKQYm2EyfxLLsJV1i7JOD/E7UV0Q
         MMusgZOrWDIbjAcS+X7BvAzIHiV2d+brUpiJpWDV/a/rBHoah+QFsAAsYh05T2GCGR6q
         cA4VMnAVPGlxYyJMMrT/hgQi72RqtbuEsy4vln8lIgzl7KQVU+3OcJ8QB8Yf/atF7+Cb
         zE+w==
X-Forwarded-Encrypted: i=1; AJvYcCVQS/jufygL8QWQu8GDDj+RXB4d/vM3WBk4NnGRdY25QMoc+5ANfJTwOzpxBBe/7IMwva0KzmN56WGKqPpD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh1qM6HssanvN9r1gVDDTJ4agqAp10vIYA0AkCwJAhZURdY07d
	2Itq2csgdRzqPSMXiIZh1KEv7XPZqdy04eMFQoR0/mTmKVhtL5pPxNWHVCpdx9/lkobbCXIWytf
	asuDuyueAJZnU029zgtc9tIM9jOe3jLsuP5kk06OB3kdW9N+M3lMyRgpJcGPIuKUzmWSy
X-Gm-Gg: ATEYQzz+LWeflHeEpOw25smurFdll3j2xAJw5xelRADckrYD7WasJ4AmuX1zNjMpqDl
	V6TUpKju+vG8rkjz4zmpuTtkHQLekbCasavY9MabiVV5X+1+jGbrNWedt2zRVp1yY9gk6/eP/Wx
	3eePYh+pMtrSXifqlBtUZeZYDpKWRc4xufQ5yTkL1NoAOCKe4wT7yXnVQ75F01/TL7VciGANNYZ
	dNxBJU3yUiQvKTQcEPmhNIoyUEuqmtDoLsIr+FtdKXbPpfMwYkDZD0XFCPPnAjZ+EvzeWHy6UOc
	fY/4Ud1eCu/SklzWweF5ZPPir8vOABpmbyqm+h3rCfFlIe4Vue/nDwfjTMXC8CXLbn3jOnKYZiU
	RUeVJ8OysEcbAWcjh9DS9/tBMVo75cZoxiZdcOFBNalqvPrNbL9u8ddjzWDgSR/e770Ut4zcM76
	feJBI=
X-Received: by 2002:a05:6102:c8f:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-5ffe6125078mr2738595137.3.1773147882068;
        Tue, 10 Mar 2026 06:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:c8f:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-5ffe6125078mr2738573137.3.1773147881617;
        Tue, 10 Mar 2026 06:04:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629f7cbc78sm1437909a12.17.2026.03.10.06.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:04:40 -0700 (PDT)
Message-ID: <2255b753-4d40-4e49-a89c-22ee939c51d1@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:04:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
 <fabedbb450f409aa0aa415151de0263b@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fabedbb450f409aa0aa415151de0263b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ohftRQ_U7-ySjZdWsVm5_Y4CxMUEu5eL
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b016ea cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OuZLqq7tAAAA:8 a=xHgDL4wFP_-0hZMmzhMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=-aSRE8QhW-JAV6biHavz:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: ohftRQ_U7-ySjZdWsVm5_Y4CxMUEu5eL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfXy+0Q3A/Ixczk
 9VHTOoyckM2hIx/12Jvq2/9bpnAeQOHhJtTo6juw3IlkRF36tQwMliqCOmJ91mJdUE+5FhjiWBK
 igNzcIQXtQEuje68fcLhjqWAb83+uXyrQTNPtdbvqEg/CJihfPX8F5xesBXbuYLvw96iU6rJNyv
 aNvTzGhRIwAiSO92oNOF7KjUspqcbJAZw1JxBXDGkuyKbnDxVICP1w2eeSq7H32g6j2i9RveVY+
 B6exQvrXROrxc2HJD1OYlrkzNUWqLYKUS+oJzAF0JMrrZpyj8SaJGQ/SYAyOFliqDDL6aYbpoIP
 tEG6f+glo+a+QLHWn3ZDKELV5aT+ZRFSERxtt89+eL+B6L45+bWIn1qs7ETT7gxGIOEJwRMYzPx
 u7uEKLkskFsxjeRnPWNcVotIUUUBrUuLbh8IrkGVe0D/bfEh7Zv5aXbY76HWp/AZXIzE/4Pal1M
 QLZBpCFPcdI7bnF3Hcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: 7AC252519B2
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96655-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 1:57 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-09 13:55, Konrad Dybcio wrote:
>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
>>> it can be commonized for avoid unnecessary code duplications.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> Could you please try adding the following to your gitconfig:
>>
>> [diff]
>>         renameLimit = 999999
>>         algorithm = histogram # or 'copies'
>>         renames = copies
>>
>> and see if this generates a shorter diff?
>>
>> Konrad
> One more question should i rename msm8917-xiaomi-riva-common to msm8917-wingtech-common,
> they are wingtech devices. Which naming is preferred?

I think xiaomi-riva is easier for people to associate with a phone
they may have in their drawer than wingtech-s88503

Konrad

