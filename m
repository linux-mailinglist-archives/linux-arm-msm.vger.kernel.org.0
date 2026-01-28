Return-Path: <linux-arm-msm+bounces-91063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULi3CGQ5eml+4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:29:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6A6A5B5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BC9130BF9FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CF0313E23;
	Wed, 28 Jan 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZqSl8XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPMlbX9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E18331B131
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617350; cv=none; b=M1IX9XA6uSK9dt0y7dNjp5HzQCtCY3Jhrknp1DGhK9W1KwLl7f/i/KmkeANDcFsXL7V7l2G2+zLmour1xk9gz3cg9xsGTRTKMuOZE2pqrFNQWp2+5u4+te6/9s0z4GRohLYQzxgkC53LEZigcQ3HZkEkSI7/InODwkg7iDumpTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617350; c=relaxed/simple;
	bh=BFmYWAlpvFX/+2manpRQERqUJt3ncwaRQx6a7NzM0fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCR8qG7f23lJXznujJw9EElvYHizlp6GljZ817jryRCdYqLO+SNt5DoV5V3CsATX6QlY6PvCwd5MjaaFA0zYu1CmElTBquHLkmNFH5vbVZ8IWaV3hFfuj+pI4WLFqIWRAa93ax/q7nwMVtouDdXBz/FYLRC3uZfxUDO25V7mwEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZqSl8XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPMlbX9j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFWZbF3247450
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cm4xp5YKm3EkGWrIxhnF9M2qAJpvBH5Bb3MxePIzadc=; b=hZqSl8XUYtd3AQLc
	YU2K7rkc7G7GFzcXuBhta+OFdFVYBNq+/eFjkoXlICR6KTDHf4TfD+/1R1w17ZC6
	bXQge7sXQxcXjOKSRfK4Wz/0jENVluooQUuzcVRNnohqAORvVPzmeOF60HCMlAHs
	bwFEOQ1EjaFNXoXBmUrS6GYaZPuY8sumMRDHcEmhhzNkYPY4CIQNiYQsVA9lOgOj
	oV2Qf1sLVshf9AXkuqMAew4JU4oSGGw0emAKckNr6hv1/KrxR6tFo9Pt0PMXeuhK
	J3M37nZrbBhGFKa1HL4w4JC6VAGJz4352Z+i+lroXCwoMsqdLuC+WwnBy6ID8DKi
	PQ7h1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk23cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:22:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352ec74a925so3306265a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769617347; x=1770222147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cm4xp5YKm3EkGWrIxhnF9M2qAJpvBH5Bb3MxePIzadc=;
        b=FPMlbX9jI/clA/DaeEuOBE1swu4GwqnxQDf3rq44rY6pRGqIj0JXn5MOV40uBFTcvh
         YiBqHeNlyZad5A7UDgxAzCkmpjvSSpRpnbt+xlctc5+HF0YhatKcYvngGxKjvEOrhyTr
         XlE6iPsRgSkBi6W2NQbJu2kusbZ7AzKIE/i5B7kWpRf3xal7Nkh54VbZqxt1OUbFuWoc
         MnR1BJTlHhaUq6x4XCfyf1fbZDycFUsuWS7TBtgnF5YTTCKBl1IlRNa1zjAdUtuZA4I6
         /sviP8z+2kizJdgL/rqckA0qOHY676pc+l97f2Ofg16ost1jJcF6gi5sbCCUW78/tK5F
         hxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769617347; x=1770222147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cm4xp5YKm3EkGWrIxhnF9M2qAJpvBH5Bb3MxePIzadc=;
        b=MPtVHLcz4aGioQvD3w9AF41DpPB4/bpxIgn8bUROOl/p6HMZzlTUFkZOJOST9hy8H0
         mlKe3piIiMs1N8j84UjLyukaOl+gOuQ99AUrtoVepu9TC3kH85LzQ1dVyQ6B8c5Z3Ybq
         H79Cy7z5LlbX3VHJbnSNTLKOTooe7w+80p2md+4qt1hoEx3X4f4lQ03RCUul03W4j3HF
         x3+HeczC5O/5KUYgratnIqGD+TLvJ4aGUK41xxiDXcKHUxIU3aXBrhUO1bVU4msqb6SJ
         pQXqx8hLW7xZsfDtMiSXu3jWf4a8fCaLjRYCyWT8crRQfGU7fYXG8ye0pZUsBcZguVjC
         moIw==
X-Forwarded-Encrypted: i=1; AJvYcCXR8W1imr4LfA9n1f539z+aHUBAxpMkc4qBojIMvbcgnWkJRnePWoiRd5arv/bX7U+QxrDKaifVV9aJqr6G@vger.kernel.org
X-Gm-Message-State: AOJu0YzeNWNRv9NI5eoXyXmx7OtGWSrPs5KGk9AsmD6t0U83FpL0Rkh5
	qX/0qgm2MaC/MP5Nn+Y1DY0o5nuap5cj4dBRgqH1bD1BHcl9pnOF76zKn1c7opSMUojcrQKqilL
	gvOrrwhc+V6ZuNbNJQcwiPnA2Kv3ZLYgmXm7GfrmdK/La0fdwZDkbeGbTcrEivTjiQ5LF
