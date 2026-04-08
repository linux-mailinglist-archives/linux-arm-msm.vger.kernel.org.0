Return-Path: <linux-arm-msm+bounces-102287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFj/KEcd1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:17:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E273B9BDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F252303D88A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8EC39B97E;
	Wed,  8 Apr 2026 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaltLony";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6LgxhFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D13AEF24
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639863; cv=none; b=cra+IzbhKIY6oFutEVc0GofT0iuboZ6qid3i5WQXbtSaU8SrDXp2kEVj3uBOd5zqwH5EuCGP5FQisgalKvITIWFcje3qV4Rn2jYa9FC2Q6MtuH1Jt2yFdeVjARmNeYZtxAz9z4VaJXQwvXXixrQxZaobbSNpC4pw19ZmtJrlci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639863; c=relaxed/simple;
	bh=5SgtmHDKYJakcPQU7t/Fr9x1JX6LqLotnyM8VacRCWo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O6AgcnqTmglfg9DnoNmTjQYscAXKztTspIfnNfXWY1TGMVnPEXMnyTi6nJt5677WEo7NC2uXO3mEYxHwSOR0bbWr4/u8G/SdJw6kWpMVsjeguwnBAd5skCUAXPUavX87Asysn05IiHA+GnxsSKjxVKToZHlYpXcZgbhrjuXMYNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaltLony; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6LgxhFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6384uZFR262958
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=; b=jaltLonyHTzMahw/
	5o1OSpHW08r4XpbN15i37+WTyb5ntcFKjd+Myy47ADT1beruc0in9UxI6GqsF6Yw
	qTQKH4he5o8tTNnQ06Lf4ZaUgRmaTxV0CzLHRzGYMAh0ezWH7Z92p1OiM1aLYrly
	3H2vVzmCW9uHEgsftdtrobwxOEyjJdvqsRW2XgeutXINVPjF+fbIUxQ3DK9+ufWF
	xo5ejSDOnlriWpOKU+mGSIkNgrQfIBpNaJsDkqcBQuDNbn3BsJToLD9m/Rsgros+
	n4lCF+tSM2WDrXZSsa7re1F5zscBNF0/PtuY7665uX+q0vBd50zS/e19LsjOvEG9
	5AA+pQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t22jjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:17:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b250d3699aso143901625ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639861; x=1776244661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=;
        b=i6LgxhFpCCrKC2pGpXmLgmBTPGi2vDWB9/fwrc1VrSyv2VNkIhwQ1YZzqqPC3Fq1T4
         BFOz2X+JjFWDFzib47TXPytItvLSnqpkbbD2DxaREQbC+lCyLlG2a3KvDS8bulA6TtQ5
         1jr8r7xPYXrqy6KHkaOqCgGlX8GiETveZDXd062/STHcx4qTvV9+F4VMOZokTYNuXg6/
         eF57UlOrT3wQoeqfe5mf/0Nb8jXGiaQPESQhY264BXEz2Dycul5cKZ7ReNZu0bBlO7CH
         wcDhsgaL53x4HH7vz0jRG1b+dzPAsKxH+2qSnsSA9ypbUCZ82IKcvDHmnYZHVGrxv2sg
         1N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639861; x=1776244661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=;
        b=PnUdJHZ4u8xDM3ItCyvskKKHh1TeegyEbaEhljuBvNZ9WRtuYk2mqzvsaLyOrv7QqL
         7bErQKgX7dZrGYFis08zZQ0CesaKrvngiTwLqyTh9oNtiWaADbwqFJlXepc9j167InIU
         C6IjTTIB3Ogecb/gYUDsm5VJ9JSJFxgsj9V1Pyrk/i7gQE5L03+foS7AmpkDaOeSwP81
         F/lHmLDkGGLBBiM1hdZ8lNHKoTwGZnRfLmxz1VbwMVqr5Aq5I1QMqeYiWqvjtuZ4mhVj
         E+WGGEjreZhtrW/lLM4EvP4Vo8licsCVSblaafvZmK4tgvCUGQI5PX1ga8aA8fUMgjuS
         J5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV5U6MYy59JF2aWArOufsbF0N4uFpsnrq1QiWNCjmQcUZfaxunQBW9JWJBQGsFf1LPgabC9FENtQoHzD2uS@vger.kernel.org
