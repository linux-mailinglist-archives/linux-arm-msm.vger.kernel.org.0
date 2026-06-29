Return-Path: <linux-arm-msm+bounces-114936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n5fxMN87Qmqe2QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:33:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F66D841F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:33:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gdVUrzwM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NHjAdlB2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114936-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114936-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07BB430087B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C903F822A;
	Mon, 29 Jun 2026 09:28:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577EC3BBFDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:28:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725302; cv=none; b=HtZzCnxe9QBpgwNwBCpNUStuuxfpUS6geyRKqb2g/rhZ6guArFS4gP8Kn4ePkuutClF0JT5opHdHY6LT4YcP4F0B3I7mG/o1eBLJM5miy5ziw8MT4EBZ5MGU6Ln8j2oL/rdoEY/WtLC9ZdrHImlxbFb5lk7oNPzPh2Yh4Igb/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725302; c=relaxed/simple;
	bh=G1EUklChKiQ7C7somywmcjwpAJ57sBld+P+KNJZ4czQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=di/9VK8um839a0oTES5xjwIiwG4CX4yqkj1Uoje1gM3lbe3m08D0K20+SnuBHe1PIaV6V6VTGJHcymNqrV6J4BbiGsvQOT/rzgYSAkfHEpM7ChviHfvzeVvaPtO5tcx2w9/oHMDxbo1eMN0uIOS+vzcrQL/i/GEZk7aiQFa87Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdVUrzwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHjAdlB2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r1tW2076291
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nEcPLKx1wWYryOLqYNcv4+ejFRpUuBS4O6Heh+SQc9Q=; b=gdVUrzwMgWkZgpbO
	oSCM/6FDeXyMCGfLfvJ+tbY3ATUknyQb14EcHBXP0ulcxeqOslCjtTAS/YkaOq+q
	iIt5BYpknSDnJMTqwBPbCKPszxrGjkGRlxg3P+z7NC1fcqd8Z8ovYh0QAQ12SLNw
	Z8w2pqQb4RNMCNwLxEL3lJ+gyqXGTDALoLmwXa6ZzEVA0LYhALb/vshfG0R2C62E
	MPQONhDJ4ZGDEOAR2ofYT4pZ4LrOLatBAzhjkETI+9z6rr7yMIgYOixmrnIeQNiZ
	84BuqpJNTNMhc79rGNZsLijCZRpMTE6AK8tLftYHKbCB+EI9cZTxqSu+jXx221XL
	GcXZWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gnsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:28:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e44728825so46280385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782725300; x=1783330100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEcPLKx1wWYryOLqYNcv4+ejFRpUuBS4O6Heh+SQc9Q=;
        b=NHjAdlB2YT5qRXra9EW7aTmgPCf0IKPT00UEPupbRtiX39C8wCbRgR56yEAshPblSl
         3+vpYjwCvXxPbRUGYVzAzBQ/PIhVuFnls5ogLl32OUzZrL1CieeyfHE0mgFYQnbGzzZP
         v4TNR1M87Q1Y7iZ53badUNrG23wF2FdAIDGezl42rpcDDqfbUMHWTTNyhqaJUajGXWIh
         ord+Zac22z4GXXzqRzyN+ZH3UtCH4ZdtFOER7f6EmONoaX6GkICpV4McpQYZoXHpN9TT
         SAvPv2lQoa8k8dEfbcKah+T7PSB53pFYM31T3ZF3gyUZVDYSZfF3PhEXmMBPPlO3ZoQ3
         Q+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725300; x=1783330100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEcPLKx1wWYryOLqYNcv4+ejFRpUuBS4O6Heh+SQc9Q=;
        b=g4jsBtdxAkGbTu50DzfoCq9pJXglUm+PbSWTjVlUwrOrXRoNEHHxmxxEFtngXf1eQ5
         bQIDoz1KmqlyXHHvkjQYTdK4bqyHXprYd+Wd847owaSXkfsbuMT0ZUbel4l1GuzeRNgd
         VpizSGXVT4m48lg+6qWflITvPgIbUJMpHnrrcL4RTgkCCkpeseaPHtvhTPgBJljPck4X
         i9qwR1gLQRGTzdE3KTbBseuzEaXXZqmTJSveZ6Si3OTEzeVzotgXp3XLliJ05PcJI9xB
         a/OeTs3T73iTLAPCy+3vpnUHFY9JMIy/G81nltighuo5lTRCh2wMHMMyVOHLwSeNzY7B
         P7EQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bJdLstIw5VCzWOglHhHJVg5ytNjq1J8EG+OSpR1NqjxVyGH3Doh4z2l8Ah0xgScwbMB3ML5fcoa9stOt3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3V9vn0nbiORAvcmiORRjOkcjw4D0nQr3e12zsj7muJ7tskcbt
	DFTH5GqCx+lHavaVBBPK0GUHNrF6Yw7UnwJ200kuTkywVt5PJKjA61c+UM2MBekVbeIJNPTX0b2
	J49iqVe88fzJIuxPyBOAlXDtMXMy6tEMVI+dPNPc1DQ+0k1viFN2/ytmdQ6zoiR06Wk7fESPpj9
	h5
