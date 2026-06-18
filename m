Return-Path: <linux-arm-msm+bounces-113702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gdr+GL+zM2oGFQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:00:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0872969EABD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:00:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XwG4iIMK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iBnEonaQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113702-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113702-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 041F83077147
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 08:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E415343881;
	Thu, 18 Jun 2026 08:55:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645E0282F23
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:55:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772921; cv=none; b=N/DPdJJQsjq/C0N2I3PeiyZU9JMaA8DJwrCkmgCC8eKYkqu89Ui7Q9J1lbRyGsOyqv5IVm1UsbbuLTfcXvFSpwxNJlgUGL/x0ydjXG0wMIs9mckv03znninl3rj9JI2D2sHwKn36IgNH0oka1B8jhkpzljTr1gXU/DI831JZPaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772921; c=relaxed/simple;
	bh=lnICbhLhzotstOZ8ZJozhEPKb2XQoYhegRFC/4ln0HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoF7uj1jtqf7LaseKeHfZ15UQGKENF1Hu1setUIJ28rZdQfApKeg+8WEfe2if4iW4Bgqn8k8g0xjr9Awg3kjN8HbtUNtqUR4j7OpR0mB9DJcKqJlOF181xu4wKtvZbomtZW5mKiM7bXwET4cXLTU6iNGGeOGAj56VCp/91r3WyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwG4iIMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBnEonaQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Fu7p1252627
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ogJB9t+p0KYYyOrWxZJxz3yT2aITfrtM/qLnmUX6xo=; b=XwG4iIMKJeZ2D+Hz
	CKfKP+DHGqgj+Ue79HLYNl9b1uAnxAyVTsqGpS+ZYY6H6+hAsJiLGFM1ZFPc5Tbb
	NBfO2vCD0dAsDs7w6wuEArzY3SV/QITueh556KeyMZJ5l3JLmZ1Ql96dKdNatZSK
	old3Go6fSNOhonoI9JnR/xj55iXWG3df+alv/cfHEMNdz/eUDMprOoqR46iaKgOs
	FNc8bX++hZjuU3fRdeKOFz00+ZhtMAwMAHBHmLmOi2+eDybolD2/04eErECuIYsz
	e3/5kuiLxcKNk8mkXCWywCZHHUlJpeJ+cHEHlgwIFbSHdohakIet0i+2JmNZ9QJv
	U11AfQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7jvad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:55:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccd69b9a10so1538976d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781772919; x=1782377719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ogJB9t+p0KYYyOrWxZJxz3yT2aITfrtM/qLnmUX6xo=;
        b=iBnEonaQR2w4BB3skIo30HZlN0FbjN/C8fuZh6UbSyus8eiCMIDjZtZYsA4dqfwJUH
         U7QSnmAnGvBlNVCl9zKhl2kTswQKNgR+/rV6qKymwgg4cg4S0re80mjqe76XDRzNAD2w
         OLZbZGIGy2tY08dPoaSjaI4k/oWmyVvVh0X92m4WCDJ9VrcTbbYizmquZfFS8tqTMJUh
         jE6PgnsudZRnc1d2lDHKsNN+Um6mvQ1v840n5Dhrmm4enBlPIjYtuRB9osDygL95U3kQ
         w2R8nEAOG0vo2P8tdcDj+zHbIMHA3UMCKG3torfhH1f+gf4DyF8MCvZRVBXjHkvA+UmH
         wEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772919; x=1782377719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ogJB9t+p0KYYyOrWxZJxz3yT2aITfrtM/qLnmUX6xo=;
        b=AVTPg0zZKCKbsS3XVIhL8plqRMYVf/TuZKtMraNOi3t/8RlxlY8BXV7fXglSV9/u32
         20IplAYX0NEPcuo+7HqJyXdWeWkRCJv/tgRCVjozMMF6RfFEkGmLmiD0d2Qo5q5Tx6EP
         XKdZp0V4YAnYyri+Lrr+lpPfs9Mxg+C/AnNwgc6XnquPEw1tghvWVrRQV/TkUFPnLRI6
         gzLuqeAiTuM72kEt58bj8VFhHRkb9ihp+TBbX3V82hjt6SbjkOIMCrdd6eNEIKGN/Xxm
         6OPti+dbVevp82oM0CstDgBjjwNsrMv03h86MhjHhnFf7n4SQgt3ywXRd0VvOWfrN5cl
         +gIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TD4DAz5mQth/ffjwKF8u+tYJnMkfAh3WW7GsGDXsKU+a+vfEmACgvH7H3V4NLCiRHo7AoYDecRkiIwMlu@vger.kernel.org
