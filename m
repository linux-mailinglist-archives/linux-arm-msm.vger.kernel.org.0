Return-Path: <linux-arm-msm+bounces-92249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DgMJXqviWndAgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:57:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF25C10DD8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DA7A303012A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030AC3659F1;
	Mon,  9 Feb 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d17KUXCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHM3CFat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B019C2BE029
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630750; cv=none; b=Wh3fvphBlswqUPg8IpPTgRx9szWDeHH/qJsGA0PaI9IAuyzpe1PBTUS02YfqtfKKJR8MYPiuFQ96uJkOUuSqzNf6xOR+mrcV/IzlZltDy/ndDUwpqFzE99JkUJaJYTomWguxYUoDBpC7VMmbi/OyNGoT1vVcyrRXpAXKzpZ6RwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630750; c=relaxed/simple;
	bh=0O9mNQfPf4t+Os+tsPyXDG+ed0f/xt6j41TaQK628R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UK9xIWTdoCZl9RS7PKC12LqFUKaq8MtW1ArrZ+jelgCnBRVVDc93/+mzvvVAYA/ThWCWtYLm1SP4AAaedvcXdJ6AOwnS1NRqCqGbtWYNKQAoz+Avo54HtNYzFdRJID5/VIFzCzTVI9VX5o6I+OwZQwo9NnK3TaDzW9/Y8RTHBM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d17KUXCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHM3CFat; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61952pam2587029
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPqaQmc77LREJ3f/zUnGH6aW2dazfKHgYzeadJPl/Wk=; b=d17KUXCLG5pIlm/1
	R8oUghAsh2KXhm5Ric9D+XFyyrL55rggiKPVVOET1lv224feo1/VJ4J7T2bglrkZ
	SsDZqUeMXFEPJnbA7zBraRdQnRB5Yus2zGSs/K+Rlz70t/DXs7RjGy7eQ44aR5ON
	L/HVq85HUbypk9PtRs49iGSBiaHLT+s4e3y6gN03GKc373OyIR4/qrAahQb9WEOV
	IXpk0Y2hv2FZKs09hqDHk5ULMSwV7T2xhzuITKYgTvJqrDxtqZgEUoGf7Kn/S95F
	E1wuw0EVjMvKI+6F2EwIK2T0JXIFva2hLPQaK3aUfQlDPn19cK5knP+3T5/XcsmB
	c3Dv7g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bgybq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:52:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8243b286ecbso5402895b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770630749; x=1771235549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPqaQmc77LREJ3f/zUnGH6aW2dazfKHgYzeadJPl/Wk=;
        b=RHM3CFatAuHby2nH0KqTUPiceNIPvNCIKewMwVfgzzw5Hf6rKVN6jhjT369S7gCyFq
         50T3QmGL7ElQs8tZhL8BEPd14CT3G4cpiZE84YAXnvjbqcmZOgM75mBqXC/rul7FWT+r
         Tw6aRbtxLMWsLhnmG4vD4ZPmU1nblsqo+kArVxFv1GtZMbKK7MvDWavs5ALo1oTtmRKv
         vdroD7b5JRF/XSoZefBmuhKktoCFAJsoW4+6Tuv4jUfpR4tat1rai+qxyB5+meyGt10B
         B1neiiEjj0h6w8BM7PyLgqHafP1zt+/ENreg6uuEdNNM0dUbm3RUdcgD6hi8FqZPwTiz
         1gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630749; x=1771235549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPqaQmc77LREJ3f/zUnGH6aW2dazfKHgYzeadJPl/Wk=;
        b=RItBqiIpC+ucQXTnXDqrNeD1cn3rCPge21MfD5b0Wgg/wQTa8HvNBul7GWo+x0v71H
         wF1ymwobAR0nbZLPh5qMJHeQqpWXsmwAne2G9HIWenSwxciYZb243kH3VIZAu9ubBScG
         kNfQMgtRcKtIcV6Dr2f26X+ANOuC7XfHeD9GJJYYHXg9URar/Xog/HzcsJ7B6fpA+uH/
         fVLYg4LwWQDuZT/33uia73FMCGtkyB6x+VC28hvDUY/ldCmRwbIH5iKolPEddOgEnoKt
         RsLsa6+aPPj5Top8RUqFH0leYO6nxoTN8lB7PFqCmKQ0+kDaMbKX44CVXtjUIg3XaJSO
         ME+A==
