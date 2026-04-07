Return-Path: <linux-arm-msm+bounces-102159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHIxHh//1GnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 14:57:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDD3AEB9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 14:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34174300F942
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 12:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C283B4EAD;
	Tue,  7 Apr 2026 12:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZP1dxY+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbyrDteU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E063B4EAB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566620; cv=none; b=jMgEDbVKUyfutvBYz/8608RlC0193jZVxxCwHuisBRN6GU1Z/sNoB0JD+TA0E7ma/jF+gPfiDG3jEh2ulKigQsHAxCqUy9s1wUZkPqxH6BDh7nB5vwuSfpvTUNZgyohpPRoWyixikdolk12oynMPGc59SfPg34yFKbqE7uEH6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566620; c=relaxed/simple;
	bh=vzmhas1Xj2z21+PdqsIMST2aK6g3TxINF5b/tKwSCAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKmhypZGBVbjSgcWx0rF+EiypXwTtSiCZUbw71DJjeezYeAl0suTRsxG2jjXUIvPuig+/87a+/f6rytkBy1vA0QGaV1/IiN8UxBhr21zt1AjwWLWJBbgT/Nq+aJ1Q/silT4rSOIVwBBr+uERv0AhpfaVbf5QtItwACeT3102a54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZP1dxY+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbyrDteU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CjpAu3402384
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 12:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WV+YzP7McTVo1FvY2lfizBt5kEJJS5AS/KHKnX29eC4=; b=pZP1dxY+4BdPDAbP
	IeRNkXqcwimQLTE2JJxjFJ+WUlVonvj25tLnayb8ACem8POM1IYjjbxnMDDB+9OM
	hFxY1PnWEmnnmTVlVn7mtPRQ4sChIk28QYNzKEZBts3lJ4ZQD3c5vfy1gnMPNVCk
	Gz71Fe+naX6qphASeW4z/zJnIvlbFqXhJJCFW4yhPsHC9mTEGeRKiVdLqawiLGVD
	ZJo4t3cPW+bZXVOxoDXngdjDSKAzmpN5mPW1Vi1w7gnjEzcrZq/+1jFnjrqEAsNB
	a2t6Zur9O/AGzOQwWMl425Y6wlkc+YHN7TJGw9CRoNTOeNpbwOin2HKNubydfUK8
	KN67nA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhtrjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:56:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89eadc12c84so19823516d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566617; x=1776171417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WV+YzP7McTVo1FvY2lfizBt5kEJJS5AS/KHKnX29eC4=;
        b=cbyrDteUnMlEmDi3YvWIQqIZgGoa6e+lA1ko48tWCnCtAOrfoVoUWhLmzQmW4zp5Iq
         Ikw6e3Uemq8h//XVNEP8ltr3V8vafACZtM7jyTdMfJf+fyh8grsmltNJ0y1cehSK9dxm
         j1UfPJdmRhfCPqOULgYaqXr7skw9cOMhTyQwZxF2kxdbAZO2cXxA6ecAAnAuNPo4laE4
         ZgG9LEoBQIAsXDFarq56sDI4q2489oUzGaHJM5XLMgTA6+ZjEWsLzh4yvdW9RJtrOmSf
         xtmYhQu/ZTI3lZnkJA0Pi753dFhqfnBd9jV7Svw6tJmoqiI2otyQEH+4ukmEAIx4CveT
         AZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566617; x=1776171417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WV+YzP7McTVo1FvY2lfizBt5kEJJS5AS/KHKnX29eC4=;
        b=KGTmIkc/zKu/D6Rn3qxLUUEZwMJRt3mdGZVEMO6xMB632Gdr6CuEG+fxvqW1kOh9DZ
         REq6EDFQvsX15Gu1egciLpHVtrqFY8AsbPSkHtcnSfgY+614TxH+tWz6A7RMG8Sq666w
         l7JAf0BchWB2HR4Q8+0Gv66IjtzqLmM5QVreDb3Y6G8QFIHFZ/4JnYfNDP24K1X0aISe
         EdAPiX9mlnUW7Wv7RnQKXvPC3lYRLBvSjLZCvNwq2X3/cVWxj0lsWF+2/zcdXkccnFu8
         LxQP5IyaseRDWQSnHsv56WhvkjSCSz9IrMz6Y45KzutD4mVoGgJ901O+DiwzvcWaA1I6
         sonw==