X-Gm-Message-State: AOJu0YxwB/v1qcq9iXUnN7qiX0dGOu7Chz9Y4QX8dCIOBFH7D4g3EpPH
	8HniMJi2tlzzbdHeTHmGZcnPIyyunONHaFD90yBiRG0MbyQxWwEvHExk3wOUWZfvp2EKc7/A1vu
	tyGt55406sfZp2IbmxlrJL9CiJCzTtR8xKGNrBo0gRDCjovSzO1Xu9+U7lKY3/656R3Kq
X-Gm-Gg: Acq92OFMtNsdQegSSVeziEUopkCj7MCkxkaNRcb4/DuhjVBMMfJ4rshcl/agFk0LYJW
	rcDC9kiRk9HSPpw7ACp4swElHaB4KI8U6Cwhve5d9AIF+jNkIHYk+fMSVJ24ywMezmyafSodeP3
	m2itj4lZ2uQsmbjoL1tDEV9VVXd5ZRt7mVTvcKxS1QdYojaSYu/ZA44NhL9Ccdj6FbcfIA89G/S
	wiP66f9A5OBYOnFT60JWtVqRlxncUHLKA3azgg4JLyWyxcjP5+11qaj3rHUXSLnNvV8ZR2LK4qd
	+0I7FyzEJPfir1xWxHfxa3YUNdTgYvZzt8Bi395TUciYdJnewVSG+UqxY5TNa4PdLmsWHa8MYn1
	nnsCm+o3phir+7+DV+/UPmk4ZCK6q8QrVJDU=
X-Received: by 2002:a05:620a:19a7:b0:8f3:5988:f97c with SMTP id af79cd13be357-91dbb8439b9mr682170485a.3.1781772918877;
        Thu, 18 Jun 2026 01:55:18 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:8f3:5988:f97c with SMTP id af79cd13be357-91dbb8439b9mr682167685a.3.1781772918343;
        Thu, 18 Jun 2026 01:55:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0463a2d1f4sm407481066b.51.2026.06.18.01.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:55:17 -0700 (PDT)
Message-ID: <9bd02660-c6d4-4c3f-bea3-95b87eaf57fe@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:55:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] serial: qcom-geni: trace: Drop redundant len field
 from geni_serial_data
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
References: <20260615-add-tracepoints-for-qcom-geni-serial-v5-0-2efa4c97e0e2@oss.qualcomm.com>
 <20260615-add-tracepoints-for-qcom-geni-serial-v5-1-2efa4c97e0e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260615-add-tracepoints-for-qcom-geni-serial-v5-1-2efa4c97e0e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX/2OUgVMebQhK
 OKoC0tj1Fgpe152BoWhBQyp0WVzgCDessV/hQHpZOGXhpSpOCR4hLurCys9entUepEoL1IYbypY
 lZDLB038sfPAJCZk/SLbYwdvakzQpZeD2FRJyJs3apylOdFeEMX9/fYkipSUTDLRxf47wIBZ67j
 7GiUTq1OUreDW8TLTf2O/Gagi4k7HHZ5r1Vpt67mjLIsBDvjimCehEAX1ostINi5Kl27qsVdXYv
 nvabDQ3o6Bv4yOjgcyoh8UMFzG+0sWQX9gw3irLYpFLtVuOKxOUEggKPWrQt/1Qweoe0iK2rAJK
 J8ZcMDX2MEQbwSor1/dUJQEubmvgKjoh7xAee2D4DfiTbrenzCUHBu0FTr7guVq1/YBKwiqp/2X
 7ghBBPcNSETcpfFYG8sOd+WbH0l/eT428FyQh9DbDDGmtOUHA5kCRNAD5A1m2f0LB+/TyhcjOoh
 X2pJMTWaR310pg5ZZQg==
X-Proofpoint-GUID: BiYf3t74y-Rd4YXHmkm_8MnsRs32jM6B
X-Proofpoint-ORIG-GUID: BiYf3t74y-Rd4YXHmkm_8MnsRs32jM6B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX7tD1dpsFfI+b
 9HYqugNrlB3WaXiUHfxPww7HvY2boGIBYw1SefCZXkx3yZq7DkjxCuAC2dzNRw6CiP6rxrA4ckY
 qdCRKNQmAlLHu2IukyV+EIR/Y7gcKTU=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33b277 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=meVymXHHAAAA:8 a=FD2fNTgVWL2COFQd-LoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113702-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,goodmis.org:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[rostedt.goodmis.org:query timed out,linux-arm-msm@vger.kernel.org:query timed out,konrad.dybcio.oss.qualcomm.com:query timed out];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0872969EABD

On 6/15/26 4:16 PM, Praveen Talari wrote:
> The dynamic array stored in the ring buffer already carries its own
> length in the array metadata. There is no need to also store it as a
> separate scalar field in the entry struct.
> 
> Drop __field(unsigned int, len) and the corresponding __entry->len
> assignment, and use __get_dynamic_array_len(data) in the TP_printk for
> both the len=%u format argument and the __print_hex() size argument.
> This saves 4 bytes per event on the ring buffer.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

