Return-Path: <linux-arm-msm+bounces-97876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ATlDhzNt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:27:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5A296F86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ED0C3009156
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93001386C05;
	Mon, 16 Mar 2026 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="War0LXQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdjdJica"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586DD386577
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653240; cv=none; b=a+rITW5aliJFXCB5fVICmwXSkl7eIkjPXdHbkcv/x5oTpyNzt2geyEj2lyteUl94e0p0tMlDStSnbzfkBj7slIwSpii3RiKbvKQSKrHx4cr0at3RaBdBIPiYLt4LEAj2d3/pgTLCryUVc02+amFXuxCtmWZePpF/AniibVPEkFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653240; c=relaxed/simple;
	bh=m20NV7YPDGEPnyJy9guKx8ra6fkNvm2ZBvh8TyLifBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaSJ6rusEJjQBdPWhax21Fv0dgJyggc5nGK2TF50OwrhnR8ePENmXSBZP6zHrhAePEM2oprULv8+jRcghFcEyzS99ZcNTRsGWktpUwyQV7KVzwjXFeSiEoe9mBFHxFWxHA7Ou+IJ/TL61bV78O6KzxF+qfwwvdZDrzbkNXUlPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=War0LXQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdjdJica; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64diL3777662
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yea+5C9HO2jmK24J3rUgeOWtF9taHgrTpJT6HV5pjcA=; b=War0LXQ2OqmTETeK
	oQrDwMJd97kxbD3kyQrxIlvZE9o5Dw9buSyVBGDL3YuphUJ/5gT0VKLjllWG/Wzd
	05eGYwiJMnSf/G7NyisFpo1rJAbG7dHvmXbS3fQDsFeEHDauDTqwbxI2FT9g/1aA
	J+PfXZTxkwATAE8hydHvIx21GZPTLhTRYuJX3ZouQzfoACtFddB1+lENaUOV+Uvo
	gQUxgCry8Rk4GqMQUccGOUQkEWFbOiqVx12nDslIdnX98TzS+7lul9Gc+SqlEmK4
	zFus/YJ4nu2JwTP4GYO0gudC/YEw+XWAEHmYq2aRuCc4f7/eJJOV/PbAJlDi9lbA
	IpL/lA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7vwjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:27:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso278111685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653238; x=1774258038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yea+5C9HO2jmK24J3rUgeOWtF9taHgrTpJT6HV5pjcA=;
        b=RdjdJicagNtzUka6vnVT+rEPlKm3mN7HrAZ9yvfSn5Nn3GH7gXiOr5dW+vrZ7sB/Ok
         PgxPj/WzOntferIrfFZsdBf9AvT4slIvqQVSOoPkeUvYFiPBsDSJd1a3QlXh2Bg/UJPB
         0r7/r5xYqFyJOGBhxwhjfqgpHeO7YNdCeDfD7f2yoJ+rkgp2fOK0s7HHmYi5jRARePiN
         wqpCsEfV+ynysO5hcOxsiw6/u/ji55g5d+GxAg4rTqMTv/anybW+pDEBceQWt6ftroG9
         fhjDeQbMGj36a83Sp/+wbmDM1+s5lKkb/T0vmM8yHRgq+lA5XQKmTvGtyWgtx6GrI6vX
         YmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653238; x=1774258038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yea+5C9HO2jmK24J3rUgeOWtF9taHgrTpJT6HV5pjcA=;
        b=jmroDxHX9O4my1NI5CTPR4REvqUzktFulXsOpSA2G9FOERiHj+jBDBATuZwPq1i7DK
         dHN5xJWltSbBpPQ+RLro0qH37T4Qyh3bPq7aUr8IzIifbKb78jrCROFyA5ENmky5jNKV
         4Cj9OQ3QO3qSXc9A+KsA1i2rGB+hMM2yybmp9A21fEm97EUjkkuL0V/PMguAd4aofN/w
         OQ69MPmtYGgq6QckwYj6hicQ8xvRTuJiM+75Dm8A251Wr672QxTjysbAzkKiOnEnINNA
         Ua9bGOeItdzvvwExmKVSMdriIf/7guoNW02crZmKFPLOit9U8ojz23HIGeln4U99bEHV
         nBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd/rYZwG4noI8v+a9qaBLgeQJ6Em4Ny+8x8JuzMDLF4z5cuWAWnjTmeKl6m3UhOEOHwUSh5J8VFgGWHpuH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqq0uNLkO5dQSTEhapc6fDnE6QMHv9w36puJzOcOkiwiv8ZC0e
	PwYsQ7mfsej0CaJq/cJe5BrK6hX0IJbZT6b4m8XWaXfCtlrH0+F7ngoPUSq3UHJmyAPWKGdj+ST
	KxVkJTp+pHShvO1iF3a36pMMU2JOvqebnHZx6HNWcq1Zi4VkgDxSJpvQOwNDeZcHZY0mO
