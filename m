Return-Path: <linux-arm-msm+bounces-91195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAMcHM+Be2mvFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:50:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F317B1A23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A68C5300442F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA29285066;
	Thu, 29 Jan 2026 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odwVmYOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MW9lx+xe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B719CD1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701832; cv=none; b=Vzd3Hld3sMDdtScFc6XEyB/TnQG/L9RA0v+ldMEPxrPliatNwrCJbuq/2YsV68uwpebd4vJBPeLY3oYF9seTu4fejFuQmzBF4IF8a5dx20rjSZsnifYBGq1KT1ZQLuo9o54wIxwAy9m8yli0SLCQCJw41pke0Kn+fibX8VbqXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701832; c=relaxed/simple;
	bh=KhRISFZhCh2PBhuIa1I3iRGv9gWtlFhrslYGUwut7JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJ4Mlq59XRkP8KncOpy6z9U122DUALK78PaKBOoAyextkiXw77MJaVrV1MQlac74Ric5PO/hITKOZB8ZxVoG33oM0q0NkNBeTlWTsJPiDktq/JMUvEbmXZ0ypWIu1BoR1mLEXCEKrWaOLHG8fxFYmnmpnuYU7sv28usu/d4glOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odwVmYOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MW9lx+xe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAKsUU3674364
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJw2Xxnpngqa4TD4UMnudb4MC0uCGRAj5VSnlg70YdA=; b=odwVmYOBKWCBkt1A
	6TgAPJKndejKUV8a9eRQR4k6ZKUSC7t0sYEpX+qABFqPCDpo6wG+LxDEJxKphp+7
	/CkThqP0rYZVIgsFqo1jtlNH85OKwMsOUfekT3800PoN1J5NadWJtEDxH7No1IV/
	icBWKxBoapKzPp9vITAMbjXPfMwzYRQDdhlmSskZJKInqcNcMlQsrBdQH3281EHh
	JCqzniwzFXY6ec7aMcOeM+NQQGzHqfycA7Be+fk/djIbCTkoGPx90X6jrs/qLbr2
	JjqwDaoojaNpEFWMpGkKVoVRrxwGCp+FIY7A7Us9WvBjeYFLGwsjiD5ih4LQy2E8
	wvkgFQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05q7h10u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:50:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so736012a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769701829; x=1770306629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJw2Xxnpngqa4TD4UMnudb4MC0uCGRAj5VSnlg70YdA=;
        b=MW9lx+xeb+f4jf0NMbY4Qej5AY5i9G2FKTSQzSNn0Wd+Luw+DNYr4n8l0WhVkrFXci
         KfLGa6+6R9U9pB40E4fBKCSK8YkqQBUHr+pAssq+nC6saO+5iNadsVzl21Y8p4e0EDr0
         1QkowMCWp5LSh+48kluAvCrp2mTHfA8DvEzCkUUt/j1AuknycXDji+wmCAyF+LSlqQbf
         wTdZRd9D31PCk0mU7XE+FaI3RKmkToV901FtvOODTP1HrXu7MsrGNcDcqgvltkckFiDK
         OE7IXKtsHM2cYzst26Zzt9JHg/bwXw+M/U/Qe93pRLIeuelcGxOUUrs5b0KVS1UtsBOT
         4wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769701829; x=1770306629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJw2Xxnpngqa4TD4UMnudb4MC0uCGRAj5VSnlg70YdA=;
        b=oUwKrSfsr086+XeeqywK08yNZDSwhXo+POxLPqIq6TJDaSwrWkcWKTEE7gsXp2mifJ
         /BXfvu9Tt58MGKX01e5Nz3cJpRQSyZY39jJiY0t2N+r83Hpgzkd/wLDYpFZprAQP8vHC
         JK15Dc2DdxM+OQGDk+WWeFpNg4VYV298niCYAYyHc5IgAysEDBs9O+SFw25pFWEYbWKN
         KgoRDl985Rm68X3x5igLbQ768qrykXIxjsadtiJj1NYPamWnUkRP78ed533GC90eBYZF
         eclOS7OBYxz2ZyVknZFgiOP/xY5uyVrk/JrqFQBgkacD/RiiLh2EqOiWerE0cHIZ4iSK
         Bq1A==
X-Forwarded-Encrypted: i=1; AJvYcCXH/rdk1Dz+EnhUMNyrfqicl4LQN4Zb3ZX526G3MiuDqrgdBQC1rDs2rJj9QefAmVXemYAjQ/ueHitMLzTb@vger.kernel.org
X-Gm-Message-State: AOJu0YxOvEXPDvBKs/1HjEkZjVCmcNTVWrpH8I9ngDCNCZFlk+plTpWq
	bKkjjb+H1KPvnj4RMrkVWbpRJmMNAWOS+6rsl5UQ8b9sXLc0ABg1/OM1nhemhUcOjANKhsQ/V9V
	Yma1KnowyakGIgtx/3Mn97J1hzEOF31GLzLf+bjUqufCMmIg/i7kKkQBFgc3OB+9HR0S5gCFAqX
	7l
