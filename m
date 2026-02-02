Return-Path: <linux-arm-msm+bounces-91533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F3yD5POgGkuBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 17:19:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E914CED84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 17:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBE6B3013945
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 16:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A576928134C;
	Mon,  2 Feb 2026 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZh47mdO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIHNWExW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192EE273803
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 16:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049159; cv=none; b=Ul51bGPP1vGjMAw+13RHVAxoArkzZvzw+YurdMBFv+X2JebNtiYJtuL7+KbFdYdmFtIyUudiKyYeOv4c+kCSSYs/r0aUxyr+T2otxmfhpYdNjNWhVjryRzguuC+kDqyYgSXilPmDBx9t2thU/9StNWEGTJ+y7sT/IC1CcB2mqjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049159; c=relaxed/simple;
	bh=C/Jx8VXY0VB9NHAnNRCA/W5f6GCni4C30x/Thr4jUS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjXxLKnSEGuigCCyJj46UTFfquMnSzSSUCuyqn9F5CCog8ehKUCv23B9sEiZWBJ+lFYa1hVmP5PvIWKfwbJ34ltJtD5+vYGx1E70CDq0PDKXg+uzJgZ+OAbtlUD8ytRUnpLDeGzQ5owxZl3klUHc1X0VJ3fMRN5yDANIotmHZ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZh47mdO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIHNWExW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CJYmp2884449
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 16:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VFoIZ5tK1KlcsQdHdIdlIU8x9jGXAWlRaQS5aGhZ/7E=; b=mZh47mdOYR7hn6V0
	TRoNRKR/iOSV91pKHNmrV1zmd0YP9qgENjMoYuQCtvaZ5981OWZpVFBhRXssahHU
	JvjzkntKmKSuB7f9+DYHe9uhArE1tiMCimYUqbXXn9TzklQ59LFam/8hijUa7UqI
	fdsOLhsHX9dXBYqBUL+TZtOwnYB9gwjqZ6w4d2UJGK41CRxbB5b2yWo6LKU2GHXn
	d3eQMuOnrV2hlEJmEbrgXYdI8gECsHOURD513A1pvOzQJoHKTwY1DP9pAskbSl9N
	lum1FhX3R8p4Wg1PhxJYh5Nt/IdUIorbIRUfmMVQliOOubu/wrIqxmeZk7YhuAZB
	FNjWRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3gq87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 16:19:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a755a780caso38367885ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 08:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770049156; x=1770653956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFoIZ5tK1KlcsQdHdIdlIU8x9jGXAWlRaQS5aGhZ/7E=;
        b=dIHNWExWrbfqVKYvbJYhCM7Sf3qVbyAC7vRGn3ksERowQE8YsoaQrgy4Wo6NjvHOUh
         jbE80cgbfuq1yKbZbVdM+dNbKyxgcLue1zI8GgTVIvxuBKyMkNVXWiVvHkv2FxXyUU+H
         XgFyQLGsUnSo+2+++S6I4LqO7KNEX8aIi8DawPZSS0IqqOW9O58kU9DRk1b8MwwfhXpJ
         rZ2p45m1RvAKEQoePfXWM9VGqlD2devMC1FcYFx/ksD2Ueu0YvmRgXnvqhVG4t1hWArL
         bre2+iaTnBFNy2SybtiA/pkv0spU9DyMvc4JW7JD2EZSsKucuwzeMY3bR1BwDFe8d5Zi
         TPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049156; x=1770653956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFoIZ5tK1KlcsQdHdIdlIU8x9jGXAWlRaQS5aGhZ/7E=;
        b=J8fPE6txXO0pl8lcmR7uZTSo7zE4EORiD9mpyw6gCiwUDhsKCnIWo4KqPLtANvjZNW
         TITaYjPm/H8Iu8u4tW5Y1Q0TF9HcR+FtH/ybMHjk+fLxnm9C2u0wBv1TOjXeM8n+QyFi
         sUUNQ2+nGSEoWeNq8oqBZc6McARRPhPT8udf9mhX0ltON1iQRVCAxZXdDeAW3ZPOhVoC
         s9X3PDmbIUvA1wovVa2IJCuVgEEfhmByNFPQQaENk3D9MfF3c9se8g0m0IH1rTRBxwDQ
         Xe0FKfSSeZAm3Q1FGeKCBAgEuuePeIXlUmOybi/eBAIuqqHkwAfEHOUbkAq/ZcGxTibk
         Ou2A==
X-Forwarded-Encrypted: i=1; AJvYcCW3neweqIfAWs8JPFNmTWTeqVbf0BytxOfG6wHK5f4z0l09Xz2oIv3ZpPq2N08YttJbTZBwA/NTUi3OC+ID@vger.kernel.org
X-Gm-Message-State: AOJu0YzlZJfniJGzm+MDePlBhUS9Lgr+4yiKnagh1y/PF5FzWoT0/wAm
	1FQ59N6c6n+O788WtQDPUpdlqSkvWBspAQfNaV9GnkQEM8eFsr+o3/YfR0QckNAK3laprH2DX3D
	ZerWxyJclMBOBNN4dTy4bWmWvi3Hx6ob4uSUbEd8hokx33qiMp4xQKUv7edx7aDZhrfqY
