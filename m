Return-Path: <linux-arm-msm+bounces-103688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HfOEsXh5WnfowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:20:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D04280DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4366300A756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA9A3822B2;
	Mon, 20 Apr 2026 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LW78j4gU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJ6RFWjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5417A37FF6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673139; cv=none; b=MJi65dWDCdYBJ679mo1sOuP0RbTvOCua0iGnTsgPG+Q7EataXejWvsOeq9LgLmUziVloTeXG46x0tq/q20vj1vOyu7EGdV/Uois7v9r60M8YS4j7NbqxMOZ6Nh0kmxIbhCECnI2MmOIEtQSLtNIorTbWq2VfOzjjThDxhplV16E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673139; c=relaxed/simple;
	bh=JWFU0CWiVaxC4xWODTFg+xJD//zWSKELvZIYum5kmrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2X+n9ylpAJz3PimhSYYNdC9ImBbhlqiLfkQeCB8+PVH0IKYmF19h+tlyRTVktHTnW9ICdZXPMmxTa0RwXFsP4Agcs5FwXVi/F6TKNDgEGnuuQqC9QrOvJbLtkVF51lDQ8OWNEnbmvAECwLezhF2uUCm0sddA/tg8q0hyNU4dM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LW78j4gU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJ6RFWjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Qdxq1559781
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8cub26kj783/irTOLcCnYOpgCqB62wW8DQoP4ADbaXU=; b=LW78j4gUFR1F2nok
	OJ6E3Z03SAI5hv41aK85ljUZLx4TDF2ql3oJloPPQNIpVoZw4aS38i/lY45seomY
	4VLmxngNH9NCw/S1Vbr1d9zI9QJZ14G/mkXH8B2cmygO5WoniYxF51aefuWQM3aw
	YAVGIT3WAbcTIoC8IHxNsVTTIkDuIdVilxBgKbjEQ1YDbQmcPhl7WEAj9tRYAfU+
	MS79r1EiYgbqt0exvgr9c4E+Lr9axdWjcbZgO0LMN4xCVzDbROEnR0GodS6wDpmf
	zW9GrbgJqwXykouPCG0FG0PP+P6UP/HS+EaSJ15NFNWSiWoAdCPDVAwkn7Uj2Sm6
	OPs7QQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr52j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:18:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d63aeaaedaso69820285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673136; x=1777277936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cub26kj783/irTOLcCnYOpgCqB62wW8DQoP4ADbaXU=;
        b=hJ6RFWjGzwmj/CDziP7TV8kB6RtnxEtQV4lYM8iTJgCnGd9djOchw5KXIbXug1xJv9
         Jxk67815aFn8Nh9dfgWuIYDBinPZOOotTo6Xp6mAu10YH8VWcxgTR1E7FoYbnHv+ZwEM
         TkqLCSAkY1f1JdGZGH+0Ma3h5QymgLPJPXeVipT5yLCFc4R36ElKUek32TZVRGzR5dd1
         gOC/MkXvjSaselUC+oUnpC/9EgTEyATHTG5aMv5NlowI9PsNUpQZ7oSZ1z1cncygj4wy
         wzsg6yyn6nilVYkbHWSs3sDmN1wDWK1P5aXM8HgBuEsYlzImkg1Cc9RzQaRDfe2WIL1/
         ++dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673136; x=1777277936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cub26kj783/irTOLcCnYOpgCqB62wW8DQoP4ADbaXU=;
        b=eDtfU7YJ/Iu6pAZldc8hRP75Xpe3dblo9qS2aACkyR8wsoZdWYyXk2KfK8PNViYUCE
         +w9cHCeZofnyqeRpoUREBD5FJU905JCRn9cnEWcC5t+OgvRo9qjEDvyTb7c/KoC44R8D
         +HTgLiKUh3GvCYBcIoll46pht4pii2IPXpkymCq5Os1W9u3LF7hF5jg8+LGnx95ZoE9l
         AkSUyahfXOD1EmwZyQ/4NhRfy+XLOTDCa4DdRXxoQaultbLgKeP5q1gRiqcgM2BC+ujK
         vCZ7OHubXHf2QBJ+2GteXw4RGw5hR00mSgKVj/ENhJpvqBfDGA2N8kE4p355PACQurhU
         ejIA==
