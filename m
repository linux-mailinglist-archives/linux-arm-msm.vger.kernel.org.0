Return-Path: <linux-arm-msm+bounces-113202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cq1WH5wOMGp5MgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:39:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E55FE68740B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:39:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V2rJNPHY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f+1akzKb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113202-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113202-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ED81304497F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEDB3F39E1;
	Mon, 15 Jun 2026 14:38:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D933F39F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:38:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534294; cv=none; b=nsV6Oe647/oOCov16/xH37/9CM1CQnjs8Bd6XSXNFMzNbjeCHgUJW7DymP4dOQRCgyMe623Pw3sAseP1bvjUoPZYgMqo0z9yWYTwfs80u7JX9fEx3ckvbT3CaOsXrdIaipE3aRPHo8+DkziDaW+cFTXFvVNJfQFZ2HSMsLtJPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534294; c=relaxed/simple;
	bh=/dqmKEk8IHcyT64dAazScoiyh61y6MuCEqGtr0TDgeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBe8bvbNX60gEsk75yVrCKWmVEozcS/g9avuBDNskf+FRYTXQuJ11FhrpVTmUpF5JlGw6z9IYR1xT/wMkmzI8Xku9PFYHZ3lRbriZpqn9Qyg6+03AUgC75O1z4Uy37TxonJxpsWMfyMhPzY24pSFzFj1Ztp9kemLRc1eGyrEuVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2rJNPHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+1akzKb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FEav4Y773340
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2J+LVI+c+0smqU6fvzbOLf0LFTi1VUdvON3SrgIXMag=; b=V2rJNPHY3yu5Fz0Z
	FOjU9xPe3Dnhh9j6j+NjNeQ3APHJ7rR5mMP53L4026uFMAcrGKTJWoLR8Qtm9nTC
	GJSxHfnkAlo8V/vdBxt2pXf89myXLuFv0iE+kh2bpZuZ5hfGn8DHfBoVlNzqsyrs
	lbSasmHddLicNNFRm40ew2oFrwe4rwaeo77KxkIFDgLFIZIBtkXaKFQFfs3Og2uz
	Vj1x0AMAV/6ncfqKDAepLHVNptZAPHTL3Nf08oYLvE6WfFbkR1tyDlwBWg8dOG47
	8i0AADjYCMfxJHw1oWkrelC5xF98DS2+US63hhyVAcVU9tb8y8frhkH9ZmQsL8xD
	XP+ALQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegus8wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:38:11 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96397de26b1so112761241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781534291; x=1782139091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2J+LVI+c+0smqU6fvzbOLf0LFTi1VUdvON3SrgIXMag=;
        b=f+1akzKbzeTw4IUBkfz6awmNFWnXB9zgqMa6UXAR+ekxVM6BYnc6G5WOm5SFzWzlCc
         lZTNcKpi79Rk91TKkZs8LTBYqiElPl/Avr2ddhi2+H6BtsGFbftuKcjxhP+M/92E8o0t
         hQg0BC5pRQxYIxHteiLSXKQccDzW2+xj4WX409+VV1ddPdnvT7ptmw+3+0OXh7/U9MXB
         30/UdsqdOWZ/781LRa+jtPd7skedd0PPepxG72itNZ+2yYuwWuhzWDylfLsFnTGPjZZb
         Wj+85ZQCf3Ccc6IvVx0Uur96kmcAqe3Ygla7GB0YnikqH6K/SNucTfxiC0L4pugofc7l
         GfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534291; x=1782139091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J+LVI+c+0smqU6fvzbOLf0LFTi1VUdvON3SrgIXMag=;
        b=NVREiAGjtJFaoIS+ZWKl2lRqCTt48JD7i0W/DtqylNg97tPw/PJwuvdT+dJjixHlpu
         xZESWnZNxqbKcVc6BQe2n3COYBHM8Jr5SjsMrLgJFAyuF1qbfZYx+8vJazwMjlV5hg5J
         4/dPkE7izfaam9Z1++3fyyAzlGwsw/u5lFt418Sm773QKsGf2QMoyMW1cKVW/SGRZGq6
         WZ623zf709tzSkPjvnfhgo2e3/39p/h3OhP2Ir4d84jqiZql/dib+ZiXopfLhR3b9m1u
         JBg4ixapXrlr8EUAZ3kvfU3w0S/HdwzOz9NcDjWj7bpMf2G3oPu/UE5f7eABYn3rqaEZ
         utJw==
X-Gm-Message-State: AOJu0YyTHkKtSO5nD/4SHYFtKz1J9EGHWv+2PS1N/rlggZhnVXXPVhAO
	OXjZw4R7xIuaEG/5jsaKWHsmGesCObYU/uwj4I04aw11WBp90ZjVx9DTSpFQMyvHQoyrTW1BNBO
	Y/pC+5J3AGKB5Ru775G/aQBtsGUEGenj04pAWYvS3hNiOhynJO4+s2+QuFvwFnJ1K+IElV4I848
	nQ