X-Gm-Gg: AZuq6aLqYURrVTUG2Venrm7yPWanmMbrIb370Vo7nsLkyeRAU4F6Ecr38bL3VYslUUh
	UMFqtVsWd8bewlacKpd+tSM1kd+QdfPtCPTIziMGKLMcSx2XeLzh4l2dEt8ZNmzpj8Y9QkwFodG
	m8j3bbEOpQvD02LL3KXQ4pKgFZAFaMjcstA5t6PZzbtFqqfpWtUL4mYbNI3PkDshv6IdUjXvcoC
	WZ3XPl/4mzqDeLf7WjQjr+tYO7tEl2O+cpGitT+m1jRbFwvoxxvcADrPHFFhQlUqMl2QIyVVunz
	k3p8gzF1Kd+UR9lOQctmAdMYrfInfFRG/0V+HZKR3zlHiV9zgoZZgkECfATC4trFwrOtNcl9lMm
	z56miArexbu6BUOor6DfWbqMdYZ/88katcoTp9l5b
X-Received: by 2002:a17:903:1905:b0:2a7:ca83:5b61 with SMTP id d9443c01a7336-2a8d98f1f02mr116208935ad.12.1770049155556;
        Mon, 02 Feb 2026 08:19:15 -0800 (PST)
X-Received: by 2002:a17:903:1905:b0:2a7:ca83:5b61 with SMTP id d9443c01a7336-2a8d98f1f02mr116208565ad.12.1770049154943;
        Mon, 02 Feb 2026 08:19:14 -0800 (PST)
Received: from [192.168.1.4] ([49.204.107.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3afdsm145202485ad.61.2026.02.02.08.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 08:19:14 -0800 (PST)
Message-ID: <c0e2a55d-d5d2-4c54-9bba-448443cbfc68@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 21:49:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] i2c: qcom-geni: Store of_device_id data in
 driver private struct
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-12-praveen.talari@oss.qualcomm.com>
 <0b628651-79ea-4ae1-8898-125beac7a2b7@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <0b628651-79ea-4ae1-8898-125beac7a2b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ynytROO1M81ocIHK4KEewgxHOjLjV54Q
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6980ce84 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JMgISmeAsz0pT9/O8qDBbw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bzct_qqClQXo_WY-SnsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ynytROO1M81ocIHK4KEewgxHOjLjV54Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyOCBTYWx0ZWRfX1PkcX4is5I/c
 QIXVt4uSaNQNZvAdL8mI137b1O+MKHNQkhNhVxCM5psWK8rvfSoHjburgpWWIDERKjjQLVZ8E0x
 0HYYG5dtCQlg435rwIPtt+iMuDqpFPTdW3TV5Lsw9LTlln4gRZ/lXKmJcV+69TidaVavfVtmeAf
 LaBFFqUSsEaEkjqVvGKRnfHOh+MQJjkb4/d17YgydI+fcvvGLX6FRr5Z90iJ9vsKz49ZuvMhOtG
 WDv6go4RZhvySO15QvFQa6ALH2Ou94pEZGiv4Jn6YiWsEuCzvsaMXiESK4pnGukyNow2YtHdGkL
 rg3SqZgN1NANWQg+sfwd2626EMn7iNLuHX3Z+pe2oglsu2lUw//GWikOFGO2S3JOOJQt3PW+8IZ
 ees/i3k5xPIVknIWbcWaH/564cURVjwQQWSGeTm2QIt934clHcl+gIbBZ76d0GpJBjWP0xsdIXI
 MIw9SdQP/cgzPEphKEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91533-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[49.204.107.72:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E914CED84
X-Rspamd-Action: no action

Hi Konrad,

On 1/30/2026 5:59 PM, Konrad Dybcio wrote:
> On 1/12/26 11:47 AM, Praveen Talari wrote:
>> To avoid repeatedly fetching and checking platform data across various
>> functions, store the struct of_device_id data directly in the i2c
>> private structure. This change enhances code maintainability and reduces
>> redundancy.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
>>   1 file changed, 17 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index b0a18e3d57d9..1c9356e13b97 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -77,6 +77,13 @@ enum geni_i2c_err_code {
>>   #define XFER_TIMEOUT		HZ
>>   #define RST_TIMEOUT		HZ
>>   
>> +struct geni_i2c_desc {
>> +	bool has_core_clk;
>> +	char *icc_ddr;
> 
> Again, this should be a NOP after patch 1, that we can drop
Will do in next patch.

Thanks,
Praveen
> 
> Konrad


