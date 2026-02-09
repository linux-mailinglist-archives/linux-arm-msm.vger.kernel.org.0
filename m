Return-Path: <linux-arm-msm+bounces-92254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIRQFEa5iWlDBQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 11:39:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE410E34B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 11:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8502B3012BC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 10:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2AF367F52;
	Mon,  9 Feb 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMvOJA4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvFZ0tmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C05366046
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633538; cv=none; b=GyHC4F6I8RqLDCqCQO0gzmdHsNtanZkd99Ui6g7cyzYYcCvd4fSTKLtUJCTje1fBa3Uj4eADjJUHSciKT7uZeDkr8puDB1eAHSNuOxKQUzFkZqki2nUlKphbDs58alQPlKl5owSzGaMy2mdhq+NoBD9f94pDRXX/51B8OJ3N2Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633538; c=relaxed/simple;
	bh=WV7G7YLQc3fiwa1FcpbZ0kEYjyv316x4KMY+89ux7VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQU5E17i+F7fNAvL68MbfDR4+uyvUxPcDK1hBriC1hSewa/HHuKrVliRXNp1IMviEgGkkMP6au0AP9WUL2szcUvJrKek/GS9odwZi59ey9C4+0JrYmLvlWqBNmZNTj5/7IvYicBnTHgeApUFPwJerRWL0bjIbfD+Z8sVABr/pAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMvOJA4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvFZ0tmV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195RxdQ3252134
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 10:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/jY10awzFduiO2n6GU3gHMcX31zAUtdN1QN5r7hFGo=; b=eMvOJA4rCNPHRIDw
	oz5UtpPbE1bMhDoVmSoBIP0/0aTMpbhxWNvXgyu4twf1uAmR2huBEkzst41Vn4ot
	rRNernD1MRgBgGwYUo829+MK8j92xLtbc/4fjp9uel5OPS2x6Q2uVCYqUF7fOgqs
	fDvir8zEbXsUtVnglLeszjnsTxS6qLFYtOoXDjYQoRtRtxlTEMEBTjdLSLzxis6q
	rv1DcKkAtUisWzlyKvXGLX23yqNnZPtVeghwlzS2te9Gj2bkQngyUejdMdX32iuX
	t7s0Y6mDvenAOtQdX0xJGMW4OH0vS97Dmh6Y7ndJ1ydq3eOmkySpwH5yT/t2TbU0
	NLsCoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f692e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 10:38:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb054b2f9eso138392085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 02:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770633536; x=1771238336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/jY10awzFduiO2n6GU3gHMcX31zAUtdN1QN5r7hFGo=;
        b=cvFZ0tmVftzi+omRIOmRSOWOQW56ckmWlSFJRHVA1AykzVyodNr2yJhTtjxVScHpjM
         f18+M4F1Fody5rOYW2jbkyBvMlK1BmBEhLMZ4Aw+gyxhcZGtOc4zk0zfzRB7JUJd+1mI
         F2Tb9YX5Gvuip/5Pa60wTnrK3vEUhSt/fLBVmBNXF7EtY/cZh9YcjYmjsUFl0nwPEGHe
         Yh1Ckh070m/rbEr/yE8IytmpIR3KsZdj37DHubkllV6NFekzg9Uo8+bGSWGWbr7EoWOY
         zI4xGfhgPvnqOjxJ3zT1O3Iv/zbiH4f66LRPEuzRsWX/ve2WydvEZR20Cdt+sDNUzQQ8
         2nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633536; x=1771238336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/jY10awzFduiO2n6GU3gHMcX31zAUtdN1QN5r7hFGo=;
        b=NtxyW6p8C1KpVzPdyCDWHPvK8rY/wqzuH0aw2PZDF1/xoRJdFcCrrHHUVhyHT1WjNN
         gOsSs0whky66C04RpJaGgZwPLwzKIduUWdoO/oAd3InEvLlJqjbm2H79VP7ObWBFRCFo
         +j+HL++I3I8aN48gaYQPb3kBPvnlXqcg+zk2MqFvoXD5oiYWHWD+/M9Wl54qUH7amjqG
         ZCOx2+3H8omvXO8SKPO2z96KKcK0n5FdX84/75pBKOI2tt5mS6OEf7TvayPE4Usgmim1
         odP1DN42y/xokVNI0hBjXw3sOLzCscjlGIH3Ve9vS2b4qsaV5DJV0mC0vWeLiCOW0PhY
         yPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIS0eGESfTIWOPvxYs2h/mOUeBNsYNuSD7QN5Y5sQb+aledQY2Rrso0rGKk1nR216PNtsS6q7COEou2IRt@vger.kernel.org
X-Gm-Message-State: AOJu0YwniKVDK64cfy1/BIWTp73DSVn/kCwAAHq+60f2RRGiPg0y6ZzK
	SyG8/PHB+JxSiqrG0jdDIpDfpo6Uc651gOPRtRv77twgDp3ZhPKoJdCABDW5zhc/4mOQOYqIpg2
	xGYmZhxXsWBXEXFNha08qz2su0KJYQy0FcwPVSOiFpVW/++8DFirpMEFTBmrzcImnlyx6
