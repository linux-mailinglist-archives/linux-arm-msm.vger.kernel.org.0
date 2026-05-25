Return-Path: <linux-arm-msm+bounces-109685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CQPOjhlFGoxNAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:05:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8375CC11F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6988730166D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCC83F39EB;
	Mon, 25 May 2026 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbkLqVgB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fu7eQGJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861413EDE5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721526; cv=none; b=Orsk1FDPhjGWLpm88Ia85+PJBGSDKxMHCEJ04H4/Y7xc5SQEZ+kD6JLlVX8Wucf39p8Npj60+HwmRCKqzI5SiMM458Ct6yFkgGyph+hqqdnVoWcfbDZkRkbrHWDcvQ5dbyTlJl29hynLjVpZc/4Xkirr/ubVUqtIfA/Vd4zjeSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721526; c=relaxed/simple;
	bh=SvebSh7tS2AuOA06cr9I79bGLooOlLFtdnYvUL/hV/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8k6kSk5EJsx2T70H9m+GQPWvCyuNfNMz+c8Rvgk5R7tAj9qAOmqNE1WqRdOg2TeaZ4lKO7Q2HdbBeHVpyVgssej5lCTlJho+BjoCj/CN3AhjTTC8OJibaNR1A9ZcoA0bGm2Jyrx3d6j+JU4MBhChEhL0qoQs2gUovq8L1Gl/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbkLqVgB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fu7eQGJa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PD3jL83604070
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRvNhN6aJqezHdDB1q8lLVpWsKKH9R1S7sWbg6xeLHA=; b=KbkLqVgBQCn9UX49
	OLHYMmjCcWaGcIIsbVMeRlP898ANbz6f6wkWjXcISYbSVYgsmesgczF8SyM3F7YN
	L9KcGb4ys4tSaiUf73Cc22h/KSLRCH7InmpUR6f6qShfDDZVRqIFO4baSSkewjKp
	xC3BLH1i/iUXP+374Mtp/epohZVxEGhycSrRzVSAI3Oj6MMQGJNMeTxCOmsjgzUo
	+yhK2D9XzYXotoZMwi51GRhR8uMdY1Zdd5B52CFAcBiQRhD0W5xNaBWSlTeJZtpw
	4l3YzXSMFYmPP+9p+mSx7Gk47tkMzDWsIgZTxnY+9dMrwcs4MohauXhVEBLDPm3U
	s1MtkQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqge0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:05:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so8922882a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779721524; x=1780326324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WRvNhN6aJqezHdDB1q8lLVpWsKKH9R1S7sWbg6xeLHA=;
        b=fu7eQGJamB4hkeUDXpw5YTZcWQ7btF/B8UYbnlT1Ue4oEe8aRJgm2R0ewd9xSubZk1
         0b1h3/EsAfz+3wCCyGPIByJ4l2WWcRzwsKV6pl2K7U5BRNHjvYoubIyZzMh3WyJRQ/jQ
         xom0QMKpy+qgBJnd9UmLuvb4JRrEHdHir/u0M8eNl4tl1AnPZzoLH+sKYf8Jb0iujb0o
         6Xo7Lz1LufgVYRdnnh4bHeMiTq/K3SWmHnTyD/ENaxyDhvNn5zJkOWgejbCe07XdOiL6
         +RbhdOzoti2R7+0jj4tE2XHE1i0YFYOGdnWGs+T1/n8F2Kc43esW8QoqFS/jAr+Qc9x0
         qjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779721524; x=1780326324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRvNhN6aJqezHdDB1q8lLVpWsKKH9R1S7sWbg6xeLHA=;
        b=QOXoxsSlJ7HWemwr+oT3rDaqr5Td0R4n43oeeK9AeJdqa75gesPX/Rjgthjc0LT0qu
         8M2SI7Qqh4c6sezuuRJbGCFjRNqTtRMGm6JBfQHvB0W1k4txnTMse4fTvYMy+X27Q8Y4
         A4Aw3aEiHdEci8cdBVHfpWje9hHWn/4QRPbQ0sXqkbQ6ekUg37oU11P0WXIKBBzk2wJ6
         mn8LqPZUGsgMTIJ/J14Wmz5EJPU3Lu1LTHAkXesP+dbuiyVoKj+oRsbR6TfdgN0+dOBR
         cD7On1pK09flLkDxlLgWzdfi+qSdqh6zbLzkfbrVwLpeoHCcHFngfdTB+dIetnSsCDTQ
         0/9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/KEyTSkOOaQyYTqlzYu3CvAoe7j7fsgWJ3FISCjHs8AHnUjwK1K3mn2X9HDNt4UwHUiPdfKt6zaXGqmrpX@vger.kernel.org
X-Gm-Message-State: AOJu0YwFwDUNVYjoIc4gZjp1enN51PmMSgHXTVUOLhBtVMsTYahQtTEb
	i7zYYn7lJsUVKmv68LtKnPihaXCCm5PVI6ivzUg4L5jir40tYmdTE5Nr0ppnp+39NgKOd8RsZoL
	v3NQ9Tkh17Cb8tvcx3I5a8Ar4J1z1R5Hg8JLbDjr23hNfnLEp1LgAArVV3yf9qGCzYGeK