X-Gm-Message-State: AOJu0YxYo95lLiH+ehYVPxNhHjA2xdVsQFssNUwfRVDtLVBXo6iMg0kL
	mfsAwZnXYXrgZNtizHVhUNkn4uKhWKBTsnmwHyfzEo5PwbVRKTOYuqbxwmZAOnfNiE9194rcBx6
	WrRn9bIcNbtW7jgJWWxesK0lw8NUxLyHQ5iOBWnmyU1wtzBH/XT26OYc+xkh3YID2B+zZ
X-Gm-Gg: AeBDievO9aL/yVnWPDPYF2D42upuBs7Zw4jDQgNHcgC3ZdfyxNaCTMBxdwOG4otYGbB
	K+GUIr/NHIw0a7JyBy/DpjuSgDLE4E5juT66kIDj44cVNUgx6pMg8JxjgNpr6p1JuY17AAqI/Up
	EHocDgsltFf8DBAp6FZYA8AYpLxzLSYWeMcdIHn9cst59QWIPUu04vfyPvhkop3umDPXefcXOEt
	U28M+Xt3TFl+gTozrStx0lmxvDIq9pKxVoWRax8pNm2A3MeJurwTic1H7obeN61AQOIiNOLdq0o
	S+MzUxgk4Vq9xF65GU/UILJGYzWyCdeXgpLXX57BP6ulaFaGRJsB58hO+JNPhQ78whiezWPDxMQ
	QU0eFO+Opn7xRrcIxPDxpiqV+28KSkJ66D5REDDnwjQRpD3/fVwFTzFkUUQ11Yj/qLqCAvSGRpV
	kQqbVO84ALjHMdFoc6
X-Received: by 2002:a17:903:2f08:b0:2ad:bd4c:a5 with SMTP id d9443c01a7336-2b281706ecfmr219601755ad.1.1775639861535;
        Wed, 08 Apr 2026 02:17:41 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2ad:bd4c:a5 with SMTP id d9443c01a7336-2b281706ecfmr219601445ad.1.1775639861075;
        Wed, 08 Apr 2026 02:17:41 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbce2sm196458655ad.79.2026.04.08.02.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:17:40 -0700 (PDT)
Message-ID: <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:17:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
 <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d61d36 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=cPr5IrC0RMkJ9YLvWl0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NCBTYWx0ZWRfXwCX07jgLRr8W
 bF7rw2GSZQkU11B6dpW0lLoGb2rLFxpndLCsrn7FOi0u5OXbsCzKZESooQG3pI67P4T13QTt5WJ
 zWT96UYhOFJjbA25fh3fRDH7i0YCqe/9xXvT3TJxd7JZsZ5Dvho302VgAaBCojaNPwIipKItFLi
 V/+9yWeosgpQS05Y9GzmUYmXJmjoXk97gCfdh/iMVx2sObiM79lW35MH41B8H0IMcrxZlspR9kq
 ZXa5NY1cigVZ+uCU5LEQgyVsW0ZHwfp0cRBvBzZDO4j/PQ+odI36b/irH4Kn/r952UM60XUrDSt
 +iZnebjqmT0cSoz0DTjrSePymvBwEPQ5hYGruAoMS9Ox59a7f38bnDaa++lmkUeEBhB1wPdu+ND
 WefheSDt0+7tqws5EHjv1U1ASImVeEX14ItASBoew+T7R0gMWxmk6PZUxNLPQpqJE2qJQICS0yp
 Tg78G3MyeDjG9VvHN+A==
X-Proofpoint-ORIG-GUID: ja6-JBOjsHEA5Nn9pEgInECsb52jRluK
X-Proofpoint-GUID: ja6-JBOjsHEA5Nn9pEgInECsb52jRluK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-102287-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21E273B9BDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/1 20:40, Dikshita Agarwal wrote:

>> +const struct iris_platform_data x1p42100_data = {
>> +	.get_instance = iris_hfi_gen2_get_instance,
>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> 
> this needs a rebase on latest platform rework series.
> 
> Thanks,
> Dikshita
> 

Will fix in next version.

-- 
Best Regards,
Wangao