X-Gm-Gg: AfdE7cnM1QrHZf+66g+Ch+tDfPldTcW9XTALGIqrD5FNrZz4aUwlzIotRV8H7kwMU+q
	u4Qg9UEQHxT8ec/n1+CQGAQloCnNv3tZoVbIzhvX7lnqs+CLmgGftmOgquQTmLzNZ1HWvG7XfPG
	Z1fbL2NQI1w5+7Y4wQ0ksOWTg1sZFhWU5U4rCVc39DlKXdKaIhSQazV3+PLBKQiRp+0AqUygY1K
	llbD1D4PeHGPk1DcfD1izCqr5fyzBhOPcdIc4Q8iUrbxWBdhKWBjFoJh3jc/+wp2l/riW/ZXER0
	64Ic/Yat1m6g1UOBgYD+p7bvJz5FTvEz3mz0xOr5fov144rLB6/w4hMvCQqwv/Og2P6YGrBMhr6
	G3mzHVFjCsyaD0QXTTHcriG6GIy1ymBgM3QA=
X-Received: by 2002:a05:620a:3f8f:b0:92e:5ba4:b841 with SMTP id af79cd13be357-92e5ba4d0e2mr41002485a.6.1782725299550;
        Mon, 29 Jun 2026 02:28:19 -0700 (PDT)
X-Received: by 2002:a05:620a:3f8f:b0:92e:5ba4:b841 with SMTP id af79cd13be357-92e5ba4d0e2mr41000285a.6.1782725299029;
        Mon, 29 Jun 2026 02:28:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12645b62e4sm153791666b.6.2026.06.29.02.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:28:18 -0700 (PDT)
Message-ID: <77dd2139-d687-4c6f-b082-df325bc4cd4d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:28:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device
 tree
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <2aed327e-abf6-401a-a05b-ba3f4a5cd7f3@oss.qualcomm.com>
 <20260628082005.40036-1-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628082005.40036-1-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NiBTYWx0ZWRfX+HxXhSvmsuXv
 /U/J0ANg8JnuFyJCvA4SyOgSysmCzk/g6xngMg1uquO49x5ReKSAPB/9WXa2kFL3NUbx7OPljer
 9kB7FKFXeyoyXLcuBlSNRQ58OJAC60g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NiBTYWx0ZWRfX9wm/5hKLW7SO
 B8fogvuNWDb/RYCAdZYlQ0ehgFzI0N4GbATbSpz46bzaar1PcRUbPjLC7K9OpQlXx9Ny6ZNJNox
 ft+SLFzsElMErmqmuReZtuxpc0NCJj36aVTho+TESHnmgOaWCK5/SLTx7LjEeR7zT9RXrAExmpS
 6F160TqsELgmhQYQU0yDm/KCB79CkhXDFQvZSmmTGhYsq538gJ+wzsJppst9g1/TphsoxGjQgVZ
 0bTyX8wLaagT8AInQh1NYsLuw5TURML+JuPCmH+TpXUJy0lztLmUpvBBlg/pEw5dsrt6iIMe0hx
 ssZp2TSxMT87AgOyFHLTR51fSLDlCLNdTgb+00rkS+MzrgomYo8eksY76XKDTsbP7VTEB8NoXXy
 oqNnT0xNNhtEZDfoCiEi4zGFGRCizV75twtqiOxmDkmeiWQIUYY/S44hBaw0IV/JEioVWbBTbJ7
 MYET0MrHRYK16iPffYg==
X-Proofpoint-ORIG-GUID: F362ZnAHSWcaGl8onfGBGMCDS76UcOfN
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a423ab4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-hlgHtOIqNyq9T1fpdYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: F362ZnAHSWcaGl8onfGBGMCDS76UcOfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114936-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mail@etehtsea.me,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 674F66D841F

On 6/28/26 10:20 AM, Konstantin Shabanov wrote:
> On Wed, 24 Jun 2026 14:10:10 +0200, Konrad Dybcio wrote:
>>> +&iris {
>>> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";
>>
>> Is that a model name, or a placeholder?
> Yes, this is a model name (Intel variant of this laptop has MRA-XXX [1]).

I'm a little surprised, but okay!

Konrad