X-Gm-Gg: AZuq6aJ97Vsb7Ku0yVCJi/GVRr6q+L5CBTGz8dvXQj+sej77lZFTZkXkdWt5/l3B8CQ
	WukC6q9XMxdtC9G5Kcpc3E540/HbuEw+UBNwlFF0TMazEVLm04Hmjadf2Fv9N/GmHd7q+GM1fls
	4DNQ5+q2/voz93+Y7i4xx/63ip7vaz8zEYUb7QBkWIWyb6zLrQWe5l6oXwCaSLA6UdKZrECjvJg
	ouFFu99aKtu7bd4GFzmsMi6lSFZSvvhs866XuR5Pu2fFyI7B73sgnct1RUWROYY5glkfJ7QyDJ/
	7hcq0beVM7c9O9xnwM0CAlSVV4d5vITZ+mksnbCTtDtgY3DfTO4oKa5pIjeC2BRmHRPd51XRVsR
	OOl1H649LCLJTP3ycVfWtxsM7RSOQaCiRCm3nEN/VeQFZcB2j9gX95vQvW05t0Hca5q0=
X-Received: by 2002:a05:620a:2906:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8caeeb5115fmr1171646485a.2.1770633536090;
        Mon, 09 Feb 2026 02:38:56 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8caeeb5115fmr1171644885a.2.1770633535630;
        Mon, 09 Feb 2026 02:38:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae39441sm369817166b.59.2026.02.09.02.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 02:38:55 -0800 (PST)
Message-ID: <2b86a7d4-7211-4154-a673-edc20d8c048b@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 11:38:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: property: Create devlink between PCI Host bridge and
 Root Port suppliers
To: Saravana Kannan <saravanak@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, andersson@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        qiang.yu@oss.qualcomm.com
References: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
 <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com>
 <lnzmgsdjckbf6u5hxfqm4kzlmcg2cqvszcg7otmkqxaj3yzdfq@vu232xx5kts3>
 <CACRMN=eu7n+wCD3vRY-7GSKpqf3VG=oyDoQdeauiEHGK-q9pPg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACRMN=eu7n+wCD3vRY-7GSKpqf3VG=oyDoQdeauiEHGK-q9pPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EeVkre10XAlEmP9HHSpj2JEogRHeMNrK
X-Proofpoint-ORIG-GUID: EeVkre10XAlEmP9HHSpj2JEogRHeMNrK
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=6989b941 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=yl5-YIiGnJ5uwGII9rQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4OSBTYWx0ZWRfX5Ap2ugFFf9Mb
 Zp/UN25cxVBfn0pluzCpQtZSEKdZFU4mnqh/yY1YN5SezBC5ZyjHmkVto5YrWPMOJ4sFM72XNsP
 JdwFXcwj2PQTcyOwigosBrnTZRrB6CUv0y2Rp3O3SRnJr5gzp27/+85g3VDEpDwj4p39kTeapmc
 GW1pduSRAzRjkWBqF8jmGIhsKZpaxYDLMOZJuDm/ZfAay10Cskqa3wS78dcgLAnDFSN59kZyBjW
 UKNMFEBE6t8J6vKflzIJ/F6w5UeJvIkoSklpTeTv8g9QBU8ObJ7vi1iUi7oMQ0xInYExhsgrGoQ
 pFyYMmngQGuS+IYpdwFvmxFwhTmjz2eTk2IByJSl31isTysFVZowxRZ7KHn+/9lSoY97bhIBCkc
 dCGKSjCzlDGpofftMTq0k4atr3XZ/rHmQigSkjEWlZYqhJ/2TGS5uQjnKWVR8gjv1kvYU0QB66V
 lCDtwf/jJGBCU2dRGOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92254-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4EE410E34B
X-Rspamd-Action: no action

On 2/8/26 2:27 AM, Saravana Kannan wrote:
> On Thu, Feb 5, 2026 at 1:01 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@oss.qualcomm.com> wrote:
>>
>> On Thu, Feb 05, 2026 at 09:50:20AM +0100, Konrad Dybcio wrote:
>>> On 2/5/26 8:06 AM, Manivannan Sadhasivam wrote:
>>>> In the recent times, devicetree started to represent the PCI Host bridge
>>>> supplies like PHY in the Root Port nodes as seen in commit 38fcbfbd4207
>>>> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
>>>> the Host bridge drivers still need to control these supplies as a part of
>>>> their controller initialization/deinitialization sequence.
>>>>
>>>> So the Host bridge drivers end up parsing the Root Port supplies in their
>>>> probe() and controlled them. A downside to this approach is that the
>>>> devlink dependency between the suppliers and Host bridge is completely
>>>> broken. Due to this, the driver core probes the Host bridge drivers even if
>>>> the suppliers are not ready, causing probe deferrals and setup teardowns in
>>>> probe().
>>>>
>>>> These probe deferrals sometime happen over 1000 times (as reported in Qcom
>>>> Glymur platform) leading to a waste of CPU resources and increase in boot
>>>> time. So to fix these unnecessary deferrals, create devlink between the
>>>> Host bridge and Root Port suppliers in of_fwnode_add_links(). This will
>>>> allow the driver core to probe the Host bridge drivers only when all Root
>>>> Port suppliers are available.
>>>>
>>>> Reported-by: Bjorn Andersson <andersson@kernel.org>
>>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>> ---
>>>
> 
> 100% NACK to this patch. You are touching a core part of the
> fw_devlink code to fix it for one specific case. This is not the place
> to special case for a property or a framework.

I think the issue runs deeper. There are multiple cases where an
OF node has children which represents sub-blocks of a hw block, and
those may house e.g. a phy reference within. I'm not sure the code can
handle this today.

Konrad

