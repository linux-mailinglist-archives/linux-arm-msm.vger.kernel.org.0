Return-Path: <linux-arm-msm+bounces-115925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eVp3A1xCRmoxNAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:50:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B75116F631F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:50:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hqgWTufH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RCefbAk+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115925-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115925-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7678130C2DEF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F02A35DA6E;
	Thu,  2 Jul 2026 10:04:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A7047DD51
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:04:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986659; cv=none; b=UzyccnXksJFsLtWVQNgI0oV866n9Oy8d6UrvR3pDinlGzoqg2MVN6qdc/E85nrFQq6jyG0zu9HRPJ3UsRo5DwlHk+o+hoHyzmgA58Yfp+kCeju5/B0UsawEyy7aE5VL0yvMPfFFrUChLOZDbyIxNUtl9sdKpzC9ayf+uFz60WgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986659; c=relaxed/simple;
	bh=kAbt5jy0AWfc7eQlFbvotBe1BjW17MNU19lTQumf09k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZ5yQiDXpI+3dGlCahLE+jdoRuGJSTnlVyK3yA88oHvLcZvLiEobvCthYKyOMALIFat5+BN2qFlm0sQeieJFV3iorL89ozDKR0mNRLbLHG3AabLFvqtcAWPQ45DpYHuRcM/JT1sP/NqY++4SUpt35JgYlHgVr7VEoOBPA7YZnh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqgWTufH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCefbAk+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628CbbV3050477
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/U9dWL01ogUm6KwlW/lYdtEi4/xfsMOfKBCZVVXfEA=; b=hqgWTufHZf4Ieb1K
	P2cJ09t0KNRmMxs1eaZbg5A6zyeOPRF/vmyBFu4XBJslakJNIXk2uJzvG5xNWcwZ
	u4OjoYa7E72UDykzvBn7aLTaex/vOYpdSwaaLAGcF+Lea84BMvwTTZf5XCxIYxLv
	GG6hDkMPDr3ztyC2sOQ0J3JaVzUKL9PCXWaBXpNOFDurAJBAc3jnWo3U8MgH3Np6
	FrHph15W3A+ocO2M48Txnb/Xhd5iPF5R3lqHqVY8pk+meOmSTbVLiTRpBjOwFog7
	Gj6y0X7AJ6QNOHxcIIK8uJ53V4NiQn+fQn3x3oJbDHG0xhLE6MYF73jYRVh4sP7+
	TNsypw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpuf8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:04:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so8156981cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986656; x=1783591456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/U9dWL01ogUm6KwlW/lYdtEi4/xfsMOfKBCZVVXfEA=;
        b=RCefbAk+wAB5Bh9T16yom+DzSgs0zFBjw1/5zneWrj7z+4jIr/nMJw4JBdoI652vM0
         zQMyXDakp7uz0jz0Mwsxea4DQkdV5ROwQzAxf2Jm7h/h8lsxAErW3qCoELBnDcWmTnNF
         R+OqdkY9SPK9ejFxQzYriPkqMR8P0EE5YWESao2FmJwNTT3IjivwxY+SBO/T6GrtFCEx
         9nv0L/9LPFz0jy4Q5rbhgiuqICa5706PmjGc3lPk30bLNc6zdUAFvFVKXys7JENtsN6N
         kDe8yvdUN8YWBGH7XurtzQKaIKaXl8ronLu5HY4ITGqlDJG3AkA0ofJeyZpBU9VVw0sA
         p6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986656; x=1783591456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/U9dWL01ogUm6KwlW/lYdtEi4/xfsMOfKBCZVVXfEA=;
        b=cdbCsjNZ8jT1INjMyNTxUB5sEbrJFDlcjC0NQYPzMWYR5uomJAy+wsGjPuVKxwpzUa
         ZFZp+PYz34cgZ4jln6pCqM5LBPQyXXjSN3KtNQJoI+hpntHihYyeOpjrjjyC5blvS42q
         Mf2v6NIDCWHVb8L7WXh30KZYTUqlVkUb2wAsKpqEkP3cjZQPe75ZNzVFCuH82WNbbqku
         LfRx1MUI3YyT5ov/5/EUwDEHNvKNKdxJl32zHQYHiDtjW/zYJDPvTl105laLcDShMynN
         Tf3qtrQz4yTsu8V/hoe3jIAUtW8hrdJoqtT5wI6eIb+L8Be6v/DgRLn3sTCWYtYbPqNu
         DPHA==
