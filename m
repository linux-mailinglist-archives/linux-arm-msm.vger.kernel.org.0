Return-Path: <linux-arm-msm+bounces-101633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLgBOUSsz2kPzAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:02:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C6393E2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53F653058E13
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 11:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE283BED25;
	Fri,  3 Apr 2026 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu6050+v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9boV/P7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EC93BE178
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217575; cv=none; b=U0t6um0FYIJxrxztfQLEa+MInP23aU6e3H/KgY3+OUsi24a4SlYi8J0nga41oCjuRkR+c9uvyq2n2Hyh45cjT/4z4LS2/gkeUvyQ85KGjCSwhJPjSzr+PS8gNbNDTYfjGC8JeFPOZd99WSIOQ3g1alRGAk7VoocF7d3SpOHHigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217575; c=relaxed/simple;
	bh=DkiKVfGKmwuAwr2izbdAbcwMKG7G5cWwKW7/OtXtPjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQoTrywwGyIk/zfDdG8nPr5FRgEu7GR6cGwKy3W0AAm281zYrK8BXctvUZG25r0ZL+QBgIoNGzfz+s1IpMT6fW5ZF/ZXNgKvwQVgNUlqgcjTGC4W+7W0FGgwCL/Sfyl/GHcSuUhcus7CPO9rKAOrrHRfDC7GPyfTG+SR1/ekUgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu6050+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9boV/P7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B0IUX981389
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 11:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rIB07DV1tdm7k7+UufYs3koTVO8ALZL6SbpGjd2EXmw=; b=Zu6050+v33fSurYb
	B79waiPVN101Mz2YzL1sxEtcUB/b5HUnle+CaoW9IGjl6l8jxkDSHJeoGi1126W+
	p0AuZFDvN2jjcjrmlOipi+oejSILpSvp8AXk+GDxj0txNLK4C89uLo/idK/A9DPF
	NUZmM/4HHf4iUoGgtoNmGheeZhrZeYOTV4xwZyHuhW36/nlqiJjboj/H7Y1EryEZ
	VzO8BFW0a/ILZ5ICGP/G569lIIuPt7xZiKA2QRg0FPavOq+O9YZQi4mTGHaIoWLT
	RGRNg2DofWZPINLIuqSrD/7/POo4h+MjTZK28ecvvfUSorNoMDh+3xeAv9LSAuZ9
	bphxhQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupudy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 11:59:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso1354393a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775217570; x=1775822370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rIB07DV1tdm7k7+UufYs3koTVO8ALZL6SbpGjd2EXmw=;
        b=j9boV/P7pbTxPC5eMHmZN3vCKGyUQV6/mnbOWt2DCmVsNerbPOJ/PRc0AhR3OUp88H
         Zc17ntF5fNrIxvO8+UY4j8HneWzO6MPvA/r7zaD40f7x4t9uQTZxF/tmj5bczcAwio89
         DFRqpCGISyq0o2ETX+5yLfIeHgXnrtQrvHUph99n2c+8xKBY6TyXxETS0laPjrbe+0Up
         x12Fgi6hST5HUTsUOkgi6kf8z8WbfLzCJdevjMDZdGP24zDgXN2+HEOyriMhaiscqHFc
         YndyrgOWrsoT16gSe7EwD7SC9gZDkkFlFYos5BqdJCM6KnAm1SPr65s5WQSx0nyJzSJ4
         wCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217570; x=1775822370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIB07DV1tdm7k7+UufYs3koTVO8ALZL6SbpGjd2EXmw=;
        b=sV03oPMhCD7TXJKLKeF+AtWhrQ6+qO5a7PStb6hefJdXojVu6X1ul56lmkiNWv7Mwh
         Q8oDKOBPabtyTS0+uXOtn01XRGVoFWbuGRcK8gwVCWhq5BLphi5AjAiCDZ62fMgTLWFN
         RIwsoLD0h+jU7y4w3rM8UWBN3bJh7q44N95PhAYAvcmcaoENSFBCKEmqpsrKxtpwK6Qp
         5s3xJhbC9mXLbzM42uHTq3MFIT0TwgBIuWDZlOUC6FROj+cTvhV3us24qQdO/1Yu3IE/
         fSuonf9eVowlqCqGRQ8e/I8DUs9KcipW8FLsQWY5dAMR/o06w2HY/fBPT3A/kI4xGSSe
         4qPw==
X-Gm-Message-State: AOJu0Yx/a78+D7pWXutXiC6crzPX0Unypf/7xdVx/j1mxLNxHy0y1BLp
	s8sscyKykBzrqzJm4dHecmxa6v9fVtCLBmQJS4ddjnkevDz4bfuhJqUjXKaqtNzHQwaYLx0Xw1e
	oAgBQMa6+yG/PhT5yd1cMXnsRSEYL8tr6erNpyX259tu+kwSmZfqzhTbXdQY9tLxf71QO