X-Gm-Gg: Acq92OHqtJeD1X6eFnsGMN8B5b9FCQlTG3lYZUADG+bLHEx4Cl0kIeUk5aJz/LhK8zQ
	QCYZsl6CMA1MgOUUnMbcVsL3rulA5e3Z0q1dxf1EhmdFbI5t1wfoT9NGl4k87CqlXRSUit1WaWb
	f7fam75PHjxqVJvyKEig+525ELgzSY1pqx9h2PoB5JsvFlY4ACIY8ILTruUewLETjQMWdXX4LUU
	b5RRkqXtQ0tPPv+UO5lMwkQX5XwH+bKxRQ0hTJbaZF44OCsRYavv/xxDDDbHk9ry5hpLeVzSyiS
	puxJy1d/nltmKeyK9G+4p2eS4FB+HgQ+fgwSAATyUIfsEjNo+n25EO/wGDz1dup43oRCg4VTSys
	A/TByfuoAL0uCgKF1ESC+TBmgXYBBl/ezY+fU3ktJZ8WNtT2/6zwSFeiI1dg3OAdl
X-Received: by 2002:a17:90b:3f85:b0:369:73a:3266 with SMTP id 98e67ed59e1d1-36a67765ae5mr14177754a91.10.1779721523453;
        Mon, 25 May 2026 08:05:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:369:73a:3266 with SMTP id 98e67ed59e1d1-36a67765ae5mr14177701a91.10.1779721522796;
        Mon, 25 May 2026 08:05:22 -0700 (PDT)
Received: from [192.168.1.6] ([122.164.82.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c680110sm5197020a91.4.2026.05.25.08.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 08:05:22 -0700 (PDT)
Message-ID: <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
Date: Mon, 25 May 2026 20:35:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
 <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a146534 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=oxN+qIFH97EF7WOLwtTw/A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4ODDM3dy00CILyiZf4UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 9UXvnvscvaW9VFPvF243ubValaxndONw
X-Proofpoint-ORIG-GUID: 9UXvnvscvaW9VFPvF243ubValaxndONw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE1NCBTYWx0ZWRfX7hflxhB9SjR+
 qNfrsQ1WlIl+svQYHJfYwZjqEeJ7U6lXPrpkOA9YATixMwC2YpOowcaN6OSfCjPBDLNwKMEiwxP
 7lGWUEredyc63zGPxUMuwjctDV08Svu2SR0eONJFnZ8eVRBzGZ9zGsvHvsTfaI9Sr7gvw1zB48p
 zDh6CM/Te+XBLu/i2IcPRpGfDElgPWZ1nVLx+0lCaDUo2WVT6QRT7Xq+Xvxd9ci9kWEZ8NVihY9
 6IWVRA7S984DZWPc9QCkaOUKrkYtWWqGCFy/4lcR9rSMweVY3ghQCzm3Xj/Z0luL2tbebaiwPuJ
 DJV6mj8u7pEFAjbozgfa5pJvHjkKoT6q/kYed76x8L8WtzQ8CxbYpPPHs0OtZ/WGfZujZR0MHTa
 GGoXd2OFZjUe1V2o6GnOEbpaa4cBdIIoDjWNMQTjvzTO1M+yFFi58Zdrh82ti7MqEkXOZGXOiwn
 UDHz77Kxv+FYqc5+Dsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109685-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E8375CC11F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/25/2026 3:39 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy wrote:
>> Now that Linux has the consumer for the GPLL4, drop the
> what is the consumer? When was it added?

PCIe and USB are the major consumers, which got added with the below 
commits and landed in v6.16 and v6.14 respectively.

ab7f31a3830d ("arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller 
nodes")

113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")

While I was revisiting the code found that this flag is not removed. 
Hence I sent this.

Shall I reword the commit message as below for the next spin?

--

Since PCIe and USB are enabled and consume GPLL4, there is no need to
keep the CLK_IGNORE_UNUSED flag. Drop it.

--

>
>> CLK_INGORE_UNUSED flag.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
>>   1 file changed, 11 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
>> index 35af6ffeeb85..3ddd4b3aedea 100644
>> --- a/drivers/clk/qcom/gcc-ipq5424.c
>> +++ b/drivers/clk/qcom/gcc-ipq5424.c
>> @@ -139,17 +139,6 @@ static struct clk_alpha_pll gpll4 = {
>>   			.parent_data = &gcc_parent_data_xo,
>>   			.num_parents = 1,
>>   			.ops = &clk_alpha_pll_ops,
>> -			/*
>> -			 * There are no consumers for this GPLL in kernel yet,
>> -			 * (will be added soon), so the clock framework
>> -			 * disables this source. But some of the clocks
>> -			 * initialized by boot loaders uses this source. So we
>> -			 * need to keep this clock ON. Add the
>> -			 * CLK_IGNORE_UNUSED flag so the clock will not be
>> -			 * disabled. Once the consumer in kernel is added, we
>> -			 * can get rid of this flag.
>> -			 */
>> -			.flags = CLK_IGNORE_UNUSED,
>>   		},
>>   	},
>>   };
>>
>> ---
>> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
>> change-id: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e
>>
>> Best regards,
>> --
>> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>