X-Gm-Gg: AZuq6aLWvClE3CdX10mDqbZCkVfHoiNskuqKS4gMxRiqB6j4HcGxoBr9n6kxkMZ8PQ/
	x+Uzm+dfPKKEhjLsS0kpXbSQ8IqSo5ITggVefQOhWG14K2O2/g5s0/qD205zYq5qAnVQFfMVO+t
	48fLUY3zLWyZE8qEgZcSumMqJUFER5T8zinkQsHn1LsVaaVyUXusx5o7/LWEYx1A3oU7R9T5B8I
	jD7LpmEb77/kFlobxyREeJGn+K8wpEo2wggD/Hq1zmNwWMFfI8uZKbHNL8weuDhpfx9c1PXkKuM
	Gcjg7V7zbkXX5F7mtR5toWjqzt+bka0ZvZPyz6874YvsyXFwIaNZiSP29GLIOVdB1L+gIa3qFBc
	6jlFa3i6MqlIb4QpEHhQ08iAJ3WSsMORDeApwFCMWoQ==
X-Received: by 2002:a17:90b:58ce:b0:341:8c8b:b8e6 with SMTP id 98e67ed59e1d1-353fecf4952mr5634297a91.16.1769617347135;
        Wed, 28 Jan 2026 08:22:27 -0800 (PST)
X-Received: by 2002:a17:90b:58ce:b0:341:8c8b:b8e6 with SMTP id 98e67ed59e1d1-353fecf4952mr5634245a91.16.1769617346339;
        Wed, 28 Jan 2026 08:22:26 -0800 (PST)
Received: from [192.168.1.2] ([49.204.110.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2f0283sm3487846a91.5.2026.01.28.08.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:22:25 -0800 (PST)
Message-ID: <95bdb386-1635-4f8b-84dd-b5123d271b7d@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 21:52:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] spi: geni-qcom: Fix abort sequence execution for
 serial engine errors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-3-praveen.talari@oss.qualcomm.com>
 <9d9d4d3d-42bf-4f4a-99d3-19df73f89c30@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <9d9d4d3d-42bf-4f4a-99d3-19df73f89c30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzNCBTYWx0ZWRfX44306QLYFijv
 RPhlbNM0tqqylhjG1AxvRll/4sVe4DLLlebFV4b6ieH9Y/dSeMqUI1mgR/M0ePDb/eOyvHAhat5
 9ldPadV9kja9ax14CG3PMMc73v5rzPluhWvyMQ23oHKK1b+rv8jcMGNbgF9Nz+X2X3/rDLhH35t
 FeBp7jIzU/1204UD6HDoDjpb4+0VFKLf8XBbwTh2byerXyqXuMWwlmhH66bxJloKCBAMoM5GsBB
 EpmrsrF2z+R0fq4INhoBx7g3eIZ+wydwOEd8m9KhXXeLNH3c0AxORN4si12OkrkRN1a09VDScDj
 /prgipkEriELMvlMNjxc3M1MCMzfl83Pb/v3RWNki9yzZVTUzYwddQSBKjFDNsqoW8JW40/8jB/
 c5lxKvEpMluS8lP3gkmBjnXv1gRInRTgf22zS6KoLNNbPRbtLyGhHrdB2HzEyqbOPfoXOvfD2bt
 Wz8d6RDdASZVDUO2ZGA==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697a37c4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=hmzEZbfuJy6/QR5cQt8XuQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Lg4E7-zU6_iSQFpiOd0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: i2Gns69fv2oGwlCJk2Lv-wwTrFVmxypW
X-Proofpoint-ORIG-GUID: i2Gns69fv2oGwlCJk2Lv-wwTrFVmxypW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91063-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC6A6A5B5C
X-Rspamd-Action: no action

HI Konrad,

Thank you for review.

On 1/27/2026 6:47 PM, Konrad Dybcio wrote:
> On 1/22/26 4:10 PM, Praveen Talari wrote:
>> The driver currently skips the abort sequence for target mode when serial
>> engine errors occur. This leads to improper error recovery as the serial
>> engine may remain in an undefined state without proper cleanup, potentially
>> causing subsequent operations to fail or behave unpredictably.
>>
>> Fix this by ensuring the abort sequence and DMA reset always execute during
>> error recovery, as both are required for proper serial engine error
>> handling.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/spi/spi-geni-qcom.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>> index f5d05025b196..e5320e2fb834 100644
>> --- a/drivers/spi/spi-geni-qcom.c
>> +++ b/drivers/spi/spi-geni-qcom.c
>> @@ -167,7 +167,7 @@ static void handle_se_timeout(struct spi_controller *spi,
>>   		 * doesn`t support CMD Cancel sequnece
>>   		 */
>>   		spin_unlock_irq(&mas->lock);
>> -		goto reset_if_dma;
>> +		goto abort;
>>   	}
>>   
>>   	reinit_completion(&mas->cancel_done);
>> @@ -178,6 +178,7 @@ static void handle_se_timeout(struct spi_controller *spi,
>>   	if (time_left)
>>   		goto reset_if_dma;
>>   
>> +abort:
>>   	spin_lock_irq(&mas->lock);
> 
> Now that the jump is just 5 LoC, you can dispose of the goto and change it
> to an if-statement

Is the modification below good?

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index f5d05025b196..4feaf24d47ea 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -167,16 +167,15 @@ static void handle_se_timeout(struct 
spi_controller *spi,
                  * doesn`t support CMD Cancel sequnece
                  */
                 spin_unlock_irq(&mas->lock);
-               goto reset_if_dma;
-       }
-
-       reinit_completion(&mas->cancel_done);
-       geni_se_cancel_m_cmd(se);
-       spin_unlock_irq(&mas->lock);
+       } else {
+               reinit_completion(&mas->cancel_done);
+               geni_se_cancel_m_cmd(se);
+               spin_unlock_irq(&mas->lock);

-       time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
-       if (time_left)
-               goto reset_if_dma;
+               time_left = 
wait_for_completion_timeout(&mas->cancel_done, HZ);
+               if (time_left)
+                       goto reset_if_dma;
+       }

         spin_lock_irq(&mas->lock);
         reinit_completion(&mas->abort_done);

Thanks,
Praveen Talari
> 
> Konrad


