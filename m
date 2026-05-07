Return-Path: <linux-arm-msm+bounces-106231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCPaBQQH/GlkKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 05:29:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7DB4E2990
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 05:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9336301727E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 03:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDF62D8DCA;
	Thu,  7 May 2026 03:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBga6zSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWqAuJrx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE02C3271
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 03:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124539; cv=none; b=FhoO3kxS+1YGJvIGCq3/Trxh8UTCpPLOJN5/QY6tau7L9fD1fwJWI/6dYbaGC5rj8OqLyHyIhEZHY5szR8ny4ymLeixo7391ESCRmNKHo7XlcwlH4mfmFLHZhHM9pCg9Hr+xhYtQyFm0xu3K5zgDbTEhESVjeaaTvALwoEF4C/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124539; c=relaxed/simple;
	bh=gi2ObkCraQrs04SQ8ny/M/6gQkScLLeAkIE525W0jVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rl4d9FbiWSFmO9/Mf7iYhzDj6wrrllg8zgaJiPSFf7HthdP368kFFyxmMKgfafldt0bTUtecZ7Xw+VfzzPZ/nAjfKH6qEL+SJ3dOiW/hFzoLnQC1C17P5sT28wX2JX/YZRRLnFEgrFlca4N1odpf3QGXtcGYwm94Azrm5sSgTkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBga6zSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWqAuJrx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6471muCf442581
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 03:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gqWZYqm+m8nGCsJyj2+TkIzkgEHJKGfXdeU5g5E6Bw=; b=FBga6zSadj7d/WdR
	2qYBsk60KzIOx9MCi7xA/m62yLD1w+T+Uw1UxbwYj7MS0q90ie+/sJs9xO+83SLi
	iIEY+Xo8b7eT2Jx0yltelgMBa5ni+zSaVD1sQvel+i7oXvV/GqbgY2l4bZ9krtgO
	2lDrl+uOZbI7FppHdnhEi3dO7FkdqYsJHF95GOF1zvVyhrydPSXK0z0H1WUNOilD
	Zl5i1+NvF4CAlnoOwmdvaWb3QTmzjAU8hCB6wesRoPvnG1foIVr8x4RnV5yIl7Oo
	CoAqDsaQcfqYxPL/dkngQRV0DaeJSpizvLYgErMS6ZZUlLQlBqI9++FUym9VXSin
	DjYonw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299kqqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 03:28:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f485961555so1933686eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 20:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778124536; x=1778729336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gqWZYqm+m8nGCsJyj2+TkIzkgEHJKGfXdeU5g5E6Bw=;
        b=fWqAuJrxaIff0+TfXSgGXkYmkX4IqCwFY5/jIp/bCsx6vAdfsYI2dqLysBaRfhVEVI
         +tc/hooq4HoBdiVKO5tU0Z+l7oPvx6WgkHyyrR2SGxLw/7u0dAeEjL1LkmzYo7QfzMcp
         pQhr2QPPnCbbI6Toz2/ZMYLSQxK7TSNGq5SrUFAV2gU7GSkT7lr/54GSPzJuRtKI4E2H
         Ua+C1vHtbYKWWWiuKvJeLX+KiorShj7iOryMK53xibnz5pJznjsMnMMvtQ+//ADq3S8W
         HqgltY3922jQVNfqbbISHF1NoqlJ/zHpHfpufF+3OydA+cBBA0wOeAuj0fhfietjrHFM
         z5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778124536; x=1778729336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gqWZYqm+m8nGCsJyj2+TkIzkgEHJKGfXdeU5g5E6Bw=;
        b=DMdB8Sg/plyJac62tJ+b/+eoAlNpxR//8MitnJiSCusQTHOaCtQMVSjcft1Q+C1+AZ
         ppePw1uMk0AYZUgOLqmKDb2TtHhKrniUg8xyIBdDcZPrcomMgIMJ0i5C3v+xDb8U4NzB
         BG1XA/iql7mHVqGdvSqILxcBPbhVFsN7bSE9brFOFFCfFN+OMIx9U/UvHr8OU/C0QlhR
         K1QBQlizB0sVM7pEjiM+4yJ8S74P2B6eXcaLIXB/FnqQ7FO4qXkPlMzseqYlTUpP6hAa
         VURBjwki7p5PvkNiGPpem/kvZDpSj+CT5vc+Wc80HhmpsvxSwqxiFJ4GTMqFhty9rxlC
         n1Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8s1OYG9MHmuM94rfUVtBpnz5S7w1ml95t7Q3LfXI6P6MiDCQIsiLfDNDfmg3owB3ah8XinqqtyO/L8GoRC@vger.kernel.org