X-Forwarded-Encrypted: i=1; AJvYcCWqM8TKCuWKYyh+QwL+KYVHuES63mUwVzoREZvyMtuotfQbY1akU9smaMIhSmsVkFXjQwZ+Sb088Twrs7s9@vger.kernel.org
X-Gm-Message-State: AOJu0YwSodrGASI+G0fj3IuPZ1JKPFYSCKgl2tsU/oaHPQW6GtVADvyJ
	Iv6ocv4t/3m3wyal9SVVhMRyDu8TAoppWMF22juswl7EOs93zrFNBJqvSRJxEHnELEs7rQZQHkQ
	HFMHJO1ug1LqwJ5GpQ5VfUT4q+Q5CFSfYwsfZDvF6ECrnSj+jPjKdiPWU9+roatu+HzUa
X-Gm-Gg: AZuq6aKN7AP5AZG+wU7OV62TNnobehvRl1kLuCUEUedsFeRF5GiMSLKlLnj880IwfYa
	kNB8yANfDT17voqvheUfBifTTBZJ2phrFhpTVO4jt8UNi76hVbNI8n/YZh2SGFKWS+a/O85z803
	zHL8haMCuVOdlsPBkj2mhDp4ao0SVl9817bDfop0qM3tsVLdi9g47NDFPvCqd2w7eudlkk4roKz
	evBU4PiviNmepNZGsSDZVeXc5hWOgf+/C1Vc3hQXCgjkG7eXBMl1zrZCn/kFJgQ84KKWO6XCnWa
	hcmGHvEsEd/UblKTnvbOaPdWiHH6pg7HRtIvHrmSzYW8rugwZstnhttNfMM6juRt4RXedJ+zu+W
	dFNlAtb75eNr8qSjRygZ5TNur2ULC8WM8hMuncCwI6AuIQQ3bQipuZ5xP+Qege1Z75ZhKW6MQZo
	X5ZWU=
X-Received: by 2002:a05:6a00:1a06:b0:81f:3c34:fa78 with SMTP id d2e1a72fcca58-824416350cbmr9379315b3a.25.1770630748607;
        Mon, 09 Feb 2026 01:52:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1a06:b0:81f:3c34:fa78 with SMTP id d2e1a72fcca58-824416350cbmr9379297b3a.25.1770630748095;
        Mon, 09 Feb 2026 01:52:28 -0800 (PST)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418ccb2asm9531929b3a.58.2026.02.09.01.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 01:52:27 -0800 (PST)
Message-ID: <23930db0-730e-4f99-a661-262b15f1a8ac@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 17:52:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo PHY
 configuration values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
 <57bwrceuqejzliljhrzj5wfumtr2q3dslgmjj3vd7masafi4k2@dskfnosor553>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <57bwrceuqejzliljhrzj5wfumtr2q3dslgmjj3vd7masafi4k2@dskfnosor553>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=6989ae5d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=n6yyXkIT8M5sXNEpEagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: bj16el3_HG0AvghJ3TpQCHJH08DFwXLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MiBTYWx0ZWRfX7tp6mLPFuBtw
 3CpBdvpzXuS/fxhVW3G793UniFQYDuubg637ZQT+TcUtIY5VkMnjBZOKQUSInFW+xpPCAV5Gz4W
 tt2vIo4HFPJp1wY+nMCflXjk3orVlg2uKeqeaY2MJpu3lVWQ38mi0NCeVaoTXt1zMImRQQS6jtF
 QnzO3OKW/FEEhXf2rvYatWQl5JBjt58wMAllBlsuGD5du+mTvHmKgyFZ6YYzJBZhbylxTSejHL3
 stVDlX9KEmKWTmUNzMdBMEPUuo4ToSkXF6W7b0GwGj3BqucmOcVbUeA3Oae8GCH+0Da1z6AuZog
 02WO3HXqbs448wqDM4/cNfqjax0qP1LRRVsz7JtUp/Pv8axHJgjpONSRtYlxB2dtM1v+OEjbueB
 izn2yZr1tCbQgtS43JtDkhzKtH/gH7//9jXce2hk0hbJPthyS6MiAG07xlYCdWdzdSv62+64thN
 f3zKwnE6NCKa05fo0uw==
X-Proofpoint-GUID: bj16el3_HG0AvghJ3TpQCHJH08DFwXLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92249-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF25C10DD8E
X-Rspamd-Action: no action



On 2/7/2026 6:22 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 05, 2026 at 05:20:53PM +0800, Yongxing Mou wrote:
>> According to the current HPG settings, most eDP/DP combo PHYs can reuse the
>> same configuration values.
>> DP mode：
>> 	-sa8775p/sc7280/sc8280xp/x1e80100
>> 	-glymur
>> eDP mode(low vdiff):
>> 	-glymur/sa8775p/sc8280xp/x1e80100
>> 	-sc7280
>> The current driver still keeps multiple versions of these tables and
>> doesn't fully support every combo PHY mode. This patch removes the
> 
> See Documentation/process/submitting-patches.rst, "This patch".
> 
Sure. got it thanks, will remove "This patch".
>> redundant configs and keeps only the sets we actually use, matching the
>> platforms listed above.
> 
> Should it be combined with the 3rd patch? There you sort out all the
> tables, it makes more sense to review all programming together.
> 
Hi, if this would help with your review work, I’m very happy to do it.
My original intention was to do some cleanup in this patch—correct the 
table values so that more platforms can reuse the same table.
 From Konard’s comments, it seems that the HPG table may not be the most 