X-Gm-Gg: Acq92OHsH8kxKuCCl0aXuPsDEME3ZnGfAR7O619Rb7060FvbTvgE17LOgTMsNM7bzI6
	jPs7cE/Sn0i2T1Ykrml1Rn//s7qCahMOQm2dj1v4uHgSoG/nkQ0av5HmcCe8l4e2JtIdg8waUSJ
	qTKbj2gSk0ntR/kIgpCSYthB+l8R7aNnSaL22C5Lkcsx5mq1EFeQVs4uZkF9fnx4K7weMgdqBi/
	rbE872Jnt9AuG2LTUPP0j6qZgfVqRnfS5B5pkrmnHkv7ct7bCaZDhystLuALCPMiZK9mGDJ7sgM
	J3hFvpRlEdphYC4QTt9pw/HY4e59ZLCotJO0FJTPZiJ4kOHULRIE/tjH3v1Cub5hS1lLbtMDjkK
	gRvGNoXKN7QMNr4ffBw95u3YNiKoRXP9vj3g05zizWqkp3A==
X-Received: by 2002:a05:6102:3f06:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-71e88e6c8d2mr2467506137.7.1781534291091;
        Mon, 15 Jun 2026 07:38:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-71e88e6c8d2mr2467497137.7.1781534290655;
        Mon, 15 Jun 2026 07:38:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe5116f409sm453354266b.23.2026.06.15.07.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:38:09 -0700 (PDT)
Message-ID: <748147d8-0145-424b-b147-67d92154a989@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: qcom: Avoid assigning thread_op_remain in
 unthreaded test
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
 <bf77fa4c-168a-49ac-bfe9-87880b0bbc9f@oss.qualcomm.com>
 <8b110f90-2001-4655-856d-ec8cff98fc0a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8b110f90-2001-4655-856d-ec8cff98fc0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1MyBTYWx0ZWRfX5drp2ebE5Vtb
 VPmZBG+Zrez8AGlHriNgjm0koNL4CDLFfL1rFvdbddkKFeivXhriwaf0h1+BUqAo4oQ/s1TkWOp
 0F/GPbsemgnbSXf5TCNz73sTELkUJ3ANNCMqWsjgWU50u/p/jZPkfuSveqJudRBoXCFJogFqJkJ
 dREaU5gpBDA53gB/U+jSFcWS8JnLMXnELPTtaNa8xXmmCvIMZ37dswwmSwBcum0Gtfo6BJqvVUu
 46ch3EM77Ut5VtuTWvay2uyoatt9zqruANiUNBebM7CjzCUl4PFZ6sDrBgIAhZM207cTz0OQ6tW
 bkyuGX9o52J68eW5iLgOkGDmWS03qDatsteLl881tSMwXiwJUX6nQ893P73Yb9oUIY87l+gRa+y
 fwSFrcvLaSYUzjmwMHdB7kjilqxCpfOZwCcSRVgqCw9lxCMtxsM3Y2XjuKeGUdAgBbRvWDIesf8
 dsIuA1g6+iZEN5646Jw==
X-Proofpoint-ORIG-GUID: WXdsgBJUayKeLCHcP1OVsLiLNJGAaL6V
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a300e54 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MRFKDVH_TV9PNoJzvMIA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1MyBTYWx0ZWRfX1TyUvbZdjpZ3
 9cWoG5ZT0poUKzTyDpP7/5UajLJgooqRHZgi60KFdtpXiR/ged9iLclEJM30LxgX6mWWYx48Ufs
 pFryGbFJHce7DdjdzXHmaZAw2FWG3Vc=
X-Proofpoint-GUID: WXdsgBJUayKeLCHcP1OVsLiLNJGAaL6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113202-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E55FE68740B

On 6/10/26 8:16 AM, Sneh Mankad wrote:
> 
> 
> On 03-Jun-26 7:28 PM, Konrad Dybcio wrote:
>>
>>
>> On 29-May-26 14:55, Sneh Mankad wrote:
>>> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
>>> variable is only used by the threaded IRQ handler to control the number
>>> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
>>> register a threaded IRQ handler, the assignment is never used.
>>>
>>> Remove the thread_op_remain assignment from
>>> tlmm_test_rising_while_disabled().
>>>
>>> This does not cause any change in functionality.
>>>
>>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>>> ---
>>>  drivers/pinctrl/qcom/tlmm-test.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
>>> index 007d6539ceced294e81cfbe93a00c75a98c858de..e9e04300ab3687825255885821ebde0f3ee586a8 100644
>>> --- a/drivers/pinctrl/qcom/tlmm-test.c
>>> +++ b/drivers/pinctrl/qcom/tlmm-test.c
>>> @@ -521,7 +521,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
>>>  	unsigned int before_edge;
>>>  
>>>  	priv->intr_op = TLMM_TEST_COUNT;
>>> -	atomic_set(&priv->thread_op_remain, 10);
>>
>> Should this be setting priv->intr_op_remain instead?
> 
> Should not be needed.
> priv->intr_op_remain is to indicate the hard IRQ handler how many times to toggle the GPIO line within the irq handler.
> Here the test case does not require any toggles within IRQ handler.

Oh yeah seems you're right

> I also found other test cases where intr_op_remain is assigned but never used. Will remove them in v2.

Thanks!

Konrad