X-Gm-Message-State: AOJu0YwoTjwmT1E9mrzdiHfmkURZuFze5Xl0kWXqwKgVPTgtJauyDhpX
	mwuQ5pB053gcWpzc/z7SJN1DYfJJlZuFZG2QyLdFmtC2vq0RX5biCv1mUHACTrWLmGFCfTrQ4pN
	0NUyUVqkLU9Qe7neQMZT1945BcdA6wK+CKQFjlUw1rQx/np3yjKz+2wrG7ERViKD/9dWE
X-Gm-Gg: AeBDiesIWBKEXEcWBSYBFlxCXbf4Thakc8+62Kkx2KfzSd7U5LcIEOR2KKSsK0EmBJ5
	ZZaNQUk6z/cb+koA7/JOFkyqT/1WlBj00+eTZWhfEJ9jS6vJ9TJxebLo5DebtliIVjTXtIh4I7k
	dj6JeFZKbLssCApLz8nNU/CncP6iTA631eGYLEigFA1QpgY6GCcdCvvxjMQJB5GuK3GFduSmKYV
	K4ZFcUCBFk4LgcZZVJB/M7p/ms9m+MlSgXOxr3du00OSGITTn2HMZwxEHgl19UU76zroiBAfqfo
	NCljLG91FX+P16XbioFvtJcYPgcrYBpST+iOlKCeAkPNjZq+bBmrR8qSJ2yuTiLMzghBIQ/F0G3
	jrLWL9iJhbJReNfNuHKt1dVS4JBPgOZafy0cGx+MbARywbbEawOs0JopS8qXP+1k=
X-Received: by 2002:a05:7300:cc90:b0:2ed:6f94:9d94 with SMTP id 5a478bee46e88-2f549f5f684mr1839113eec.19.1778124536029;
        Wed, 06 May 2026 20:28:56 -0700 (PDT)
X-Received: by 2002:a05:7300:cc90:b0:2ed:6f94:9d94 with SMTP id 5a478bee46e88-2f549f5f684mr1839097eec.19.1778124535413;
        Wed, 06 May 2026 20:28:55 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56fd8fa8csm5660643eec.21.2026.05.06.20.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 20:28:54 -0700 (PDT)
Message-ID: <3ab480af-247f-498f-95f4-ab17526876a5@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:58:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] spi: qcom-geni: Add trace events for Qualcomm GENI
 SPI driver
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
        AniketRandiveaniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-2-c957cfe712d1@oss.qualcomm.com>
 <afvltFJzKLaO9weP@sirena.co.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <afvltFJzKLaO9weP@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fc06f9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=1VmPbvypwqz_8yqDh7oA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: AqUrVd_5Z37b-UO2t4JVKX72CwhtAZs9
X-Proofpoint-GUID: AqUrVd_5Z37b-UO2t4JVKX72CwhtAZs9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzMCBTYWx0ZWRfXyqr2MFWf/dl/
 2KHxIkc6FPRKSjQyFmwPPU2ZPFN7CRr1XblbtqCrrCRSH3bAh2KnahjjJwFHYq5g9z73mm1wuPE
 FUtPbjxpg9s1JOsh4u0SVlfvKkIJZFN9ojiBaDW9mBFN10HYww1Xtim+wMyNv09uyxm3jgVhSbB
 3OJJqAMsfqUlIjmo9s6Jeu4/K1x4Hma0woX/nOrGsffsza92dt4Vhf927Whcd+eBUPX/irxmN9H
 4NfYhnkkKid3OpwtsMiPsdvWx6fMTZGr7apoVNguCyWTNmSfBdaD0bgkpt/BnZqwZLpevydBGwa
 t6u8iVDQuMzI+elAYgW4r59JxZMNU6zC88gF/TaVI6XkE7Q4a2qkjSWWQa519vE0LqsWa269Pai
 CnjnhplgNXRMHp9xnUvGj6oIy/jLcGCrbRyycmtzhiKkblsdrAeuvTEFXnvDUj/L443+Hyykqjc
 el+PnReJ5wwWKxaIWuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070030
X-Rspamd-Queue-Id: AB7DB4E2990
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
	TAGGED_FROM(0.00)[bounces-106231-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Mark,

On 07-05-2026 06:37, Mark Brown wrote:
> On Wed, May 06, 2026 at 10:59:43PM +0530, Praveen Talari wrote:
>
>> @@ -717,6 +726,7 @@ static bool geni_spi_handle_tx(struct spi_geni_master *mas)
>>   		max_bytes = mas->tx_rem_bytes;
>>   
>>   	tx_buf = mas->cur_xfer->tx_buf + mas->cur_xfer->len - mas->tx_rem_bytes;
>> +
>>   	while (i < max_bytes) {
>>   		unsigned int j;
>>   		unsigned int bytes_to_write;
> Unrelated whitespace change.

oh its my bad. will fix in next patch set.


Thanks,

Praveen Talari