appropriate one either.
Maybe shoud first determine what the correct table values should be.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 41 +++++++++----------------------------
>>   1 file changed, 10 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index 13feab99feec..10cbb7d9a8a0 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -116,17 +116,17 @@ struct qcom_edp {
>>   };
>>   
>>   static const u8 dp_swing_hbr_rbr[4][4] = {
>> -	{ 0x08, 0x0f, 0x16, 0x1f },
>> +	{ 0x07, 0x0f, 0x16, 0x1f },
>>   	{ 0x11, 0x1e, 0x1f, 0xff },
>>   	{ 0x16, 0x1f, 0xff, 0xff },
>>   	{ 0x1f, 0xff, 0xff, 0xff }
>>   };
>>   
>>   static const u8 dp_pre_emp_hbr_rbr[4][4] = {
>> -	{ 0x00, 0x0d, 0x14, 0x1a },
>> +	{ 0x00, 0x0e, 0x15, 0x1a },
>>   	{ 0x00, 0x0e, 0x15, 0xff },
>>   	{ 0x00, 0x0e, 0xff, 0xff },
>> -	{ 0x03, 0xff, 0xff, 0xff }
>> +	{ 0x04, 0xff, 0xff, 0xff }
>>   };
>>   
>>   static const u8 dp_swing_hbr2_hbr3[4][4] = {
>> @@ -158,7 +158,7 @@ static const u8 edp_swing_hbr_rbr[4][4] = {
>>   };
>>   
>>   static const u8 edp_pre_emp_hbr_rbr[4][4] = {
>> -	{ 0x05, 0x12, 0x17, 0x1d },
>> +	{ 0x05, 0x11, 0x17, 0x1d },
>>   	{ 0x05, 0x11, 0x18, 0xff },
>>   	{ 0x06, 0x11, 0xff, 0xff },
>>   	{ 0x00, 0xff, 0xff, 0xff }
>> @@ -172,10 +172,10 @@ static const u8 edp_swing_hbr2_hbr3[4][4] = {
>>   };
>>   
>>   static const u8 edp_pre_emp_hbr2_hbr3[4][4] = {
>> -	{ 0x08, 0x11, 0x17, 0x1b },
>> -	{ 0x00, 0x0c, 0x13, 0xff },
>> -	{ 0x05, 0x10, 0xff, 0xff },
>> -	{ 0x00, 0xff, 0xff, 0xff }
>> +	{ 0x0c, 0x15, 0x19, 0x1e },
>> +	{ 0x0b, 0x15, 0x19, 0xff },
>> +	{ 0x0e, 0x14, 0xff, 0xff },
>> +	{ 0x0d, 0xff, 0xff, 0xff }
>>   };
>>   
>>   static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>> @@ -193,27 +193,6 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
>>   	0x01, 0x01, 0x02, 0x00,
>>   };
>>   
>> -static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
>> -	{ 0x05, 0x11, 0x17, 0x1d },
>> -	{ 0x05, 0x11, 0x18, 0xff },
>> -	{ 0x06, 0x11, 0xff, 0xff },
>> -	{ 0x00, 0xff, 0xff, 0xff }
>> -};
>> -
>> -static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
>> -	{ 0x0c, 0x15, 0x19, 0x1e },
>> -	{ 0x0b, 0x15, 0x19, 0xff },
>> -	{ 0x0e, 0x14, 0xff, 0xff },
>> -	{ 0x0d, 0xff, 0xff, 0xff }
>> -};
>> -
>> -static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
>> -	.swing_hbr_rbr = &edp_swing_hbr_rbr,
>> -	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
>> -	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
>> -	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
>> -};
>> -
>>   static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
>>   	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
>>   };
>> @@ -564,7 +543,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>>   	.is_edp = false,
>>   	.aux_cfg = edp_phy_aux_cfg_v5,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
>> +	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>   
>> @@ -944,7 +923,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
>>   static struct qcom_edp_phy_cfg glymur_phy_cfg = {
>>   	.aux_cfg = edp_phy_aux_cfg_v8,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
>> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
>> +	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v8,
>>   };
>>   
>>
>> -- 
>> 2.43.0
>>
> 


