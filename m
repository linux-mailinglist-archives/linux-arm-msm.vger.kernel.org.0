Return-Path: <linux-arm-msm+bounces-90700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BGvXIz6UeGncrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:32:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0236492D72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68A013014655
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C402D341079;
	Tue, 27 Jan 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtyHl2Ew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFDcJpzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB2434106A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509947; cv=none; b=pxUxhOBfHj5xsA+APx9o5pqa15OhNV7OLxI7v8spzxWtQ7YNLQZ1PLt6fV/seuiqZ5xlpw+UUp5XoEmMm3/P+U/TBZs3daYpN0vHwTuIDO9uit2SJWwhv0n5Vv1qmfdn6UX0nmJH2WmDcx2JkiPqE025Oblu7C12fYuwNPygoFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509947; c=relaxed/simple;
	bh=qwyJU5OEksPKCmMqCF9hGD/eIHdz0/qHgr5yw1aSdOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBPJE+F6RPd87NuEMl56veMoojxujhj+w3IedFfbS6Cgt/rDzu8qc9FJ4Emfl4lm0lKjbgTs5Rf3dpwKnjk8ifKe0bHf7B3v3ITf4JuhqilIWCYQYAKGBOGAaSlVzozeDAnfeh5Ao0UPAcXDDZV6IhqpnQrWxZYiEQNUl1dqbbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtyHl2Ew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFDcJpzn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7RxGg112763
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vfcCrO11hLSQ7AmKAqjdnGN/XAneF5vhpmb7O0mZ9M=; b=dtyHl2EwYjnSGDY1
	op/tKu0f6EGKlGwMX2zTNgOpJN+h7S2fQ+dbx8V0D63kzEtWu2lw6b/Ur15voN2p
	fnR9iQRBpxtyJdBhp/yBH6jKrcQADNKb8Zzthnasim/1cOc/af9dZnQwcHCEGMzB
	ZA5Bq5QauM3GedKd49IuVwa6kO9hNb3O55I6eBKxYvfQPko3y2KCYvCetTwVWXvK
	Htc+HbtDyas8jhDN5pzDOxF0YefYXGF0zn7ZWMk7RKYIApVqfUcoAb+54OHfvmk7
	pRSqkQmi7adqrBPG/CWSRQuwac+Fk4yqM6iB0VAvFwKBURZVvifSDbDeL2eKJ0dI
	QQiL3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e0q18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:32:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so10683685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769509945; x=1770114745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vfcCrO11hLSQ7AmKAqjdnGN/XAneF5vhpmb7O0mZ9M=;
        b=WFDcJpznZPCRjRvK/joqoto8MxZpfo8OHc1zJs6lnajfieIKzS8bCVFlyED7n6dcPq
         no+J4DhcG5ddCyAPVJcK1Kw5DfJS5G4CGCphjA96yT2Dq0u+twyNP+OiQ9in9LY6u9W+
         hjoBQzKIblBpBVoaRCDMFXv12xH2ZLFrMxCf0InyAnjNel0xgt7LPjPsxQWP//DoQHOw
         +X1IgsEfDm++ORlxUFs8iq5K3N5rsO6uTMs5a+aeK95xcQm6mUd3dy9A3gebqqD413rI
         GkfM2IQpP4mwWXlrPds/4AWbnB30wTQEAIzs0lR5shRxcdv7fAj6dpP2fHb0o0phkcBu
         fMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509945; x=1770114745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vfcCrO11hLSQ7AmKAqjdnGN/XAneF5vhpmb7O0mZ9M=;
        b=QxTL0Cdld0GnIe/1Njfu3w1B1q7zyqDLrUaL9z6JW7vrjv/L6xeywDBLVfBXOXCXbh
         CGZQ0Z7NN3cF/0Xo8TRypcAniyqqn/MPa0A4m54/rWIgGueARRpMtsf3JyBNMyAfB9VC
         OMPMdyqpixkN4sJgz4aIqcitEe235oFbuUMwk8OZMOy3qIw/MvnRW0x6jLam2YJXOXIT
         5mL9s30fSdlJGci0w8Kvkokad0GXYKnZwNpArXR/pSNZ5alH14/rjIU82THShkR6v3nN
         w+WpHdaerux9HqlQrVYOyhR/GZRUAWwq33c0YgAG4G1I92Mfeeq1dSDrbEc3oXYkgh9P
         Gqzg==