X-Gm-Gg: AeBDietaiaSP3VNe7M3+QnOaYmCkjagIGTiGrK6SdS4MWtSmJ9EtQZgh5qH12FCbWe1
	aIYo69KnYVB2NhOP2u8DtrofOsNoxsDoaaQ2UTZvdat2neE2F04ST7WhNnZhIFigtX3G+BEK3GH
	Nw6euwxGCHAEptZw5z/rrBym89SvIvoz3Z9jIqn5VIomT5vR2vqFNW9cbfayb4DUl4EF1Js7n8Y
	MSd7+MXweNelnMf7mSn5fvYKjBdesoFBB1+xMwFZwHsiW1rkoiA4vcCfUsTbh+2H3zS6rr8KQU6
	XF5J5sjZpLRcCnRozJvPdqI9XGsOd3SYrsQFtiwF2BEzE3O3MVdIq9a4lXlRSrr4lYEjLNq6sgU
	Ah0QajuW6h7aMWI0CUjGwCxm5I7H3zAkGbTu9ImLmi8DigHV8kP4=
X-Received: by 2002:a17:90b:3c0c:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35de680b3efmr2179732a91.12.1775217570575;
        Fri, 03 Apr 2026 04:59:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0c:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35de680b3efmr2179717a91.12.1775217570111;
        Fri, 03 Apr 2026 04:59:30 -0700 (PDT)
Received: from [10.92.178.97] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9709b8sm10103955a91.16.2026.04.03.04.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 04:59:29 -0700 (PDT)
Message-ID: <57aa580b-c7a5-4cba-af5c-bce3d692310d@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 17:29:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request
 support
To: Bart Van Assche <bvanassche@acm.org>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com,
        nitin.rawat@oss.qualcomm.com
References: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
 <20260327090346.656324-3-palash.kambar@oss.qualcomm.com>
 <97050b9c-7174-4402-a1ee-66269f8d8b6a@acm.org>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <97050b9c-7174-4402-a1ee-66269f8d8b6a@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEwNSBTYWx0ZWRfX2lxJjGnCkuUQ
 qcGwaRs8lvv7zRJMtJwbSYwaFT9N3FnSyZooAUaOtqVkDGrxGKHfySfsCgsk53wB1SBismzNBzJ
 Ic412Jge4PphnI5ieMUyeizUMmV8gfzEXYhKa4lf+ijDBS6R592ngvDxnFiAzvxPpjw2Lubtx8K
 c0MJ16rf2HGe2Ce06/n/bdTF2QIhQLuwQxVa8QsLR1/W/7nFCveVgc2qYF1KKO4GQJ2cxmWVfXN
 QqSE+2yTN1NJ9pHhbFsDXAwJ42ign4X8LgLfhG6/yr5JRDLj+66p2snpMwMZxzVnk9EnNuOWnBD
 93KtKvOLKQJjyjHKbVlpI/rzTdEHrzcIOxGWdcpGwVd30IVuqULFL2Clh+UqpxEVnR2dmQnuV2y
 xvYk4ceyIwZid1T7mkbHOHprCaZbyjIprS4wPYNN7vaUtxk9QfRGz6AGpC+untKaT5HHYdCAU79
 HaI0S9l1qewuxgtlEUw==
X-Proofpoint-ORIG-GUID: rqow7Rb06pqxSSQod0u1LgxY7y_d527E
X-Proofpoint-GUID: rqow7Rb06pqxSSQod0u1LgxY7y_d527E
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cfaba3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3zKRCnpXH6Dit4Bn3WgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101633-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 616C6393E2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/28/2026 2:52 AM, Bart Van Assche wrote:
> On 3/27/26 2:03 AM, palash.kambar@oss.qualcomm.com wrote:
>> On platforms that support Auto Hibern8 (AH8), the UFS controller can
>> autonomously de-assert clk_req signals to the GCC when entering the
>> Hibern8 state. This allows GCC to gate unused clocks, improving
>> power efficiency.
> 
> What is the "GCC"? Please expand acronyms that are neither defined in
> the UFSHCI standard nor in the UFS standard.
> 
>> +static void ufs_qcom_link_startup_post_change(struct ufs_hba *hba)
>> +{
>> +    if (ufshcd_is_auto_hibern8_supported(hba)) {
>> +        ufshcd_rmwl(hba, UFS_HW_CLK_CTRL_EN, UFS_HW_CLK_CTRL_EN,
>> +                UFS_AH8_CFG);
>> +    }
>> +}
> 
> From the Linux kernel coding style "Do not unnecessarily use braces where a single statement will do." Please follow that rule.
> 
> Thanks,
> 
> Bart.


Sure Bart, will address these comments.