X-Gm-Gg: AZuq6aKBfDvOZpW/PtYIINwqhzrSY03krkGdCaP4hYpqLyUGZ/P91YROmcn+Pxv1Zd+
	X+ulAUtm0Pu3iNebWKbJX84Bm8x1JBlm+gYZKjkuzGK6HJhYZYP7ufXG7Gh6E8bdbxqgd7NldNv
	r56AwRODtYaJEDhu/F9FMel8ncRhJczXFnRlG/mxfT0YRVn8iEgtMIgasmXj9YPkFFN+U0rfa2t
	glCaMzX77czVrgIfmUvihF9OvWEMPQkZaxK9eW1lMQnSFMTx9jeDlPfdBeTdKDQfVC7InuXNBz6
	UlFfQOpAmnKYeNHfP2IOJlOlHf3H0b2psMjQY0pImANfsOQHfx+z5veE1/B/iD/ehmHB0NPulno
	bto4Z8wxWYBZpBmuya/LSGbMRjUGR9C6Wg8n7jxM4lA==
X-Received: by 2002:a05:6a00:9295:b0:81d:70d9:2e96 with SMTP id d2e1a72fcca58-823692c4b64mr9972780b3a.54.1769701829042;
        Thu, 29 Jan 2026 07:50:29 -0800 (PST)
X-Received: by 2002:a05:6a00:9295:b0:81d:70d9:2e96 with SMTP id d2e1a72fcca58-823692c4b64mr9972742b3a.54.1769701828472;
        Thu, 29 Jan 2026 07:50:28 -0800 (PST)
Received: from [192.168.1.2] ([49.204.110.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfd71csm5733189b3a.35.2026.01.29.07.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 07:50:27 -0800 (PST)
Message-ID: <49ad7aa9-ac4f-45b3-9b77-8902b414f0d5@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 21:20:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] spi: geni-qcom: Add target abort support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-4-praveen.talari@oss.qualcomm.com>
 <64961e27-e316-47d1-8ab4-c4868754adb6@oss.qualcomm.com>
 <700e3ce3-776f-4ee7-86e2-40608deffc0d@oss.qualcomm.com>
 <7c0883eb-3147-4b83-908b-b5c0ff909481@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <7c0883eb-3147-4b83-908b-b5c0ff909481@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1VJHkUQEuTldCW0WsKWeLuru9qjEOy8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExMCBTYWx0ZWRfX0Rdz+CY1Bbma
 Sw+9wHZupO/cqBV31e1YhIX0UfnmU2Sz6yd78jx1PmUP9OB7hYMN+ULQ+so7f+Q02IAXSJD6xSz
 AIH74rnWRv5/V+LPu2k/ZRhT2G4aB5maY2vpVMOphp7/874yOhav4AtefhhPE/2aep4AvZAWSz/
 UIMINj75MT49vjeNT4hcMDhI6NNDlS9CnZGx5/CgahqVqURIIPKAQce6PxugxVRLLf/yY/OhUt2
 O4ukv352y9PBjuTAqhMT6hMWYqqWIg4d72yvdAie3nR5cCIHBlLxvEy28DrAt7w1mGhUdXlBCW5
 p4urfzcbvvJbpscdVgVwIYby+p2C3pnoDA5MVKwFcmJ07wKT0FKpaE8VJdlourY9a/fAf1knYTC
 2unHSe6+bSdD4vWKRIHHR5an9412LYzahhMigp+lXYRQh/x+y9MqrzzHSc2sLX3xwBrTPeJRIN9
 2nQd/VfTEShsTJyFw/A==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=697b81c6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=hmzEZbfuJy6/QR5cQt8XuQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fMn5tOcbCyIVrqCJyPMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 1VJHkUQEuTldCW0WsKWeLuru9qjEOy8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91195-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F317B1A23
X-Rspamd-Action: no action

Hi Konrad,

On 1/29/2026 5:12 PM, Konrad Dybcio wrote:
> On 1/28/26 5:28 PM, Praveen Talari wrote:
>> Hi Konrad
>>
>> On 1/27/2026 6:51 PM, Konrad Dybcio wrote:
>>> On 1/22/26 4:10 PM, Praveen Talari wrote:
>>>> SPI target mode currently lacks a mechanism to gracefully abort ongoing
>>>> transfers when the client or core needs to cancel active transactions.
>>>>
>>>> Implement spi_geni_target_abort() to handle aborting SPI target
>>>> operations when the client and core want to cancel ongoing transfers.
>>>> This provides a mechanism for graceful termination of active SPI
>>>> transactions in target mode.
>>>>
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>>    drivers/spi/spi-geni-qcom.c | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>>>> index e5320e2fb834..231fd31de048 100644
>>>> --- a/drivers/spi/spi-geni-qcom.c
>>>> +++ b/drivers/spi/spi-geni-qcom.c
>>>> @@ -1009,6 +1009,17 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>>>>        return IRQ_HANDLED;
>>>>    }
>>>>    +static int spi_geni_target_abort(struct spi_controller *spi)
>>>> +{
>>>> +    if (!spi->cur_msg)
>>>> +        return 0;
>>>> +
>>>> +    handle_se_timeout(spi, spi->cur_msg);
>>>
>>> I can't help but notice this function never even dereferences this
>>> argument
>>
>> Yes, you’re correct. Since the argument is never dereferenced, it is safe to pass either cur_msg or NULL here.
> 
> Would you like to send a patch removing the unused argument?

Sure, will update new patch in next version.

Thanks,
Praveen Talari

> 
> Konrad