X-Forwarded-Encrypted: i=1; AJvYcCU7olUyCrlcp8B3Na68lXZK7JHOnYh226V9d3K18YdmZDBO+pjOhWrbBpSNOmcas5Xf5oc6lGjEWyDC8YzP@vger.kernel.org
X-Gm-Message-State: AOJu0YwvD14eTDKT+60Jw98WSSfoPxv3ho0rMhEjiyRglp/0Z1i+6RbJ
	34RIumLQdvMS78M8idRdhonWqsXNYW3W1KlGoCIR8NCa5Q2p77UY3OvKJkDCBCjSpzhUnpPVtHS
	y+R/YQ0SXzfuaTCNRBLiHSWXJ1qgw7ZZ6rXBMSjh4+MSPbN3ZhixVgRqNCPuzM/aZJnlJ
X-Gm-Gg: AZuq6aIapl9zHvBRiIrlfROKiDxtkJr91wE/yU+TVwFnKwllrQTf+1KPI6cqsYJgljT
	2C+S+UQyZa5Pz0Ml3H1DzCD6lZBZbiI7EQNpNknXYewLoib+cY3GCjerF4hAzIy2blBRwdx6HmU
	yBGCYgOl9PPaLGx1V0B4OeNkhs6hlrb4jjh6/ucCZ3fvtSQuoFxURMTmWRYR1Lk6xeze/+BxD2S
	aFksrBy2r2841rXMHCsf5/jyuMS37AwXhveYH0IaYW2QRQkBrrjFVVl4PyOGiYT0yayS1ranAk3
	yzItAtQB/6JQierliUR8uHadrMLo5mcBoS6YaUUpqtFefYAbJFmPTSfTwgXB4Su4rsmQb3Tf9eF
	AxGrIQbDFl0Hy3XQAcBZHWitFmniE42vH8qTiA1uxt62epGzUbkzPfQBndA5380dtw5I=
X-Received: by 2002:a05:620a:3199:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c70b91afdemr91631885a.3.1769509944805;
        Tue, 27 Jan 2026 02:32:24 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c70b91afdemr91629685a.3.1769509944389;
        Tue, 27 Jan 2026 02:32:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6ff080sm742606766b.38.2026.01.27.02.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:32:23 -0800 (PST)
Message-ID: <18099460-bd1b-433f-b700-1cdac65273e8@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:32:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
 <f211054c-ecb7-4f90-b9ce-9fdd7710c8c4@oss.qualcomm.com>
 <c1efbad6-4ea6-4261-b7b0-7cb8081ecfb1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c1efbad6-4ea6-4261-b7b0-7cb8081ecfb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NSBTYWx0ZWRfX1u1QM7+lAjVb
 tdh/yVqev9HGAI755D1YsmYmQ0eSS5j+qWluFITSmXcvZzY2ozqjvk1ioQcIMa9Mg4q1/KbVi0h
 o6BXq5vjNpEylRLmse9vT13WzM+t+d/vEgVye6xsLwOF+tdKxnHN8AjXlF5RxJRdfQbBRbn2oWi
 OYVzcyrdv3PNVCNuOawu8WV1BSkDhEaPIBebsnBLi7iH71SLBrMKU7QHC2Fj1tq6SiM/s4SqjjY
 2kmcQkgTqgXncoxwaETKr39vGLS/ucMK4dKkUZacG9hmxYngy9/ytncOqqoENNUOkICzbRnfyo9
 0VjqrSHcIdWvskIWggu65MI1OJWEqprMCGProi+hnig4iKCBAdQJ6f8bNRo5PCnDR/YZSUOEjkE
 g8Mol/XKzIR2Kh9oM8UXkGb1PPnSW2mS0GifosKvxkYo7gPFsh5FfcgH7dVJBI8tTnuIT09WoU+
 OMoGmhCO+ScBCQEg8zQ==
X-Proofpoint-ORIG-GUID: oO3mMOpogFRM9eHDW6hyaXHmgbJR2VP7
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=69789439 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8YFCAo1tzF019N3mk9oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: oO3mMOpogFRM9eHDW6hyaXHmgbJR2VP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90700-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0236492D72
X-Rspamd-Action: no action

On 1/27/26 3:43 AM, Songwei Chai wrote:
> 
> 
> On 1/13/2026 7:15 PM, Konrad Dybcio wrote:
>> On 1/9/26 3:11 AM, Songwei Chai wrote:
>>> Add "select" node for each step to determine if another step is taken,
>>> trigger(s) are generated, counters/timers incremented/decremented, etc.
>>>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---

[...]

>>> +    select = devm_kzalloc(dev, select_size, GFP_KERNEL);
>>> +
>>> +    if (!select)
>>
>> stray \n
> Will improve this based on the comments above.
>>
>>> +        return -ENOMEM;
>>> +
>>> +    drvdata->value_table->condition_select = select;
>>
>> I don't see a need for an intemediate variable here
> 
> This was done intentionally, following the earlier suggestion in v9 to
> introduce named intermediate variables for better readability when dealing with allocations.
> 
> I’m happy to inline the allocation if you prefer the simpler form here.

I don't mind that much

Konrad