X-Gm-Message-State: AOJu0YxMy/9eca0dwqflRaBxdg1g+Rq7chDy2PSP6MCCH2POf3JWgVWd
	k7QasixUk4GzsP4cWhMsFTYcqXbdq2WOLzc4uNrsFYpHMc4/ZXVboaQBzyU84jL0EUK17jOJ3TA
	M+mdb3vLbbnQAARqMKK1Qv889Tz2HrT4m6xXdqPIJ7hnn4oNXkvbaci/yRDyqAPh8GyNj
X-Gm-Gg: AeBDietheJNjpJ6gMnvpauQff9mmPU+tEPOPWwmwPZciLb9Ncv8gdAsG7N8zkLh/1aA
	tZRbWs6t3CVTW+5itOjAc0wnzg1s4B51kdeOfwH5SIfu4kQChFaZomikciyfQBWxgUGsJ9H464J
	DkBkEXmX2zQjv6D24z4J39ihi2u9MrrZSxeJOPALMWPVqL1I9POfZ/c9MSPawR+2O9eqUl8IYSB
	wOAw1FAv45rcKaEwFojbElHMw1QjXvlsxlIYv4Eypcp6AVhRAq4t5IYhSpFY7yDTm5xL+BfYz6j
	3ZcxG7Q/LaHy/nG0o/OOM4EjnmKUhUv7Zi/gJHJMpXN7hXHloMs2jiULrMwEXW0SDbwQT5sy4F2
	R/cMKXxDFlhhkEJq7/bXqZo7klgfsSUL+WNcVucbGvokGVH/INhAwiM2+AJp2+nd9l89Kr3PeEm
	mUqAE=
X-Received: by 2002:a05:6214:202b:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8a701be0578mr215920646d6.2.1775566617514;
        Tue, 07 Apr 2026 05:56:57 -0700 (PDT)
X-Received: by 2002:a05:6214:202b:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8a701be0578mr215920346d6.2.1775566617050;
        Tue, 07 Apr 2026 05:56:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6aabsm556663566b.34.2026.04.07.05.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:56:56 -0700 (PDT)
Message-ID: <27c48c9c-32ba-4f92-834e-637dc728c6d3@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 14:56:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
 <20260407-read-rpmh-v3-v3-1-34079f92691c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v3-1-34079f92691c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfXymKlwVK9kv48
 ufZdtNATZjHC7/E0y5z+4+S0KrszXu3m0JMQl31iY9mnnM48gvm/LVdne+TG9K9vxnr9483iKpa
 zsRojoDDGnMTbZAS0BJWYk0opn1TdWdKO0PQCNi7kspWtJx2brafUk1k2bpj3QNf0kWKUBo2f3A
 OBfJC+IQiE2j9ZNkLIBQE7ajlen5xHSDoKrB9Klp46i2zG8MeaOOcK4u2aWuesjY4unCD70gemx
 swc7AYoKcmST2o6J5NSPhsFp/FTt1eP6BmqrMknTkVOH0C1Z0P4Ug+IUJ7pW/yKOLThpXru+qQS
 Bx85xkth7fGb69xTm17MVF6wd0QTDGwsFD0I2wKdjwrmuxZhN4T9xqKmbiC6cgcHiiK/xsIydUR
 ouvcz4LGhKZ9WA2ye5SQAwW8dC/Dq1ojAKH9hiiYlSZKHqvxwCbZQFOQAnS43kNPUuGY6dfAZvB
 hJLWiAHJeJmGTh9uVqw==
X-Proofpoint-GUID: QQMvtmRmFnLvVznNR_34JfmfalbW9zzz
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4ff1a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aI3X9z-TDy9Gq4s1KZ4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: QQMvtmRmFnLvVznNR_34JfmfalbW9zzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070121
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102159-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1CDD3AEB9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 6:43 AM, Kamal Wadhwa wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> All rpmh_*() APIs so far have supported placing votes for various resource
> settings but the H/W also have option to read resource settings.
> 
> Add new rpmh_read() API to allow clients to read back resource setting
> from H/W. This will be useful for clients like regulators, which currently
> don't have a way to know the settings applied during bootloader stage.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

[...]

> @@ -453,6 +454,11 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>  
>  		trace_rpmh_tx_done(drv, i, req);
>  
> +		if (req->is_read) {
> +			reg = drv->regs[RSC_DRV_CMD_RESP_DATA];
> +			req->cmds[0].data = read_tcs_reg(drv, reg, i);

Does this break if we send a request that contains a read request
at index != 0, or chain multiple read commands? (is that possible?)

Or perhaps this is fine, because the only way to "legally" send a
read command is rpmh_read() which sends a message with just a single
read command?

Otherwise this patch looks good to me

Konrad