X-Gm-Gg: ATEYQzwxx/BrcHglQ6h4kbuKqBtVoxd3MnUFfNmmL9lfI7XtQtHBd0AdV/WDtXxk1l8
	L1RrpJGJV9k2/Y7VRqNA6Ot/G2FYpvrjQhO4RxI6Y36DWPL69pMpo+gxQ5GOHmLG4tRbdvmlfTS
	SrAyXKwdjDhPJal09uQZrhI2RkjHVhI9iUpCq4BZE0di3ghx18aJgD4V/72R6MKSvFMmOvsyNo3
	ZLsIjDijiON3Mjm+d0slBiFWG04boSHosZdkFRIHLAbgCU4ESGOCxZV1SNtKsJif5VsJEIiIkra
	3r1LasMvDN9Vf68aK96Y9kk4xwdOc7isE/Z07YUgE6RKvAbkqH1pzVUGdtDz5d3Ly5vtV1OdW11
	FA3OB5NcvT7UD/MGH7I3VdwIsjxI/TzN8rtvh1xse5ttXyw0hNjrb5bcarVs9MURaENiujAuenK
	OWBm4=
X-Received: by 2002:a05:620a:4113:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cdb5baac4amr1099346285a.9.1773653237646;
        Mon, 16 Mar 2026 02:27:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cdb5baac4amr1099342785a.9.1773653237104;
        Mon, 16 Mar 2026 02:27:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d6fe24sm4815442a12.29.2026.03.16.02.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:27:15 -0700 (PDT)
Message-ID: <7d8211c5-7b12-4349-a329-cfb51a918a1c@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:27:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
 <2f4e4cc7-2600-482e-88d9-d4b20d328a72@oss.qualcomm.com>
 <drcot4oxpea5lnpa5htrrl2n6tcc4ocxmb5vsho3ocouvajwlo@6ueabivtjy4h>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <drcot4oxpea5lnpa5htrrl2n6tcc4ocxmb5vsho3ocouvajwlo@6ueabivtjy4h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YcXlHxTz_CmrpLs838mFzHtZ8QqWtsgT
X-Proofpoint-ORIG-GUID: YcXlHxTz_CmrpLs838mFzHtZ8QqWtsgT
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7ccf6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=i3U1ZhqbavsoaJQYhn0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MiBTYWx0ZWRfX1wLImuUegw48
 c/fI/ruzQg+pBHbjySaPr2czns0IItE4fU068gf0BXecCfMIQ6Piq/Q7gC3fT3qX9bCZTVWvlIm
 UUD0qLQlWNyNoUr7eixh+qIwHzQ/Ci/N/IQNxZ0YICGsct6TulNfxrWTvVLx4GxbSh/3QecX1SV
 aqf62lyi1xkeIqCHvX16WaeXaAAl4/mb4jfEDUs+iOAmatj5aROhbaJFVxU3REgdCBl+eJub18r
 FaujNUeBC+fQEUhlXwYm1kYxVfC6zaizApHiI906fB/93HUAGDlE5SUhLj/jXzrn3c/UUAObwjz
 /rhIzGpvQl5U0vYxO31xJfaAyvgMMQGIvI0a98SVddEEu72l4InKx0dLf4KbEd1qBEcWaxlA/Bl
 y78yK8hs3K0781EUHdymPyEuzaQJsGgkdl2R617Wsef/HVl0zAFmS0/wAoITprGYWa0qOWJM3Hb
 /h2IghYYDJqgN4sYtsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-97876-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: D8A5A296F86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 6:39 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 11:36:26AM +0100, Konrad Dybcio wrote:
>> On 3/9/26 3:44 PM, Abel Vesa wrote:
>>> According to internal documentation, the corners specific for each rate
>>> from the DP link clock are:
>>>  - LOWSVS_D1 -> 19.2 MHz
>>>  - LOWSVS    -> 270 MHz
>>>  - SVS       -> 540 MHz (594 MHz in case of DP3)
>>
>> This discrepancy sounds a little odd.. can we get some confirmation
>> that it's intended and not an internal copypasta? (+Jagadeesh, Taniya)
>> FWIW DP3 is not USB4- or MST-capable so it may as well be
> 
> DP3 link_clock is sourced from the eDP PHY. I assume there might some 
> 
>>
>>>  - SVS_L1    -> 594 MHz
>>>  - NOM       -> 810 MHz
>>>  - NOM_L1    -> 810 MHz
>>>  - TURBO     -> 810 MHz
>>>
>>> So fix all tables for each of the four controllers according to the
>>> documentation.
>>
>> It sounds like a good move to instead keep only a single table for
>> DP012 and a separate one for DP3 if it's really different
>>
>>> The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
>>> for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
>>> in that case.
>>
>> Even though the Linux OPP framework agrees with that sentiment today (it
>> will set the correct rate via clk APIs and the correct rpmh vote for a rate
>> that's >= 162), I have mixed feelings about relying on that
> 
> Why? 19.2 isn't an actual working frequency, as far as I can understand
> anything. Or is it a working OPP for running "shared" clocks?

No, I meant removing the 162 case and relying on OPP to pick up the
required-opps value from the next entry

Konrad