X-Forwarded-Encrypted: i=1; AFNElJ9L81YMnsEffpcgpouCWLm5R/ohgHEsU1VjxVZfG+mErQTGQzbgNMZoRvKOvbRyOj4D+Hh5SXmNjqOO9e5c@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqow4bLSMFHpii9G9RDjj67WV+LasfaK9H6zVaf0FbBaI0ivgP
	/oDyY3P5lAIkrLg2LDKfsfjl6nljXfeqBy6mbkKAB7v5jWilreL7zz4sVNZJRDBuU/TGvgcxOjI
	+rifCuWn8lqT31GUUmhAeXQ+k6Rac+U2P5PzEW/QV6jAeatFPofvBflTUHW8SQZeyFoXA
X-Gm-Gg: AeBDievRYnhZ986C/mc1DTtwBHFXW6eDqmkCHEDUFKOPPEMD2CUJ2CXFo+x8dYHT3GT
	0jvA8iOoRUYZ1U+E+CbHhzYMGezbGtQ0euw3EJW88X+DN8c5R3ErvHIk4e/3WIuiC1vYfpvEA3/
	SPjKGc6xXYW0KhHD1GPgeCmGOsVwy3dE8vaMCm4hdYjAVRhooX9/AGC5QTeCuiBFTv1JcMPjbiU
	VID53ruLC0NbFuVs2lekBwwR4fU8enRJVSKJWk1cI7+Nvtg5cYH5yn7oA3FH3ut/dno1LHQCQ95
	hsNFVrjuJb6KlW8fA/djBrguO/Y5Fp3qZSIxJJSqc08NEzZavA/j9NPJKOGbAo6p3RHVXCWZNop
	K3zdMWs74L4bzHyG2hatu2L0GNBUlJOfRxFkXo8egVhJgBmdrxEGelZeMKoYWDxKHtn0j9uUDza
	XVkw2MMfQDT5ORyg==
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr150460776d6.2.1776673136596;
        Mon, 20 Apr 2026 01:18:56 -0700 (PDT)
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr150460596d6.2.1776673136212;
        Mon, 20 Apr 2026 01:18:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4550468d6sm322957466b.52.2026.04.20.01.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:18:55 -0700 (PDT)
Message-ID: <1b40b1a0-983c-4eca-bdc8-6a64cf76197d@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:18:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
To: Manivannan Sadhasivam <mani@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
 <rqjdh72kncyjfkpfo5ymd3uvyy5bzrqzpomdbggobk2spcfpwg@irlwojm3eme7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rqjdh72kncyjfkpfo5ymd3uvyy5bzrqzpomdbggobk2spcfpwg@irlwojm3eme7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3OSBTYWx0ZWRfX+vT2jy8x7gOh
 o0ZAZScmzUUsVgqlqvLtEUU31eTPC/qeN3hbG+T7qD3RSSHDnAbQXjCvJCUwlSSXTMok+qkpu1T
 hvUm39PAxLFjzMx+QucPAkQBfr+eUNtEUCqhUWUAIOxEkcAcyQ5oqtaQjbV1zZTUpoS4J5CXb7E
 YQ/6q9ft2IFxk1FZdnvPxYyyvvDdJ1LqZJ70BBGbJToelnG0OvC1SPtIPDk0qzU+woshzHM8MP0
 MVMfkaL6Q7wXqBAFCqJjQvMI1FFcUuEIoUHOlB2kKR7bF0WYu6zh7DDf/cyGflYfx1Kic+U+U4U
 MfLG1ilcoinWViCHfsIjpCZVDzy3pN1o7ZXAV5f++nMd2t2RA5Ccsk84gPgxGrsMwBuMOwv5Fqu
 i+OZBFpS1XWARGg6NQz7H+NJzc0FU1Dz6gx2AVmXs6OOABu7taC1twowZ4O4s3h9X/Io7sbdoPd
 dkWMwMyUhzkI+MdlgPw==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5e171 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7OZ-WDDc3zNUe51q9WUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: efMIXKfUEZ7yFHdWNiaFE3kKirhvJdoB
X-Proofpoint-GUID: efMIXKfUEZ7yFHdWNiaFE3kKirhvJdoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103688-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 941D04280DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 10:16 AM, Manivannan Sadhasivam wrote:
> On Mon, Apr 20, 2026 at 12:01:41PM +0800, Shawn Guo wrote:
>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>
>> Document Inter-Processor Communication Controller on Qualcomm Nord SoC
>> with a fallback on qcom,ipcc.
>>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> index f5c584cf2146..0a86230a2b18 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> @@ -28,6 +28,7 @@ properties:
>>            - qcom,glymur-ipcc
>>            - qcom,kaanapali-ipcc
>>            - qcom,milos-ipcc
>> +          - qcom,nord-ipcc
> 
> What is the difference between this and the existing 'sa8775p' compatible? Are
> they both representing the same SoC series?

Nord is a gen newer

Konrad