X-Forwarded-Encrypted: i=1; AFNElJ8M++lVX6pj7cHTLZxASmdS4D1tllbzUrrqYSQfNNYBZnn4Qq5Ssru+A3LtoLtgR+sf+/yJLJfLhrEgQP8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwVUqyNga/DKwIblV4OvIpDZZOvWDsUppIt0aOwzEc3DxUbngEL
	I9nY6L7Wib7OdGOT/i42msrTluzNGxkxaaiPiSTRTCn3IdtL2TaPdy+wK075WnAkQUuqfaFRxOm
	52wkOa2x2mXSJNEDyy1sGIoogrLWb8HsViuXSrBSypILpadzEm2Qgtkzh94CwH3MWDBPt
X-Gm-Gg: AfdE7ckyrnYFgpOUUvl2O47fkGL6jwUypZm11X8KKxQ3KFu4FlOpL5uXkGnfYO3q7+4
	HqHNoPPcoNh4NwS8Y+UpPG+pV9/2R7kgTz72AavpxYq2NityeJta5HYAroByUTFKSSOGIUa8No9
	tm64BXD/ZTAlr6+3QLjcfO+USnSox7gsujOR6ITwXz4+f1SKVasQuQ/VJPGABAjC/kIPhJvmjEE
	mLP6YR2qHmExLW+ulNxfX0NeHCkfRg1a/YLNdAabUPTGB2VMAG3LD95V0LIPFKYPBg/ea3Z3kHh
	nTQc8QMneQRGOA/ACX5Witg+nImlSpVjVt2b3VtzfjceBW6uzpJ/YjwleRiY9G0zkanyqvSwW7F
	qZZR2tXPUm2530W0AZ/JPTPXcLlaHmDO6K9E=
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr42484401cf.4.1782986656209;
        Thu, 02 Jul 2026 03:04:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr42484051cf.4.1782986655684;
        Thu, 02 Jul 2026 03:04:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4a72sm102517266b.43.2026.07.02.03.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:04:14 -0700 (PDT)
Message-ID: <82b28f9d-029a-4b5c-852c-7ae74b1ff83f@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:04:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] firmware: qcom: tzmem: guard against IS_ERR() in the
 cleanup handler
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com>
 <20260702081026.c7rzopcn7vypggjq@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702081026.c7rzopcn7vypggjq@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNCBTYWx0ZWRfX2lqDYOJ/nlo+
 btdwFVnqMTeRpAece5TUT0WAydcsTI3h3so08Ol/ZnHsuS5zgEkYJ9mnDztd30WfriLkHsdF3b9
 oswxf+IimvWRDfAEQ27GzN9AXt1QP+A=
X-Proofpoint-GUID: JiokJmU0XQxZA_fQXQdrUfaOwcHZTZKM
X-Proofpoint-ORIG-GUID: JiokJmU0XQxZA_fQXQdrUfaOwcHZTZKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNCBTYWx0ZWRfXxrVUhHStgeFY
 kzLCLrGWtgJXt7lZDpgV3TZxqcfW/9RfbC3wUJX2fL4yUxP82+T84OrYNelBsPMgL+3+nHZtvtC
 phApZXzbAjw6E7Mi/DJZvpBRH28kuNPYrJgbLkrMJjnZAKehcc/coijtRfAZ6FOW+92ziDzAKfi
 BB0El+vkQWCgpv7BmfBW4jHPI/zvPYwOmUGbT3jZ6Em/tkv7l98UJLiP7y1l1mxs42F5tg1fRcD
 FIwndHW3dPky1HRNldDyzcJyc6ooWU7XXYOJntN3XAAFzq/8F20wQTUg2hQpbvaxUYQMimiJU51
 eTd4cswRG2I7L409KzZ9h1AkzfIPVWV/BowdOmOkbEs6z+z/o+oN9QkGMLu/CSMk47ydvNcLUUA
 Nz43Rhl2r/kga2Rfej+8L3FzJ4gcRYtQ7yc7xi9biag4KAaxU/6thZ/ceDrMpnkopmTW7E4baea
 2lX7nnwOMjhWKRPTljA==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a4637a1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KwOIPtOmoVbsDEHMBlAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115925-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B75116F631F

On 7/2/26 10:10 AM, Mukesh Ojha wrote:
> On Wed, Jul 01, 2026 at 03:38:55PM +0200, Bartosz Golaszewski wrote:
>> We currently only silently skip NULL-pointers in the cleanup handler for
>> tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
>> value so skip it too.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
>> index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
>> --- a/include/linux/firmware/qcom/qcom_tzmem.h
>> +++ b/include/linux/firmware/qcom/qcom_tzmem.h
>> @@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
>>  void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
>>  void qcom_tzmem_free(void *ptr);
>>  
>> -DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
>> +DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
> 
> Is this really required? Are we trying to address an issue which
> does not exist today?

It doesn't, I was scratching my head too, but in patch 2 there's:

void *output_rt_tzm __free(qcom_tzmem) =
		__qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
					     input_rt_size, &size);

and __qcom_scm_pas_get_rsc_table() does throw ERR_PTRs

Konrad

